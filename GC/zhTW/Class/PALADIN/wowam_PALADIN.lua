if GetLocale() ~= "zhTW" then return; end
local SpellErrList={};
local playerClass, englishClass = UnitClass("player");

if englishClass ~= "PALADIN" then

	return;
end



local Shapeshift={}; --姿態名稱ID對照
local spellSubNameErrText={}; -- 錯誤技能信息
local ShapeshiftName = nil; --姿態本地名稱




local spellinf = wowam.spell.Info;	--技能信息

local BuffName = {};				--BUFF名稱
local RaidSpell={};					--施放目標類型（團/隊/個人）的技能 團=3,隊=2,個人=1
local SpellIds={};					-- 技能ID
local NoSpellTarget={}; 		--無目標標志



SpellIds["公正聖印"] = 20164;
SpellIds["正義聖印"] = 20154;
SpellIds["洞察聖印"] = 20165;
SpellIds["真理聖印"] = 31801;
SpellIds["熾熱防禦者"] = 31850;
SpellIds["抗性光環"] = 19891;
SpellIds["專注光環"] = 19746;
SpellIds["正義之怒"] = 25780;
SpellIds["王者祝福"] = 20217;
SpellIds["力量祝福"] = 19740;
SpellIds["神聖守衛"] = 70940;
SpellIds["神聖之盾"] = 20925;
SpellIds["聖佑術"] = 498;
SpellIds["聖盾術"] = 642;
SpellIds["虔誠光環"] = 465;
SpellIds["十字軍光環"] = 32223;
SpellIds["懲戒光環"] = 7294;
SpellIds["遠古列王守衛"] =86150 ;
SpellIds["奉獻"] = 26573;
SpellIds["神聖懇求"] = 54428;
SpellIds["神聖憤怒"] = 2812;
SpellIds["複仇之怒"] = 31884;
SpellIds["神恩術"] = 31842;
SpellIds["異端裁決"] = 84963;
SpellIds["光環掌握"] = 31821;
SpellIds["黎明聖光"] = 85222;
SpellIds["保護之手"] = 1022;
SpellIds["聖光普照"] = 82327;
SpellIds["神聖之光"] = 82326;
SpellIds["憤怒之錘"] = 24275;
SpellIds["神聖風暴"] = 53385;
SpellIds["聖潔怒火(等級 1)"] = 53375;

SpellIds["戰爭藝術"] = 59578;
SpellIds["譴責"] = 85509;
SpellIds["驅邪術"] = 879;


-----CTM---------

SpellIds["自動攻擊"]=6603;
SpellIds["十字軍打擊"]=35395;
SpellIds["審判"]=20271;
SpellIds["責難"]=96231;
SpellIds["聖光術"]=635;
SpellIds["榮耀聖令"]=85673;
SpellIds["救贖"]=7328;
SpellIds["聖光閃現"]=19750;
SpellIds["聖療術"]=633;
SpellIds["清潔術"]=4987;
SpellIds["超度邪惡"]=10326;
SpellIds["制裁之錘"]=853;
SpellIds["清算之手"]=62124;
SpellIds["正義防禦"]=31789;
SpellIds["自由之手"]=1044;
SpellIds["拯救之手"]=1038;
SpellIds["犧牲之手"]=6940


SpellIds["複仇者之盾"]=31935;  
SpellIds["正義之錘"]=53595;  
SpellIds["正義盾擊"]=53600;  

SpellIds["聖光道標"]=53563;  
SpellIds["神聖震擊"]=20473;  

SpellIds["聖殿騎士的裁決"]=85256;  
SpellIds["忏悔"]=20066;  
SpellIds["狂熱"]=85696;


----------------

BuffName["戰爭藝術"]=GetSpellInfo(SpellIds["戰爭藝術"]);
BuffName["譴責"]=GetSpellInfo(SpellIds["譴責"]);




RaidSpell[SpellIds["保護之手"]]=3;




NoSpellTarget[SpellIds["公正聖印"]] = true;
NoSpellTarget[SpellIds["正義聖印"]] = true;
NoSpellTarget[SpellIds["洞察聖印"]] = true;
NoSpellTarget[SpellIds["真理聖印"]] = true;
NoSpellTarget[SpellIds["熾熱防禦者"]] = true;
NoSpellTarget[SpellIds["抗性光環"]] = true;
NoSpellTarget[SpellIds["專注光環"]] = true;
NoSpellTarget[SpellIds["正義之怒"]] = true;
NoSpellTarget[SpellIds["王者祝福"]] = true;
NoSpellTarget[SpellIds["力量祝福"]] = true;
NoSpellTarget[SpellIds["神聖守衛"]] = true;
NoSpellTarget[SpellIds["神聖之盾"]] = true;
NoSpellTarget[SpellIds["聖佑術"]] = true;
NoSpellTarget[SpellIds["聖盾術"]] = true;
NoSpellTarget[SpellIds["虔誠光環"]] = true;
NoSpellTarget[SpellIds["十字軍光環"]] = true;
NoSpellTarget[SpellIds["懲戒光環"]] = true;
NoSpellTarget[SpellIds["遠古列王守衛"]] = true ;
NoSpellTarget[SpellIds["奉獻"]] = true;
NoSpellTarget[SpellIds["神聖懇求"]] = true;
NoSpellTarget[SpellIds["神聖憤怒"]] = true;
NoSpellTarget[SpellIds["複仇之怒"]] = true;
NoSpellTarget[SpellIds["神恩術"]] = true;
NoSpellTarget[SpellIds["異端裁決"]] = true;
NoSpellTarget[SpellIds["光環掌握"]] = true;
NoSpellTarget[SpellIds["黎明聖光"]] = true;
NoSpellTarget[SpellIds["聖光普照"]] = true;
NoSpellTarget[SpellIds["神聖風暴"]] = true;


