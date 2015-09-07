LZT_VERSION = "|cFF8000FF上帝指令插件包|cff00ffffver." .. GetAddOnMetadata("GC", "Version")
GetSpellName = GetSpellName or GetSpellBookItemName;
amttt="asdf12345";
amSounds={
"PVPENTERQUEUE",
"PVPTHROUGHQUEUE",
"GLUESCREENSMALLBUTTONMOUSEDOWN",
"GLUESCREENSMALLBUTTONMOUSEUP",
"GLUESCREENSMALLBUTTONMOUSEOVER",
"GLUESCREENMEDIUMBUTTONMOUSEDOWN",
"GLUESCREENMEDIUMBUTTONMOUSEUP",
"GLUESCREENMEDIUMBUTTONMOUSEOVER",
"GLUESCREENLARGEBUTTONMOUSEDOWN",
"GLUESCREENLARGEBUTTONMOUSEUP",
"GLUESCREENLARGEBUTTONMOUSEOVER",
"GLUESCREENEDITBOXKEYCLICK",
"GLUECHECKBOXMOUSEDOWN",
"GLUECHECKBOXMOUSEUP",
"GLUECHECKBOXMOUSEOVER",
"GLUECHARCUSTOMIZATIONMOUSEDOWN",
"GLUECHARCUSTOMIZATIONMOUSEUP",
"GLUECHARCUSTOMIZATIONMOUSEOVER",
"GLUESCROLLBUTTONMOUSEDOWN",
"GLUESCROLLBUTTONMOUSEUP",
"GLUESCROLLBUTTONMOUSEOVER",
"GAMEABILITYBUTTONMOUSEDOWN",
"GAMESPELLBUTTONMOUSEDOWN",
"GAMEWINDOWOPEN",
"GAMEWINDOWCLOSE",
"GAMEDIALOGOPEN",
"GAMEDIALOGCLOSE",
"GAMENEWWINDOWTAB",
"GAMESCREENSMALLBUTTONMOUSEDOWN",
"GAMESCREENSMALLBUTTONMOUSEUP",
"GAMESCREENSMALLBUTTONMOUSEOVER",
"GAMESCREENMEDIUMBUTTONMOUSEDOWN",
"GAMESCREENMEDIUMBUTTONMOUSEUP",
"GAMESCREENMEDIUMBUTTONMOUSEOVER",
"GAMESCREENLARGEBUTTONMOUSEDOWN",
"GAMESCREENLARGEBUTTONMOUSEUP",
"GAMESCREENLARGEBUTTONMOUSEOVER",
"GAMETARGETFRIENDLYUNIT",
"GAMETARGETHOSTILEUNIT",
"GAMETARGETNEUTRALUNIT",
"GAMEHIGHLIGHTFRIENDLYUNIT",
"GAMEHIGHLIGHTHOSTILEUNIT",
"GAMEHIGHLIGHTNEUTRALUNIT",
"GAMEINITIALATTACK",
"GAMEERROROUTOFRANGE",
"GAMEERROROUTOFMANA",
"GAMEERRORUNABLETOEQUIP",
"GAMEERRORINVALIDTARGET",
"ACTIONBARBUTTONDOWN",
"MAINBUTTONBARMENU",
"MINIMAPZOOMOUT",
"MINIMAPZOOMIN",
"MINIMAPOPEN",
"MINIMAPCLOSE",
"BAGMENUBUTTONPRESS",
"LOOTWINDOWOPEN",
"LOOTWINDOWCLOSE",
"LOOTWINDOWCOINSOUND",
"ITEMWEAPONSOUND",
"ITEMARMORSOUND",
"ITEMGENERICSOUND",
"LEVELUPSOUND",
"GLUECREATECHARACTERBUTTON",
"GLUEENTERWORLDBUTTON",
"SPELLBOOKOPEN",
"SPELLBOOKCLOSE",
"SPELLBOOKCHANGEPAGE",
"PAPERDOLLOPEN",
"PAPERDOLLCLOSE",
"QUESTADDED",
"QUESTCOMPLETED",
"QUESTLOGOPEN",
"QUESTLOGCLOSE",
"GLUEGENERICBUTTONPRESS",
"GAMEGENERICBUTTONPRESS",
"INTERFACESOUND_MONEYFRAMEOPEN",
"INTERFACESOUND_MONEYFRAMECLOSE",
"INTERFACESOUND_CHARWINDOWOPEN",
"INTERFACESOUND_CHARWINDOWCLOSE",
"INTERFACESOUND_CHARWINDOWTAB",
"INTERFACESOUND_GAMEMENUOPEN",
"INTERFACESOUND_GAMEMENUCLOSE",
"INTERFACESOUND_LOSTTARGETUNIT",
"INTERFACESOUND_BACKPACKOPEN",
"INTERFACESOUND_BACKPACKCLOSE",
"INTERFACESOUND_GAMESCROLLBUTTON",
"INTERFACESOUND_CURSORGRABOBJECT",
"INTERFACESOUND_CURSORDROPOBJECT",
"SHEATHINGSHIELDSHEATHE",
"SHEATHINGWOODWEAPONSHEATHE",
"SHEATHINGMETALWEAPONSHEATHE",
"SHEATHINGWOODWEAPONUNSHEATHE",
"SHEATHINGMETALWEAPONUNSHEATHE",
"SHEATHINGSHIELDUNSHEATHE",
"igCreatureAggroDeselect",
"igQuestListOpen",
"igQuestListClose",
"igQuestListSelect",
"igQuestListComplete",
"igQuestCancel",
"igPlayerInvite",
"igPlayerInviteAccept",
"igPlayerInviteDecline",
"GAMEERRORUNABLETOEQUIP",
"ITEMGENERICSOUND",
"GAMEERRORINVALIDTARGET",
"LEVELUP",
"GAMEERROROUTOFRANGE",
"QUESTADDED",
"MONEYFRAMEOPEN",
"MONEYFRAMECLOSE",
"LOOTWINDOWOPEN",
"LOOTWINDOWCLOSE",
"LOOTWINDOWCOINSOUND",
"GAMEHIGHLIGHTHOSTILEUNIT",
"GAMEHIGHLIGHTNEUTRALUNIT",
"GAMEHIGHLIGHTFRIENDLYUNIT",
"INTERFACESOUND_LOSTTARGETUNIT",
"INTERFACESOUND_CURSORGRABOBJECT",
"INTERFACESOUND_CURSORDROPOBJECT",
"GAMESCREENMEDIUMBUTTONMOUSEDOWN",
"GAMEABILITYACTIVATE",
"GAMESPELLACTIVATE",
"gsTitleEnterWorld",
"gsTitleOptions",
"gsTitleQuit",
"gsTitleCredits",
"gsTitleIntroMovie",
"gsTitleOptionScreenResolution",
"gsTitleOption16bit",
"gsTitleOption32bit",
"gsTitleOptionOpenGL",
"gsTitleOptionDirect3D",
"gsTitleOptionFullScreenMode",
"gsTitleOptionOK",
"gsTitleOptionExit",
"gsLogin",
"gsLoginNewAccount",
"gsLoginChangeRealm",
"gsLoginExit",
"gsLoginChangeRealmOK",
"gsLoginChangeRealmSelect",
"gsLoginChangeRealmCancel",
"gsCharacterSelection",
"gsCharacterSelectionEnterWorld",
"gsCharacterSelectionDelCharacter",
"gsCharacterSelectionAcctOptions",
"gsCharacterSelectionExit",
"gsCharacterSelectionCreateNew",
"gsCharacterCreationClass",
"gsCharacterCreationRace",
"gsCharacterCreationGender",
"gsCharacterCreationLook",
"gsCharacterCreationCreateChar",
"gsCharacterCreationCancel",
"igCurrentActiveSpell",
"igMiniMapOpen",
"igMiniMapClose",
"igMiniMapZoomIn",
"igMiniMapZoomOut",
"igChatEmoteButton",
"igChatScrollUp",
"igChatScrollDown",
"igChatBottom",
"igSpellBookOpen",
"igSpellBookClose",
"igSpellBokPageTur",
"igSpellBookSpellIconPickup",
"igSpellBookSpellIconDrop",
"igAbilityOpen",
"igAbilityClose",
"igAbiliityPageTurn",
"igAbilityIconPickup",
"igAbilityIconDrop",
"TalentScreenOpen",
"TalentScreenClose",
"igCharacterInfoOpen",
"igCharacterInfoClose",
"igCharacterInfoTab",
"igCharacterInfoScrollUp",
"igCharacterInfoScrollDown",
"igQuestLogOpen",
"igQuestLogClose",
"igQuestLogAbandonQuest",
"igQuestFailed",
"igSocialOepn",
"igSocialClose",
"igMainMenuOpen",
"igMainMenuClose",
"igMainMenuOption",
"igMainMenuLogout",
"igMainMenuQuit",
"igMainMenuContinue",
"igMainMenuOptionCheckBoxOn",
"igMainMenuOptionCheckBoxOff",
"igMainMenuOptionFaerTab",
"igInventoryOepn",
"igInventoryClose",
"igInventoryRotateCharacter",
"igBackPackOpen",
"igBackPackClose",
"igBackPackCoinSelect",
"igBackPackCoinOK",
"igBackPackCoinCancel",
"igCharacterNPCSelect",
"igCharacterNPCDeselect",
"igCharacterSelect",
"igCharacterDeselect",
"igCreatureNeutralSelect",
"igCreatureNeutralDeselect",
"igCreatureAggroSelect",
"UChatScrollButton",
"Deathbind",
"LOOTWINDOWOPENEMPTY",
"TaxiNodeDiscovered",
"UnwrapGift",
"TellMessage",
"WriteQuest",
"MapPing",
"igBonusBarOpen",
"FriendJoinGame",
"Fishing",
"HumanExploration",
"OrcExploration",
"UndeadExploration",
"TaurenExploration",
"TrollExploration",
"NightElfExploration",
"GnomeExploration",
"DwarfExploration",
"igPVPUpdate",
"ReadyCheck",
"RaidWarning",
"AuctionWindowOpen",
"AuctionWindowClose"
}

