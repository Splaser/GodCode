if GetLocale() ~= "zhTW" then return; end

local SpellErrList={};
local playerClass, englishClass = UnitClass("player");

if englishClass ~= "DEATHKNIGHT" then

	return;
end

local frame = CreateFrame("Frame");

frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
frame:RegisterEvent("COMBAT_TEXT_UPDATE");

local Shapeshift={}; --姿態名稱ID對照
local spellSubNameErrText={}; -- 錯誤技能信息
local ShapeshiftName = nil; --姿態本地名稱

if GetLocale() == "zhCN" then
	
end



local spellinf = wowam.spell.Info;	--技能信息

local BuffName = {};				--BUFF名稱
local RaidSpell={};					--施放目標類型（團/隊/個人）的技能 團=3,隊=2,個人=1
local SpellIds={};					-- 技能ID
local NoSpellTarget={}; 		--無目標標志
local SpellRune = {};	--需要符文

--冰天賦

SpellIds["冰封之韌"] =     48792;
SpellIds["冰霜之路"] =     3714;
SpellIds["冰霜之柱"] =     51271;
SpellIds["冰霜靈氣"] =     48266;
SpellIds["寒冬號角"] =     57330;
SpellIds["饑餓之寒"] =     49203;
SpellIds["巫妖之軀"] =     49039;
SpellIds["符文武器增效"] =     47568;

--血天賦
SpellIds["天災契約"] =     48743;
SpellIds["血液沸騰"] =     48721;
SpellIds["符文刃舞"] =     49028;
SpellIds["符文分流"] =     48982;
SpellIds["凜風沖擊"] =     55233;
SpellIds["鮮血靈氣"] =     48263;
SpellIds["白骨之盾"] =     49222;
SpellIds["活力分流"] =     45529;
SpellIds["吸血鬼之血"]=55233;

--邪天賦
SpellIds["亡者大軍"] =     42650;
SpellIds["反魔法領域"] =     51052;
SpellIds["反魔法護罩"] =     48707;
SpellIds["召喚石像鬼"] =     49206;
SpellIds["黑鋒之門"] =     50977;
SpellIds["枯萎凋零"] =     43265;
SpellIds["亡者複生"] =     46584;
SpellIds["複活盟友"] =     61999;
SpellIds["邪惡靈氣"] =     48265;
SpellIds["黑暗突變"] =     63560;

SpellIds["符文熔鑄"]=53428;  
SpellIds["自動攻擊"]=6603;  
SpellIds["爆發"]=77575;  
SpellIds["黑暗模擬"]=77606;  





--需激活技能
SpellIds["符文打擊"] =     56815;
--當自身閃躲招架後技能條圖標變亮 需目標

SpellIds["暗影灌注"] =     45772;
BuffName["暗影灌注"]= GetSpellInfo(SpellIds["暗影灌注"]);
BuffName["鮮血靈氣"]= GetSpellInfo(SpellIds["鮮血靈氣"]);
--需玩家寵物身上buff 層數 "暗影灌注" =5 後技能條圖標變亮 無需目標


--需要目標的技能
SpellIds["靈界打擊"] =         49998; 
SpellIds["傳染"] =         50842;
SpellIds["心髒打擊"] =         55050;  
SpellIds["符文刃舞"] =         49028;
SpellIds["絞襲"] =         47476;
SpellIds["鮮血打擊"] =         45902;
SpellIds["黑暗命令"] =         56222;
SpellIds["冰冷觸摸"] =         45477;         
SpellIds["寒冰鎖鏈"] =         45524;
SpellIds["心靈冰凍"] =         47528;
SpellIds["演沒"] =         49020;
SpellIds["符文打擊"] =         56815;
SpellIds["膿瘡打擊"] =         85948;
SpellIds["死亡之握"] =         49576;
SpellIds["凋零纏繞"] =         47541;
SpellIds["暗影打擊"] =         45462;
SpellIds["天災打擊"] = 55090;
SpellIds["死疽打擊"] = 73975;
SpellIds["冰霜打擊"] =         49143;
SpellIds["凜風沖擊"] =         49184;



NoSpellTarget[SpellIds["黑暗突變"]] =     true;

NoSpellTarget[SpellIds["冰封之韌"]] =     true;
NoSpellTarget[SpellIds["冰霜之路"]] =     true;
NoSpellTarget[SpellIds["冰霜之柱"]] =     true;
NoSpellTarget[SpellIds["冰霜靈氣"]] =     true;
NoSpellTarget[SpellIds["寒冬號角"]] =     true;
NoSpellTarget[SpellIds["饑餓之寒"]] =     true;
NoSpellTarget[SpellIds["巫妖之軀"]] =     true;
NoSpellTarget[SpellIds["符文武器增效"]] =     true;

--血天賦
NoSpellTarget[SpellIds["天災契約"]] =     true;
NoSpellTarget[SpellIds["血液沸騰"]] =     true;
NoSpellTarget[SpellIds["符文分流"]] =     true;
NoSpellTarget[SpellIds["凜風沖擊"]] =     true;
NoSpellTarget[SpellIds["鮮血靈氣"]] =     true;
NoSpellTarget[SpellIds["白骨之盾"]] =     true;
NoSpellTarget[SpellIds["活力分流"]] =     true;
NoSpellTarget[SpellIds["吸血鬼之血"]] =     true;

