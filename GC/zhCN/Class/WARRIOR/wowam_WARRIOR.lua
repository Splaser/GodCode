--if GetLocale() ~= "zhCN" then return; end
local SpellErrList={};

local playerClass, englishClass = UnitClass("player");

if englishClass ~= "WARRIOR" then

	return;
end






local BuffName = {};				--BUFF名称
local RaidSpell={};					--施放目标类型（团/队/个人）的技能 团=3,队=2,个人=1
local SpellIds={};					-- 技能ID
local NoSpellTarget={}; 		--无目标标志


SpellIds["复仇"] = 6572;
--SpellIds["压制"] = 7384;
SpellIds["雷霆一击"] = 	6343;
SpellIds["命令怒吼"] = 	469;
SpellIds["战斗怒吼"] = 	6673;
--SpellIds["挑战怒吼"] = 	1161;
SpellIds["挫志怒吼"] = 	1160;
SpellIds["旋风斩"] = 	1680;
SpellIds["狂怒回复"] = 	55694;
SpellIds["狂暴之怒"] = 	18499;
SpellIds["破胆怒吼"] = 	5246;
SpellIds["鲁莽"] = 	1719;

SpellIds["法术反射"] = 	23920;
SpellIds["盾墙"] = 	871;
SpellIds["盾牌格挡(激活减伤效果)"] = 	2565;
SpellIds["破釜沉舟"] = 	12975;
SpellIds["震荡波"] = 	46968;
SpellIds["防御姿态"] = 	71;
--SpellIds["狂暴姿态"] = 	2458;
SpellIds["战斗姿态"] = 	2457;

SpellIds["横扫攻击"]  = 	12328;
--SpellIds["致命平静"] = 	85730;
--SpellIds["击倒"] = 	85388;
SpellIds["剑刃风暴(等级 1)"] = 	9632;
SpellIds["刺耳怒吼"]  = 	12323;
SpellIds["浴血奋战"]  = 	12292;
SpellIds["怒风斩(狂怒)"]  = 	58390;
SpellIds["暴怒"]  = 	6613;
--SpellIds["英勇之怒"] = 	60970;
SpellIds["乘胜追击"] =  34428;
SpellIds["强力制胜雕文"] =  58104;

SpellIds["巨人打击"] =  167105;
--SpellIds["怒火中烧"] =  1134;
SpellIds["英勇飞跃"] =  6544;

SpellIds["冲锋"] = 	100;

SpellIds["援护"] = 	3411;
--SpellIds["拦截"] = 	20252;
--SpellIds["战神"] =  57499;

SpellIds["猛击"] =  1464;
SpellIds["拳击"] = 	6552;
SpellIds["集结呐喊"] = 	97462;

---CTM-
SpellIds["射击"]=3018;
--SpellIds["投掷"]=2764;
--SpellIds["投掷"]=122475;
SpellIds["攻击"]=88163;
SpellIds["自动攻击"]=6603;
--SpellIds["反击风暴"]=20230;
--SpellIds["撕裂"]=772;
SpellIds["断筋"]=1715;
SpellIds["英勇打击"]=78;
--SpellIds["重击"]=88161;
SpellIds["英勇投掷"]=57755;
SpellIds["碎裂投掷"]=64382;
SpellIds["斩杀"]=163201;
--SpellIds["顺劈斩"]=845;
SpellIds["嘲讽"]=355;
--SpellIds["破甲攻击"]=7386;
--SpellIds["缴械"]=676

 
SpellIds["剑刃风暴"]=46924;  
SpellIds["致死打击"]=12294; 

SpellIds["毁灭打击"]=20243; 
SpellIds["盾牌猛击"]=23922;

--SpellIds["强化断筋"]=23694;

------
AM_GCD_SPELLID=SpellIds["毁灭打击"];

BuffName["强力制胜雕文"] = GetSpellInfo(SpellIds["强力制胜雕文"]);
--BuffName["强化断筋"] = GetSpellInfo(SpellIds["强化断筋"]);



NoSpellTarget[SpellIds["雷霆一击"]] = 	true;
NoSpellTarget[SpellIds["命令怒吼"]] = 	true;
NoSpellTarget[SpellIds["战斗怒吼"]] = 	true;
--NoSpellTarget[SpellIds["挑战怒吼"]] = 	true;
NoSpellTarget[SpellIds["挫志怒吼"]] = 	true;
NoSpellTarget[SpellIds["旋风斩"]] = 	true;
NoSpellTarget[SpellIds["狂怒回复"]] = 	true;
NoSpellTarget[SpellIds["狂暴之怒"]] = 	true;
NoSpellTarget[SpellIds["破胆怒吼"]] = 	true;
NoSpellTarget[SpellIds["鲁莽"]] = 	true;