AM_CLASS_NAME={};

wowam_config={};
wowam_config.icon={};

wowam_config.SetGCD = false;
wowam_config.SetGCD_Time=0;
wowam_config.ingcd=true;

wowam_config.SpellAttackTime=0;
wowam_config.PromptSpellAttackTime=0;
wowam_config.Fast_version_switch=false;
wowam_config.SPELL_STOP_TIME=3;

if GetNumSubgroupMembers then
	GetNumPartyMembers = GetNumSubgroupMembers;
	GetNumRaidMembers = GetNumGroupMembers;
	GetActiveTalentGroup = GetActiveSpecGroup;
	GetPrimaryTalentTree = GetSpecialization;
	LootSlotIsItem = LootSlotHasItem;

else

	if GetNumPartyMembers and not GetNumSubgroupMembers then
		GetNumSubgroupMembers=GetNumPartyMembers;
		GetNumGroupMembers=GetNumRaidMembers;
		GetActiveSpecGroup=GetActiveTalentGroup;
		GetSpecialization=GetPrimaryTalentTree;
		LootSlotHasItem=LootSlotIsItem;
	end
end

wowam_rc = LibStub("LibRangeCheck-2.0")
am = {};
am.p = {};
am.t = {};
am.sys = {};

wowam = {};
wowam.ver = GetAddOnMetadata("GC", "Version");
wowam.tomtom={};
wowam.tomtom.time =GetTime();
wowam.vern =4.3;

