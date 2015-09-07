--if GetLocale() ~= "zhCN" then return; end
local SpellErrList={};
local playerClass, englishClass = UnitClass("player");

if englishClass ~= "HUNTER" then

	return;
end



local BuffName = {};				--BUFF名称
local RaidSpell={};					--施放目标类型（团/队/个人）的技能 团=3,队=2,个人=1
local SpellIds={};					-- 技能ID
local NoSpellTarget={}; 		--无目标标志

--SpellIds["准备就绪"] = 	 23989;

SpellIds["集中火力"] = 	 82692;
SpellIds["热情"] = 	 82726;
SpellIds["狂野怒火"] = 	 19574;

SpellIds["陷阱发射器"] = 	 77769;
SpellIds["伪装"] = 	 51753;
--SpellIds["灵狐守护"] = 	 82661;


SpellIds["照明弹"] = 	1543;
SpellIds["假死"] = 	5384;
SpellIds["冰冻陷阱(冰霜陷阱)"] = 	1499;
SpellIds["威慑"] = 	19263;
SpellIds["冰霜陷阱(冰霜陷阱)"] = 	13809;
SpellIds["毒蛇陷阱(自然陷阱)"] = 	34600;
SpellIds["爆炸陷阱(火焰陷阱)"] = 	13813;
--SpellIds["献祭陷阱(火焰)"] = 	13795;
SpellIds["逃脱"] = 	781;
SpellIds["主人的召唤"] = 	53271;
SpellIds["复活宠物"] = 	982;
SpellIds["杀戮命令"] = 	34026;
SpellIds["治疗宠物"] = 	136;
SpellIds["猎豹守护"] = 	5118;
SpellIds["解散宠物"] = 	2641;
SpellIds["豹群守护"] = 	13159;
--SpellIds["野性守护"] = 	20043;
SpellIds["野兽知识"] = 	1462;
--SpellIds["雄鹰守护"] = 	13165;
SpellIds["喂养宠物"] = 	6991;
SpellIds["鹰眼术"] = 	6197;  

SpellIds["眼镜蛇射击"] = 	77767;  
SpellIds["稳固射击"] = 	56641;  

----CTM---------------

SpellIds["自动攻击"]=6603;
SpellIds["奥术射击"]=3044;
SpellIds["自动射击"]=75;
SpellIds["震荡射击"]=5116;
SpellIds["猎人印记"]=1130;
SpellIds["多重射击"]=2643;
SpellIds["宁神射击"]=19801;
SpellIds["夺命射击"]=53351;
SpellIds["扰乱射击"]=20736;
SpellIds["急速射击"]=3045;
--SpellIds["猛禽一击"]=2973;
SpellIds["毒蛇钉刺"]=87935;
--SpellIds["摔绊"]=2974;
--SpellIds["驱散射击"]=19503;
SpellIds["误导"]=34477;
SpellIds["驯服野兽"]=1515;
SpellIds["召唤宠物 2"]=83242;
--SpellIds["恐吓野兽"]=1513;
--SpellIds["蜘蛛毒刺"]=82654;
SpellIds["召唤宠物 3"]=83243;
SpellIds["召唤宠物 4"]=83244;
SpellIds["召唤宠物 5"]=83245;
SpellIds["召唤宠物 1"]=883
SpellIds["奇美拉射击"]=53209;  
--SpellIds["沉默射击"]=34490;  
SpellIds["瞄准射击"]=19434;

-----5.0--
SpellIds["弹幕射击"]=120360;



AM_GCD_SPELLID=SpellIds["猎豹守护"];

BuffName["灵狐守护"]=GetSpellInfo(SpellIds["灵狐守护"]);

BuffName["开火！"]=GetSpellInfo(82926);



--NoSpellTarget[SpellIds["准备就绪"]] =  true; --	 23989;

NoSpellTarget[SpellIds["集中火力"]] =  true; --	 32300;
NoSpellTarget[SpellIds["热情"]] =  true; --	 805;
NoSpellTarget[SpellIds["狂野怒火"]] =  true; --	 19574;

NoSpellTarget[SpellIds["陷阱发射器"]] =  true; --	 56871;
NoSpellTarget[SpellIds["伪装"]] =  true; --	 51753;
--NoSpellTarget[SpellIds["灵狐守护"]] =  true; --	 82661;


