  
local GetSpellInfo = GetSpellInfo;
local UnitName = UnitName;
local UnitPlayerOrPetInParty = UnitPlayerOrPetInParty;
local UnitPlayerOrPetInRaid = UnitPlayerOrPetInRaid;
local GetRaidRosterInfo = GetRaidRosterInfo;
local UnitClass = UnitClass;
local UnitGroupRolesAssigned = UnitGroupRolesAssigned;
local aml = aml;
local amr = amr;
local UnitHealth = UnitHealth;
local UnitHealthMax = UnitHealthMax;
local UnitMana = UnitMana;
local UnitManaMax = UnitManaMax;
local UnitDebuff = UnitDebuff;
local format = format;
local tonumber = tonumber;
--local tremove = tremove;
--local next = next;
local GetTime = GetTime; 
local UnitCastingInfo = UnitCastingInfo;
local UnitChannelInfo = UnitChannelInfo;
local GetSpellCooldown = GetSpellCooldown;
local GetItemCooldown = GetItemCooldown;
local GetItemInfo = GetItemInfo;
local IsEquippedItem = IsEquippedItem;
local UnitPower = UnitPower;
local GetShapeshiftFormInfo = GetShapeshiftFormInfo;
local GetPetActionInfo = GetPetActionInfo;
local rp = _G.string.rep;
local IsCurrentSpell = IsCurrentSpell;
local UnitGUID = UnitGUID;
local type = type;
local GetSpellBookItemInfo = GetSpellBookItemInfo;
local GetSpellLink = GetSpellLink;
local GetInventoryItemID = GetInventoryItemID;

local GetBagName = GetBagName;
local GetContainerNumSlots = GetContainerNumSlots;
local GetContainerItemID = GetContainerItemID;
local GetUnitSpeed = GetUnitSpeed;

local select = select;
local UnitCanAssist = UnitCanAssist;
local UnitCanAttack = UnitCanAttack;
local IsSpellInRange = IsSpellInRange;
local IsUsableSpell = IsUsableSpell;
local IsUsableItem = IsUsableItem;
local IsItemInRange = IsItemInRange;
local GetMacroIndexByName = GetMacroIndexByName;
local GetMacroInfo = GetMacroInfo;
local ItemHasRange = ItemHasRange;

local dragStarted=false;
local oldCursorX,oldCursorY;
local newCursorX,newCursorY;
local testswitch=false;
local timer=0;
--local interval=0.15; 
local interval=0 
 

 
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

	
	p=strtrim(p[1])
	--print(t,p)
	return t,p;
end


function Wowam_Message(msg)
	DEFAULT_CHAT_FRAME:AddMessage(msg);
end;

function Wowam_OnLoad(self)
		
	SlashCmdList["ct"]=wowam_comman;
	SLASH_ct1 = "/ct";
			
	SlashCmdList["amtomtom"]=Wowam_Set_tomtom_for;
	SLASH_amtomtom1 = "/amtomtom";
	SLASH_amtomtom2 = "/amtom";
	SLASH_amtomtom3 = "/tom";
	
	SlashCmdList["wowam"]=Wowam_help	;		
	SLASH_wowam1 = "/wowam";
	SLASH_wowam2 = "/GC";
	SLASH_wowam3 = "/am";
	
	SlashCmdList["tomfiles"]=Wowam_Gomtom_for_path_set	;		
	SLASH_tomfiles1 = "/tomfiles";
	
	SlashCmdList["gotom"]=Wowam_Tomtom_auto	;		
	SLASH_gotom1 = "/gotom";
	
	SlashCmdList["amdc"]=amdc	;		
	SLASH_amdc1 = "/amdc";
	
	--SlashCmdList["amdc"]=amdc	;		
	--SLASH_amdc1 = "/amdc";
	
	SlashCmdList["amrl"]=ReloadUI	;		
	SLASH_amrl1 = "/amrl";	
	
		
	 
	self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
	self:RegisterEvent("CHAT_MSG_WHISPER");
	self:RegisterEvent("CHAT_MSG_WHISPER_INFORM");
	self:RegisterEvent("CHAT_MSG_ADDON");
	--this:RegisterEvent("PLAYER_QUITTING")
	self:RegisterEvent("PLAYER_ENTER_COMBAT")
	self:RegisterEvent("PLAYER_LEAVE_COMBAT")
	self:RegisterEvent("PLAYER_LOGOUT")	
	self:RegisterEvent("PLAYER_LOGIN")
	
	
	
	self:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN")
	
	
	
	self:RegisterEvent("AUTOFOLLOW_BEGIN")
	self:RegisterEvent("AUTOFOLLOW_END")
	
	self:RegisterEvent("CHAT_MSG_WHISPER")
	self:RegisterEvent("LFG_PROPOSAL_SHOW")
	--self:RegisterEvent("COMBAT_TEXT_UPDATE");
	
	
end

function Wowam_OnEvent(self,event,...)

	wowam_Event_SpellInfo(self, event, ...)
	
	local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14;


	
	
	
	if tonumber((select(4, GetBuildInfo()))) >= 40200 then	
		
		arg1,arg2 = select(1, ...);
		arg3,arg4,arg5,_,arg6,arg7,arg8,_,arg9,arg10,arg11,arg12 = select(4, ...);
	
	
	else
	
		arg1,arg2 = select(1, ...);
		arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12 = select(4, ...);
	
	end
	
	
		if ( event == "ACTIONBAR_UPDATE_COOLDOWN" )  then
			
				if not wowam.sys.GCDStart then
					wowam.sys.GCD=amGCD();
					wowam.sys.GCDStartTime=GetTime();
					wowam.sys.GCDStart =1;
					wowam.sys.GCDV=GetTime();
				end
			
				
		elseif ( event == "PLAYER_ENTER_COMBAT" )  then
			
				wowam.player.Combat=1;
		
		
		elseif ( event == "PLAYER_LEAVE_COMBAT" )  then
			
				wowam.player.Combat=0;
		
		
		
			
		elseif ( event == "COMBAT_LOG_EVENT_UNFILTERED" )  then
	
				if wowam.sys.spellinfo then
				
					if arg3 == UnitGUID("player") then
						local spellID = arg9
						local timpw = GetSpellInfo(spellID)
						print("技能ID對照",timpw,spellID)
					end
				
				end
		
				local _, _, prefix, suffix = string.find(arg2, "(.-)_(.+)")
				local src = arg4
				local time=GetTime()
				
				if src==wowam.player.Name then 
					--local spellname=select(10,...) or nil;
					local spellname=arg10
					
					if spellname=="風怒攻擊" then
						
						wowam.spell.Hot.times[spellname]=GetTime() + 4;
					end
				end
		
				if (prefix=="SWING") then
					if suffix=="MISSED" then
							if (arg9)=="DODGE"  and arg4==wowam.player.Name then
								wowam.Event.Combat.DODGE.StartTime = GetTime();
								wowam.Event.Combat.DODGE.START=1
						
							elseif (arg9)=="PARRY"  and arg7==wowam.player.Name  then
						
								wowam.Event.Combat.PARRY.StartTime = GetTime();
								wowam.Event.Combat.PARRY.START=1
							
							end
					end
    
				elseif (prefix=="SPELL") then
		 
		 					
  	
    	
				end 
    
    
    
				if wowam.Keys.AutoOn==1 and wowam.player.Name==arg4 then
				 
						if (prefix=="SWING") or (prefix=="SPELL") or (prefix=="RANGE") then
							
							
						
							if (suffix=="CAST_FAILED") then	
								
								if arg12 == SPELL_FAILED_UNIT_NOT_INFRONT then
									
									--DEFAULT_CHAT_FRAME:AddMessage("2: " .. tostring(arg12),192,0,192,0)
									
									--if wowam.tomtom.INFRONT==0  then
										
									
										
										local temp_tomtom_key = GetBindingKey("TURNRIGHT")
										Wowam_Down_Key(temp_tomtom_key,5);
										
										
										
										--Wowam_RunCommand("A")
										--Wowam_RunCommand("_A")
										--Wowam_RunCommand("_A")
										--Wowam_RunCommand("_A")
										--Wowam_RunCommand("_A")
										--Wowam_RunCommand("_A")
										
										--DEFAULT_CHAT_FRAME:AddMessage("A" ,192,0,192,0)
									--end
									
								elseif (wowam.tomtom.INFRONT==1) and (arg12 == SPELL_FAILED_BAD_IMPLICIT_TARGETS or arg12 == SPELL_FAILED_LINE_OF_SIGHT  or arg12 == SPELL_FAILED_OUT_OF_RANGE) then
									
										local temp_tomtom_key = GetBindingKey("TURNRIGHT")
										Wowam_Down_Key(temp_tomtom_key,0);
										
										
																						--Wowam_RunCommand("-A")
										--Wowam_RunCommand("-A")
										--Wowam_RunCommand("-A")
										--Wowam_RunCommand("-A")
										--Wowam_RunCommand("-A")
										--DEFAULT_CHAT_FRAME:AddMessage("_A1: " .. suffix ,192,0,192,0)	
								end	
								
										
							end
					
										if ((suffix=="CAST_START") or (suffix=="DAMAGE") or (suffix=="MISSED") or (suffix=="CAST_SUCCESS")) and wowam.tomtom.INFRONT==1 then	
														
														local temp_tomtom_key = GetBindingKey("TURNRIGHT")
														Wowam_Down_Key(temp_tomtom_key,0);
														
														--Wowam_RunCommand("-A")
														--Wowam_RunCommand("-A")
														--Wowam_RunCommand("-A")
														--Wowam_RunCommand("-A")
														--Wowam_RunCommand("-A")
														--DEFAULT_CHAT_FRAME:AddMessage("_A: " .. suffix ,192,0,192,0)
														
										end
								
						end
			
				end
		  
			
	end
	
	if((wowam.sys.test==1 or wowam_config.Fast_version_switch ) and event=="CHAT_MSG_WHISPER" and wowam_config.Passphrase and wowam_config.Passphrase_text and wowam_config.Passphrase_text ~= "") then
		
		if UnitGUID("player")~=UnitGUID(arg2) then
			SendChatMessage(wowam_config.Passphrase_text,"WHISPER",nil,arg2)
		end
	
	end
	
	--if event == "LFG_PROPOSAL_SHOW" and (wowam.sys.test==1 or wowam_config.Fast_version_switch ) then
	
	if event == "LFG_PROPOSAL_SHOW" and wowam_config.Proposal and (wowam.sys.test==1 or wowam_config.Fast_version_switch ) then
	--print(GetLFGProposal())
		amrun("/run AcceptProposal()");
	end
	
	
	
	amisFollowUnit_Event(self, event, ...);
	
	
end

local isApplied = false;

function Wowam_OnUpdate()



	local temp_UnitAffectingCombat;
	if GetTime() - wowam.sys.UnitAffectingCombat_StartTime >1 then
	
		temp_UnitAffectingCombat=UnitAffectingCombat("player");
		
		if  temp_UnitAffectingCombat and not wowam.sys.SPELL_FAILED.UnitAffectingCombat then
			wowam.sys.SPELL_FAILED.UnitAffectingCombat=1;
			--print("進入戰鬥")
		elseif not temp_UnitAffectingCombat and wowam.sys.SPELL_FAILED.UnitAffectingCombat then
		wowam.sys.SPELL_FAILED.SPELLINF={};
			--print("離開戰鬥")
			wowam.sys.SPELL_FAILED.UnitAffectingCombat=nil;
		end
		
		wowam.sys.UnitAffectingCombat_StartTime=GetTime();
	end
	
	if GetTime() - wowam.sys.GCDStartTime > 0.002 and wowam.sys.GCDStart then
		wowam.sys.GCD=amGCD();
		
		wowam.sys.GCDStartTime=GetTime();
		if wowam.sys.GCD  <=0  then
			wowam.sys.GCDStart =nil;
		
		end
	end
	



	if wowam_load_ok == 0 then
		wowam_load_ok=1;
		
		wowam_load();
		
	end

	

	if (GetTime() - wowam.tomtom.time >0.3) and TomTomWorldFrame  then
	
		if wowam.tomtom.autostart == 1 then	
			
			wowam.tomtom.time =GetTime()
					

			if not Wowam_Go_tomtom() then
				
				Wowam_Tomtom_auto(0)
				wowam.tomtom.Set_for_name = nil;
			end
		

		
		end
	end


				
	
	if (GetTime() - wowam.spell.StartTime)>=0.1  then	
			
		local name, _, _, _, startTime, endTime = UnitCastingInfo("player")
			if name then
				
				--DEFAULT_CHAT_FRAME:AddMessage("E: " .. format("%.1f", endTime/1000 -GetTime()),192,0,192,0)
				--DEFAULT_CHAT_FRAME:AddMessage("S: " .. tostring(startTime),192,0,192,0)
				--DEFAULT_CHAT_FRAME:AddMessage("T: " .. tostring(GetTime()),192,0,192,0)
				
				if wowam.spell.Dot.time[name] then
					if wowam.spell.Dot.time[name]>0 then
						wowam.spell.Delay.StartTime=GetTime()+ wowam.spell.Dot.time[name]
					--Wowam_Message(wowam.Colors.YELLOW..format("%.1f", wowam.spell.Dot.time[name]))
					end
				end
			
			end	
				
		wowam.spell.StartTime=GetTime()		
	end
			
	
	
	
	
	local TimeNow = GetTime();



	if (GetTime() - wowam.Event.Combat.DODGE.StartTime)>=5 and wowam.Event.Combat.DODGE.START==1 then

		wowam.Event.Combat.DODGE.START=0;
		
	end;
	
	if (GetTime() - wowam.Event.Combat.PARRY.StartTime)>=5 and wowam.Event.Combat.PARRY.START==1 then

		wowam.Event.Combat.PARRY.START=0;
		
	end;
	
	     
	     Wowam_Down_Key(); 	

	Wowam_AutoScript();
	if(not isApplied and magiccast_welcome) then
		print(magiccast_welcome);
		isApplied = true;
	end
        if (FireHack) and not amCheckHealer("player") then
	    FHmakeenemiesTable(55)
	end

end;


function Wowam_OnShow()
	--WowamFrameTitle:SetText("防禦戰士PVE");
	--WowamFrameTitle:Show();
	WowamFrame:SetClampedToScreen(true);
end

function Wowam_OnMouseUp()
	WowamFrame:StopMovingOrSizing();
end

function Wowam_OnMouseDown()
	WowamFrame:StartMoving();
end

function Button1_OnClick()

end

function Wowam_Spell_Run(term)
	local pbcdname_id = nil;
	local name = term.Command_Text
		
	term.pb=tonumber(term.pb);
	term.tb=tonumber(term.tb);
	term.pr=tonumber(term.pr);
	term.tr=tonumber(term.tr);
	term.pl=tonumber(term.pl);
	term.tl=tonumber(term.tl);
	term.pbcd=tonumber(term.pbcd);
	term.pbn=tonumber(term.pbn);
	term.tbn=tonumber(term.tbn);
	term.pbm=tonumber(term.pbm);
	term.tbm=tonumber(term.tbm);
	term.prm=tonumber(term.prm);
	term.trm=tonumber(term.trm);
	term.pbnm=tonumber(term.pbnm);
	term.tbnm=tonumber(term.tbnm);
	term.plm=tonumber(term.plm);
	term.tlm=tonumber(term.tlm);
	term.pbcdm=tonumber(term.pbcdm);
	term.cf=tonumber(term.cf);
	term.ljd=tonumber(term.ljd);
	term.ljdm=tonumber(term.ljdm);
	
	term.pdb=tonumber(term.pdb);
	term.tdb=tonumber(term.tdb);
	term.pdbm=tonumber(term.pdbm);
	term.tdbm=tonumber(term.tdbm);
	term.zy=tonumber(term.zy);
	term.peta=tonumber(term.peta);
	term.zt=tonumber(term.zt);
	term.zd=tonumber(term.zd);
	term.trt=tonumber(term.trt);
	term.yz=tonumber(term.yz);
	term.ztb=tonumber(term.ztb);
	term.hj=tonumber(term.hj);
	term.ty=tonumber(term.ty);
	term.jl=tonumber(term.jl);
	term.jlm=tonumber(term.jlm);
	
	term.ptmh=tonumber(term.ptmh);
	term.ptmhm=tonumber(term.ptmhm);
	term.zb=tonumber(term.zb);
	
	term.dkxp=tonumber(term.dkxp);
	term.dkhx=tonumber(term.dkhx);
	term.dkbs=tonumber(term.dkbs);
	term.dksw=tonumber(term.dksw);
	term.dkxpm=tonumber(term.dkxpm);
	term.dkhxm=tonumber(term.dkhxm);
	term.dkbsm=tonumber(term.dkbsm);
	term.dkswm=tonumber(term.dkswm);
	
	term.gj = tonumber(term.gj);
	term.zmb = tonumber(term.zmb);
	
	
	if term.gj then
		if wowam.player.Combat ~= term.gj then
			--DEFAULT_CHAT_FRAME:AddMessage("A")
			return false;
		end
	end
	
	if term.zmb then
		
		if  amGetUnitName("target") then
			
				if not (UnitCanAttack("player", "target")  and term.zmb ==1 ) then
					return false;
				end
				
				if not ( (not UnitCanAttack("player", "target") ) and term.zmb ==0 ) then
					return false;
				end
			
		
			
		end
	
	end
	
	
	local dkbuff_id;
	
	if term.dkxp~=nil then
		
		dkbuff_id=Wowam_DKbuff(1)
		if not dkbuff_id then
			return false;
		end	
	
		if not (dkbuff_id>term.dkxp) then
			return false;
		end	
	
	end
	
	
	if term.dkhx~=nil then
		
		dkbuff_id=Wowam_DKbuff(2)
		if not dkbuff_id then
			return false;
		end	

		if not (dkbuff_id>term.dkhx) then
			return false;
		end	

	end

	if term.dkbs~=nil then
	
		dkbuff_id=Wowam_DKbuff(3)
		if not dkbuff_id then
			return false;
		end	

		if not (dkbuff_id>term.dkbs) then
			return false;
		end	

	end