wowam.ClassBeeScript={};

wowam.tomtom.TURNLEFT=0
wowam.tomtom.TURNRIGHT=0
wowam.tomtom.MOVEFORWARD=0
wowam.tomtom.autostart=0
wowam.tomtom.combat=0
wowam.tomtom.pause = 1;
wowam.tomtom.INFRONT=0;

wowam.spell={};
wowam.spell.Hot={};
wowam.spell.Hot.times={};
wowam.spell.StartTime=GetTime();
wowam.spell.Event_SpellInfo={};
wowam.spell.Event_SpellInfo.missType={};
wowam.spell.Event_SpellInfo.name={};

wowam.spell.Property={};


wowam.spell.Delay ={};
wowam.spell.Delay.time_ok=0;
wowam.spell.Delay.time=0;
wowam.spell.Delay.StartTime=GetTime(); --技能施放成功後宏停止時間


wowam.spell.Dot={};
wowam.spell.Dot.time={};
wowam.spell.ErrorText="";

wowam.Event = {};
wowam.Event.Combat = {};
wowam.Event.Combat.PARRY = {};
wowam.Event.Combat.PARRY.StartTime = GetTime();
wowam.Event.Combat.PARRY.START=0
wowam.Event.Combat.DODGE = {};
wowam.Event.Combat.DODGE.StartTime = GetTime();
wowam.Event.Combat.DODGE.START=0;

