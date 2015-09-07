--if GetLocale() ~= "zhCN" then return; end

local SpellErrList={};
local playerClass, englishClass = UnitClass("player");

if englishClass ~= "DEATHKNIGHT" then

	return;
end



local Shapeshift={}; --姿态名称ID对照
local spellSubNameErrText={}; -- 错误技能信息
local ShapeshiftName = nil; --姿态本地名称





local BuffName = {};				--BUFF名称
local RaidSpell={};					--施放目标类型（团/队/个人）的技能 团=3,队=2,个人=1
local SpellIds={};					-- 技能ID
local NoSpellTarget={}; 		--无目标标志


--冰天赋

SpellIds["冰封之韧"] =     48792;
SpellIds["冰霜之路"] =     3714;
SpellIds["冰霜之柱"] =     51271;
SpellIds["冰霜灵气"] =     48266;
SpellIds["寒冬号角"] =     57330;
--SpellIds["饥饿之寒"] =     49203;
SpellIds["巫妖之躯"] =     49039;
SpellIds["符文武器增效"] =     47568;

--血天赋
SpellIds["天灾契约"] =     48743;
SpellIds["血液沸腾"] =     50842;
SpellIds["符文刃舞"] =     49028;
SpellIds["符文分流(激活减伤效果)"] =     48982;
SpellIds["凛风冲击"] =     55233;
SpellIds["鲜血灵气"] =     48263;
SpellIds["白骨之盾"] =     49222;
SpellIds["活力分流"] =     45529;
SpellIds["吸血鬼之血"]=55233;

--邪天赋
SpellIds["亡者大军"] =     42650;
SpellIds["反魔法领域"] =     51052;
SpellIds["反魔法护罩"] =     48707;
SpellIds["召唤石像鬼"] =     49206;
SpellIds["黑锋之门"] =     50977;
SpellIds["枯萎凋零"] =     43265;
SpellIds["亡者复生"] =     46584;
SpellIds["复活盟友"] =     61999;
SpellIds["邪恶灵气"] =     48265;
SpellIds["黑暗突变"] =     63560;

SpellIds["符文熔铸"]=53428;  
SpellIds["自动攻击"]=6603;  
SpellIds["爆发"]=77575;  
SpellIds["黑暗模拟"]=77606;  



AM_GCD_SPELLID=SpellIds["冰霜灵气"];


--需激活技能
SpellIds["符文打击"] =     165394;
--当自身闪躲招架后技能条图标变亮 需目标

SpellIds["暗影灌注"] =     49572;
BuffName["暗影灌注"]= GetSpellInfo(SpellIds["暗影灌注"]);
BuffName["鲜血灵气"]= GetSpellInfo(SpellIds["鲜血灵气"]);
--需玩家宠物身上buff 层数 "暗影灌注" =5 后技能条图标变亮 无需目标


--需要目标的技能
SpellIds["灵界打击(激活减伤效果)"] =         49998; 
--SpellIds["传染"] =         50842;
--SpellIds["心脏打击"] =         55050;  
SpellIds["符文刃舞"] =         49028;
SpellIds["绞袭"] =         47476;
--SpellIds["鲜血打击"] =         45902;
SpellIds["黑暗命令"] =         56222;
SpellIds["冰冷触摸"] =         45477;         
SpellIds["寒冰锁链"] =         45524;
SpellIds["心灵冰冻"] =         47528;
SpellIds["湮没"] =         49020;
SpellIds["符文打击"] =         165394;
SpellIds["脓疮打击"] =         85948;
SpellIds["死亡之握"] =         49576;
SpellIds["凋零缠绕"] =         47541;
SpellIds["暗影打击"] =         45462;
SpellIds["天灾打击"] = 55090;
--SpellIds["死疽打击"] = 73975;
SpellIds["冰霜打击"] =         49143;
SpellIds["凛风冲击"] =         49184;
SpellIds["灵魂收割"]=         130736;


NoSpellTarget[SpellIds["黑暗突变"]] =     true;

