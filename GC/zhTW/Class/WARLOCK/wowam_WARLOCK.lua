if GetLocale() ~= "zhTW" then return; end
local SpellErrList={};
local playerClass, englishClass = UnitClass("player");

if englishClass ~= "WARLOCK" then

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

SpellIds["召喚儀式"] = 	698;
SpellIds["召喚小鬼(召喚)"] = 	688;
SpellIds["召喚虛空行者(召喚)"] = 	697;
SpellIds["召喚地獄獵犬(召喚)"] = 	691;
SpellIds["召喚魅魔(召喚)"] = 	712;
SpellIds["召喚末日守衛(守衛)"] = 	18540;
SpellIds["召喚地獄火(守衛)"] = 	1122;
SpellIds["基爾羅格之眼(召喚)"] = 	126;
SpellIds["惡魔法陣：傳送"] = 	48020;
SpellIds["惡魔法陣：召喚"] = 	48018;
SpellIds["魔甲術"] = 	687;
SpellIds["生命通道"] = 	755;
SpellIds["制造治療石"] = 	6201;
SpellIds["制造靈魂石"] = 	693;
SpellIds["暗影防護結界"] = 	6229;
SpellIds["靈魂儀式"] = 	29893;
SpellIds["靈魂收割"] = 	79268;
SpellIds["靈魂燃燒"] = 	74434;
SpellIds["靈魂碎裂"] = 	29858;
SpellIds["靈魂鏈接"] = 	19028;
SpellIds["邪甲術"] = 	28176;
SpellIds["無盡呼吸"] = 	5697;
SpellIds["惡魔之魂"] = 	77801;
SpellIds["地獄烈焰"] = 	1949;
SpellIds["暗影之怒"] = 	30283;
SpellIds["暗影烈焰"] = 	47897;
SpellIds["浩劫災禍"] = 	80240;
SpellIds["火焰之雨"] = 	5740;
SpellIds["恐懼嚎叫"] = 	5484;
SpellIds["生命分流"] = 	1454;
SpellIds["惡魔增效"] = 	47193;
SpellIds["惡魔變形"] = 	36298;

-------CTM----
SpellIds["射擊"]=5019;
SpellIds["自動攻擊"]=6603;
SpellIds["暴風雪"]=10;
SpellIds["奴役惡魔"]=1098;
SpellIds["放逐術"]=710;
SpellIds["暗影箭"]=686;
SpellIds["靈魂之火"]=6353;
SpellIds["灼熱之痛"]=5676;
SpellIds["燒盡"]=29722;
SpellIds["獻祭"]=348;
SpellIds["邪焰"]=77799;
SpellIds["元素詛咒"]=1490;
SpellIds["吸取靈魂"]=1120;
SpellIds["吸取生命"]=689;
SpellIds["恐懼"]=5782;
SpellIds["末日災禍"]=603;
SpellIds["死亡纏繞"]=6789;
SpellIds["痛苦災禍"]=980;
SpellIds["腐蝕術"]=172;
SpellIds["虛弱詛咒"]=702;
SpellIds["語言詛咒"]=1714;
SpellIds["腐蝕之種"]=27243;
SpellIds["黑暗意圖"]=80398;

 
SpellIds["暗影灼燒"]=17877;  
SpellIds["混亂之箭"]=50796;  
SpellIds["燃燒"]=17962


------------


NoSpellTarget[SpellIds["召喚儀式"]] =  true; --	698;
NoSpellTarget[SpellIds["召喚小鬼(召喚)"]] =  true; --	688;
NoSpellTarget[SpellIds["召喚虛空行者(召喚)"]] =  true; --	697;
NoSpellTarget[SpellIds["召喚地獄獵犬(召喚)"]] =  true; --	691;
NoSpellTarget[SpellIds["召喚魅魔(召喚)"]] =  true; --	712;
NoSpellTarget[SpellIds["召喚末日守衛(守衛)"]] =  true; --	18540;
NoSpellTarget[SpellIds["召喚地獄火(守衛)"]] =  true; --	1122;
NoSpellTarget[SpellIds["基爾羅格之眼(召喚)"]] =  true; --	126;
NoSpellTarget[SpellIds["惡魔法陣：傳送"]] =  true; --	48020;
NoSpellTarget[SpellIds["惡魔法陣：召喚"]] =  true; --	48018;
NoSpellTarget[SpellIds["魔甲術"]] =  true; --	687;
NoSpellTarget[SpellIds["生命通道"]] =  true; --	755;
NoSpellTarget[SpellIds["制造治療石"]] =  true; --	6201;
NoSpellTarget[SpellIds["制造靈魂石"]] =  true; --	693;
NoSpellTarget[SpellIds["暗影防護結界"]] =  true; --	6229;
NoSpellTarget[SpellIds["靈魂儀式"]] =  true; --	29893;
NoSpellTarget[SpellIds["靈魂收割"]] =  true; --	79268;
NoSpellTarget[SpellIds["靈魂燃燒"]] =  true; --	74434;
NoSpellTarget[SpellIds["靈魂碎裂"]] =  true; --	29858;
NoSpellTarget[SpellIds["靈魂鏈接"]] =  true; --	19028;
NoSpellTarget[SpellIds["邪甲術"]] =  true; --	28176;
NoSpellTarget[SpellIds["無盡呼吸"]] =  true; --	5697;
NoSpellTarget[SpellIds["惡魔之魂"]] =  true; --	77801;
NoSpellTarget[SpellIds["地獄烈焰"]] =  true; --	1949;
NoSpellTarget[SpellIds["暗影之怒"]] =  true; --	30283;
NoSpellTarget[SpellIds["暗影烈焰"]] =  true; --	47897;
--NoSpellTarget[SpellIds["浩劫災禍"]] =  true; --	80240;
NoSpellTarget[SpellIds["火焰之雨"]] =  true; --	5740;
NoSpellTarget[SpellIds["恐懼嚎叫"]] =  true; --	5484;
NoSpellTarget[SpellIds["生命分流"]] =  true; --	1454;
NoSpellTarget[SpellIds["惡魔增效"]] =  true; --	47193;
NoSpellTarget[SpellIds["惡魔變形"]] =  true; --	36298;

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