wowam.Macro={};

wowam.Keys={};
wowam.Keys.AutoOn=0;

wowam.Lj={};
wowam.Lj.StartTime=GetTime();
wowam.Lj.link_index = 0;
wowam.Lj.index =0;


wowam.Colors={};
wowam.Colors.RED = "|cffff0000";
wowam.Colors.GREEN = "|cff00ff00";
wowam.Colors.BLUE = "|cff0000ff";
wowam.Colors.MAGENTA = "|cffff00ff";
wowam.Colors.YELLOW = "|cffffff00";
wowam.Colors.CYAN = "|cff00ffff";
wowam.Colors.WHITE = "|cffffffff";

wowam.player={};
wowam.player.Name=UnitName("player");
wowam.player.UnitGUID=UnitGUID("player");
wowam.player.Combat=0;
wowam.player.Custom={};
wowam.player.Custom.Variable={};

wowam.Command={};
wowam.Command.Text=nil;


wowam.spell.Target_UNID="target";

wowam.spell.castindex=0;

wowam.SmartDebuff={};
wowam.SmartDebuff.Press=0;

wowam.Unit={};

wowam.QUITTING=0;

wowam_load_ok =0;
wowam.sys={};
wowam.sys.wowam_index = GetTime();
wowam.sys.wowam_index_ok = GetTime();
wowam.sys.wowam_index_n = 0;

wowam.sys.wowam_exit_time = GetTime();
wowam.sys.wowam_exit_n =0;
wowam.sys.test =0;
wowam.sys.automacro={};
wowam.sys.automacro.tbl=nil;
wowam.sys.automacro.id=0;
wowam.sys.automacro.runtiem=0.05;
wowam.sys.automacro.StartTime=GetTime();
wowam.sys.automacro.Loop =0;
wowam.sys.automacro.Tips =0;

wowam.sys.isRunMacroText=false;

wowam.sys.SpellPropertyTime=0.003;

wowam_config.new_version=false;
--wowam.sys.isgcd = nil;

wowam.sys.GCDStartTime=GetTime();
wowam.sys.GCD=0;
wowam.sys.GCDStart=nil;
wowam.sys.GCDV=GetTime();
 
wowam.sys.UnitAffectingCombat_StartTime=GetTime();

wowam_web1 = "";
wowam_qq = ""
wowam.FAILED_StopUnit={};

wowam.DelayTbl={};


function Decompositioninf(v,v1)
	return {strsplit(v1,v)};
end