NoSpellTarget[SpellIds["法术反射"]] = 	true;
NoSpellTarget[SpellIds["盾墙"]] = 	true;
NoSpellTarget[SpellIds["盾牌格挡(激活减伤效果)"]] = 	true;
NoSpellTarget[SpellIds["破釜沉舟"]] = 	true;
NoSpellTarget[SpellIds["震荡波"]] = 	true;
NoSpellTarget[SpellIds["防御姿态"]] = true;
--NoSpellTarget[SpellIds["狂暴姿态"]] = 	true;
NoSpellTarget[SpellIds["战斗姿态"]] = 	true;



--NoSpellTarget[SpellIds["致命平静"]] = 	true;
NoSpellTarget[SpellIds["剑刃风暴(等级 1)"]] = 	true;
NoSpellTarget[SpellIds["刺耳怒吼"]]  = 	true;
NoSpellTarget[SpellIds["浴血奋战"]]  = 	true;
NoSpellTarget[SpellIds["暴怒"]]  = 	true;
--NoSpellTarget[SpellIds["英勇之怒"]] = 	true;

--NoSpellTarget[SpellIds["怒火中烧"]] = 	true;
NoSpellTarget[SpellIds["英勇飞跃"]] = 	true;
NoSpellTarget[SpellIds["集结呐喊"]] = 	true;

-------CTM---

--NoSpellTarget[SpellIds["反击风暴"]] = 	true;


-----------


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



function amIsActivation(Id,unit) --处理被激活技能

	return true;
end




function amIsNoSpellTarget(SpellId) --技能是否是有无目标标志

	return NoSpellTarget[SpellId] and true
end






function amIsRaidSpell(spellId)
	
	return RaidSpell[spellId];
	
end





function amIsCurrentSpell(spellId)

	local spellNameX, spellSubNameX =GetSpellInfo(spellId);
	
	if not spellSubNameX then
		spellSubNameX="";
	end
	local i = 1;
	while true do
	
		spellName, spellSubName = GetSpellBookItemName(i, BOOKTYPE_SPELL)
		if not spellSubName then
			spellSubName="";
		end
		
		if not spellName then
		  do break end
		end
   
		if spellName == spellNameX and spellSubName == spellSubNameX then

			
			do break end
		
		end
   
		i = i + 1
	end
	
	return IsCurrentSpell(i,BOOKTYPE_SPELL) ;
			

end


function amIsMoveSpell(Id,unit,name) --处理移动中能施放的技能
	return true;	
end

--[[
local InternalCDFrame = CreateFrame("Frame");
local InternalCDFrame_u = 0 ;
local TalentName_12289 = GetSpellInfo(12289) --强化断筋

local function InternalCDFrame_OnEvent(self, event, ...)

	local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16;

	arg1,arg2 = select(1, ...);
	arg3,arg4,arg5,_,arg6,arg7,arg8,_,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = select(4, ...);
	
	if "COMBAT_LOG_EVENT_UNFILTERED" == event then
	
		if UnitGUID("player") == arg3 and arg2 == "SPELL_AURA_APPLIED" then
				
			if BuffName["强化断筋"] == arg10 then
			
				local n = amTalentInfo(TalentName_12289);
				
				if n >0 then
	--]]				
					--if not amInternalCDTbl[BuffName["强化断筋"]] then
					--	amInternalCDTbl[BuffName["强化断筋"]]={};
					--end
					
				--	if n == 1 then
						
						
				--		amInternalCDTbl[BuffName["强化断筋"]]["Cycle"]=60;
						
					
				--	elseif n == 2 then
						
				--		amInternalCDTbl[BuffName["强化断筋"]]["Cycle"]=30;
						
				--	end
					
				--	amInternalCDTbl[BuffName["强化断筋"]]["time"]=GetTime();
				
									
				
				--else
				
				--	amInternalCDTbl[BuffName["强化断筋"]]=nil;
			--	end
		
				
			--end
			
			
		--end
	
	
	--end
	

--end



--InternalCDFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
--InternalCDFrame:SetScript("OnEvent", InternalCDFrame_OnEvent);