NoSpellTarget[SpellIds["照明弹"]] =  true; --	1543;
NoSpellTarget[SpellIds["假死"]] =  true; --	5384;
NoSpellTarget[SpellIds["冰冻陷阱(冰霜陷阱)"]] =  true; --	1499;
NoSpellTarget[SpellIds["威慑"]] =  true; --	19263;
NoSpellTarget[SpellIds["冰霜陷阱(冰霜陷阱)"]] =  true; --	13809;
NoSpellTarget[SpellIds["毒蛇陷阱(自然陷阱)"]] =  true; --	34600;
NoSpellTarget[SpellIds["爆炸陷阱(火焰陷阱)"]] =  true; --	13813;
--NoSpellTarget[SpellIds["献祭陷阱(火焰)"]] =  true; --	13795;
NoSpellTarget[SpellIds["逃脱"]] =  true; --	781;
NoSpellTarget[SpellIds["主人的召唤"]] =  true; --	53271;
NoSpellTarget[SpellIds["复活宠物"]] =  true; --	982;
NoSpellTarget[SpellIds["杀戮命令"]] =  true; --	34026;
NoSpellTarget[SpellIds["治疗宠物"]] =  true; --	136;
NoSpellTarget[SpellIds["猎豹守护"]] =  true; --	5118;
NoSpellTarget[SpellIds["解散宠物"]] =  true; --	2641;
NoSpellTarget[SpellIds["豹群守护"]] =  true; --	13159;
--NoSpellTarget[SpellIds["野性守护"]] =  true; --	20043;
NoSpellTarget[SpellIds["野兽知识"]] =  true; --	1462;
--NoSpellTarget[SpellIds["雄鹰守护"]] =  true; --	13165;
NoSpellTarget[SpellIds["喂养宠物"]] =  true; --	6991;
NoSpellTarget[SpellIds["鹰眼术"]] =  true; --	6197;  


-------CTM-----------

NoSpellTarget[SpellIds["召唤宠物 1"]] =  true; --	6197; 
NoSpellTarget[SpellIds["召唤宠物 2"]] =  true; --	6197; 
NoSpellTarget[SpellIds["召唤宠物 3"]] =  true; --	6197; 
NoSpellTarget[SpellIds["召唤宠物 4"]] =  true; --	6197; 
NoSpellTarget[SpellIds["召唤宠物 5"]] =  true; --	6197; 
 


------------------
 
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
					str = "通过原来的名称获得ID，但和原来设定不一洋。"
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
			print("|cffff0000技能对照错误:|cffffff00请和管理员联繫解抉\n");
		
			for i,v in pairs(SpellErrList) do
				print(i..".",v);
			end
			
			print("\n|cffffff00共(" .. #SpellErrList .. ")错误，请在【技能错误信息】菜单哪里提取信息发给我。");
		
		end
	
	end
	
	local tbl = amTestSpellBook(SpellIds);
	
	
	
	if #tbl>0 then
		print("|cffff0000技能信息缺乏:|cffffff00请和管理员联繫解抉\n");
	
		for i,v in pairs(tbl) do
			
			local SpellLink = GetSpellLink(v);
			
			if SpellLink then
				local spellName =amGetSpellName(v);
				
				print(i..".",SpellLink,v);
				
				if menu then
					TsetSpellIdAddLineList(menu,spellName,v,"","","缺乏技能说明","",'SpellIds["' ..spellName .. '"]=' .. v )
				end
			end
			
			
			
		end
		
		print("\n|cffffff00共(" .. #tbl .. ")错误，请在【技能错误信息】菜单哪里提取信息发给我。");
	
	end

	
end






function amIsMoveSpell(Id,unit,name) --处理移动中能施放的技能
	return true;	
end


function amIsActivation(Id,unit,name) --处理被激活技能

	--if Id == SpellIds["愤怒之锤"] then 
		
		
	

	--end
	return true;
end



function amIsNoSpellTarget(SpellId) --技能是否是有无目标标志

	return NoSpellTarget[SpellId] and true;
end



function amIsRaidSpell(spellId)
	
	return RaidSpell[spellId] and true;
	
end


--技能能量判断
function amSpellIsPowerNumber(spellId)

	if SpellIds["瞄准射击"] == spellId then
		
		if UnitAura("player", BuffName["开火！"]) then 
				
			return 0;
			
		end
		
	
	end
	
end
