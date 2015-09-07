if GetLocale() ~= "zhTW" then return; end
local SpellErrList={};

local playerClass, englishClass = UnitClass("player");

if englishClass ~= "WARRIOR" then

	return;
end

local frame = CreateFrame("Frame");

frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
frame:RegisterEvent("COMBAT_TEXT_UPDATE");

local Shapeshift={}; --姿態名稱ID對照
local spellSubNameErrText={}; -- 錯誤技能信息
local ShapeshiftName = nil; --姿態本地名稱


 --魯莽,1719,魯莽,魯莽,ID對照不了原來的名稱;  盾牆,871,盾牆,盾牆,ID對照不了原來的名稱;


	
	Shapeshift[1]="戰鬥";
	Shapeshift[2]="防禦";
	Shapeshift[3]="狂暴";
	
	spellSubNameErrText["等級"]="姿態";
	ShapeshiftName = "姿態";




local spellinf = wowam.spell.Info;	--技能信息

local BuffName = {};				--BUFF名稱
local RaidSpell={};					--施放目標類型（團/隊/個人）的技能 團=3,隊=2,個人=1
local SpellIds={};					-- 技能ID
local NoSpellTarget={}; 		--無目標標志


SpellIds["複仇(防禦姿態)"] = 6572;
SpellIds["壓制(戰鬥姿態)"] = 7384;
SpellIds["雷霆壹擊(戰鬥，防禦姿態)"] = 	6343;
SpellIds["命令怒吼"] = 	469;
SpellIds["戰鬥怒吼"] = 	6673;
SpellIds["挑戰怒吼"] = 	1161;
SpellIds["挫志怒吼"] = 	1160;
SpellIds["旋風斬(狂暴姿態)"] = 	1680;
SpellIds["狂怒回複"] = 	55694;
SpellIds["狂暴之怒"] = 	18499;
SpellIds["破膽怒吼"] = 	5246;
SpellIds["魯莽"] = 	1719;

SpellIds["法術反射(戰鬥、防禦姿態)"] = 	23920;
SpellIds["盾牆"] = 	871;
SpellIds["盾牌格擋(防禦姿態)"] = 	2565;
SpellIds["破釜沈舟"] = 	12975;
SpellIds["震蕩波"] = 	46968;
SpellIds["防禦姿態"] = 	71;
SpellIds["狂暴姿態"] = 	2458;
SpellIds["戰鬥姿態"] = 	2457;

SpellIds["橫掃攻擊(戰鬥，狂暴姿態)"]  = 	12328;
SpellIds["致命平靜"] = 	85730;
SpellIds["擊倒(戰鬥姿態)"] = 	85388;
SpellIds["劍刃風暴(等級 1)"] = 	9632;
SpellIds["刺耳怒吼"]  = 	12323;
SpellIds["死亡之願"]  = 	12292;
SpellIds["怒擊"]  = 	58390;
SpellIds["暴怒"]  = 	6613;
SpellIds["英勇之怒"] = 	60970;
SpellIds["乘勝追擊"] =  34428;
SpellIds["持久追擊雕文"] =  58104;

SpellIds["巨人打擊(戰鬥，狂暴姿態)"] =  86346;
SpellIds["怒火中燒"] =  1134;
SpellIds["英勇飛躍"] =  6544;

SpellIds["沖鋒(戰鬥姿態)"] = 	100;

SpellIds["援護(防禦姿態)"] = 	3411;
SpellIds["攔截(狂暴姿態)"] = 	20252;
SpellIds["戰神"] =  57499;

SpellIds["猛擊"] =  1464;
SpellIds["拳擊"] = 	6552;
SpellIds["集結呐喊"] = 	97462;

---CTM-
SpellIds["射擊"]=3018;
SpellIds["投擲"]=2764;
SpellIds["攻擊"]=88163;
SpellIds["自動攻擊"]=6603;
SpellIds["反擊風暴"]=20230;
SpellIds["撕裂(戰鬥，防禦姿態)"]=772;
SpellIds["斷筋(戰鬥，狂暴姿態)"]=1715;
SpellIds["英勇打擊"]=78;
SpellIds["重擊"]=88161;
SpellIds["英勇投擲"]=57755;
SpellIds["碎裂投擲(戰鬥姿態)"]=64382;
SpellIds["斬殺(戰鬥，狂暴姿態)"]=5308;
SpellIds["順劈斬"]=845;
SpellIds["嘲諷(防禦姿態)"]=355;
SpellIds["破甲攻擊"]=7386;
SpellIds["繳械(防禦姿態)"]=676

 
SpellIds["劍刃風暴"]=46924;  
SpellIds["致死打擊"]=12294; 