--邪天賦
NoSpellTarget[SpellIds["亡者大軍"]] =     true;
NoSpellTarget[SpellIds["反魔法領域"]] =     true;
NoSpellTarget[SpellIds["反魔法護罩"]] =     true;
NoSpellTarget[SpellIds["召喚石像鬼"]] =     true;
NoSpellTarget[SpellIds["黑鋒之門"]] =     true;
NoSpellTarget[SpellIds["枯萎凋零"]] =     true;
NoSpellTarget[SpellIds["亡者複生"]] =     true;
NoSpellTarget[SpellIds["複活盟友"]] =     true;
NoSpellTarget[SpellIds["邪惡靈氣"]] =     true;
NoSpellTarget[SpellIds["黑暗突變"]] =     true;

NoSpellTarget[SpellIds["黑暗模擬"]] =     true;
NoSpellTarget[SpellIds["符文熔鑄"]] =     true;




    -- 1 血魄符文
    -- 2 穢邪符文
    -- 3 冰霜符文
    -- 4 死亡符文


SpellRune[SpellIds["冰霜之路"]] =     {0,0,1};    --1個冰霜符文
SpellRune[SpellIds["冰霜之柱"]] =    {0,0,1};  --1個冰霜符文
SpellRune[SpellIds["血液沸騰"]] =    {1,0,0};  --1個血魄符文
SpellRune[SpellIds["符文分流"]] =    {1,0,0};  --1個血魄符文
SpellRune[SpellIds["白骨之盾"]] =    {0,1,0};  --1個穢邪符文
--SpellRune[SpellIds["活力分流"]] =    {1,0,0};  --1個血魄符文
SpellRune[SpellIds["亡者大軍"]] =    {1,1,1};  --1血魄1穢邪1冰霜
SpellRune[SpellIds["反魔法領域"]] =    {0,1,0};  --1個穢邪符文
SpellRune[SpellIds["黑鋒之門"]] =    {0,1,0};     --1個穢邪符文
SpellRune[SpellIds["枯萎凋零"]] =    {0,1,0};    --1個穢邪符文
SpellRune[SpellIds["黑暗突變"]] =    {0,1,0};    --1個穢邪符文
--SpellRune[SpellIds["黑暗突變"]] =   {0,1,0};  --1點穢邪符文



--需要目標的技能
SpellRune[SpellIds["靈界打擊"]] =        {0,1,1};                     -- 1冰1邪
SpellRune[SpellIds["傳染"]] =        {1,0,0};                     -- 1血
SpellRune[SpellIds["心髒打擊"]] =        {1,0,0};                     -- 1血
SpellRune[SpellIds["絞襲"]] =        {1,0,0};                         --     1血
SpellRune[SpellIds["鮮血打擊"]] =        {1,0,0};                     -- 1血
SpellRune[SpellIds["冰冷觸摸"]] =        {0,0,1};                     -- 1冰
SpellRune[SpellIds["寒冰鎖鏈"]] =        {0,0,1};                      --1冰
SpellRune[SpellIds["演沒"]] =        {0,1,1};                         --     1冰1邪
SpellRune[SpellIds["膿瘡打擊"]] =        {1,0,1};                     -- 1血1冰
SpellRune[SpellIds["暗影打擊"]] =        {0,1,0};                     -- 1邪
SpellRune[SpellIds["天災打擊"]] =        {0,1,0};                      --       1邪
SpellRune[SpellIds["死疽打擊"]] =        {0,1,0};                     --        1邪/83級開放
SpellRune[SpellIds["凜風沖擊"]] =        {0,0,1};                     -- 1冰 


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






function amSpellRune_Requirements(id)
	local name, rank, icon, cost, isFunnel, powerType, castTime, minRange, maxRange = GetSpellInfo(id);
	if powerType ~= 5 then
	
		return true;
	
	elseif not SpellRune[id] then
		
		return true;
	--elseif not SpellRune[id] and powerType == 5 then
	
		--print("無法判斷符文數量，請和作者聯繫。")
		--return false; 
		
	end
	
	local Rune1 = amrunecount(1);
	local Rune2 = amrunecount(2);
	local Rune3 = amrunecount(3);
	local Rune4 = amrunecount(4);
	
	local Rune = SpellRune[id];
	
		
	if Rune1 < Rune[1] then
		
		if Rune4 >= Rune[1] then
			
			Rune4 = Rune4 - Rune[1] ;
			
		else
			return false
		end
	
	end
	
	
	if Rune2 < Rune[2] then
		
		if Rune4 >= Rune[2] then
			
			Rune4 = Rune4 - Rune[2] ;
			
		else
			return  false
		end
	
	end
	
	
	if Rune3 < Rune[3] then
		
		if Rune4 >= Rune[3] then
			
			Rune4 = Rune4 - Rune[3] ;
			
		else
			return  false
		end
	
	end
	
	
	return true;
	