if term.dksw~=nil then
	
	dkbuff_id=Wowam_DKbuff(4)
	if not dkbuff_id then
		return false;
	end	

	if not (dkbuff_id>term.dksw) then
		return false;
	end	

end


if term.dkxpm~=nil then
	
	dkbuff_id=Wowam_DKbuff(1)
	if not dkbuff_id then
		return false;
	end	

	if not (dkbuff_id<term.dkxpm) then
		return false;
	end	

end

if term.dkhxm~=nil then
	
	dkbuff_id=Wowam_DKbuff(2)
	if not dkbuff_id then
		return false;
	end	

	if not (dkbuff_id<term.dkhxm) then
		return false;
	end	

end

if term.dkbsm~=nil then
	
	dkbuff_id=Wowam_DKbuff(3)
	if not dkbuff_id then
		return false;
	end	

	if not (dkbuff_id<term.dkbsm) then
		return false;
	end	

end

if term.dkswm~=nil then
	
	dkbuff_id=Wowam_DKbuff(4)
	if not dkbuff_id then
		return false;
	end	

	if not (dkbuff_id<term.dkswm) then
		return false;
	end	

end


if term.ut~=nil then
	
	if not (Wowam_Ut(term.ut)) then
		return false;
	end	
end

			
if term.pbcd~=nil and term.pbcdname~=nil then
	
	pbcdname_id=Wowam_Spell_Time(term.pbcdname)
	
	if pbcdname_id then
	
		if not (pbcdname_id>term.pbcd) then
			return false;
		end	
	end
end



if term.pr~=nil then
	
if not (UnitMana("player")>term.pr) then
	return false;
end	
end

if term.tr~=nil then
	
if not (UnitMana(wowam.spell.Target_UNID)>term.tr) then
	return false;
end	
end


if term.pl~=nil then

	if term.pl>100 then
	
	if not (UnitHealth("player")>term.pl) then
	return false;
	end
	else
		if not (Wowam_HealthCheck()>term.pl) then
			return false;
		end	
	end
end


if term.tl~=nil then
	
	if term.tl>100 then
	
		if not (UnitHealth(wowam.spell.Target_UNID)>term.tl) then
		return false;
		end
		
	else
		
		if not (Wowam_HealthCheckt()>term.tl) then
				return false;
		end	
	end

end


if term.fs~=nil then
	if not Wowam_Ac(term.fs)then
		return false;
	end
end



if term.pbn~=nil then
	if not (Wowam_PlayerBuffN(term.pbcdname)>term.pbn) then
		return false;
	end
end

if term.tbn~=nil then
	
	--DEFAULT_CHAT_FRAME:AddMessage(tostring(term.pbcdname) .. ".." .. tostring(term.tbn),192,0,192,0)
	if not (Wowam_TargetBuffN(term.pbcdname)>term.tbn) then
		return false;
	end
end



if term.prm~=nil then
	
if not (UnitMana("player")<term.prm) then
	return false;
end	
end

if term.trm~=nil then
	
	if not (UnitMana(wowam.spell.Target_UNID)<term.trm) then
		return false;
	end	
end


if term.pbnm~=nil then
	if not (Wowam_PlayerBuffN(term.pbcdname)<term.pbnm) then
		return false;
	end
end

if term.tbnm~=nil then
	
	--DEFAULT_CHAT_FRAME:AddMessage(tostring(term.pbcdname) .. ".." .. tostring(term.tbn),192,0,192,0)
	if not (Wowam_TargetBuffN(term.pbcdname)<term.tbnm) then
		return false;
	end
end


if term.plm~=nil then
	
	if term.plm>100 then
	
			if not (UnitHealth("player")<term.plm) then
			return false;
			end
	else
		
		if not (Wowam_HealthCheck()<term.plm) then
			return false;
		end	
	end
end

if term.tlm~=nil then
	
	if term.tlm>100 then
	
			if not (UnitHealth(wowam.spell.Target_UNID)<term.tlm) then
			return false;
			end
	else
		
		if not (Wowam_HealthCheckt()<term.tlm) then
			return false;
		end	
	end
end

if term.pbcdm~=nil and term.pbcdname~=nil then
	

pbcdname_id=Wowam_Spell_Time(term.pbcdname)

	if pbcdname_id then
	
		if not (pbcdname_id<term.pbcdm) then
			return false;
		end	
	end
end


if term.cf~=nil then
	
if not Wowam_Cf(term.cf) then
	return false;
end	
end

if term.ljd~=nil then
	

	--if not (GetComboPoints("player")>term.ljd) then
          if not (UnitPower("player",4)>term.ljd) then
		return false;
	end	

end

if term.ljdm~=nil then
	
--if not (GetComboPoints("player")<term.ljdm) then
if not (UnitPower("player",4)<term.ljdm) then
	return false;
end	
end


if term.pb~=nil then
	
if not (Wowam_BuffTime(term.pbcdname)>term.pb) then
	return false;
end	
end

if term.tb~=nil then
	--DEFAULT_CHAT_FRAME:AddMessage("term.tb:"..tostring(Wowam_TargetBuff(term.pbcdname)),192,0,192,0)
	
	
--if not (Wowam_DEBuffTime(name)<=term.tb) then
	if not (Wowam_TargetBuff(term.pbcdname)>term.tb) then
	return false;
end	
end

if term.pbm~=nil then
	--DEFAULT_CHAT_FRAME:AddMessage(term.pbcdname .. " --- " .. tostring(Wowam_BuffTime(term.pbcdname) .. "<" .. tostring(term.pbm)) ,192,0,192,0)
		
if not (Wowam_BuffTime(term.pbcdname)<term.pbm) then
	return false;
end	
end

if term.tbm~=nil then
	
	if not (Wowam_TargetBuff(term.pbcdname)<term.tbm) then
	return false;
end	
end


if term.pdb~=nil then
	
if not (Wowam_PlayerDEBuff(term.pbcdname)>term.pdb) then
	return false;
end	
end

if term.pdbm~=nil then
	
if not (Wowam_PlayerDEBuff(term.pbcdname)<term.pdbm) then
	return false;
end	
end


if term.tdb~=nil then
	
	if not (Wowam_DEBuffTime(term.pbcdname)>term.tdb) then
	return false;
end	
end

if term.tdbm~=nil then
	
	if not (Wowam_DEBuffTime(term.pbcdname)<term.tdbm) then
	return false;
end	
end

if term.zy~=nil then
if not Wowam_Class(wowam.Command.Text,term.zy) then
	return false;
end	
end


if term.zt~=nil then
	if not Wowam_Zt(term.zt) then
		return false;
	end	
end

if term.ztb~=nil then
--DEFAULT_CHAT_FRAME:AddMessage(name .. ":".. tostring(Wowam_Zt(term.ztb)),192,0,192,0)	
	if Wowam_Zt(term.ztb) then
		return false;
	end	
end



if term.zd~=nil then
	
local	affectingCombat = UnitAffectingCombat("player");
	
	if affectingCombat then
		affectingCombat=1
	else
		affectingCombat=0
	end
	
if not (affectingCombat==term.zd) then
	return false;
end	


end


if term.trt~=nil then
	if not (UnitPowerType(wowam.spell.Target_UNID)==term.trt) then
		return false;
	end	
end


if term.yz~=nil then
	if not (term.yz==wowam.Event.Combat.DODGE.START) then
		return false;
	end	
end

if term.hj~=nil then
	if not (term.hj==wowam.Event.Combat.PARRY.START) then
		return false;
	end	
end


if term.ty~=nil then
	if not Wowam_Ty(wowam.Command.Text,term.ty) then
		return false;
	end	
end


if term.jl~=nil then
	--local yjcwow_TargetRange_ok=Wowam_TargetRange()
	
	local yjcwow_TargetRange_ok= amjl(wowam.spell.Target_UNID)
	
	if not (yjcwow_TargetRange_ok>term.jl) then
	return false;
	end	
end

if term.jlm~=nil then
	--local yjcwow_TargetRange_ok=Wowam_TargetRange()
	local yjcwow_TargetRange_ok= amjl(wowam.spell.Target_UNID)
	if not (yjcwow_TargetRange_ok<term.jlm and yjcwow_TargetRange_ok >-1 ) then
	return false;
	end	
end



if term.ptmh~=nil then
		
	if not (Wowam_Ptmh()>term.ptmh) then
	return false;
end	
end

if term.ptmhm~=nil then
		
	if not (Wowam_Ptmh()<term.ptmhm) then
	return false;
end	
end

if term.zb~=nil then
		
	if not (Wowam_GetItemName(term.zb,term.pbcdname)) then
	return false;
end	
end

if wowam.Command.macro_on then
	return true;
end

if strsub(name,1,4)== "yjqs" then
	
	local _,a1,a2,a3 = strsplit(";", name)
	
	--DEFAULT_CHAT_FRAME:AddMessage(a1 .. " - " .. a2.. " - " .. tostring(a3),192,0,192,0);

	--"Magic,Disease,Poison"
	--if not a3 then
	--	a3 = wowam.spell.Target_UNID
	--end
	if Wowam_DDbuff(a1,a2,a3) then
		return true;
	end
	
	return false;
	
	--if Wowam_SDB(name) then
	--return true;
	--end
	
end




if strsub(name,1,1)=="-" then
	
	
	
		if name == "-TOMPAUSE" and wowam.tomtom.pause==1 then
			
			wowam.tomtom.pause=0
			return true;	
		elseif name == "-TOMPAUSE" and wowam.tomtom.pause==0 then
			return false;
			
		end
			
		if name == "-TOMMOVE" and wowam.tomtom.pause==0 then
			
			wowam.tomtom.pause=1
			
			return true
			
		elseif name == "-TOMMOVE" and wowam.tomtom.pause==1 then
			
			return false;
		
		end
		
	return true
end



local Isa,Macro_Spell ;
 Macro_Spell = strsub(name,1,1) ;
 
 if term.spell then
	
		return isrunspell(term.spell,wowam.spell.Target_UNID)
 end

if Macro_Spell == "/" then
	
return true;	
end



		return isrunspell(name,wowam.spell.Target_UNID)
	
end
	
	
function Wowam_zyzh(cname)
		
		if cname==nil then
			return nil;
		end
		
		cname=gsub(cname,"‘","'")
		cname=gsub(cname,"“",'"')
		
		cname=gsub(cname,"，",",")
						
		cname=gsub(cname,">","")
		
		
		cname=strlower(cname)
		cname=gsub(cname,":zt~=",":ztb")
		
		cname=gsub(cname,":dz",":qxz")
		cname=gsub(cname,":xd",":dly")
		cname=gsub(cname,":74",":qs")
		cname=gsub(cname,"<","m")
		
		
		return cname;
	end
	
	
function Wowam_JnFj(...) --分解成數組
	local jn={},i;
	
		
		 
		for i=1 , 30000 do
		
			jn[i] = select(i,...)
			
			if not jn[i] then
			return jn;
			end

		end			
	
	
		return jn;
	end

function amif(cname)
wowam.Command.macro_on = true;
local ct = wowam_comman(cname)
wowam.Command.macro_on = false;
return ct;
end
	
function wowam_comman(cname) --分解出技能和按鍵 (!1)
	local i=0;
		
	local term={};
	
	local jn =nil;
	local key =nil;
	local n=0;
	local n1=0;

	wowam.SmartDebuff.Press=0;

	cname=Wowam_MACRO_Lj(cname)
	cname=Wowam_zyzh(cname)
	
	wowam.Command.Text=cname
	
	
	local a, b, c = strsplit('"', cname)
	local a1, b1, c1 = strsplit('#', cname)
	local a2, b2, c2 = strsplit('*', cname)
	local a3, b3, c3 = strsplit('%', cname)
	
	
	
	 _, _, term.pb = strfind(cname, ":pb(%d+)");
	 _, _, term.tb = strfind(cname, ":tb(%d+)");
	 _, _, term.pr = strfind(cname, ":pr(%d+)");
	 _, _, term.tr = strfind(cname, ":tr(%d+)");
	 _, _, term.pl = strfind(cname, ":pl(%d+)");
	 _, _, term.tl = strfind(cname, ":tl(%d+)");
	 _, _, term.pbcd = strfind(cname, ":pbcd(%d+)");
	 _, _, term.pbn = strfind(cname, ":pbn(%d+)");
	 _, _, term.tbn = strfind(cname, ":tbn(%d+)");
	 _, _, term.cf = strfind(cname, ":cf(%d+)");
	
	
	 _, _, term.pbm = strfind(cname, ":pbm(%d+)");
	 _, _, term.tbm = strfind(cname, ":tbm(%d+)");
	 _, _, term.prm = strfind(cname, ":prm(%d+)");
	 _, _, term.trm = strfind(cname, ":trm(%d+)");
	 _, _, term.pbnm = strfind(cname, ":pbnm(%d+)");
	 _, _, term.tbnm = strfind(cname, ":tbnm(%d+)");
	 _, _, term.plm = strfind(cname, ":plm(%d+)");
	 _, _, term.tlm = strfind(cname, ":tlm(%d+)");
	 _, _, term.pbcdm = strfind(cname, ":pbcdm(%d+)");
	 _, _, term.ljd = strfind(cname, ":ljd(%d+)");
	 _, _, term.ljdm = strfind(cname, ":ljdm(%d+)");
	
	 _, _, term.pdb = strfind(cname, ":pdb(%d+)");
	 _, _, term.tdb = strfind(cname, ":tdb(%d+)");
	 _, _, term.pdbm = strfind(cname, ":pdbm(%d+)");
	 _, _, term.tdbm = strfind(cname, ":tdbm(%d+)");
	
	 _, _, term.zy = strfind(cname, ":zy(%d+)");
	
	 _, _, term.ft = strfind(cname, ":ft(%d+)");
	 
	
	 _, _, term.peta = strfind(cname, ":peta(%d+)");
	
	 _, _, term.zt = strfind(cname, ":zt(%d+)");
	 _, _, term.zd = strfind(cname, ":zd(%d+)");
	 _, _, term.trt = strfind(cname, ":trt(%d+)");
	
	 _, _, term.yz = strfind(cname, ":yz(%d+)");
	
	 _, _, term.ztb = strfind(cname, ":ztb(%d+)");
	 _, _, term.hj = strfind(cname, ":hj(%d+)");
	 _, _, term.ut = strfind(cname, ":ut(%d+)");
	 _, _, term.ty = strfind(cname, ":ty(%d+)");
	 _, _, term.jl = strfind(cname, ":jl(%d+)");
	 _, _, term.jlm = strfind(cname, ":jlm(%d+)");
	 _, _, term.ptmh = strfind(cname, ":ptmh(%d+)");
	 _, _, term.ptmhm = strfind(cname, ":ptmhm(%d+)");
	 _, _, term.zb = strfind(cname, ":zb(%d+)");
	
	 _, _, term.dkxp = strfind(cname, ":dkxp(%d+)");
	 _, _, term.dkhx = strfind(cname, ":dkhx(%d+)");
	 _, _, term.dkbs = strfind(cname, ":dkbs(%d+)");
	 _, _, term.dksw = strfind(cname, ":dksw(%d+)");
	 _, _, term.dkxpm = strfind(cname, ":dkxpm(%d+)");
	 _, _, term.dkhxm = strfind(cname, ":dkhxm(%d+)");
	 _, _, term.dkbsm = strfind(cname, ":dkbsm(%d+)");
	 _, _, term.dkswm = strfind(cname, ":dkswm(%d+)");
	 _, _, term.gj = strfind(cname, ":gj(%d+)");
	 _, _, term.zmb = strfind(cname, ":zmb(%d+)");





	if (GetTime() - wowam.spell.Delay.StartTime )<=0.01 then
						
		return false;
			
	end;

		wowam.spell.Delay.time_ok=0
		wowam.spell.Delay.time=0


	if term.ft==nil then
		
		
			
			if not amGetUnitName("target") then
				wowam.spell.Target_UNID = "player"
			else
				wowam.spell.Target_UNID = "target"
			end
			
	
	elseif term.ft=="1000" then
	wowam.spell.Target_UNID="nogoal"
	elseif term.ft=="0" then
	wowam.spell.Target_UNID="player"
	elseif term.ft=="1" then
		wowam.spell.Target_UNID="focus"
	elseif term.ft=="2" then	
		wowam.spell.Target_UNID="pet"
	elseif term.ft=="3" then	
		wowam.spell.Target_UNID="mouseover"
	
	elseif term.ft=="4" then	
		wowam.spell.Target_UNID="npc"
		
	elseif strlen(term.ft)==3 then
	
		local raidn_type=strsub(term.ft,1,1)
		local raidn_n=strsub(term.ft,2,3)

		if raidn_type=="1" then
			raidn_n=tonumber(raidn_n)
			wowam.spell.Target_UNID="raid" .. raidn_n
			
		elseif raidn_type=="2" then
			raidn_n=tonumber(raidn_n)
			wowam.spell.Target_UNID="raidpet" .. raidn_n
		end
	
	elseif strlen(term.ft)==2 then
	
		local raidn_type=strsub(term.ft,1,1)
		local raidn_n=strsub(term.ft,2,2)

		if raidn_type=="1" then
			
			wowam.spell.Target_UNID="party" .. raidn_n
			
		elseif raidn_type=="2" then
			
			wowam.spell.Target_UNID="partypet" .. raidn_n
		end


	else
		
		wowam.spell.Target_UNID="target"
	end