--[[
amspellerr={};
local UpUnitFrame = CreateFrame("Frame");
UpUnitFrame:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN");
UpUnitFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
UpUnitFrame:RegisterEvent("ACTIONBAR_UPDATE_STATE");
UpUnitFrame:RegisterEvent("ACTIONBAR_UPDATE_USABLE");




local function DecompositionStr(str)
	
	local t,p;
	for k, v in string.gmatch(str,"%[(.-)(.+)%]") do
		t=v
		break;
	end
	--print(1,t)
	if not t then return false;end;

	for k, v in string.gmatch(t,"(.-)target=(.+)") do
		t=v
		break;
	end
	--print(2,t)

	t={strsplit(",",t)}

	if #t==0 then return false;end;
	
	t=strtrim(t[1]);
	--print(3,t[1])



	for k, v in string.gmatch(str,"%](.-)(.+)") do
		p=v
		break;
	end
	--print(4,p)
	if not p then return false;end;

	p={strsplit(";",p)}

	if #p==0 then return false;end;

	--print(t,p[1])
	p=strtrim(p[1])
	return t,p;
end


local function UpUnitFrame_OnEvent(self, event, ...)
	
		
	local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16;

	if tonumber((select(4, GetBuildInfo()))) >= 40200 then	
		
		arg1,arg2 = select(1, ...);
		arg3,arg4,arg5,_,arg6,arg7,arg8,_,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = select(4, ...);
		
	else
	
		arg1,arg2 = select(1, ...);
		arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = select(4, ...);
	
	end

	
	if ( event == "ACTIONBAR_UPDATE_STATE" )  then	
		
		
		local gcd = amGCD();
		local spellName, spellSubName,skillType, spellId  ;
		--print(gcd,IsCurrentSpell(ams))
		if gcd==0 and ams and amt and UnitGUID(amt) and IsCurrentSpell(ams) then
			
			spellName, spellSubName =GetSpellInfo(ams);
			amspellerr["spellname"]=spellName;
			amspellerr["macro"]="";
			amspellerr["time"]=GetTime();
			amspellerr["id"]=amt;
			amspellerr["spellId"]=ams;
					
			
			--print("<<",spellName,GetTime()-amtt)
		
				
		elseif gcd==0 and amt and ams and not IsCurrentSpell(ams) then
			
			local ac = amac("player");
			--print("x1",ac,GetTime() -amspellerr["time"]<1 and GetTime() -amspellerr["time"]>0)
			--print(amspellerr["spellname"] and amspellerr["id"] and not ac)
			
			if  amspellerr["spellname"] and amspellerr["id"] and not ac and amspellerr["time"] and GetTime() -amspellerr["time"]<1 and GetTime() -amspellerr["time"]>0 then
		
				amdelay(amspellerr["spellname"],0.5,amspellerr["id"]);
				--print("stop>",wowam_config.SPELL_STOP_TIME,amspellerr["spellname"],amspellerr["id"],GetTime()-amtt)
			else
				amspellerr={};
			end
			
		end
		
	elseif ( event == "COMBAT_LOG_EVENT_UNFILTERED" )  then
	
	
		local _, _, prefix, suffix = string.find(arg2, "(.-)_(.+)")
		if (suffix=="CAST_FAILED") and UnitGUID("player")== arg3 and arg11 and arg14 and amspellerr["time"] then	
		--if (suffix=="CAST_FAILED") and UnitGUID("player")== arg3 and  arg14  then
		
		--print(">>>",arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16)	
			--wowam_config.FAILED_TEXT[arg12]
			local TEXT = arg14;
			--print(TEXT)
			
			if TEXT==SPELL_FAILED_OUT_OF_RANGE or TEXT==SPELL_FAILED_BAD_IMPLICIT_TARGETS or TEXT==SPELL_FAILED_LINE_OF_SIGHT or TEXT==SPELL_FAILED_TARGETS_DEAD or TEXT==SPELL_FAILED_BAD_TARGETS then
				--print(1,TEXT,GetTime() -amspellerr["time"],select(3, GetNetStats())*2)
				if GetTime() -amspellerr["time"]< select(3, GetNetStats())*2 + 0.7 then
					
										
						local guid = UnitGUID(amspellerr["id"]);
						
						
						
						if guid then
														
							if not wowam["FAILED_StopUnit"][guid] then
								wowam["FAILED_StopUnit"][guid]={};
							end
							
							wowam["FAILED_StopUnit"][guid]["time"]=GetTime();
							wowam["FAILED_StopUnit"][guid]["text"]=arg14;
							--print(arg14)
						end
					
				
				end
				
				--print(format("%.3f",GetTime() -amspellerr["time"]))
			end			
			
		end
	end
	

	
	

end
--]]