NoSpellTarget[SpellIds["冰封之韧"]] =     true;
NoSpellTarget[SpellIds["冰霜之路"]] =     true;
NoSpellTarget[SpellIds["冰霜之柱"]] =     true;
NoSpellTarget[SpellIds["冰霜灵气"]] =     true;
NoSpellTarget[SpellIds["寒冬号角"]] =     true;
--NoSpellTarget[SpellIds["饥饿之寒"]] =     true;
NoSpellTarget[SpellIds["巫妖之躯"]] =     true;
NoSpellTarget[SpellIds["符文武器增效"]] =     true;

--血天赋
NoSpellTarget[SpellIds["天灾契约"]] =     true;
NoSpellTarget[SpellIds["血液沸腾"]] =     true;
NoSpellTarget[SpellIds["符文分流(激活减伤效果)"]] =     true;
NoSpellTarget[SpellIds["凛风冲击"]] =     true;
NoSpellTarget[SpellIds["鲜血灵气"]] =     true;
NoSpellTarget[SpellIds["白骨之盾"]] =     true;
NoSpellTarget[SpellIds["活力分流"]] =     true;
NoSpellTarget[SpellIds["吸血鬼之血"]] =     true;

--邪天赋
NoSpellTarget[SpellIds["亡者大军"]] =     true;
NoSpellTarget[SpellIds["反魔法领域"]] =     true;
NoSpellTarget[SpellIds["反魔法护罩"]] =     true;
NoSpellTarget[SpellIds["召唤石像鬼"]] =     true;
NoSpellTarget[SpellIds["黑锋之门"]] =     true;
NoSpellTarget[SpellIds["枯萎凋零"]] =     true;
NoSpellTarget[SpellIds["亡者复生"]] =     true;
NoSpellTarget[SpellIds["复活盟友"]] =     true;
NoSpellTarget[SpellIds["邪恶灵气"]] =     true;
NoSpellTarget[SpellIds["黑暗突变"]] =     true;

NoSpellTarget[SpellIds["黑暗模拟"]] =     true;
NoSpellTarget[SpellIds["符文熔铸"]] =     true;



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






function amIsNoSpellTarget(SpellId) --技能是否是有无目标标志
	
	return NoSpellTarget[SpellId] and true;
end



function amIsRaidSpell(spellId)
	
	return RaidSpell[spellId];
	
end



function amGetDkInfectionTargetInf()
	
	local v =0;
	local n = 0;
	local SWING = 0;
	local SWING1 = 0;
	local PeriodicTime;
	
	for i, data in pairs(wowam.DkInfectionTbl["buff"]) do
		
		if data["time"] then
					
			v = v +1;	
			
		end
		
		if data["Attack"] and (data["Attack"]=="SWING" or data["Attack"]=="<=15") then
			SWING= SWING +1;
		end
		
		if data["time"] and (data["Attack"]=="SWING" or data["Attack"]=="<=15") then
			SWING1= SWING1 +1;
		end
		
		if data["PeriodicTime"] then
			
			local a = 21 - (GetTime() - data["PeriodicTime"])
			
			
			if not PeriodicTime then
			
				PeriodicTime = a;
				
			else
			
				if a < PeriodicTime then
				
					PeriodicTime = a;
					
				end
				
			end
			
		end
		
		
		n= n +1;
	end
	
	if not PeriodicTime then
		PeriodicTime=0;
	end
		
		PeriodicTime = tonumber(format("%.2f", PeriodicTime));
	
	return n,v,n-v,SWING,SWING1,SWING-SWING1,PeriodicTime;
	

end

wowam.DkInfectionTbl={};
wowam.DkInfectionTbl["buff"]={};
wowam.DkInfectionTbl["血之疫病"]=55078;
wowam.DkInfectionTbl["血红热疫"]=81130;
wowam.DkInfectionTbl["冰霜疫病"]=55095;
wowam.DkInfectionTbl["血液沸腾"]=50842;
wowam.DkInfectionTbl["枯萎凋零"]=52212;

wowam.DkInfectionTbl["time"]=GetTime();