--DEFAULT_CHAT_FRAME:AddMessage(wowam.spell.Target_UNID,192,0,192,0)	

--"focus" 
--當前玩家使用/focus命令所選擇到的對象 (2.0.0新加) 

--"player" 
--當前玩家 

--"pet" 
--當前玩家的寵物 

--"partyN" 
--當前玩家小隊內第N個隊友，N取值範圍1-5 

--"partypetN" 
--當前玩家小隊內第N個隊友的寵物，N取值範圍1-5 

--"raidN" 
--當前玩家團隊內第N個隊友，N取值範圍1-40 

--"raidpetN" 
--當前玩家團隊內第N個隊友的寵物，N取值範圍1-40 

--"target" 
--當前玩家的對象 

--"mouseover" 
--當前玩家鼠標經過的對象 

--"npc" or "NPC" 
--當前玩家進行對話的NPC 

--"玩家名字" 
--這個玩家名字,必須是完整的名字,而且該玩家必須是你的團友或隊友或寵物, 否則你將不能使用玩家名字作為UnitID. 



		if (b~=nil) and (c==nil) then
		DEFAULT_CHAT_FRAME:AddMessage("技能格式錯誤：正確的是 " .. '"' .. "技能".. '"' .." 用引號括起來",192,0,192,0)	
		return false;
		
		end	

		if (b~=nil) then
			jn=b
		
		end
		


		if (b1~=nil) and (c1==nil) then
		DEFAULT_CHAT_FRAME:AddMessage("按鍵格式錯誤：正確的是 #按鍵# 用#括起來",192,0,192,0)	
		
		return false;
		
		end	

		if (b1~=nil) then
			key=b1;
			Wowam_RunCommand(key);
			return false;
		end


		if (b2~=nil) and (c2==nil) then
		DEFAULT_CHAT_FRAME:AddMessage("目標法術格式錯誤：正確的是 *法術* 用*括起來",192,0,192,0)	
		
		
		return false;
		
		end	

		if (b2~=nil) then
			term.fs=b2
		end

		if (b3~=nil) and (c3==nil) then
		DEFAULT_CHAT_FRAME:AddMessage("檢測BUFF格式錯誤：正確的是 %BUFF% 用%括起來",192,0,192,0)	
		
		
		return false;
		
		end	

		if (b3~=nil) then
			term.pbcdname=b3
			
		else
			if (b~=nil) then
				term.pbcdname=b
			end
				
		end


	if wowam.Command.macro_on then
		
		term.Command_Text = "";
		
		local Wowam_Spell_Run_TEMP = Wowam_Spell_Run(term);
		--DEFAULT_CHAT_FRAME:AddMessage(tostring(Wowam_Spell_Run_TEMP),192,0,192,0);
		return Wowam_Spell_Run_TEMP ;
	end

		local spell_exit,spell_exit1;
		local LZT_JR_RUN_OK;
		

	if jn then
		
			--local ls_jn={};
			--ls_jn=Wowam_JnFj(strsplit(",", jn));
			
			local ls_jn = { strsplit(",",jn) }
	
	
	
			--for i=1 , 30 do
			
			for i,v in ipairs(ls_jn) do
		
					--if not ls_jn[i] then
					--	break;
					--end
					
				
			
					--local LZT_ZHJN_LS= Wowam_ZHJN(ls_jn[i])
					--Wowam_Message(v)
					local LZT_ZHJN_LS= Wowam_ZHJN(v)
	
	--------------------------------------------

					cname=strtrim(LZT_ZHJN_LS)
					
				
				
					local Macro_Spell ;
					spell_exit = nil;
					
					local TEMP_SEPLL1,TEMP_SEPLL2,TEMP_SEPLL3,TEMP_SEPLL4 = string.find(cname, "(.+)&(.+)")
					
					term.spell = nil;
					
					if TEMP_SEPLL1 and TEMP_SEPLL2 then
					cname = TEMP_SEPLL4
					term.spell = TEMP_SEPLL3;
					end
					
			 		Macro_Spell = strsub(cname,1,1) ;
					
					term.Command_Text = cname;
			 		
			 		
	 	
				 		if (Macro_Spell ~= "/" and Macro_Spell ~= "-" and strsub(cname,1,4)~= "yjqs") or term.spell then
				 	
									-----if not Wowam_GetSpellinf(cname) then
										--Wowam_Message(wowam.Colors.RED..cname..wowam.Colors.CYAN.." 技能名稱錯誤，請檢查！");
										------return false
									------end
									--Wowam_Message(cname)
									--DEFAULT_CHAT_FRAME:AddMessage( "1 " .. tostring(term.spell) ,192,0,192,0);
									
									if term.spell then
									spell_exit,spell_exit1 = Wowam_GetSpellinf(term.spell)
									else
									spell_exit,spell_exit1 = Wowam_GetSpellinf(cname)
									end
									
									if spell_exit then
									--print(Wowam_Spell_Run(term))
										if  Wowam_Spell_Run(term) then
										
											if term.spell then
											--DEFAULT_CHAT_FRAME:AddMessage( "a " .. tostring(cname) ,192,0,192,0);
												Wowam_Runsp(cname);
											else
												if spell_exit1 == 4 then
												--DEFAULT_CHAT_FRAME:AddMessage( "b " .. tostring(cname) ,192,0,192,0);
												amrun( cname );
												else
												--DEFAULT_CHAT_FRAME:AddMessage( "c " .. tostring(cname) ,192,0,192,0);
												Wowam_Runsp( "/cast [target=" ..wowam.spell.Target_UNID .."]".. cname );
												end
												
											end
											return true;
										end
									end
						else
							
							if Wowam_Spell_Run(term) then
							
								if strsub(cname,1,4)== "yjqs"then
										return true;
								elseif Macro_Spell == "-" then
										
										
										
										 Spell_name = strsub(cname,2,string.len(cname));
										 Wowam_RunCommand(Spell_name);
										 return true;
										 --DEFAULT_CHAT_FRAME:AddMessage(Spell_name .. " + " .. tostring(LZT_JR_RUN_OK) ,192,0,192,0);
								else
								--DEFAULT_CHAT_FRAME:AddMessage( "d " .. tostring(cname) ,192,0,192,0);
										Wowam_Runsp(cname);
										return true;
									
									
								end
							end
						
								
							
						end
						
						
						
				--[[		
				if spell_exit then
				
					term.Command_Text = cname;
					local LZT_JR_RUN_OK = Wowam_Spell_Run(term)
					
					

						--if TEMP_SEPLL1 and TEMP_SEPLL2 and LZT_JR_RUN_OK then
						
							-----if not isrunspell(TEMP_SEPLL3,wowam.spell.Target_UNID) then
							-----return false ;
							-----end
							--LZT_JR_RUN_OK = isrunspell(TEMP_SEPLL3,wowam.spell.Target_UNID);
						
						--end
					
					--DEFAULT_CHAT_FRAME:AddMessage(cname .. " + " .. tostring(LZT_JR_RUN_OK) ,192,0,192,0);
					
					
					if LZT_JR_RUN_OK then
					
								-----if not LZT_JR_RUN_OK then	
								-----return false ;
								-----end
								
								Wowam_Message("1 " .. cname)
								
								if strsub(cname,1,4)== "yjqs"then
									return true;
								end
								
								
								--DEFAULT_CHAT_FRAME:AddMessage(cname .. " + " .. tostring(LZT_JR_RUN_OK) ,192,0,192,0);
						
						
								local Spell_name;

								if Macro_Spell ~= "/" and Macro_Spell ~= "-" then
								
									--Spell_name = "/cast " .. cname ;
									
									--Wowam_Runsp(Spell_name);
									--return true;
									
								elseif Macro_Spell == "-" then
									
									
									
									 Spell_name = strsub(cname,2,string.len(cname));
									 Wowam_RunCommand(Spell_name);
									 return true;
									 --DEFAULT_CHAT_FRAME:AddMessage(Spell_name .. " + " .. tostring(LZT_JR_RUN_OK) ,192,0,192,0);
								else
									Wowam_Runsp(cname);
									return true;
								
								
								end
								
								
					end
					
				end
				]]--
	----------------------------------------
	
	
			end
	
		return false;
	
	end





return false;


end


function Wowam_Cf(f) --'ACF 嘲諷
if f==0 then
		if not UnitIsUnit("player","targettarget") and UnitIsEnemy("target", "player") then 
				return true
		else
				return false

		end;

elseif f==1 then

 		if UnitIsUnit("targettarget", "player") and UnitIsEnemy("target", "player") then

				return true
		else
				return false

		end;

elseif f==2 then
	

if not UnitIsUnit("player","targettarget") and UnitIsEnemy("target", "player") and amGetUnitName("targettarget") then 
				return true
		else
				return false

		end;


--解DEBUFF開始
elseif f==6 or f==7 or f==8 or f==9 then
local unit,debuff,i,_,debuffType
	if UnitExists("target") then
		if UnitCanAttack("player","target") then
			unit="player"
		else
			unit="target"
		end
	else
		unit="player"
	end
	if f==6 then
		debuff="Magic"
	elseif f==7 then
		debuff="Disease"
	elseif f==8 then
		debuff="Poison"
	elseif f==9 then
		debuff="Curse"
	end
		i=1
		while UnitDebuff(unit,i) do
		_,_,_,_,debuffType=UnitDebuff(unit,i);
	if debuffType==debuff then
		return true
	end
	i=i+1
end
--解DEBUFF結束  

		

end


return false

end


function Wowam_RunCommand(C)
	
	
		
		
	C=strupper(C)
	
	temp_n = 34 - string.len(C);  
	
	local A1 = nil;
	local A2 = nil;
	local A3 = nil;
	local A4 = nil;
	local AA = nil;
	local ccommand;
	
	local auto_key = strsub(C,1,1) ;
	local auto_key_n = string.len(C)
	
	local down_up_key = "";
				
	if C == "AUTOKEY"  then
		ccommand = tonumber("500000000001");
		--wowam.Keys.AutoOn=1;
		
	
		Wowam_Run_Key_Command("5",ccommand)
		
		
		return true
	elseif C == "OFFKEY" then
		ccommand = tonumber("500000000002");
		wowam.Keys.AutoOn=0;
		Wowam_Run_Key_Command("5",ccommand)
		
		return true
		
	elseif (auto_key == "-" or auto_key == "_") and auto_key_n>1 then
		
			
				if C == "--" then
					
					down_up_key = "-";
					
					C = GetBindingKey("TURNRIGHT") .. "-" .. GetBindingKey("TURNLEFT") .. "-" .. GetBindingKey("MOVEFORWARD");
				
				
				
				else
						C = strsub(C,2,string.len(C));
						
						if auto_key == "_" then
							down_up_key = "_";
							
						else
							down_up_key = "-";
						
						end
								
				end
				
	elseif C == "TOMPAUSE" then
		
		--wowam.tomtom.pause=0
		--DEFAULT_CHAT_FRAME:AddMessage(tostring(wowam.tomtom.pause),192,0,192,0)
		return true;	
		
	elseif C == "TOMMOVE" then
		
		--wowam.tomtom.pause=1
		
		--DEFAULT_CHAT_FRAME:AddMessage(tostring(wowam.tomtom.pause),192,0,192,0)
		return true;	
		
		
	end
	

		
				C=gsub(C,"%-%-","%-%!")
			
				C=gsub(C,"%-","|")

				C=gsub(C,"!","%-")
	
				
		
				
				
				A1,A2,A3,A4 = strsplit("|", C)
				
		
				
				if A1 == nil then
					
					return false
					
					--A1="000";
				else
					
					A1 = Wowam_JsKey(A1)
					
					if down_up_key == "-" then
						A1 = A1 +512;
						
					elseif down_up_key == "_" then
						A1 = A1 +256;
						
					else
						
					end
					--DEFAULT_CHAT_FRAME:AddMessage(down_up_key .. C)
					A1=string.format("%03d", A1)
				end
		
		
				if A2 == nil then
					
					A2="000";
				else
					A2 =Wowam_JsKey(A2)
					A2=string.format("%03d", A2)
				end
		
		
		
				if A3 == nil then
					
					A3="000";
				else
					
					A3 =Wowam_JsKey(A3)
					A3=string.format("%03d", A3)
				end
		
		
				if A4 == nil then
					
					A4="000";
				else
					
					A4 =Wowam_JsKey(A4)
					A4=string.format("%03d", A4)
				end
		
			
			if A1 == "255" or A2 == "255" or A3 == "255" or A4 == "255" then
				
				return false
				
			end
		
				ccommand =  A1 .. A2 .. A3 .. A4 ;
	
	                           
      Wowam_Run_Key_Command("4",ccommand)                       

	
	
	
	wowam.spell.Delay.StartTime=GetTime();
	
	return C;
	
end

function Wowam_Run_Key_Command(ctype ,spell)

	Wowam_Runsp_old(spell,ctype)
end


wowam.cls={{101,112,100},{98,111,101},{112,110,110}}

		
function Wowam_Ac(spell) ---'打斷法術	
	
	local sp=nil;
	
	
if spell==nil then
	return false;
end
if UnitCastingInfo(wowam.spell.Target_UNID) or  UnitChannelInfo(wowam.spell.Target_UNID) then	
	
else
	
	return false;
end

if  (spell=="x") or (spell=="") then
	
return true;	
end

if UnitCastingInfo(wowam.spell.Target_UNID) then	
	sp=UnitCastingInfo(wowam.spell.Target_UNID)
else
	sp=UnitChannelInfo(wowam.spell.Target_UNID)
end

spell=Wowam_zhbuffname(spell)
sp=Wowam_zhbuffname(sp)

if strfind(spell,sp) then

return true;
end

--if (UnitCastingInfo(wowam.spell.Target_UNID) and spell==nil) or (UnitCastingInfo(wowam.spell.Target_UNID)==spell) or (UnitCastingInfo(wowam.spell.Target_UNID) and spell=="x")  or (UnitCastingInfo(wowam.spell.Target_UNID) and spell=="") then	
	
--	return true;
	
--end
	
	return false;
end	


function Wowam_BuffTime(name) --自身有益法術剩餘時間
if not name then
		return -1
	end
	
	local h = Wowam_DKIRunesbuff(name);
	
	if h then
		
		return h ;
	end
	
	local i = 0;
	local debuffApplications = nil;
	local btime= 0;
	local cd=nil;
	local find_ok=nil;
	
	local debuffTexture, rank, iconTexture, count, debuffType, duration, timeLeft,isMine, isStealable;
	local ls_jn={};
	
	
	name=Wowam_zhbuffname(name)
	
	local im=strsub(name,1,1);
	ls_jn=Wowam_JnFj(strsplit(",",name))
	


if cd == nil and im ~= "_" then
		
							for k=1 , 30 do
								
									if not ls_jn[k] then
									break;
									end
								--	DEFAULT_CHAT_FRAME:AddMessage("name1:" .. tostring(ls_jn[k]) ,192,0,192,0);
									 find_ok=Wowam_Totem(ls_jn[k])
									if find_ok then
										cd = find_ok
									break;
									end
									
							end
 end
 
if cd ==nil  then	
	
	for i = 1,40 do
	 debuffTexture, rank, iconTexture, count, debuffType, duration, timeLeft,isMine, isStealable = UnitBuff("player",i);
	
	if not debuffTexture then
		break;
		end
		
	
	if debuffTexture then
		
		debuffTexture=Wowam_zhbuffname(Wowam_zyzh(debuffTexture))
		
							for k=1 , 30 do
									if not ls_jn[k] then
									break;
									end
									
									if ls_jn[k]== debuffTexture then
										find_ok=ls_jn[k]
										--DEFAULT_CHAT_FRAME:AddMessage(tostring(find_ok) ,192,0,192,0);
									break;
									end
									
							end
		
			
			
				if timeLeft and find_ok then
					
										
				
					if im == "_" and isMine==nil then
						if duration == 0 and timeLeft==0 then
							cd=  1
						else
							cd=timeLeft -  GetTime()
						end
					elseif im ~= "_" and isMine == "player" then
						if duration == 0 and timeLeft==0 then
							cd=  1
						else
							cd=timeLeft -  GetTime()
						end
					elseif im == "!" then
						if duration == 0 and timeLeft==0 then
							cd=  1
						else
							cd=timeLeft -  GetTime()
						end
					elseif im ~= "!" and im ~= "_" then
						
						if duration == 0 and timeLeft==0 then
							cd=  1
						else
							cd=timeLeft -  GetTime()
						end
				
					end
					
					break;

				end
			
			
		
		
	end
	end;