local UpUnitFrame = CreateFrame("Frame");
UpUnitFrame:RegisterEvent("UNIT_SPELLCAST_FAILED");
UpUnitFrame:RegisterEvent("UNIT_SPELLCAST_SENT");
UpUnitFrame:RegisterEvent("UI_ERROR_MESSAGE");
UpUnitFrame:RegisterEvent("UPDATE_BATTLEFIELD_SCORE");

UpUnitFrame.SpellInf={};
UpUnitFrame.SpellErrTime={};
UpUnitFrame.SpellErrId={};
UpUnitFrame.StopTarget={};
UpUnitFrame.StopTarget[SPELL_FAILED_LINE_OF_SIGHT]=true;
UpUnitFrame.Isload=false;
--UpUnitFrame.StopTarget[SPELL_FAILED_UNIT_NOT_INFRONT]=true;

local function UpUnitFrame_OnEvent(self, event, ...)
	
	local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 ;
	
	arg1,arg2 = select(1, ...);
	arg3,arg4,arg5,_,arg6,arg7,arg8,_,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = select(4, ...);
		
	if event == "UNIT_SPELLCAST_SENT" and  UnitIsUnit("player",arg1) then
		
		--print("xx",arg1,arg2,arg3,arg4,arg5,arg6)
		local index = arg4 or arg3;
		local t;
		local GUID,target;
		
		if arg4 then
			t = arg3;
			target = arg3;
		end
		
		if t then
			
			GUID = UnitGUID(t);
			if not GUID then
			
				if t ==amGetUnitName("target") then
				
					GUID = UnitGUID("target");
					target ="target";
				
				elseif t ==amGetUnitName("focus") then
				
					GUID = UnitGUID("focus");
					target="focus";
					
				end
				
				if t==amGetUnitName("player") then
					target="player";
					GUID = UnitGUID("player");
				end
				
			end
		end
		
		
			
			
		local castunit = UpUnitFrame.SpellInf;
		
		if not castunit[index] then
		
			castunit[index]={};
		end
		
		local tbl = castunit[index];
		tbl["time"] = GetTime();
		tbl["guid"] = GUID;
		tbl["name"] = target;
		tbl["spell"]=arg2;
		
		
		
		
		
	elseif arg1 and UnitIsUnit("player",arg1) and event=="UNIT_SPELLCAST_FAILED" then
	
	
		local tc = true; --GetAddOnMetadata("GC", "Version") and not GetAddOnMetadata("wowb" .. "ee", "Version");
		
		if UpUnitFrame.SpellInf[arg3] and amGCD()==0 and tc then
			
			if UpUnitFrame.SpellErrTime[GetTime()] then
				if not UpUnitFrame.SpellErrId[arg4] then
					UpUnitFrame.SpellErrId[arg4]={};
				end
				UpUnitFrame.SpellErrId[arg4]["err"] = UpUnitFrame.SpellErrTime[GetTime()];
				UpUnitFrame.SpellErrId[arg4]["time"] =GetTime();
				
			end
			
			local err ="";
			
			if UpUnitFrame.SpellErrId[arg4] and (GetTime() - UpUnitFrame.SpellErrId[arg4]["time"]<4) then
				err = UpUnitFrame.SpellErrId[arg4]["err"];
			end
			
			if UpUnitFrame.StopTarget[err] then
			
				local guid = UpUnitFrame.SpellInf[arg3]["guid"];
				
				if guid then
					if not wowam["FAILED_StopUnit"][guid] then
						wowam["FAILED_StopUnit"][guid]={};
					end
					
					wowam["FAILED_StopUnit"][guid]["time"]=GetTime();
					wowam["FAILED_StopUnit"][guid]["text"]=err;
					
				else
					local guid = amGetSpellName(arg4);
					if not wowam["FAILED_StopUnit"][guid] then
						wowam["FAILED_StopUnit"][guid]={};
					end
					
					wowam["FAILED_StopUnit"][guid]["time"]=GetTime();
					wowam["FAILED_StopUnit"][guid]["text"]=err;
					
				end
				
			else
			
				local target = UpUnitFrame.SpellInf[arg3]["name"];	
				
				if target then
					amdelay(amGetSpellName(arg4),0.5,target);
					
				else
					amdelay(amGetSpellName(arg4),0.5);
					
				end
				
			end
			
		end
		
		
	elseif ( event == "UI_ERROR_MESSAGE" )  then
		
		UpUnitFrame.SpellErrTime[GetTime()]=arg1;
	
	elseif ( event == "UPDATE_BATTLEFIELD_SCORE" )  then
		
		--print(arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16)
	
	end
	
	