SpellIds["毀滅打擊"]=20243; 
SpellIds["盾牌猛擊"]=23922;

SpellIds["強化斷筋"]=23694;

------

BuffName["持久追擊雕文"] = GetSpellInfo(SpellIds["持久追擊雕文"]);
BuffName["強化斷筋"] = GetSpellInfo(SpellIds["強化斷筋"]);



NoSpellTarget[SpellIds["雷霆壹擊(戰鬥，防禦姿態)"]] = 	true;
NoSpellTarget[SpellIds["命令怒吼"]] = 	true;
NoSpellTarget[SpellIds["戰鬥怒吼"]] = 	true;
NoSpellTarget[SpellIds["挑戰怒吼"]] = 	true;
NoSpellTarget[SpellIds["挫志怒吼"]] = 	true;
NoSpellTarget[SpellIds["旋風斬(狂暴姿態)"]] = 	true;
NoSpellTarget[SpellIds["狂怒回複"]] = 	true;
NoSpellTarget[SpellIds["狂暴之怒"]] = 	true;
NoSpellTarget[SpellIds["破膽怒吼"]] = 	true;
NoSpellTarget[SpellIds["魯莽"]] = 	true;

NoSpellTarget[SpellIds["法術反射(戰鬥、防禦姿態)"]] = 	true;
NoSpellTarget[SpellIds["盾牆"]] = 	true;
NoSpellTarget[SpellIds["盾牌格擋(防禦姿態)"]] = 	true;
NoSpellTarget[SpellIds["破釜沈舟"]] = 	true;
NoSpellTarget[SpellIds["震蕩波"]] = 	true;
NoSpellTarget[SpellIds["防禦姿態"]] = true;
NoSpellTarget[SpellIds["狂暴姿態"]] = 	true;
NoSpellTarget[SpellIds["戰鬥姿態"]] = 	true;



NoSpellTarget[SpellIds["致命平靜"]] = 	true;
NoSpellTarget[SpellIds["劍刃風暴(等級 1)"]] = 	true;
NoSpellTarget[SpellIds["刺耳怒吼"]]  = 	true;
NoSpellTarget[SpellIds["死亡之願"]]  = 	true;
NoSpellTarget[SpellIds["暴怒"]]  = 	true;
NoSpellTarget[SpellIds["英勇之怒"]] = 	true;

NoSpellTarget[SpellIds["怒火中燒"]] = 	true;
NoSpellTarget[SpellIds["英勇飛躍"]] = 	true;
NoSpellTarget[SpellIds["集結呐喊"]] = 	true;

-------CTM---

NoSpellTarget[SpellIds["反擊風暴"]] = 	true;


-----------


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
		
		if arg9 == SpellIds["複仇(防禦姿態)"] then
			
			if not spellinf[arg9] then
				spellinf[arg9]={};
			end
			spellinf[arg9]["Cast"]=GetTime();
			spellinf[arg9]["ActivationTime"]=GetTime();
			
		
		
		
		elseif arg9 == SpellIds["壓制(戰鬥姿態)"] then
		
			if not spellinf[arg9] then
				spellinf[arg9]={};
			end
			spellinf[arg9]["Cast"]=GetTime();
			spellinf[arg9]["ActivationTime"]=GetTime();
		
		elseif arg9 == SpellIds["乘勝追擊"] then
		
		
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
			
				if GetSpellInfo(SpellIds["複仇(防禦姿態)"]) == arg2 then
				
					amActivation_Event_Revenge();
					
				elseif GetSpellInfo(SpellIds["壓制(戰鬥姿態)"]) == arg2 then
				
					amActivation_Event_Suppress();
					
				elseif GetSpellInfo(SpellIds["乘勝追擊"]) == arg2 then
				
					amActivation_Event_34428();
					
				end
			
			end
	
		
	end

end

frame:SetScript("OnEvent", Activation_OnEvent);


function amActivation_Event_34428()

	if not spellinf[SpellIds["乘勝追擊"]] then

		spellinf[SpellIds["乘勝追擊"]]={};
		
	end
				
	spellinf[SpellIds["乘勝追擊"]]["ActivationTime"]=GetTime();
	
	
end

function amActivation_Event_Revenge()

	if not spellinf[SpellIds["複仇(防禦姿態)"]] then

		spellinf[SpellIds["複仇(防禦姿態)"]]={};
		
	end
				
	spellinf[SpellIds["複仇(防禦姿態)"]]["ActivationTime"]=GetTime();