end	
	
	
	
	
	
		
		
	
		if cd == nil then
			
			for k=1 , 30 do
									if not ls_jn[k] then
									break;
									end
						find_ok = wowam.spell.Hot.times[ls_jn[k]]
				if find_ok then
					break;
				end
			end
			
						
				if find_ok then
					local hot_time=GetTime()
		
					if hot_time<find_ok then
								
						cd= find_ok-hot_time
					
					end
		
				end
		end

	
	
	if cd==nil then
	
	cd= 0;
	end
	
	
	
	return cd;
	

end;


function Wowam_DEBuffTime(name) --目標減益法術剩餘時間 
	
	
	if not name then
		return -1
	end

	local i = 0;
	local debuffApplications = nil;
	local btime= 0;
	
	local debuffTexture, rank, iconTexture, count, debuffType, duration, timeLeft,isMine, isStealable
	
	name=Wowam_zhbuffname(name)
	local im=strsub(name,1,1);
	
	for i = 1,40 do
		
		
	 debuffTexture, rank, iconTexture, count, debuffType, duration, timeLeft,isMine, isStealable = UnitDebuff(wowam.spell.Target_UNID,i);
	 --DEFAULT_CHAT_FRAME:AddMessage(tostring(i) .. ":" .. tostring(debuffTexture) .. tostring(im),192,0,192,0)
	 if not debuffTexture then
		break;
		end

		
	
		debuffTexture=Wowam_zhbuffname(Wowam_zyzh(debuffTexture))
		
		
		
		if debuffTexture then
			
			
			if  strfind(name,debuffTexture) then
				
		if timeLeft then
				--DEFAULT_CHAT_FRAME:AddMessage(debuffTexture .. tostring(im),192,0,192,0)
				
			if im == "!" then
				return timeLeft- GetTime()
			elseif im == "_" and isMine==nil then
				return timeLeft- GetTime()
			elseif im ~= "_" and isMine == "player" then
				return timeLeft- GetTime()
			
			else	
				return -1
			end

		end
		
		end;
		end;
	end;
	
	
	return -1



end;


function Wowam_Zt(index) ---'姿態
local _,_,a = GetShapeshiftFormInfo(index);

return a;
end;


   
function Wowam_HealthCheck()
	local a = UnitHealth("player");
	local b = UnitHealthMax("player");
	return ((a / b) * 100);
end;


function Wowam_TargetBuffN(cname) --'目標Debuff目前累加的層數
	
local i, debuffTexture, debuffTimes,name;
	
  
	for i = 1, 40 do
		name, _, _, count = UnitDebuff(wowam.spell.Target_UNID, i);
		
			
		if not name then
		break;
		end
		
			
			
			if name then
				
				name=Wowam_zhbuffname(Wowam_zyzh(name))
				cname=Wowam_zhbuffname(cname)
				
			if  strfind(cname,name) then
			
			
			return count;
		end;
	end
	end;
	
	for i = 1, 40 do
		name, _, _, count = UnitBuff(wowam.spell.Target_UNID, i);
		
		if not name then
		break;
		end
		
			
			if name then
				
								
				name=Wowam_zhbuffname(Wowam_zyzh(name))
				cname=Wowam_zhbuffname(cname)
				
				
			if  strfind(cname,name) then
			
			return count;
		end;
	end
	end;
	
	
	
	return 0;
end;

function Wowam_PlayerBuffN(cname) --'自身Debuff目前累加的層數
	
local i, debuffTexture, debuffTimes,name;
	
  
	for i = 1, 40 do
		name, _, _, count = UnitDebuff("player", i);
		
		if not name then
		break;
		end
		
		
		
		if name then
				
		
				name=Wowam_zhbuffname(Wowam_zyzh(name))
				cname=Wowam_zhbuffname(cname)
				
		
		if  strfind(cname,name) then
			return count;
		end;
	end
	end;
	
	for i = 1, 40 do
		name, _, _, count = UnitBuff("player", i);
		
		if not name then
		break;
		end
		
			
			if name then
				
				
				name=Wowam_zhbuffname(Wowam_zyzh(name))
				cname=Wowam_zhbuffname(cname)
				
				
			if  strfind(cname,name) then
			
			
			return count;
		end;
	end
	end;
	
	
	return 0;
end;


function Wowam_HealthCheckt()
	local a = UnitHealth(wowam.spell.Target_UNID);
	local b = UnitHealthMax(wowam.spell.Target_UNID);
	return ((a / b) * 100);
end;

amrsdt=getglobal("RunScript");

function Wowam_PlayerDEBuff(name) --自身減益法術剩餘時間
if not name then
		return -1
	end
	
	local i = 0;
	local debuffApplications = nil;
	local btime= 0;
	
	local debuffTexture, rank, iconTexture, count, debuffType, duration, timeLeft,isMine, isStealable
	
	name=Wowam_zhbuffname(name)
	local im=strsub(name,1,1);
	
	for i = 1,40 do
	 debuffTexture, rank, iconTexture, count, debuffType, duration, timeLeft,isMine, isStealable = UnitDebuff("player",i);
		
		if not debuffTexture then
		break;
		end
		
		if debuffTexture then
			
			debuffTexture=Wowam_zhbuffname(Wowam_zyzh(debuffTexture))
			
			
				if  strfind(name,debuffTexture) then
				
						if timeLeft then
								
								
							if im == "!" then
								return timeLeft- GetTime()
							elseif im == "_" and isMine==nil then
								return timeLeft- GetTime()
							elseif im ~= "_" and isMine == "player" then
								return timeLeft- GetTime()
							
							else	
								return -1
							end
				
						end
				
		
				end;
		end
	end;
	
	
	
	return -1



end;

function Wowam_TargetBuff(name) --目標有益法術剩餘時間
if not name then
		return false
	end
	
	local i = 0;
	local debuffApplications = nil;
	local btime= 0;
	
	local debuffTexture, rank, iconTexture, count, debuffType, duration, timeLeft,isMine, isStealable;
		
	name=Wowam_zhbuffname(name)
	local im=strsub(name,1,1);
	
	
	for i = 1,40 do
	 debuffTexture, rank, iconTexture, count, debuffType, duration, timeLeft,isMine, isStealable = UnitBuff(wowam.spell.Target_UNID,i);
	
		if not debuffTexture then
		break;
		end
		
	
	
		if debuffTexture then
			
			debuffTexture=Wowam_zhbuffname(Wowam_zyzh(debuffTexture))
			
			
			
						if  strfind(name,debuffTexture) then
								
										
								if timeLeft then
									
								--	DEFAULT_CHAT_FRAME:AddMessage(tostring(i) .. "-2-" .. tostring(debuffTexture) .. tostring(isMine).. tostring("\+"),192,0,192,0)
									if im == "!" then
										--DEFAULT_CHAT_FRAME:AddMessage(tostring(i) .. "--" .. tostring(debuffTexture) .. tostring(isMine).. tostring("\+"),192,0,192,0)
										return timeLeft- GetTime()
									elseif im == "_" and isMine==nil then
										return timeLeft- GetTime()
									elseif im ~= "_" and isMine == "player" then
										return timeLeft- GetTime()
									
							
									else	
										return -1
									end
									
								end
						
						
						end;
		end
	end;
	
	
	
	return -1

end;

function Wowam_Ty(name,ty)
local Class=nil;
	
	Class=UnitCreatureType(wowam.spell.Target_UNID)
	
	if Class then
		Class=":" .. Class
	
		
if strfind(name,Class) and ty==1 then
	
	return true
end


if strfind(name,Class)==nil and ty==0 then
	
	return true
end
	
	
	
		
		
		return false;	
		
	end
end

function Wowam_Class(name,zy)
local Class=nil;


	
 _,Class  = UnitClass(wowam.spell.Target_UNID)
--DEFAULT_CHAT_FRAME:AddMessage(tostring(Class),192,0,192,0)
--DEFAULT_CHAT_FRAME:AddMessage(gsub(tostring(name),":","|"),192,0,192,0)
if Class==nil then
	return false;
end

--"WARLOCK" = "術士" 
--"WARRIOR" = "戰士" 
--"HUNTER" = "獵人" 
--"MAGE" = "法師" 
--"PRIEST" = "牧師" 
--"DRUID" = "德魯伊" 
--"PALADIN" = "聖騎士" 
--"SHAMAN" = "薩滿祭司" 
--"ROGUE" = "盜賊" (盜賊) 



			if(Class=="WARRIOR") then 
			Class="zs" 
			elseif(Class=="PRIEST") then 
			Class="ms"
			elseif(Class=="PALADIN") then 
			Class="qs" 
			elseif(Class=="MAGE" ) then 
			Class="fs" 
			elseif(Class=="ROGUE") then 
			Class="qxz"
			elseif(Class=="DRUID") then 
			Class="dly"
			elseif(Class=="SHAMAN") then 
			Class="sm"
			elseif(Class=="WARLOCK") then 
			Class="ss"
			elseif(Class=="HUNTER") then 
			Class="lr"
			elseif(Class=="DEATHKNIGHT") then
			Class="dk"
			else
			return true;
			end 
	--DEFAULT_CHAT_FRAME:AddMessage(tostring(UnitCastingInfo(focus)),192,0,192,0)
	if strfind(name,":" .. Class) then
		if zy==1 then
			
		return true
		end
		
	else
		if zy==0 then
			
		return true
		end
		
		
		
		end
		
		return false;
end

function LZT_PetAction() --寵物技能條技能對照表
	DEFAULT_CHAT_FRAME:AddMessage("寵物技能條技能對照表",192,0,192,0)
	
for i=1, NUM_PET_ACTION_SLOTS, 1 do
      local name, subtext, texture, isToken, isActive, autoCastAllowed, autoCastEnabled = GetPetActionInfo(i);
      
      --if not name then
      --	break;
      	
     -- end
      DEFAULT_CHAT_FRAME:AddMessage("(" ..tostring(i) .. ") 技能名:" .. (name or "") ,192,0,192,0)
      print(texture)
    end
  end
  

--[[
Wowam_Old_ChatFrame_OnEvent = ChatFrame_OnEvent;
function ChatFrame_OnEvent(...)
	
	local event = select(2,...)
	--DEFAULT_CHAT_FRAME:AddMessage(src ,192,0,192,0)
	
	if ( event == "CHAT_MSG_WHISPER_INFORM" or event == "CHAT_MSG_WHISPER") then
		
			--DEFAULT_CHAT_FRAME:AddMessage(arg1 ,192,0,192,0)
		
	end
	
	
	
	
	Wowam_Old_ChatFrame_OnEvent(...);
end
--]]
  

--/print GetMacroInfo(GetMacroIndexByName("name"))
--/run print(GetMouseFocus():GetName())

--DcrMicroUnit1
--/print this:GetParent():GetName()
--/print MainMenuBarPageNumber:GetText()

--/print this:GetID()

--/print GameTooltip:GetText()

--/print CURRENT_ACTIONBAR_PAGE
--/print GameTooltip:GetText("MultiBarLeftButton1")

--MultiBarLeftButton1

--/print GetBindingKey("BONUSACTIONBUTTON1")

--DEFAULT_CHAT_FRAME:AddMessage(tostring(GetBindingKey("BONUSACTIONBUTTON1")),192,0,192,0)

--DEFAULT_CHAT_FRAME:AddMessage(GetBindingAction("3"),192,0,192,0)


function Wowam_ZHJN(n)

wowam.spell.Delay.time=0

local Macro_Spell = strsub(n,1,1) ;

if Macro_Spell == "/" then
	return n
end

local nx=gsub(n,"%s","")

local _, _, ls_n, ls_n1 = string.find(nx, "(.-)-(%d+)")

local ydy= string.find(nx, "=")

if ydy==nil then
if ls_n then
	
	ls_n=gsub(ls_n,"-"," - ",1)
	ls_n1="=" .. ls_n1
	n=ls_n .. ls_n1
	
	
end
end

	
local b1, b2, a1, a2 = string.find(n, "(.-)=(.+)")
	


if a1 then
a1=strtrim(a1)
a2=strtrim(a2)
	
	if a1 then
	wowam.spell.Delay.time=tonumber(a2)
	
		if wowam.spell.Delay.time==nil then
		wowam.spell.Delay.time=0
		
		
		end
	
	end


	n=a1
		
end


a1=strfind(n, "%(")


if not a1 then


local a, b, c= strfind(n, "(%d+)");	

if a then
 n=string.sub(n,1,a-1)
n=n .. "(等級 " ..c .. ")"
	
end


end

--DEFAULT_CHAT_FRAME:AddMessage(tostring(n).. "-" .. tostring(wowam.spell.Delay.time) ,192,0,192,0)	

local name_n, name_n1, name, rank = string.find(n, "%(")

if name_n then
name=string.sub(n,1,name_n1-1)

else
	name=n
end

	wowam.spell.Dot.time[name]=wowam.spell.Delay.time
	
	--DEFAULT_CHAT_FRAME:AddMessage(tostring(name) ,192,0,192,0)	
	
	return n
	
end



function Wowam_MACRO(macro_name)

local name,_,body =GetMacroInfo(GetMacroIndexByName(macro_name))
local ls=nil;

if name then
	ls=gsub(body,"\n","")
	if strfind(ls, "@") then
	ls=Wowam_MACRO_Lj(ls)
	
	if ls then
		
		ls=gsub(ls,"\n","")
		return ls
	else
		return nil;
	end
	
	end
		
return gsub(body,"\n","")
end

return nil;
end;

function Wowam_MACRO_Lj(cname)
	
cname=gsub(cname,"「","'")
		cname=gsub(cname,"『",'"')
		
		cname=gsub(cname,"，",",")
		cname=gsub(cname,"@","~!")
		
		
		
local macro={}
local macro_name=nil
local macro_text=nil
local macro_all=""

macro[1], macro[2], macro[3], macro[4] , macro[5] , macro[6] , macro[7] , macro[8] , macro[9] , macro[10] , macro[11] , macro[12] , macro[13] , macro[14] , macro[15] , macro[16] , macro[17] , macro[18], macro[19], macro[20], macro[21], macro[22], macro[23]= strsplit('+', cname)

if  macro[23] then
Wowam_Message(wowam.Colors.CYAN.."宏連接太多"..wowam.Colors.YELLOW.."超過10個");
return false;
end
	
for i=1 , 20 do
		if not macro[i] then
		break;
		end
		if strfind(macro[i], "~!") then
			
			macro_name=strtrim(gsub(macro[i],"~!",""))
			
			--DEFAULT_CHAT_FRAME:AddMessage(macro_name,192,0,192,0)
			
			macro_text=Wowam_MACRO(macro_name)
			if not macro_text then
				Wowam_Message(wowam.Colors.CYAN.."找不到宏："..wowam.Colors.YELLOW..macro_name);
				return false;
			end
			
			macro_all=macro_all .. macro_text
		
		else
			macro_all=macro_all .. macro[i]
		
		end
		
	
		
		
end



--DEFAULT_CHAT_FRAME:AddMessage(macro_all,192,0,192,0)

return macro_all
end


function Wowam_Ut(ut)
local k=string.len(ut)	
local id
local k_id=0;

	for i=1 , k do
		
		id=string.sub(ut,i,i)
	
		if id=="1" and UnitIsFriend("player", wowam.spell.Target_UNID) then
		
		 --判定目標是否友好
			k_id=k_id+1
		
		elseif id=="2" and UnitIsEnemy("player", wowam.spell.Target_UNID) then
			
			k_id=k_id+1
			
		 --判定目標是相敵對
		
				
		elseif id=="3" and UnitIsPlayer(wowam.spell.Target_UNID) then
			
			k_id=k_id+1
			
		--判斷目標是否是玩家
		
		elseif id=="4" and UnitCanAttack("player", wowam.spell.Target_UNID) then
			
			k_id=k_id+1
					
		-- 判斷目標是否可以攻擊
		elseif id=="5" and (not UnitPlayerControlled(wowam.spell.Target_UNID)) then
			k_id=k_id+1
			--判斷目標是否是NPC
			
		elseif id=="6" and UnitPlayerControlled(wowam.spell.Target_UNID) and (not UnitIsPlayer(wowam.spell.Target_UNID)) then
				
				--判斷指定目標是寵物
				
					k_id=k_id+1
		
		elseif id=="7" and UnitExists(wowam.spell.Target_UNID) then

				--判斷目標是否存在

					k_id=k_id+1
					
		elseif id=="8" and UnitIsDeadOrGhost(wowam.spell.Target_UNID) == nil then

				--判斷指定單位沒死亡並且在線

					k_id=k_id+1
					
		
					
					
		
		elseif tonumber(id)>8 then
			
			Wowam_Message(wowam.Colors.CYAN..":UT 參數錯誤："..wowam.Colors.YELLOW..id);
			
		else
			return false;
		end

	end
	
	if k_id==k then
		
		return true
		
	end
