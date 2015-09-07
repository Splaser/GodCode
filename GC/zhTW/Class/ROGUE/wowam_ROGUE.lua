if GetLocale() ~= "zhTW" then return; end
local SpellErrList={};
local playerClass, englishClass = UnitClass("player");

if englishClass ~= "ROGUE" then

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


SpellIds["射擊"]=3018;
SpellIds["投擲"]=2764;
SpellIds["自動攻擊"]=6603;
SpellIds["刺骨"]=2098;
SpellIds["伏擊"]=8676;
SpellIds["切割"]=5171;
SpellIds["偷襲"]=1833;
SpellIds["腎擊"]=408;
SpellIds["破甲"]=8647;
SpellIds["拆卸"]=51722;
SpellIds["鎖喉"]=703;
SpellIds["割裂"]=1943;
SpellIds["毒傷"]=32645;
SpellIds["致命投擲"]=26679;
SpellIds["影襲"]=1752;
SpellIds["閃避"]=5277;
SpellIds["恢複"]=73651;
SpellIds["腳踢"]=1766;
SpellIds["鑿擊"]=1776;
SpellIds["疾跑"]=2983;
SpellIds["背刺"]=53;
SpellIds["佯攻"]=1966;
SpellIds["毒刃"]=5938;
SpellIds["刀扇"]=51723;
SpellIds["備戰就緒"]=74001;
SpellIds["潛行"]=1784;
SpellIds["搜索"]=921;
SpellIds["悶棍"]=6770;
SpellIds["開鎖"]=1804;
SpellIds["消失"]=1856;
SpellIds["擾亂"]=1725;
SpellIds["致盲"]=2094;
SpellIds["解除陷阱"]=1842;
SpellIds["暗影鬥篷"]=31224;
SpellIds["嫁禍訣竅"]=57934;
SpellIds["轉嫁"]=73981;
SpellIds["煙霧彈"]=76577



NoSpellTarget[SpellIds["疾跑"]] =  true; 
NoSpellTarget[SpellIds["閃避"]] =  true; 
NoSpellTarget[SpellIds["恢複"]] =  true; 
NoSpellTarget[SpellIds["刀扇"]] =  true;  --TT
NoSpellTarget[SpellIds["備戰就緒"]] =  true; 
NoSpellTarget[SpellIds["潛行"]] =  true; 
NoSpellTarget[SpellIds["搜索"]] =  true; 
NoSpellTarget[SpellIds["消失"]] =  true; 

NoSpellTarget[SpellIds["暗影鬥篷"]] =  true; 
NoSpellTarget[SpellIds["煙霧彈"]] =  true; 
NoSpellTarget[SpellIds["切割"]] =  true;

 

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



--function amIsActivation(Id,unit,name) --處理被激活技能

	--if Id == SpellIds["憤怒之錘"] then 
		
		
	

	--end

--end



function amIsNoSpellTarget(SpellId) --技能是否是有無目標標志

	return NoSpellTarget[SpellId] and true;
end



function amIsRaidSpell(spellId)
	
	return RaidSpell[spellId] and true;
	
end