end

local function UpUnitFrame_OnUpdate()

	if not UpUnitFrame.Isload  then
		UpUnitFrame.Isload =true;
		
		
	end
	
end

UpUnitFrame:SetScript("OnEvent", UpUnitFrame_OnEvent);
UpUnitFrame:SetScript("OnUpdate",UpUnitFrame_OnUpdate)


	




wowam.sys.spell_ex={}  -- 技能名稱ID 對照
wowam.sys.spell_ex["拳擊"]=GetSpellInfo(6552)
wowam.sys.spell_ex["沖鋒"]=GetSpellInfo(11578)
wowam.sys.spell_ex["攔截"]=GetSpellInfo(20252)
wowam.sys.spell_ex["戰鬥姿態"]=GetSpellInfo(2457)
wowam.sys.spell_ex["血性狂暴"]=GetSpellInfo(29131)
wowam.sys.spell_ex["狂暴姿態"]=GetSpellInfo(2458)
wowam.sys.spell_ex["狂暴之怒"]=GetSpellInfo(18499)
wowam.sys.spell_ex["暗言術：痛"]=GetSpellInfo(25368)
wowam.sys.spell_ex["群體驅散"]=GetSpellInfo(32375)
wowam.sys.spell_ex["逃亡者"]=GetSpellInfo(26013)



wowam.sys.buff_ex={}  -- BUFF名稱ID 對照




wowam.sys.SPELL_FAILED={};
wowam.sys.SPELL_FAILED.SPELLINF={};
wowam_config.FAILED_TEXT={};

wowam.sys.SPELL_FAILED.SPELL_NAME=nil;
wowam.sys.SPELL_FAILED.SPELL_UNIT=nil;
wowam.sys.SPELL_FAILED.SPELL_TIME= GetTime();
wowam.sys.SPELL_FAILED.UnitAffectingCombat=nil;
wowam.sys.SPELL_FAILED.SPELL_NOUNIT=nil;