end



local function Activation_Event_CastSpell(self, event, ...)

	--local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = ...;
	--local _, _, prefix, suffix = string.find(arg2, "(.-)_(.+)");
	
	local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16;

	if tonumber((select(4, GetBuildInfo()))) >= 40200 then	
		
		arg1,arg2 = select(1, ...);
		arg3,arg4,arg5,_,arg6,arg7,arg8,_,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = select(4, ...);
		
	else
	
		arg1,arg2 = select(1, ...);
		arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = select(4, ...);
	
	end
	
	
	if arg2 == "SPELL_CAST_SUCCESS" and arg3 and wowam.player.UnitGUID == arg3 then
		
		if arg9 == SpellIds["符文打擊"] then
			
			if not spellinf[arg9] then
				spellinf[arg9]={};
			end
			spellinf[arg9]["Cast"]=GetTime();
			spellinf[arg9]["ActivationTime"]=GetTime();
		
		
		end
	end
	
end


local function Activation_OnEvent(self, event, ...) --處理被激活技能事件

	--local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = ...;
	
	--local arg1,arg2 = select(1, ...);
	--local arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = select(4, ...);
	
	local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16;

	if tonumber((select(4, GetBuildInfo()))) >= 40200 then	
		
		arg1,arg2 = select(1, ...);
		arg3,arg4,arg5,_,arg6,arg7,arg8,_,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = select(4, ...);
		
	else
	
		arg1,arg2 = select(1, ...);
		arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = select(4, ...);
	
	end
	
	if ( event == "COMBAT_LOG_EVENT_UNFILTERED" )  then
		
		
	
		Activation_Event_CastSpell(self, event, ...)
		
		
	elseif ( event == "COMBAT_TEXT_UPDATE" )  then
		
		
            if (arg1 == "SPELL_ACTIVE") then
			
				if GetSpellInfo(SpellIds["符文打擊"]) == arg2 then
				
					amActivation_Event_56815();
					
				
				end
			
			end
	
		
	end

end

frame:SetScript("OnEvent", Activation_OnEvent);

function amActivation_Event_56815()

	if not spellinf[SpellIds["符文打擊"]] then

		spellinf[SpellIds["符文打擊"]]={};
		
	end
				
	spellinf[SpellIds["符文打擊"]]["ActivationTime"]=GetTime();
end



function amIsActivation(Id,unit) --處理被激活技能

	if not amSpellRune_Requirements(Id) then
	
		return false;
	end

	if Id == SpellIds["符文打擊"] then 
		
		return amIsActivation_56815(Id);
		
	elseif Id == SpellIds["黑暗突變"] then 
		
		return amIsActivation_63560(Id);
	
	else
		return true;
	end

end


function amIsActivation_56815(Id) --符文打擊

	if UnitBuff("player", BuffName["鮮血靈氣"]) and amr("player")>=30 then
		return true;
	end
	
	if spellinf[Id] and spellinf[Id]["ActivationTime"] then
		
			if GetTime() - spellinf[Id]["ActivationTime"] <=5 then
			
				if spellinf[Id]["Cast"] then

					if spellinf[Id]["Cast"] < spellinf[Id]["ActivationTime"] then
						return true;
					else
						return false;
					end
				
				else
				
					return true;
				
				end
			
			
			end
			
			return false;
	end
	
	return false;
end



function amIsActivation_63560(Id) --黑暗突變

	local bn = ambn(BuffName["暗影灌注"],"pet",2,0);
	
	if bn and bn >=5 then
	
	
		return true;
	else
		return false;
	end

end



function amIsNoSpellTarget(SpellId) --技能是否是有無目標標志
	
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
wowam.DkInfectionTbl["血紅熱疫"]=81130;
wowam.DkInfectionTbl["冰霜疫病"]=55095;
wowam.DkInfectionTbl["血液沸騰"]=48721;
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
	--[[
	local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16;
		
		arg1,arg2 = select(1, ...);
		arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = select(4, ...);
	--]]	
			--3,4
			--6,7
			--9,10
			
			
	local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16;

	if tonumber((select(4, GetBuildInfo()))) >= 40200 then	
		
		arg1,arg2 = select(1, ...);
		arg3,arg4,arg5,_,arg6,arg7,arg8,_,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = select(4, ...);
		
	else
	
		arg1,arg2 = select(1, ...);
		arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = select(4, ...);
	
	end
	
	
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
			
					if wowam.DkInfectionTbl["血液沸騰"] == arg9 or 
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
				wowam.DkInfectionTbl["血紅熱疫"] == arg9 or 
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
				wowam.DkInfectionTbl["血紅熱疫"] == arg9 or 
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


am_DK_UNIT_COMBAT_Frame:SetScript("OnEvent", am_DK_UNIT_COMBAT_Frame_OnEvent);
am_DK_UNIT_COMBAT_Frame:SetScript("OnUpdate",am_DK_UNIT_COMBAT_Frame_OnUpdate)