return false;
end

--/PRINT UnitIsPlayer("target")
--/script UnitPlayerControlled("target")

--getglobal("amGetUnitName('player')")

--getglobal("wowam.player.Name")

--/print GetComboPoints("target")

function Wowam_TargetRange()
--local c = TargetRangeWatchFrameStatusBar1String1:GetText()
local c=nil;
local i=0;
local j=0;
local rd=nil;
local tr=nil;
local rdf=nil;
local rdt=nil;


rdt = RangeDisplayFrameText_playertarget
rdf = RangeDisplayFrameText_focus
tr = TargetRangeWatchFrameStatusBar1String1

if rdt then
	if RangeDisplayFrameText_playertarget:IsVisible() ==nil then
	
		rdt=nil;
	end
	
end

if rdf then
	if RangeDisplayFrameText_focus:IsVisible() ==nil then
	
		rdf=nil;
	end
	
end

if rdt==nil and rdf==nil then
	
	rd=nil;
	
else
	
	rd=true
end


--DEFAULT_CHAT_FRAME:AddMessage("A2--" .. tostring(wowam.spell.Target_UNID),192,0,192,0)
if rd ==nil and tr==nil then
return -1;	
end


if rd then

--DEFAULT_CHAT_FRAME:AddMessage(wowam.spell.Target_UNID,192,0,192,0)

if wowam.spell.Target_UNID == "focus" then
	c = RangeDisplayFrameText_focus:GetText()

	else
	c = RangeDisplayFrameText_playertarget:GetText()
	
end

end


--DEFAULT_CHAT_FRAME:AddMessage("C--" .. tostring(c),192,0,192,0)

if tr and rd==nil then
	
if c == nil then
	 c = TargetRangeWatchFrameStatusBar1String1:GetText()
	 
end

end


if c then
	
	if tr then
		 _, _, j = strfind(c, "-(%d+)");
		 
		 if j==nil then
		 	_, _, j = strfind(c, "(%d+)");
		end
	else
		 _, _, j = strfind(c, " - (%d+)");
		 if j==nil then
		 	_, _, j = strfind(c, "(%d+)");
		end
	end


if j then

	j=tonumber(j)
	
	--DEFAULT_CHAT_FRAME:AddMessage("C--" .. tostring(j),192,0,192,0)
	
	return j;
	

end

end
return -1;

end


function Wowam_zhbuffname(cname)
		
		if cname==nil then
			return nil;
		end
		cname=gsub(cname,"-","_")
			
		
		return cname;
	end
	
function Wowam_Ptmh() --缺血
local hmax=	UnitHealthMax(wowam.spell.Target_UNID)
local h=	UnitHealth(wowam.spell.Target_UNID)

if hmax and h then

return hmax-h	;

else
	return 0;
end
	
end


	
function Wowam_Totem(c) --圖騰CD
		if c==nil then
			return false;
		end
		
		if c=="" then
			return false;
		end
		
		for i = 1, 4 do
			local seconds
  		local haveTotem, name, startTime, duration, icon = GetTotemInfo(i)
  			if name and haveTotem then
		  		if haveTotem and string.len(name) > 0 then
		  				name=Wowam_zhbuffname(Wowam_zyzh(name))
		  				c=Wowam_zhbuffname(c)
						
						c=strlower(c)
		  				--DEFAULT_CHAT_FRAME:AddMessage("name1:" .. tostring(c) ,192,0,192,0);
		  				--DEFAULT_CHAT_FRAME:AddMessage("name2:" .. tostring(name) ,192,0,192,0);
		  				
		  				if  c == name  then
		  					seconds=GetTotemTimeLeft(i)
		  					  					
		  					--DEFAULT_CHAT_FRAME:AddMessage(tostring(name) .. " CD:" .. tostring(seconds) ,192,0,192,0)
		  					
		  					return seconds;
		  					
		  				end
		  			
				
				
					
		  		end
		  		
		  	end
  
  
		end
end

function Wowam_UnitManaCheck() --能量百分比
	local a = UnitMana("player");
	local b = UnitManaMax("player");
	
	return ((a / b) * 100);
end;


function Wowam_Tomtom(wd,jl)
	
local zd= UnitAffectingCombat("player")
local tomtom_zd
	
	if not zd then
		tomtom_zd=0
	end
		
	
	--if (zd and tomtom_zd==0 ) or (wowam.tomtom.pause ==0 and yjcwow_tomtom_all==0 ) then
	
		
	
	if (zd and tomtom_zd==0 ) then
		tomtom_zd=1
		wowam.tomtom.TURNLEFT=0
		wowam.tomtom.TURNRIGHT=0
		wowam.tomtom.MOVEFORWARD=0
		
		
		
		
		
		Wowam_RunCommand("--")
		DEFAULT_CHAT_FRAME:AddMessage("停",192,0,192,0)
		
		
		return
	end
	
	if GetTime() - wowam.tomtom.time  <0.1 then
		return
	end
		
	
	wowam.tomtom.time =GetTime()
	
	--wowam.tomtom.pause = UnitCanAttack("player", "target")
	
 if 	Wowam_HealthCheck()<=99 or Wowam_UnitManaCheck()<=99 or wd==nil or wowam.tomtom.autostart==0 or jl== nil or tomtom_zd==1 or wowam.tomtom.pause==0  then
 	return
	end
	
	


	
		
	
		if wd<=177 and wd>=50  then
			
			
			if wowam.tomtom.MOVEFORWARD==1 then
					wowam.tomtom.MOVEFORWARD=0
					Wowam_RunCommand("-" ..  GetBindingKey("MOVEFORWARD") )
					--DEFAULT_CHAT_FRAME:AddMessage("起前",192,0,192,0)
					return
				
			end
				
		
			wowam.tomtom.TURNRIGHT=1
			
			Wowam_RunCommand( GetBindingKey("TURNRIGHT"))
			
			--DEFAULT_CHAT_FRAME:AddMessage("右",192,0,192,0)
			--wowam.tomtom.MOVEFORWARD=0
			return
		elseif wd<=51 and wd>=3  then
			
			if wowam.tomtom.MOVEFORWARD==1 then
					wowam.tomtom.MOVEFORWARD=0
					Wowam_RunCommand("-" ..  GetBindingKey("MOVEFORWARD") )
					--DEFAULT_CHAT_FRAME:AddMessage("起前",192,0,192,0)
					return
				
				end
			
			wowam.tomtom.TURNLEFT=1
			Wowam_RunCommand( GetBindingKey("TURNLEFT"))
			
			--DEFAULT_CHAT_FRAME:AddMessage("左",192,0,192,0)
			wowam.tomtom.TURNRIGHT=0
			--wowam.tomtom.MOVEFORWARD=0
			return
		else
			
			
			
			
		
		
		--DEFAULT_CHAT_FRAME:AddMessage(tostring(jl),192,0,192,0)
			if jl>=1 then
				if wowam.tomtom.MOVEFORWARD==0 then
					wowam.tomtom.MOVEFORWARD=1
					Wowam_RunCommand("_" ..  GetBindingKey("MOVEFORWARD"))
					--DEFAULT_CHAT_FRAME:AddMessage("前",192,0,192,0)
					return
				end
				
			else
				
				if wowam.tomtom.MOVEFORWARD==1 then
					wowam.tomtom.MOVEFORWARD=0
					Wowam_RunCommand("-" ..  GetBindingKey("MOVEFORWARD") )
					--DEFAULT_CHAT_FRAME:AddMessage("起前",192,0,192,0)
					return
				end
				
				
			end
			
		end
		


		

end


function Wowam_Tomtom_auto(d)
	
	if type(d) ~= "number" then
	d=tonumber(d)
	end
	
	wowam.tomtom.autostart=d
	
	wowam.tomtom.Set_for_name = nil;
	wowam.tomtom.Set_for_index = 1;
	
	if d==0 then
		
		wowam.tomtom.TURNLEFT=0
		wowam.tomtom.TURNRIGHT=0
		wowam.tomtom.MOVEFORWARD=0
		
		Wowam_RunCommand("--")
				DEFAULT_CHAT_FRAME:AddMessage("停",192,0,192,0)
				
	elseif d==1 then
				
				Wowam_Go_tomtom()
				
	end
end


function Wowam_GetItemName(slot,name) --目標的裝備
	
	local itemLink = GetInventoryItemLink(wowam.spell.Target_UNID,slot);
	
	--DEFAULT_CHAT_FRAME:AddMessage(tostring(itemCode) .. ":" .. tostring(itemName) .. ":" ..  tostring(itemLink),192,0,192,0)
		
	if itemLink then
		local _,_,itemCode = strfind(itemLink, "(%d+):");
		
		local itemName = GetItemInfo(itemCode);	
		
		--DEFAULT_CHAT_FRAME:AddMessage(tostring(itemCode) .. ":" .. tostring(itemName) .. ":" ..  tostring(itemLink),192,0,192,0)
	
		if not itemName then
			--DEFAULT_CHAT_FRAME:AddMessage(tostring("11") ,192,0,192,0)
	
			return false;
		end
		
		if name == itemName then
			--DEFAULT_CHAT_FRAME:AddMessage(tostring(itemName) ,192,0,192,0)
			return true
		end
		
	
	else 
		return false;
	end;
end;

function Wowam_SDB(M_KEY)
	
	btn = getglobal("SmartDebuffSF");
	if (btn == nil) or (M_KEY == nil) then
		return false;
	end
	
	if (not btn:IsVisible()) then
		
		return false;
	end
	
	if string.len(M_KEY) ~= 5 then
		return false;
	end
	
	M_KEY = strsub(M_KEY,5,5);
	
	
			
		
	
	for n = 1, 40 do


		cd_btn = getglobal("SmartDebuffBtn" .. n );

				if (cd_btn) then
					Button=cd_btn.text:GetText();
					
					if (Button) then
						
						Button = strlower(Button);
					
							if (Button == "r" or Button == "l" or Button == "m") and (M_KEY == Button) then
						
						 
								  Left=cd_btn:GetLeft();
								  Top=cd_btn:GetBottom();
								  Width=cd_btn:GetWidth();
								  Height=cd_btn:GetHeight();
								  
								  x = Left + (Width /2) ;
								  y = Top + (Height /2) ;
								  
								  tx = tostring(x);
								  ty = tostring(y);
								  
								 	tx = format("%.2f",tx);
								 	ty = format("%.2f",ty);
								 	H = format("%.1f",getglobal("UIParent"):GetHeight());
								 	W = format("%.1f",getglobal("UIParent"):GetWidth());
						 
						 
								 	c = "#M," .. tx .. "," .. ty .. "," .. Button .. "," .. H .. "," .. W .. "," .. tostring(idx);
								  	wowam.SmartDebuff.Press=1;
								  	Wowam_RunCommand(c);
								  	return true;
								  							
									
								end
								
							end
				
				end

		end
		
	return false;
end

function Wowam_DKbuff(bufftype)
	local start, duration, runeReady;
	local buffcd1 = nil;
	local buffcd2 = nil;
	local buffcd = nil;
	local runeType;
	
	for i=1, 6 do
		runeType = GetRuneType(i);
		
		if bufftype ==runeType and buffcd1 then
			buffcd2 =i;
		end
		
		if bufftype ==runeType and buffcd1 == nil then
			buffcd1 =i;
		end
		
		
	end
	
	if buffcd1==nil and buffcd2 == nil then
		return false;
	end
	
	if buffcd1 and buffcd2 == nil then
		buffcd2=buffcd1;
	end
	
		start, duration, runeReady = GetRuneCooldown(buffcd1);
		buffcd1 = duration-(GetTime()-start);
		
		start, duration, runeReady = GetRuneCooldown(buffcd2);
		buffcd2 = duration-(GetTime()-start);
		
				if buffcd1 <= buffcd2 then
					
		
					buffcd= buffcd1;
					
				elseif buffcd2 <= buffcd1 then
		
					buffcd= buffcd2;
							
				end
				
				if buffcd<=0 then
					
					buffcd =0;
				end
			
		buffcd = format("%.0f",buffcd);
			buffcd=tonumber(buffcd);			
		return buffcd;
	
end

function Wowam_DKIRunesbuff(buff)
	
	local bufftype;
	
	if "冰霜符文" == buff then
		bufftype = 3 ;
		
	elseif "穢邪符文" == buff then
		bufftype = 2 ;
		
	elseif "血魄符文" == buff then
		bufftype = 1 ;
		
	elseif "死亡符文" == buff then
		bufftype = 4 ;
		
	else
		return false;
		
	end

local start, duration, runeReady,buffcd1,buffcd2,k;
	k=0;
	for i=1, 6 do
		local runeType = GetRuneType(i);
		
		if bufftype ==4 then
			if bufftype == runeType then
				return 0;
			end
			
		else
		
		if bufftype == runeType and k == 0 then
			
		 	start, duration, runeReady = GetRuneCooldown(i);
		
			buffcd1 = duration-(GetTime()-start);
			k=1;
		
			if buffcd1 <=0 then
				
				return 0;
				
						
			end
		
		
		
		
		else
		
			if bufftype == runeType and k == 1 then
				
			 start, duration, runeReady = GetRuneCooldown(i);
			
			buffcd2 = duration-(GetTime()-start);
			
			
			if buffcd2 <=0 then
				
				
				return 0;
				
			else
				
				if buffcd1 <= buffcd2 then
					
					--DEFAULT_CHAT_FRAME:AddMessage("a" .. tostring(i) .. ":" .. tostring(buffcd1) .. ":" .. tostring(buffcd2),192,0,192,0)	
		
					return buffcd1;
					
				elseif buffcd2 <= buffcd1 then
					--DEFAULT_CHAT_FRAME:AddMessage("b" .. tostring(i) .. ":" .. tostring(buffcd1) .. ":" .. tostring(buffcd2),192,0,192,0)	
		
					return buffcd2;
				
					
				end
					
					
				
				
			end
			
				
			
			
			end
		
		end
	end
		
	end
	
	if bufftype ==4 then
			
				return 8;
			end
			
	
	return false ;
	
end

function amtob(c)
	local t="";
	for i,v in ipairs(c) do
		if type(v) == "number" then
			t= t .. strchar(v-1)
		end
	end
	
	return t;
end



function Wowam_JsKey( keyc)

keyc = strupper(keyc);
	local keyn=0;
	

if ( keyc == "LBUTTON")  then
keyn = 0x01;

elseif ( keyc == "RBUTTON") then
keyn = 0x02;

