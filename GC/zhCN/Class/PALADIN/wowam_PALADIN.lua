--if GetLocale() ~= "zhCN" then return; end
local SpellErrList={};
local playerClass, englishClass = UnitClass("player");

if englishClass ~= "PALADIN" then

	return;
end





local spellinf = wowam.spell.Info;	--技能信息

local BuffName = {};				--BUFF名称
local RaidSpell={};					--施放目标类型（团/队/个人）的技能 团=3,队=2,个人=1
local SpellIds={};					-- 技能ID
local NoSpellTarget={}; 		--无目标标志



SpellIds["公正圣印"] = 20164;
SpellIds["正义圣印"] = 20154;
SpellIds["洞察圣印"] = 20165;
SpellIds["真理圣印"] = 31801;
SpellIds["炽热防御者"] = 31850;
--SpellIds["抗性光环"] = 19891;
--SpellIds["专注光环"] = 19746;
SpellIds["正义之怒"] = 25780;
SpellIds["王者祝福"] = 20217;
SpellIds["力量祝福"] = 19740;
--SpellIds["神圣守卫"] = 70940;
--SpellIds["圣洁护盾"] = 20925;
SpellIds["圣佑术"] = 498;
SpellIds["圣盾术"] = 642;
--SpellIds["虔诚光环"] = 465;
--SpellIds["十字军光环"] = 32223;
--SpellIds["惩戒光环"] = 7294;
--SpellIds["远古列王守卫"] =86150 ;
SpellIds["奉献"] = 26573;
--SpellIds["神圣恳求"] = 54428;
SpellIds["谴责"] = 2812;
SpellIds["复仇之怒"] = 31884;
--SpellIds["神恩术"] = 31842;
--SpellIds["异端裁决"] = 84963;
SpellIds["虔诚光环"] = 31821;
SpellIds["黎明圣光"] = 85222;
SpellIds["保护之手"] = 1022;
SpellIds["圣光普照"] = 82327;
SpellIds["圣光术"] = 82326;
SpellIds["愤怒之锤"] = 24275;
SpellIds["神圣风暴"] = 53385;
--SpellIds["圣洁怒火(等级 1)"] = 53375;

--SpellIds["战争艺术"] = 87138;
--SpellIds["谴责"] = 85509;
SpellIds["驱邪术"] = 879;


-----CTM---------

SpellIds["自动攻击"]=6603;
SpellIds["十字军打击"]=35395;
SpellIds["审判"]=20271;
SpellIds["责难"]=96231;
--SpellIds["圣光术"]=635;
SpellIds["荣耀圣令"]=85673;
SpellIds["救赎"]=7328;
SpellIds["圣光闪现"]=19750;
SpellIds["圣疗术"]=633;
SpellIds["清洁术"]=4987;
SpellIds["超度邪恶"]=10326;
SpellIds["制裁之锤"]=853;
SpellIds["清算"]=62124;
SpellIds["正义防御"]=31789;
SpellIds["自由之手"]=1044;
SpellIds["拯救之手"]=1038;
SpellIds["牺牲之手"]=6940


SpellIds["复仇者之盾"]=31935;  
SpellIds["正义之锤"]=53595;  
SpellIds["正义盾击(激活减伤效果)"]=53600;  

SpellIds["圣光道标"]=53563;  
SpellIds["神圣震击"]=20473;  

SpellIds["圣殿骑士的裁决"]=85256;  
SpellIds["忏悔"]=20066;  
--SpellIds["狂热"]=85696;

AM_GCD_SPELLID=SpellIds["正义圣印"];
----------------

--BuffName["战争艺术"]=GetSpellInfo(SpellIds["战争艺术"]);
--BuffName["谴责"]=GetSpellInfo(SpellIds["谴责"]) or "";




RaidSpell[SpellIds["保护之手"]]=3;




NoSpellTarget[SpellIds["公正圣印"]] = true;
NoSpellTarget[SpellIds["正义圣印"]] = true;
NoSpellTarget[SpellIds["洞察圣印"]] = true;
NoSpellTarget[SpellIds["真理圣印"]] = true;
NoSpellTarget[SpellIds["炽热防御者"]] = true;
--NoSpellTarget[SpellIds["抗性光环"]] = true;
--NoSpellTarget[SpellIds["专注光环"]] = true;
NoSpellTarget[SpellIds["正义之怒"]] = true;
NoSpellTarget[SpellIds["王者祝福"]] = true;
NoSpellTarget[SpellIds["力量祝福"]] = true;
--NoSpellTarget[SpellIds["神圣守卫"]] = true;
--NoSpellTarget[SpellIds["圣洁护盾"]] = true;
NoSpellTarget[SpellIds["圣佑术"]] = true;
NoSpellTarget[SpellIds["圣盾术"]] = true;
--NoSpellTarget[SpellIds["虔诚光环"]] = true;
--NoSpellTarget[SpellIds["十字军光环"]] = true;
--NoSpellTarget[SpellIds["惩戒光环"]] = true;
--NoSpellTarget[SpellIds["远古列王守卫"]] = true ;
NoSpellTarget[SpellIds["奉献"]] = true;
--NoSpellTarget[SpellIds["神圣恳求"]] = true;
--NoSpellTarget[SpellIds["谴责"]] = true;
NoSpellTarget[SpellIds["复仇之怒"]] = true;
--NoSpellTarget[SpellIds["神恩术"]] = true;
--NoSpellTarget[SpellIds["异端裁决"]] = true;
NoSpellTarget[SpellIds["虔诚光环"]] = true;
NoSpellTarget[SpellIds["黎明圣光"]] = true;
NoSpellTarget[SpellIds["圣光普照"]] = true;
NoSpellTarget[SpellIds["神圣风暴"]] = true;


