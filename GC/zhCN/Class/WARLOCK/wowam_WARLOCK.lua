--if GetLocale() ~= "zhCN" then return; end
local SpellErrList={};
local playerClass, englishClass = UnitClass("player");

if englishClass ~= "WARLOCK" then

	return;
end



local BuffName = {};				--BUFF名称
local RaidSpell={};					--施放目标类型（团/队/个人）的技能 团=3,队=2,个人=1
local SpellIds={};					-- 技能ID
local NoSpellTarget={}; 		--无目标标志

SpellIds["召唤仪式"] = 	698;
SpellIds["召唤小鬼(召唤)"] = 	688;
SpellIds["召唤虚空行者(召唤)"] = 	697;
SpellIds["召唤地狱猎犬(召唤)"] = 	691;
SpellIds["召唤魅魔(召唤)"] = 	712;
SpellIds["召唤末日守卫(守卫)"] = 	18540;
SpellIds["召唤地狱火(守卫)"] = 	1122;
SpellIds["基尔罗格之眼(召唤)"] = 	126;
SpellIds["恶魔法阵：传送"] = 	48020;
SpellIds["恶魔法阵：召唤"] = 	48018;
--SpellIds["魔甲术"] = 	687;
SpellIds["生命通道"] = 	755;
SpellIds["制造治疗石"] = 	6201;
--SpellIds["制造灵魂石"] = 	693;
--SpellIds["暮光结界"] = 	6229;
SpellIds["制造灵魂之井"] = 	29893;
--SpellIds["灵魂收割"] = 	79268;
SpellIds["灵魂燃烧"] = 	74434;
SpellIds["灵魂碎裂"] = 	29858;
--SpellIds["灵魂链接"] = 	19028;
--SpellIds["邪甲术"] = 	28176;
SpellIds["无尽呼吸"] = 	5697;
SpellIds["黑暗灵魂"] = 	77801;
SpellIds["地狱烈焰"] = 	1949;
SpellIds["暗影之怒"] = 	30283;
--SpellIds["恶魔吐息"] = 	47897;
SpellIds["浩劫"] = 	80240;
SpellIds["火焰之雨"] = 	5740;
SpellIds["恐惧嚎叫"] = 	5484;
SpellIds["生命分流"] = 	1454;
--SpellIds["恶魔增效"] = 	47193;
SpellIds["恶魔变形"] = 	103958;

-------CTM----
SpellIds["射击"]=5019;
SpellIds["自动攻击"]=6603;
SpellIds["暴风雪"]=10;
SpellIds["奴役恶魔"]=1098;
SpellIds["放逐术"]=710;
SpellIds["暗影箭"]=686;
SpellIds["灵魂之火"]=6353;
--SpellIds["灼热之痛"]=5676;
SpellIds["烧尽"]=29722;
SpellIds["献祭"]=348;
--SpellIds["邪焰"]=77799;
--SpellIds["元素诅咒"]=1490;
--SpellIds["吸取灵魂"]=1120;
SpellIds["吸取生命"]=689;
SpellIds["恐惧"]=5782;
SpellIds["末日降临(恶魔变形)"]=603;
SpellIds["死亡缠绕"]=6789;
SpellIds["痛楚"]=980;
SpellIds["腐蚀术"]=172;
--SpellIds["虚弱诅咒"]=702;
--SpellIds["语言诅咒"]=1714;
SpellIds["腐蚀之种"]=27243;
--SpellIds["黑暗意图"]=80398;

 
SpellIds["暗影灼烧"]=17877;  
--SpellIds["混乱之箭"]=50796;  
SpellIds["燃烧"]=17962;

SpellIds["基尔加丹的狡诈"]=137587;
SpellIds["吸取灵魂"] = 	103103;
------------
SpellIds["恶魔掌控"] = 	119898;

AM_GCD_SPELLID=SpellIds["腐蚀术"];
------------


NoSpellTarget[SpellIds["召唤仪式"]] =  true; --	698;
NoSpellTarget[SpellIds["召唤小鬼(召唤)"]] =  true; --	688;
NoSpellTarget[SpellIds["召唤虚空行者(召唤)"]] =  true; --	697;
NoSpellTarget[SpellIds["召唤地狱猎犬(召唤)"]] =  true; --	691;
NoSpellTarget[SpellIds["召唤魅魔(召唤)"]] =  true; --	712;
NoSpellTarget[SpellIds["召唤末日守卫(守卫)"]] =  true; --	18540;
NoSpellTarget[SpellIds["召唤地狱火(守卫)"]] =  true; --	1122;
NoSpellTarget[SpellIds["基尔罗格之眼(召唤)"]] =  true; --	126;
NoSpellTarget[SpellIds["恶魔法阵：传送"]] =  true; --	48020;
NoSpellTarget[SpellIds["恶魔法阵：召唤"]] =  true; --	48018;
--NoSpellTarget[SpellIds["魔甲术"]] =  true; --	687;
NoSpellTarget[SpellIds["生命通道"]] =  true; --	755;
NoSpellTarget[SpellIds["制造治疗石"]] =  true; --	6201;
--NoSpellTarget[SpellIds["制造灵魂石"]] =  true; --	693;
--NoSpellTarget[SpellIds["暮光结界"]] =  true; --	6229;
NoSpellTarget[SpellIds["制造灵魂之井"]] =  true; --	29893;
--NoSpellTarget[SpellIds["灵魂收割"]] =  true; --	79268;
NoSpellTarget[SpellIds["灵魂燃烧"]] =  true; --	74434;
NoSpellTarget[SpellIds["灵魂碎裂"]] =  true; --	29858;
--NoSpellTarget[SpellIds["灵魂链接"]] =  true; --	19028;
--NoSpellTarget[SpellIds["邪甲术"]] =  true; --	28176;
NoSpellTarget[SpellIds["无尽呼吸"]] =  true; --	5697;
NoSpellTarget[SpellIds["黑暗灵魂"]] =  true; --	77801;
NoSpellTarget[SpellIds["地狱烈焰"]] =  true; --	1949;
NoSpellTarget[SpellIds["暗影之怒"]] =  true; --	30283;
--NoSpellTarget[SpellIds["恶魔吐息"]] =  true; --	47897;
--NoSpellTarget[SpellIds["浩劫"]] =  true; --	80240;
NoSpellTarget[SpellIds["火焰之雨"]] =  true; --	5740;
NoSpellTarget[SpellIds["恐惧嚎叫"]] =  true; --	5484;
NoSpellTarget[SpellIds["生命分流"]] =  true; --	1454;
--NoSpellTarget[SpellIds["恶魔增效"]] =  true; --	47193;
NoSpellTarget[SpellIds["恶魔变形"]] =  true; --	36298;

NoSpellTarget[SpellIds["基尔加丹的狡诈"]] =  true;


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



function amIsNoSpellTarget(SpellId) --技能是否是有无目标标志

	return NoSpellTarget[SpellId] and true;
end



function amIsRaidSpell(spellId)
	
	return RaidSpell[spellId] and true;
	
end

function amIsMoveSpell(Id,unit,name) --处理移动中能施放的技能
	return true;	
end

function amSpellConversion(spell) -- 恶魔掌控
		local spellId = false;
		if spellId == 132411   --烧灼驱魔
		or spellId == 132413   ---暗影壁垒
		or spellId == 132409   ---法术封锁  
		or spellId == 137706    ---鞭打

		then
			
			return SpellIds["恶魔掌控"],amGetSpellName(SpellIds["恶魔掌控"]);
		end
		
		
end