am_DK_UNIT_COMBAT_Frame = CreateFrame("Frame");
am_DK_UNIT_COMBAT_Frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
am_DK_UNIT_COMBAT_Frame:RegisterEvent("PARTY_MEMBERS_CHANGED");
am_DK_UNIT_COMBAT_Frame:RegisterEvent("RAID_ROSTER_UPDATE");

local DK_UnitGuids={};

 
local AffectingCombat = 0;

local function DecompositionEvent(v)

	return {strsplit("_",v)};
	
end

local function am_DK_UNIT_COMBAT_Frame_OnUpdate()
	
	if not DK_UnitGuids[UnitGUID("player")] then
		
		 DK_UnitGuids[UnitGUID("player")]="player";
	end
	 
	if GetTime() - wowam.DkInfectionTbl["time"] > 0.1 then
		
		
		 
		wowam.DkInfectionTbl["time"]=GetTime();
		
		if UnitAffectingCombat("player") and AffectingCombat == 0 then
			AffectingCombat=1;
		end
		
		if AffectingCombat == 1 and (not UnitAffectingCombat("player") or  UnitIsCorpse("player") or UnitIsDeadOrGhost("player")) then
			
			if not UnitAffectingCombat("player") then
				AffectingCombat =0;
			end
			wowam.DkInfectionTbl["buff"]={};
		
		end
		
		for i, v in pairs(wowam.DkInfectionTbl["buff"]) do
		
			if (v["time"] and GetTime() - v["time"] > 4) or (v["AttackTime"] and GetTime() - v["AttackTime"] > 4) then
				
				wowam.DkInfectionTbl["buff"][i]=nil;
								
			end
			
			
			
		
		end
		
		
	
	end
	
end