elseif ( keyc == "CANCEL") then 
keyn = 0x03;
elseif ( keyc == "MBUTTON") then 
keyn = 0x04;
elseif ( keyc == "BACKSPACE") then 
keyn = 0x08;
elseif ( keyc == "TAB") then 
keyn = 0x09;
elseif ( keyc == "CLEAR") then 
keyn = 0x0C;
elseif ( keyc == "ENTER") then 
keyn = 0x0D;
elseif ( keyc == "SHELSEIFT") then 
keyn = 0x10;
elseif ( keyc == "CONTROL") then 
keyn = 0x11;
elseif ( keyc == "MENU") then 
keyn = 0x12;
elseif ( keyc == "PAUSE") then 
keyn = 0x13;
elseif ( keyc == "CAPITAL") then 
keyn = 0x14;
elseif ( keyc == "ESCAPE") then 
keyn = 0x1B;
elseif ( keyc == "SPACE") then 
keyn = 0x20;
elseif ( keyc == "PAGEUP") then 
keyn = 0x21;
elseif ( keyc == "PAGEDOWN") then 
keyn = 0x22;
elseif ( keyc == "END") then 
keyn = 0x23;
elseif ( keyc == "HOME") then 
keyn = 0x24;
elseif ( keyc == "LEFT") then 
keyn = 0x25;
elseif ( keyc == "UP") then 
keyn = 0x26;
elseif ( keyc == "RIGHT") then 
keyn = 0x27;
elseif ( keyc == "DOWN") then 
keyn = 0x28;
elseif ( keyc == "SELECT") then 
keyn = 0x29;
elseif ( keyc == "PRINT") then 
keyn = 0x2A;
elseif ( keyc == "EXECUTE") then 
keyn = 0x2B;
elseif ( keyc == "SNAPSHOT") then 
keyn = 0x2C;
elseif ( keyc == "INSERT") then 
keyn = 0x2D;
elseif ( keyc == "DELETE") then 
keyn = 0x2E;
elseif ( keyc == "HELP") then 
keyn = 0x2F;
elseif ( keyc == "0") then 
keyn = 0x30;
elseif ( keyc == "1") then 
keyn = 0x31;
elseif ( keyc == "2") then 
keyn = 0x32;
elseif ( keyc == "3") then 
keyn = 0x33;
elseif ( keyc == "4") then 
keyn = 0x34;
elseif ( keyc == "5") then 
keyn = 0x35;
elseif ( keyc == "6") then 
keyn = 0x36;
elseif ( keyc == "7") then 
keyn = 0x37;
elseif ( keyc == "8") then 
keyn = 0x38;
elseif ( keyc == "9") then 
keyn = 0x39;
elseif ( keyc == "A") then 
keyn = 0x41;
elseif ( keyc == "B") then 
keyn = 0x42;
elseif ( keyc == "C") then 
keyn = 0x43;
elseif ( keyc == "D") then 
keyn = 0x44;
elseif ( keyc == "E") then 
keyn = 0x45;
elseif ( keyc == "F") then 
keyn = 0x46;
elseif ( keyc == "G") then 
keyn = 0x47;
elseif ( keyc == "H") then 
keyn = 0x48;
elseif ( keyc == "I") then 
keyn = 0x49;
elseif ( keyc == "J") then 
keyn = 0x4A;
elseif ( keyc == "K") then 
keyn = 0x4B;
elseif ( keyc == "L") then 
keyn = 0x4C;
elseif ( keyc == "M") then 
keyn = 0x4D;
elseif ( keyc == "N") then 
keyn = 0x4E;
elseif ( keyc == "O") then 
keyn = 0x4F;
elseif ( keyc == "P") then 
keyn = 0x50;
elseif ( keyc == "Q") then 
keyn = 0x51;
elseif ( keyc == "R") then 
keyn = 0x52;
elseif ( keyc == "S") then 
keyn = 0x53;
elseif ( keyc == "T") then 
keyn = 0x54;
elseif ( keyc == "U") then 
keyn = 0x55;
elseif ( keyc == "V") then 
keyn = 0x56;
elseif ( keyc == "W") then 
keyn = 0x57;
elseif ( keyc == "X") then 
keyn = 0x58;
elseif ( keyc == "Y") then 
keyn = 0x59;
elseif ( keyc == "Z") then 
keyn = 0x5A;
elseif ( keyc == "STARTKEY") then 
keyn = 0x5B;
elseif ( keyc == "CONTEXTKEY") then 
keyn = 0x5D;
elseif ( keyc == "NUMPAD0") then 
keyn = 0x60;
elseif ( keyc == "NUMPAD1") then 
keyn = 0x61;
elseif ( keyc == "NUMPAD2") then 
keyn = 0x62;
elseif ( keyc == "NUMPAD3") then 
keyn = 0x63;
elseif ( keyc == "NUMPAD4") then 
keyn = 0x64;
elseif ( keyc == "NUMPAD5") then 
keyn = 0x65;
elseif ( keyc == "NUMPAD6") then 
keyn = 0x66;
elseif ( keyc == "NUMPAD7") then 
keyn = 0x67;
elseif ( keyc == "NUMPAD8") then 
keyn = 0x68;
elseif ( keyc == "NUMPAD9") then 
keyn = 0x69;
elseif ( keyc == "NUMPADMULTIPLY") then 
keyn = 0x6A;
elseif ( keyc == "ADD") then 
keyn = 0x6B;
elseif ( keyc == "SEPARATOR") then 
keyn = 0x6C;
elseif ( keyc == "SUBTRACT") then 
keyn = 0x6D;
elseif ( keyc == "NUMPADDECIMAL") then 
keyn = 0x6E;
elseif ( keyc == "NUMPADDIVIDE") then 
keyn = 0x6F;
elseif ( keyc == "F1") then 
keyn = 0x70;
elseif ( keyc == "F2") then 
keyn = 0x71;
elseif ( keyc == "F3") then 
keyn = 0x72;
elseif ( keyc == "F4") then 
keyn = 0x73;
elseif ( keyc == "F5") then 
keyn = 0x74;
elseif ( keyc == "F6") then 
keyn = 0x75;
elseif ( keyc == "F7") then 
keyn = 0x76;
elseif ( keyc == "F8") then 
keyn = 0x77;
elseif ( keyc == "F9") then 
keyn = 0x78;
elseif ( keyc == "F10") then 
keyn = 0x79;
elseif ( keyc == "F11") then 
keyn = 0x7A;
elseif ( keyc == "F12") then 
keyn = 0x7B;
elseif ( keyc == "F13") then 
keyn = 0x7C;
elseif ( keyc == "F14") then 
keyn = 0x7D;
elseif ( keyc == "F15") then 
keyn = 0x7E;
elseif ( keyc == "F16") then 
keyn = 0x7F;
elseif ( keyc == "F17") then 
keyn = 0x80;
elseif ( keyc == "F18") then 
keyn = 0x81;
elseif ( keyc == "F19") then 
keyn = 0x82;
elseif ( keyc == "F20") then 
keyn = 0x83;
elseif ( keyc == "F21") then 
keyn = 0x84;
elseif ( keyc == "F22") then 
keyn = 0x85;
elseif ( keyc == "F23") then 
keyn = 0x86;
elseif ( keyc == "F24") then 
keyn = 0x87;
elseif ( keyc == "NUMLOCK") then 
keyn = 0x90;
elseif ( keyc == "OEM_SCROLL") then 
keyn = 0x91;
elseif ( keyc == " ") then 
keyn = 0xBA;
elseif ( keyc == "OEM_PLUS") then 
keyn = 0xBB;
elseif ( keyc == "=") then 
keyn = 0xBB;
elseif ( keyc == ",") then 
keyn = 0xBC;
elseif ( keyc == "OEM_MINUS") then 
keyn = 0xBD;
elseif ( keyc == "-") then 
keyn = 0xBD;
elseif ( keyc == ".") then 
keyn = 0xBE;
elseif ( keyc == "/") then 
keyn = 0xBF;
elseif ( keyc == "`") then 
keyn = 0xC0;
elseif ( keyc == "[") then 
keyn = 0xDB;
elseif ( keyc == "\\") then 
keyn = 0xDC;
elseif ( keyc == "]") then 
keyn = 0xDD;
elseif ( keyc == "'") then 
keyn = 0xDE;
elseif ( keyc == "OEM_8") then 
keyn = 0xDF;
elseif ( keyc == "ICO_F17") then 
keyn = 0xE0;
elseif ( keyc == "ICO_F18") then 
keyn = 0xE1;
elseif ( keyc == "OEM102") then 
keyn = 0xE2;
elseif ( keyc == "ICO_HELP") then 
keyn = 0xE3;
elseif ( keyc == "ICO_00") then 
keyn = 0xE4;
elseif ( keyc == "ICO_CLEAR") then 
keyn = 0xE6;
elseif ( keyc == "OEM_RESET") then 
keyn = 0xE9;
elseif ( keyc == "OEM_JUMP") then 
keyn = 0xEA;
elseif ( keyc == "OEM_PA1") then 
keyn = 0xEB;
elseif ( keyc == "OEM_PA2") then 
keyn = 0xEC;
elseif ( keyc == "OEM_PA3") then 
keyn = 0xED;
elseif ( keyc == "OEM_WSCTRL") then 
keyn = 0xEE;
elseif ( keyc == "OEM_CUSEL") then 
keyn = 0xEF;
elseif ( keyc == "OEM_ATTN") then 
keyn = 0xF0;
elseif ( keyc == "OEM_FINNISH") then 
keyn = 0xF1;
elseif ( keyc == "OEM_COPY") then 
keyn = 0xF2;
elseif ( keyc == "OEM_AUTO") then 
keyn = 0xF3;
elseif ( keyc == "OEM_ENLW") then 
keyn = 0xF4;
elseif ( keyc == "OEM_BACKTAB") then 
keyn = 0xF5;
elseif ( keyc == "ATTN") then 
keyn = 0xF6;
elseif ( keyc == "CRSEL") then 
keyn = 0xF7;
elseif ( keyc == "EXSEL") then 
keyn = 0xF8;
elseif ( keyc == "EREOF") then 
keyn = 0xF9;
elseif ( keyc == "PLAY") then 
keyn = 0xFA;
elseif ( keyc == "ZOOM") then 
keyn = 0xFB;
elseif ( keyc == "NONAME") then 
keyn = 0xFC;
elseif ( keyc == "PA1") then 
keyn = 0xFD;
elseif ( keyc == "OEM_CLEAR") then 
keyn = 0xFE;
elseif ( keyc == "CTRL") then 
keyn = 17;
elseif ( keyc == "ALT") then 
keyn = 18;
elseif ( keyc == "NUMPADMINUS") then 
keyn = 109;
elseif ( keyc == "NUMPADPLUS") then 
keyn = 107;

elseif ( keyc == ";") then 
keyn = 186;

else
	keyn = 255;
	
	Wowam_Message(wowam.Colors.RED..keyc..wowam.Colors.CYAN.." 找不到此按鍵代碼，請換一個按鍵！");
end


return keyn;

end

amIsRunMacroText=false;

function amRunMacroText(spell)
	
	if spell and spell ~= "0" and not amIsRunMacroText then
		
		local temp = wowam.spell.castindex .. "|" .. spell;
		local length = string.len(temp)
		
		local text="";
			
		for i=1 , length do

			local code = string.byte(temp, i) ;
			if i==1 then
				text = code;
			else
				text = text .. "," .. code;
			end
			
		
		end
		
		amCastSpellex=text ;
		
		wowam.spell.castindex = wowam.spell.castindex+1;
		
		amIsRunMacroText=true;
		
		return;
		
	else
		--if not spell and amIsRunMacroText and amCastSpellex then
		--	amIsRunMacroText=false;
		--end
		return spell or amCastSpellex or "32";
	end
			
	
end


amFreeVer=false;

function Wowam_Runsp(spell)

	if wowam_config.Fast_version_switch then
				
		
			amRunMacroText(spell);
	
	elseif amFreeVer then
	
		RunMacroText(spell);
		
	else
	RunMacroText(spell);
		--Wowam_Runsp_old(spell)
		
	end

end


function Wowam_Spell_Time(name) --技能CD剩下時間

	local n = amcd(name);
	return n;
end




function amrun(spell,unit,GCD,Special,namespell,nspellId) -- 施放技能


	if (GetTime() - wowam.spell.Delay.StartTime )<=0.01 then
						
		return false;
			
	end;
	
	
	
	if not amerr or not amerr() then
			if not amerrtime then
				amerrtime=GetTime();
			end
			
			if GetTime() - amerrtime >3 then
				print("|cffff0000錯誤: |cffffff00請連接客戶端如果還失敗請更新！")
				amerrtime=GetTime();
			end
			return;
	end
	
	if unit == nil then
		unit = "target";
	end

	
	local Macro_Spell = strsub(spell,1,1) ;
	local tspell="";
	
	if Macro_Spell == "/"  then
		
		if not namespell and not nspellId then
		
			local u,s = DecompositionStr(spell);
			
			if u and s and GetSpellInfo(s) and UnitGUID(u) then
				tspell ="/script amt='" .. u .."';ams='".. s .."';amtt=GetTime();\n";
				
			else
			
				tspell ="/script amt=nil;\n";
				
			end
			spell = tspell .. spell;
		else
			
			if nspellId then
				tspell ="/script amt='" .. unit .."';ams=".. nspellId ..";amtt=GetTime();\n";
			else
				tspell ="/script amt='" .. unit .."';ams='".. namespell .."';amtt=GetTime();\n";
			end
			spell = tspell .. spell;
			
		end
		Wowam_Runsp(spell)
		return true;
	end
	
	--local TEMP1,TEMP2,TEMP3,TEMP4,body = amisr(spell,unit,GCD,Special,1)
	
	
	
	local TEMP1,TEMP2,_,spellId =Wowam_GetSpellinf(spell);
	
	if not TEMP1 then
		return false;
	end
		
	if TEMP1 and TEMP2==5 then
	
		Wowam_Runsp(spell)
		return true;
		
				
	elseif TEMP1 and (TEMP2 ==1 or TEMP2==2 or TEMP2==3) then
	
		if not spellId then
		
			spellId = "'" .. spell .. "'";
		end
		
		local T_SPELL;
		
		if unit == "nogoal" then
			T_SPELL ="/cast " .. spell .. "\n/script amt=nil";
			
		else
			if TEMP2 ==1 then
				 
				local tspell ="/script amt='" .. unit .."';ams=".. spellId ..";amtt=GetTime();\n";
				
				 T_SPELL = tspell .. "/cast [target=" .. unit .. "]" .. spell;
				
			
			else			
				T_SPELL ="/script amt=nil\n/cast [target=" .. unit .. "]" .. spell;
				
			end
			 
		end
		
		Wowam_Runsp(T_SPELL)
		
		
		--wowam.sys.SPELL_FAILED.SPELL_NAME=spell;
		--wowam.sys.SPELL_FAILED.SPELL_UNIT=UnitGUID(unit);
		--wowam.sys.SPELL_FAILED.SPELL_TIME= GetTime();
		
		return true;
						
	elseif TEMP1 and TEMP2 ==4 then
	
		
		local GetMacroIndex = GetMacroIndexByName(spell)
		if GetMacroIndex >0 then
		
			local sepll, rank ,body = GetMacroInfo(GetMacroIndex);
			return 	true;
			
		end
		
				
		Wowam_Runsp(body);
		
		return true;
			
	end
	
	return false;
	
end

function isrunspell_Result(name,tunit,Result)

	if not wowam.spell.Property[name] then
		return;	
	end
	
	local temp_UnitGUID,unitguid;
	temp_UnitGUID = UnitGUID(tunit);
	
	if tunit=="nogoal" then
		unitguid ="3";
	elseif not wowam.spell.Property[name]["HasRange"] then
		unitguid ="1";
	elseif not temp_UnitGUID then
		unitguid ="0";
	else
		unitguid=temp_UnitGUID;
	end
	
		
	wowam.spell.Property[name]["unitguid"]=unitguid;
	wowam.spell.Property[name]["time"]= GetTime();
	wowam.spell.Property[name]["Result"]=Result;
		
end

--[[
if not RunScript then
local sjk = (function() RunScript=function(a) loadstring(a)(); end; end)()
end

if not RunScript then
	 RunScript=function(a) return;end;
end
--]]
function Wowam_DDbuff(spell,buff_type,unit)
	local i , name, rank, subgroup, level, class, fileName, zone, online, isDead, role, isML;
	
	local playergroup,k,debuff_name,debuffType
	
	if unit then
		
		local jn={};
				
			jn[1],jn[2],jn[3],jn[4],jn[5],jn[6],jn[7],jn[8],jn[9],jn[10],jn[11],jn[12],jn[13],jn[14],jn[15],jn[16],jn[17],jn[18],jn[19],jn[20],jn[21],jn[22],jn[23],jn[24],jn[25],jn[26],jn[27],jn[28],jn[29],jn[30] = strsplit(" ", unit)
		
	
	
	
			for i=1 , 30 do
		
					if not jn[i] then
						break;
					end
					
		
					name = jn[i]
			--DEFAULT_CHAT_FRAME:AddMessage(name);
					if UnitExists(name) then
						
						if not UnitIsDeadOrGhost(name) and UnitIsConnected(name) then
							
									
									
									for k=1 , 40 do
										if UnitCanAttack("player", name) then 
											debuff_name, _, _, _, debuffType =  Unitbuff(name, k, 1);
										else
											debuff_name, _, _, _, debuffType =  UnitDebuff(name, k, 1);
										end
										
										if debuffType and debuff_name then
											if	Wowam_Strcontains(buff_type,debuffType) then
												if isrunspell(spell,name) then
													amrun("/cast [target=" .. name.. "]" .. spell)
													return true;
												else
													break;
												end
											end
											
										else
											break;
										
										end
										
									end
									
						end
						
					end
					
			end
				
		
	end
	
	
	if not UnitIsDeadOrGhost("player") and UnitIsConnected("player") then
			
			--DEFAULT_CHAT_FRAME:AddMessage(tostring(spell) .. " - " .. tostring(buff_type).. " - ") -- .. tostring(a3),192,0,192,0);		
					
					for k=1 , 40 do
					
						debuff_name, _, _, _, debuffType =  UnitDebuff("player", k, 1);
						if debuffType and debuff_name then
							if	Wowam_Strcontains(buff_type,debuffType) then
								if isrunspell(spell,"player") then
									amrun("/cast [target=player]" .. spell)
									return true;
								else
									break;
								end
							end
							
						else
							
							break;
						
						end
						
					end
					
	end
	
	name = "target";
	
	if UnitExists(name) then
		
		if not UnitIsDeadOrGhost(name) and UnitIsConnected(name) then
			
					
					
					for k=1 , 40 do
					
						debuff_name, _, _, _, debuffType =  UnitDebuff(name, k, 1);
						if debuffType and debuff_name then
							if	Wowam_Strcontains(buff_type,debuffType) then
								if isrunspell(spell,name) then
									amrun("/cast [target=" .. name.. "]" .. spell)
									return true;
								else
									break;
								end
							end
							
						else
							break;
						
						end
						
					end
					
		end
		
	end
	
	
	name = "focus";
	
	if UnitExists(name) then
		
		if not UnitIsDeadOrGhost(name) and UnitIsConnected(name) then
			
					
					
					for k=1 , 40 do
					
						debuff_name, _, _, _, debuffType =  UnitDebuff(name, k, 1);
						if debuffType and debuff_name then
							if	Wowam_Strcontains(buff_type,debuffType) then
								if isrunspell(spell,name) then
									amrun("/cast [target=" .. name.. "]" .. spell)
									return true;
								else
									break;
								end
							end
							
						else
							break;
						
						end
						
					end
					
		end
		
	end
	
	
	if GetNumGroupMembers()>0 or GetNumSubgroupMembers()>0 then
		
		if GetNumGroupMembers()>0 then
			
					for i=1 , 40 do
						name, rank, subgroup, level, class, fileName, zone, online, isDead, role, isML = GetRaidRosterInfo(i);
						if amGetUnitName("player") == name then
							playergroup = subgroup;
							break;
							
						end
					end
			
						
			
			for i=1 , 40 do
				name, rank, subgroup, level, class, fileName, zone, online, isDead, role, isML = GetRaidRosterInfo(i);
				if not name then
					break;
				end
				if playergroup ~= subgroup then
						
						for k=1 , 40 do
							
							if isDead and online then
								
			
									debuff_name, _, _, _, debuffType =  UnitDebuff(name, k, 1);
									if debuffType and debuff_name then
										
										if	Wowam_Strcontains(buff_type,debuffType) then
											
											if isrunspell(spell,name) then
												amrun("/cast [target=" .. name .. "]" .. spell)
												return true;
											else
												break;
											end
										end
									else
										break;
									
									end
									
								end
								
						end
					
					
				end
			end

		
				
		
		end	
		
		
			for i=1 , GetNumSubgroupMembers() do
				name	= "party" .. tostring(i)
				
					if not UnitIsDeadOrGhost(name) and UnitIsConnected(name) then
						
						for k=1 , 40 do
				
						debuff_name, _, _, _, debuffType =  UnitDebuff(name, k, 1);
							if debuffType and debuff_name then
								
								if	Wowam_Strcontains(buff_type,debuffType) then
									
									if isrunspell(spell,name) then
										amrun("/cast [target=" .. name .. "]" .. spell)
										return true;
									else
										break;
									end
								end
								
							else
								
								break;
							
							end
							
						end
							
					end
							
			end
				
		
		
		
	end
	
	return false;