wowam_config.FAILED_TEXT={};


	--wowam_config.FAILED_TEXT[SPELL_FAILED_OUT_OF_RANGE] ="超出範圍"
	--wowam_config.FAILED_TEXT[SPELL_FAILED_NOPATH] ="沒有可以行進的路徑"
	--wowam_config.FAILED_TEXT[SPELL_FAILED_BAD_IMPLICIT_TARGETS] ="沒有目標"
	wowam_config.FAILED_TEXT[SPELL_FAILED_LINE_OF_SIGHT] ="目標不在視野中"
	--wowam_config.FAILED_TEXT[SPELL_FAILED_TOO_CLOSE] ="目標過於接近"
	--wowam_config.FAILED_TEXT[SPELL_FAILED_TARGETS_DEAD] ="目標已經死亡"
	wowam_config.FAILED_TEXT[SPELL_FAILED_UNIT_NOT_INFRONT] ="你必須面對目標"
	--wowam_config.FAILED_TEXT[SPELL_FAILED_NOT_BEHIND] ="你必須位於目標背後"
	--wowam_config.FAILED_TEXT[SPELL_FAILED_ONLY_STEALTHED] ="你必須在潛行狀態下"
	--wowam_config.FAILED_TEXT[SPELL_FAILED_BAD_TARGETS] ="無效的目標"
	--wowam_config.FAILED_TEXT[SPELL_FAILED_AURA_BOUNCED] ="已經有一個更強大的法術在發揮作用"
	--wowam_config.FAILED_TEXT[SPELL_FAILED_NO_COMBO_POINTS] ="這個技能需要連擊點數"
	--wowam_config.FAILED_TEXT[SPELL_FAILED_ONLY_OUTDOORS] ="只能在室外使用"
	--wowam_config.FAILED_TEXT[SPELL_FAILED_ONLY_SHAPESHIFT] ="必須在熊形態"
	--wowam_config.FAILED_TEXT[SPELL_FAILED_ONLY_STEALTHED] ="必須在潛行中"
	



wowam.sys.spell_wmb={}
wowam.sys.spell_wmb["雷霆一擊"]=GetSpellInfo(25264)
wowam.sys.spell_wmb["利刃風暴"]=GetSpellInfo(46924)
wowam.sys.spell_wmb["挫誌怒吼"]=GetSpellInfo(25203)
wowam.sys.spell_wmb["旋風斬"]=GetSpellInfo(1680)
wowam.sys.spell_wmb["橫掃攻擊"]=GetSpellInfo(12328)


wowam.sys.spellinfo = nil




	
local _,playerClass  = UnitClass("player")
wowam.sys.GCDspellid=0

	
--"WARLOCK" = "術士" 
--"WARRIOR" = "戰士" 
--"HUNTER" = "獵人" 
--"MAGE" = "法師" 
--"PRIEST" = "牧師" 
--"DRUID" = "德魯伊" 
--"PALADIN" = "聖騎士" 
--"SHAMAN" = "薩滿祭司" 
--"ROGUE" = "盜賊" (盜賊) 



	if(playerClass=="WARRIOR") then 
	wowam.sys.GCDspellid=25208 --撕裂

	elseif(playerClass=="PRIEST") then 
	wowam.sys.GCDspellid=25222  --恢復
	elseif(playerClass=="PALADIN") then 
	wowam.sys.GCDspellid=20154 --正義聖印
	elseif(playerClass=="MAGE" ) then 
	wowam.sys.GCDspellid=7302 --霜甲術
	elseif(playerClass=="ROGUE") then 
	wowam.sys.GCDspellid=1752 --影襲
	elseif(playerClass=="DRUID") then 
	wowam.sys.GCDspellid=5176 --憤怒
	elseif(playerClass=="SHAMAN") then 
	wowam.sys.GCDspellid=403 --閃電箭
	elseif(playerClass=="WARLOCK") then 
	wowam.sys.GCDspellid=687 --惡魔皮膚
	elseif(playerClass=="HUNTER") then 
	wowam.sys.GCDspellid=14318 --雄鷹守護
	elseif(playerClass=="DEATHKNIGHT") then
	wowam.sys.GCDspellid=48266 --冰霜領域
	else
	wowam.sys.GCDspellid=0
	end 
			
		 	




amCastSpellex="32";
wowam.sys.spelltype={};
wowam.sys.spelltype[1]="技能";
wowam.sys.spelltype[2]="物品";
wowam.sys.spelltype[3]="物品";
wowam.sys.spelltype[4]="宏";

wowam.amisFollowUnit_Event=false;
wowam_config.Passphrase=false;
wowam_config.Passphrase_text="";

wowam_config.Proposal=false;


wowam.addons={};

wowam.spell.Info={};

wowam.spell.text="";


wowam["CastSpellInf"]={};
wowam["CastSpellInf"]["spell"]={};
wowam["CastSpellInf"]["HEAL_PREDICTION"]={};
amtesttext="上帝指令加载完成！"