end

function amActivation_Event_Suppress()

	if not spellinf[SpellIds["壓制(戰鬥姿態)"]] then

		spellinf[SpellIds["壓制(戰鬥姿態)"]]={};
		
	end
		
		spellinf[SpellIds["壓制(戰鬥姿態)"]]["ActivationTime"]=GetTime();
		spellinf[SpellIds["壓制(戰鬥姿態)"]]["destGUID"]=UnitGUID("target");

end

function amIsActivation(Id,unit) --處理被激活技能
--[[
	if Id == SpellIds["複仇(防禦姿態)"] then 
		
		return amIsActivation_Revenge(Id);
		
	elseif Id == SpellIds["壓制(戰鬥姿態)"] then 
		
		return amIsActivation_Suppress(Id,unit);
		
	elseif Id == SpellIds["乘勝追擊"] then 
		
		return amIsActivation_34428(Id);
	
	else
		return true;
	end
	--]]
	return true;
end

function amIsActivation_34428(Id) --乘勝追擊
	
	local n = 20;
	
	if select(3,GetShapeshiftFormInfo(2)) and spellinf[Id] and spellinf[Id]["ActivationTime"] then
	
		local IsGlyph = amIsGlyphSocketInfo(BuffName["持久追擊雕文"]);
		if IsGlyph then
			n = 25;
		end
			if GetTime() - spellinf[Id]["ActivationTime"] <=n then
			
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



function amIsActivation_Revenge(Id) --複仇(防禦姿態)

	if select(3,GetShapeshiftFormInfo(2)) and spellinf[Id] and spellinf[Id]["ActivationTime"] then
		
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


function amIsActivation_Suppress(Id,unit) --壓制

	if select(3,GetShapeshiftFormInfo(1)) and spellinf[Id] and spellinf[Id]["ActivationTime"] and spellinf[SpellIds["壓制(戰鬥姿態)"]]["destGUID"] == UnitGUID(unit) then
		
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




function amIsNoSpellTarget(SpellId) --技能是否是有無目標標志

	return NoSpellTarget[SpellId] and true
end



function amSpellSubNameFixerrors(spellSubName) -- 修正技能信息

	for i,v in pairs(spellSubNameErrText) do
	
		if strfind(spellSubName,i) then
			
			spellSubName=string.gsub(spellSubName,i,v);
			
		end
	
	end
	
	return spellSubName;
end

function amGetShapeshiftIds(spellSubName) -- 獲得技能姿態要求
	
	local t = "";
	
	
	
	
	if not strfind(spellSubName,ShapeshiftName) then
		return t;
	end
	
	for i,v in pairs(Shapeshift) do
	
		if strfind(spellSubName,v) then
			t = t .. i;
			
		end
	
	end
	
	return t;
end

function amIsSpellShapeshift(SpellId) -- 判斷技能是否姿態是否符合

	local spellName, spellSubName = GetSpellInfo(SpellId);
	
	if not spellSubName or spellSubName == "" then
		return true;
	end
	
	--if SpellId == SpellIds["沖鋒(戰鬥姿態)"] then
	--	spellSubName = "戰鬥，防禦姿態";
	--end
	
	if (SpellId == SpellIds["沖鋒(戰鬥姿態)"] or SpellId == SpellIds["援護(防禦姿態)"] or SpellId == SpellIds["攔截(狂暴姿態)"]) and amTalentInfo("戰神") then
		return true;
	end


	
	--spellSubName = amSpellSubNameFixerrors(spellSubName);
	
	
	
	local Shapeshifts = amGetShapeshiftIds(spellSubName)
	
	if Shapeshifts ~= "" then
		
			local Shapeshift = tostring(amGetShapeshiftId());
			
			
		
			if strfind(Shapeshifts,Shapeshift) then
				return true;
			else
				return false;
			end
	else
		
		return true;
		
	end
	
	
	
	
end


function amIsRaidSpell(spellId)
	
	return RaidSpell[spellId];
	
end




-- 複仇(防禦姿態)技能激活處理