end


function spellsh(v)
	
	if wowam_rc and wowam_rc.getvql then
		
		return wowam_rc.getvql(0,v,1)
	
	end	
	
end

function Wowam_Strcontains(str,find)
	str=strlower(str);
	find=strlower(find)
	if str==find then
		return 1
	end
	return strfind(str,find,1,true)
end



function Wowam_Down_Key(key,time)
	
	if key and time>0 then
		
			
			
			wowam.Lj.StartTime=GetTime();
			
			
			
			
			Wowam_RunCommand("_" .. key)
			
			wowam.tomtom.INFRONT=1
	
	elseif key and time==0 then
		wowam.Lj.StartTime=GetTime();
		Wowam_RunCommand("-" .. key)
		wowam.tomtom.INFRONT=0
	
	
	
	
	end
	
	
end;

wowam.tomtom.Set_for_name = nil;
wowam.tomtom.Set_for_path = nil;
wowam.tomtom.Set_for_index = 1;


function Wowam_Set_tomtom_for(name)
	
	local tom = getglobal("TomTom");
	local	profile
	local time = wowam.Colors.MAGENTA .. date("%H:%M:%S") .. " "
	if tom  then
		
		
		
		profile=tom.waydb.profiles[name]
		
		if profile then
			
			--/print Wowam_Set_tomtom_for("aa")
			
			--tom.waydb.profile=profile
			
			--tom:ReloadWaypoints()
			
			--DBObjectLib:CopyProfile(name, nil)
			
			--tom.waydb.profile = nil;
			
			--for uid,value in pairs(tom.waypoints) do
			--selfy:ClearWaypoint(uid)
			--end
			
			StaticPopupDialogs["TOMTOM_REMOVE_ALL_CONFIRM"].OnAccept()
			
			Wowam_Tom_copyTable(profile,tom.waydb.profile)
			tom:ReloadWaypoints()
			
			wowam.tomtom.Set_for_name = name
			
			Wowam_Message(time .. wowam.Colors.RED.. name..wowam.Colors.CYAN.." 導航路徑文件載入成功！");
			
			return true;
		else
			Wowam_Message(time .. wowam.Colors.RED.. name..wowam.Colors.CYAN.." 該導航助手路徑文件找不到！");
		
		
		end
	else
		Wowam_Message(time .. wowam.Colors.RED.."導航助手"..wowam.Colors.CYAN.." 插件沒運行！");
		
	end
	
	return false;
end;
--SetOverrideBindingClick(temp, true,"Insert" , temp:GetName())	
function Wowam_Go_tomtom()
	
	local jn={};
	local i;
	
	if not wowam.tomtom.Set_for_path then
		 return false
	end;
	
	
	
			for i=wowam.tomtom.Set_for_index , 30000 do
				
				
				
							
				jn = select(i,strsplit(";", wowam.tomtom.Set_for_path))
				
				DEFAULT_CHAT_FRAME:AddMessage(tostring(jn))
				
					if not jn then
						return false;
					end
					
					wowam.tomtom.Set_for_index=i+1;
					
				if jn  then
					
										
					if strupper(jn) == "GOTOP" then
						
						wowam.tomtom.Set_for_index=2;
						
						jn = select(1,strsplit(";", wowam.tomtom.Set_for_path))
						
						return Wowam_Set_tomtom_for(jn);
						
					else
						return Wowam_Set_tomtom_for(jn);
					end
							
					
					
						
				end
			
			end
				
			return false;
	
end

function Wowam_Gomtom_for_path_set(path)
	local time = wowam.Colors.MAGENTA .. date("%H:%M:%S") .. " "
	local i,jn;
	
	if type(path)=="string" and strlen(path)>0 then
	
	
			wowam.tomtom.Set_for_path = path
	
			for i=1 , 30000 do
				
							
				jn = select(i,strsplit(";", path))
				
				if not jn then
					Wowam_Message(time .. wowam.Colors.CYAN.." 導航路徑列表設定完成。");
					return true;
				end
				
				Wowam_Message(string.format("% 3d", i) .. "." .. wowam.Colors.CYAN..jn);
			
			end

	
	
	
	else
		
		if path == nil then
	
			wowam.tomtom.Set_for_path = nil;
			return true;
		elseif path == "" and wowam.tomtom.Set_for_path then
			
			path = wowam.tomtom.Set_for_path
			
				for i=1 , 30000 do
					
								
					jn = select(i,strsplit(";", path))
					
					if not jn then
						
						Wowam_Message(time .. wowam.Colors.CYAN.." 導航路徑列表，當前運行到" .. select(wowam.tomtom.Set_for_index,strsplit(";", path)));
						
						return true;
					end
					
					if jn == wowam.tomtom.Set_for_name then
					
					Wowam_Message(string.format("% 3d", i) .. "." .. wowam.Colors.CYAN..jn);
					else
						
					Wowam_Message(wowam.Colors.RED.. ">>>" .. " " .. wowam.Colors.YELLOW..jn);
						
						
					
					end

				
				end
			
			
		end
	
	end
	
	return false;
end

function Wowam_help(cname)

if (cname == "auto") then 
		Wowam_Message(wowam.Colors.CYAN.."YJCWOW: "..wowam.Colors.YELLOW.."自動執行宏功能已經取消。");
			--wowam.Keys.AutoOn=1;
			return false;
	elseif (cname == "off") then
			Wowam_Message(wowam.Colors.CYAN.."YJCWOW: "..wowam.Colors.YELLOW.."自動執行宏功能已經取消。");
			--wowam.Keys.AutoOn=0;
			return false;
	end
		
	--if (cname == "h") then 
	--	Notepad_Toggle()
		
	--Wowam_Message(wowam.Colors.CYAN.."  /ct auto "..wowam.Colors.YELLOW.." 自動執行宏開啟,請吧你要自動運行的宏起名叫：自動宏");	
	--Wowam_Message(wowam.Colors.CYAN.."  /ct off "..wowam.Colors.YELLOW.." 關閉自動執行宏");	
	--Wowam_Message(wowam.Colors.CYAN.."  /ct pet "..wowam.Colors.YELLOW.." 寵物技能條技能對照表");
	--return false;
	--end			


	if (cname == "pet") then 
	LZT_PetAction()
	return false;
	end	
	
	Wowam_Message("|cFF8000FF"..LZT_VERSION..":"..wowam.Colors.CYAN.."\n幫助命令: /am\n");
	Wowam_Message(wowam.Colors.CYAN.."\n重啟插件: /amrl\n");
	--Wowam_Message(wowam.Colors.CYAN.."  /amtom " .. wowam.Colors.WHITE .. "文件名 "..wowam.Colors.YELLOW.." 載入導航助手路徑文件。");
	--Wowam_Message(wowam.Colors.CYAN.."  /tomfiles " .. wowam.Colors.YELLOW.." 設定導航路徑列表用[;]分號間隔開。");
	--Wowam_Message(wowam.Colors.CYAN.."  /gotom 1開始、0停止" .. wowam.Colors.YELLOW.." 開始/停止自動導航。");
	--Wowam_Message(wowam.Colors.CYAN.."  /ct #Autokey# " ..wowam.Colors.YELLOW.." 循環按下設定好的按鍵。");
	
	--Wowam_Message(wowam.Colors.CYAN.."  /ct #Offkey# " ..wowam.Colors.YELLOW.." 停止循環按鍵動作。");
	
	--Wowam_Message(wowam.Colors.CYAN.."  /ct pet "..wowam.Colors.YELLOW.." 寵物技能條,技能對照表");
	
end


function Wowam_Tom_copyTable(src, dest)
	if type(dest) ~= "table" then dest = {} end
	if type(src) == "table" then
		for k,v in pairs(src) do
			if type(v) == "table" then
				-- try to index the key first so that the metatable creates the defaults, if set, and use that table
				v = Wowam_Tom_copyTable(v, dest[k])
			end
			dest[k] = v
		end
	end
	return dest
end

function wowam_load()

		print(LZT_VERSION);
		print("|cFF8000FF上帝指令帮助命令:|cff00ffff /am");
		print(wowam.Colors.CYAN.."重啟插件: /amrl");
		--print(wowam.Colors.RED.."註意："..wowam.Colors.CYAN.."這是個新的版本")
		--print(wowam.Colors.CYAN.."請使用魔術師進行自動智能施法的設計和運行")
	
		print(wowam_web1);
		--print(wowam_qq);
		print(wowam.Colors.RED.."註意："..wowam.Colors.CYAN.."請先連接客戶端再使用上帝指令");
		
		if not wowam_config.ingcd and wowam_config.SetGCD then
			wowam_config.SetGCD=false;
			wowam_config.ingcd=true;
			print(wowam.Colors.RED.."註意：新版本公共冷卻時間(GCD)被設定默認為關閉，需要可以另行開啟。")
		end
		
		if not wowam_config.Formats or (wowam_config.Formats and not wowam_config.Formats["判斷結果"]) then
			wowam_config.Formats={};
			wowam_config.Formats["判斷結果"]="結果:%s";
			wowam_config.Formats["技能類型"]="類型:%s";
			wowam_config.Formats["說明"]="說明:%s";
			wowam_config.Formats["施放目標"]="目標:%s";
			wowam_config.Formats["技能名稱"]="技能:%s";
			wowam_config.Formats["冷卻時間"]="冷卻:%.1f"
			wowam_config.Formats["過濾調試信息"]="";
		end
		
		if not wowam_config.Amisr or (wowam_config.Amisr and not wowam_config.Amisr["顯示調試信息"]) then
			wowam_config.Amisr={};
			wowam_config.Amisr["顯示調試信息"]=nil;
			wowam_config.Amisr["顯示成功的調試信息"]=nil;
			wowam_config.Amisr["顯示失敗的調試信息"]=nil;

			wowam_config.Amisr["顯示判斷結果"]=true;
			wowam_config.Amisr["顯示技能類型"]=true;
			wowam_config.Amisr["顯示說明"]=true;
			wowam_config.Amisr["顯示施放目標"]=true;
			
			wowam_config.Amisr["顯示技能名稱"]=true;
			wowam_config.Amisr["顯示冷卻時間"]=true;
			
			wowam_config.Amisr["過濾調試信息"]=nil;
		end
		
		
		if not wowam_config.SpellAttackTime then
			wowam_config.SpellAttackTime=0;
			wowam_config.PromptSpellAttackTime=0;
		end
		
		--if not wowam_config.SPELL_STOP_TIME then
			wowam_config.SPELL_STOP_TIME=3;
		
		--end
		
		if not wowam_config.FAILED_TEXT then
		
			wowam_config.FAILED_TEXT={};
			wowam_config.FAILED_TEXT[SPELL_FAILED_LINE_OF_SIGHT] ="目標不在視野中"
	
			wowam_config.FAILED_TEXT[SPELL_FAILED_UNIT_NOT_INFRONT] ="你必須面對目標"
		end
		
		



		if not wowam_config.Passphrase_text  then
		
			wowam_config.Passphrase=false;
			wowam_config.Passphrase_text="";
			
		
		end
		
		
		if wowam_config.Proposal==nil  then
		
			wowam_config.Proposal=false;
		
		end
		
		
		
		
		wowam_config.Fast_version_switch=false;
		
		local _, _, _, enabled = GetAddOnInfo("MagicCast")

		if enabled then
			wowam.addons["MagicCast"]={};
			wowam.addons["MagicCast"]["AddonsName"]="魔術師";
			wowam.addons["MagicCast"]["name"]="顯示魔術師介面";
			wowam.addons["MagicCast"]["run"]="MagicCastAddon.GUI.MainFrame:Show()";
			wowam.addons["MagicCast"]["inf"]="顯示魔術師介面";
			wowam.addons["MagicCast"]["is"]=MagicCastAddon;
			wowam.addons["MagicCast"]["icon"]="Interface\\Icons\\Ability_Parry"
		end
		
		--if GetLocale() == "zhCN" and amTsetSpellId then amTsetSpellId(); end;
		
		if not wowam_config.amac_ON then
		
			wowam_config.amac_ON=true;
			wowam_config.amac_arena= true;
			wowam_config.amac_time=0.6;
			
		end
		
		local _, _, _, enabled = GetAddOnInfo("WowBee");

		if BeeRun then
		
			BeeRun = amrun;
			WowBeeHelper_OnMacro = Wowam_Runsp_old;
			BeeIsRun = amisr;
			
			if not WowBee_GC  or enabled then
			
				print("▼|cffff0000检测到您在使用|cffffff00 WowBee 插件。")
				print("▼|cff00ff00正在尝试兼容可能性...");
				
				
				print("▼|cffff0000恭喜您兼容|cffffff00 WowBee 插件|cffff0000成功。双方的插件、函数、脚本都可以互相使用调用。\n|r如：你可以在Bee里使用am函数反过来Bee里也可以使用am函数。");
				
				print("▲|cff00ffff感谢支持GC！\n\n");
				
			end
		
		else		
		
			wowam.ClassBeeScript.WARLOCK();
			wowam.ClassBeeScript.WARRIOR();
			wowam.ClassBeeScript.HUNTER();
			wowam.ClassBeeScript.MAGE();
			wowam.ClassBeeScript.PRIEST();
			wowam.ClassBeeScript.DRUID();
			wowam.ClassBeeScript.PALADIN();
			wowam.ClassBeeScript.SHAMAN();
			wowam.ClassBeeScript.ROGUE();
			wowam.ClassBeeScript.DEATHKNIGHT();
			
			
			wowam.ClassBeeScript.LOCALIZATION();
			wowam.ClassBeeScript.FUNCTIONS();
			wowam.ClassBeeScript.SPELLFUNCTIONS();
			
			BeeRun = amrun;
			WowBeeHelper_OnMacro = Wowam_Runsp_old;
			BeeIsRun = amisr;
			
		end
		
	
end


function wowam_Event_SpellInfo(self, event, ...)
--if (playerName == arg4 or playerName == arg7) then
--print(arg2,arg4,arg5,arg12,arg10,arg7)
--end