amAllClassInf(SpellIds,NoSpellTarget,BuffNames);


local function TsetSpellIdAddLineList(menu,A,B,C,D,E,str,err)
-- 表格内容行
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
			if tostring(B) ~= tostring(D) then
				table.insert(SpellErrList, errtext);
			end
		table.insert(SpellErrList, errtext);
		
	end
end


local function TsetSpellId(TBL,menu)
	
	local str;
	local err = "";
	
	for i,v in pairs(TBL) do
		
		local name = amGetSpellName(v);
		
		if not name then
			--print(wowam.Colors.MAGENTA  .. "技能ID错误1:" .. i )
			str = "ID无效"
			err =i .. "," .. v .. "," .. v .. "," .. "".."," .. str
			TsetSpellIdAddLineList(menu,i,v,v,"","ID无效",str,err);
		else
			if name ~= i then
				
				--print(wowam.Colors.MAGENTA  .. "名称错误:" )
				--print(wowam.Colors.CYAN  .. "错误:|r" .. i  )
				--print(wowam.Colors.CYAN  .. "正确:|r" .. name  )
				str = "ID对照不了原来的名称"
				err =i .. "," .. v .. "," .. i .. "," .. name.."," .. str
				TsetSpellIdAddLineList(menu,i,v,i,name,"名称错误",str,err);
				
			else
				
				local ID =amPlayerSpellId(i);
			
				if ID and ID ~= v then
					
					--local spellLink=GetSpellLink(v);
					--print(wowam.Colors.MAGENTA  .. "ID错误:" .. i )
					--print(wowam.Colors.CYAN  .. "错误|r:" .. v  )
					--print(wowam.Colors.CYAN  .. "正确|r:" .. ID  )
					str = "通过原来的名称获得ID，但和原来设定不一样。"
					err =i .. "," .. v .. "," .. v .. "," .. ID.."," .. str
					TsetSpellIdAddLineList(menu,i,v,v,ID,"ID错误",str,err);
									
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
			print("|cffff0000技能对照错误:|cffffff00请和管理员联繫解决\n");
		
			for i,v in pairs(SpellErrList) do
				print(i..".",v);
			end
			
			print("\n|cffffff00共(" .. #SpellErrList .. ")错误，请在【技能错误信息】菜单哪里提取信息发给我。");
		
		end
	
	end
	
	local tbl = amTestSpellBook(SpellIds);
	
	
	
	if #tbl>0 then
		print("|cffff0000技能信息缺乏:|cffffff00请和管理员联繫解决\n");
	
		for i,v in pairs(tbl) do
			
			local SpellLink = GetSpellLink(v);
			
			local spellName =amGetSpellName(v);
			
			print(i..".",SpellLink);
			
			if menu then
				TsetSpellIdAddLineList(menu,spellName,v,"","","缺乏技能说明","",'SpellIds["' ..spellName .. '"]=' .. v )
			end
			
			
			
		end
		
		print("\n|cffffff00共(" .. #tbl .. ")错误，请在【技能错误信息】菜单哪里提取信息发给我。");
	
	end

	
end




function amIsMoveSpell(Id,unit,name) --处理移动中能施放的技能
	return true;	
end



function amIsActivation(Id,unit,name) --处理被激活技能

	
	return true;
	

end

--[[
function amIsActivation_24275(Id,unit,name)


	if aml(unit,"%")<=20 or (ampb(GetSpellInfo(SpellIds["复仇之怒"]))>0 and amTalentInfo(GetSpellInfo(SpellIds["圣洁怒火(等级 1)"]))) then
		return true;
	else
		return false;
	end
end
--]]

function amIsNoSpellTarget(SpellId) --技能是否是有无目标标志

	return NoSpellTarget[SpellId] and true;
end



function amIsRaidSpell(spellId)
	
	return RaidSpell[spellId] and true;
	
end