amAllClassInf(SpellIds,NoSpellTarget,BuffNames);


local function TsetSpellIdAddLineList(menu,A,B,C,D,E,str,err)
-- 表格內容行
	if not amAllClassIgnoreInf(A,E) then return false; end;
	
	if menu then
		menu:AddLine(
						
			"text1", "|cff00ffff" .. A, 
			"text2", "|cff00ffff" .. B,
			"text3", "|cffff0000" .. C,
			"text4", "|cffffff00" .. D,
			"text5", E,
			"tooltipText",str
		)
		
		wowam.spell.ErrorText= wowam.spell.ErrorText .. ";  " .. err;
		
	else
	
		local errtext ="|cff00ffff" .. A .. "  " .. "|cff00ffff" .. B .. "  " .. "|cffff0000" .. C .. "  " .. "|cffffff00" .. D .. "  |r" .. E;
		
		table.insert(SpellErrList, errtext);
		
	end
end


local function TsetSpellId(TBL,menu)
	
	local str;
	local err = "";
	
	for i,v in pairs(TBL) do
		
		local name = amGetSpellName(v);
		
		if not name then
			--print(wowam.Colors.MAGENTA  .. "技能ID錯誤1:" .. i )
			str = "ID無效"
			err =i .. "," .. v .. "," .. v .. "," .. "".."," .. str
			TsetSpellIdAddLineList(menu,i,v,v,"","ID無效",str,err);
		else
			if name ~= i then
				
				--print(wowam.Colors.MAGENTA  .. "名稱錯誤:" )
				--print(wowam.Colors.CYAN  .. "錯誤:|r" .. i  )
				--print(wowam.Colors.CYAN  .. "正確:|r" .. name  )
				str = "ID對照不了原來的名稱"
				err =i .. "," .. v .. "," .. i .. "," .. name.."," .. str
				TsetSpellIdAddLineList(menu,i,v,i,name,"名稱錯誤",str,err);
				
			else
				
				local ID =amPlayerSpellId(i);
			
				if ID and ID ~= v then
					
					--local spellLink=GetSpellLink(v);
					--print(wowam.Colors.MAGENTA  .. "ID錯誤:" .. i )
					--print(wowam.Colors.CYAN  .. "錯誤|r:" .. v  )
					--print(wowam.Colors.CYAN  .. "正確|r:" .. ID  )
					str = "通過原來的名稱獲得ID，但和原來設定不壹樣。"
					err =i .. "," .. v .. "," .. v .. "," .. ID.."," .. str
					TsetSpellIdAddLineList(menu,i,v,v,ID,"ID錯誤",str,err);
									
				end
				
			end
		end
		
	end

end


function amTsetSpellId(menu)
	wowam.spell.ErrorText="";
	SpellErrList={};
	TsetSpellId(SpellIds,menu);
	
	if not menu then
		
		if #SpellErrList>0 then
			print("|cffff0000技能對照錯誤:|cffffff00請和管理員聯繫解決\n");
		
			for i,v in pairs(SpellErrList) do
				print(i..".",v);
			end
			
			print("\n|cffffff00共(" .. #SpellErrList .. ")錯誤，請在【技能錯誤信息】菜單哪裏提取信息發給我。");
		
		end
	
	end
	
	local tbl = amTestSpellBook(SpellIds);
	
	
	
	if #tbl>0 then
		print("|cffff0000技能信息缺乏:|cffffff00請和管理員聯繫解決\n");
	
		for i,v in pairs(tbl) do
			
			local SpellLink = GetSpellLink(v);
			
			local spellName =amGetSpellName(v);
			
			print(i..".",SpellLink);
			
			if menu then
				TsetSpellIdAddLineList(menu,spellName,v,"","","缺乏技能說明","",'SpellIds["' ..spellName .. '"]=' .. v )
			end
			
			
			
		end
		
		print("\n|cffffff00共(" .. #tbl .. ")錯誤，請在【技能錯誤信息】菜單哪裏提取信息發給我。");
	
	end

	
end




function amIsMoveSpell(Id,unit,name) --處理移動中能施放的技能


	if Id == SpellIds["驅邪術"]  and (UnitAura("player", BuffName["戰爭藝術"]) or UnitAura("player", BuffName["譴責"])) then 
		
		return true;

	end
	
end


function amIsActivation(Id,unit,name) --處理被激活技能

	--if Id == SpellIds["憤怒之錘"] then 
		
	--	return amIsActivation_24275(Id,unit,name);
	
	
	
	--else
		return true;
	--end

end

function amIsActivation_24275(Id,unit,name)


	if aml(unit,"%")<=20 or (ampb(GetSpellInfo(SpellIds["複仇之怒"]))>0 and amTalentInfo(GetSpellInfo(SpellIds["聖潔怒火(等級 1)"]))) then
		return true;
	else
		return false;
	end
end

function amIsNoSpellTarget(SpellId) --技能是否是有無目標標志

	return NoSpellTarget[SpellId] and true;
end



function amIsRaidSpell(spellId)
	
	return RaidSpell[spellId] and true;
	
end