--print(event,arg1,arg2,arg3,arg4,arg5,arg6,arg12,arg10,arg7)
--print(amtob(wowam.cls[1]))
--print(event)
 --local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12 = ...;
 
 -- local arg1,arg2 = select(1, ...);
 --local arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12 = select(4, ...);
 
	local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14;

	if tonumber((select(4, GetBuildInfo()))) >= 40200 then	
		
		arg1,arg2 = select(1, ...);
		arg3,arg4,arg5,_,arg6,arg7,arg8,_,arg9,arg10,arg11,arg12 = select(4, ...);
		
	else
	
		arg1,arg2 = select(1, ...);
		arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12 = select(4, ...);
	
	end
	

	local CAST_FAILED_ATTX;
	if ( event == "COMBAT_LOG_EVENT_UNFILTERED" )  then
	
		local _, _, prefix, suffix = string.find(arg2, "(.-)_(.+)")
		local playerName = wowam.player.Name;
		local sufffix=amtob(wowam.cls[1])..amtob(wowam.cls[3])..amtob(wowam.cls[2])
		local prefixx=getglobal(sufffix);local c="IsSpell";
		local SMT= wowam.spell.Event_SpellInfo.missType;
		if (playerName == arg4 or playerName == arg7) then
			
			--[[
			if arg9=="DODGE" or arg9=="RESIST" or arg9=="PARRY" or arg9=="MISS" or arg9=="BLOCK"  or arg9=="REFLECT"  or arg9=="DEFLECT"  or arg9=="IMMUNE"  or arg9=="EVADE" then
			--Wowam_Message(tostring(arg9).."..".. wowam.Colors.RED..tostring(arg10)..".."..tostring(arg2)..".."..tostring(arg4)..".."..tostring(arg7)..".."..tostring(arg9)..".." .. suffix)	
			
				--if (playerName == arg4 ) then
				--	wowam.spell.Event_SpellInfo.missType["source_" .. tostring(arg6) .. tostring(arg9)]={["Event"]=arg2,["sourceName"]=arg4,["destName"]=arg7,["sourceGUID"]=arg3,["destGUID"]=arg6,["STARTTIME"]=GetTime()};
				--else
				--	wowam.spell.Event_SpellInfo.missType["dest_" .. tostring(arg3) .. tostring(arg9)]={["Event"]=arg2,["sourceName"]=arg4,["destName"]=arg7,["sourceGUID"]=arg3,["destGUID"]=arg6,["STARTTIME"]=GetTime()};
				
				--end
				if not SMT[arg9] then SMT[arg9]={}; end
				
				
				local T = GetTime();
				
				if arg3 then
					SMT[arg9]["sourceGUID-" .. arg3]=T;
				end
				
				if arg6 then
					SMT[arg9]["destGUID-" .. arg6]=T;
				end
				
				if arg3 and arg6 then
					SMT[arg9][arg3 .. "-" .. arg6] =T;
				end
				
				SMT[arg9]["time"]=T;
				
								
			end
			
			
			if (playerName == arg4 ) then
				wowam.spell.Event_SpellInfo["source_" .. suffix]={[tostring(arg10)]={["Event"]=arg2,["sourceName"]=arg4,["destName"]=arg7,["sourceGUID"]=arg3,["destGUID"]=arg6,["STARTTIME"]=GetTime()}};
			elseif (playerName == arg7 ) then
				wowam.spell.Event_SpellInfo["dest_" .. suffix]={[tostring(arg10)]={["Event"]=arg2,["sourceName"]=arg4,["destName"]=arg7,["sourceGUID"]=arg3,["destGUID"]=arg6,["STARTTIME"]=GetTime()}};
			end
			
			--]]
			
			wowam.spell.Event_SpellInfo.name[tostring(arg10)] = GetTime();
			
			
		end
		
		
		
		if suffix =="INTERRUPT" or suffix =="MISSED" or suffix =="CAST_SUCCESS" or suffix =="CAST_FAILED" or suffix =="CREATE" or suffix =="SUMMON" or suffix =="INSTAKILL" or suffix =="EXTRA_ATTACKS" or suffix =="ENERGIZE" or suffix =="HEAL" then
			wowam.spell.Event_SpellInfo.name[arg3 .. "_" .. tostring(arg10)] = GetTime();
		end
		
		local i=c .. "InRange";
		if arg12 and prefixx then amrsdt("function "..i.."() local prefix='suffix == INTERRUP or suffix==CAST_SUCCESS or suffix==CAST_FAILED or suffix==CREATE'; return 1 ; end") end
	--[[	
		if (suffix=="CAST_FAILED") and UnitGUID("player")== arg3 and arg10 then	
		
		if wowam_config.FAILED_TEXT[arg12] and wowam.sys.SPELL_FAILED.SPELL_UNIT then
		
			if not wowam.sys.SPELL_FAILED.SPELLINF[wowam.sys.SPELL_FAILED.SPELL_UNIT] then
				wowam.sys.SPELL_FAILED.SPELLINF[wowam.sys.SPELL_FAILED.SPELL_UNIT]={};
			end
		
			wowam.sys.SPELL_FAILED.SPELLINF[wowam.sys.SPELL_FAILED.SPELL_UNIT]["FAILED_TEXT"]=arg12;
			wowam.sys.SPELL_FAILED.SPELLINF[wowam.sys.SPELL_FAILED.SPELL_UNIT]["TIME"]=GetTime();
			
		
		--print(arg12,arg10,wowam.sys.SPELL_FAILED.SPELL_NAME,GetTime() - wowam.sys.SPELL_FAILED.SPELL_TIME<0.7)
			if GetTime() - wowam.sys.SPELL_FAILED.SPELL_TIME<0.7 and wowam.sys.SPELL_FAILED.SPELL_NAME== arg10 then
					
					--if not wowam.sys.SPELL_FAILED.SPELLINF then
					
					--	wowam.sys.SPELL_FAILED.SPELLINF={};

					--end	
					
					if wowam.sys.SPELL_FAILED.SPELLINF[wowam.sys.SPELL_FAILED.SPELL_UNIT] then
						
						if not wowam.sys.SPELL_FAILED.SPELLINF[wowam.sys.SPELL_FAILED.SPELL_UNIT][arg10] then
							wowam.sys.SPELL_FAILED.SPELLINF[wowam.sys.SPELL_FAILED.SPELL_UNIT][arg10]={};
						end
						
					else
						wowam.sys.SPELL_FAILED.SPELLINF[wowam.sys.SPELL_FAILED.SPELL_UNIT]={};
						wowam.sys.SPELL_FAILED.SPELLINF[wowam.sys.SPELL_FAILED.SPELL_UNIT][arg10]={};
						
					end
					
					wowam.sys.SPELL_FAILED.SPELLINF[wowam.sys.SPELL_FAILED.SPELL_UNIT][arg10]["FAILED_TEXT"]=arg12;
					wowam.sys.SPELL_FAILED.SPELLINF[wowam.sys.SPELL_FAILED.SPELL_UNIT][arg10]["TIME"]=GetTime();
					
					
					if wowam.sys.SPELL_FAILED.SPELLINF[arg10] then
						
						if not wowam.sys.SPELL_FAILED.SPELLINF[arg10][wowam.sys.SPELL_FAILED.SPELL_UNIT] then
							wowam.sys.SPELL_FAILED.SPELLINF[arg10][wowam.sys.SPELL_FAILED.SPELL_UNIT]={};
						end
						
					else
						wowam.sys.SPELL_FAILED.SPELLINF[arg10]={};
						wowam.sys.SPELL_FAILED.SPELLINF[arg10][wowam.sys.SPELL_FAILED.SPELL_UNIT]={};
						
					end
					
					wowam.sys.SPELL_FAILED.SPELLINF[arg10][wowam.sys.SPELL_FAILED.SPELL_UNIT]["FAILED_TEXT"]=arg12;
					wowam.sys.SPELL_FAILED.SPELLINF[arg10][wowam.sys.SPELL_FAILED.SPELL_UNIT]["TIME"]=GetTime();
					
					wowam.sys.SPELL_FAILED.SPELLINF[arg10]["FAILED_TEXT"]=arg12;
					wowam.sys.SPELL_FAILED.SPELLINF[arg10]["TIME"]=GetTime();
				
			
					--print(wowam.sys.SPELL_FAILED.SPELLINF[wowam.sys.SPELL_FAILED.SPELL_UNIT][arg10],wowam.sys.SPELL_FAILED.SPELL_UNIT,arg10,GetTime() - wowam.sys.SPELL_FAILED.SPELL_TIME)
			end
			
			
		end
			 
		
			
		end
		 
		--]]
	end
end;amiSpell= spellsh(2);

function wowam_test()
wowam.sys.test =1;
end


function Wowam_AutoScript()

	local s,h;
	s = wowam.sys.automacro.tbl;
		
	if not s then
		return;
	end
	
		if GetTime() - wowam.sys.automacro.StartTime >= wowam.sys.automacro.runtiem then
		
			h = s[wowam.sys.automacro.id];
			if h then
				local _, _, a, b = string.find(h, "(.-)=(.+)")
				
				if not a or not b or tostring(tonumber(b)) ~= b then
					Wowam_Message(wowam.Colors.CYAN .. tostring(h) .. wowam.Colors.RED.." 錯誤!" )
					wowam.sys.automacro.tbl=nil;
					return;
				end
				
				wowam.sys.automacro.StartTime = GetTime() + tonumber(b) ;
				
				
				if wowam.sys.automacro.Tips ==0 then
				Wowam_Message(wowam.Colors.RED.. tostring(wowam.sys.automacro.id) .. ". " .. wowam.Colors.YELLOW .. tostring(a) ..wowam.Colors.CYAN .. " 腳本正在執行..."  )
				end
				
				local zx_time = GetTime()
				
				sdm_RunScript(a);
				
				if wowam.sys.automacro.Tips ==0 then
				Wowam_Message(wowam.Colors.CYAN .. "腳本完成用時:" ..wowam.Colors.YELLOW .. format("%.2f",(GetTime()-zx_time) * 1000) ..wowam.Colors.CYAN .. "毫秒，開始延時 "..  wowam.Colors.RED .. b ..wowam.Colors.YELLOW.." 秒" )
				end
				
				wowam.sys.automacro.id = wowam.sys.automacro.id + 1 ;
			else
				if wowam.sys.automacro.Loop == 0 then
					wowam.sys.automacro.id=1;
				else
					wowam.sys.automacro.id=0;
					wowam.sys.automacro.tbl=nil;
				end
				
			end
		end
	
	


end


function isrunspell(name,tunit,gcd,Special,NOCD,EnergyDemand,NoAc)

	

	local usable, nomana,unita,typenumber,isname;

	local Isa,Macro_Spell ;

	if not Special then
		Special=0;
	end
		
	isname,typenumber,SpellLevel = Wowam_GetSpellinf(name);
	
	if typenumber == -1 then
		return false,typenumber,"無法識別的技能、物品、宏";
	end
	
	if typenumber == 5 then
		return true,typenumber,name .. "(只判斷宏是否存在,忽略宏內容)";
	end
	
	if isname and typenumber == 4 then
		local GetMacroIndex = GetMacroIndexByName(name)
		if GetMacroIndex >0 then
		
			local sepll, rank ,body = GetMacroInfo(GetMacroIndex)
			return 	true,4,sepll,GetMacroIndex,body;
			
		end
	end
	
	
	

	if tunit == nil then
		tunit = "target";
	end
	
	local temp_UnitGUID,unitguid;
	temp_UnitGUID = UnitGUID(tunit);
	
	if tunit=="nogoal" then
		unitguid ="3";
	elseif not wowam.spell.Property[name]["HasRange"] then
		unitguid ="1";
	elseif not temp_UnitGUID then
		unitguid ="0";
	else
		unitguid=temp_UnitGUID;
	end
	
	
	
	
	if typenumber>=1 and typenumber<=3  and wowam.spell.Property[name]["Result"] and wowam.spell.Property[name]["unitguid"] == unitguid then
	
		local temp_GetTime=GetTime();
		local temp_istime = wowam.sys.SpellPropertyTime - (temp_GetTime - wowam.spell.Property[name]["time"]);
	
		if temp_istime > 0 then
			
			
		
			return true,typenumber,"是記憶判斷",nil,nil,nil,nil,nil,temp_istime;
		end
	end
	
	if typenumber==1 then
	
		--if IsSpellConversion(spell,unit) then
			
			
		--end
	
		return amisspell(name,tunit,gcd,Special,isname,NOCD,typenumber,SpellLevel,temp_UnitGUID,unitguid,EnergyDemand,NoAc)
	
	elseif typenumber==2 or typenumber==3 then
	
		
	
		return amisItem(name,tunit,gcd,Special,isname,NOCD,typenumber,SpellLevel,temp_UnitGUID,unitguid,EnergyDemand)
		
	end
	
	
	return false,typenumber,"日!判斷錯誤了，請和開發者聯系";


end


function Wowam_GetSpellinf(spell)
		
	local Macro_Spell = strsub(spell,1,1) ;

	if Macro_Spell == "/" then
		return true,5;
	end
	
	if wowam.spell.Property[spell] then
		if wowam.spell.Property[spell]["type"] then
			return 	true,wowam.spell.Property[spell]["type"];
		end
	end

	if amSetSpellinf_Ex then
		
		 local SSE1,SSE2,SSE3 = amSetSpellinf_Ex(spell);
		 if SSE1 then
			return SSE1,SSE2,SSE3;
		 end
	end
	
	local spellId,slotID,skillType ;
	local spellname,level,powerCost,castTime ;
	
	spellId,slotID,_,_,skillType = amPlayerSpellId(spell);
		
		
	if spellId then
	
		spellname,level, _, powerCost,_,_,castTime = GetSpellInfo(spellId);
		wowam.spell.Property[spell]={};
		wowam.spell.Property[spell]["type"]=1;
		wowam.spell.Property[spell]["typename"]="spell";
		
		wowam.spell.Property[spell]["spellId"]=spellId;
		wowam.spell.Property[spell]["slotID"]=slotID;
		
		--if not wowam.spell.Property[spell]["HasRange"] then
		
			--wowam.spell.Property[spell]["HasRange"]=SpellHasRange(slotID,BOOKTYPE_SPELL);
			--if wowam.spell.Property[spell]["HasRange"] and amSpellIsNoTarge(spell) then
			--	wowam.spell.Property[spell]["HasRange"] = nil;
			--end
			
		--end
		
		wowam.spell.Property[spell]["HasRange"] =amIsNoSpellTarget and not amIsNoSpellTarget(spellId);
		
		wowam.spell.Property[spell]["time"]= GetTime();
		
		wowam.spell.Property[spell]["powerCost"]= powerCost;
		wowam.spell.Property[spell]["castTime"]= castTime;
		wowam.spell.Property[spell]["spellname"]= spellname;
		wowam.spell.Property[spell]["level"]= level;
		
		wowam.spell.Property[spell]["Spell"]= spell;
		if amIsRaidSpell then
		wowam.spell.Property[spell]["RaidSpell"]= amIsRaidSpell(spell);
		else
		wowam.spell.Property[spell]["RaidSpell"]=nil;
		end
		
		wowam.spell.Property[spell]["skillType"]=skillType;
		
		
		return 	true,1,spell,spellId;
	end
	
	local amequipped_cd,temp_amequipped ,temp_Equipped,ItemID = amItemCooldown(spell);
	
	
	if temp_amequipped and temp_Equipped then
		local ItemSpell = GetItemSpell(ItemID);
		local _, _, _, _, _, _, _, _,itemEquipLoc = GetItemInfo(ItemID);
		wowam.spell.Property[spell]={};
		wowam.spell.Property[spell]["type"]=3;
		wowam.spell.Property[spell]["typename"]="equipped";
		
		if itemEquipLoc == "INVTYPE_TRINKET"  and not wowam_config.TRINKET_TARGET then
			
			wowam.spell.Property[spell]["HasRange"]=nil;
		else
			wowam.spell.Property[spell]["HasRange"]=ItemHasRange(ItemID);
			
		end
		
		
		wowam.spell.Property[spell]["time"]= GetTime();
		wowam.spell.Property[spell]["ItemID"]=ItemID;
		wowam.spell.Property[spell]["Spell"]= ItemSpell;
		wowam.spell.Property[spell]["itemEquipLoc"]= itemEquipLoc;
	
		if amIsRaidSpell then
		wowam.spell.Property[spell]["RaidSpell"]= amIsRaidSpell(spell);
		else
		wowam.spell.Property[spell]["RaidSpell"]=nil;
		end
		return 	true,3;
		
	
	elseif temp_amequipped and not temp_Equipped then
		local ItemSpell = GetItemSpell(ItemID);
		local _, _, _, _, _, _, _, _,itemEquipLoc = GetItemInfo(ItemID);
		wowam.spell.Property[spell]={};
		wowam.spell.Property[spell]["type"]=2;
		wowam.spell.Property[spell]["typename"]="item";
		
		if itemEquipLoc == "INVTYPE_TRINKET"  and not wowam_config.TRINKET_TARGET then
		
			wowam.spell.Property[spell]["HasRange"]=nil;
		else
			wowam.spell.Property[spell]["HasRange"]=ItemHasRange(ItemID);
			
		end
		
		
		if wowam.spell.Property[spell]["HasRange"] and amIsNoSpellTarget and amIsNoSpellTarget(ItemID) then
			wowam.spell.Property[spell]["HasRange"] = nil;
		end
		
		wowam.spell.Property[spell]["time"]= GetTime();
		wowam.spell.Property[spell]["ItemID"]=ItemID;
		
		wowam.spell.Property[spell]["Spell"]= ItemSpell;
		wowam.spell.Property[spell]["itemEquipLoc"]= itemEquipLoc;
		--wowam.spell.Property[spell]["RaidSpell"]= amIsRaidSpell(spell);
		return 	true,2;
	end
	
		
		
		
		
	if GetMacroIndexByName(spell) >0 then
	
			
		return 	true,4;
	end

		
		return false,-1;
		
	
	
end