local function am_DK_UNIT_COMBAT_Frame_OnEvent(self, event, ...)
	
	local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16;

	
		
	arg1,arg2 = select(1, ...);
	arg3,arg4,arg5,_,arg6,arg7,arg8,_,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = select(4, ...);
		
	
	
	
	local PlayGuid = UnitGUID("player");	
	

	if ( event == "PARTY_MEMBERS_CHANGED" or event == "RAID_ROSTER_UPDATE" )  then
	
		local r = GetNumGroupMembers();
		local p = GetNumSubgroupMembers();
		
		DK_UnitGuids={};
		
		if r>0 then
		
			for i=1 , r do
				
				local u ="raid" .. tostring(i);
				local Guid = UnitGUID(u);
				
				if Guid then
					
					DK_UnitGuids[Guid]=u;
				
				end
				
			
			end
			
		elseif p > 0 then
		
			
			for i=1 , p do
				
				local u ="party" .. tostring(i);
				local Guid = UnitGUID(u);
				
				if Guid then
					
					DK_UnitGuids[Guid]=u;
				
				end
				
			
			end
		
		
		else
		
			DK_UnitGuids[PlayGuid]="player";
			
		end
		
		
		
		
	elseif ( event == "COMBAT_LOG_EVENT_UNFILTERED" and arg2 )  then
		
		
		local V = DecompositionEvent(arg2);
		
		
		
		if PlayGuid == arg6 and (V[2] == "DAMAGE" or V[2] == "MISSED" or V[3] == "DAMAGE" or V[3] == "MISSED") then
		
			if not wowam.DkInfectionTbl["buff"][arg3] then
			
				wowam.DkInfectionTbl["buff"][arg3]={};
				
				
			end
			
			wowam.DkInfectionTbl["buff"][arg3]["Attack"]=V[1];
			wowam.DkInfectionTbl["buff"][arg3]["AttackTime"] = GetTime();
			
		
		elseif arg3 and arg6 and (V[2] == "DAMAGE" or V[2] == "MISSED" or V[3] == "DAMAGE" or V[3] == "MISSED") then		
			
			
			if DK_UnitGuids[arg3] or DK_UnitGuids[arg6] then
								
				local u,id;
				
				if DK_UnitGuids[arg3] then
				
					u = DK_UnitGuids[arg3];
					id = arg6;
					
				elseif DK_UnitGuids[arg6] then
				
					u = DK_UnitGuids[arg6];
					id = arg3;
					
				end
				
				if V[1] == "SWING" and amjl(u)<=15 then
				
					if not wowam.DkInfectionTbl["buff"][id] then
				
						wowam.DkInfectionTbl["buff"][id]={};
						
						
					end
				
					wowam.DkInfectionTbl["buff"][id]["Attack"]=V[1];
					wowam.DkInfectionTbl["buff"][id]["AttackTime"] = GetTime();
					
					--print("<<",arg2,arg4,arg7,GetSpellInfo(arg9),arg9)
					
					--print(amGetDkInfectionTargetInf())
					
				end
				
				if PlayGuid == arg3 and arg6 and arg9 then
			
					if wowam.DkInfectionTbl["血液沸腾"] == arg9 or 
					wowam.DkInfectionTbl["枯萎凋零"] == arg9 then
					
						if not wowam.DkInfectionTbl["buff"][arg6] then
					
							wowam.DkInfectionTbl["buff"][arg6]={};
							
							
						end
					
						wowam.DkInfectionTbl["buff"][arg6]["Attack"]="<=15";
						wowam.DkInfectionTbl["buff"][arg6]["AttackTime"] = GetTime();
						--print(">>",arg2,arg4,arg7,GetSpellInfo(arg9),arg9)
					
					end
					
				
				
				end
				
			
			end
			
			
		end
		
		
		if arg2 == "SPELL_PERIODIC_DAMAGE" or arg2 == "SPELL_AURA_APPLIED" 
		 or arg2 == "SPELL_AURA_APPLIED_DOSE"  or arg2 == "SPELL_AURA_REMOVED_DOSE" 
		 or arg2 == "SPELL_AURA_REFRESH" then
			
					
			if PlayGuid == arg3 and arg6 and arg9 then
			
				if wowam.DkInfectionTbl["血之疫病"] == arg9 or 
				wowam.DkInfectionTbl["血红热疫"] == arg9 or 
				wowam.DkInfectionTbl["冰霜疫病"] == arg9 then
				
					if not wowam.DkInfectionTbl["buff"][arg6] then
			
						wowam.DkInfectionTbl["buff"][arg6]={};
						
					end
					
					
					
				
					wowam.DkInfectionTbl["buff"][arg6]["time"] = GetTime();
					wowam.DkInfectionTbl["buff"][arg6]["AttackTime"] = GetTime();
					
					if arg2 == "SPELL_AURA_APPLIED" or arg2 == "SPELL_AURA_REFRESH" then
					
						wowam.DkInfectionTbl["buff"][arg6]["PeriodicTime"] = GetTime();
											
					end
					
					
					
					
					
					
					--print("<<",arg2,arg4,arg7,GetSpellInfo(arg9))
					
					
					
				
				end
				
			
			
			end
		
		elseif (PlayGuid == arg3 and arg2 == "SPELL_AURA_REMOVED") then
			
			if wowam.DkInfectionTbl["血之疫病"] == arg9 or 
				wowam.DkInfectionTbl["血红热疫"] == arg9 or 
				wowam.DkInfectionTbl["冰霜疫病"] == arg9 then
			
				wowam.DkInfectionTbl["buff"][arg6]=nil;
			
			end
			
		end
		
		if arg2 == "PARTY_KILL" or arg2 == "UNIT_DIED" then
		
			
			wowam.DkInfectionTbl["buff"][arg6]=nil;
			
		end
		
		--print("1>>",event,arg1,arg2,arg3,arg4)
		
		
	end
	
end


function amIsMoveSpell(Id,unit,name) --处理移动中能施放的技能
	return true;	
end

am_DK_UNIT_COMBAT_Frame:SetScript("OnEvent", am_DK_UNIT_COMBAT_Frame_OnEvent);
am_DK_UNIT_COMBAT_Frame:SetScript("OnUpdate",am_DK_UNIT_COMBAT_Frame_OnUpdate)