function amActivation_Event_Revenge_bak(self, event, ...)
	
	
	--local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = ...;
	
	local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16;

	if tonumber((select(4, GetBuildInfo()))) >= 40200 then	
		
		arg1,arg2 = select(1, ...);
		arg3,arg4,arg5,_,arg6,arg7,arg8,_,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = select(4, ...);
		
	else
	
		arg1,arg2 = select(1, ...);
		arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = select(4, ...);
	
	end
	
	
	local _, _, prefix, suffix = string.find(arg2, "(.-)_(.+)");
	
	if  (suffix == "DAMAGE" or suffix == "MISSED") and arg6 and wowam.player.UnitGUID == arg6 then
		if ((arg9 and (arg9=="DODGE" or arg9=="BLOCK" or arg9=="PARRY")) or arg13 or arg16) or (arg12 and (arg12=="DODGE" or arg12=="BLOCK" or arg12=="PARRY")) then
		
			
			
			if not spellinf[SpellIds["複仇(防禦姿態)"]] then
			
				spellinf[SpellIds["複仇(防禦姿態)"]]={};
				
			end
				
				spellinf[SpellIds["複仇(防禦姿態)"]]["ActivationTime"]=GetTime();
		end	
			---print("fc",arg9,arg13 , arg16)
		
	end
		
	if prefix == "SPELL" and suffix == "CAST_SUCCESS" and arg3 and wowam.player.UnitGUID == arg3 and arg9 == SpellIds["複仇(防禦姿態)"] then
		
		if not spellinf[arg9] then
			spellinf[arg9]={};
		end
		spellinf[arg9]["Cast"]=GetTime();
		
		--print("Cast" ,"fc")
	end
		

end



function amActivation_Event_Suppress_bak(self, event, ...)
	
	--local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = ...;
	
	local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16;

	if tonumber((select(4, GetBuildInfo()))) >= 40200 then	
		
		arg1,arg2 = select(1, ...);
		arg3,arg4,arg5,_,arg6,arg7,arg8,_,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = select(4, ...);
		
	else
	
		arg1,arg2 = select(1, ...);
		arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = select(4, ...);
	
	end
	
	local _, _, prefix, suffix = string.find(arg2, "(.-)_(.+)");
	
	if suffix == "MISSED" and  (arg12=="DODGE" or arg9=="DODGE") and wowam.player.UnitGUID == arg3 and UnitGUID("target")==arg6 then
		--print("yz",event,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16)
		if arg3 and arg6   then
		
			--print("yz",arg9,arg12)
			--血性體驗
			if not spellinf[SpellIds["壓制(戰鬥姿態)"]] then
			
				spellinf[SpellIds["壓制(戰鬥姿態)"]]={};
				
			end
				
				spellinf[SpellIds["壓制(戰鬥姿態)"]]["ActivationTime"]=GetTime();
				spellinf[SpellIds["壓制(戰鬥姿態)"]]["destGUID"]=arg6;
			
		end
		
	end
		
	if prefix == "SPELL" and suffix == "CAST_SUCCESS"  and arg3 and wowam.player.UnitGUID == arg3 and arg9 == SpellIds["壓制(戰鬥姿態)"] then
		
		if not spellinf[arg9] then
			spellinf[arg9]={};
		end
		spellinf[arg9]["Cast"]=GetTime();
	end
		

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


function amIsMoveSpell(Id,unit,name) --處理移動中能施放的技能


	if Id == SpellIds["猛擊"] then 
		
		return true;

	end
	
end


local InternalCDFrame = CreateFrame("Frame");
local InternalCDFrame_u = 0 ;
local TalentName_12289 = GetSpellInfo(12289) --強化斷筋

local function InternalCDFrame_OnEvent(self, event, ...)

	local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16;

	arg1,arg2 = select(1, ...);
	arg3,arg4,arg5,_,arg6,arg7,arg8,_,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = select(4, ...);
	
	if "COMBAT_LOG_EVENT_UNFILTERED" == event then
	
		if UnitGUID("player") == arg3 and arg2 == "SPELL_AURA_APPLIED" then
				
			if BuffName["強化斷筋"] == arg10 then
			
				local n = amTalentInfo(TalentName_12289);
				
				if n >0 then
					
					if not amInternalCDTbl[BuffName["強化斷筋"]] then
						amInternalCDTbl[BuffName["強化斷筋"]]={};
					end
					
					if n == 1 then
						
						
						amInternalCDTbl[BuffName["強化斷筋"]]["Cycle"]=60;
						
					
					elseif n == 2 then
						
						amInternalCDTbl[BuffName["強化斷筋"]]["Cycle"]=30;
						
					end
					
					amInternalCDTbl[BuffName["強化斷筋"]]["time"]=GetTime();
				
									
				
				else
				
					amInternalCDTbl[BuffName["強化斷筋"]]=nil;
				end
		
				
			end
			
			
		end
	
	
	end
	

end



InternalCDFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
InternalCDFrame:SetScript("OnEvent", InternalCDFrame_OnEvent);



