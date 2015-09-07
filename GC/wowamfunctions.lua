local GetSpellInfo = _G.GetSpellInfo;
local UnitName = _G.UnitName;
local UnitPlayerOrPetInParty = _G.UnitPlayerOrPetInParty;
local UnitPlayerOrPetInRaid = _G.UnitPlayerOrPetInRaid;
local GetRaidRosterInfo = _G.GetRaidRosterInfo;
local UnitClass = _G.UnitClass;
local UnitGroupRolesAssigned = _G.UnitGroupRolesAssigned;
  

local UnitHealth = _G.UnitHealth;
local UnitHealthMax = _G.UnitHealthMax;
local UnitMana = _G.UnitMana;
local UnitManaMax = _G.UnitManaMax;
local UnitDebuff = _G.UnitDebuff;
local UnitBuff = _G.UnitBuff;
local format = format;
local tonumber = tonumber;
local GetTime = _G.GetTime;
local UnitCastingInfo = _G.UnitCastingInfo;
local UnitChannelInfo = _G.UnitChannelInfo;
local GetSpellCooldown = _G.GetSpellCooldown;
local GetItemCooldown = _G.GetItemCooldown;
local GetItemInfo = _G.GetItemInfo;
local IsEquippedItem = _G.IsEquippedItem;
local UnitPower = _G.UnitPower;
local GetShapeshiftFormInfo = _G.GetShapeshiftFormInfo;
local GetPetActionInfo = _G.GetPetActionInfo;

local IsCurrentSpell = _G.IsCurrentSpell;
local UnitGUID = _G.UnitGUID;
local type = type;
local GetSpellBookItemInfo = _G.GetSpellBookItemInfo;
local GetSpellLink = _G.GetSpellLink;
local GetInventoryItemID = _G.GetInventoryItemID;

local GetBagName = _G.GetBagName;
local GetContainerNumSlots = _G.GetContainerNumSlots;
local GetContainerItemID = _G.GetContainerItemID;
local GetUnitSpeed = _G.GetUnitSpeed;

local select = select;
local UnitCanAssist = _G.UnitCanAssist;
local UnitCanAttack = _G.UnitCanAttack;
local IsSpellInRange = _G.IsSpellInRange;
local IsUsableSpell = _G.IsUsableSpell;
local IsUsableItem = _G.IsUsableItem;
local IsItemInRange = _G.IsItemInRange;
local GetMacroIndexByName = _G.GetMacroIndexByName;
local GetMacroInfo = _G.GetMacroInfo;
local ItemHasRange = _G.ItemHasRange;
local UnitIsUnit = _G.UnitIsUnit;
--local next =  _G.next;

local FHenemiesTable = {}; 
local FHenemiesTableTimer = 0;

local AM_GCD_SPELLID =AM_GCD_SPELLID;

local AM_IS_CAST_NAME={};


local SPELLTYPE={};
SPELLTYPE[1]="技能";
SPELLTYPE[2]="物品";
SPELLTYPE[3]="裝備";
SPELLTYPE[4]="宏名";
SPELLTYPE[5]="宏";
SPELLTYPE[-1]="";


local PLAYER_CONTROL_Frame = CreateFrame("Frame");
PLAYER_CONTROL_Frame:RegisterEvent("PLAYER_CONTROL_GAINED");
PLAYER_CONTROL_Frame:RegisterEvent("PLAYER_CONTROL_LOST");
local function PLAYER_CONTROL_Frame_OnEvent(self, event, ...)
	if event == "PLAYER_CONTROL_GAINED" then
		
		PLAYER_CONTROL_Frame.IsControl=false;
	
	elseif event == "PLAYER_CONTROL_LOST" then
		PLAYER_CONTROL_Frame.IsControl=true;
	end
end
PLAYER_CONTROL_Frame:SetScript("OnEvent", PLAYER_CONTROL_Frame_OnEvent);

--判断自己是否失去控制
function amPlayerControl()
	return PLAYER_CONTROL_Frame.IsControl or false;
end

local SpellConversionFrame_Star=false;
local SpellConversionTbl={};
local SpellConversionFrame = CreateFrame("Frame");
SpellConversionFrame:RegisterEvent("SPELLS_CHANGED");
SpellConversionFrame:RegisterEvent("WORLD_MAP_UPDATE");
SpellConversionFrame:RegisterEvent("ZONE_CHANGED");
SpellConversionFrame:RegisterEvent("ADDON_LOADED");

amSpellConversionTbl={};

local amADDON_LOADED=true;
local amADDON_LOADED_T=GetTime();
local SetThreadSpeed_time=GetTime();
local function SpellConversionFrame_OnUpdate()
	
	if amUpSpellTbl and not SpellConversionFrame_Star then
		SpellConversionFrame_Star =true;
		
		SpellConversionTbl = amUpSpellTbl();
		
	end
	
	if amADDON_LOADED and GetTime() - amADDON_LOADED_T >1 then
		
		amADDON_LOADED=false;
		
	end
	
	if GetTime() - SetThreadSpeed_time >0.1 then
		
		SetThreadSpeed_time=GetTime();
		if amSetThreadSpeed then
			amSetThreadSpeed(SuperTreatmentAllDBF.SetThreadSpeed or 5);
		end
		
	end
	
	
end

local function SpellConversionFrame_OnEvent(self, event, ...)
	
	
	if event == "ADDON_LOADED" then
		
		amADDON_LOADED_T=GetTime();
	
	else
		
		if amUpSpellTbl then
		
			SpellConversionTbl = amUpSpellTbl();
			
		end
	
	end

end

SpellConversionFrame:SetScript("OnEvent", SpellConversionFrame_OnEvent);
SpellConversionFrame:SetScript("OnUpdate",SpellConversionFrame_OnUpdate)

function amGetUnitName(unit)
	
	local temp = GetUnitName(unit,true);
	
	if temp then
		temp =gsub(temp," ","");
	end
	
	
	return temp;
	
end

function amGetPlayerBearing()

	local GetPlayerBearing;--	Local definition, remove to make global
	do
		local math=math;--			Local pointer to the Math library
		local mmring=MinimapCompassTexture;--	Pointer to the Compass Ring
		local mmarrow;--			Upvalue to hold the pointer to the Player Arrow

	--	Scan for Player Arrow Texture
		local list={Minimap:GetRegions()};
		for i,j in pairs(list) do
	--		Scan for a no-name texture with a specific file loaded.
			if j:IsObjectType("Texture") and not j:GetName() and j:GetTexture():lower()=="interface\\minimap\\minimaparrow" then
				mmarrow=j;--	Found it, save and stop scanning
				break;
			end
		end
	--print(mmarrow)
	--	Function definition
		GetPlayerBearing=function()
			local obj=GetCVar("rotateMinimap")=="1" and mmring or mmarrow;--	Use the correct texture
			if not obj then return 0; end--						Hopefully this doesn't happen

			local fx,fy,bx,by=obj:GetTexCoord();--	Only need front and back of one side (left is returned first)
			local a,dx,dy=0,fx-bx,by-fy;--		Y-Axis flipped for textures so Y values are swapped
			if obj==mmring then dx=-dx; end--	Compass Ring spins the opposite direction
			if dy==0 then--				Can't divide by zero
				a=dx<0 and math.pi or 0;--	Could either be one or the other in this condition
			else
				a=math.atan(dx/dy)+(dy<0 and math.pi or 0);--	atan() only returns half of the values we need, add PI when needed
			end

			return a;
		end
	end
	return GetPlayerBearing();
end

function amGetSpellBaseCooldown(spell)
	if not spell then
		return -1;
	end
	
	local id;
	
	if type(spell) == "string" then
	
		id = amPlayerSpellId(spell);
	
	elseif type(rune) == "number" then
	
		id = spell;
	
	else
	
		return -1;
		
	end
	
	
	
	if id then
	
		local cd = GetSpellBaseCooldown(id);
		
		if cd then
			return cd/1000;
			
		else
			return -1;
		end
	
	end
	
	
	
end
 
function BeeIsRun(Spell,Unit,GCD,Special,IsAmRun,NOCD,EnergyDemand)
	
	return amisr(Spell,Unit,GCD,Special,IsAmRun,NOCD,EnergyDemand);
	
end

function amfindSpellItemInf(info1)

	
local infoType;
	
	
if GetSpellInfo(info1) then
		
     infoType = "spell";
	
end
		
	
	
if GetItemInfo(info1) then
		
     infoType = "item";
	
	
	
end
	
if not infoType then
	local spellid = amfindSpellId(info1)
		
		
	if spellid then
			
	    _,rank,Texture=GetSpellInfo(spellid)
			
			
	    return spellid,"",rank,Texture,"";
			
		
	end
		
		
return;
		
	
end
	
	
if infoType=="item" then
			
		
   local spellId;
		
   local name,itemLink,itemRarity,itemLevel,itemMinLevel,itemType,itemSubType,itemStackCount,itemEquipLoc,Texture,itemSellPrice;
   name,itemLink,itemRarity,itemLevel,itemMinLevel,itemType,itemSubType,itemStackCount,itemEquipLoc,Texture,itemSellPrice=GetItemInfo(info1);
    _,_,_,_,spellId,_,_,_,_,_,_,_,_,_=string.find(itemLink,"|?c?f?f?(%x*)|?H?([^:]*):?(%d+):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%-?%d*):?(%-?%d*):?(%d*)|?h?%[?([^%[%]]*)%]?|?h?|?r?")
	
		
		
    --print("Item",spellId);
		
		
	if type(spellId) == "string" then
			
	    spellId = tonumber(spellId);
		
	end
		
		
	return spellId,itemLink,itemSubType,Texture,infoType;
		
		
	
elseif infoType=="spell"  then
		
		
	    local spellLink,spellName,spellRank,spellId,Texture;
							
		--_,spellId = GetSpellBookItemInfo(info1,"player");
		spellId = amPlayerSpellId(info1);

		
		spellName,spellRank,Texture = GetSpellInfo(spellId);
		
		spellLink,_=GetSpellLink(spellId);
			
		
		if not spellLink then
		
		    return;
		
		end
			
		
		if type(spellId) == "string" then
			
		    spellId = tonumber(spellId);
		
		end
		
		
return spellId,spellLink,spellRank,Texture,infoType;
		
		
	--print("Spell",spellId);
		
				
	
end
	
	
	

end


function amPlayerSpellId(name)

	if not name then
		return;
	end

	local i = nil;
	local spellName, spellSubName,skillType, spellId  ;
	
	
	
	
	
		skillType, spellId = GetSpellBookItemInfo(name);
		
		if not spellId and GetSpellLink(name) then
			spellId = select(3, string.find(GetSpellLink(name), "spell:(%d+)"))
			skillType="SPELL";
			if spellId then
				spellId = tonumber(spellId);
			end
			
		end
		
		if not spellId then
			if SpellConversionTbl[name] and SpellConversionTbl[name]["name"]~="" then
				
				spellId = SpellConversionTbl[name]["spellIdEx"];
			
			end
		end
		
		
		
		if spellId then
			
			local spellName, spellSubName =GetSpellInfo(spellId);
			
			return spellId , i,spellName,spellSubName,skillType;
			
		   
		
		end
	
	

	


	
end



function amPlayerItemId(name)

	local ItemId,spell,bagName;
	for i=1 , 23 do
				
				
				ItemId = GetInventoryItemID("player",i)
					if ItemId then
						spell = GetItemInfo(ItemId)
				
						if spell == name then
												
							
							return ItemId;
						
							
						
						end
					end
		
		
	end
	
	
	for i=0 , 10 do
	
		bagName = GetBagName(i);
		if bagName then
		
			local n = GetContainerNumSlots(i)
			
			for k=1 , n do
				
							
				ItemId = GetContainerItemID(i, k);
				
				if ItemId then
					spell = GetItemInfo(ItemId);
					
					if spell and spell == name then
					
						return ItemId;
					end
				end
			
			end
		end

	end
	
	return nil;
	
end



function amisr(Spell,Unit,GCD,Special,IsAmRun,NOCD,EnergyDemand,NoAc)--是否可以對此目標施放技能

	if not amerr or not amerr() then
			if not amerrtime then
				amerrtime=GetTime();
			end
			
			if GetTime() - amerrtime >3 then
				print("|cffff0000錯誤: |cffffff00當前客戶端版本無法判斷，請連接客戶端或更新！")
				amerrtime=GetTime();
			end
			return;
	end
	
	local A,B,C,D,E,F,G,H,I;
	
	if not Spell then
		return;
	end
	
	if not Unit  then
			Unit = "target";
	end
	
	if amSpellConversion then
		local SCID,SCNAME = amSpellConversion(Spell);
		if SCID then
			Spell=SCNAME;
		end
		
	end
	
		
	
	
	local T_amsft,T_amsft1 = amsft(Spell,Unit)
	
	if  not T_amsft then
	
		A=T_amsft;
		B=wowam.spell.Property[Spell] and wowam.spell.Property[Spell]["type"];
		C=T_amsft1;
		D=0;
		E="";
		F="";
		G="";
		H="";
	
	else
		
		
	
	
		A,B,C,D,E,F,G,H,I=isrunspell(Spell,Unit,GCD,Special,NOCD,EnergyDemand,NoAc);
	end
	
	
	
	
	
	--if "是記憶判斷" == C then
	--	print(A,B,C,D,E,F,Spell,Unit,I)
	--end
	if  wowam_config.Amisr["顯示調試信息"] and not IsAmRun  then
		local A1;
		
		if A then
			A1="通過" 
		else
			A1="拒絕"
		end	

		if not C then
			C="" 
		end	
		
		if not Spell then
			Spell="" 
		
		end	
		
		if not D then
			D="-1" 
		
		end	
		
		
		local A1=format(wowam_config.Formats["判斷結果"],A1) .. ";";
		local A2=format(wowam_config.Formats["技能類型"],amiif(SPELLTYPE[B],SPELLTYPE[B],"")) .. ";";
		local A3=format(wowam_config.Formats["說明"],C) .. ";";
		local A4=format(wowam_config.Formats["施放目標"],Unit) .. ";";
		local A5=format(wowam_config.Formats["技能名稱"],Spell) .. ";";
		local A6=format(wowam_config.Formats["冷卻時間"],D);
		
		local index=1;
		local inf={};
	
		if wowam_config.Amisr["顯示判斷結果"] then
			inf[index]=A1;
			index=index+1;
		end
		
		if wowam_config.Amisr["顯示技能類型"] then
			inf[index]=A2;
			index=index+1;
		end
		
		if wowam_config.Amisr["顯示說明"] then
			inf[index]=A3;
			index=index+1;
		end
		
		if wowam_config.Amisr["顯示施放目標"] then
			inf[index]=A4;
			index=index+1;
		end
		
		if wowam_config.Amisr["顯示技能名稱"] then
			inf[index]=A5;
			index=index+1;
		end
		
		if wowam_config.Amisr["顯示冷卻時間"] then
			inf[index]=A6;
			index=index+1;
		end
		
		
		if wowam_config.Amisr["顯示成功的調試信息"] and A then
			if wowam_config.Amisr["過濾調試信息"] then
				local strtemp=A1..A2..A3..A4..A5..A6;
				
				if wowam_config.Formats["過濾調試信息"]~="" and amfind(strtemp,wowam_config.Formats["過濾調試信息"],-1) then
				
				
					print(wowam.Colors.RED .. date("%H:%M:%S"))
					
					for i,v in ipairs(inf) do
					
						print(i,wowam.Colors.GREEN..v)
									
						
					end
	
					--print(date("%H:%M:%S"),wowam.Colors.RED .. A1..wowam.Colors.GREEN..A2..wowam.Colors.WHITE..A3..wowam.Colors.MAGENTA..A4..wowam.Colors.YELLOW..A5..wowam.Colors.CYAN ..A6)
				end
			
			else
			
				print(wowam.Colors.RED .. date("%H:%M:%S"))
					
					for i,v in ipairs(inf) do
					
						print(i,wowam.Colors.GREEN..v)
									
						
					end
			
			
				--print(date("%H:%M:%S"),wowam.Colors.RED .. A1..wowam.Colors.GREEN..A2..wowam.Colors.WHITE..A3..wowam.Colors.MAGENTA..A4..wowam.Colors.YELLOW..A5..wowam.Colors.CYAN ..A6)
			--date("%a %b %d %H:%M:%S %Y")
			end
		end
		
		if wowam_config.Amisr["顯示失敗的調試信息"] and not A then
		
			if wowam_config.Amisr["過濾調試信息"] then
				local strtemp=A1..A2..A3..A4..A5..A6;
				
				if wowam_config.Formats["過濾調試信息"]~="" and amfind(strtemp,wowam_config.Formats["過濾調試信息"],-1) then
				
				
					print(wowam.Colors.RED .. date("%H:%M:%S"))
					
					for i,v in ipairs(inf) do
					
						print(i,wowam.Colors.GREEN..v)
									
						
					end
					
					--print(date("%H:%M:%S"),wowam.Colors.RED .. A1..wowam.Colors.GREEN..A2..wowam.Colors.WHITE..A3..wowam.Colors.MAGENTA..A4..wowam.Colors.YELLOW..A5..wowam.Colors.CYAN ..A6)
				end
			
			else
			
				print(wowam.Colors.RED .. date("%H:%M:%S"))
					
					for i,v in ipairs(inf) do
					
						print(i,wowam.Colors.GREEN..v)
									
						
					end
					
				--print(date("%H:%M:%S"),wowam.Colors.RED .. A1..wowam.Colors.GREEN..A2..wowam.Colors.WHITE..A3..wowam.Colors.MAGENTA..A4..wowam.Colors.YELLOW..A5..wowam.Colors.CYAN ..A6)
			end
		end
	end
	
	
	
	if A then
		isrunspell_Result(Spell,Unit,A)
	end
	
	return A,B,C,D,E,F,Spell,Unit,I
end


function amgj() --攻擊姿態
return wowam.player.Combat;
end

function amuca(Unit) --是否可以攻擊指定目標
	if Unit then
	return UnitCanAttack("player", Unit)
	else
	return UnitCanAttack("player", "target")
	end
end

function amut(ut)
	if ut~=nil then
		
		if not (Wowam_Ut(ut)) then
			return false;
		end	
		return 	true;	
	end
	
	
	
end


function amisspell(name,tunit,gcd,Special,isname,NOCD,typenumber,SpellLevel,temp_UnitGUID,unitguid,EnergyDemand,NoAc)
	
	if amisspell_SpellConversion then
	
		local ASSC1,ASSC2,ASSC3,ASSC4,ASSC5,ASSC6 = amisspell_SpellConversion(name,tunit,gcd,Special,isname,typenumber,SpellLevel,temp_UnitGUID,unitguid);
		
		
		if ASSC1 then
			return ASSC1,ASSC2,ASSC3,ASSC4,ASSC5,ASSC6;
		elseif not ASSC1 and ASSC2 ~= -100 then
		
			return ASSC1,ASSC2,ASSC3,ASSC4,ASSC5,ASSC6;
		end
	end
	
	
	if wowam_config.SetGCD and not gcd then
		
		if amGCD()> wowam_config.SetGCD_Time then
			
			return false,typenumber,"公共CD沒好",Cooldown;
		end
		
	end
	
		
	local spellId = wowam.spell.Property[name]["spellId"]
	--local slotID = wowam.spell.Property[name]["slotID"];
	
	--if GetSpellBookItemInfo(slotID, "player") == "FUTURESPELL" then
	--	return false,typenumber,"技能沒學習不可用",Cooldown;
	--end
	
	
	
	if amIsSpellShapeshift and not amIsSpellShapeshift(spellId) then
		return false,typenumber,"技能姿態不符合",Cooldown;
	end
	
	if amIsActivation  then
	
		local  temp_Activation,temp_Activation_1,temp_Activation_2,temp_Activation_3 = amIsActivation(spellId,tunit,name);
		--print(temp_Activation,temp_Activation_1,temp_Activation_2,temp_Activation_3)
		if not temp_Activation_2 then
		
			if temp_Activation then
				
				if temp_Activation_1 then
					return true,typenumber,"技能激活",Cooldown;
				end
			else
				
				if temp_Activation_1 then
					return false,typenumber,temp_Activation_1,Cooldown;
				else
					return false,typenumber,"技能沒激活不可用",Cooldown;
				end
				
			end
			
		elseif temp_Activation_3 then
		
			return false,typenumber,"技能沒激活不可用",Cooldown;
		end
		
	end
	
	
	
	if wowam.spell.Property[name]["RaidSpell"]  and tunit ~= "nogoal" then
		if wowam.spell.Property[name]["RaidSpell"] ==3 then
			if not(UnitPlayerOrPetInRaid(tunit) or UnitGUID(tunit) == UnitGUID("player")) then
			return false,typenumber,"目標只能是小隊或者團隊";
			end
		
		
		elseif not (wowam.spell.Property[name]["RaidSpell"] ==2 and (UnitPlayerOrPetInRaid(tunit) or UnitGUID(tunit) == UnitGUID("player"))) then
			return false,typenumber,"目標只能是小隊";
		
		elseif not (wowam.spell.Property[name]["RaidSpell"] ==1 and  UnitGUID(tunit) == UnitGUID("player")) then
			return false,typenumber,"目標只能是自己";
		end
		
		
		
		
	end
	
	
	
	
	
	local T_temp1 = GetUnitSpeed("player")
	--local T_temp2 = wowam.spell.Property[name]["castTime"] --select(7,GetSpellInfo(name))
	local T_temp2 = select(7,GetSpellInfo(name));
	
	--if (not(amIsMoveSpellAll and amIsMoveSpellAll(spellId,tunit,name))) and (not(amIsMoveSpell and amIsMoveSpell(spellId,tunit,name))) then
	
	
		--if T_temp2 and T_temp1 and T_temp2 >0 and T_temp1>0 then
			
			--return false,typenumber,"你移動中",Cooldown;
		--end
	--end
		
	
	if  (wowam.spell.Property[name]["HasRange"] and tunit ~= "nogoal")  then
		
		
		if not temp_UnitGUID   then
			
			return false,typenumber,"需要個目標(如有問題請嘗試用“無目標”參數或聯繫作者)";
		end
		
		
		local UnitCan_a,amIsSpellInRange,amSpellHasRange
		

		UnitCan_a = UnitCanAssist("player", tunit)  or  UnitCanAttack("player", tunit)
		--x-amIsSpellInRange =IsSpellInRange(name,tunit)
		--amSpellHasRange=wowam.spell.Property[name]["HasRange"]
		--amIsSpellInRange = IsSpellInRange(slotID, "spell", tunit) --x
		amIsSpellInRange = IsSpellInRange(name,tunit) --x
		if not amIsSpellInRange and SpellConversionTbl[name] and SpellConversionTbl[name]["name"]~="" then
			
			amIsSpellInRange = IsSpellInRange(SpellConversionTbl[name]["name"], tunit);
		
		end
		
		if  not amIsSpellInRange and amIsSpellCastTarget then
					
			if amIsSpellCastTarget(spellId,tunit) then
		  			
				amIsSpellInRange=1;
			end
			
		end
		
		if wowam.spell.Property[name]["IsSpellInRange"] and not amIsSpellInRange then
			return false,typenumber,"目標死亡或者不能對其施放",Cooldown;
		end
		
		if amIsSpellInRange and not wowam.spell.Property[name]["IsSpellInRange"] then
		
			wowam.spell.Property[name]["IsSpellInRange"]=amIsSpellInRange;
			
		end

		if  not UnitCan_a then
			
			return false,typenumber,"技能距離太遠",Cooldown;
		end

		if UnitCan_a then
		
			if amIsSpellInRange==0  then
				
				return false,typenumber,"超距離",Cooldown;
			elseif amIsSpellInRange==nil then
				
				return false,typenumber,"不能對此目標施法(請嘗試用“無目標”參數或聯繫作者)",Cooldown;
				
				
				
			end
				
		end
	
	
	end
	
	
	
	--xx- local Cooldown = amSpellCooldown(name);
	local Cooldown = amSpellCooldown(spellId);
	local amact_timp =0;

	if wowam.spell.Property[name]["castTime"]<=0 then
		Cooldown=Cooldown-wowam_config.PromptSpellAttackTime;
	else
		
		
		if not NoAc then
			amact_timp,_,acc =amact("player")
			
			--if acc == name  and not NOCD then
		
			if amact_timp ~= -1 and amact_timp > wowam_config.SpellAttackTime and not NOCD then
			
			return false,typenumber,"施放技能中",Cooldown;
			end
		end
		
		Cooldown=Cooldown-wowam_config.SpellAttackTime;
	
	end
		

	
	if Cooldown >0  and not NOCD then
		
		return false,typenumber,"技能冷卻中",Cooldown;
	end
	
	--x- if IsCurrentSpell(name) and amact_timp<=0 then
	--if IsCurrentSpell(slotID,BOOKTYPE_SPELL) and amact_timp<=0 then --x
	--if amIsCurrentSpell then
		
		
		
	--if amIsCurrentSpell(spellId) and amact_timp<=0 then --y
			
			
	--return false,typenumber,"正在或者準備施放技能中",Cooldown;
		
	--end
	
	
	--else
	
	if select(7,GetSpellInfo(spellId))==0 and IsCurrentSpell(spellId) then
	
	else
	
		if (IsCurrentSpell(spellId) and amact_timp<=0  and not NOCD) then --y
			--print(amIsCurrentSpellEx(spellId),spellId)
			return false,typenumber,"正在或者準備施放技能中",Cooldown;
		end
		
	end
	
	--end
	--x- local usable, nomana = IsUsableSpell(name);
	--y- local usable, nomana = IsUsableSpell(slotID,BOOKTYPE_SPELL);
	local usable, nomana = IsUsableSpell(name);
	
		if not usable and not nomana  then
			usable, nomana = IsUsableSpell(spellId);
		end
	
		--if amr("player") < wowam.spell.Property[name]["powerCost"]  then
				
		--	  return false,typenumber,"能量不足",Cooldown;
			
		--end	
		
	local _,_, _, powerCost = GetSpellInfo(spellId);

		
		
		if amSpellIsPowerNumber and amSpellIsPowerNumber(spellId) then
		
			local n = amSpellIsPowerNumber(spellId);
			if amr("player") < n  then
				
			  return false,typenumber,"能量不足",Cooldown;
			
			end	
			
		else
		
			if EnergyDemand then
			
				if amr("player") < EnergyDemand  then
					
				  return false,typenumber,"能量不足",Cooldown;
				
				end	
			
			else
			
				if Special==1 or (amSpellIsPowerCost and amSpellIsPowerCost(name)) then
					--if amr("player") < wowam.spell.Property[name]["powerCost"]  then
					if amr("player") < powerCost  then
					
					  return false,typenumber,"能量不足",Cooldown;
					
					end	
				else
				
					
					
						if not usable and not nomana  then
						
							--if  wowam.spell.Property[name]["HasRange"] then
								
								if amIsSpellShapeshift and not amIsSpellShapeshift(spellId) then
									return false,typenumber,"技能姿態不符合",Cooldown;
								
								else
									return false,typenumber,"該技能目前無法判斷,請參考amisr第四參數或聯系開發者.",Cooldown;
								end
							
								
							--end
								
						
						elseif nomana then
						
							return false,typenumber,"能量不足",Cooldown;
						
						end
						
					
				end
				
			end
			
		end
		
		
	
	
	

	
	
	return true,typenumber,"",Cooldown;
	
	
	

end


function amisItem(name,tunit,gcd,Special,isname,NOCD,typenumber,SpellLevel,temp_UnitGUID,unitguid,EnergyDemand)
	
	local ItemID = wowam.spell.Property[name]["ItemID"];
	
	if  wowam.spell.Property[name]["itemEquipLoc"] ~= "" and not IsEquippedItem(ItemID) then
		
		return false,typenumber,"请装备/佩戴该物品";
		
	end
	
	
	if  wowam.spell.Property[name]["HasRange"] and tunit ~= "nogoal" then
		
		
		if not temp_UnitGUID then
			
			return false,typenumber,"需要個目標(如有問題請嘗試用“無目標”參數或聯繫作者)";
		end
	
	
	end
	
	
	--x- local Cooldown = amItemCooldown(name);
	
	local Cooldown = amItemCooldown(ItemID); --x
	
	if Cooldown >0 then
		
		return false,typenumber,"物品冷卻中",Cooldown;
	end
	
	
	--x- local usable, nomana = IsUsableItem(name);
	local usable, nomana = IsUsableItem(ItemID); --x
	if not usable  then
		
		return false,typenumber,"物品不可用",Cooldown;
 
	end
	
	
	if tunit == "nogoal" or not wowam.spell.Property[name]["HasRange"] then
		return true,typenumber,"",Cooldown;
	end
	
	
 
	
	--xx - Isa =IsItemInRange(name,tunit)
	
	Isa =IsItemInRange(ItemID,tunit) --xx
	
	if  not (UnitCanAssist("player", tunit)  or  UnitCanAttack("player", tunit))  and tunit ~= "nogoal" then
				
		return false,typenumber,"物品距離太遠",Cooldown;
	end
	
	if not Isa   then
		return false,typenumber,"不能對此目標施法(請嘗試用“無目標”參數或聯繫作者)",Cooldown;
	end
	
	
	
	
	return true,typenumber,"",Cooldown;
		

end




function amr(Unit,p,q) --目標的法力、怒氣、能量 值或百分比等。
	
	if Unit == nil or Unit == "p"  or Unit == 0 then
		Unit = "player"
	
	elseif Unit == 1 or Unit == "t" then
		Unit = "target"
	
	elseif Unit == 3 or Unit == "f" then
		Unit = "focus"
	
	elseif Unit == 4 or Unit == "pet" then
		Unit = "pet"
	
	end
	
	if not amGetUnitName(Unit) then
		return -1;
	end
	
	
	local a,b,c;
	
	a = UnitMana(Unit);
	b = UnitManaMax(Unit);
	c= b-a;
	
	if q == nil or q == 0 then
	
		
		if p == "%" or p == 1 then
			return ((a / b) * 100);
		else
			return a;
		end
	else
		
		if p == "%" or p == 1 then
			return ((c / b) * 100);
		else
			return c;
		end
	
	end
	

end





function aml(Unit,p,q) --目標的生命值或百分比。
	
	if not Unit  then
		Unit = "player"
	end
	
	if  type(Unit) ~= "string" then
		return -1;
	end
		
	if not amGetUnitName(Unit) then
		return -1;
	end
	
	
	local a,b,c;
	
	a = UnitHealth(Unit);
	b = UnitHealthMax(Unit);
	c= b-a;
	
	if q == nil or q == 0 then
	
		if p == "%" or p == 1 then
			return ((a / b) * 100);
		else
			return a;
		end
	else
		
		if p == "%" or p == 1 then
			return ((c / b) * 100);
		else
			return c;
		end
	
	end
	

end

function amruneid(rune) -- 獲得指定符文ID，返回其id。return ID

	if "冰霜符文" == rune or "Frost Rune" == rune then
		rune = 3 ;
		
	elseif "邪恶符文" == rune or "穢邪符文" == rune or "Unholy Rune" == rune then
		rune = 2 ;
		
	elseif "鲜血符文" == rune or "血魄符文" == rune or "Blood Rune" == rune then
		rune = 1 ;
		
	elseif "死亡符文" == rune or "Death Rune" == rune then
		rune = 4 ;
		
	else
		rune = -1;
		
	end
	return rune;
end

function amstrbyte(str)
	local n=strlen(str);
	local tbl={};
	for i=1, n do
			
			tbl[i]=strbyte(str,i)
				
	end
	
	return tbl;
end
	
function amrunecount(runeid) --獲得指定符文數量。 return N

	local runeType,i,n;
	
	n=0;
	
	for i=1, 6 do
		runeType = GetRuneType(i);
		if runeType ==runeid then
		n = n+1;				
		end
			
	end
	return n;
end

function amen(rune) --返回某種符文可用數量,及冷卻時間。return N,CD1,CD2
	local id,cd;
	local cd1=-1;
	local cd2=-1;
	
	if type(rune) == "number" or type(rune) == "string" then
		if type(rune) == "string" then
			id = amruneid(rune);
			if id == -1 then
				return -1,-1,-1;
			end
		else
			if rune>=1 and rune<=6 then
				id = rune;
			else
				return -1,-1,-1;
			end
			
		end
	else
	return -1,-1,-1;
	
	end
	
		
	local runeType,i,n;
	local start, duration, runeReady;
	
	n = 0;
	
	for i=1, 6 do
		runeType = GetRuneType(i);
		if runeType == id then
			start, duration, runeReady = GetRuneCooldown(i);
		
			cd = duration-(GetTime()-start);
			if cd <= 0 then
				cd = 0;
			end
			
			if cd <=0 then
				n = n +1;
			end
			if cd1 == -1 then
				cd1 = cd;
			else
				cd2 = cd;
			end
		end
		
	end
	
	return n,cd1,cd2;
	
end

function amGetRuneCooldown(id)
	
	if id and id>=1 and id<=6 then
	
		local start, duration, runeReady = GetRuneCooldown(id);
			
		local cd = duration-(GetTime()-start);
		if cd <= 0 then
			cd = 0;
		end
				
		return cd;
		
	else
	
		return -1;
	
	end
	

end

function amecd(rune) --返回某種符文其中最快冷卻時間。return N,CD1,CD2
	local n,cd1,cd2 = amen(rune);
	
	if n == 0 then
		return -1;
	end
	
	
	if  n == 1 and cd1 >= 0 then
		return cd1;
	elseif cd1 == 0 and cd2 == 0 then
		return 0;
	elseif (n == 2) and cd1 >0 and cd2 == 0 then
		return cd1;
	elseif (n == 2) and cd2 >0 and cd1 == 0 then
		return cd2;
	elseif (n == 2) and (cd1 <= cd2) and cd1 >0 and cd2>0  then
		return cd1;		
	elseif (n == 2) and (cd2 <= cd1) and cd1 >0 and cd2>0  then
		return cd2;	
	end
	
	return 0;
	
end

function amtotem(totem) --圖騰CD
		if totem==nil then
			return -1;
		end
		
		if totem=="" then
			return -1;
		end
		
		for i = 1, 4 do
			local seconds
  		local haveTotem, name, startTime, duration, icon = GetTotemInfo(i)
  			if name and haveTotem then
		  		if haveTotem and string.len(name) > 0 then
		  				
		  				
		  				
		  				if  totem == name  then
		  					seconds=GetTotemTimeLeft(i)
		  					
		  					return seconds;
		  					
		  				end
		  			
				
				
					
		  		end
		  		
		  	end
  
  
		end
	return -1;
end


function amtotemtype(Type) -- 圖騰類型

	if type(Type) ~= "number" then
	Wowam_Message(wowam.Colors.RED.."錯誤：" .. wowam.Colors.CYAN .. "參數類型錯誤，請使用整數值");
	return nil,-1
	end

		local haveTotem, name = GetTotemInfo(Type)
				if name and haveTotem then
					if haveTotem and string.len(name) > 0 then
					return name,GetTotemTimeLeft(Type)
					end
				end
			
	return nil,-1	
	
end

function amtmiss(missType) --你的攻擊給當前目標【missType】了。過去時間秒數
	
	return ammiss(missType,"source","target")
end

function ampmiss(missType) --你【missType】了當前目標的攻擊	。過去時間秒數
	return ammiss(missType,"dest","target")
end

function ammiss()
 print("本函數已經被取消,請使用 amMissInfTime 函数")
end

function amMissInfTime(missType,SourceUnit,DestUnit) --獲得未造成傷害的原因的技能過去時間秒數
	--print("BA")

--[[
	-------------參數：missType-----------------------------------------
	missType（未造成傷害類型），表示未造成該傷害的原因。
	原因 	中文 
	"DODGE" 被躲閃 
	"ABSORB" 被吸收 
	"RESIST" 被抵抗 
	"PARRY" 被招架 
	"MISS" 未擊中 
	"BLOCK" 被格擋 
	"REFLECT" 被反射 
	"DEFLECT" 偏斜 
	"IMMUNE" 免疫 
	"EVADE" 被閃避
	-----------參數：name---------------------
	"source"	你未造成傷害。 	如果 missType 是 【DODGE】 Name 是【target】的話，表示你的攻擊給當前目標【躲閃】了
	"dest"		對你未造成傷害。如果 missType 是 【DODGE】 Name 是【target】的話，表示你【躲閃】了當前目標的攻擊	
	
--]]
	local DESTGUID = false;
	local SOURCEGUID = false;

	if SourceUnit and not UnitGUID(SourceUnit) then
		--print("1A")
		return nil;
	elseif SourceUnit and UnitGUID(SourceUnit) then
		SOURCEGUID = UnitGUID(SourceUnit);
	end
	
	--print(SourceUnit,DestUnit)
	
	if DestUnit and not UnitGUID(DestUnit) then
		--print("2A")
		return nil;
	elseif DestUnit and  UnitGUID(DestUnit) then
		DESTGUID = UnitGUID(DestUnit);
		
	end
	
	if not DestUnit and not SourceUnit then
		--print("AA")
		return nil;
	end
	
	
	
	
	
	local SMT= wowam.spell.Event_SpellInfo.missType;
	
	if not SMT[missType]  then 
		--print("3A")
		return nil; 
	end
	
	local T=SMT[missType];
	local temp;
	
	if SOURCEGUID and not DESTGUID then
		
		temp = "sourceGUID-" .. SOURCEGUID;
		
		
	elseif not SOURCEGUID and DESTGUID then
		
		temp = "destGUID-" .. DESTGUID;
		
		
	elseif SOURCEGUID and DESTGUID then
		
		temp = SOURCEGUID .. "-" .. DESTGUID;
		
		
	end
	
	--print(temp,T[temp])
	if T[temp] then
			
		return GetTime() - T[temp]
	else
			--print("C")
		return;
	end
	
	--print("4A")
	
end

function amjl_old1(Unit)-- 判斷距離
	if not Unit then
		Unit = "target";
	end
	if not amGetUnitName(Unit) then
		return 99999;
	end
	

	
	
local _,jl = wowam_rc:getRange(Unit)

	if not jl  then
		return 99999;
	end
	
	return jl;
	
end

function amjl_old(Target)-- 判斷距離
	--local c = TargetRangeWatchFrameStatusBar1String1:GetText()
	local c=nil;
	local j=0;
	local rdf=nil;
	local rdt=nil;


	rdt = RangeDisplayFrameText_playertarget
	rdf = RangeDisplayFrameText_focus
	
	if rdt == nil or rdf == nil then
	
		return -2;
	end

	--if not RangeDisplayFrameText_playertarget:IsVisible()  then
	
	--	return -3;
	--end
	
	if not Target then
		Target = "target";
	end

	if Target == "focus" and RangeDisplayFrameText_focus then
	c = RangeDisplayFrameText_focus:GetText()

	elseif Target == "target" and RangeDisplayFrameText_playertarget then
	c = RangeDisplayFrameText_playertarget:GetText()
	
	elseif Target == "pet" and RangeDisplayFrameText_pet then
	c = RangeDisplayFrameText_pet:GetText()
	else
	return -1;
	
	end
	
	--DEFAULT_CHAT_FRAME:AddMessage("A2--" .. tostring(c),192,0,192,0)
	
	if c == nil then
		return -1;
	end
	
	_, _, j = strfind(c, " - (%d+)");
	if j==nil then
		_, _, j = strfind(c, "(%d+)");
	end
	
		
	return tonumber(j);

end

function amfind(String,Tbl,Type) --Tbl 在 String 中搜索指定的內容

	if (not String) or (not Tbl) then
		return nil;
	end
	
	if type(Tbl) == "string" then
	
		Tbl = { strsplit(",",Tbl) }

	elseif type(Tbl) == "table" then
	
	else
		return nil;
	end
	
	
	if type(String) == "string" then
	
		String = { strsplit(",",String) }

	elseif type(String) == "table" then
	
	else
		return nil;
	end
	
	if Type == nil then
	
		Type=0
	end
	
	
	local n;
	
	local Tbl_index=1;
	local String_index=1;
	
	for i,v in ipairs(Tbl) do
		String_index=1;
		for k,va in ipairs(String) do
			n = strfind(strlower(va),strlower(v),1,true);
			
			
				if n then
					if Type == -1 then
						return n,v,va,Tbl_index,String_index;
						
					elseif Type == 0  then
						if va == v then
							return n,v,va,Tbl_index,String_index;
						end
						
					elseif Type == n then
						return n,v,va,Tbl_index,String_index;
					end
				end
			String_index=String_index+1;
		end
		
		Tbl_index=Tbl_index+1;
	end
	
	return nil;
end

function amac_bak(Unit,Interrupt) --获得指定目标正在施放的法术名称,Interrupt 为非0 只返回可以打断的技能
	
    local c,i;
		
    if not Unit then
			
        Unit = "target";
		
    end
		
    c,_,_,_,_,_,_,_,i = UnitCastingInfo(Unit);
		
		
    if c then
			
			
        if not Interrupt then
				
            return c;
			
        else
				
	    if not i then
					
	       return c;
				
	    end
			
	end
			
		
    else
			
        c,_,_,_,_,_,_,i = UnitChannelInfo(Unit);
			
			
        if c then
				
            if not Interrupt then
					
	        return c;
				
	    else
					
	         if not i then
						
	             return c;
					
	         end
				
            end
			
        end
		
    end
		
	
    return false;

	
	
	

end	


function amac(Unit,Interrupt,Time) --获得指定目标正在施放的法术名称,Interrupt 为非0 只返回可以打断的技能
	local c,i;
		if not Unit then
			Unit = "target";
		end
		
		
		c,_,_,_,startTime,_,_,_,i = UnitCastingInfo(Unit);
		
		
		if c then
		--print(GetTime() - startTime/1000,wowam_config.amac_time)
			if wowam_config.amac_arena and amisarena() then
				if not Time then
					Time = wowam_config.amac_time;
				end
						
					if GetTime() - (startTime/1000) > Time then
			
						if not Interrupt then
							return c;
						else
							if not i then
								return c;
							end
						end
					end
						
			else
				
				if not Interrupt then
					return c;
				else
					if not i then
						return c;
					end
				end
				
				
			end
			
			
			
		else
			c,_,_,_,startTime,_,_,i = UnitChannelInfo(Unit);
			
			if c then
				--print(GetTime() - startTime/1000,wowam_config.amac_time)
				if wowam_config.amac_arena and amisarena() then
				
					if not Time then
						Time = wowam_config.amac_time;
					end
					
					if GetTime() - (startTime/1000) > Time then
			
						if not Interrupt then
							return c;
						else
							if not i then
								return c;
							end
						end
					end
						
				else
					
					if not Interrupt then
						return c;
					else
						if not i then
							return c;
						end
					end
					
					
				end
			end
		end
		
	return false;

	
	
	
end	


function amact(Unit) --獲得指定目標正在施放的法術剩餘時間

	if Unit==nil then
		 Unit = "target";
	end
	 
	
	
	if not amGetUnitName(Unit) then
		return -1,-1,"";
	end
	
	local spell, _, _, _, startTime, endTime = UnitCastingInfo(Unit)
	
	
	if spell then 
	 local finish = endTime/1000 - GetTime()
		return tonumber(format("%.2f",finish) ),tonumber(format("%.2f",(endTime -startTime) /1000)),spell
	end
	
	local spellch, _, _, _, startTime, endTimech = UnitChannelInfo(Unit)
	if spellch then 
	 local finishch = endTimech/1000 - GetTime()
		return tonumber(format("%.2f",finishch) ),tonumber(format("%.2f",(endTimech -startTime) /1000)),spellch
	end
	
	
	
	return -1,-1,"";
	
end

function ambufflist(Unit,IsPlayer,value,value1,getindex) --獲得指定目標buff列表
	
	local amfind = amfind;
	local name = {};
	local i = 1;
	local k = 1;
	local TblIsPlayer,Tblvalue,Tblvalue1;
	local Buffindex={};
	
	Buffindex.buff={};
	Buffindex.debuff={};

		
	if Unit == nil then
		Unit="player";
	end
	
	if IsPlayer and type(IsPlayer) ~= "table" then
		
		TblIsPlayer ={IsPlayer};
		Tblvalue ={value};
		Tblvalue1 ={value1};
		
	elseif IsPlayer then
		
		TblIsPlayer =IsPlayer;
		Tblvalue =value;
		Tblvalue1 =value1;
	end
	
	--print(0,IsPlayer,value,value1,getindex)
	
	for index =1 , 2 do
		
		i=1;
		
		while true do
			
			local c, icon, count, buffType, expirationTime, unitCaster, isStealable, spellId,isBossDebuff;
			
			if index ==1 then
			
				c, _, icon, count, buffType, duration, expirationTime, unitCaster, isStealable,_, spellId,_,isBossDebuff  = UnitBuff(Unit, i);
			
			else
			
				c, _, icon, count, buffType, duration, expirationTime, unitCaster, isStealable,_, spellId,_,isBossDebuff  = UnitDebuff(Unit, i);
			
			end
			
			--print(1,c,IsPlayer)
			
			if c then
				
				if IsPlayer then
				
				--print(2,IsPlayer)
					
										
					local IsTbl={};
					
					for p, data in pairs(TblIsPlayer) do
						
						local IsPlayer = data;
						local value = Tblvalue[p];
						local value1 = Tblvalue1[p];
						
						
						local isok = false
						
						if IsPlayer =="player" and unitCaster == "player" then
						
						
							isok = true;
						
						elseif IsPlayer =="buff" and index == 1 then
						
							isok = true;
							
						elseif IsPlayer =="debuff" and index == 2 then
						
							isok = true;
							
						elseif IsPlayer =="notplayer" and unitCaster ~= "player" then
						
							isok = true;

						elseif IsPlayer == "all" then
						
							isok = true;	
						
						elseif IsPlayer == "id" and value  then
						
							if type(value) == "table" then
								
								for k, d in pairs(value) do
								
									if d == spellId then
									
										isok = true;
										break;
										
									end
								
								end
							
							else
								
								isok = spellId == value;
								
							end
							
						
							
						elseif IsPlayer == "icon" and value then
							
							local ls_icon = { strsplit("\\",icon) }
							ls_icon = ls_icon[#ls_icon];
							
							local ls_icon1;
							
							if type(value) == "table" then
								
								for k, d in pairs(value) do
									
									ls_icon1 = { strsplit("\\",d) }
									
									if ls_icon == ls_icon1[#ls_icon1] then
									
										isok = true;
										break;
										
									end
								
								end
							
							else
								
								
								ls_icon1 = { strsplit("\\",value) }
								
								--print(1,ls_icon[#ls_icon],ls_icon1[#ls_icon1])
								
								if ls_icon == ls_icon1[#ls_icon1] then
									isok = true;
								end
								
							end
							
							
														
												
						elseif IsPlayer == "passingtime" and (value or value1) then
							
							
							local n = duration - (expirationTime - GetTime());
							
							if value and value1 then
							
								isok = n >= value and  n <= value1 ;
							
							elseif value and not value1 then
								
								isok = n >= value ;
								
							elseif value1 and not value then
								
								isok = n <= value1 ;
							
							end
							
							
							
	
						elseif IsPlayer == "time" and (value or value1) then
							
							local n = expirationTime - GetTime()
							if n < 0 then
								n= 0
							end
							
							if value and value1 and n >= value and n <= value1 then
							
								isok = true;
							
							elseif not value1 and value and n >= value then
							
								isok = true;
							
							elseif not value and value1 and n <= value1 then
							
								isok = true;
							
							end
						
						elseif IsPlayer == "count" and (value or value1) and count then
							
							if value and value1 then
							
								isok = count >= value and  count <= value1;
								
							elseif value and not value1 then
							
								isok = count >= value;
							
							elseif not value and value1 then
								
								
								isok =  count <= value1;
								
							end							
							
							
						elseif IsPlayer == "type" and value and buffType then
							
							if value == buffType then
							
								isok = true;
								
							end
							
						elseif IsPlayer == "stealable" and isStealable then
							
								isok = true;
						
						elseif IsPlayer =="unit" and value and unitCaster == value then
						
							isok = true;
						
						elseif IsPlayer =="bossdebuff" and isBossDebuff then
						
							isok = true;
						
						elseif IsPlayer =="name" and value then
							
						
							
							if type(value) == "table" then
								
								
								isok = amfind(value, c,(value1 or 0));
								
															
							else
								
								isok = c == value;
								
							end


						
						end
						
						--print(IsPlayer,c,isok)
						
						IsTbl[IsPlayer] = isok;
						
						
					end
					
					local ok;
					
					
					for q, v in pairs(IsTbl) do
					
						--print(c,q,v,#TblIsPlayer,#IsTbl)
						if not v then
							ok = false
							break
						end
						ok=true;
					end
					
					
					
					if ok then
					
						--print(">>",c,ok,#IsTbl)
						name[k] = c ;
						
						
						
						if index ==1 then
							Buffindex.buff[spellId]=i;
						else
							Buffindex.debuff[spellId]=i;
						end
						
						k = k + 1;
					
					end
					
				else			
					
					name[k] = c ;
					
					if index ==1 then
						Buffindex.buff[spellId]=i;
					else
						Buffindex.debuff[spellId]=i;
					end
					
					k = k + 1;
					
				end
			
			else		
				
				do break end
				
			end
			
			i = i + 1;
			
		end
	
	end	
	
	if getindex then
		return name,Buffindex;
	else
		return name;
	end
	
end

function ambufflist_bak(Unit,IsPlayer,value,value1,getindex) --獲得指定目標buff列表
	
	local amfind = amfind;
	local name = {};
	local i = 1;
	local k = 1;
	local TblIsPlayer,Tblvalue,Tblvalue1;
	local Buffindex={};
	
	Buffindex.buff={};
	Buffindex.debuff={};

		
	if Unit == nil then
		Unit="player";
	end
	
	if IsPlayer and type(IsPlayer) ~= "table" then
		
		TblIsPlayer ={IsPlayer};
		Tblvalue ={value};
		Tblvalue1 ={value1};
		
	elseif IsPlayer then
		
		TblIsPlayer =IsPlayer;
		Tblvalue =value;
		Tblvalue1 =value1;
	end
	
	--print(0,IsPlayer,value,value1,getindex)
	
	for index =1 , 2 do
		
		i=1;
		
		while true do
			
			local c, icon, count, buffType, expirationTime, unitCaster, isStealable, spellId,isBossDebuff;
			
			if index ==1 then
			
				c, _, icon, count, buffType, duration, expirationTime, unitCaster, isStealable,_, spellId,_,isBossDebuff  = UnitBuff(Unit, i);
			
			else
			
				c, _, icon, count, buffType, duration, expirationTime, unitCaster, isStealable,_, spellId,_,isBossDebuff  = UnitDebuff(Unit, i);
			
			end
			
			--print(1,c,IsPlayer)
			
			if c then
				
				if IsPlayer then
				
				--print(2,IsPlayer)
					
					--local isok = false;
					
					local isokIndex =0;
					
					for p, data in pairs(TblIsPlayer) do
						
						local IsPlayer = data;
						local value = Tblvalue[p];
						local value1 = Tblvalue1[p];
						
						--print(">>",IsPlayer)
						
						local isok = false
						
						if IsPlayer =="player" and unitCaster == "player" then
						
						
							isok = true;
						
						elseif IsPlayer =="buff" and index == 1 then
						
							isok = true;
							
						elseif IsPlayer =="debuff" and index == 2 then
						
							isok = true;
							
						elseif IsPlayer =="notplayer" and unitCaster ~= "player" then
						
							isok = true;

						elseif IsPlayer == "all" then
						
							isok = true;	
						
						elseif IsPlayer == "id" and value  then
						
							if type(value) == "table" then
								
								for k, d in pairs(value) do
								
									if d == spellId then
									
										isok = true;
										break;
										
									end
								
								end
							
							else
								
								isok = spellId == value;
								
							end
							
						
							
						elseif IsPlayer == "icon" and value then
							
							local ls_icon = { strsplit("\\",icon) }
							ls_icon = ls_icon[#ls_icon];
							
							local ls_icon1;
							
							if type(value) == "table" then
								
								for k, d in pairs(value) do
									
									ls_icon1 = { strsplit("\\",d) }
									
									if ls_icon == ls_icon1[#ls_icon1] then
									
										isok = true;
										break;
										
									end
								
								end
							
							else
								
								
								ls_icon1 = { strsplit("\\",value) }
								
								--print(1,ls_icon[#ls_icon],ls_icon1[#ls_icon1])
								
								if ls_icon == ls_icon1[#ls_icon1] then
									isok = true;
								end
								
							end
							
							
														
												
						elseif IsPlayer == "passingtime" and (value or value1) then
							
							
							local n = duration - (expirationTime - GetTime());
							
							if value and value1 then
							
								isok = n >= value and  n <= value1 ;
							
							elseif value and not value1 then
								
								isok = n >= value ;
								
							elseif value1 and not value then
								
								isok = n <= value1 ;
							
							end
							
							
							
	
						elseif IsPlayer == "time" and (value or value1) then
							
							local n = expirationTime - GetTime()
							if n < 0 then
								n= 0
							end
							
							if value and value1 and n >= value and n <= value1 then
							
								isok = true;
							
							elseif not value1 and value and n >= value then
							
								isok = true;
							
							elseif not value and value1 and n <= value1 then
							
								isok = true;
							
							end
						
						elseif IsPlayer == "count" and (value or value1) and count then
							
							if value and value1 then
							
								isok = count >= value and  count <= value1;
								
							elseif value and not value1 then
							
								isok = count >= value;
							
							elseif not value and value1 then
								
								
								isok =  count <= value1;
								
							end							
							
							
						elseif IsPlayer == "type" and value and buffType then
							
							if value == buffType then
							
								isok = true;
								
							end
							
						elseif IsPlayer == "stealable" and isStealable then
							
								isok = true;
						
						elseif IsPlayer =="unit" and value and unitCaster == value then
						
							isok = true;
						
						elseif IsPlayer =="bossdebuff" and isBossDebuff then
						
							isok = true;
						
						elseif IsPlayer =="name" and value then
							
						
							
							if type(value) == "table" then
								
								
								isok = amfind(value, c,(value1 or 0));
								
															
							else
								
								isok = c == value;
								
							end


						
						end
						--print("index",i,c,isok,IsPlayer)
						
						--if not isok then
						
						--	break;
						
						--end
						
						if isok then
							isokIndex =  isokIndex +1;
						end
						
						
					end
					
					
					--if isok then
					
					if isokIndex>0 then
						
						name[k] = c ;
						
						
						
						if index ==1 then
							Buffindex.buff[spellId]=i;
						else
							Buffindex.debuff[spellId]=i;
						end
						
						k = k + 1;
					
					end
					
				else			
					
					name[k] = c ;
					
					if index ==1 then
						Buffindex.buff[spellId]=i;
					else
						Buffindex.debuff[spellId]=i;
					end
					
					k = k + 1;
					
				end
			
			else		
				
				do break end
				
			end
			
			i = i + 1;
			
		end
	
	end	
	
	if getindex then
		return name,Buffindex;
	else
		return name;
	end
	
end

function amaura_bak(Spell,Unit,Nameid,BuffType,iconName) --獲得指定目標buff剩餘時間

	if not Nameid  then
		Nameid=0;
	end
	
	if not BuffType  then
		BuffType=0;
	end
	
	if not Unit then
		Unit="player";
	end

	if not Spell  then
		return -4;
	end
	
	if type(Spell) ~= "string" or type(Unit) ~= "string" or type(Nameid) ~= "number" then
		return -2;
	end
	
	if not amGetUnitName(Unit) then
		return -3;
	end
	
	
local n;
local	name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable ;
	
	--local	name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable = UnitAura(Unit, Spell,"HARMFUL") 
	if BuffType == 0 then
		name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable = UnitBuff(Unit, Spell)
		if name == nil then
			name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable = UnitDebuff(Unit, Spell)
		end
		
	elseif BuffType == 1 then
		name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable = UnitBuff(Unit, Spell)
	elseif BuffType == 2 then
		name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable = UnitDebuff(Unit, Spell)
		
	elseif BuffType == 3 then
		name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable = UnitBuff(Unit, Spell,true)
	elseif BuffType == 4 then
		name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable = UnitDebuff(Unit, Spell,true)
		
	end
	

	--DEFAULT_CHAT_FRAME:AddMessage(tostring(name),192,0,192,0)
	if iconName and icon then
		local ls_icon = { strsplit("\\",icon) }
		if ls_icon[3] ~= iconName then
			return -1

		end
	
	end
	
	
	if name then
		n = expirationTime - GetTime()
		if n < 0 then
			n= 0
		end
		n = format("%.1f",n);
		n=tonumber(n);
		
		--DEFAULT_CHAT_FRAME:AddMessage(tostring(unitCaster),192,0,192,0)
		
		if Nameid == 0 and unitCaster == "player" then
			return  n,rank,count,debuffType,icon,unitCaster,duration,expirationTime,isStealable;
		elseif Nameid == 1 and unitCaster ~= "player" then
			return  n,rank,count,debuffType,icon,unitCaster,duration,expirationTime,isStealable;
		elseif Nameid == 2 then
			return  n,rank,count,debuffType,icon,unitCaster,duration,expirationTime,isStealable;
		end
		
		
	end
	
	return -1;
end


function amtb(Spell,iconName) --獲得當前目標buff剩餘時間
		
	local	n,rank,count,debuffType,icon = amaura(Spell,"target",2,1);
	if iconName and icon then
		local ls_icon = { strsplit("\\",icon) }
		if ls_icon[3] == iconName then
			return n
		else
			return -1

		end
	else
		return n;
	end
end

function ampb(Spell,iconName) --獲得自己身上buff剩餘時間
		
	local	n,rank,count,debuffType,icon = amaura(Spell,"player",2,0);
	
	
	if iconName and icon then
		local ls_icon = { strsplit("\\",icon) }
		if ls_icon[3] == iconName then
			return n
		else
			return -1

		end
	else
		return n;
	end
	
end


function amtdb(Spell,iconName) --獲得當前目標屬於自己的Dbuff剩餘時間
		
	local	n,rank,count,debuffType,icon = amaura(Spell,"target",0,2);
	if iconName and icon then
		local ls_icon = { strsplit("\\",icon) }
		if ls_icon[3] == iconName then
			return n
		else
			return -1

		end
	else
		return n;
	end
end

function ampdb(Spell,iconName) --獲得自己身上Dbuff剩餘時間
		
	local	n,rank,count,debuffType,icon = amaura(Spell,"player",2,2);
	if iconName and icon then
		local ls_icon = { strsplit("\\",icon) }
		if ls_icon[3] == iconName then
			return n
		else
			return -1

		end
	else
		return n;
	end
end

function ambn(Spell,Unit,Nameid,BuffType) --獲得指定目標buff層數

	if Unit == nil then
			Unit = "target";
	end
	
	local	n,rank,count,debuffType = amaura(Spell,Unit,Nameid,BuffType);
	
	if not count then
		return -1
	end
	
	return count;
end

function amtdbn(Spell) --獲得當前目標自己的Dbuff層數
		
	local	n,rank,count,debuffType = amaura(Spell,"target",0,2);
	if count then
	return count;
	end
	return -1;
end

function ampdbn(Spell) --獲得自己身上Dbuff層數
		
	local	n,rank,count,debuffType = amaura(Spell,"player",2,0);
	
	if not count then
		return -1
	end
	
	return count;
end


function amtbn(Spell) --獲得當前目標buff層數
		
	local	n,rank,count,debuffType = amaura(Spell,"target",2,1);
	if not count then
		return -1
	end
	return count;
end

function ampbn(Spell) --獲得自己身上buff層數
		
	local	n,rank,count,debuffType = amaura(Spell,"player",2,1);
	
	if not count then
		return -1
	end
	
	return count;
end



function amcf(id) --目標的目標是否自己
	if id==0 then
		if not UnitIsUnit("player","targettarget") and UnitCanAttack("player","target") then 
				return true
		else
				return false

		end;

	elseif id==1 then

				if UnitIsUnit("targettarget", "player") and UnitCanAttack("player","target") then

						return true
				else
						return false

				end;

	elseif id==2 then
		
			if not UnitIsUnit("player","targettarget") and UnitCanAttack("player","target") and amGetUnitName("targettarget") then 
							return true
					else
							return false

					end;

			return false

		end

end

function amzt(index) ---'獲得指定姿態狀態
	if index <= 0 then
		return false
	end
	local _,_,a = GetShapeshiftFormInfo(index);

	return a;
end

function amzd(Unit) --判斷指定單位是否在戰鬥狀態,沒參數默認自己
	if Unit then
		return UnitAffectingCombat(Unit);
	else
		return UnitAffectingCombat("player");
	end
end

function amtrt(Unit) --返回指定單位的能量的類型，沒參數默認當前目標。 返回：數字，字符串
	if Unit then
		return UnitPowerType(Unit)
	else
		return UnitPowerType("target")
	end
end


function amsv(VariableName,Value) --設定變量的值
 wowam.player.Custom.Variable[VariableName]=Value;
 return wowam.player.Custom.Variable[VariableName]
end

function amgv(VariableName) --讀取變量的值
	if VariableName == nil  then 
	return nil; 
	end;
	
 return wowam.player.Custom.Variable[VariableName];
end

function amfttp() --返回焦點目標的目標是否自己
 return amGetUnitName("focustarget") == amGetUnitName("player")

end

function amttp() --返回目標的目標是否自己
 return amGetUnitName("targettarget") == amGetUnitName("player")
end

function amctp(Unit) --返回指定目標的目標是否自己
	if not Unit then
		Unit = "targettarget";
	end
	
 return amGetUnitName(Unit .. "-target") == amGetUnitName("player")
end

function amun(Unit) --獲得指定目標名稱. 
	if not Unit then
		return amGetUnitName("target")
	else
		return amGetUnitName(Unit)
	end

end

function amtnm(Unit) --指定目標目不是我. 
	if not Unit then
		return nil
	end
	
		return amGetUnitName("player") ~= amGetUnitName(Unit)
	
end

function amlive(Unit) --指定目標是否活著，是為真
	if not Unit then
		return nil
	end
	
	return not UnitIsDeadOrGhost(unit)
end

function amezy(Unit) --獲得指定目標英文職業名稱
	if Unit == nil then
		Unit = "target"
	end
	local playerClass, englishClass = UnitClass(Unit);
	return englishClass
end


function amzy(Unit) --獲得指定目標本地職業名稱
	if Unit == nil then
		Unit = "target"
	end
	local playerClass, englishClass = UnitClassBase(Unit);
	
	return playerClass;
	
end

function amuipm_old(Unit) --判斷一個指定的目標（只能是NPC）是否屬於精英，沒參數默認當前目標。
	if Unit == nil then
		Unit = "target"
	end
	return UnitIsPlusMob(Unit);
	
end

function amuipm(Unit,n) --判断一个指定的目标（只能是NPC）是否属于精英，沒參數默認當前目標。
	--"normal" - 普通 
	--"rare" - 稀有 
	--"elite" - 精英 
	--"rareelite" - 稀有精英 
	--"worldboss" - 首领 

	if Unit == nil then
		Unit = "target"
	end
	
	
	
	local c = UnitClassification(Unit);
	
	if not c then return end
	
	if not n then n=6 end
	
	if n == 6 then
		if c=="elite" or c =="rareelite" or c =="worldboss" then
			return c;
		else
			return;
		end
	
	elseif n == 1 then
		if c=="normal"  then
			return c;
		else
			return;
		end
		
	elseif n == 2 then
		if c=="rare"  then
			return c;
		else
			return;
		end
		
	elseif n == 3 then
		if c=="elite"  then
			return c;
		else
			return;
		end
		
	elseif n == 4 then
		if c=="rareelite"  then
			return c;
		else
			return;
		end
		
	elseif n == 5 then
		if c=="worldboss"  then
			return c;
		else
			return;
		end
		
	elseif n == -1 then
		
		return c;
		
		
	end	
end


function amur(Unit) --獲得指定的目標的種族，沒參數默認當前目標。
	if Unit == nil then
		Unit = "target"
	end
	return UnitRace(Unit)
	
end

function amupc(Unit) --判斷指定目標是否是一名由玩家控制的角色，沒參數默認當前目標。
	if Unit == nil then
		Unit = "target"
	end
	return UnitPlayerControlled(Unit)
	
end

function amljd() --獲取當前連擊點
	--return GetComboPoints("player")
	return UnitPower("player",4);
end


function amcasttime(Spell) --獲得指定技能施放時間. 
	local t = wowam.spell.Event_SpellInfo.name[Spell]
	if t then
		return GetTime() -t ;
	end
	
	return -1 ;
end



function amdelay_OLD(Spell,Time) --設定讀條技能施放後延時時間. 
wowam.spell.Dot.time[Spell]=Time;
return Time;
end


function amdelay_oLD_201109040817(Spell,Time,Unit) --設定讀條技能施放後延時時間. 
	local SPELL_UNIT;
	if not Unit  then
		--return amdelay_OLD(Spell,Time);
		--wowam.sys.SPELL_FAILED.SPELL_NOUNIT=Spell;
		SPELL_UNIT=Spell;
	else
		--wowam.sys.SPELL_FAILED.SPELL_NOUNIT=nil;
		SPELL_UNIT=UnitGUID(Unit);
	end
	
	if not SPELL_UNIT then
		return false;
	end
		
			
	if wowam.sys.SPELL_FAILED.SPELLINF[SPELL_UNIT] then
					
			if not wowam.sys.SPELL_FAILED.SPELLINF[SPELL_UNIT][Spell] then
				wowam.sys.SPELL_FAILED.SPELLINF[SPELL_UNIT][Spell]={};
			end
			
	else
		wowam.sys.SPELL_FAILED.SPELLINF[SPELL_UNIT]={};
		wowam.sys.SPELL_FAILED.SPELLINF[SPELL_UNIT][Spell]={};
		
	end
	
		wowam.sys.SPELL_FAILED.SPELLINF[SPELL_UNIT][Spell]["FAILED_TEXT"]="延時施放技能";
		wowam.sys.SPELL_FAILED.SPELLINF[SPELL_UNIT][Spell]["TIME"]=GetTime();
		wowam.sys.SPELL_FAILED.SPELLINF[SPELL_UNIT][Spell]["SPELL_DELAY"]=Time;
	
	
end



function amdelay(Spell,Time,Unit) --設定讀條技能施放後延時時間. 

	
	--print(Spell,Time,Unit)
	
	if Spell and Time and Unit and Unit ~= "nogoal" then
	
		
		if not  UnitGUID(Unit) or type(Time) ~= "number" then
			return false;
		end
		
		
		local guid = UnitGUID(Unit);
		
		if not wowam.DelayTbl[Spell] then
			
			wowam.DelayTbl[Spell]={};
			
		end
		
		wowam.DelayTbl[Spell]["Time"] = GetTime();
		wowam.DelayTbl[Spell]["Unit"]=Unit;
		wowam.DelayTbl[Spell]["Guid"]=guid;
		
		if not wowam.DelayTbl[Spell][guid] then
			
			wowam.DelayTbl[Spell][guid]={};
				
		end
		
				
		local tbl = wowam.DelayTbl[Spell][guid];
		tbl["DelayTime"]=Time;
		
		return true;
		
		
			
	elseif Spell and Time and Unit == "nogoal" then
	
		if type(Time) ~= "number" then
			return false;
		end
		
		
		if not wowam.DelayTbl[Spell] then
			
			wowam.DelayTbl[Spell]={};
			
		end
		
		wowam.DelayTbl[Spell]["Time"] = GetTime();
		wowam.DelayTbl[Spell]["Unit"]=Unit;
		local tbl = wowam.DelayTbl[Spell];
		tbl["DelayTime"]=Time;
		return true;
	

	elseif Spell and Time and not Unit then
		
			if type(Time) ~= "number" then
				return false;
			end
			
			
			if not wowam.DelayTbl[Spell] then
				
				wowam.DelayTbl[Spell]={};
				
			end
			
			wowam.DelayTbl[Spell]["Time"] = GetTime();
			
			local tbl = wowam.DelayTbl[Spell];
			tbl["DelayTime"]=Time;
			return true;
			
	else	
	
		return false;
		
	end
	
	
	
	
	
end


function amyjqs_Excluded(Unit,Excluded,debuff_name)
if Excluded == nil then
	return nil;
end

local playerClass, englishClass = UnitClass(Unit);
local race, raceEn = UnitRace(Unit)
local name, realm = amGetUnitName(Unit);

if playerClass == nil or race == nil or name == nil then
	return nil;
end

debuff_name = playerClass .. "," .. englishClass .. "," .. debuff_name
debuff_name = race .. "," .. raceEn .. "," .. debuff_name
debuff_name = name .. "," .. Unit .. "," .. debuff_name

return amfind(strlower(debuff_name),strlower(Excluded),0)

end

function amyjqs(SPELL,buff_type,units,Excluded,StrExpression)
	local i , t_name, rank, subgroup, level, t_class, fileName, zone, online, isDead, role, isML;
	local name,class,race,spell,unit,spellcd,guid;
	local tempn,temptype;
	
	if not SPELL then
		return;
	end
	
	if not amisr(SPELL,"nogoal") then
	--print("e")
		return;
	end
	
	if not buff_type then
		buff_type = "Magic,Curse,Disease,Poison"
	end
	
	local str
	
	if StrExpression then
		str ='function TEMP_amayjqs(name,class,race,spell,unit,guid,spellcd) if ' .. StrExpression .. ' then return true; else return false; end end'
	else
		str ='function TEMP_amayjqs(name,class,race,spell,unit,guid,spellcd) return false; end'
	end
	
	
	
	RunScript(str);
	
	
	
	local playergroup,k,debuff_name,debuffType,Dtype,Dtype_Z
	
	Dtype_Z = { strsplit(",",buff_type) }
	
	for i,Dtype_v in ipairs(Dtype_Z) do
	
		buff_type = Dtype_v;
	
			if units then
			
			
			--unit=gsub(unit," ",",")
				
				
					
					
					
				
				local jn = { strsplit(",",units) }
			
			
					for i,v in ipairs(jn) do
					
							
				
							t_name = v
					--DEFAULT_CHAT_FRAME:AddMessage("1" .. t_name);
							if UnitExists(t_name) then
								tempn,temptype = isrunspell(SPELL,t_name)
								name = amGetUnitName(t_name);
								
								if not UnitIsDeadOrGhost(t_name) and UnitIsConnected(t_name) and tempn and name then
									
											
											
											for k=1 , 40 do
											
												debuff_name, _, _, _, debuffType =  UnitDebuff(t_name, k, 1);
												if debuffType and debuff_name then
													if	strlower(buff_type) == strlower(debuffType) or strlower(buff_type) == strlower(debuff_name) then
													unit = t_name;
													
													 class = UnitClass(unit);
													 race = UnitRace(unit);
													 spell = amac(unit);
													 spellcd = amact(unit);
													 guid = UnitGUID(unit);
													
														if not (amyjqs_Excluded(t_name,Excluded,debuff_name) or TEMP_amayjqs(name,class,race,spell,unit,guid,spellcd) ) then
														
															
															
															
															--DEFAULT_CHAT_FRAME:AddMessage("temptype--" .. tostring(temptype),192,0,192,0)
															
															if tempn then
															--DEFAULT_CHAT_FRAME:AddMessage("tempn--" .. tostring(t_name),192,0,192,0)
																if temptype == 1 then
																amrun("/cast [target=" .. t_name.. "]" .. SPELL)
																else
																amrun("/use [target=" .. t_name.. "]" .. SPELL)
																end
																
																return true;
															else
																break;
															end
															
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
			
			t_name = "player";
			tempn,temptype = isrunspell(SPELL,t_name)
			
			if not UnitIsDeadOrGhost(t_name) and UnitIsConnected(t_name) and tempn then
					
					--DEFAULT_CHAT_FRAME:AddMessage(tostring(SPELL) .. " - " .. tostring(buff_type).. " - ") -- .. tostring(a3),192,0,192,0);		
							
							
							for k=1 , 40 do
							
								debuff_name, _, _, _, debuffType =  UnitDebuff(t_name, k, 1);
								if debuffType and debuff_name then
									if	strlower(buff_type) == strlower(debuffType) or strlower(buff_type) == strlower(debuff_name) then
													
													unit = t_name;
													name = amGetUnitName(unit);
													 class = UnitClass(unit);
													 race = UnitRace(unit);
													 spell = amac(unit);
													 spellcd = amact(unit);
													 guid = UnitGUID(unit);
													
														if not (amyjqs_Excluded(t_name,Excluded,debuff_name) or TEMP_amayjqs(name,class,race,spell,unit,guid,spellcd) ) then
														
														
															 
															if tempn then
															--DEFAULT_CHAT_FRAME:AddMessage("2--" .. tostring(t_name),192,0,192,0)
																if temptype == 1 then
																amrun("/cast [target=" .. t_name.. "]" .. SPELL)
																else
																amrun("/use [target=" .. t_name.. "]" .. SPELL)
																end
																
																return true;
															else
																break;
															end
															
														end
														
									end
									
								else
									
									break;
								
								end
								
							end
							
			end
			--[[
			t_name = "target";
			
			if UnitExists(t_name) then
				
				if not UnitIsDeadOrGhost(t_name) and UnitIsConnected(t_name) then
					
							
							
							for k=1 , 40 do
							
								debuff_name, _, _, _, debuffType =  UnitDebuff(t_name, k, 1);
								if debuffType and debuff_name then
									if	strlower(buff_type) == strlower(debuffType) or strlower(buff_type) == strlower(debuff_name) then
													
													unit = t_name;
													name = amGetUnitName(unit);
													 class = UnitClass(unit);
													 race = UnitRace(unit);
													 spell = amac(unit);
													 spellcd = amact(unit);
													 guid = UnitGUID(unit);
													
														if not (amyjqs_Excluded(t_name,Excluded,debuff_name) or TEMP_amayjqs(name,class,race,spell,unit,guid,spellcd) ) then
														
														
															local tempn,temptype = isrunspell(SPELL,t_name)
															if tempn then
																if temptype == 1 then
																amrun("/cast [target=" .. t_name.. "]" .. SPELL)
																else
																amrun("/use [target=" .. t_name.. "]" .. SPELL)
																end
																
																return true;
															else
																break;
															end
															
														end
														
									end
									
								else
									break;
								
								end
								
							end
							
				end
				
			end
			
			
			t_name = "focus";
			
			if UnitExists(t_name) then
				
				if not UnitIsDeadOrGhost(t_name) and UnitIsConnected(t_name) then
					
							
							
							for k=1 , 40 do
							
								debuff_name, _, _, _, debuffType =  UnitDebuff(t_name, k, 1);
								if debuffType and debuff_name then
									if	strlower(buff_type) == strlower(debuffType) or strlower(buff_type) == strlower(debuff_name) then
													
														unit = t_name;
													name = amGetUnitName(unit);
													 class = UnitClass(unit);
													 race = UnitRace(unit);
													 spell = amac(unit);
													 spellcd = amact(unit);
													 guid = UnitGUID(unit);
													
														if not (amyjqs_Excluded(t_name,Excluded,debuff_name) or TEMP_amayjqs(name,class,race,spell,unit,guid,spellcd) ) then
														
														
															local tempn,temptype = isrunspell(SPELL,t_name)
															if tempn then
																if temptype == 1 then
																amrun("/cast [target=" .. t_name.. "]" .. SPELL)
																else
																amrun("/use [target=" .. t_name.. "]" .. SPELL)
																end
																
																return true;
															else
																break;
															end
															
														end
														
									end
									
								else
									break;
								
								end
								
							end
							
				end
				
			end
			
			--]]
			
			for i=1 , GetNumSubgroupMembers() do
					t_name	= "party" .. tostring(i)
					 tempn,temptype = isrunspell(SPELL,t_name)
						if not UnitIsDeadOrGhost(t_name) and UnitIsConnected(t_name) and tempn then
							
							for k=1 , 40 do
					
							debuff_name, _, _, _, debuffType =  UnitDebuff(t_name, k, 1); 
								if debuffType and debuff_name then
									--DEFAULT_CHAT_FRAME:AddMessage("3P >> " .. tostring(t_name),192,0,192,0)
									if	strlower(buff_type) == strlower(debuffType) or strlower(buff_type) == strlower(debuff_name) then
												
												unit = t_name;
												name = amGetUnitName(unit);
												 class = UnitClass(unit);
												 race = UnitRace(unit);
												 spell = amac(unit);
												 spellcd = amact(unit);
												 guid = UnitGUID(unit);
												
													if not (amyjqs_Excluded(t_name,Excluded,debuff_name) or TEMP_amayjqs(name,class,race,spell,unit,guid,spellcd) ) then
													
													
														
														if tempn then
														--DEFAULT_CHAT_FRAME:AddMessage("P >> " .. tostring(t_name),192,0,192,0)
															if temptype == 1 then
															amrun("/cast [target=" .. t_name.. "]" .. SPELL)
															else
															amrun("/use [target=" .. t_name.. "]" .. SPELL)
															end
															
															return true;
														else
															break;
														end
														
													end
													
									end
									
								else
									
									break;
								
								end
								
							end
								
						end
								
				end
					
			
				
									
								
					
					for i=1 , GetNumGroupMembers() do
						t_name, rank, subgroup, level, t_class, fileName, zone, online, isDead, role, isML = GetRaidRosterInfo(i);
						if not t_name then
							break;
						end
						
						tempn,temptype = isrunspell(SPELL,t_name)
						
						--DEFAULT_CHAT_FRAME:AddMessage("1R >> " .. tostring(t_name).."-".. tostring(tempn).."-".. tostring(isDead).."-".. tostring(online),192,0,192,0)
						
						if not UnitIsDeadOrGhost(t_name) and UnitIsConnected(t_name) and tempn then
						--if tempn and isDead and online then
						
								
								for k=1 , 40 do
									
																			
					
											debuff_name, _, _, _, debuffType =  UnitDebuff(t_name, k, 1);
											if debuffType and debuff_name then
												--DEFAULT_CHAT_FRAME:AddMessage("3R >> " .. tostring(t_name),192,0,192,0)
												if	strlower(buff_type) == strlower(debuffType) or strlower(buff_type) == strlower(debuff_name) then
													--print(tostring(i))
													unit = "raid" .. tostring(i);
													name = amGetUnitName(unit);
													 class = UnitClass(unit);
													 race = UnitRace(unit);
													 spell = amac(unit);
													 spellcd = amact(unit);
													 guid = UnitGUID(unit);
													
														if not (amyjqs_Excluded(t_name,Excluded,debuff_name) or TEMP_amayjqs(name,class,race,spell,unit,guid,spellcd) ) then
														
														
															 
															if tempn then
															--DEFAULT_CHAT_FRAME:AddMessage("R >> " .. tostring(t_name),192,0,192,0)
																if temptype == 1 then
																amrun("/cast [target=" .. t_name.. "]" .. SPELL)
																else
																amrun("/use [target=" .. t_name.. "]" .. SPELL)
																end
																
																return true;
															else
																break;
															end
															
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


function amacarena(String)
--UnitGUID


	 wowam.player.Custom.Variable["amarena_name"] = nil
	 wowam.player.Custom.Variable["amarena_class"] = nil
	 wowam.player.Custom.Variable["amarena_race"] = nil
	 wowam.player.Custom.Variable["amarena_spell"] = nil
	 wowam.player.Custom.Variable["amarena_spellcd"] = nil
	 wowam.player.Custom.Variable["amarena_guid"] = nil
	 wowam.player.Custom.Variable["amarena_unit"] = nil
	 
	if not String then
		return false
	end
	
	local str ='function TEMP_amacarena(name,class,race,spell,unit,guid,spellcd) if ' .. String .. ' then return true; else return false; end end'
	
	--DEFAULT_CHAT_FRAME:AddMessage(str)
	
	RunScript(str);
	
	local name,class,race,spell,unit,spellcd,guid;
	
		

	for i=1, 5 do
		unit="arena" .. i;
		
		if amac(unit) then
		
		 name = amGetUnitName(unit);
		 class = UnitClass(unit);
		 race = UnitRace(unit);
		 spell = amac(unit);
		 spellcd = amact(unit);
		 guid = UnitGUID(unit);
		 
		 
		 
			if TEMP_amacarena(name,class,race,spell,unit,guid,spellcd) then
			
			 wowam.player.Custom.Variable["amarena_name"] = name
			 wowam.player.Custom.Variable["amarena_class"] = class
			 wowam.player.Custom.Variable["amarena_race"] = race
			 wowam.player.Custom.Variable["amarena_spell"] = spell
			 wowam.player.Custom.Variable["amarena_spellcd"] = spellcd
			 wowam.player.Custom.Variable["amarena_guid"] = guid
			 wowam.player.Custom.Variable["amarena_unit"] = unit
				 
			 return unit,name,class,race,spell,spellcd,guid;
			end
				 
		end
		
		
	end
	
	
	
	--	DEFAULT_CHAT_FRAME:AddMessage(v)

	return false
end



function amarenainf(String)
--UnitGUID


	 wowam.player.Custom.Variable["amarenainf_name"] = nil
	 wowam.player.Custom.Variable["amarenainf_class"] = nil
	 wowam.player.Custom.Variable["amarenainf_race"] = nil
	 wowam.player.Custom.Variable["amarenainf_spell"] = nil
	 wowam.player.Custom.Variable["amarenainf_spellcd"] = nil
	 wowam.player.Custom.Variable["amarenainf_guid"] = nil
	 wowam.player.Custom.Variable["amarenainf_unit"] = nil
	 
	if not String then
		return false
	end
	
	local str ='function TEMP_amarenainf(name,class,race,spell,unit,guid,spellcd) if ' .. String .. ' then return true; else return false; end end'
	
	--DEFAULT_CHAT_FRAME:AddMessage(str)
	
	RunScript(str);
	
	local name,class,race,spell,unit,spellcd,guid;
	
		

	for i=1, 5 do
		unit="arena" .. i;
		
		if amGetUnitName(unit)then
		
		 --bufflist = ambufflist(unit);
		 name = amGetUnitName(unit);
		 class = UnitClass(unit);
		 race = UnitRace(unit);
		 spell = amac(unit);
		 spellcd = amact(unit);
		 guid = UnitGUID(unit);
		 
		 
		 
			if TEMP_amarenainf(name,class,race,spell,unit,guid,spellcd) then
			
			 wowam.player.Custom.Variable["amarenainf_name"] = name
			 wowam.player.Custom.Variable["amarenainf_class"] = class
			 wowam.player.Custom.Variable["amarenainf_race"] = race
			 wowam.player.Custom.Variable["amarenainf_spell"] = spell
			 wowam.player.Custom.Variable["amarenainf_spellcd"] = spellcd
			 wowam.player.Custom.Variable["amarenainf_guid"] = guid
			 wowam.player.Custom.Variable["amarenainf_unit"] = unit
				 
			 return unit,name,class,race,spell,spellcd,guid;
			end
				 
		end
		
		
	end
	
	
	
	--	DEFAULT_CHAT_FRAME:AddMessage(v)

	return false
end







function amyjzl(spells,Treatment,StrExcluded)

-- {3000;1000;治療波}

	if type(spells) == "table" then
		Wowam_Message("類型錯誤: 參數1不是數組" )
		return false
	end
	
	if type(Treatment) == "table" then
		Wowam_Message("類型錯誤: 參數2不是數組" )
		return false
	end
	
	if type(StrExcluded) == "table" then
		Wowam_Message("類型錯誤: 參數3不是數組" )
		return false
	end
	
	str ='function TEMP_amyjzl_E(name,class,race,spell,unit,guid,spellcd,subgroup,unitinf) if ' .. StrExcluded .. ' then return true; else return false; end end'
	RunScript(str);
	
	
	local Health,StopHealth,Spell;
	local Inf={};
	local temp_jn;
	local name,class,race,spell,unit,spellcd,guid,subgroup;
	local str,z,n,names,index;
	
		for i,spells_v in ipairs(spells) do
			
			temp_jn = { strsplit(";",spells_v) }
			
			if temp_jn[1] and temp_jn[2] and temp_jn[3] then
			
				Health[i] = temp_jn[1]
				StopHealth[i] = temp_jn[2]
				Spell[i] = temp_jn[3]
				
			else
			
				Wowam_Message("格式錯誤:" .. spells_v)
				return false;
			end
				
		end
		
		
		
		-- player --
		
		if GetNumGroupMembers()==0 and GetNumSubgroupMembers()==0 then
			names ={"player","pet"}
			for i,names_v in ipairs(names) do
				unit = names_v;
				health = UnitHealthMax(unit) - UnitHealth(unit);
				index = 0;
				
				for e,Health_v in ipairs(Health) do
					if Health_v >= health then
					
					name = amGetUnitName(unit);
					class = UnitClass(unit);
					race = UnitRace(unit);
					spell = amac(unit);
					spellcd = amact(unit);
					guid = UnitGUID(unit);
					subgroup = amsubgroup(unit)
					index = e;
					break;
					end
				end
				
				if index >0 then
				 
	
					 unitinf = {["name"]=name,["class"]=class,["race"]=race,["spell"]=spell,["spellcd"]=spellcd,["guid"]=guid,["subgroup"]=subgroup}
					 z=0;
					 n=0;
					for k,Treatment_v in ipairs(Treatment) do
				
					
						str ='function TEMP_amyjzl(name,class,race,spell,unit,guid,spellcd,subgroup,unitinf) if ' .. Treatment_v .. ' then return true; else return false; end end'
						RunScript(str);

						if TEMP_amyjzl(name,class,race,spell,unit,guid,spellcd,subgroup,unitinf) then
							z = z + 1;
						end
				
						n = n+1;
					end
					
					if z == n then
					
						 z=0;
						 n=0;
						 
						for k,StrExcluded_v in ipairs(StrExcluded) do
					
						
							str ='function TEMP_amyjzl_E(name,class,race,spell,unit,guid,spellcd,subgroup,unitinf) if ' .. StrExcluded_v .. ' then return true; else return false; end end'
							RunScript(str);

							if TEMP_amyjzl_E(name,class,race,spell,unit,guid,spellcd,subgroup,unitinf) then
								z = z + 1;
							end
					
							n = n + 1;
						end

					
							if z ~= n then
								
								return true;
							
							end
					end
					
				end
				
			end	
		end
		
	
			return false;

end



function ampartyinf(String)
--UnitGUID


	 wowam.player.Custom.Variable["ampartyinf_name"] = nil
	 wowam.player.Custom.Variable["ampartyinf_class"] = nil
	 wowam.player.Custom.Variable["ampartyinf_race"] = nil
	 wowam.player.Custom.Variable["ampartyinf_spell"] = nil
	 wowam.player.Custom.Variable["ampartyinf_spellcd"] = nil
	 wowam.player.Custom.Variable["ampartyinf_guid"] = nil
	 wowam.player.Custom.Variable["ampartyinf_unit"] = nil
	 
	if not String then
		return false
	end
	
	local str ='function TEMP_ampartyinf(name,class,race,spell,unit,guid,spellcd) if ' .. String .. ' then return true; else return false; end end'
	
	--DEFAULT_CHAT_FRAME:AddMessage(str)
	
	RunScript(str);
	
	local name,class,race,spell,unit,spellcd,guid;
	
	local Members =GetNumSubgroupMembers()+1;

	for i=1, Members do
		if Members == i then
			unit="player"
		else
			unit="party" .. i;
		end
		
		if amGetUnitName(unit)then
		
		 --bufflist = ambufflist(unit);
		 name = amGetUnitName(unit);
		 class = UnitClass(unit);
		 race = UnitRace(unit);
		 spell = amac(unit);
		 spellcd = amact(unit);
		 guid = UnitGUID(unit);
		 
		 
		 
			if TEMP_ampartyinf(name,class,race,spell,unit,guid,spellcd) then
			
			 wowam.player.Custom.Variable["ampartyinf_name"] = name
			 wowam.player.Custom.Variable["ampartyinf_class"] = class
			 wowam.player.Custom.Variable["ampartyinf_race"] = race
			 wowam.player.Custom.Variable["ampartyinf_spell"] = spell
			 wowam.player.Custom.Variable["ampartyinf_spellcd"] = spellcd
			 wowam.player.Custom.Variable["ampartyinf_guid"] = guid
			 wowam.player.Custom.Variable["ampartyinf_unit"] = unit
				 
			 return unit,name,class,race,spell,spellcd,guid;
			end
				 
		end
		
		
	end
	
	
	
	--	DEFAULT_CHAT_FRAME:AddMessage(v)

	return false
end



function amraidinf(String)
--UnitGUID


	 wowam.player.Custom.Variable["amraidinf_name"] = nil
	 wowam.player.Custom.Variable["amraidinf_class"] = nil
	 wowam.player.Custom.Variable["amraidinf_race"] = nil
	 wowam.player.Custom.Variable["amraidinf_spell"] = nil
	 wowam.player.Custom.Variable["amraidinf_spellcd"] = nil
	 wowam.player.Custom.Variable["amraidinf_guid"] = nil
	 wowam.player.Custom.Variable["amraidinf_unit"] = nil
	 
	if not String then
		return false
	end
	
	local str ='function TEMP_amraidinf(name,class,race,spell,unit,guid,spellcd) if ' .. String .. ' then return true; else return false; end end'
	
	--DEFAULT_CHAT_FRAME:AddMessage(str)
	
	RunScript(str);
	
	local name,class,race,spell,unit,spellcd,guid;
	
	local Members =GetNumGroupMembers();

	for i=1, Members do
		unit="raid" .. i;
		
		if amGetUnitName(unit)then
		
		-- bufflist = ambufflist(unit);
		 name = amGetUnitName(unit);
		 class = UnitClass(unit);
		 race = UnitRace(unit);
		 spell = amac(unit);
		 spellcd = amact(unit);
		 guid = UnitGUID(unit);
		 
		 
		 
			if TEMP_amraidinf(name,class,race,spell,unit,guid,spellcd) then
			
			 wowam.player.Custom.Variable["amraidinf_name"] = name
			 wowam.player.Custom.Variable["amraidinf_class"] = class
			 wowam.player.Custom.Variable["amraidinf_race"] = race
			 wowam.player.Custom.Variable["amraidinf_spell"] = spell
			 wowam.player.Custom.Variable["amraidinf_spellcd"] = spellcd
			 wowam.player.Custom.Variable["amraidinf_guid"] = guid
			 wowam.player.Custom.Variable["amraidinf_unit"] = unit
				 
			 return unit,name,class,race,spell,spellcd,guid;
			end
				 
		end
		
		
	end
	
	
	
	--	DEFAULT_CHAT_FRAME:AddMessage(v)

	return false
end


function ampartypetinf(String)
--UnitGUID


	 wowam.player.Custom.Variable["ampartypetinf_name"] = nil
	 wowam.player.Custom.Variable["ampartypetinf_class"] = nil
	 wowam.player.Custom.Variable["ampartypetinf_race"] = nil
	 wowam.player.Custom.Variable["ampartypetinf_spell"] = nil
	 wowam.player.Custom.Variable["ampartypetinf_spellcd"] = nil
	 wowam.player.Custom.Variable["ampartypetinf_guid"] = nil
	 wowam.player.Custom.Variable["ampartypetinf_unit"] = nil
	 
	if not String then
		return false
	end
	
	local str ='function TEMP_ampartypetinf(name,class,race,spell,unit,guid,spellcd) if ' .. String .. ' then return true; else return false; end end'
	
	--DEFAULT_CHAT_FRAME:AddMessage(str)
	
	RunScript(str);
	
	local name,class,race,spell,unit,spellcd,guid;
	
	local Members =GetNumSubgroupMembers()+1;

	for i=1, Members do
		
		
		if Members == i then
			unit="pet"
		else
			unit="partypet" .. i;
		end
		
		
		if amGetUnitName(unit)then
		
		 --bufflist = ambufflist(unit);
		 name = amGetUnitName(unit);
		 class = UnitClass(unit);
		 race = UnitRace(unit);
		 spell = amac(unit);
		 spellcd = amact(unit);
		 guid = UnitGUID(unit);
		 
		 
		 
			if TEMP_ampartypetinf(name,class,race,spell,unit,guid,spellcd) then
			
			 wowam.player.Custom.Variable["ampartypetinf_name"] = name
			 wowam.player.Custom.Variable["ampartypetinf_class"] = class
			 wowam.player.Custom.Variable["ampartypetinf_race"] = race
			 wowam.player.Custom.Variable["ampartypetinf_spell"] = spell
			 wowam.player.Custom.Variable["ampartypetinf_spellcd"] = spellcd
			 wowam.player.Custom.Variable["ampartypetinf_guid"] = guid
			 wowam.player.Custom.Variable["ampartypetinf_unit"] = unit
				 
			 return unit,name,class,race,spell,spellcd,guid;
			end
				 
		end
		
		
	end
	
	
	
	--	DEFAULT_CHAT_FRAME:AddMessage(v)

	return false
end




function amraidpetinf(String)
--UnitGUID


	 wowam.player.Custom.Variable["amraidpetinf_name"] = nil
	 wowam.player.Custom.Variable["amraidpetinf_class"] = nil
	 wowam.player.Custom.Variable["amraidpetinf_race"] = nil
	 wowam.player.Custom.Variable["amraidpetinf_spell"] = nil
	 wowam.player.Custom.Variable["amraidpetinf_spellcd"] = nil
	 wowam.player.Custom.Variable["amraidpetinf_guid"] = nil
	 wowam.player.Custom.Variable["amraidpetinf_unit"] = nil
	 
	if not String then
		return false
	end
	
	local str ='function TEMP_amraidpetinf(name,class,race,spell,unit,guid,spellcd) if ' .. String .. ' then return true; else return false; end end'
	
	--DEFAULT_CHAT_FRAME:AddMessage(str)
	
	RunScript(str);
	
	local name,class,race,spell,unit,spellcd,guid;
	
	local Members =GetNumGroupMembers();

	for i=1, Members do
		unit="raidpet" .. i;
		
		if amGetUnitName(unit)then
		
		 --bufflist = ambufflist(unit);
		 name = amGetUnitName(unit);
		 class = UnitClass(unit);
		 race = UnitRace(unit);
		 spell = amac(unit);
		 spellcd = amact(unit);
		 guid = UnitGUID(unit);
		 
		 
		 
			if TEMP_amraidpetinf(name,class,race,spell,unit,guid,spellcd) then
			
			 wowam.player.Custom.Variable["amraidpetinf_name"] = name
			 wowam.player.Custom.Variable["amraidpetinf_class"] = class
			 wowam.player.Custom.Variable["amraidpetinf_race"] = race
			 wowam.player.Custom.Variable["amraidpetinf_spell"] = spell
			 wowam.player.Custom.Variable["amraidpetinf_spellcd"] = spellcd
			 wowam.player.Custom.Variable["amraidpetinf_guid"] = guid
			 wowam.player.Custom.Variable["amraidpetinf_unit"] = unit
				 
			 return unit,name,class,race,spell,spellcd,guid;
			end
				 
		end
		
		
	end
	
	
	
	--	DEFAULT_CHAT_FRAME:AddMessage(v)

	return false
end


function amisequiped(equiped,Unit)

	if Unit == nil then
		Unit = "player"
	end
	
	if not equiped then
		return false;
	end
	
	if UnitGUID(Unit) == UnitGUID("player") then
	
		if IsEquippedItem(equiped) then
			return true;
			
		else
			return false;
		end
		
	
	end
	
	--[[
	if type(equiped) == "number" then 
		
		local mainHandLink = GetInventoryItemLink(Unit,equiped)
					
						if mainHandLink then
						local spell = GetItemInfo(mainHandLink)
							return 	spell,equiped;
								
						end
		return nil;
	
	end
	--]]
	
	--if type(equiped) == "string" then

		for i=1 , 23 do
					
					
					local mainHandLink = GetInventoryItemLink(Unit,i)
					
						if mainHandLink then
						local spell = GetItemInfo(mainHandLink)
						
						--print(spell)
						
							if spell == equiped then
								
								return 	true;
								
							end
						end


		end
		
		return false;
		
	--end
	
	--return nil;
	
end


function amminimum(String,StrReturn,group) --小隊或者團隊裏最小的數值的人物信息
--UnitGUID

	if not(group == "party" or group=="partypet"  or group=="raid"  or group=="raidpet" or group=="arena"   or group=="arenapet" or group=="FHenemies") then
	DEFAULT_CHAT_FRAME:AddMessage("group 參數不對")
	return false
	end


	 wowam.player.Custom.Variable["amminimum_name"] = nil
	 wowam.player.Custom.Variable["amminimum_class"] = nil
	 wowam.player.Custom.Variable["amminimum_race"] = nil
	 wowam.player.Custom.Variable["amminimum_spell"] = nil
	 wowam.player.Custom.Variable["amminimum_spellcd"] = nil
	 wowam.player.Custom.Variable["amminimum_guid"] = nil
	 wowam.player.Custom.Variable["amminimum_unit"] = nil
	 wowam.player.Custom.Variable["amminimum_Value"] = nil
	 
	 
	if String==nil or StrReturn == nil then
	
		DEFAULT_CHAT_FRAME:AddMessage("String 或 StrReturn 參數不能為空")
		return false
	end
	
	local str ='function TEMP_amminimum(name,class,race,spell,unit,guid,spellcd) if ' .. String .. ' then return ' .. StrReturn .. '; else return false; end end'
	
	--DEFAULT_CHAT_FRAME:AddMessage(str)
	
	RunScript(str);
	
	local name,class,race,spell,unit,spellcd,guid;
	
	local Members ,minimum,temp_unit ;
	local temp_n =nil;
	
	if group == "party" or group=="partypet"   then
		Members =GetNumSubgroupMembers()+1 ;
	elseif group=="raid"  or group=="raidpet" then
		Members =GetNumGroupMembers() ;
	elseif group=="arena" then
		Members =5;
	elseif group=="arenapet" then
		Members =5;
	elseif group=="FHenemies" then
                Members = #FHenemiesTable;
	end

	for i=1, Members do
		if i==Members and group == "party" then
		unit="player"
		elseif i==Members and group == "partypet" then
		unit="pet"
		else
		unit=group .. tostring(i);
		end
		
		if amGetUnitName(unit)then
		
			 --bufflist = ambufflist(unit);
			 name = amGetUnitName(unit);
			 class = UnitClass(unit);
			 race = UnitRace(unit);
			 spell = amac(unit);
			 spellcd = amact(unit);
			 guid = UnitGUID(unit);
		 
		 minimum = TEMP_amminimum(name,class,race,spell,unit,guid,spellcd);
		 
			if minimum then
			 
				if temp_n == nil then
				 
					temp_n =minimum;
					temp_unit = unit;
				elseif minimum < temp_n then
					temp_n =minimum;
					temp_unit = unit;
				end
			end	
				 
		end
		
		
		
	end
	
	if temp_unit then
	
			 
			 
			 --bufflist = ambufflist(temp_unit);
			 name = amGetUnitName(temp_unit);
			 class = UnitClass(temp_unit);
			 race = UnitRace(temp_unit);
			 spell = amac(temp_unit);
			 spellcd = amact(temp_unit);
			 guid = UnitGUID(temp_unit);
			
			 wowam.player.Custom.Variable["amminimum_name"] = name
			 wowam.player.Custom.Variable["amminimum_class"] = class
			 wowam.player.Custom.Variable["amminimum_race"] = race
			 wowam.player.Custom.Variable["amminimum_spell"] = spell
			 wowam.player.Custom.Variable["amminimum_spellcd"] = spellcd
			 wowam.player.Custom.Variable["amminimum_guid"] = guid
			 wowam.player.Custom.Variable["amminimum_unit"] = temp_unit
			 wowam.player.Custom.Variable["amminimum_Value"] = temp_n
				 
			 return temp_unit,name,class,race,spell,spellcd,guid,temp_n;
	end
	
	
	
	
	--	DEFAULT_CHAT_FRAME:AddMessage(v)

	return false
end


function amshowbufflist(Unit) --獲得指定目標buff列表
	local name = {};
	local i,c,k,n;
	local ls_icon={};
	
	k = 1;
	
	if Unit == nil then
		Unit="player";
	end
	
	if not amGetUnitName(Unit) then
		Wowam_Message(wowam.Colors.RED..tostring(Unit).." ID不正確" )
		return nil;
	end
	
	Wowam_Message(wowam.Colors.RED..amGetUnitName(Unit).." - Buff列表" )
	Wowam_Message(wowam.Colors.MAGENTA.."有益Buff" )
	for i=1,40 do 
		c, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable,shouldConsolidate, spellId =  UnitBuff(Unit, i)
		if c then
		name[k] = c ;
		
		n = expirationTime - GetTime()
		if n < 0 then
			n= 0
		end
		n = format("%.1f",n);
		
		
		ls_icon = { strsplit("\\",icon) }
		
		Wowam_Message(wowam.Colors.RED..tostring(k)..". ".. wowam.Colors.CYAN .. c )
		Wowam_Message(wowam.Colors.YELLOW.."   等級:".. wowam.Colors.CYAN .. tostring(rank) )
		Wowam_Message(wowam.Colors.YELLOW.."   類型:".. wowam.Colors.CYAN .. tostring(debuffType) )
		Wowam_Message(wowam.Colors.YELLOW.."   層數:".. wowam.Colors.CYAN .. tostring(count) )
		Wowam_Message(wowam.Colors.YELLOW.."   冷卻:".. wowam.Colors.CYAN .. tostring(n) )
		Wowam_Message(wowam.Colors.YELLOW.."   歸屬:".. wowam.Colors.CYAN .. tostring(unitCaster) )
		Wowam_Message(wowam.Colors.YELLOW.."   圖標:".. wowam.Colors.CYAN .. tostring(ls_icon[3]) )
		Wowam_Message(wowam.Colors.YELLOW.."   isStealable:".. wowam.Colors.CYAN .. tostring(isStealable) )
		
		Wowam_Message(wowam.Colors.YELLOW.."   shouldConsolidate:".. wowam.Colors.CYAN .. tostring(shouldConsolidate) )
		Wowam_Message(wowam.Colors.YELLOW.."   spellId:".. wowam.Colors.CYAN .. tostring(spellId) )
		print(GetSpellLink(spellId));
		k = k + 1;
		end
		
		
	end
	
	
	Wowam_Message(wowam.Colors.MAGENTA.."無益Buff" )
	ls_icon={}
	for i=1,40 do 
		c, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable,shouldConsolidate, spellId=  UnitDebuff(Unit, i)
		
		if c then
		name[k] = c ;
		
		
		
		n = expirationTime - GetTime()
		if n < 0 then
			n= 0
		end
		n = format("%.1f",n);
		
		ls_icon = { strsplit("\\",icon) }
		
		Wowam_Message(wowam.Colors.RED..tostring(k)..". ".. wowam.Colors.CYAN .. c )
		Wowam_Message(wowam.Colors.YELLOW.."   等級:".. wowam.Colors.CYAN .. tostring(rank) )
		Wowam_Message(wowam.Colors.YELLOW.."   類型:".. wowam.Colors.CYAN .. tostring(debuffType) )
		Wowam_Message(wowam.Colors.YELLOW.."   層數:".. wowam.Colors.CYAN .. tostring(count) )
		Wowam_Message(wowam.Colors.YELLOW.."   冷卻:".. wowam.Colors.CYAN .. tostring(n) )
		Wowam_Message(wowam.Colors.YELLOW.."   歸屬:".. wowam.Colors.CYAN .. tostring(unitCaster) )
		Wowam_Message(wowam.Colors.YELLOW.."   圖標:".. wowam.Colors.CYAN .. tostring(ls_icon[3]) )
		Wowam_Message(wowam.Colors.YELLOW.."   isStealable:".. wowam.Colors.CYAN .. tostring(isStealable) )
		
		Wowam_Message(wowam.Colors.YELLOW.."   shouldConsolidate:".. wowam.Colors.CYAN .. tostring(shouldConsolidate) )
		Wowam_Message(wowam.Colors.YELLOW.."   spellId:".. wowam.Colors.CYAN .. tostring(spellId) )
		print(GetSpellLink(spellId));
		
		k = k + 1;
		end
		
		
	end
	
	return k-1;
	
end
function amwbuff(n)
	local a,b,c,a1,b1,c1,a2,b2,c2 = GetWeaponEnchantInfo() -- 返回主手和副手武器附魔信息.

	if n ==1 and a then
		return b/1000,a,c
	elseif n ==2 and a1 then
		return b1/1000,a1,c1
	elseif n ==3 and a2 then
		return b2/1000,a2,c2
		
	end

	return nil;
	
end


function amzblist(Unit)
	if Unit == nil then
		Unit="player";
	end
	
	local cd;

			for i=1 , 23 do
			
			
			local mainHandLink = GetInventoryItemLink(Unit,i)
			
				if mainHandLink then
				local spell = GetItemInfo(mainHandLink)
				
					if spell then
						
						a, b, c = GetInventoryItemCooldown(Unit, i)
						
						cd= a+b-GetTime()
						if cd<0 then
							cd = 0
						end
						
						cd = format("%.1f",cd)
						
						DEFAULT_CHAT_FRAME:AddMessage(wowam.Colors.RED .. "編號:" .. wowam.Colors.CYAN .. tostring(i) .. wowam.Colors.YELLOW .."  名稱:" ..wowam.Colors.CYAN.. spell .. wowam.Colors.YELLOW .."  冷卻時間:" ..wowam.Colors.CYAN.. cd,192,0,192,0)
						
						
					
					end
				end


			end
			
end

function amprint(String)

local str ='function TEMP_amprint() return ' .. String .. '; end'
	
	--DEFAULT_CHAT_FRAME:AddMessage(str)
	
	RunScript(str);
local ls_jn = {TEMP_amprint() }
	
			 
			for i,v in ipairs(ls_jn) do
			
				Wowam_Message(wowam.Colors.RED .. tostring(v))
			end
		
				
					
end

function amdc()



if not amGetUnitName("target") then
return nil
end
local a = DPSCycleIconFrame1
if a ==nil then
	Wowam_Message(wowam.Colors.RED.."註意："..wowam.Colors.CYAN.."沒檢測到 DPSCycle 插件!")
	return nil
end

local spell=DPSCycleIconFrame1.spellName

if amac("player") ~= spell then

amrun(spell)
end

--DEFAULT_CHAT_FRAME:AddMessage(tostring(amac("player")))

return spell
end


function ammaximum(String,StrReturn,group) --小隊或者團隊裏最大的數值的人物信息
--UnitGUID

	if not(group == "party" or group=="partypet"  or group=="raid"  or group=="raidpet" or group=="arena"  or group=="arenapet" or group=="FHenemies") then
	DEFAULT_CHAT_FRAME:AddMessage("group 參數不對")
	return false
	end
	


	 wowam.player.Custom.Variable["ammaximum_name"] = nil
	 wowam.player.Custom.Variable["ammaximum_class"] = nil
	 wowam.player.Custom.Variable["ammaximum_race"] = nil
	 wowam.player.Custom.Variable["ammaximum_spell"] = nil
	 wowam.player.Custom.Variable["ammaximum_spellcd"] = nil
	 wowam.player.Custom.Variable["ammaximum_guid"] = nil
	 wowam.player.Custom.Variable["ammaximum_unit"] = nil
	 wowam.player.Custom.Variable["ammaximum_Value"] = nil
	 
	 
	if String==nil or StrReturn == nil then
	
		DEFAULT_CHAT_FRAME:AddMessage("String 或 StrReturn 參數不能為空")
		return false
	end
	
	local str ='function TEMP_ammaximum(name,class,race,spell,unit,guid,spellcd) if ' .. String .. ' then return ' .. StrReturn .. '; else return false; end end'
	
	--DEFAULT_CHAT_FRAME:AddMessage(str)
	
	RunScript(str);
	
	local name,class,race,spell,unit,spellcd,guid;
	
	local Members ,minimum,temp_unit ;
	local temp_n =nil;
	
	if group == "party" or group=="partypet"   then
		Members =GetNumSubgroupMembers()+1 ;
	elseif group=="raid"  or group=="raidpet" then
		Members =GetNumGroupMembers()+1 ;
	elseif group=="arena" then
		Members =5;
	elseif group=="arenapet" then
		Members =5;
	elseif group=="FHenemies" then
		Members =#FHenemiesTable;	
		
	end

	for i=1, Members do
		if i==Members and (group == "party" or group=="raid") then
		unit="player"
		elseif i==Members and (group == "partypet" or group=="raidpet") then
		unit="pet"
		else
		unit=group .. tostring(i);
		end
		
		if amGetUnitName(unit)then
		
			 --bufflist = ambufflist(unit);
			 name = amGetUnitName(unit);
			 class = UnitClass(unit);
			 race = UnitRace(unit);
			 spell = amac(unit);
			 spellcd = amact(unit);
			 guid = UnitGUID(unit);
		 
		 minimum = TEMP_ammaximum(name,class,race,spell,unit,guid,spellcd);
		 
			if minimum then
			 
				if temp_n == nil then
				 
					temp_n =minimum;
					temp_unit = unit;
				elseif minimum > temp_n then
					temp_n =minimum;
					temp_unit = unit;
				end
			end	
				 
		end
		
		
		
	end
	
	if temp_unit then
	
			 
			 
			 --bufflist = ambufflist(temp_unit);
			 name = amGetUnitName(temp_unit);
			 class = UnitClass(temp_unit);
			 race = UnitRace(temp_unit);
			 spell = amac(temp_unit);
			 spellcd = amact(temp_unit);
			 guid = UnitGUID(temp_unit);
			
			 wowam.player.Custom.Variable["ammaximum_name"] = name
			 wowam.player.Custom.Variable["ammaximum_class"] = class
			 wowam.player.Custom.Variable["ammaximum_race"] = race
			 wowam.player.Custom.Variable["ammaximum_spell"] = spell
			 wowam.player.Custom.Variable["ammaximum_spellcd"] = spellcd
			 wowam.player.Custom.Variable["ammaximum_guid"] = guid
			 wowam.player.Custom.Variable["ammaximum_unit"] = temp_unit
			 wowam.player.Custom.Variable["ammaximum_Value"] = temp_n
				 
			 return temp_unit,name,class,race,spell,spellcd,guid,temp_n;
	end
	
	
	
	
	--	DEFAULT_CHAT_FRAME:AddMessage(v)

	return false
end

function amnewspelltime(Unit,Spell)

	if not amGetUnitName(Unit) or Spell == nil then
		return;
	end
	
	local str = UnitGUID(Unit) .. "_" .. Spell;
	local n = wowam.spell.Event_SpellInfo.name[str];

	if n  then
		return GetTime() - n
		
	else
		return -1;
	
	end



end


function amcount(String,StrReturn,group) --小隊或者團隊裏符合條件的人物信息數量
--UnitGUID

local count =0;
local u;

	if not(group == "party" or group=="partypet"  or group=="raid"  or group=="raidpet" or group=="arena"  or group=="arenapet" or group=="FHenemies") then
	DEFAULT_CHAT_FRAME:AddMessage("group 參數不對")
	return false
	end


	 
	 
	if String==nil or StrReturn == nil then
	
		DEFAULT_CHAT_FRAME:AddMessage("String 或 StrReturn 參數不能為空")
		return false
	end
	
	local str ='function TEMP_amcount(name,class,race,spell,unit,guid,spellcd) if ' .. String .. ' then return ' .. StrReturn .. '; else return false; end end'
	
	
	
	RunScript(str);
	
	local name,class,race,spell,unit,spellcd,guid;
	
	local Members ,minimum,temp_unit ;
	local temp_n =nil;
	
	if group == "party" or group=="partypet"   then
		Members =GetNumSubgroupMembers()+1 ;
	elseif group=="raid"  or group=="raidpet" then
		Members =GetNumGroupMembers() ;
	elseif group=="arena" then
		Members =5;
	elseif group=="arenapet" then
		Members =5;
	elseif group=="FHenemies" then
		Members =#FHenemiesTable;
	end

	for i=1, Members do
		if i==Members and group == "party" then
		unit="player"
		elseif i==Members and group == "partypet" then
		unit="pet"
		else
		unit=group .. tostring(i);
		end
		
		if amGetUnitName(unit)then
		
			 --bufflist = ambufflist(unit);
			 name = amGetUnitName(unit);
			 class = UnitClass(unit);
			 race = UnitRace(unit);
			 spell = amac(unit);
			 spellcd = amact(unit);
			 guid = UnitGUID(unit);
		 
		 minimum = TEMP_amcount(name,class,race,spell,unit,guid,spellcd);
		 
			if minimum then
			 u = unit;
				count = count +1;
			end	
				 
		end
		
		
		
	end
	
	
	
	
	
	
	--	DEFAULT_CHAT_FRAME:AddMessage(v)

	return count,u;
end



function amautoscript(Script,Loop,Tips)

	if Tips==nil then
		Tips =0;
	end

	if not Script then
		wowam.sys.automacro.Loop = nil
		wowam.sys.automacro.id =0
		wowam.sys.automacro.tbl=nil;
		if Tips ~=2 then
		Wowam_Message(wowam.Colors.RED .. "自動運行腳本已經停止!" )
		end
		return nil;
	end
	
	if type(Script) == "string" then
	
		Script = { strsplit(",",Script) }

	elseif type(Script) == "table" then
	
	else
		Wowam_Message(wowam.Colors.CYAN .. tostring(Script) .. wowam.Colors.RED.." ,參數1錯誤!" )
		return nil;
	end
	
	if type(Loop) ~= "number" then
	
		Wowam_Message(wowam.Colors.CYAN .. tostring(Loop) .. wowam.Colors.RED.." 錯誤!,參數2應該是個整數" )
		return nil;
	end
	
	if type(Tips) ~= "number" then
	
		Wowam_Message(wowam.Colors.CYAN .. tostring(Tips) .. wowam.Colors.RED.." 錯誤!,參數3應該是個整數" )
		return nil;
	end
	
	local n=0;
	local t=0;
	for i,h in ipairs(Script) do
		
		local _, _, a, b = string.find(h, "(.-)=(.+)")
		
			
			
			if not a or not b or tostring(tonumber(b)) ~= b  then
				Wowam_Message(wowam.Colors.CYAN .. tostring(h) .. wowam.Colors.RED.." 錯誤!" )
				wowam.sys.automacro.tbl=nil;
				return  nil;
			end
			
			if not amisscript(a)  then
			
				wowam.sys.automacro.tbl=nil;
				return  a;
			end
			n=n+1;
			t=t+tonumber(b);
		
		
	end
	wowam.sys.automacro.Loop = Loop
	wowam.sys.automacro.id =1;
	wowam.sys.automacro.tbl=Script;
	wowam.sys.automacro.Tips=Tips;
	
	if Tips ~=2 then
	Wowam_Message(wowam.Colors.RED .. "自動運行腳本已經啟動，" .. wowam.Colors.CYAN .."腳本完成時間約" .. wowam.Colors.RED .. tostring(t) .. wowam.Colors.CYAN .. "秒")
	end
	return Script;
end

function amisscript(name)
local luaText = nil

	if not sdm_UsedByThisChar then
		
		Wowam_Message(wowam.Colors.RED.."没安装超级宏(SuperDuperMacro)插件!" );
		return;
	end
	for i,v in pairs(sdm_macros) do
		if v.type=="s" and v.name==name and sdm_UsedByThisChar(v) then
			luaText=v.text
			break
		end
	end
	if luaText then
		return true;
	else
		Wowam_Message(wowam.Colors.CYAN .. tostring(name) .. wowam.Colors.RED.." 腳本名稱錯誤!" )
		return nil;
	end
	
end

function amrandom_bak(n)
	
	
	local x = math.random(999, GetTime()*1000);
	
	--local Mark= time() +GetTime()*1000 +x + (n or 0);
	local Mark= x + (n or 0);
	
	Mark=format("%X",Mark)
	
	local x = math.random(x, GetTime()*1000);
	
	--local Mark1= time() +GetTime()*1000 +x + (n or 0);
	local Mark1= x + (n or 0);
	
	Mark1=format("%X",Mark1)
	
	local k = math.random(1,9);
	
	if k==1 then
		Mark = Mark .. "-" .. Mark1;
	elseif k==2 then
		Mark = Mark .. "-" .. string.reverse(Mark1);
	elseif k==3 then
		Mark = Mark1 .. "-" .. string.reverse(Mark);
	elseif k==4 then
		Mark = string.reverse(Mark) .. "-" .. string.reverse(Mark1);
	elseif k==5 then
		Mark = string.reverse(Mark1 .. "-" .. Mark);
	elseif k==6 then
		Mark = string.reverse(string.reverse(Mark1) .. "-" .. string.reverse(Mark));
	elseif k==7 then
		Mark = string.reverse(Mark .. "-" .. Mark1);
	elseif k==8 then
		Mark = string.reverse(Mark .. "-" .. string.reverse(Mark1));
	elseif k==9 then
		Mark = string.reverse(Mark1 .. "-" .. string.reverse(Mark));
	end
	
	return Mark;

end
	
	
function amrandom(t)
	
	
	
	local n = math.random(100000, 999999);
	local n1 = math.random(100000, 999999);
	
	return tostring(n) .. "-" .. tostring(n1);

end
	
function ambuffcount(Unit,Nameid,BuffType,Categories) --獲得指定目標buff數量及信息
	
	if Unit == nil then
		Unit="target";
	end
	
	if Nameid == nil then
		Nameid=0;
	end
	
	if Categories == nil then
		Categories=0;
	end
	
	
	if  not amGetUnitName(Unit) then
		return -1;
	end
	
	if type(Nameid) ~= "number" then
		return -2;
	end
	
	if  type(BuffType) ~= "string" then
		return -3;
	end
	
	if type(Categories) ~= "number" then
		return -4;
	end

	
	
	
	local d,f;
	local n =0;
	local bufflist;
	local	name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable ;

	for i=1 , 40 do	
		if Categories == 1 then
			name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable = UnitBuff(Unit, i)
		elseif Categories == 0 then
			name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable = UnitDebuff(Unit, i)
		elseif Categories == 2 then
			name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable = UnitDebuff(Unit, i,true)
		elseif Categories == 3 then
			name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable = UnitBuff(Unit, i,true)
		end
		
		if name then
		
			f = amfind(BuffType,debuffType);
			d=nil;
			
			if Nameid == 0 and unitCaster == "player" then
				d=1
			elseif Nameid == 1 and unitCaster ~= "player" then
				d=1
			elseif Nameid == 2 then
				d=1
			else
				d=nil;
			end
			
			if f and d then
				if bufflist == nil  then
					bufflist=name;
				else
					bufflist=bufflist .. "," .. name;
				end
				n = n + 1;
			end
		end
		
	end
	
	return n,bufflist;
	
end


function ambrun(Spells,Unit) --批處理技能

	
	if type(Spells) == "string" then
	
		Spells = { strsplit(",",Spells) }

	elseif type(Spells) == "table" then
	
	else
		return nil;
	end
	
	if not Unit then
		Unit = "target"
	end
	
	if  not amGetUnitName(Unit) then
		return nil;
	end
	
	
	for k,va in ipairs(Spells) do
	
		if amisr(va,Unit) then
		  amrun(va,Unit);
		  return va,Unit;
		end
	
	end

end


--團隊有成員血量少於50%並且自己血量大於50%，就援護
function amIntervene(UnitHealth,MeHealth)
local spell_ex={}
spell_ex["援護"]=GetSpellInfo(3411)
spell_ex["防禦姿態"]=GetSpellInfo(71)

local Spell= spell_ex["援護"] --援護
local ZT = spell_ex["防禦姿態"]  -- 防禦姿態


	if aml("player","%")>MeHealth and amisr(Spell,"nogoal") then
	
		local YuanHu = amraidinf('IsSpellInRange("' .. Spell .. '",unit)==1 and  and amlive(unit) and aml(unit,"%",0)<' .. UnitHealth .. ' and amtnm(unit)')
		if YuanHu and not amzt(2) then
			amrun("/cast " .. ZT)
			return true;
		elseif YuanHu and amzt(2) and amisr(Spell,YuanHu) then
			amrun(Spell,YuanHu)
			return true;
		end
		
	end
	
	return nil;
end

function amBerserkerRage(Buffs) --當出現列表裏的BUFF時施放狂暴之怒
local spell_ex = wowam.sys.spell_ex

if not Buffs then
	if GetLocale()=="zhCN" then
		Buffs = "恐懼,心靈尖嘯,恐懼嚎叫,悶棍,癱瘓,破膽怒吼,恐懼術"
		
	elseif GetLocale()=="zhTW" then
	return
	else
	return
	
	end
	
end

	if amfind(Buffs,ambufflist("player")) and amcd(spell_ex["狂暴之怒"])<=0 then
		amrun(spell_ex["狂暴之怒"]);
		return true;
	end
end

function amGetInventoryItemName(Unit,Id)

	local itemId = GetInventoryItemID(Unit,Id)
						
		if itemId then
		local name = GetItemInfo(itemId)
			return 	name;
				
		end
	return "";
	
end

function amGetInventoryItemText(Id,index)

	local itemId = GetInventoryItemID("player",Id)
	
	if itemId then
	
		amGetInventoryItemTextTooltip = CreateFrame("GameTooltip", "amGetInventoryItemTextGameTooltipFrame" .. "Tooltip", nil, "GameTooltipTemplate")
			amGetInventoryItemTextTooltip:SetOwner(WorldFrame, "ANCHOR_NONE")
		
		  
			 amGetInventoryItemTextTooltip:ClearLines()  
			 amGetInventoryItemTextTooltip:SetInventoryItemByID(Id) 
			
			local text = _G[amGetInventoryItemTextTooltip:GetName() .. "TextLeft" .. index]:GetText();
			
			
			return text or "";
	else
	
		return "";
		
	end
end


		
function amequip(MainHand,DeputyHand,Distance) --换上指定的武器

local a,b,c
local zd = amzd("player");
local h ;

	--print(MainHand,DeputyHand,Distance)
	if MainHand then

		if IsEquippableItem(MainHand) then
			
			if amGetInventoryItemName("player",16) ~= MainHand then
				
				if zd then
					h = "/equipslot " .. 16 .. " " .. MainHand;
				else
					EquipItemByName(MainHand,16)
				end
			else
				a=1
			end
		
		end
		--print(">>",IsEquippableItem(MainHand),IsEquippedItem(MainHand),h)
	else
		a=1
		
	end	
	
	if DeputyHand then

		if IsEquippableItem(DeputyHand) then
			
			if amGetInventoryItemName("player",17) ~= DeputyHand then
				
				if zd then
					if h then
						h = h .. "\n/equipslot " .. 17 .. " " .. DeputyHand;
					else
						h = "/equipslot " .. 17 .. " " .. DeputyHand;
					end
				else
					EquipItemByName(DeputyHand,17)
				end
			
			else
				b=1
			end
		
		end
	else
		b=1
		
	end	
	
	if Distance then

		if IsEquippableItem(Distance) then
			
			if amGetInventoryItemName("player",18) ~= Distance then
				
				if zd then
					
					if h then
						h = h .. "\n/equipslot " .. 18 .. " " ..Distance;
					else
						h = "/equipslot " .. 18 .. " " .. Distance;
					end
					
				else
					EquipItemByName(Distance,18)
				end
				
			else
				c=1
			end
		
		end
		
	else
		c=1
	end	
	--print(h,zd)
	if zd and h then
		amrun(h);
	end
	if a and b and c then
		return true;
	end
	

end


function amequip_bak(MainHand,DeputyHand,Distance) --換上指定的武器

local a,b,c

	if MainHand then

		if IsEquippableItem(MainHand) then
			
			if not IsEquippedItem(MainHand) then
			
				EquipItemByName(MainHand,16)
			else
				a=1
			end
		
		end
	else
		a=1
		
	end	
	
	if DeputyHand then

		if IsEquippableItem(DeputyHand) then
			
			if not IsEquippedItem(DeputyHand) then
			
				EquipItemByName(DeputyHand,17)
			else
				b=1
			end
		
		end
	else
		b=1
		
	end	
	
	if Distance then

		if IsEquippableItem(Distance) then
			
			if not IsEquippedItem(Distance) then
			
				EquipItemByName(Distance,18)
			else
				c=1
			end
		
		end
		
	else
		c=1
	end	

	if a and b and c then
		return true;
	end
	

end


function amcure(Unit,Health,Spells) --當目標血量少於設定時施放技能
	if not amGetUnitName(Unit) or not Spells or not Health then
		return ;
	end
	
 if aml(Unit,"%")<Health then
 
	return ambrun(Spells,Unit)
 end
 
end

function amchase(Unit) --戰士沖鋒攔截

local spell_ex = wowam.sys.spell_ex
	
	if Unit == nil then
		Unit = "target"
	end
	if not amGetUnitName(Unit) then
		return ;
	end

	local _,_,_,_,zstf = GetTalentInfo(3,22)

-- 0 到 5 碼
 --local amjl_0_5 = IsSpellInRange(spell_ex["拳擊"],Unit)==1

 -- 8 到 25 碼
 local amjl_8_25 = IsSpellInRange(spell_ex["沖鋒"],Unit)==1
 
 -- 0 到 10 碼
 --local amjl_0_10 = CheckInteractDistance(Unit, 3)==1
 
 local xskb ;
 
 
 
 
 
	if amjl_8_25 then
	  if amgv("戰鬥姿態設定時間") then
	   if GetTime() - amgv("戰鬥姿態設定時間") <0.5 then
		 return true,1;
	   
	   end
	  end
	  if amgv("狂暴狀態設定時間") then
	   if GetTime() - amgv("狂暴狀態設定時間") <0.5 then
		 return true,2;
		else
		amsv("狂暴狀態設定時間",nil)
	   end
	  end
	  if amgv("沖鋒鎖定直到結束") then
	   if GetTime() - amgv("沖鋒鎖定直到結束") <2 and amjl_8_25 then
	   --Wowam_Message("3")
		 return true,3;
	   else
		amsv("沖鋒鎖定直到結束",nil)
		--Wowam_Message("0")
	   end
	  end

	  if amisr(spell_ex["沖鋒"],Unit) then
	   amrun(spell_ex["沖鋒"],Unit);
	   amsv("血性狂暴設定時間",nil);
	   amsv("沖鋒鎖定直到結束",GetTime())
	   return true,4;
	  end

	  if amgv("血性狂暴設定時間") then
	   xskb = GetTime() - amgv("血性狂暴設定時間")<=3;
	  else
	   xskb = nil;
	  end
	  
	  

		if amgv("狂暴狀態設定時間")==nil and amcd(spell_ex["沖鋒"])<1 and ( amzt(1) or amzt(2) or amcd(spell_ex["攔截"])>2 ) then
		  --Wowam_Message("1")
			if amjl_8_25 then
				if amzt(1) or xskb then
				  if amisr(spell_ex["沖鋒"],Unit) then
					amrun(spell_ex["沖鋒"],Unit);
				  end
				else
					
					amrun(spell_ex["戰鬥姿態"])
					amsv("戰鬥姿態設定時間",GetTime());
					
				
				end
			 return true,5;
		    end
		end
	  if amcd(spell_ex["攔截"])<1 and amjl_8_25 and (amr()>=10 or amcd(spell_ex["血性狂暴"])<=0.7) or xskb then
	  --Wowam_Message("2")
	   if amzt(3) or xskb then
		 
		 if amisr(spell_ex["攔截"],Unit) then
		  amrun(spell_ex["攔截"],Unit);
		  amsv("狂暴狀態設定時間",nil);
		 else
		  amrun(spell_ex["血性狂暴"]);
		  amsv("血性狂暴設定時間",GetTime());
		 end
		 
	   else
		 if amr()>=5 then
		 amrun(spell_ex["狂暴姿態"]);
		 amsv("狂暴狀態設定時間",GetTime());
		 
		 
		 end
	   end
		return true,6;
	  end
	end


end
	
	
function amrunIsBuffs(Unit,Buffs,Spells,Appear) --當出現列表裏的BUFF時施放技能

	if not(Buffs and Unit and Spells) then

	return
	
	end
	
	local k = amfind(Buffs,ambufflist(Unit))
	
	if not Appear and k then
		return ambrun(Spells,Unit)
	end
	
	if Appear and not k then
		return ambrun(Spells,Unit)
	end

	
end

function amat() --攻擊計時

local t = AttackTimerBar

if not t then

	Wowam_Message(wowam.Colors.RED.."錯誤：" .. wowam.Colors.CYAN .. "無法使用AttackTimer()函數,需要安裝或啟動AttackTimer插件");
	return -1
end
if AttackTimerBar:IsShown() then
local min, max = AttackTimerBar:GetMinMaxValues();
	
	local status = GetTime();
	if status > max then
		status = max;
	end
	return tonumber(format("%0.1f", max-status)), tonumber(format("%0.1f",max-min))

end

return -1

end

function amattack(Type,Auto)

	if not Type then
	Type =0
	end

	if not Auto then
	Auto =0
	end

	if Auto==1 then
		if not amGetUnitName("target") then
			return ;
		end
	end
		
	if Type ==0 then
		if amgj()==0 then
		amrun("/startattack");
		return true;
		end
	elseif Type ==1 then
		if amgj()==1 then
		amrun("/stopattack");
		return true;
		end
	end


end


function amDecursive(Break)


if not DecursiveRootTable  then
Wowam_Message(wowam.Colors.RED.."錯誤：" .. wowam.Colors.CYAN .. "無法使用amDecursive()函數,需要安裝或啟動Decursive插件");
return
end
--local n = Dcr["Status"]["UnitNum"]
local n = DecursiveRootTable["Dcr"]["Status"]["UnitNum"]
local i;
	for i=1, n do
	
		local unit,Spell,IsCharmed,Debuff1Prio = amDecursive_EX(i)
		
		if unit then
			if amGetUnitName(unit) and Spell then 
				if amisr(Spell,unit) then
					
					if Break then
						
						local s = "/stopcasting\n/cast [target=" .. unit .. "]" .. Spell;
						amrun(s);
					
					else
						
						amrun(Spell,unit);
					
					end
					
					
					return true
				end
			end
			
		end

	end
end



function amDecursive_EX(id)

local Dcr = DecursiveRootTable["Dcr"];

local unit = Dcr.Status.Unit_Array[id]

local f = Dcr["MicroUnitF"]["UnitToMUF"][unit]

if not f then
return
end
local IsDebuffed = f["IsDebuffed"]


if IsDebuffed then

local DebuffType = f["FirstDebuffType"]
local Spell = Dcr.Status.CuringSpells[DebuffType]
local IsCharmed = f["IsCharmed"]
local Debuff1Prio = f["Debuff1Prio"]
return unit,Spell,IsCharmed,Debuff1Prio
end



--MicroUnitF:UpdateMUFUnit
end

function amShockAndAwe()
local s = ShockAndAwe

if not s then
	return
end

 local temp = ShockAndAwe.PriorityFrame:GetBackdrop()
 local icon = temp["bgFile"]
 local SPELL
 for i,v in pairs(ShockAndAwe.constants) do
	if icon == v then
		SPELL =strsub(i,1,strlen(i)-5)
		SPELL =ShockAndAwe.constants[SPELL]
		if amisr(SPELL) then
			amrun(SPELL)
			return true
		end
	
	end
 end
end



function amsetsft(Time)
	if not Time then
	Time =3
	end

	if type(Time) ~= "number" then
	Wowam_Message(wowam.Colors.RED.."錯誤：" .. wowam.Colors.CYAN .. "參數類型錯誤，請使用數值");
	return false;
	end

	wowam_config.SPELL_STOP_TIME=Time;
	return true;
end 



function amsft(Spell,Unit)

	local spellName,spellRank= GetSpellInfo(Spell);
	
	if spellName and (spellRank or "") ~="" then
		if not AM_IS_CAST_NAME[spellName] then
			AM_IS_CAST_NAME[spellName]={};
		end
		
		AM_IS_CAST_NAME[spellName]["Name"]=Spell;
		AM_IS_CAST_NAME[spellName]["Time"]=GetTime();
	end
	
	local aunid = UnitGUID(Unit);
	if aunid then
	
		if wowam["FAILED_StopUnit"] and wowam["FAILED_StopUnit"][aunid] then
		
			if GetTime() - wowam["FAILED_StopUnit"][aunid]["time"] <=0.7 then
				
				return false,"忽略目标(".. wowam["FAILED_StopUnit"][aunid]["text"]..")";
			end
		
					
		end
	end
	
	local spellall = amGetSpellName(Spell)
	
	if spellall and wowam["FAILED_StopUnit"] and wowam["FAILED_StopUnit"][spellall] then
			
		if GetTime() - wowam["FAILED_StopUnit"][spellall]["time"] <=0.7 then
			
			return false,"(".. wowam["FAILED_StopUnit"][spellall]["text"]..")";
		end
	
	end	
	
	
	local unid ;
	local tbl = wowam.DelayTbl[spellall];	
	
	if tbl and tbl["Status"] and tbl["Status"] == "star" then
		
		return false,"技能施放中...";
	end
	
	if Unit == "nogoal" then
	
		if tbl then
			
			if  tbl["Status"] and tbl["Status"] == "end" and tbl["EndTime"] and (GetTime() < tbl["EndTime"]) then
				
				return false,"技能延時中...";
			end
		
		end
		
		return true,"";
	
	else
	
		unid = UnitGUID(Unit);
		
	end
	
	
	
	
	
	
	if tbl and unid then
				
		
		
		if tbl["Status"] and tbl["Status"] == "star" and tbl["DelayTime"] then
			--print(1,GetTime(),"技能延時施放,施放中...")
			return false,"技能延時施放,施放中...";
		
		
		elseif tbl[unid] and tbl[unid]["Status"] and tbl[unid]["Status"] == "star" and tbl[unid]["DelayTime"] then
			--print(2,GetTime(),"技能延時施放,施放中...")
			return false,"技能延時施放,施放中...";
		
		
		elseif  tbl["Status"] and tbl["Status"] == "end" and tbl["EndTime"] and (GetTime() < tbl["EndTime"]) then
			--print(3,GetTime(),"技能延時中...")
			return false,"技能延時中...";
			
		elseif tbl[unid] and tbl[unid]["Status"] and tbl[unid]["Status"] == "end" and tbl[unid]["EndTime"] and (GetTime() < tbl[unid]["EndTime"]) then
			--print(4,GetTime(),"技能延時中...")
			return false,"技能延時中...";
		
		else
			--print(5,GetTime())
		end
		
		
		
		
	
	end
	
	return true,"";
	
	

end



function amjl(Unit1, Unit2)-- 判斷距離
if not Unit2 then
  if not Unit1 then
   Unit1 = "target";
  end
  if not amGetUnitName(Unit1) then
   return 100000000;
  end
  local _,jl = wowam_rc:getRange(Unit1)
  if not jl then
   return 100000000;
  end
  return jl;
else
  --參數類型格式化
  local i=0;
  if UnitInRaid("player") then
   if string.lower(string.sub(Unit1,1,4))~="raid" or string.lower(string.sub(Unit2,1,4))~="raid" then
    for i=1, GetNumGroupMembers() do
     local tempname, _, _, _, _, _, _, _, _, _, _ = GetRaidRosterInfo(i);
     if tempname==Unit1 then
      Unit1="raid" .. tostring(i);
     end
     if tempname==Unit2 then
      Unit2="raid" .. tostring(i);
     end
    end
    if string.lower(string.sub(Unit1,1,4))~="raid" or string.lower(string.sub(Unit2,1,4))~="raid" then
     return 100000000;
    end
   end
  elseif UnitInParty("player") then
   if (string.lower(string.sub(Unit1,1,5))~="party" and string.lower(Unit1)~="player") or (string.lower(string.sub(Unit2,1,5))~="party" and string.lower(Unit2)~="player") then
    if amGetUnitName("player")==Unit1 then
     Unit1="player";
    end
    if amGetUnitName("player")==Unit2 then
     Unit2="player";
    end
    for i=1, GetNumSubgroupMembers() do
     local tempname=amGetUnitName("party" .. tostring(i))
     if tempname==Unit1 then
      Unit1="party" .. tostring(i);
     end
     if tempname==Unit2 then
      Unit2="party" .. tostring(i);
     end
    end
    if (string.lower(string.sub(Unit1,1,5))~="party" and string.lower(Unit1)~="player") or (string.lower(string.sub(Unit2,1,5))~="party" and string.lower(Unit2)~="player") then
     return 100000000;
    end
   end
  else
   return 100000000;
  end
  --計算距離
  local _,mapheight,mapwidth=GetMapInfo();
  local unit1x, unit1y = GetPlayerMapPosition(Unit1);
  local unit2x, unit2y = GetPlayerMapPosition(Unit2);
  if mapheight and mapheight>0 and mapwidth and mapwidth>0 and unit1x and unit1x>0 and unit1y and unit1y>0 and unit2x and unit2x>0 and unit2y and unit2y>0 then
   local length=math.ceil(math.sqrt(math.pow((unit1x-unit2x)*mapwidth,2)+math.pow((unit1y-unit2y)*mapheight,2)));
   return length;
  else
   return 100000000;
  end
end
end



function amacp_bak(Spell,n,TargetClass,Spells,Unit,times)
	if Spell then
		if not amisr(Spell,"nogoal") then
			return
		end
	end
	
	if not n then
		n=1
	end
	
	if not Unit then
	
		Unit ="player"
	end
	
	if not times then
		times=9999999
	end
	
	local group=""
	local Members,i,k,Target
	local Casting,Target_1,cd,ist
	
	if amisarena() then
		for i=1, 5 do
		Target_1="arena" .. i;
		Target =Target_1 .. "-" .. "target"
		
			if amGetUnitName(Target) or (Unit=="all" and amGetUnitName(Target_1) )then
				if UnitGUID(Target)==UnitGUID(Unit) or Unit=="all" then
						
						
						
							if UnitCanAttack("player",Target_1) then
							
							
							
								if TargetClass then
														
									if amfind(TargetClass,amzy(Target_1)) or amfind(TargetClass,amezy(Target_1)) then
									
									--print(amzy(Target_1),Target_1,1)

										Casting = amac(Target_1)
										cd = amact(Target_1)							
										
										if cd ~=-1 then
										ist = (cd <= times)
										else
										ist = nil
										end
										
										if Casting and ist then
										
										
										
											if Spells then
											
											--print(Casting,0)
												if amfind(Spells,Casting) then
												--print(Target_1,Casting,2)
													if Spell then
														if amisr(Spell,Target_1) then
															return Target_1
														end
													else
														return Target_1
													end
												end
											else
												--print(Target_1,Casting)
												if Spell then
														if amisr(Spell,Target_1) then
															return Target_1
														end
												else
													return Target_1
												end
											
											end
										
										
										end
									end
								
								else
								
														
									if amfind(TargetClass,amzy(Target_1)) or amfind(TargetClass,amezy(Target_1)) then

										Casting = amac(Target_1)
										cd = amact(Target_1)							
										
										if cd ~=-1 then
										ist = (cd <= times)
										else
										ist = nil
										end
										
										if Casting and ist then
										
											if Spells then
												if amfind(Spells,Casting) then
												--print(Target_1,Casting,4)
													if Spell then
														if amisr(Spell,Target_1) then
															return Target_1
														end
													else
														return Target_1
													end
												end
											else
											--print(Target_1,Casting,5)
												if Spell then
														if amisr(Spell,Target_1) then
															return Target_1
														end
												else
													return Target_1
												end
											
											end
										
										
										end
									end
								
								end
							end
							
							
				end
					
			end
		end
	 return
	end
	
	
	
	Target ="targettarget"
	Target_1 ="target"
if amGetUnitName(Target) or (Unit=="all" and amGetUnitName(Target_1) )then
	if UnitGUID(Target)==UnitGUID(Unit) or Unit=="all" then
			
			
			
				if UnitCanAttack("player",Target_1) then
				
				
				
					if TargetClass then
											
						if amfind(TargetClass,amzy(Target_1)) or amfind(TargetClass,amezy(Target_1)) then
						
						--print(amzy(Target_1),Target_1,1)

							Casting = amac(Target_1)
							cd = amact(Target_1)							
							
							if cd ~=-1 then
							ist = (cd <= times)
							else
							ist = nil
							end
							
							if Casting and ist then
							
							
							
								if Spells then
								
								--print(Casting,0)
									if amfind(Spells,Casting) then
									--print(Target_1,Casting,2)
										if Spell then
											if amisr(Spell,Target_1) then
												return Target_1
											end
										else
											return Target_1
										end
									end
								else
									--print(Target_1,Casting)
									if Spell then
											if amisr(Spell,Target_1) then
												return Target_1
											end
									else
										return Target_1
									end
								
								end
							
							
							end
						end
					
					else
					
											
						if amfind(TargetClass,amzy(Target_1)) or amfind(TargetClass,amezy(Target_1)) then

							Casting = amac(Target_1)
							cd = amact(Target_1)							
							
							if cd ~=-1 then
							ist = (cd <= times)
							else
							ist = nil
							end
							
							if Casting and ist then
							
								if Spells then
									if amfind(Spells,Casting) then
									--print(Target_1,Casting,4)
										if Spell then
											if amisr(Spell,Target_1) then
												return Target_1
											end
										else
											return Target_1
										end
									end
								else
								--print(Target_1,Casting,5)
									if Spell then
											if amisr(Spell,Target_1) then
												return Target_1
											end
									else
										return Target_1
									end
								
								end
							
							
							end
						end
					
					end
				end
				
				
	end
		
end
	
	Target ="focustarget"
	Target_1 ="focus"
if amGetUnitName(Target) or (Unit=="all" and amGetUnitName(Target_1) )then
	if UnitGUID(Target)==UnitGUID(Unit) or Unit=="all" then
			
			
			
				if UnitCanAttack("player",Target_1) then
				
				
				
					if TargetClass then
											
						if amfind(TargetClass,amzy(Target_1)) or amfind(TargetClass,amezy(Target_1)) then
						
						--print(amzy(Target_1),Target_1,1)

							Casting = amac(Target_1)
							cd = amact(Target_1)							
							
							if cd ~=-1 then
							ist = (cd <= times)
							else
							ist = nil
							end
							
							if Casting and ist then
							
							
							
								if Spells then
								
								--print(Casting,0)
									if amfind(Spells,Casting) then
									--print(Target_1,Casting,2)
										if Spell then
											if amisr(Spell,Target_1) then
												return Target_1
											end
										else
											return Target_1
										end
									end
								else
									--print(Target_1,Casting)
									if Spell then
											if amisr(Spell,Target_1) then
												return Target_1
											end
									else
										return Target_1
									end
								
								end
							
							
							end
						end
					
					else
					
											
						if amfind(TargetClass,amzy(Target_1)) or amfind(TargetClass,amezy(Target_1)) then

							Casting = amac(Target_1)
							cd = amact(Target_1)							
							
							if cd ~=-1 then
							ist = (cd <= times)
							else
							ist = nil
							end
							
							if Casting and ist then
							
								if Spells then
									if amfind(Spells,Casting) then
									--print(Target_1,Casting,4)
										if Spell then
											if amisr(Spell,Target_1) then
												return Target_1
											end
										else
											return Target_1
										end
									end
								else
								--print(Target_1,Casting,5)
									if Spell then
											if amisr(Spell,Target_1) then
												return Target_1
											end
									else
										return Target_1
									end
								
								end
							
							
							end
						end
					
					end
				end
				
				
	end
		
end
	
	if GetNumGroupMembers()>0 then
		  group="raid"
		 Members =GetNumGroupMembers()
	elseif GetNumGroupMembers()==0 then
		return
	else
		group="party"
		Members =GetNumSubgroupMembers()
	end

	

	for i=1, Members do
		
		unit=group .. tostring(i);
		
		for k=2,n+1 do
		
			Target = unit .. strrep("target",k)
			Target_1=unit .. strrep("target",k-1)
			
			if not amGetUnitName(Target) then
				break;
			end
			
			if UnitGUID(Target)==UnitGUID(Unit) or Unit=="all" then
			
			
	
			
			
			
				if UnitCanAttack("player",Target_1) then
				
				
				
					if TargetClass then
											
						if amfind(TargetClass,amzy(Target_1)) or amfind(TargetClass,amezy(Target_1)) then
						
						--print(amzy(Target_1),Target_1,1)

							Casting = amac(Target_1)
							cd = amact(Target_1)							
							
							if cd ~=-1 then
							ist = (cd <= times)
							else
							ist = nil
							end
							
							if Casting and ist then
							
							
							
								if Spells then
								
								--print(Casting,0)
									if amfind(Spells,Casting) then
									--print(Target_1,Casting,2)
										if Spell then
											if amisr(Spell,Target_1) then
												return Target_1
											end
										else
											return Target_1
										end
									end
								else
									--print(Target_1,Casting)
									if Spell then
											if amisr(Spell,Target_1) then
												return Target_1
											end
									else
										return Target_1
									end
								
								end
							
							
							end
						end
					
					else
					
											
						if amfind(TargetClass,amzy(Target_1)) or amfind(TargetClass,amezy(Target_1)) then

							Casting = amac(Target_1)
							cd = amact(Target_1)							
							
							if cd ~=-1 then
							ist = (cd <= times)
							else
							ist = nil
							end
							
							if Casting and ist then
							
								if Spells then
									if amfind(Spells,Casting) then
									--print(Target_1,Casting,4)
										if Spell then
											if amisr(Spell,Target_1) then
												return Target_1
											end
										else
											return Target_1
										end
									end
								else
								--print(Target_1,Casting,5)
									if Spell then
											if amisr(Spell,Target_1) then
												return Target_1
											end
									else
										return Target_1
									end
								
								end
							
							
							end
						end
					
					end
				end
				break;
				
			end
		
		
		end
	
	
	end
	
	
	return 


end



function amacp(Spell,n,TargetClass,Spells,Unit,times)
	if Spell then
		if not amisr(Spell,"nogoal") then
			return
		end
	end
	
	if not n then
		n=1
	end
	
	if not Unit then
	
		Unit ="player"
	end
	
	if not times then
		times=9999999
	end
	
	local group=""
	local Members,i,k,Target
	local Casting,Target_1,cd,ist
	local isClass=true;
	local IsSpells=true;
	
	local IsPlayer=true;
	
	local T_UnitGUID=UnitGUID(Unit);
	local P_UnitGUID=UnitGUID("player");
	
	
	if amisarena() then
	
		for i=1, 5 do
		
			Target_1="arena" .. i;
			Target =Target_1 .. "-" .. "target"
			
			local IsUnitName_1 = UnitGUID(Target_1);
			local IsUnitName = UnitGUID(Target);
			
			if Unit == "player" then
				IsPlayer = IsUnitName == P_UnitGUID;
			elseif T_UnitGUID then
				IsPlayer = IsUnitName == T_UnitGUID;
			end
		
		
		
			if IsUnitName_1 and IsUnitName and UnitCanAssist("player", Target) and IsPlayer then
				
				
				if TargetClass then
				
					isClass = amfind(TargetClass,amzy(Target_1)) or amfind(TargetClass,amezy(Target_1));
								
				end
				
				
				if isClass then
				
					
					cd,_,Casting = amact(Target_1)							
					
					if cd ~=-1 and cd <= times then
					
						if Spells then
						
							IsSpells = amfind(Spells,Casting);
						end
						
						if IsSpells then
						
							if Spell then
								if amisr(Spell,Target_1) then
									return Target_1
								end
							else
								return Target_1
							end
						end
							
					
					end
					
				
				end
				
				
				
				
						
			end
		
		
	
		end
	
		return;
	
	end
	
	
	
	
	
	Target ="targettarget"
	Target_1 ="target"
			
			local IsUnitName_1 = UnitGUID(Target_1);
			local IsUnitName = UnitGUID(Target);
			
			if Unit == "player" then
				IsPlayer = IsUnitName == P_UnitGUID;
			elseif T_UnitGUID then
				IsPlayer = IsUnitName == T_UnitGUID;
			end
		
		
		
			if IsUnitName_1 and IsUnitName and UnitCanAssist("player", Target) and IsPlayer then
				
				
				if TargetClass then
				
					isClass = amfind(TargetClass,amzy(Target_1)) or amfind(TargetClass,amezy(Target_1));
								
				end
				
				
				if isClass then
				
					
					cd,_,Casting = amact(Target_1)							
					
					if cd ~=-1 and cd <= times then
					
						if Spells then
						
							IsSpells = amfind(Spells,Casting);
						end
						
						if IsSpells then
						
							if Spell then
								if amisr(Spell,Target_1) then
									return Target_1
								end
							else
								return Target_1
							end
						end
							
					
					end
					
				
				end
				
				
				
				
						
			end
		
	
	
	
	Target ="focustarget"
	Target_1 ="focus"
			
			local IsUnitName_1 = UnitGUID(Target_1);
			local IsUnitName = UnitGUID(Target);
			
			if Unit == "player" then
				IsPlayer = IsUnitName == P_UnitGUID;
			elseif T_UnitGUID then
				IsPlayer = IsUnitName == T_UnitGUID;
			end
		
		
		
			if IsUnitName_1 and IsUnitName and UnitCanAssist("player", Target) and IsPlayer then
				
				
				if TargetClass then
				
					isClass = amfind(TargetClass,amzy(Target_1)) or amfind(TargetClass,amezy(Target_1));
								
				end
				
				
				if isClass then
				
					
					cd,_,Casting = amact(Target_1)							
					
					if cd ~=-1 and cd <= times then
					
						if Spells then
						
							IsSpells = amfind(Spells,Casting);
						end
						
						if IsSpells then
						
							if Spell then
								if amisr(Spell,Target_1) then
									return Target_1
								end
							else
								return Target_1
							end
						end
							
					
					end
					
				
				end
				
				
				
				
						
			end
		
	
	
	

	if GetNumGroupMembers()>0 then
		  group="raid"
		 Members =GetNumGroupMembers()
	elseif GetNumGroupMembers()==0 then
		return
	else
		group="party"
		Members =GetNumSubgroupMembers()
	end

	

	for i=1, Members do
		
		unit=group .. tostring(i);
		
		for k=2,n+1 do
		
			Target = unit .. strrep("target",k)
			Target_1=unit .. strrep("target",k-1)
			
									
			local IsUnitName_1 = UnitGUID(Target_1);
			local IsUnitName = UnitGUID(Target);
			
			if not IsUnitName then
				break;
			end
			
			if Unit == "player" then
				IsPlayer = IsUnitName == P_UnitGUID;
			elseif T_UnitGUID then
				IsPlayer = IsUnitName == T_UnitGUID;
			end
		
		
		
			if IsUnitName_1 and IsUnitName and UnitCanAssist("player", Target) and IsPlayer then
				
				
				if TargetClass then
				
					isClass = amfind(TargetClass,amzy(Target_1)) or amfind(TargetClass,amezy(Target_1));
								
				end
				
				
				if isClass then
				
					
					cd,_,Casting = amact(Target_1)							
					
					if cd ~=-1 and cd <= times then
					
						if Spells then
						
							IsSpells = amfind(Spells,Casting);
						end
						
						if IsSpells then
						
							if Spell then
								if amisr(Spell,Target_1) then
									return Target_1
								end
							else
								return Target_1
							end
						end
							
					
					end
					
				
				end
				
				
				
				
						
			end
		
	
	
		
		
		end
	
	
	end
	
	
	return 


end


local function amTalentInfo_5x(Name)
	
	--[[
	local Talents = GetNumTalents();
	for k=1, Talents do
		local Talentname, iconTexture, tier, column, rank, maxRank = GetTalentInfo(k)
		
		if Name == Talentname then
		
			return rank, maxRank
		
		end
	end
--]]
      for Row = 1, 7 do
		for Column = 1, 3 do
			local talentID, name, texture, selected, available = GetTalentInfo(Row,Column,GetActiveSpecGroup())
			if Name == name then
				return selected
			end
		end
	end
	return false

end

local function amTalentInfo_4x(Name)
local Tabs = GetNumTalentTabs();
local i,k
	for i=1, Tabs do
		local Talents = GetNumTalents(i)
		for k=1, Talents do
			local Talentname, iconTexture, tier, column, rank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(i,k)
			
			if Name == Talentname then
			
				return rank, maxRank
			
			end
		end
		
	
	
	end


	return nil;


end

function amTalentInfo(Name)
	if AM_WOW_VER>=50000 then
		return amTalentInfo_5x(Name);
	else
		return amTalentInfo_4x(Name);
	end
end


function amGetWowVer()
	
	return tonumber((select(4, GetBuildInfo())));

end

AM_WOW_VER = amGetWowVer();


	
local function amTalentName_5x() --4.x当前天赋名称
	
	local n = GetPrimaryTalentTree();
	
	if n then
		local _,name =GetSpecializationInfo(n);
		return name;
	end
	
end

local function amTalentName_4x() --4.x当前天赋名称
local s;
local m=0;
for i=1,GetNumTalentTabs() do --GetPrimaryTalentTree() GetNumSpecGroups()
local _,_,_,_,p=GetTalentTabInfo(i); --GetSpecializationInfo()
if p>m then
m=p;
s=i;
end
end
local _,n=GetTalentTabInfo(s);
return n
end

function amTalentName()
	if AM_WOW_VER>=50000 then
		return amTalentName_5x();
	else
		return amTalentName_4x();
	end
end

function amTalentName_3x() --3.x獲得當前天賦名稱

local Tabs = GetNumTalentTabs();
local i,index,num

	for i=1, Tabs do
		local name, iconTexture, pointsSpent, background = GetTalentTabInfo(i)
		
		if num then
			if pointsSpent > num then
				num = pointsSpent
				index = i
			end
		else
		
			num = pointsSpent
			index = i
		end
			
	
	end
	
	local name, iconTexture, pointsSpent, background = GetTalentTabInfo(index)
	
	local _, _, pointsSpent1 = GetTalentTabInfo(1)
	local _, _, pointsSpent2 = GetTalentTabInfo(2)
	local _, _, pointsSpent3 = GetTalentTabInfo(3)
	local _, _, pointsSpent4 = GetTalentTabInfo(4)
	local _, _, pointsSpent5 = GetTalentTabInfo(5)
	
	return name,pointsSpent,pointsSpent1,pointsSpent2,pointsSpent3,pointsSpent4,pointsSpent5
	

end



 function amGetSpellID(spellname) --獲得技能在技能書的ID
	local spellid = nil
	for tab = 1, 4 do
		local _, _, offset, numSpells = GetSpellTabInfo(tab)
		for i = (1+offset), (offset+numSpells) do
			--4.1local spell = GetSpellName(i, BOOKTYPE_SPELL)
			local spell = GetSpellBookItemName(i, BOOKTYPE_SPELL)
			
			if strlower(spell) == strlower(spellname) then
				spellid = i
				break
			end
		end
	end
	return spellid;
end



 function amGCD(spellname) --獲得某職業的公告CD

	local spellid
	
	if spellname then
		spellid = GetSpellInfo(spellname)
	else
		
		if not AM_GCD_SPELLID then
			return 0;
		end
		spellid = AM_GCD_SPELLID
	end
	
	if not spellid then
		return -1
	end
	
	
	local start, dur = GetSpellCooldown(spellid)
	
	
	if start and dur and start>0 and dur>0 then
				 
		 return dur - (GetTime() - start) 
	end
	
	return 0
		 
end

 function amGCDFast(spellname) --獲得某職業的公告CD
	
	
		if spellname then 
		
			return amGCD(spellname);
		else
			return wowam.sys.GCD;
		end
	
		
end




function amRAID_CLASS_COLORS()

for key,value in pairs(RAID_CLASS_COLORS) do
print(key,value)
end

end

function amtonumber(data)
local n;
	if not data then
		return 0;
	else
		n = tonumber(data) 
		if n then
			return n;
		else
			return 0;
		end
	end
end



function amIsActionInRange(Spell)
	local i = amfindbutton(Spell)
	
	if i >0 then
		return IsActionInRange(i)
	
	end
end


function amIsCurrentAction(Spell)
	local i = amfindbutton(Spell)
	
	if i >0 then
		return IsCurrentAction(i)
	
	end
end



function amGetRaidTargetIndex(Unit) 
	local i = GetRaidTargetIndex(Unit)
	if i then
		return i;
	else
		return 0;
	end
end




function amSetRaidTarget(Unit,Index)


--0 - 取消標記 1 - 星星 
--2 - 太陽 3 - 菱形 4 - 三角 5 - 月亮 6 - 方塊 7 - 紅叉 8 - 骷髏 
	if GetNumGroupMembers()>0 or GetNumSubgroupMembers()>0 then
		if IsRaidLeader() or IsPartyLeader() or IsRaidOfficer() then
			if not amGetRaidTargetIndex(Unit) == Index then
			SetRaidTarget(Unit,Index)
			end
			return true;
		end
	end
	
	
	


end

function amArenaDisperse(buffs,index)
--local sysdb = GC_Discipline_priest_db_SysSet
--local buffs = sysdb["群體驅散_EDIT1"]
local p = wowam.sys.spell_ex["暗言術：痛"]
local b = wowam.sys.spell_ex["群體驅散"]
local Unit
local sp
if not index then
	index=7
end

	if IsCurrentSpell(b) or amac("player")== b then
		return true;
	end

	if amisr(b,"nogoal") and (not IsCurrentSpell(b)) then
		Unit ="target"
		if amfind(buffs,ambufflist(Unit)) and amisr(p,Unit) then
			sp = "/stopcasting\n/cast [target=" .. Unit .. "]" .. b
			amrun(sp);
			amSetRaidTarget(Unit,index)
			return true;
		end
		
		Unit ="focus"
		if amfind(buffs,ambufflist(Unit)) and amisr(p,Unit) then
			sp = "/stopcasting\n/cast [target=" .. Unit .. "]" .. b
			amrun(sp);
			amSetRaidTarget(Unit,index)
			return true;
		end
		
		Unit = amarenainf("amisr('" .. p .."',unit) and amfind('" .. buffs .. "',ambufflist(unit))")
		
		
		if Unit then
			sp = "/stopcasting\n/cast [target=" .. Unit .. "]" .. b
			amrun(sp);
			amSetRaidTarget(Unit,index)
			return true;
		end
	end

	


end



function amArrangeBattle(Name,index)

	if ampdb(wowam.sys.spell_ex["逃亡者"])>-1 then
		battleASque=false;
		battleASreq=false;
		return false;
	end

	battleASque=battleASque or false;
	battleASreg=battleASreq or false;
	for i=1, GetMaxBattlefieldID() do
		status, mapName = GetBattlefieldStatus(i);
		
		
		if mapName==Name and status~="none" then
			if status=="queued" or status=="confirm" then
				battleASque=true;
				
				
				if status=="confirm" then
				
				
					--if amArrangeBattle_in_time then
						
					--	if GetTime() - amArrangeBattle_in_time>1 then
					
							amrun("/run AcceptBattlefieldPort(" .. i ..",1)")
							StaticPopup_Hide("CONFIRM_BATTLEFIELD_ENTRY")
							amArrangeBattle_in_time=nil;
					--	end
						
					--else
					--	amArrangeBattle_in_time=GetTime();
					--end
				end
			elseif status=="active" then
				battleAS:RegisterEvent("UPDATE_BATTLEFIELD_STATUS");
				battleASque=true;
			end
		elseif mapName==Name and status=="none" then
			battleASque=false;
			battleASreq=false;
		end
	end
	
	--print(">>",battleASque)
	
	if not battleASque then
		if not battleAS then
			battleAS=CreateFrame("Frame");
			battleAS:SetScript("OnEvent",function(self,event)
				if event=="PVPQUEUE_ANYWHERE_SHOW" then
					
						Wowam_Message(wowam.Colors.YELLOW .. "加入" .. Name .. "隊列!");
						self:UnregisterEvent("PVPQUEUE_ANYWHERE_SHOW");
						JoinBattlefield(0,1);
						
					
				elseif event=="UPDATE_BATTLEFIELD_STATUS" and GetBattlefieldWinner() then
					self:UnregisterEvent("UPDATE_BATTLEFIELD_STATUS");
					LeaveBattlefield();
				end
			end);
			return false;
		end
		if not battleASreq then
			battleASreq=true;
			RequestBattlegroundInstanceInfo(index);
			battleAS:RegisterEvent("PVPQUEUE_ANYWHERE_SHOW");
			return false;
		end
	end
	return false;

end

function amfindSpellId(spell)


	for i=1,500000 do
						
				
		local name = GetSpellInfo(i)
		
		if name ==	spell then
			
			return i;
		end
									
	end


end	

function amlistSpellInfo(spell,index)

local k =1
	if not index then
		index =200000
	end

	for i=1,index do
						
				
		local name = GetSpellInfo(i)
		
		if name ==	spell then
		--Wowam_Message(wowam.Colors.RED .. "(" .. k .. ") " ..  wowam.Colors.YELLOW .. name .. ", " .. wowam.Colors.CYAN .. tostring(i) )
		print(wowam.Colors.RED .. "(" .. k .. ")|r",tostring(i),GetSpellInfo(i))
		k=k+1
		end
									
	end


end							
							


function amCountAttack() --2010-10-28 9:13

	local name = {};
	local Coun=0;
	local unittarget="";
	
	
	for i=1, 5 do
		unit=amGetUnitName("arena" .. i .. "-target");
		if unit then
			
			if name[unit] then
				name[unit] = name[unit] +1
			else
			
				name[unit]=1;
			end
			
			if name[unit] > Coun then
			
				Coun = name[unit];
				unittarget=unit;
			end
			 
					
		end
	end
	
	return Coun,unittarget;
	
	

end		 




function ammpy(times)
	local spell = {};
	
	spell["滅"] = 	GetSpellInfo(32996)
	spell["變形術"] = 	GetSpellInfo(118)
	
	if not times then
		times=1
	end
	
	local UNIT = amacp(spell["滅"],4,"MAGE",spell["變形術"],"player",times ) 
	 
		
			if UNIT then
				amrun("/stopcasting\n/cast [target=" .. UNIT .. "]" .. spell["滅"] )
				return spell["滅"];
			end
		
	 
	
 
end

function amisarena()
local n = IsActiveBattlefieldArena()
return n
end

function aminspell(Spell,Unit,Stop,Time,key)

	if not Time then
		Time=2;
	end
	
	amsv("sv_aminspell_Spell",Spell)
	amsv("sv_aminspell_Unit",Unit)
	amsv("sv_aminspell_Stop",Stop)
	amsv("sv_aminspell_Time",GetTime() + Time)
	amsv("sv_aminspell_key",key)
	
		--if Stop and amac("player") then
		--	amrun("/stopcasting");
		--end
	
end

function amruninspell()


	if amgv("sv_aminspell_Time") and GetTime() >= amgv("sv_aminspell_Time") then
	
		amsv("sv_aminspell_Spell",nil)
		amsv("sv_aminspell_Unit",nil)
		amsv("sv_aminspell_Stop",nil)
		amsv("AOE准备点亮",nil);
		amsv("AOE已经点亮",nil);
		amsv("sv_aminspell_key",nil)
		return 
	end
	
	local Spell = amgv("sv_aminspell_Spell")
	local Unit = amgv("sv_aminspell_Unit")
	
	
	if not Unit or not Spell then
		return;
	end
	
	
	if "macro" == strlower(Unit) or "m" == strlower(Unit) then
		
		if amGCD()<=0  then
			amrun(Spell)
			
			amsv("sv_aminspell_Spell",nil)
			amsv("sv_aminspell_Unit",nil)
			amsv("sv_aminspell_Stop",nil)
			amsv("sv_aminspell_key",nil)
			return Spell
		else
			return false;
		end

	end
	
	
	
	if strlower(Unit) == "aoe" then
		
		if amac("player")== spell then
		
			return true;
		
		end
	
		if amgv("AOE已经点亮") then
				
				if not IsCurrentSpell(Spell) then
				
					amsv("AOE已经点亮",nil);
					amsv("sv_aminspell_Spell",nil)
					amsv("sv_aminspell_Unit",nil)
					amsv("sv_aminspell_Stop",nil)
					amsv("sv_aminspell_key",nil)
					--print("AOE结束");
					return false;
				else
					if amgv("sv_aminspell_key") then
						ammouse(0,0,1);
					end
					return true;
				end
			
			
		end
	
		if amgv("AOE准备点亮") then
			if IsCurrentSpell(Spell) or amac("player")== spell then
				amsv("AOE准备点亮",nil);
				amsv("AOE已经点亮",true);
			
			--print("AOE已经点亮");
			return true;	
			end
			
			
			
			
		end
	
		
		
		if not IsCurrentSpell(Spell) then
			
						
			if amgv("sv_aminspell_Stop") then
				amrun("/stopcasting\n/cast !" .. Spell);
				
				amsv("AOE准备点亮",true)
				--print("AOE准备点亮");
				return Spell;
			end
			
			if  amisr(Spell,"nogoal") then
				amrun("/cast !" .. Spell);
				
				amsv("AOE准备点亮",true)
				--print("AOE准备点亮");
				return Spell;
			end
			
			
			
			
		end
		
		--print("AOE");
		return false;
	
	end
	
	if amisr(Spell,Unit) then
		--amrun(Spell,Unit)
		if amgv("sv_aminspell_Stop") then
			amrun("/stopcasting\n/cast [target=" .. Unit .. "]" .. Spell );
		else
			amrun("/cast [target=" .. Unit .. "]" .. Spell );
		end
		
		
		
		amsv("sv_aminspell_Spell",nil)
		amsv("sv_aminspell_Unit",nil)
		amsv("sv_aminspell_Stop",nil)
		return Spell
	end



end



function aminspell_BAK(Spell,Unit,Stop,Time)

	if not Time then
		Time=2;
	end
	
	amsv("sv_aminspell_Spell",Spell)
	amsv("sv_aminspell_Unit",Unit)
	amsv("sv_aminspell_Stop",Stop)
	amsv("sv_aminspell_Time",GetTime() + Time)
	
	if Stop and amac("player") then
		amrun("/stopcasting");
	end
end

function amruninspell_BAK()


	if amgv("sv_aminspell_Time") and GetTime() >= amgv("sv_aminspell_Time") then
	
		amsv("sv_aminspell_Spell",nil)
		amsv("sv_aminspell_Unit",nil)
		amsv("sv_aminspell_Stop",nil)
		return 
	end
	
	local Spell = amgv("sv_aminspell_Spell")
	local Unit = amgv("sv_aminspell_Unit")
	
	
	if not Unit or not Spell then
		return
	end
	
	if amGCD()<=0 then
		if "Macro" == Unit or "macro" == Unit or "MACRO" == Unit or "M" == Unit then
			amrun(Spell)
			
			amsv("sv_aminspell_Spell",nil)
			amsv("sv_aminspell_Unit",nil)
			amsv("sv_aminspell_Stop",nil)
			return Spell

		end
	end
	
	if amisr(Spell,Unit) then
		--amrun(Spell,Unit)
		if amgv("sv_aminspell_Stop") then
			amrun("/stopcasting\n/cast [target=" .. Unit .. "]" .. Spell );
		else
			amrun("/cast [target=" .. Unit .. "]" .. Spell );
		end
		
		
		
		amsv("sv_aminspell_Spell",nil)
		amsv("sv_aminspell_Unit",nil)
		amsv("sv_aminspell_Stop",nil)
		return Spell
	end



end


function amiif(t,t1,t2)

	if t then
		return t1;
	else
		return t2;
	end

end


function amEraseTable(t) --清除表
	for i in pairs(t) do t[i] = nil end
end


function amequipped(name)
	
	local n=1;
	local n1=23;
	local a, b, c;
	local isname = nil;
	local t = type(name);
	
	if t == "number" or t == "string" then
	
		if t == "number" then
			n=t;
			n1=t;
		end
	
		for i=n , n1 do
			
			
			local mainHandLink = GetInventoryItemLink("player",i)
				if mainHandLink then
					local spell = GetItemInfo(mainHandLink)
			
					if spell == name then
					
						isname =1;
						
						a, b, c = GetInventoryItemCooldown("player", i)
						
						if c ==0 or not a then
							return -1,isname;
						end
						
						n = a+b-GetTime()
		
						if n<0 then
							n=0
						end
						
						--n = format("%.2f",n);
						--n=tonumber(n);
						return n,isname;
					
						
					
					end
				end
	
	
		end
	end

	return -1,isname;
	
end



function amItemCooldown(Item)
	local ItemID;
	if type(Item) == "string" then
	
		ItemID = amPlayerItemId(Item)
		
		if not ItemID then
			return -1;
		end
	else
		ItemID =Item;
	end
		

	local isname = nil;
	if GetItemInfo(ItemID) then
		isname=1;
	else
		return -1,isname;
	end
	
	local Equipped = IsEquippedItem(ItemID)
	
	
	
	local a,b,c = GetItemCooldown(ItemID);
		
		if c ==0 or not a then
			return -1,isname,Equipped,ItemID;
		end
		
		n = a+b-GetTime()
	
		if n<0 then
			n=0
		end
		
		return n,isname,Equipped,ItemID;
		
end




function amSpellCooldown(spell)

	local isname = nil;

	local a,b,c = GetSpellCooldown(spell) 
	
	if a then
		isname=1;
	else
		isname=nil;
		return -1,isname;
	end
	
	if c ==0 or not a then
		return -1,isname;
	end
		
		n = a+b-GetTime()
	
		if n<0 then
			n=0
		end
		
		return n,isname;
end

function amKey(key)

	Wowam_RunCommand(key);
end

function amcd(spell) --技能CD冷卻時間

	local isname,typenumber,SpellLevel = Wowam_GetSpellinf(spell);
	
	if typenumber == -1 then
		return -1,false,typenumber,"無法識別的技能、物品";
	elseif typenumber==4 or typenumber==5 then
		return -1,false,typenumber,"無法獲得技能、物品以外的冷卻時間";
	end
	
	local n,is
	
	if typenumber == 1 then
	
		local spellId = wowam.spell.Property[spell]["spellId"];
		n,is = amSpellCooldown(spellId)
		if is then
				return n,is;
		end
		
	elseif typenumber == 2 or typenumber == 3 then
		
		local ItemID = wowam.spell.Property[spell]["ItemID"];
		n,is = amItemCooldown(ItemID)
		if is then
				return n,is;
		end
		
	end
	
	
	
	return -1,is;
	
	
	
end


function amcs(channel,String,Time)

	local id, ChannelName =GetChannelName(channel)
	
	if not ChannelName then
		print("頻道錯誤！")
		return;
	end
	
	if not String then
		print("日，沒內容哦")
		return;
	end
	
	local s = amToLink(String)
	
	--print("a",s)
	if not s then
	
		return;
	end
	--print("b",s)
	--SendChatMessage(s , "CHANNEL", nil, id)
	
	amps_SCID=id;
	amps_s=s;
	
	amps_Time=Time;
	
	amps_T,amps_F=amps_T or 0,amps_F or CreateFrame("frame")
	
	if amps_X then 
		amps_X=nil 
	else 
		amps_X=function()
			local t=GetTime()
			if t- amps_T > amps_Time then 
				SendChatMessage(amps_s,"channel",nil,amps_SCID)
				amps_T=t 
			end 
		end 
	end amps_F:SetScript("OnUpdate",amps_X)
	
	
	
	
	
end

function amSIlink(Name)

	local itemName, itemLink= GetItemInfo(Name)
	
	--print(11,itemName)
	
	if itemName then
	
		return itemLink;
	end
	
	local itemName= GetSpellLink(Name)
	
	--print(22,itemName)
	
	if itemName then
	
		return itemName;
	end
	
	
	
	
	return Name;

end


function amToLink(String)
	
	String=string.gsub(String,"%[","' .. amSIlink('")
	String=string.gsub(String,"%]","') .. '")
	
	String = "'" .. String .. "'";
	--print(0,String)
	if strfind(String,"'' .. ") ==1 then
	--print(1,String)
		String=string.gsub(String,"'' .. ","",1)
	--	print(2,String)
	end
	
	--print(3,String)
	String=string.reverse(String)
	
	if strfind(String,"'' .. ") ==1 then
	--print(4,String)
		String=string.gsub(String,"'' .. ","",1)
		
	end
	
	String=string.reverse(String)
	
	--print(5,String)
	
	--print(amSIlink(String))
	
	String ="return " .. String
	
	local a =loadstring(String)
	
	local b,c=a();
	
	if b then
		return b;
	else
		print("腳本錯誤",c)
	end
	
		
end

function amGetFollowUnit()

		
	
		return wowam.amisFollowUnit_Event
	
end

function amisFollowUnit_Event(self, event, ...)
 local arg1, arg2 = ...;

	if event=="AUTOFOLLOW_BEGIN" then
	
	wowam.amisFollowUnit_Event=arg1;
	
	elseif event=="AUTOFOLLOW_END" then
	wowam.amisFollowUnit_Event=nil;
	end
		
end


function amPassphrase(text)

	if text then
		wowam_config.Passphrase_text=text;
		wowam_config.Passphrase= true;
	else
	
		wowam_config.Passphrase=false;
		
	
	
	end


end



function th_table_dup(ori_tab) --復制表
    if (type(ori_tab) ~= "table") then
        return nil;
    end
    local new_tab = {};
    for i,v in pairs(ori_tab) do
        local vtyp = type(v);
        if (vtyp == "table") then
            new_tab[i] = th_table_dup(v);
        elseif (vtyp == "thread") then
            -- TODO: dup or just point to?
            new_tab[i] = v;
        elseif (vtyp == "userdata") then
            -- TODO: dup or just point to?
            new_tab[i] = v;
        else
            new_tab[i] = v;
        end
    end
    return new_tab;
end


function th_table_dupA(ori_tab) --復制表
    if (type(ori_tab) ~= "table") then
        return nil;
    end
    local new_tab = {};
    for i,v in pairs(ori_tab) do
        local vtyp = type(v);
        if (vtyp == "table") then
            new_tab[i] = th_table_dup(v);
        elseif (vtyp == "thread") then
            -- TODO: dup or just point to?
            new_tab[i] = v;
        elseif (vtyp == "userdata") then
            -- TODO: dup or just point to?
            new_tab[i] = nil;
        else
            new_tab[i] = v;
        end
    end
    return new_tab;
end



function ammaxtarget(String,StrReturn,group)
	local count =0;
	if not(group == "party" or group=="partypet"  or group=="raid"  or group=="raidpet" or group=="arena"  or group=="arenapet" or group=="FHenemies") then
	DEFAULT_CHAT_FRAME:AddMessage("group 參數不對")
	return false
	end
	if String==nil or StrReturn == nil then
	DEFAULT_CHAT_FRAME:AddMessage("String 或 StrReturn 參數不能為空")
	return false
	end
	local str ='function TEMP_amcount(name,class,race,spell,unit,guid,spellcd) if ' .. String .. ' then return ' .. StrReturn .. '; else return false; end end'
	RunScript(str);
	local name,class,race,spell,unit,unit2,spellcd,guid;
	local Members,minimum,temp_unit ;
	local temp_n =nil;
	if group == "party" or group=="partypet"   then
	Members =GetNumSubgroupMembers()+1 ;
	elseif group=="raid"  or group=="raidpet" then
	Members =GetNumGroupMembers() ;
	elseif group=="arena" then
	Members =5;
	elseif group=="arenapet" then
	Members =5;
	elseif group=="FHenemies" then
	Members =#FHenemiesTable;
	end
	for i=1,Members do
	if i==Members and group == "party" then
	unit="player"
	elseif i==Members and group == "partypet" then
	unit="pet"
	else
	unit=group .. tostring(i);
	end
	if amGetUnitName(unit)then
	 --bufflist = ambufflist(unit);
	 name = amGetUnitName(unit);
	 class = UnitClass(unit);
	 race = UnitRace(unit);
	 spell = amac(unit);
	 spellcd = amact(unit);
	 guid = UnitGUID(unit);
	 --内嵌循环
	if i<Members then
	 for j=i+1,Members do
	  if j==Members and group == "party" then
	   unit2="player"
	  elseif j==Members and group == "partypet" then
	   unit2="pet"
	  else
	   unit2=group .. tostring(j);
	  end
	  if UnitGUID(unit .. "target")==UnitGUID(unit2 .. "target") then
	   break;
	  end
	  if j==Members then
	   minimum = TEMP_amcount(name,class,race,spell,unit,guid,spellcd);
	  end
	 end
			end
			if i==Members then
	 minimum = TEMP_amcount(name,class,race,spell,unit,guid,spellcd);
	end
	 --内嵌循环
	--
	if minimum and minimum~=nil then  
	if temp_n == nil then  
	temp_n =minimum;
	temp_unit = unit;
	elseif minimum > temp_n then
	temp_n =minimum;
	temp_unit = unit;
	end
		count = count +1;
	end 
	--
	end
	end
	-- DEFAULT_CHAT_FRAME:AddMessage(v)
	return count,temp_unit;
end 



function amtestSpell(spell)

	local id = amfindSpellId(spell);
	if id then
	--print("GetSpellCooldown >>",GetSpellCooldown(id))
	--print("GetSpellInfo >>",GetSpellInfo(id))
	--print("IsUsableSpell >>",IsUsableSpell(id))
	--print("SpellHasRange >>",SpellHasRange(id))
	end

end



function amfindbutton(Spell)
	local i;
	local name, rank;
	local gtype, pid;
	local spellId,id;
	
	if type(Spell) == "number" then
		spellId=Spell;
	elseif type(rune) == "string" then

		spellId,id =amPlayerSpellId(Spell)
	end

		if not spellId then
			return 0;
		end

		

			
			for i=1,100 do
						
					gtype, pid = GetActionInfo(i);
					
					if spellId == pid then
						return i;
					end
			
						
			end					
					
	return 0;
end


function amArenaAc(TargetClass,Spells,Unit,times)

	if amisarena() then
	
		local Arena,ArenaTarget,ArenaName,ArenaTargetName,Name;
		local IsamArenaAc = true;
	
		
		if Unit then
			Name = amGetUnitName(Unit);
			if not Name then
				return false;
			end
		end
	
		for i=1, 5 do
		
			Arena = "arena" .. i;
			ArenaTarget =Arena .. "-target";
			
			ArenaName = amGetUnitName(Arena);
			ArenaTargetName = amGetUnitName(ArenaTarget);
			
			if ArenaName and ArenaTargetName then
			
				local AcCd,_,SpellName = amact(Arena);
				local isClass,IsSpells,IsTimes,IsUnit ;
				
				if Unit then
				
					IsUnit = ArenaTargetName == Name;
				
				end
				
				
				if AcCd > 0 and IsUnit then
				
									
					if times then
						if AcCd > times then
						
							IsTimes = false;
						else
							IsTimes = true;
						end
					else
						IsTimes = true;
					end
				
					if TargetClass then
					
						isClass = amfind(TargetClass,amzy(ArenaTarget)) or amfind(TargetClass,amezy(ArenaTarget));
						if not isClass then 
							isClass = false;
						else
							isClass = true;
						end
						
					else
					
						isClass = true;
					end
					
					
					if Spells then
					
						IsSpells = amfind(Spells,SpellName);
						if not IsSpells then 
							IsSpells = false;
						else
							IsSpells = true;
						end
						
					else
					
						IsSpells = true;
						
					end
				
					IsamArenaAc = isClass and IsSpells and IsTimes and IsUnit;
					
					if IsamArenaAc then
						return true,ArenaName,ArenaTargetName;
					end
					
				end
			end
			
		end
	end
	
	return false;
	
end	
	

	
function amGetSpellName(spellId)

	local spellName,spellRank = GetSpellInfo(spellId);
	if not spellRank then
		spellRank="";
	end
	
	if spellRank ~= "" then
		spellName = spellName .. "(" .. spellRank .. ")" ;
	end
	
	return spellName;
end


function amGetShapeshiftId() ---'獲得当前姿態ID
	local a;
	for i=1 , 9 do
		_,name,a = GetShapeshiftFormInfo(i);
		if a then
			return i,name;
		end
	end

	return 0;
end


function amIsGlyphSocketInfo(GlyphName) --判断雕文

	local numGlyphSockets = GetNumGlyphSockets();

	for i = 1, numGlyphSockets do
	 local enabled, glyphType, glyphTooltipIndex, glyphSpellID, icon = GetGlyphSocketInfo(i);
	 if ( enabled and glyphSpellID) then
	  
		local name = GetSpellInfo(glyphSpellID);
		
		if name and GlyphName == name then
			return i;
		end
	  
	 
	 end
	end
end



function amHolyPower(unit)-- 神圣能量
	
	
	
    if unit then
		
        --return UnitPower(unit, SPELL_POWER_HOLY_POWER);
	return UnitPower(unit, 9);
	
    else
		
        --return UnitPower("player", SPELL_POWER_HOLY_POWER);
	return UnitPower("player", 9); 
		
	
    end

end



function amrs()-- 特殊能量
	

	local _, englishClass = UnitClass("player");
	
	
        if englishClass == "PALADIN" then
	
		
              --return UnitPower("player", SPELL_POWER_HOLY_POWER);
	       return UnitPower("player", 9);
	
	
        elseif englishClass == "DRUID" then
	
		
              --return UnitPower("player", SPELL_POWER_ECLIPSE);
	      return UnitPower("player", 8);
		
	
        elseif englishClass == "WARLOCK" then
		
		local tf = GetPrimaryTalentTree();
		
		if tf == 2 then
			--return UnitPower("player", SPELL_POWER_DEMONIC_FURY);
			return UnitPower("player", 15);
		elseif tf == 3 then
			--return UnitPower("player", SPELL_POWER_BURNING_EMBERS);
			return UnitPower("player", 14);
		else
			--return UnitPower("player", SPELL_POWER_SOUL_SHARDS);
			return UnitPower("player", 7);
		end
		
		
		
		
	
	elseif englishClass == "MONK" then
		
		return UnitPower("player", 12);
	
	elseif englishClass == "PRIEST" then
		
		return UnitPower("player", 13);
	end
	
	
	return -1;
	

end
	
	mouseclickbutton1 = CreateFrame("Button","MouseButtonDown" ,UIParent,"SecureActionButtonTemplate")
	mouseclickbutton1:SetAttribute("type","macro")
	mouseclickbutton1:SetAttribute("macrotext","/run CameraOrSelectOrMoveStart()")
	mouseclickbutton2 = CreateFrame("Button","MouseButtonUp" ,UIParent,"SecureActionButtonTemplate")
	mouseclickbutton2:SetAttribute("type","macro")
	mouseclickbutton2:SetAttribute("macrotext","/run CameraOrSelectOrMoveStop()")
	
function ammouse(x,y,b)

	local k = "900" .. string.format("%04d", x) .. string.format("%04d", y) .. string.format("%01d", b) ;
	
	Wowam_Run_Key_Command("4",k)

	if UnitCastingInfo("player")==nil then
		if ammouseLastExecuted~= nil then
			if GetTime()-ammouseLastExecuted>0.75 then
				if not IsMouseButtonDown(1) then
				RunMacroText("/click MouseButtonDown\n/click MouseButtonUp")
				end
			ammouseLastExecuted = GetTime()
			end
		else
			if not IsMouseButtonDown(1) then
			RunMacroText("/click MouseButtonDown\n/click MouseButtonUp")
			end
			ammouseLastExecuted = GetTime()
		end
	end

end




local function MouseDisperse()

	local b = wowam.sys.spell_ex["群體驅散"]
	local Unit ="mouseover"
	local sp
	local buffs = amMouseDisperse_buffs;
	local stop = amMouseDisperse_stop;
	local Delay = amMouseDisperse_Delay;
	
	if not buffs then
		return ;
	end
	
	if amMouseDisperse_DelayTime then
	--print(GetTime() - amMouseDisperse_DelayTime,amMouseDisperse_Delay)
		if GetTime() - amMouseDisperse_DelayTime < amMouseDisperse_Delay then
			return ;
		else
			amMouseDisperse_DelayTime = nil ;
		end
	end
	
	if amMouseDisperse_time then

		if GetTime() - amMouseDisperse_time <0.05 then
			return ;
		else
			amMouseDisperse_time = GetTime();
		end
	else
		amMouseDisperse_time = GetTime();
	end
	
	
	
	if not amGetUnitName(Unit) then
		return true;
	end
	
	if amac("player")==b then
		amMouseDisperse_AC=true;
		amMouseDisperse_DelayTime=nil;
	else
		if amMouseDisperse_AC then
			amMouseDisperse_DelayTime = GetTime();
			amMouseDisperse_AC=nil;
		end
	end
	
	

		if IsCurrentSpell(b) then
			
			if not amMouseDisperse_Insert then
				ammouse(0,0,1);
			end
			return true;
		end

		if amisr(b,"nogoal") and (not IsCurrentSpell(b)) then
	--print("dd>",amfind(buffs,ambufflist(Unit)),amjl(Unit))		
			if amfind(buffs,ambufflist(Unit)) and amjl(Unit)<=30 then
				
				if stop then
					sp = "/cast [target=" .. Unit .. "]!" .. b
				else
					sp = "/stopcasting\n/cast [target=" .. Unit .. "]!" .. b
				end
				
				if amMouseDisperse_Insert then
					aminspell(b,"aoe",1,nil,1)
				else
					amrun(sp);
				end
				return true;
			end
			
		end	

		

end

function amMouseDisperse(buffs,stop,Delay,Insert)
	
	if not Delay then
		Delay=0;
	end
	amMouseDisperse_buffs=buffs;
	amMouseDisperse_stop=stop;
	amMouseDisperse_Delay=Delay;
	amMouseDisperse_Insert = Insert;
	if not buffs and not stop then
		amMouseDisperse_Frame:UnregisterEvent("OnUpdate");
		amMouseDisperse_Frame=nil;
		return true;
	end

	if not amMouseDisperse_Frame then
		amMouseDisperse_Frame = CreateFrame("Frame");
		amMouseDisperse_Frame:SetScript("OnUpdate",MouseDisperse)
	end

	


end

function amOvale(num)
   
	if not Ovale then

		print("|cffff0000Ovale全職業輸出助手插件沒有安裝！")

	else
		
		local spellId = Ovale["frame"]["actions"][num]["spellId"];
		
		if spellId then
			local spellName = GetSpellInfo(spellId);
			
			if not amac() and amisr(spellName,"target") then
				amrun(spellName,"target");
				return true;
			elseif not amac() and amisr(spellName,"nogoal") then 
                                amrun(spellName,"nogoal");
				return true;
			end
			
		else
			--print("|cffff0000Ovale全職業輸出助手插件版本错误！")
			return false;
		end
           return false;
	end
   
    
end

function FHOvale(num,checked)

	if not Ovale then

		print("|cffff0000Ovale全職業輸出助手插件沒有安裝！")

	else
		local spellId = Ovale["frame"]["actions"][num]["spellId"];
		
		if spellId then
			local spellName = GetSpellInfo(spellId);
			
			--if amSpellCooldown(spellId) == 0 and UnitChannelInfo("player")~= GetSpellInfo(spellId) then
                        if amSpellCooldown(spellId) == 0 and (UnitChannelInfo("player")==nil or UnitChannelInfo("player")~= GetSpellInfo(spellId)) and amSpellCooldown(spellId) == 0 and amcd then   
			       if checked == 1 then
			           FaceDirection(GetAnglesBetweenObjects("player","target"));
			       end
				if IsAoEPending() then
                                        local X, Y, Z = ObjectPosition("target");
					CastSpellByName(spellName,"player");
		                      	ClickPosition(X,Y,Z,true); 
			                CancelPendingSpell();
				else
				        CastSpellByName(spellName);
                                 
                                end
                               return true;
                            
			end
			return false;
	        else
		--UseInventoryItem(14);
		return false;
		end

	end
   
    
end

function ampettext()
	
	local str="";
	
	for i=1, NUM_PET_ACTION_SLOTS do
      local name, subtext, texture, isToken, isActive, autoCastAllowed, autoCastEnabled = GetPetActionInfo(i);
      
          
	 str =str .. "(".. i .. ")" ..  name or "--" .. ",".. texture or "--".. ",";
      
    end
	
	amtext=str;
	return str;
	
end	

function amisActivePet(v)-- 宠物状态按钮
	
	for i=1, NUM_PET_ACTION_SLOTS do
      local name, subtext, texture, isToken, isActive, autoCastAllowed, autoCastEnabled = GetPetActionInfo(i);
      
     --if not name then
     -- 	break;
      	
     -- end
	  
	  if name == v then
      	
      	return isActive;
      end
    
      
    end
	
	return false;
	
end

function amautoCastEnabledPet(v)-- 宠物技能是否能激活状态
	
	for i=1, NUM_PET_ACTION_SLOTS do
      local name, subtext, texture, isToken, isActive, autoCastAllowed, autoCastEnabled = GetPetActionInfo(i);
      
    --  if not name then
    --  	break;
      	
    --  end
	  
	  if name == v then
      	
      	return autoCastEnabled;
      end
    
      
    end
	
	return false;
	
end

function amautoCastAllowedet(v)-- 宠物技能是否能激活
	
	for i=1, NUM_PET_ACTION_SLOTS do
      local name, subtext, texture, isToken, isActive, autoCastAllowed, autoCastEnabled = GetPetActionInfo(i);
      
      --if not name then
      --	break;
      	
     -- end
	  
	  if name == v then
      	
      	return autoCastAllowed;
      end
    
      
    end
	
	return false;
	
end

function amIsCurrentMouse(Spell)-- 技能正在执行时按下鼠标左键

	if IsCurrentSpell(Spell) then
		ammouse(0,0,1);
		return true;
	end
	return false;
end

function amSdmRun(name,unit)
	local luaText = nil
	for i,v in pairs(sdm_macros) do
		if v.type=="s" and v.name==name and sdm_UsedByThisChar(v) then
			luaText=v.text;
			break;
		end
	end
	if luaText then
	
						
		luaText=gsub(luaText,"*unit",unit);
				
		local func = assert(loadstring(luaText));
		local v= func();
		
		return v;
		--RunScript(luaText)
	else
		print("找不到["..name.."]脚本.")
	end
	
	return false;
	
end


function amCancelUnitBuff(unit,buff)
	
	if amaura(buff,unit,2,0)>=0 then
		--CancelUnitBuff(unit,buff);
		
		amrun("/cancelaura " .. buff);
		return true;
	end
	return false;
end

function amGetSIlink(Name)

	local itemName, itemLink= GetItemInfo(Name)
	
	--print(11,itemName)
	
	if itemName then
	
		return itemName;
	end
	
	local itemName= GetSpellLink(Name)
	
	--print(22,itemName)
	
	if itemName then
	
		return itemName;
	end
	
	return Name;

end	

function amSetFocus_bak(unit,Name)

	local mouseover = amGetUnitName("mouseover");
	local focus = amGetUnitName("focus");
	
	if not Name or not unit or not mouseover then return false; end;
	
	if mouseover == Name and focus ~= Name then
	
		amrun("/focus mouseover");
		return true;
	end
	
	return false;
	
	

end 

function amIsFollowUnit()
	return amGetFollowUnit() and true;
end


function amFollowUnit(unit)
		
	if not unit then
	
		return false;
	
	end
	
		
	if amGetUnitName(unit) and amGetFollowUnit() ~= amGetUnitName(unit) and amjl(unit)<=25 then
		
		FollowUnit(unit);
		
		return true;
	end
		
	
		return false;
	
end

function amsubgroup(Unit) --獲得指定目標在團隊中的小隊編號

	if Unit == nil then
	Unit = "player"
	end
	local k = GetNumGroupMembers()
					
		for i=1 , k do
			local name, _, subgroup = GetRaidRosterInfo(i);
			if name and subgroup and UnitGUID(Unit) and UnitGUID(name) and UnitGUID(Unit) == UnitGUID(name) then
				return subgroup;
							
			end
		end
	
	
	return 0;
end

function amGetInventoryItemDurability(invSlot)
	
	local L,H = GetInventoryItemDurability(invSlot);
	
	return tonumber(format("%.0f", L/H *100));

end


function amGetMainTank(index)
	
	if not (index and type()=="number") then
		return "";
	end
	
	local k = GetNumGroupMembers();
	
	local MtIndex =0;	
	
	for i=1 , k do
	
		local name, rank, subgroup, level, class, fileName, zone, online, isDead, role, isML = GetRaidRosterInfo(i);
			
		if name and role == "MAINTANK" then
			
			MtIndex = MtIndex +1;
			
			if MtIndex==index then
			
				return name;
			end
			
		end
		
	end
	
	return "";
	

end

function amAutoResume(Type,n,Buff,Spell,Battle)
	
	if Battle and amzd() then
	
	
	elseif not Battle and not amzd() then
	
	
	else
		return false;
	
	end
	

	
	if Type == 0 then
	
		Type = aml("player","%") < n ;
		
	elseif Type == 1 then
	
		Type = amr("player","%") < n ;
		
	elseif Type == 2 then
	
		Type = aml("player","%") < n or amr("player","%") < n ;
	end
	
	
	
	local T = amaura(Buff,"player",2,0)<=0 and Type;

	if T and amisr(Spell,"player") then
	
		amrun(Spell,"player");
		amdelay(Spell,2,"player");
		return true;
		
	end

end

function amStopCasting()

	amrun("/StopCasting");
	return true;
	
end


am_CastSpellFrame = CreateFrame("Frame");
am_CastSpellFrame:RegisterEvent("UNIT_HEAL_PREDICTION"); -- 获得治疗目标
am_CastSpellFrame:RegisterEvent("UNIT_SPELLCAST_SENT"); -- 施放目标技能

am_CastSpellFrame:RegisterEvent("UNIT_SPELLCAST_STOP");
am_CastSpellFrame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED");
am_CastSpellFrame:RegisterEvent("UNIT_SPELLCAST_FAILED");
am_CastSpellFrame:RegisterEvent("UNIT_SPELLCAST_INTERRUPTED");
am_CastSpellFrame:RegisterEvent("UNIT_COMBAT");

function amCastInf(spell,target)
	
	

end


local function DelayTblFinishing_EX()
	
	for k, v in pairs(wowam.DelayTbl) do
		
			if v and not v["DelayTime"] and v["Status"] and v["Status"] == "end" and not v["EndTime"] then
			
				v["Status"]=nil;
			
			end
			
			if v and not v["DelayTime"] and v["Status"] and v["Status"] == "end" and  v["EndTime"] and GetTime() > v["EndTime"] then
			
				v["Status"]=nil;
				v["EndTime"]=nil;
				
			end
			
			
			if v and  v["Status"] and v["Status"] == "star" then
			
				v["Status"]=nil;
			
			end
			
			
			
			
			if v and type(v) == "table" then
			
				for k1, v1 in pairs(v) do
				
					
					if v1 and type(v1) == "table" then
					--print(v1,v1["Status"])
						if v1 and v1["Status"] and v1["Status"] == "star" then
				
							v1["Status"]=nil;
						
						end
						
						
				
				
						if v1 and not v["DelayTime"] and v1["Status"] and v1["Status"] == "end" and not v1["EndTime"] then
							--print("x1",k,k1,GetTime() - v1["EndTime"],v1["EndTime"])
							return k,k1;
						
						end
						
						if v1 and not v["DelayTime"] and v1["Status"] and v1["Status"] == "end" and  v1["EndTime"] and GetTime() > v1["EndTime"] then
							--print("x2",k,k1,GetTime() - v1["EndTime"],v1["EndTime"])
							return k,k1;
							
						end
					
					end					
				
				end
				
			
			end
			
			
			
	end
			
			
		return false;

end

local function  IsTblNumber(tbl)
	
	
	for k, v in pairs(tbl) do
		
		return true;
	end
	
	return false;
end

	
local function DelayTblFinishing()	
	
	while true do
		
			local v1 , v2 = DelayTblFinishing_EX();
			
			if v1 then
				
				wowam.DelayTbl[v1][v2]=nil;
				
				if not IsTblNumber(wowam.DelayTbl[v1]) then
				
					wowam.DelayTbl[v1]=nil;
					--print("del")
				end
				
			
			else
			
				do break end
			end
			
			
		
		end
end

local UNIT_SPELLCAST_SENT_STAR;
am_CastSpellFrame.StarTime=GetTime();

local function am_CastSpellFrame_OnEvent(self, event, ...)
	
	
	
	local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16;

	if tonumber((select(4, GetBuildInfo()))) >= 40200 then	
		
		arg1,arg2 = select(1, ...);
		arg3,arg4,arg5,_,arg6,arg7,arg8,_,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = select(4, ...);
		
	else
	
		arg1,arg2 = select(1, ...);
		arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = select(4, ...);
	
	end
	
			
	if ( event == "UNIT_HEAL_PREDICTION" )  then
		
		
		local GUID = UnitGUID(arg1);
		if GUID then
			
			wowam["CastSpellInf"]["HEAL_PREDICTION"][GUID] ={};
			wowam["CastSpellInf"]["HEAL_PREDICTION"][GUID]["heal"]=UnitGetIncomingHeals(arg1);
			wowam["CastSpellInf"]["HEAL_PREDICTION"][GUID]["name"]=arg1;
		end
		
	elseif  event == "UNIT_SPELLCAST_SENT"  and not UNIT_SPELLCAST_SENT_STAR and UnitIsUnit("player",arg1)  then
		
		
		--print(arg1,arg2,arg3,arg4,arg5,arg6)
		local DelayTbl = wowam.DelayTbl;
		local Spell=arg2;
		if AM_IS_CAST_NAME[arg2] and (GetTime() - AM_IS_CAST_NAME[arg2]["Time"]<0.7) then
			
			--if IsCurrentSpell(AM_IS_CAST_NAME[arg2]["Name"]) then
				Spell=amGetSpellName(AM_IS_CAST_NAME[arg2]["Name"]);
				AM_IS_CAST_NAME={};
			--end
		end
		
		UNIT_SPELLCAST_SENT_STAR = true;
		
		
		local GUID;
		local target=arg3;
		
		if arg3 then
			GUID = UnitGUID(arg3);
			--print("GUID",GUID,arg3)
			
		end
		
		if arg3~="" or not arg3 then
			
			if arg3==amGetUnitName("target") then
			
				GUID = UnitGUID("target");
				target ="target";
			
			elseif arg3==amGetUnitName("focus") then
				GUID = UnitGUID("focus");
				
				target="focus";
				
			elseif arg3==amGetUnitName("mouseover") then
				target="mouseover";
				GUID = UnitGUID("mouseover");
				
			elseif arg3==amGetUnitName("player") then
				target="player";
				GUID = UnitGUID("player");
			end
			
		elseif arg3=="" and not arg5 and not arg6 then
			target="player";
			GUID = UnitGUID("player");
			
		
			
		end
		
		--print("GUIDxx",GUID,target,amGetUnitName("target"))
		
		if DelayTbl[Spell] then
			
			if (GetTime() - DelayTbl[Spell]["Time"]<1) then
				
				if DelayTbl[Spell]["Unit"] == "nogoal" then
					
					if DelayTbl[Spell]["DelayTime"] then
						DelayTbl[Spell]["Status"] = "star";
						
					end
					
				end
			end
		end
		
		
		
		
		if GUID then
		
			local castguid=UnitGUID(arg1);
			local castunit = wowam["CastSpellInf"]["spell"];
			
			if not castunit[castguid] then
			
				castunit[castguid]={};
			end
						
			
			if not castunit[arg4] then
			
				castunit[arg4]={};
			end
			
			
			castunit[arg4]["arg1"]=arg1;
			castunit[arg4]["arg2"]=arg2;
			castunit[arg4]["arg3"]=arg3;
			castunit[arg4]["arg4"]=arg4;
			castunit[arg4]["guid"]=GUID;
			castunit[arg4]["target"]=target;
			
			local tbl = castunit[castguid];
			
			
			
			
			tbl["time"] = GetTime();
			tbl["index"] = arg4;
			tbl["guid"] = GUID;
			tbl["name"] = target;
			tbl["spell"]=Spell;
			
						
			
			
			amCastInf(amGetSIlink(Spell),tbl["name"]);
			
			--[[
			
			if not DelayTbl[Spell] then
			
				DelayTbl[Spell]={};
			
			end
			
			if not DelayTbl[Spell][GUID] then
			
				DelayTbl[Spell][GUID]={};
				
			end
			
			--DelayTbl[arg2][GUID]["StartTime"] = GetTime();
			DelayTbl[Spell][GUID]["Status"] = "star";
			
			--DelayTbl[arg2]["StartTime"] = GetTime();
			DelayTbl[Spell]["Status"] = "star";
			
			print(Spell,"star",GetTime())
			
			--]]
			
			if SuperTreatmentInf and SuperTreatmentInf.CastSpellfinishing then
				SuperTreatmentInf:CastSpellfinishing("star",Spell,target,event);
			end
			
		
		end
		
	elseif UnitIsUnit("player",arg1) and ((event=="UNIT_SPELLCAST_STOP") or (event=="UNIT_SPELLCAST_SUCCEEDED") or (event=="UNIT_SPELLCAST_FAILED") or (event=="UNIT_SPELLCAST_INTERRUPTED")) then
		
		
		
		local DelayTbl = wowam.DelayTbl;
		local Spell = amGetSpellName(arg4);
		local castunit = wowam["CastSpellInf"]["spell"];
		
		if DelayTbl[Spell] then
			
			--if (GetTime() - DelayTbl[Spell]["Time"]<1) then
				
				if DelayTbl[Spell]["Unit"] == "nogoal" then
					
					if DelayTbl[Spell]["DelayTime"] then
						DelayTbl[Spell]["EndTime"] = DelayTbl[Spell]["DelayTime"] + GetTime();
						DelayTbl[Spell]["DelayTime"] = nil;
						DelayTbl[Spell]["Status"] = "end";
						
					end
					
					
				else
					
					if castunit[arg3] then
					
						if castunit[arg3]["arg3"]~="" then
						
						
						if DelayTbl[Spell]["Unit"] and castunit[arg3]["target"] and UnitIsUnit(DelayTbl[Spell]["Unit"],castunit[arg3]["target"]) then
						
							local GUID=castunit[arg3]["guid"];
							
							if GUID and DelayTbl[Spell][GUID] and DelayTbl[Spell][GUID]["DelayTime"] then
								DelayTbl[Spell][GUID]["EndTime"] = DelayTbl[Spell][GUID]["DelayTime"] + GetTime();
						
								DelayTbl[Spell][GUID]["DelayTime"] = nil;
								DelayTbl[Spell][GUID]["Status"] = "end";
								
							end
							
						end
					
					elseif castunit[arg3]["arg3"]=="" then					
						
						if DelayTbl[Spell]["DelayTime"] then
						
							DelayTbl[Spell]["EndTime"] = DelayTbl[Spell]["DelayTime"] + GetTime();
						
							DelayTbl[Spell]["DelayTime"] = nil;
							DelayTbl[Spell]["Status"] = "end";
						
						else
							
							local GUID = DelayTbl[Spell]["Guid"];
							
							if GUID then
								
								if DelayTbl[Spell][GUID] and DelayTbl[Spell][GUID]["DelayTime"] then
									
									DelayTbl[Spell][GUID]["EndTime"] = DelayTbl[Spell][GUID]["DelayTime"] + GetTime();
						
									DelayTbl[Spell][GUID]["DelayTime"] = nil;
									DelayTbl[Spell][GUID]["Status"] = "end";
								
								end
								
							
							end
							
						end
						
					
					end
					
					end
				end
				
			--else
			--	DelayTbl[Spell]=nil;
				
			--end
		
		end
    		
		local castguid=UnitGUID(arg1);
				
		if castguid and castunit[castguid] and SuperTreatmentInf and SuperTreatmentInf.CastSpellfinishing then
			SuperTreatmentInf:CastSpellfinishing("end",Spell,castunit[castguid]["name"],event);
		end
		
	
		castunit[castguid] = {};
				
		UNIT_SPELLCAST_SENT_STAR = false;
		
	end
	

	
	

end

local function am_CastSpellFrame_OnUpdate()
	

	if GetTime() - am_CastSpellFrame.StarTime>0.001 then
	
		am_CastSpellFrame.StarTime = GetTime();
		DelayTblFinishing();
	end
	
end

am_CastSpellFrame:SetScript("OnEvent", am_CastSpellFrame_OnEvent);
am_CastSpellFrame:SetScript("OnUpdate",am_CastSpellFrame_OnUpdate)

function amGetSpellCastTarget(spell)
	
	local castguid=UnitGUID("player");
	
	
	if not wowam["CastSpellInf"]["spell"][castguid] or not  wowam["CastSpellInf"]["spell"][castguid][spell] then
		return "";
	end
	
	local tbl = wowam["CastSpellInf"]["spell"][castguid][spell];
	
	
	if GetTime() - tbl["time"] >30 then
		
		tbl = nil;
		return "";
		
	end
	
	return 	tbl["name"];
	
	

end

local SPELL_ACTIVATION_OVERLAY_GLOW={};
	SPELL_ACTIVATION_OVERLAY_GLOW.SpellName={};
	SPELL_ACTIVATION_OVERLAY_GLOW.SpellId={};

function amSpellActive(value)
	
	if not value then
		return nil;
	end
	
	
	if type(value) == "string" then
		
		local spell,rank = GetSpellInfo(value);
		if spell and SPELL_ACTIVATION_OVERLAY_GLOW.SpellName[spell] and SPELL_ACTIVATION_OVERLAY_GLOW.SpellName[spell][rank] then
			return SPELL_ACTIVATION_OVERLAY_GLOW.SpellName[spell][rank];
		else
			return nil;
		end
		
	elseif type(value) == "number" and SPELL_ACTIVATION_OVERLAY_GLOW.SpellId[value] then
	
		return SPELL_ACTIVATION_OVERLAY_GLOW.SpellId[value];
	
	else
		
		return nil;
		
	end
	
end



function SPELL_ACTIVATION_OVERLAY_GLOW.OnEvent(self, event, ...)
	
	local arg1,arg2 = select(1, ...);
		
	if ( event == "SPELL_ACTIVATION_OVERLAY_GLOW_SHOW" )  then
		
		local spell,rank = GetSpellInfo(arg1);
		if spell then
			rank = rank or "";
			if not SPELL_ACTIVATION_OVERLAY_GLOW.SpellName[spell] then
				SPELL_ACTIVATION_OVERLAY_GLOW.SpellName[spell]={};
			end
			
			SPELL_ACTIVATION_OVERLAY_GLOW.SpellName[spell][rank] = true;
			SPELL_ACTIVATION_OVERLAY_GLOW.SpellId[arg1] = true;
			--print(1,arg1);
		end
		
	elseif ( event == "SPELL_ACTIVATION_OVERLAY_GLOW_HIDE" )  then
		
		local spell,rank = GetSpellInfo(arg1);
		if spell then
			rank = rank or "";
			if not SPELL_ACTIVATION_OVERLAY_GLOW.SpellName[spell] then
				SPELL_ACTIVATION_OVERLAY_GLOW.SpellName[spell]={};
			end
			
			SPELL_ACTIVATION_OVERLAY_GLOW.SpellName[spell][rank] = false;
			SPELL_ACTIVATION_OVERLAY_GLOW.SpellId[arg1] = false;
			--print(1,arg1);
		end
		
	end
	
end


SPELL_ACTIVATION_OVERLAY_GLOW.Frame = CreateFrame("Frame");
SPELL_ACTIVATION_OVERLAY_GLOW.Frame:RegisterEvent("SPELL_ACTIVATION_OVERLAY_GLOW_SHOW");
SPELL_ACTIVATION_OVERLAY_GLOW.Frame:RegisterEvent("SPELL_ACTIVATION_OVERLAY_GLOW_HIDE");
SPELL_ACTIVATION_OVERLAY_GLOW.Frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
SPELL_ACTIVATION_OVERLAY_GLOW.Frame:SetScript("OnEvent", SPELL_ACTIVATION_OVERLAY_GLOW.OnEvent);


function amGetCastInf()
	
	local castguid=UnitGUID("player");
	
	
	if not wowam["CastSpellInf"]["spell"][castguid]  then
		return "";
	end
	
	local tbl = wowam["CastSpellInf"]["spell"][castguid];
	
			
	if tbl["spell"] then
	
		if GetTime() - tbl["time"] >30 then
			
			tbl = {};
			return "";
			
		end
		
		return 	tbl["spell"],tbl["name"], GetTime() - tbl["time"];
	
	end
	
	
	return "";

end


function amIsPlayerCastSpell()
	
	local castguid=UnitGUID("player");
	
	
	if not wowam["CastSpellInf"]["spell"][castguid]  then
		return false;
	end
	
	local tbl = wowam["CastSpellInf"]["spell"][castguid];
	
			
	if tbl["spell"] then
	
		if GetTime() - tbl["time"] >30 then
			
			tbl = {};
			--print("|cffff0000a001")
			return false;
		
		elseif amGCD()<=0 and not amac("player") and not SpellIsTargeting() and GetTime() - tbl["time"] >0.7 then
			
			tbl = {};
			--print("|cffff0000a004")
			return false;
			
		else		
			--print("|cffff0000a002")
			return 	true;
			
		end
		
		
	
	end
	
	
	return false;

end

function amUnitGetIncomingHeals(unit)
	
	local GUID = UnitGUID(unit);
	
	if GUID then
	
		local Health = UnitHealth(unit);
		local HealthMax = UnitHealthMax(unit);
		--UnitIsPlayer
		local HEAL_PREDICTION = UnitGetIncomingHeals(unit);
		local Player_HEAL_PREDICTION = UnitGetIncomingHeals(unit,"player");
		local HealthExcess	=  Health + HEAL_PREDICTION -HealthMax;
		
		
		return HEAL_PREDICTION,HealthExcess,Player_HEAL_PREDICTION;
		
	end
	
	return -1,-1,-1;
	

end

function amauraex(Spell,Unit,Nameid,BuffType,iconName)
		
	local n,rank,count,debuffType,icon,unitCaster,duration,expirationTime,isStealable=	amaura(Spell,Unit,Nameid,BuffType,iconName);
	
	return n,rank or -1,count or -1,debuffType or "",icon or "",unitCaster or "",duration or -1,expirationTime or -1,isStealable or false;
end

function amaura(Spell,Unit,Nameid,BuffType,iconName)


	if not Nameid  then
		Nameid=0;
	end
	
	if not BuffType  then
		BuffType=0;
	end
	
	if not Unit then
		Unit="player";
	end

	if not Spell  then
		return -4;
	end
	
	--if type(Spell) ~= "string" or type(Unit) ~= "string" or type(Nameid) ~= "number" then
	if type(Nameid) ~= "number" then
		return -2;
	end
	
	if not amGetUnitName(Unit) then
		return -3;
	end
	
	
	local buff;
	local i = 1;
	local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable ;
	local UnitBuffId, UnitDebuffId;
	
	if BuffType==1 or BuffType == 0 then
		
		local IsBuff;
		
		while true do
		
			name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable,shouldConsolidate, spellId  = UnitBuff(Unit, i)

			if not name then
			  do break end
			end
			
			if Nameid == 0 and unitCaster == "player" and (Spell == name or Spell == spellId) then
				
				IsBuff=true;
				
			elseif Nameid == 1 and unitCaster ~= "player"  and (Spell == name or Spell == spellId) then
				
				IsBuff=true;
				
			elseif Nameid == 2  and (Spell == name or Spell == spellId)  then
				
				IsBuff=true;
				
			end
			
			
			
			if IsBuff and iconName and icon then
			
				local ls_icon = { strsplit("\\",icon) }
				if ls_icon[3] ~= iconName then
					IsBuff = false;

				end
			
			end
			
			if IsBuff then
				
				UnitBuffId = i;
			  do break end
			end
			
			i = i + 1
	    end
		
		
	   
	    if BuffType==1 or BuffType == 0 then
		
			if IsBuff then
				
				local n = expirationTime - GetTime()
				if n < 0 then
					n= 0
				end
				n = format("%.1f",n);
				n=tonumber(n);
				
				return  n,rank,count,debuffType,icon,unitCaster,duration,expirationTime,isStealable,spellId;
			
			
				
			end
	   
	    end
	   
	end
	 
	
	
	
	if BuffType==2 or BuffType == 0 then
		
		local IsBuff;
		i=1;
		
		while true do
		
			name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable,shouldConsolidate, spellId  = UnitDebuff(Unit, i)
			
			if not name then
			  do break end
			end
			
			if Nameid == 0 and unitCaster == "player" and (Spell == name or Spell == spellId) then
				
				IsBuff=true;
				
			elseif Nameid == 1 and unitCaster ~= "player"  and (Spell == name or Spell == spellId)  then
				
				IsBuff=true;
				
			elseif Nameid == 2  and (Spell == name or Spell == spellId)  then
				
				IsBuff=true;
				
			end
			
			
			
			if IsBuff and iconName and icon then
			
				local ls_icon = { strsplit("\\",icon) }
				if ls_icon[3] ~= iconName then
					IsBuff = false;

				end
			
			end
			
			
			if IsBuff then
				
				UnitDebuffId = i;
			  do break end
			end
			
			i = i + 1
	    end
	   
	    if BuffType==2 or BuffType == 0 then
		
			if IsBuff then
				
				local n = expirationTime - GetTime()
				if n < 0 then
					n= 0
				end
				n = format("%.1f",n);
				n=tonumber(n);
				
				return  n,rank,count,debuffType,icon,unitCaster,duration,expirationTime,isStealable,spellId;
			
							
			end
	   
	    end
	   
	end
	
	
	return -1;
	 
end
	


function amUnitClassification(unit,classification)
	
	if unit and classification then
	
		return UnitClassification(unit) == classification;
	
	else
		
		return false;
		
		 
	end
	
	
end	

if not amGetDkInfectionTargetInf then
	function amGetDkInfectionTargetInf()
		print("|cffff0000amGetDkInfectionTargetInf |r死亡骑士专用函数，其他职业不能使用。")
	end

end

function amGetDkPetCd()

	local haveTotem, name, startTime, duration, icon = GetTotemInfo(1);
	
	if not haveTotem then
		return -1;
	end
	
	
	local cd = duration - (GetTime()-startTime) ;
	
	if cd <0 then
	
		--cd=0;
		
	end
	
	return cd;
	


end

function amGetTemporaryPetInf()

	local cd = GetPetTimeRemaining();
	
	if not cd then
		return -1,"";
	end
	
	cd = cd/1000;
	
	if cd > 1000000 then
		return -1,"";
	end
	
	
	return cd , amGetUnitName("pet") or "";
	
end
	
	
local amUnitAuraGameTooltip;

function amUnitAuraFindText(unit,BuffName,index,FindText,Type)
	
	if unit and BuffName and index and FindText then
	
		local text = amUnitAuraText(unit,BuffName,index,Type);
		
		return text and amfind(text,FindText,-1) and true;
		
	end
	
	return false;
			
end

function amUnitAuraText(unit,BuffName,index,Type)	
	
	if not index then
		
		index = 2;
		
	end
	
	if (not Type)  or (Type and Type == "buff") then
		for i=1, MAX_TARGET_BUFFS do
		
		  local name = UnitBuff(unit, i)
		 
		  if (not name) then break end
		  
		  if  (name == BuffName) then
		  
		  
			amUnitAuraGameTooltip = CreateFrame("GameTooltip", "amUnitAuraNumberGameTooltipFrame" .. "Tooltip", nil, "GameTooltipTemplate")
			amUnitAuraGameTooltip:SetOwner(WorldFrame, "ANCHOR_NONE")
		
		  
			 amUnitAuraGameTooltip:ClearLines()  
			 amUnitAuraGameTooltip:SetUnitBuff(unit, i) 
			
			local text = _G[amUnitAuraGameTooltip:GetName() .. "TextLeft" .. index]:GetText();
			
			
			return text or "";
			
			
			
		  end
		  
		 
		end
	end
	
	if (not Type)  or (Type and Type == "debuff") then
	
		for i=1, MAX_TARGET_BUFFS do
		
		  local name = UnitDebuff(unit, i)
		 
		  if (not name) then break end
		  
		  if  (name == BuffName) then
		  
		  
			amUnitAuraGameTooltip = CreateFrame("GameTooltip", "amUnitAuraNumberGameTooltipFrame" .. "Tooltip", nil, "GameTooltipTemplate")
			amUnitAuraGameTooltip:SetOwner(WorldFrame, "ANCHOR_NONE")
		
		  
			 amUnitAuraGameTooltip:ClearLines()  
			 amUnitAuraGameTooltip:SetUnitDebuff(unit, i) 
			
			local text = _G[amUnitAuraGameTooltip:GetName() .. "TextLeft" .. index]:GetText();
			
			
			return text or "";
			
			
			
		  end
		  
		 
		end
	end
	
	
   return "";
	
end
	
function amUnitAuraNumber(unit,BuffName,index,FormatText,Type)	
	
	
	if not index then
		
		index = 2;
		
	end
	
	
	local text = amUnitAuraText(unit,BuffName,index,Type);
	
	local v={};
	local i = 1;
	if text then
		
		if not FormatText or FormatText == "" then
			
			FormatText = "%d+";
					
		end
		
		for k, val in string.gmatch(text, FormatText) do
			v[i]=tonumber(k);
					
			i=i+1;
		end
		
				
	end
	
   
   return v[1] or -1,v[2] or -1,v[3] or -1,v[4] or -1,v[5] or -1,v[6] or -1,v[7] or -1,v[8] or -1;
	
end

function amminimumFast(String,StrReturn,group) 
	if not(group == "party" or group=="partypet"  or group=="raid"  or group=="raidpet" or group=="arena"   or group=="arenapet" or group=="FHenemies") then
	print("|cffff0000 group 参数不对")
	return false
	end

	if String==nil or StrReturn == nil then

	  print("|cffff0000 String 或 StrReturn 参数不能为空")
	  return false
	end

	local str ='function TEMP_amminimum(name,class,race,spell,unit,guid,spellcd) if ' .. String .. ' then return ' .. StrReturn .. '; else return false; end end'

	if wowam.player.Custom.Variable["amminimumFast_str"] then
	  
	  if wowam.player.Custom.Variable["amminimumFast_str"] ~= str then
	   RunScript(str);
	  end
	else

	  RunScript(str);
	  wowam.player.Custom.Variable["amminimumFast_str"] = str;
	end


	RunScript(str);

	local unit;

	local Members ,minimum,temp_unit ;
	local temp_n =nil;

	if group == "party" or group=="partypet"   then
	  Members =GetNumSubgroupMembers()+1 ;
	elseif group=="raid"  or group=="raidpet" then
	  Members =GetNumGroupMembers() ;
	elseif group=="arena" then
	  Members =5;
	elseif group=="arenapet" then
	  Members =5;
        elseif group=="FHenemies" then
	  Members =#FHenemiesTable;
	end
	for i=1, Members do
	  if i==Members and group == "party" then
	  unit="player"
	  elseif i==Members and group == "partypet" then
	  unit="pet"
	  else
	  unit=group .. tostring(i);
	  end
	  
	  if amGetUnitName(unit)then
			
	   minimum = TEMP_amminimum(unit);
	   
	   if minimum then
		
		if temp_n == nil then
		 
		 temp_n =minimum;
		 temp_unit = unit;
		elseif minimum < temp_n then
		 temp_n =minimum;
		 temp_unit = unit;
		end
	   end 
		 
	  end
	  
	  
	  
	end

	if temp_unit then

	  wowam.player.Custom.Variable["amminimumFast_unit"] = temp_unit;
		  
	  return temp_unit;
	end

	return false
end

function amRecalledTotem()

	
	local playerClass, englishClass = UnitClass("player");
	
	for i=1, 4 do 
			
		if amtotemtype(i) then
		
			local spell = GetSpellInfo(amSpellInf[englishClass]["SpellIds"]["图腾召回"]);
			
			amrun("图腾召回");
			return true;
		end

	end
	
	return false;

end

function amDestroyTotem(slotId)
	
	if slotId and slotId ~=0 then
	
		if amtotemtype(slotId) then
			
			DestroyTotem(slotId);
		
		end

	else
	
		for i=1, 4 do 
			
			if amtotemtype(i) then
			
				DestroyTotem(i);
			
			end

		end
	
	
	end
	

end

function amSetFocus(unit)

		
	if UnitGUID(unit) then
	
		if UnitGUID("focus") ~= UnitGUID(unit) then
		
			amrun("/focus " .. unit);
			return true;
		end
	
	end
	
	
	return false;
	
	

end

amInternalCDTbl={};
function amInternalCD(name)

	if amInternalCDTbl[name] then
	
		if amInternalCDTbl[name]["time"] then
			
			local Cycle = amInternalCDTbl[name]["Cycle"];
			local cd = Cycle - (GetTime() - amInternalCDTbl[name]["time"]);
			
			if cd<=0 then
				
				cd =0;
				
			end
			
			return cd;
			
		else
		
			return 0;
		
		end
		
		
	end
	
	return 0;

end

function amComparisonUnit(unit,target,unit1)
	
	local u =amGetUnitName(unit);
	local u1 =amGetUnitName(unit1);
	
		
	if not u or not u1 then
	
		return false;
		
	end
	
	if target then
		u = u .. "-" .. target;
	end
	
	if not amGetUnitName(u) then
	
		return false;
		
	end
	
	
	
	
	if u == u1 then
		
		return true;
	
	else
		
		return false;
		
	end
	
	
	
end

function amUnitThreat(unit)
	
	local _,_,threatpct = UnitDetailedThreatSituation("player", unit);
	
	threatpct = threatpct or 0;
	
	return tonumber(format("%.1f",threatpct)) ;


end


function amGetSpellInfo(name,id)
	
	local spellId
	local name, rank, icon, cost, isFunnel, powerType, castTime, minRange, maxRange;
	
	if id and id ~= "" and type(spell) == "number" then
	
		spellId = tonumber(id);
		
	else
	
		spellId = name;
	
	end
	
	if not spellId then
		return name or "", rank or "", icon or "", cost or -1, isFunnel or false, powerType or -9, castTime or -1, minRange or -1, maxRange or -1;
	end
	
	
	
	name, rank, icon, cost, isFunnel, powerType, castTime, minRange, maxRange = GetSpellInfo(spellId);

	return name or "", rank or "", icon or "", cost or -1, isFunnel or false, powerType or -9, castTime or -1, minRange or -1, maxRange or -1;
	
	
end

local HEDD_tbl={};
HEDD_tbl.spell={};
HEDD_tbl.castspell=nil;

HEDD_tbl.UpdateBar = function(spell,cd)
		
	if HEDD_tbl.spell[spell] then
		HEDD_tbl.castspell = amGetSpellName(HEDD_tbl.spell[spell]);
	end
	
	return HEDD_tbl.UpdateBar_old(spell, cd);
end


HEDD_tbl.AddSpell = function(spell,ids,noupdate,proc)
	
	HEDD_tbl.spell[spell]=ids[1];	
	return HEDD_tbl.AddSpell_old(spell,ids,noupdate,proc);	
end

function amGetDruidMushrooms(index)
	
	if index then
	
		local haveTotem, name, startTime, duration, icon = GetTotemInfo(index);
		
		if not haveTotem then
			return -1;
		end
		
		
		local cd = duration - (GetTime()-startTime) ;
		
		if cd <0 then
		
			cd=0;
			
		end
		
		return cd;
	
	else
		
		local v1,v;
		
		for i=1, 4 do
		
			local haveTotem, name, startTime, duration, icon = GetTotemInfo(i);
			
			if haveTotem then
			
			
				local v = duration - (GetTime()-startTime) ;
				
				if v <0 then
				
					v=0;
					
				end
				
			
						
				if not v1 then
					v1 = v;
				
				elseif v < v1 then
					
					v1 = v;
					
				end
			
			end
			
		end
		
		return v1 or -1;
	
	end
	


end


function amHedd()
	
	if not HEDD_lib then
		print("请安装或更新 HEDD 插件!");
	end
	
	if not HEDD_tbl.UpdateBar_old and HEDD_lib.UpdateBar then
		HEDD_tbl.UpdateBar_old = HEDD_lib.UpdateBar;
		HEDD_lib.UpdateBar =HEDD_tbl.UpdateBar;
	end
	
	if not HEDD_tbl.AddSpell_old and HEDD_lib.AddSpell then
		HEDD_tbl.AddSpell_old = HEDD_lib.AddSpell;
		HEDD_lib.AddSpell = HEDD_tbl.AddSpell;
	end

	if not HEDD_tbl.isload then
	
		local class = select(2,UnitClass("player"));
		local talenttree = GetSpecialization() or 4
		
		if HEDD_lib.classes[class] and HEDD_lib.classes[class][talenttree] then
			HEDD_lib.classes[class][talenttree]()
				
		end
		
		if HEDD_lib.classevents[class] then HEDD_lib.classevents[class]() end
		
		HEDD_tbl.isload=true;
	end
	
	if not HEDD_tbl.castspell or HEDD_tbl.castspell == "" then return false; end;
	
	if amisr(HEDD_tbl.castspell,"target") then
	
		amrun(HEDD_tbl.castspell,"target");
		return true;
	end
	
	return false;
	
end


function amSkeenCore3()

	if SkeenCore3Active and SkeenCore3Active.ActiveModule and SkeenCore3Active.ActiveModule.Rotation then
	
		local spells = SkeenCore3Active.ActiveModule:Rotation();
		
		if spells and spells.current then
		
			local spell = amGetSpellName(spells.current);
			
			if spell then
				
				
				if amisr(spell,"target") then
		
					amrun(spell,"target");
					return true;
					
				end
				
			end
			
		end
		
	else
		
		print("请安装或更新 SkeenCore3 插件!");
		
	end
		
		
	
	return false;


end



function pettest()
	--local i = 1;
	--while true do
	local spellName, spellSubName;
	
	for i=1 , 23 do
		local skillType, spellId = GetSpellBookItemInfo(i,"pet");
		local autocastable,autostate GetSpellAutocast(i,"pet");
		if spellId then
		spellName, spellSubName =GetSpellInfo(spellId);
		else
		spellName, spellSubName = "","";
		end
		
		print(i,GetSpellBookItemName(i,"pet"),spellName,skillType,autocastable,autostate);
		
		--print(i,skillType, spellId)
		if spellId then
			
			--local spellName, spellSubName =GetSpellInfo(spellId);
			
			--print(i,GetSpellInfo(spellId))
			
		else
			
			--return;
		
		end
		
		--i = i + 1 ;
		
	end
		
end

	local amCombustionHelper_PlaySoundFile_old;
	local amCombustionHelper_v = GetTime();
	local CombustionHelperSoundFile1 = strlower("Interface\\Quiet.ogg");
	local CombustionHelperSoundFile2 = strlower("Interface\\AddOns\\CombustionHelper\\Sound\\Volcano.ogg");
	
function amCombustionHelper_PlaySoundFile(soundFile, soundChannel)
	
	amCombustionHelper_PlaySoundFile_old(soundFile, soundChannel);
	
	if strlower(soundFile) == CombustionHelperSoundFile1 or strlower(soundFile) ==CombustionHelperSoundFile2 then
		
		amCombustionHelper_v = GetTime();
		
			
	end
	
	
end


function amCombustionHelper()

	if not CombustionHelper then
	
		print("请安装火法天赋燃烧助手CombustionHelper插件！");
		return false;
	
	end
	
	if not combusettingstable["thresholdalert"] then
	
		combusettingstable["thresholdalert"] = true;
		
		print("火法天赋燃烧助手,【音频警告】 开启");
		
		
	end
	
	
	if not combusettingstable["combureportthreshold"] then
	
		
		
		combusettingstable["combureportthreshold"] = true;
		
		print("火法天赋燃烧助手,【阈值】 开启");
		
	end
	
	
	if not amCombustionHelper_PlaySoundFile_old then
		amCombustionHelper_PlaySoundFile_old = PlaySoundFile;
		PlaySoundFile = amCombustionHelper_PlaySoundFile;
	end
	
	if amCombustionHelper_v then
		
		if GetTime() - amCombustionHelper_v <0.2 then
		
			return true;
		end
		
	end
	
	return false;

end

function IsCritTextFrame()
	if amCritTextFrameLabel then
		return true;
	end
	if StatusTextFrameLabel and not amCritTextFrameLabel then
		amCritTextFrameLabel = StatusTextFrameLabel;
		return true;
	else
		return false;
	end
 end

function amGetCombustionHelperInf()

	if not CombustionHelper then
	
		print("请安装火法天赋燃烧助手CombustionHelper插件！");
		return false;
	
	end


	local LB,LBTime,Ignite,IgniteTime,Pyro,PyroTime,CritTime;
	local f = "%d+.%d+";
	--第一行

	local text = LBLabel:GetText() or "";

		for k, val in string.gmatch(text, f) do
			LB=tonumber(k);
		
		end
		
	local text = LBTextFrameLabel:GetText() or "";

		for k, val in string.gmatch(text, f) do
			LBTime=tonumber(k);
		
		end
		
	--第2行
	local text = IgniteLabel:GetText() or "";

		for k, val in string.gmatch(text, f) do
			Ignite=tonumber(k);
		
		end

	local text = IgnTextFrameLabel:GetText() or "";

		for k, val in string.gmatch(text, f) do
			IgniteTime=tonumber(k);
		
		end
		
		
	--第3行
	local text = PyroLabel:GetText() or "";

		for k, val in string.gmatch(text, f) do
			Pyro=tonumber(k);
		
		end

	local text = PyroTextFrameLabel:GetText() or "";

		for k, val in string.gmatch(text, f) do
			PyroTime=tonumber(k);
		
		end
		
		
	---临界炽焰	
	if IsCritTextFrame and IsCritTextFrame() then
		local text = amCritTextFrameLabel:GetText() or "";
	
		for k, val in string.gmatch(text, f) do
			CritTime=tonumber(k);
		
		end	
	end

	return LB or 0,LBTime or 0,Ignite or 0,IgniteTime or 0,Pyro or 0,PyroTime or 0,CritTime or 0;

end

amGlowBoxWidget={};

--MM=CreateFrame("Frame", nil, UIParent, "GlowBoxTemplate");

function amCreateGlowBoxWidget(Id,f,title,text,x,y,Width,Height)
	-- Only make if needed.
	Width = Width or 275;
	Height = Height or 50;
	x = x or 0;
	y = y or 0;
	
	title = title or "";
	text = text or "";
	local parent = amGlowBoxWidget;
	
	if(not parent.GlowBox) then
		-- Sort out the glowbox.
		parent.GlowBox = CreateFrame("Frame", nil, SuperTreatmentFrame, "GlowBoxTemplate");
	end
		
		parent.GlowBox:SetToplevel(true)
		parent.GlowBox:SetFrameStrata("TOOLTIP")
		parent.GlowBox:SetClampedToScreen(true)
	
		parent.GlowBox:SetPoint("BOTTOMRIGHT", f, "TOPRIGHT", 0+x, 25+y);
		parent.GlowBox:SetWidth(Width);
		parent.GlowBox:SetHeight(Height);
		
	if(not parent.GlowBox.Arrow) then
		
		parent.GlowBox.Arrow = CreateFrame("Frame", nil, parent.GlowBox, "GlowBoxArrowTemplate");
	end
		
		parent.GlowBox.Arrow:SetPoint("TOPRIGHT", parent.GlowBox, "BOTTOMRIGHT");
		-- Glowbox titles.
	
	if(not parent.GlowBox.Title) then
		parent.GlowBox.Title = parent.GlowBox:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		
	end
	
		
		parent.GlowBox.Title:SetText(title);
		parent.GlowBox.Title:SetPoint("TOPLEFT", parent.GlowBox, "TOPLEFT", 10, -5);
		parent.GlowBox.Title:SetPoint("TOPRIGHT", parent.GlowBox, "TOPRIGHT", -10, -5);
		parent.GlowBox.Title:SetJustifyH("CENTER");
		parent.GlowBox.Title:SetJustifyV("TOP");
		-- And now text.
		
	if(not parent.GlowBox.Text) then
		parent.GlowBox.Text = parent.GlowBox:CreateFontString(nil, "ARTWORK", "GameFontNormal");
	end
	
		
		parent.GlowBox.Text:SetText(text);
		parent.GlowBox.Text:SetPoint("TOPLEFT", parent.GlowBox, "TOPLEFT", 10, -20);
		parent.GlowBox.Text:SetPoint("BOTTOMRIGHT", parent.GlowBox, "BOTTOMRIGHT", -10, 5);
		parent.GlowBox.Text:SetJustifyH("LEFT");
		parent.GlowBox.Text:SetJustifyV("TOP");
		parent.GlowBox.Text:SetTextColor(1, 1, 1);
		
	if(not parent.GlowBox.close) then
		parent.GlowBox.close = CreateFrame('Button', nil, parent.GlowBox, 'UIPanelCloseButton')
	end	
		
		parent.GlowBox.close:SetPoint("TOPLEFT", parent.GlowBox, "TOPRIGHT", -26, 6);
		--parent.GlowBox.close:SetPoint("BOTTOMRIGHT", parent.GlowBox, "BOTTOMRIGHT", -10, 5);
		
		-- Make the okay function on the parent reload the UI.
		--parent.okay = function()
			-- Reload.
		--	ReloadUI();
		--end
	--end
	-- Show the glowbox.
	
	f.infid = Id;
	parent.Id=Id;
	parent.GlowBox:Show();
end


function amArenaTalent(unit)
			
	if not Gladius then
		print("|cffff0000请安装Gladius插件！");
		return "";
	end
	local gs = Gladius;
	if gs.buttons then
	
		local GUID = UnitGUID(unit);
		
		for i=1, 5 do
			
			local t = "arena"..i;
			local tg =UnitGUID(t);
			if tg and tg == GUID then
				
				if gs.buttons[t] and gs.buttons[t].spec then
					return gs.buttons[t].spec;
				end
			
			end
			
		end
	
	end
	
	return "";
	

end


--[[
local ArenaTalentFrame = CreateFrame("Frame");
ArenaTalentFrame.UnitInf={};
ArenaTalentFrame:RegisterEvent("ARENA_PREP_OPPONENT_SPECIALIZATIONS");
ArenaTalentFrame:RegisterEvent("UNIT_NAME_UPDATE")
ArenaTalentFrame:RegisterEvent("ARENA_OPPONENT_UPDATE")	

ArenaTalentFrame:RegisterEvent("ARENA_PREP_OPPONENT_SPECIALIZATIONS")

ArenaTalentFrame:RegisterEvent("UNIT_HEALTH")	
ArenaTalentFrame:RegisterEvent("UNIT_MAXHEALTH", "UNIT_HEALTH")

-- spec detection
ArenaTalentFrame:RegisterEvent("UNIT_AURA")	
ArenaTalentFrame:RegisterEvent("UNIT_SPELLCAST_START")

function amArenaTalent(unit)

	local GUID = UnitGUID(unit);
	
	if GUID and ArenaTalentFrame.UnitInf[GUID] then
	
		return ArenaTalentFrame.UnitInf[GUID]["Talent"];
	
	else
	
		return "";
	end

end


local function ArenaTalentFrame_OnEvent(self, event, ...)
	
	
	--if event == "ARENA_PREP_OPPONENT_SPECIALIZATIONS" then
		
		local numOpps = GetNumArenaOpponentSpecs();
	
		for i=1, numOpps do
		
			if (i <= numOpps) then
				
				local specID = GetArenaOpponentSpec(i);
				local GUID = UnitGUID("arena" .. i);
				
				if (specID > 0 and GUID) then
					local _, spec, _, specIcon, _, _, class = GetSpecializationInfoByID(specID);
					
					ArenaTalentFrame.UnitInf[GUID]={};
					ArenaTalentFrame.UnitInf[GUID]["Talent"]=spec;
					--ArenaTalentFrame.UnitInf[GUID]["Class"]=class;
					--ArenaTalentFrame.UnitInf[GUID]["Unit"]="arena" .. i;
					
					print("魔兽助手: "..spec.." "..class );
				end
				
			end	
		end
	
	--end
	
end
ArenaTalentFrame:SetScript("OnEvent", ArenaTalentFrame_OnEvent);
--]]

function amPlaySpellText(spell,index)	
	
	if not spell then
		
		return "";
		
	end
	
	if not index then
		
		index = 5;
		
	end
	
	local spellid ;
	
	if type(spell) == "number" then
		spellid = spell;
	else
		spellid = amPlayerSpellId(spell);
	end
	
	if spellid then
		
		  
			amPlaySpellTextGameTooltip = CreateFrame("GameTooltip", "amPlaySpellTextGameTooltipFrame" .. "Tooltip", nil, "GameTooltipTemplate")
			amPlaySpellTextGameTooltip:SetOwner(WorldFrame, "ANCHOR_NONE")
		
		  
			amPlaySpellTextGameTooltip:ClearLines();
			amPlaySpellTextGameTooltip:SetSpellByID(spellid);
			
			local text = _G[amPlaySpellTextGameTooltip:GetName() .. "TextLeft" .. index]:GetText();
			
			
			return text or "";
			
			
			
		
	end
		
	return "";
	
end


function amPlaySpellNumber(spell,index,Remove,FormatText)	
	
	
	if not index then
		
		index = 5;
		
	end
	
	
	local text = amPlaySpellText(spell,index);
	local Tbl;
	
	if Remove and type(Remove) == "string" then
	
		Tbl = { strsplit("|",Remove) }
		
		if Tbl then
		
			for i,v in ipairs(Tbl) do
			
				text=gsub(text,v,"");
			end
		
		end
		
	end
	
	local v={};
	local i = 1;
	if text then
		
		if not FormatText or FormatText == "" then
			
			FormatText = "%d+";
					
		end
		
		for k, val in string.gmatch(text, FormatText) do
			v[i]=tonumber(k);
					
			i=i+1;
		end
		
				
	end
	
   
   return v[1] or -1,v[2] or -1,v[3] or -1,v[4] or -1,v[5] or -1,v[6] or -1,v[7] or -1,v[8] or -1;
	
end

function amPlaySpellFindText(spell,index,FindText)
	
	if spell and index and FindText then
	
		local text = amPlaySpellText(spell,index);
		
		return (text and amfind(text,FindText,-1) and true) or false;
		
	end
	
	return false;
			
end

function amrunEmptyAction()

	return true;
end

function amStatusInfo()
	
	if not statuMain then
		print("|cffff0000请安装StatusInfo人物屬性監控插件！");
		return -1,-1,-1,-1,-1;
	end
	
	local a=statuMain:GetText() or "";
	a=gsub(a," ","",1);
	
	if string.find(a,"!>") then
		a=string.sub(a,25);
	else
		a=string.sub(a,11);
	end
	a=gsub(a,"%%","",1) or "-1";	
	a=tonumber(a) or -1;
	
	local b=statu3:GetText() or "";
	b=gsub(b," ","",1);
	if string.find(b,"!>") then
		b=string.sub(b,25);
	else
		b=string.sub(b,11);
	end
	b=gsub(b,"%%","",1) or "-1";	
	b=tonumber(b) or -1;
	
	
	local c=statu2:GetText() or "";
	c=gsub(c," ","",1);
	if string.find(c,"!>") then
		c=string.sub(c,25);
	else
		c=string.sub(c,11);
	end
	c=gsub(c,"%%","",1) or "-1";	
	c=tonumber(c) or -1;

	local d=statu4:GetText() or "";
	d=gsub(d," ","",1);
	if string.find(d,"!>") then
		d=string.sub(d,25);
	else
		d=string.sub(d,11);
	end
	d=gsub(d,"%%","",1) or "-1";	
	d=tonumber(d) or -1;
	
	
	local e=statu5:GetText() or "";
	e=gsub(e," ","",1);
	if string.find(e,"!>") then
		e=string.sub(e,25);
	else
		e=string.sub(e,11);
	end
	e=gsub(e,"%%","",1) or "-1";	
	e=tonumber(e) or -1;
	
	
	

	return a,b,c,d,e;
end


function reportActionButtons()
	local lActionSlot = 0;
	for lActionSlot = 1, 120 do
		local lActionText = GetActionText(lActionSlot);
		local lActionTexture = GetActionTexture(lActionSlot);
		if lActionTexture then
			local lMessage = "Slot " .. lActionSlot .. ": [" .. lActionTexture .. "]";
			if lActionText then
				lMessage = lMessage .. " \"" .. lActionText .. "\"";
			end
			DEFAULT_CHAT_FRAME:AddMessage(lMessage);
		end
	end
end

function amAffDots(target)
		if not target then
	
		return -1,-1,-1,-1,-1,-1;
		
	end
		
	if not AffDotsTarget then
		print("|cffff0000请安装AffDots插件！");
		return -1,-1,-1,-1,-1,-1;
	end
	
	
	
	if target == 0 and UnitName("Target") then
		if AffDotsTarget:IsShown() then
		
			local m= AffDotsTarget;
		
			for i =1 , 6 do
			
				local f = m["f"..i]
				if f and type(f) == "table" and m["f"..i].t1 then
					f.value = tonumber(f.t1:GetText()) or -1;
					
				end
			
			end
			return m.f1.value or -1,
			m.f2.value or -1,
			m.f3.value or -1,
			m.f4.value or -1,
			m.f5.value or -1,
			m.f6.value or -1;
						
		end
	
	end
	
	if target == 1 and UnitName("Focus") then
		if AffDotsFocus:IsShown() then
		
			local m= AffDotsFocus;
		
			for i =1 , 6 do
			
				local f = m["f"..i]
				if f and type(f) == "table" and m["f"..i].t1 then
					f.value = tonumber(f.t1:GetText()) or -1;					
				end
			
			end
			
			return m.f1.value or -1,
			m.f2.value or -1,
			m.f3.value or -1,
			m.f4.value or -1,
			m.f5.value or -1,
			m.f6.value or -1;
						
		end
	
	end
	
	
	return -1,-1,-1,-1,-1,-1;
		
end

function amClickExtraActionButton1()
	
	amrun("/click ExtraActionButton1");
	return true;
end

function amExtraActionBarCooldown()
		local isname = nil;

	local a,b,c = GetActionCooldown(121) 
	
	if a then
		isname=1;
	else
		isname=nil;
		return -1,isname;
	end
	
	if c ==0 or not a then
		return -1,isname;
	end
		
		n = a+b-GetTime()
	
		if n<0 then
			n=0
		end
		
		return n,isname;
end

local function findAffDots(tbl,target,spell)
	for i, v in pairs(tbl) do
		if (v["target"]==target and v["name"]==spell) or 
		(v["target"]==target and v["spell"]==spell) then
		
			return v["t1"];
		
		end
		
	end
	
	return false;
	
end

function amAffDotsVer120(target,spell)

	if tonumber(spell) then
		spell = tonumber(spell);
	end
	
	

	if not target or not spell or (type(spell) == "string" and not UnitName(target)) then
	
		return -1;
		
	end
	
	
	
	
	if not AffDots then
		print("|cffff0000请安装AffDots插件！");
		return -1;
	end
	
	if not AffDots.amtrack then
		print("|cffff0000请安装上帝指令专用的AffDots插件！");
		return -1;
	end
	
	local tar="";

	if UnitIsUnit(target, "target") or target == 0 then
		tar =  "target";
	elseif UnitIsUnit(target, "focus") or target == 1 then
		tar =  "focus";
		
	else
		return -1;
	end
	
	local f;
	
	if AffDotsTarget:IsShown() and tar == "target" then
	
		f = findAffDots(AffDots.amtrack,tar,spell)
			
	elseif AffDotsFocus:IsShown() and tar == "focus" then
		
		f = findAffDots(AffDots.amtrack,tar,spell)
	
	else
		return -1;
	end
	
	
	
	if f then
	
		return tonumber(f:GetText()) or -1;
	else
		return -1;
	end
end

------------
function AutoFaceTarget()
    if UnitIsVisible("target") and UnitExists("target") and GetUnitSpeed("player") == 0 and not FHgetFacing("target",90) then 
	FaceDirection(GetAnglesBetweenObjects("player","target"));
	return true;
    else 
        return false;
    end
end
---------------------------------------不可自动面对
local notfacetarget = {
157059,          ----黑石 纠缠之地符文dubuff
188081,          ----地狱火堡垒，小怪攫取之手1
187819,          ----地狱火堡垒，boss攫取之手2
}

function amcannotmove(Unit)
	if Unit == nil then
		Unit = "player";
	end
	
	for i=1,#notfacetarget do
	       local  name = GetSpellInfo(notfacetarget[i]);
		if UnitDebuff(Unit,tostring(name)) ~= nil then
			return true
		end
	end
	return false
end

function AutoFaceTarget2(unit)
    local X1,Y1,Z1 = ObjectPosition(unit);
    local X2,Y2,Z2 = ObjectPosition("player");
    if UnitIsVisible(unit) and UnitExists(unit) and GetUnitSpeed("player") == 0 and not FHgetFacing(unit,90) and not amcannotmove("player") then 
	FaceDirection(GetAnglesBetweenObjects("player",unit));
	--return true;
    else 
        --return false;
    end
end

--面对当前目标，面对返回1,后背0，没目标-1
function amIsFaceTarget()
     if unit == nil then
        return -1;
     elseif (FHgetFacing2("player","target",90) and FHgetFacing2("target","player",90)) then
        return 1;
     elseif (FHgetFacing2("player","target",90) and not FHgetFacing2("target","player",90)) then
        return 0;
     elseif (not FHgetFacing2("player","target",90) and FHgetFacing2("target","player",90)) then
        return 2;
     elseif (not FHgetFacing2("player","target",90) and not FHgetFacing2("target","player",90)) then
        return 3;
     end
	
end
--面对焦点，面对返回1,后背0，没目标-1
function amIsFaceFocus()
     if unit == nil then
        return -1;
     elseif (FHgetFacing2("player","focus",90) and FHgetFacing2("focus","player",90)) then
        return 1;
     elseif (FHgetFacing2("player","focus",90) and not FHgetFacing2("focus","player",90)) then
        return 0;
     elseif (not FHgetFacing2("player","focus",90) and FHgetFacing2("focus","player",90)) then
        return 2;
     elseif (not FHgetFacing2("player","focus",90) and not FHgetFacing2("focus","player",90)) then
        return 3;
     end
end

function amIsFaceTargetSimple(v1,v2)
	
	if v1 == 0 then
		amIsFaceTarget(v1);
	else
		
		if v2 == 4 then
			return amIsFaceTarget(v1) == 0 or amIsFaceTarget(v1) == 1;
		else
			return amIsFaceTarget(v1) == v2;
		end
			
	end
	return false;
end

function AutoFaceFocus()
    if UnitIsVisible("focus") and UnitExists("focus")  and GetUnitSpeed("player") == 0 and FHgetFacing("focus",90) then 
	FaceDirection(GetAnglesBetweenObjects("player","focus"));
	return true;
    else 
        return false;
    end
end

function amIsFaceFocusSimple(v1,v2)
	
	if v1 == 0 then
		amIsFaceFocus(v1);
	else
		
		if v2 == 4 then
			return amIsFaceFocus(v1) == 0 or amIsFaceFocus(v1) == 1;
		else
			return amIsFaceFocus(v1) == v2;
		end
			
	end
	return false;
end


function amPlayerTargetDistance()
	--return -1;

		if UnitIsVisible("target") and UnitExists("target") then

				local X1,Y1,Z1 = ObjectPosition("target");
				local X2,Y2,Z2 = ObjectPosition("player");
				return math.sqrt(((X2-X1)^2)+((Y2-Y1)^2)+((Z2-Z1)^2));
		else

				return 100;
		end

end

function amPetPlayerDistance()
		if UnitIsVisible("pet") and  UnitExists("pet") then

				local X1,Y1,Z1 = ObjectPosition("pet");
				local X2,Y2,Z2 = ObjectPosition("player");
				return math.sqrt(((X2-X1)^2)+((Y2-Y1)^2)+((Z2-Z1)^2));
		else

				return 100;
		end
end

function amPetTargetDistance()
		if UnitIsVisible("pet") and  UnitExists("pet") and UnitIsVisible("target") and  UnitExists("target")then

				local X1,Y1,Z1 = ObjectPosition("pet");
				local X2,Y2,Z2 = ObjectPosition("target");
				return math.sqrt(((X2-X1)^2)+((Y2-Y1)^2)+((Z2-Z1)^2));
		else

				return 100;
		end
end

function amPetFocusDistance()
		if UnitIsVisible("pet") and  UnitExists("pet") and UnitIsVisible("focus") and  UnitExists("focus")then

				local X1,Y1,Z1 = ObjectPosition("pet");
				local X2,Y2,Z2 = ObjectPosition("focus");
				return math.sqrt(((X2-X1)^2)+((Y2-Y1)^2)+((Z2-Z1)^2));
		else

				return 100;
		end
end

function amTargetFocusDistance()
		if UnitIsVisible("target") and  UnitExists("target") and UnitIsVisible("focus") and  UnitExists("focus")then

				local X1,Y1,Z1 = ObjectPosition("target");
				local X2,Y2,Z2 = ObjectPosition("focus");
				return math.sqrt(((X2-X1)^2)+((Y2-Y1)^2)+((Z2-Z1)^2));
		else

				return 100;
		end
end

function amPetPetTargetDistance()
		if UnitIsVisible("pettarget") and  UnitExists("pettarget") and UnitIsVisible("pet") and  UnitExists("pet")then

				local X1,Y1,Z1 = ObjectPosition("pettarget");
				local X2,Y2,Z2 = ObjectPosition("pet");
				return math.sqrt(((X2-X1)^2)+((Y2-Y1)^2)+((Z2-Z1)^2));
		else

				return 100;
		end
end

function amGetRangeUnitCount()
	return -1;
end

function amGetRangeRadianUnitCount()
	return -1;
end

function amPlayerToEnemyRangeCount(jl)
	 local PlayerToEnemyRangeCount = 0;
            for i = 1, #FHenemiesTable do
                
                    local thisUnit = FHenemiesTable[i].unit
                    if FHObjectDistance("player",thisUnit) < jl then
                     --if FHObjectDistance("player",thisUnit) < jl and FHgetFacing(thisUnit,Degrees) == true then
                        PlayerToEnemyRangeCount = PlayerToEnemyRangeCount + 1;
                    end

            end
       
      return PlayerToEnemyRangeCount;
end

function amPlayerToFriendlyRangeCount(jl)
      local PlayerToFriendlyRangeCountprefix = "raid";
      local PlayerToFriendlyRangeCountnumPlayers = GetNumGroupMembers();
      local PlayerToFriendlyRangeCount = 0;
      if not IsInRaid() then
	 PlayerToFriendlyRangeCountprefix = "party";
	 PlayerToFriendlyRangeCountnumPlayers = PlayerToFriendlyRangeCountnumPlayers-1;
 
     end
	for i=1,PlayerToFriendlyRangeCountnumPlayers do
      	        local targetName = UnitName("player");
		local posX, posY = UnitPosition("player");
	        local Unit2 = PlayerToFriendlyRangeCountprefix..i ;
		local targetName2 = UnitName(Unit2);
			if (targetName2 ~= targetName) then 
				local posX2, posY2 = UnitPosition(Unit2);
				local xx = posX-posX2;
	                        local yy = posY-posY2;
	                        local dist2 =  math.sqrt(xx*xx+yy*yy);
				if (dist2<jl) then
					PlayerToFriendlyRangeCount = PlayerToFriendlyRangeCount +1;
				end
			end		
     end;
       
      return PlayerToFriendlyRangeCount;	
end

function amPlayerRangeRadianEnemyCount(jl)
	local PlayerRangeRadianEnemyCount = 0;
            for i = 1, #FHenemiesTable do
                
                    local thisUnit = FHenemiesTable[i].unit
                    if FHObjectDistance("player",thisUnit) < jl and FHgetFacing(thisUnit,90) == true then
                     --if FHObjectDistance("player",thisUnit) < jl and FHgetFacing(thisUnit,Degrees) == true then
                        PlayerRangeRadianEnemyCount = PlayerRangeRadianEnemyCount + 1;
                    end

            end
       
      return PlayerRangeRadianEnemyCount;
end

function amPlayerRangeRadianFriendlyCount(jl)
      local PlayerRangeRadianFriendlyCountprefix = "raid";
      local PlayerRangeRadianFriendlyCountnumPlayers = GetNumGroupMembers();
      local PlayerRangeRadianFriendlyCount = 0;
      if not IsInRaid() then
	 PlayerRangeRadianFriendlyCountprefix = "party";
	 PlayerRangeRadianFriendlyCountnumPlayers = PlayerRangeRadianFriendlyCountnumPlayers-1;
 
     end
	for i=1,PlayerRangeRadianFriendlyCountnumPlayers do
      	        local targetName = UnitName("player");
		local posX, posY = UnitPosition("player");
	        local Unit2 = PlayerRangeRadianFriendlyCountprefix..i ;
		local targetName2 = UnitName(Unit2);
			if (targetName2 ~= targetName) then 
				local posX2, posY2 = UnitPosition(Unit2);
				local xx = posX-posX2;
	                        local yy = posY-posY2;
	                        local dist2 =  math.sqrt(xx*xx+yy*yy);
				if (dist2<jl) and FHgetFacing(Unit2,90) == true then
					PlayerRangeRadianFriendlyCount = PlayerRangeRadianFriendlyCount +1;
				end
			end		
     end;
       
      return PlayerRangeRadianFriendlyCount;
end
  
  
function amIsEclipseDirection()
	
	return GetEclipseDirection() == "sun";

end

function amExtraActionBarPower()
	
	return UnitPower("player", ALTERNATE_POWER_INDEX) or -1;

end

function amExtraActionBarSpellName()
	
	_, _, _, spellID = GetActionInfo(121);
	local Name = GetSpellInfo(spellID);	
	return Name or "";

end

function amTargetTargetNotMe(t)
	
	if t == 1 then
	
		if not UnitName("targettarget") then
			return false;
		end
		
		if not UnitIsUnit("player","targettarget") then
			return true;
		end
	else
		
		if not UnitName("target") then
			return false;
		end
		
		if not UnitName("targettarget") then
			return true;
		end
				
		if not UnitIsUnit("player","targettarget") then
			return true;
		end
		
	end

end

function amTargetTargetToMe()
	
	if not UnitIsUnit("player","targettarget") then 
		return true
	else
		return false
	end;

end


-------------------------------test----------
function FHINSight(Unit2)

	if UnitIsVisible(Unit2) then
		local X1,Y1,Z1 = ObjectPosition("player");
		local X2,Y2,Z2 = ObjectPosition(Unit2);
		if TraceLine(X1,Y1,Z1 + 2,X2,Y2,Z2 + 2, 0x10) == nil then 
		    return true; 
		else 
		    return false; 
		end
	else
		return true;
	end
end


function FHCastAOE(Unit,SpellName)
        
	local name, rank, icon, castTime, minRange, maxRange, spellID = GetSpellInfo(SpellName)

	if UnitExists(Unit) and amSpellCooldown(spellID) == 0  then
 		CastSpellByName(SpellName,"player");
		if IsAoEPending() then
		local X, Y, Z = ObjectPosition(Unit);
			ClickPosition(X,Y,Z,true);
			return true;
		end
 	end
 	return false;
end


function FHCastAOECenter(Unit,SpellName)

	local name, rank, icon, castTime, minRange, maxRange, spellID = GetSpellInfo(SpellName)

	if UnitExists(Unit) and amSpellCooldown(spellID) == 0 and amcd then
 		CastSpellByName(SpellName,"player");
		if IsAoEPending() then
		local X1, Y1, Z1 = ObjectPosition(Unit);
		local X2, Y2, Z2 = ObjectPosition("player");
		local CX=(X1+X2)/2;
		local CY=(Y1+Y2)/2;
		local CZ=(Z1+Z2)/2;
			ClickPosition(CX,CY,CZ,true);
			return true;
		end
 	end
 	return false;
end

function amBuffShield(Unit,SpellName,Checked)
        if Checked==1 then 
	local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, canStealOrPurge, shouldConsolidate, spellId, canApplyAura, isBossDebuff, isCastByPlayer, value1 = UnitAura(Unit,SpellName,nil,"player");
	      if UnitExists(Unit) and name~=nil then
 	           return value1;
	      else
 	           return 0;
	      end
	else
        local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, canStealOrPurge, shouldConsolidate, spellId, canApplyAura, isBossDebuff, isCastByPlayer, value1 = UnitAura(Unit,SpellName);
	      if UnitExists(Unit) and name~=nil then
 	           return value1;
	      else
 	           return 0;
	      end
	end
end

function amRandomBoolean(chance)
	if chance >= random(100) then
		return true
	else
		return false
	end
end

function amCalcExp(str)
	--print(str)
	amTeMpCon=nil
	--return loadstring("return "..str)()
	--str=string.gsub(str,"\"","\\\"")
	local todo = "amTeMpCon=("..str..")"
	RunScript(todo)
	
	return amTeMpCon
end

function amDBMBarTimeRemain(barname)
    for bar in DBM.Bars:GetBarIterator() do
        if barname == _G[bar.frame:GetName().."BarName"]:GetText() then
            return bar.timer
        end
        --print(_G[bar.frame:GetName().."BarName"]:GetText())
    end
    return -1
end

function amIsTellMeWhenIconShown(groupN,iconN)
--TellMeWhen_Group1_Icon1.attributes.shown
	local tmw_isshown = _G["TellMeWhen_Group"..tostring(groupN).."_Icon"..tostring(iconN)].attributes.shown
	local tmw_alpha = _G["TellMeWhen_Group"..tostring(groupN).."_Icon"..tostring(iconN)].attributes.alpha
	local tmw_realAlpha = _G["TellMeWhen_Group"..tostring(groupN).."_Icon"..tostring(iconN)].attributes.realAlpha
	return tmw_isshown and not (tmw_alpha==0) and not (tmw_realAlpha == 0)
end

function amCountLowPlayers(Unit,minHPLevel,dist)
      local prefix = "raid";
      local numPlayers = GetNumGroupMembers();
      local count = 0;
      if not IsInRaid() then
	 prefix = "party";
	 numPlayers = numPlayers-1;
         local perc = UnitHealth("player") / UnitHealthMax("player")*100;
	 if perc < minHPLevel then
            count = count +1;
	 end
     end
      for i=1,numPlayers do
      	        local targetName = UnitName(Unit);
		local posX, posY = UnitPosition(Unit);
	        local Unit2 = prefix..i ;
		local targetName2 = UnitName(Unit2);
			if (targetName2 ~= targetName) then 
				local posX2, posY2 = UnitPosition(Unit2);
				local perc = UnitHealth(Unit2) / UnitHealthMax(Unit2)*100;
                                local xx = posX-posX2;
	                        local yy = posY-posY2;
	                        local dist2 =  math.sqrt(xx*xx+yy*yy);
				if (perc < minHPLevel and dist2<dist) then
					count = count +1;
				end
			end		
     end;
   
return count;
end


local UnitsTables = {};
function FHGetUnitsTables(Type,jl,center)
   if center == nil then 
      center="player"
   end
   




   if UnitExists(center) then
      if Type==1 then 
         for i=1,GetObjectCount()  do
            
            local x1,y1,z1= ObjectPosition(GetObjectWithIndex(i))
            local x,y,z= ObjectPosition(center)
            local x2=x-x1
            local y2=y-y1
            local z2=z-z1
            local jl1=math.sqrt(x2*x2+y2*y2)
            local jl2=math.sqrt(jl1*jl1+z2*z2)
            
            
            if jl2<=jl and UnitIsEnemy(center,GetObjectWithIndex(i)) and UnitCanAttack("player",GetObjectWithIndex(i)) and UnitHealth(GetObjectWithIndex(i))>0  then 
               
               table.insert(UnitsTables,GetObjectWithIndex(i))    
               -- print(ObjectName(GetObjectWithIndex(i)),jl2)
               --print(msGD(GetObjectWithIndex(i),center) )
               
            end
            
         end
         
      elseif Type==2 then 
         for i=1,GetObjectCount()  do
            
            local x1,y1,z1= ObjectPosition(GetObjectWithIndex(i))
            local x,y,z= ObjectPosition(center)
            local x2=x-x1
            local y2=y-y1
            local z2=z-z1
            local jl1=math.sqrt(x2*x2+y2*y2)
            local jl2=math.sqrt(jl1*jl1+z2*z2)
            
            
            if jl2<=jl  and UnitCanAttack(center,GetObjectWithIndex(i)) and UnitHealth(GetObjectWithIndex(i))>0  then 
               
               table.insert(UnitsTables,GetObjectWithIndex(i))    
               -- print(ObjectName(GetObjectWithIndex(i)),jl2)
               --print(msGD(GetObjectWithIndex(i),center) )
               
            end
            
         end
      elseif Type==3 then 
         for i=1,GetObjectCount()  do
            
            local x1,y1,z1= ObjectPosition(GetObjectWithIndex(i))
            local x,y,z= ObjectPosition(center)
            local x2=x-x1
            local y2=y-y1
            local z2=z-z1
            local jl1=math.sqrt(x2*x2+y2*y2)
            local jl2=math.sqrt(jl1*jl1+z2*z2)
            
            
            if jl2<=jl  and UnitIsFriend(center,GetObjectWithIndex(i)) and UnitHealth(GetObjectWithIndex(i))>0 then 
               
               table.insert(UnitsTables,GetObjectWithIndex(i))    
               -- print(ObjectName(GetObjectWithIndex(i)),jl2)
               --print(msGD(GetObjectWithIndex(i),center) )
               
            end
            
         end
         
      end

end
return UnitsTables;
end

local Units1 = {};
local lastRefresh1 = 0;
function FHGetUnits(Type,jl,center)
   if lastRefresh1 ==0 or GetTime() - lastRefresh1  > 1 then
	lastRefresh1 = GetTime()
   Units1 = FHGetUnitsTables(Type,jl,center);
   return #Units1;
   end
end
   
--[[
在指定中心目标的指定半径范围内搜索血量大于0的单位。

---------------------

参数1
Type必填
是否限定为玩家单位或NPC单位。

1 敌方(副本中建议使用1）

2  敌方或中立

3  友方
---------------------
参数2
jl必填
搜索范围半径码数。
 --------------------
参数3
Center
默认: "player"

搜索中心目标。

-----------------------------------------------------------------

返回值

Units

目标群（一个或多个）

搜索到的所有单位的GUID数组表。

-----------------------------------------------------------------

举例

寻找玩家自身周围15码内中立或敌对目标,并把他们全部打印出来：

local units = FHGetUnits(2,15);

for i=1,#units do

  print("目标单位名字:",GetUnitName(units[i]));

end

--]]
function FHGetRangeEnemyCount(Unit,jl)
 local count = 0;
            for i = 1, #FHenemiesTable do
                
                    local thisUnit = FHenemiesTable[i].unit
                    if FHObjectDistance(Unit,thisUnit) < jl then
                     --if FHObjectDistance("player",thisUnit) < jl and FHgetFacing(thisUnit,Degrees) == true then
                        count = count + 1;
                    end

            end
       
      return count;
end

function amGetDruidHealMushrooms(remaintime)
	

	
		local haveTotem, name, startTime, duration, icon = GetTotemInfo(1);
		
		if not haveTotem then
			return -1;
		end
		
		
		local cd = remaintime - (GetTime()-startTime) ;
		
		if cd <0 then
		
			cd=0;
			
		end
		
		return cd;

end


function FHObjectDistance(First, Second)
    if UnitGUID(First) ~= nil and UnitGUID(Second) ~= nil then
	local fX, fY, fZ = ObjectPosition(First);
	local sX, sY, sZ = ObjectPosition(Second);

	return math.sqrt(((fX - sX) ^ 2) + ((fY - sY) ^ 2) + ((fZ - sZ) ^ 2)) - (UnitCombatReach(First)+UnitCombatReach(Second));
    else 
        return 888
    end
end

function FHgetFacing(Unit2,Degrees)   
	if Degrees == nil then Degrees = 90; end
	if Unit2 == nil then Unit2 = "player"; end
	if UnitIsVisible(Unit2) then
		local Angle1,Angle2,Angle3;
		local Angle1 = ObjectFacing("player")
		local Angle2 = ObjectFacing(Unit2)
		local Y1,X1,Z1 = ObjectPosition("player");
                local Y2,X2,Z2 = ObjectPosition(Unit2);
	    if Y1 and X1 and Z1 and Angle1 and Y2 and X2 and Z2 and Angle2 then
	        local deltaY = Y2 - Y1
	        local deltaX = X2 - X1
	        Angle1 = math.deg(math.abs(Angle1-math.pi*2))
	        if deltaX > 0 then
	            Angle2 = math.deg(math.atan(deltaY/deltaX)+(math.pi/2)+math.pi)
	        elseif deltaX <0 then
	            Angle2 = math.deg(math.atan(deltaY/deltaX)+(math.pi/2))
	        end
	        if Angle2-Angle1 > 180 then
	        	Angle3 = math.abs(Angle2-Angle1-360)
	        else
	        	Angle3 = math.abs(Angle2-Angle1)
	        end
	        if Angle3 < Degrees then return true; else return false; end
	    end
	end

end

function FHgetFacing2(Unit1,Unit2,Degrees)   
	if Degrees == nil then Degrees = 90; end
	if Unit2 == nil then Unit2 = "player"; end
	if UnitIsVisible(Unit2) then
		local Angle1,Angle2,Angle3;
		local Angle1 = ObjectFacing(Unit1)
		local Angle2 = ObjectFacing(Unit2)
		local Y1,X1,Z1 = ObjectPosition(Unit1);
                local Y2,X2,Z2 = ObjectPosition(Unit2);
	    if Y1 and X1 and Z1 and Angle1 and Y2 and X2 and Z2 and Angle2 then
	        local deltaY = Y2 - Y1
	        local deltaX = X2 - X1
	        Angle1 = math.deg(math.abs(Angle1-math.pi*2))
	        if deltaX > 0 then
	            Angle2 = math.deg(math.atan(deltaY/deltaX)+(math.pi/2)+math.pi)
	        elseif deltaX <0 then
	            Angle2 = math.deg(math.atan(deltaY/deltaX)+(math.pi/2))
	        end
	        if Angle2-Angle1 > 180 then
	        	Angle3 = math.abs(Angle2-Angle1-360)
	        else
	        	Angle3 = math.abs(Angle2-Angle1)
	        end
	        if Angle3 < Degrees then return true; else return false; end
	    end
	end

end

function amGetStagger()
	return UnitStagger("player");
end

function amMistCounts(num1,types,aura) 
         local prefix = "raid" 
         local numPlayers = GetNumGroupMembers() 
         local numAuras1 = 0 
         local numAuras2 = 0 
         if not IsInRaid() then 
             prefix = "party" 
             numPlayers = numPlayers-1 
              local perc = UnitHealth("player") / UnitHealthMax("player")*100 
             if types == 1 then  
                 local _, _, _, _, _, _, expirationTime, _, _, _, _ = UnitAura("player", aura, nil, "PLAYER|HELPFUL") 
                 if expirationTime ~= nil and perc <= num1 then 
                     numAuras1 = numAuras1 + 1 
                 end 
             else 
                 if perc <= num1 then 
                     numAuras2 = numAuras2 + 1 
                 end 
             end 
         end 
      
         for i=1,numPlayers do 
             local unit = prefix..i 
             local perc = UnitHealth(unit) / UnitHealthMax(unit)*100 
             if types == 1 then  
                 local _, _, _, _, _, _, expirationTime, _, _, _, _ = UnitAura(unit, aura, nil, "PLAYER|HELPFUL") 
                 if expirationTime ~= nil and perc <= num1 then 
                     numAuras1 = numAuras1 + 1 
                 end 
             else 
                 if perc <= num1 then 
                     numAuras2 = numAuras2 + 1 
                 end 
             end 
         end 
         if types == 1 then 
             return numAuras1; 
         else 
             return numAuras2; 
         end 
 end
--amMistCounts(0.8,1,"复苏之雾")
--0.8是血量百分比,运算是<=
--1是需要不需要检测buff
--最后一个就是buff名称,不能用法术ID,只能用名称.


function FHGetRangeRadianUnitCount(jl,Degrees)
 local countRadian = 0;
            for i = 1, #FHenemiesTable do
                
                    local thisUnit = FHenemiesTable[i].unit
                    if FHObjectDistance("player",thisUnit) < jl and FHgetFacing(thisUnit,Degrees) == true then
                     --if FHObjectDistance("player",thisUnit) < jl and FHgetFacing(thisUnit,Degrees) == true then
                        countRadian = countRadian + 1;
                    end

            end
       
      return countRadian;
end

function FHINFly(Unit2)

	if UnitIsVisible(Unit2) then

		local X2,Y2,Z2 = ObjectPosition(Unit2);
		if TraceLine(X1,Y1,Z1,X2,Y2,Z2 - 2, 0x10) == nil then 
		    return true; 
		else 
		    return false; 
		end
	else
		return true;
	end
end


function CheckGlyph(GlyphName)
	for i=1,NUM_GLYPH_SLOTS do
	   local enabled, glyphType, glyphTooltipIndex, glyphSpellID, icon, glyphID = GetGlyphSocketInfo(i,GetActiveSpecGroup());
	   if (enabled and GetSpellInfo(glyphSpellID) == GlyphName) then
		  return true;
	   end
	end;
	return false;
end

function FHGetRangeRadianCastingUnit(jl,Degrees,spellName)

local name, rank, icon, castTime, minRange, maxRange, spellID = GetSpellInfo(SpellName)
      
            for i = 1, #FHenemiesTable do
                     local thisUnit = FHenemiesTable[i].unit
                    if FHObjectDistance("player",thisUnit) < jl and FHgetFacing(thisUnit,Degrees) == true and FHINSight(thisUnit) == true  and UnitIsDeadOrGhost(thisUnit) == false then
                      

                      ---检测打断目标
		        
                           local spell, _, _, _, startTime, endTime, _, _, notinterrupt= UnitCastingInfo(thisUnit);
		           local spell2, _, _, _, startTime2, endTime2, _, _, notinterrupt2= UnitChannelInfo(thisUnit);
                           

		           if UnitCastingInfo(thisUnit) ~= nil and not notinterrupt then
	                        local finish = (endTime/1000 - GetTime())/(startTime/1000 - endTime/1000)*100;

	                        if finish <= 70 and amSpellCooldown(spellID) == 0 and amcd then
				       --return thisUnit;
				      --CastSpellByName(spellName,thisUnit);
				       amrun(spellName,thisUnit);
	  			       return true
				end
                           end
                           if UnitChannelInfo(thisUnit) ~= nil and not notinterrupt2 then
	                        local finish2 = (endTime2/1000 - GetTime())/(startTime2/1000 - endTime2/1000)*100;

	                        if finish2 <= 70  and amSpellCooldown(spellID) == 0 and amcd then
				       --return thisUnit;
				       --CastSpellByName(spellName,thisUnit);
				       amrun(spellName,thisUnit);
	  			       return true
				end
                           end
       
                    end
               
            end
      return false
end

function FHTotemDistance(Unit1)
	if Unit1 == nil then
		Unit1 = "player"
	end
        
	local haveTotem, name, startTime, duration, icon = GetTotemInfo(1);
	
	if ( haveTotem and UnitIsVisible(Unit1) ) then
		for i = 1,GetObjectCount() do
            --print(UnitGUID(GetObjectWithIndex(i)))
                    if name == UnitGUID(GetObjectWithIndex(i)) then
                        X2,Y2,Z2 = ObjectPosition(GetObjectWithIndex(i))
                    end
		end
		local X1,Y1,Z1 = ObjectPosition(Unit1)

		TotemDistance = math.sqrt(((X2-X1)^2)+((Y2-Y1)^2)+((Z2-Z1)^2))

		--print(TotemDistance)
		return TotemDistance
	else
		return 1000
	end
end


function amTotemExist()
       
	local haveTotem, name, startTime, duration, icon = GetTotemInfo(1);
	return haveTotem;
end

function amPowerRegen(Unit)
	local regen = select(2,GetPowerRegen(Unit))
	return 1.0 / regen
end

function amTimeToMax(Unit)
  	local maxPower = UnitPowerMax(Unit)
  	local curr = UnitPower(Unit)
  	local regen = select(2,GetPowerRegen(Unit))
	local spellName = GetSpellInfo(114107)
  	if select(3,UnitClass("player")) == 11 and GetSpecialization() == 2 and GetSpellBookItemInfo(tostring(spellName)) ~= nil then
   		curr2 = curr + 4*UnitPower("player",4)
  	else
   		curr2 = curr
  	end
  	return (maxPower - curr2) * (1.0 / regen)
end


local tauntsTable = {
	{ spell = 143436,stacks = 1 },--Immerseus/71543               
	{ spell = 146124,stacks = 3 },--Norushen/72276                
	{ spell = 144358,stacks = 1 },--Sha of Pride/71734            
	{ spell = 147029,stacks = 3 },--Galakras/72249                
	{ spell = 144467,stacks = 2 },--Iron Juggernaut/71466         
	{ spell = 144215,stacks = 6 },--Kor'Kron Dark Shaman/71859    
	{ spell = 143494,stacks = 3 },--General Nazgrim/71515         
	{ spell = 142990,stacks = 12 },--Malkorok/71454                
	{ spell = 143426,stacks = 2 },--Thok the Bloodthirsty/71529   
	{ spell = 143780,stacks = 2 },--Thok (Saurok eaten)           
	{ spell = 143773,stacks = 3 },--Thok (Jinyu eaten)            
	{ spell = 143767,stacks = 2 },--Thok (Yaungol eaten)          
	{ spell = 145183,stacks = 3 }, --Garrosh/71865                 
        { spell = 159178,stacks = 1 }, --卡加斯
        { spell = 156143,stacks = 1 }, --屠夫 
        { spell = 159515,stacks = 3 }, --马尔高克

}


function amAutoTaunt(spellName)

	
	if not UnitIsUnit("player","boss1target") then
	  	for i = 1,#tauntsTable do
	  		if not UnitDebuffID("player",tauntsTable[i].spell) and UnitDebuffID("boss1target",tauntsTable[i].spell) and select(4,UnitDebuff("boss1target",tauntsTable[i].spell)) >= tauntsTable[i].stacks then
	  			CastSpellByName(spellName,"boss1");
	  			return true
	  		end
	  	end
	end
      return false
end

function amLongTimeCCed(Unit)
	if Unit == nil then
		return false
	end
	local longTimeCC = {
		339,	-- Druid - Entangling Roots
		102359,	-- Druid - Mass Entanglement
		1499,	-- Hunter - Freezing Trap
		19386,	-- Hunter - Wyvern Sting
		118,	-- Mage - Polymorph
		115078,	-- Monk - Paralysis
		20066,	-- Paladin - Repentance
		10326,	-- Paladin - Turn Evil
		9484,	-- Priest - Shackle Undead
		605,	-- Priest - Dominate Mind
		6770,	-- Rogue - Sap
		2094,	-- Rogue - Blind
		51514,	-- Shaman - Hex
		710,	-- Warlock - Banish
		5782,	-- Warlock - Fear
		5484,	-- Warlock - Howl of Terror
		115268,	-- Warlock - Mesmerize
		6358,	-- Warlock - Seduction
	}
	for i=1,#longTimeCC do
	       local  name = GetSpellInfo(longTimeCC[i]);
		if UnitDebuff(Unit,tostring(name)) ~= nil then
			return true
		end
	end
	return false
end




function amisBoss(Unit2)
	------Boss Check------
	for x=1,5 do
	    if UnitExists("boss1") then
	        boss1 = tonumber(string.match(UnitGUID("boss1"),"-(%d+)-%x+$"))
	    else
	        boss1 = 0
	    end
	    if UnitExists("boss2") then
	        boss2 = tonumber(string.match(UnitGUID("boss2"),"-(%d+)-%x+$"))
	    else
	        boss2 = 0
	    end
	    if UnitExists("boss3") then
	        boss3 = tonumber(string.match(UnitGUID("boss3"),"-(%d+)-%x+$"))
	    else
	        boss3 = 0
	    end
	    if UnitExists("boss4") then
	        boss4 = tonumber(string.match(UnitGUID("boss4"),"-(%d+)-%x+$"))
	    else
	        boss4 = 0
	    end
	    if UnitExists("boss5") then
	        boss5 = tonumber(string.match(UnitGUID("boss5"),"-(%d+)-%x+$"))
	    else
	        boss5 = 0
	    end
	end
	BossUnits = {
	    -- Cataclysm Dungeons --
	    -- Abyssal Maw: Throne of the Tides
	    40586,-- Lady Naz'jar
	    40765,-- Commander Ulthok
	    40825,-- Erunak Stonespeaker
	    40788,-- Mindbender Ghur'sha
	    42172,-- Ozumat
	    -- Blackrock Caverns
	    39665,-- Rom'ogg Bonecrusher
	    39679,-- Corla,Herald of Twilight
	    39698,-- Karsh Steelbender
	    39700,-- Beauty
	    39705,-- Ascendant Lord Obsidius
	    -- The Stonecore
	    43438,-- Corborus
	    43214,-- Slabhide
	    42188,-- Ozruk
	    42333,-- High Priestess Azil
	    -- The Vortex Pinnacle
	    43878,-- Grand Vizier Ertan
	    43873,-- Altairus
	    43875,-- Asaad
	    -- Grim Batol
	    39625,-- General Umbriss
	    40177,-- Forgemaster Throngus
	    40319,-- Drahga Shadowburner
	    40484,-- Erudax
	    -- Halls of Origination
	    39425,-- Temple Guardian Anhuur
	    39428,-- Earthrager Ptah
	    39788,-- Anraphet
	    39587,-- Isiset
	    39731,-- Ammunae
	    39732,-- Setesh
	    39378,-- Rajh
	    -- Lost City of the Tol'vir
	    44577,-- General Husam
	    43612,-- High Prophet Barim
	    43614,-- Lockmaw
	    49045,-- Augh
	    44819,-- Siamat
	    -- Zul'Aman
	    23574,-- Akil'zon
	    23576,-- Nalorakk
	    23578,-- Jan'alai
	    23577,-- Halazzi
	    24239,-- Hex Lord Malacrass
	    23863,-- Daakara
	    -- Zul'Gurub
	    52155,-- High Priest Venoxis
	    52151,-- Bloodlord Mandokir
	    52271,-- Edge of Madness
	    52059,-- High Priestess Kilnara
	    52053,-- Zanzil
	    52148,-- Jin'do the Godbreaker
	    -- End Time
	    54431,-- Echo of Baine
	    54445,-- Echo of Jaina
	    54123,-- Echo of Sylvanas
	    54544,-- Echo of Tyrande
	    54432,-- Murozond
	    -- Hour of Twilight
	    54590,-- Arcurion
	    54968,-- Asira Dawnslayer
	    54938,-- Archbishop Benedictus
	    -- Well of Eternity
	    55085,-- Peroth'arn
	    54853,-- Queen Azshara
	    54969,-- Mannoroth
	    55419,-- Captain Varo'then

	    -- Mists of Pandaria Dungeons --
	    -- Scarlet Halls
	    59303,-- Houndmaster Braun
	    58632,-- Armsmaster Harlan
	    59150,-- Flameweaver Koegler
	    -- Scarlet Monastery
	    59789,-- Thalnos the Soulrender
	    59223,-- Brother Korloff
	    3977,-- High Inquisitor Whitemane
	    60040,-- Commander Durand
	    -- Scholomance
	    58633,-- Instructor Chillheart
	    59184,-- Jandice Barov
	    59153,-- Rattlegore
	    58722,-- Lilian Voss
	    58791,-- Lilian's Soul
	    59080,-- Darkmaster Gandling
	    -- Stormstout Brewery
	    56637,-- Ook-Ook
	    56717,-- Hoptallus
	    59479,-- Yan-Zhu the Uncasked
	    -- Tempe of the Jade Serpent
	    56448,-- Wise Mari
	    56843,-- Lorewalker Stonestep
	    59051,-- Strife
	    59726,-- Peril
	    58826,-- Zao Sunseeker
	    56732,-- Liu Flameheart
	    56762,-- Yu'lon
	    56439,-- Sha of Doubt
	    -- Mogu'shan Palace
	    61444,-- Ming the Cunning
	    61442,-- Kuai the Brute
	    61445,-- Haiyan the Unstoppable
	    61243,-- Gekkan
	    61398,-- Xin the Weaponmaster
	    -- Shado-Pan Monastery
	    56747,-- Gu Cloudstrike
	    56541,-- Master Snowdrift
	    56719,-- Sha of Violence
	    56884,-- Taran Zhu
	    -- Gate of the Setting Sun
	    56906,-- Saboteur Kip'tilak
	    56589,-- Striker Ga'dok
	    56636,-- Commander Ri'mok
	    56877,-- Raigonn
	    -- Siege of Niuzao Temple
	    61567,-- Vizier Jin'bak
	    61634,-- Commander Vo'jak
	    61485,-- General Pa'valak
	    62205,-- Wing Leader Ner'onok

	    -- Training Dummies --
	    46647,-- Level 85 Training Dummy
	    67127,-- Level 90 Training Dummy

	    -- Instance Bosses --
	    boss1,--Boss 1
	    boss2,--Boss 2
	    boss3,--Boss 3
	    boss4,--Boss 4
	    boss5,--Boss 5
	}
    local BossUnits = BossUnits

    if UnitExists(Unit2) then
        local npcID = tonumber(string.match(UnitGUID(Unit2),"-(%d+)-%x+$"))--tonumber(UnitGUID("target"):sub(6,10),16)

        if (UnitClassification(Unit2) == "rare" or UnitClassification(Unit2) == "rareelite" or UnitClassification(Unit2) == "worldboss" or (UnitClassification(Unit2) == "elite" and UnitLevel("target") >= UnitLevel("player")+3) or UnitLevel(Unit2) < 0)
            --and select(2,IsInInstance())=="none"
            and not UnitIsTrivial(Unit2)
        then
            return true
        else
            for i=1,#BossUnits do
                if BossUnits[i] == npcID then
                    return true
                end
            end
            return false
        end
    else
        return false
    end
end


function amStealthedUnit(Unit)
	if Unit == nil then
		return false
	end
	local StealthSpell = {
		1784,	-- DZ 潜行
		114018,	-- DZ 潜伏帷幕
		51755,	-- LR 伪装
		66,	-- FS 隐形术
		119032,	-- MS 幽灵伪装
		5215,	-- 猫德 潜行
		58984,	-- 暗夜精灵 影遁
	}
	for i=1,#StealthSpell do
	       local  name = GetSpellInfo(StealthSpell[i]);
		if UnitBuff(Unit,tostring(name)) ~= nil then
			return true
		end
	end
	return false
end


function FHGetRangeRadianStealthedUnit(jl,Degrees,spellName)
         
            for i = 1, #FHenemiesTable do
                    local thisUnit = FHenemiesTable[i].unit
                    if FHObjectDistance("player",thisUnit) < jl and FHgetFacing(thisUnit,Degrees) == true and FHINSight(thisUnit) == true and amStealthedUnit(thisUnit) == true  and UnitIsDeadOrGhost(thisUnit) == false then
                      

                      ---检测隐形目标
		        
                         
			    
			    local name, rank, icon, castTime, minRange, maxRange, spellId = GetSpellInfo(spellName) 
                            local Facing = ObjectFacing("player");
			    
			      if amSpellCooldown(spellId) == 0 and amStealthedUnit(thisUnit) == true then   
			       
			       ---FaceDirection(GetAnglesBetweenObjects("player",thisUnit));
			       AutoFaceTarget2(thisUnit);
				
				if IsAoEPending() then

                                        local X1,Y1,Z1 = ObjectPosition(thisUnit)
					CastSpellByName(spellName,"player");
					ClickPosition(X1,Y1,Z1,true);
					--FaceDirection(Facing);
					
			        else
                                        CastSpellByName(spellName);
					--FaceDirection(Facing);
					
				end
				return true;
			      end
                    
  
                    end
            end

      return false;
end


function FHGetRangeRadianOTUnit(jl,Degrees,spellName)
         
            for i = 1, #FHenemiesTable do
                    local thisUnit = FHenemiesTable[i].unit
                    if FHObjectDistance("player",thisUnit) < jl and FHgetFacing(thisUnit,Degrees) == true and FHINSight(thisUnit) == true then
                   
                                             ---检测范围内仇恨值不是自己的非boss目标
		           local name, rank, icon, castTime, minRange, maxRange, spellId = GetSpellInfo(spellName)
                           local threatpct = select(3,UnitDetailedThreatSituation("player",thisUnit))
                           local Facing = ObjectFacing("player");

		           if amLongTimeCCed(thisUnit) == false and UnitAffectingCombat(thisUnit) == true and UnitIsPlayer(thisUnit) == false and (threatpct == nil or threatpct < 100) and amisBoss(thisUnit) == false  and not UnitIsDeadOrGhost(thisUnit)  and amSpellCooldown(spellId) == 0 and amcd then
			               --FaceDirection(GetAnglesBetweenObjects("player",thisUnit));  --自动转向
				       --CastSpellByName(spellName,thisUnit);
				       AutoFaceTarget2(thisUnit)
				       
				       amrun(spellName,thisUnit);
                                       --FaceDirection(Facing);
				       return true;
				       
	                        
                           end

                    end
	    end
      return false;
end

function FHGetRangeRadianAuraUnit(jl,Degrees,spellName1,HP1,spellName2)
local dotchecktime = 0;
       if dotchecktime ==0 or GetTime() - dotchecktime  > 0.5 then
	dotchecktime = GetTime()  
            for i = 1, #FHenemiesTable do
                    local thisUnit = FHenemiesTable[i].unit
                    if FHObjectDistance("player",thisUnit) < jl and FHgetFacing(thisUnit,Degrees) == true and FHINSight(thisUnit) == true then
                   
                                             ---检测范围内不带有指定debuff的目标
		       
                           --local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId, canApplyAura, isBossDebuff, value1, value2, value3 = UnitDebuff(thisUnit,spellName1,nil,"PLAYER")
			   local name, rank, icon, castTime, minRange, maxRange, spellId = GetSpellInfo(spellName2)
                           local Facing = ObjectFacing("player");

		           --if amLongTimeCCed(thisUnit) == false and UnitAffectingCombat(thisUnit) == true and ( name == nil or expirationTime - GetTime() <= spellTime1) and unitCaster == "player" then
			   if amLongTimeCCed(thisUnit) == false  and UnitAffectingCombat(thisUnit) == true  and UnitDebuff(thisUnit,spellName1,nil,"player") == nil and UnitIsUnit("target",thisUnit) == false and UnitIsDeadOrGhost(thisUnit) == false and UnitIsCorpse(thisUnit) == false and UnitCanAttack("player",thisUnit) == true and amSpellCooldown(spellId) == 0 and amcd and UnitHealth(thisUnit) >= HP1 * 10000 then
			               
			               --FaceDirection(GetAnglesBetweenObjects("player",thisUnit));  --自动转向
				       --CastSpellByName(spellName2,thisUnit);
                                       AutoFaceTarget2(thisUnit);
				       amrun(spellName2,thisUnit);
                                       --FaceDirection(Facing);
				       return true;
				       
	                        
                           end

                    end
	    end
	 end
      return false;
end

function FHGetRangeRadianHPUnit(jl,Degrees,HPlevel,spellName)
         
            for i = 1, #FHenemiesTable do
                    local thisUnit = FHenemiesTable[i].unit
                    if FHObjectDistance("player",thisUnit) < jl and FHgetFacing(thisUnit,Degrees) == true and FHINSight(thisUnit) == true then
                   
                                             ---检测范围内血量值低于设定值的目标
		            local name, rank, icon, castTime, minRange, maxRange, spellId = GetSpellInfo(spellName)
                           local UnitHPLevel = UnitHealth(thisUnit)/UnitHealthMax(thisUnit)*100
                           local Facing = ObjectFacing("player");

		           if amLongTimeCCed(thisUnit) == false and UnitAffectingCombat(thisUnit) == true and UnitHPLevel < HPlevel and not UnitIsUnit("target",thisUnit) and not UnitIsDeadOrGhost(thisUnit)   and amSpellCooldown(spellId) == 0 and amcd then
			               --FaceDirection(GetAnglesBetweenObjects("player",thisUnit));  --自动转向
                                       AutoFaceTarget2(thisUnit);
                                       TargetUnit(thisUnit);
				       --amrun("/target "..thisUnit);
				       --CastSpellByName(spellName,thisUnit);
				       amrun(spellName,thisUnit);
                                       --RunMacroText("/targetlasttarget");
                                       --FaceDirection(Facing);
				       return true;
				       
	                        
                           end
                          
                    end
	    end
      return false;
end


function FHKeepDistanceWithUnit(Unit,Distance)
local DistancePrecision = 3;
		if Unit then
			if not UnitExists(Unit) or not UnitIsVisible(Unit) then
				StopFollowing ();
			elseif FHObjectDistance("player",Unit) > Distance + DistancePrecision then
				
				local X, Y, Z = GetPositionBetweenObjects(Unit,"player",Distance);
				
				if not TargetX or math.sqrt(((X - TargetX) ^ 2) + ((Y - TargetY) ^ 2) + ((Z - TargetZ) ^ 2)) > 0.1 then
					
					FaceDirection(GetAnglesBetweenObjects("player", Unit));
					TargetX, TargetY, TargetZ = X, Y, Z;
					MoveTo(TargetX, TargetY, TargetZ);
				end
			end
		end
end

--判断是否可以吃治疗物品,进入战斗只能吃一次，如糖、治疗药水   BY:鬼谷子
function amHealthItemCanBeUsed()
    local amSweetisok = false
    if amsweetcount == nil then amsweetcount = 0 end
    if GetItemCount(5512,false,true) > 0 then
        if not UnitAffectingCombat("player") and select(3,GetItemCooldown(5512)) ~= 0 then
            amsweetcount = GetItemCount(5512,false,true)
            amSweetisok = true                
        elseif UnitAffectingCombat("player") then
            if amsweetcount ~= GetItemCount(5512,false,true) then
                amSweetisok = false
            else 
                amSweetisok = true
            end                
        end
    elseif GetItemCount(5512,false,true) == 0 then
        amsweetcount = 0
        amSweetisok = false
    end
    return amSweetisok
end

function amHealthItemCanBeUsed_bak()


        if select(2,GetItemCooldown(5512))==0 and select(3,GetItemCooldown(5512)) ~= 0 and GetItemCount(5512) > 0 then 
          return true
       end

return false
end


-- 技能正在执行时按下鼠标右键
function amIsCurrentMouse2(Spell)

	if IsCurrentSpell(Spell) then
		ammouse(0,0,3);
		return true;
	end
	return false;
end

---监测套装数量代码：by:鬼谷子
-- if TierScan("T17")>=2 then
function TierScan(TNum)
    local equippedItems = 0;
    local myClass = select(2,UnitClass("player"));
    local thisTier = string.upper(TNum);
    local sets = {
        ["T17"] = {
            ["DRUID"] = {
                115540, -- chest
                115541, -- hands
                115542, -- head
                115543, -- legs
                115544 -- shoulder
            },
            ["DEATH KNIGHT"] = {
                115535, -- legs
                115536, -- shoulder
                115537, -- chest
                115538, -- hands
                115539 -- head
            },
            ["HUNTER"] = {
                115545, -- head
                115546, -- legs
                115547, -- shoulder
                115548, -- chest
                115549 -- hands
            },
            ["MAGE"] = {
                115550, -- chest
                115551, -- shoulder
                155552, -- hands
                155553, -- head
                155554 -- legs
            },
            ["MONK"] = {
                115555, -- hands
                115556, -- head
                115557, -- legs
                115558, -- chest
                115559 -- shoulder
            },
            ["PALADIN"] = {
                115565, -- shoulder
                115566, -- chest
                115567, -- hands
                115568, -- head
                115569 -- legs
            },
            ["PRIEST"] = {
                115560, -- chest
                115561, -- shoulder
                115562, -- hands
                115563, -- head
                115564 -- legs
            },
            ["ROGUE"] = {
                115570, -- chest
                115571, -- hands
                115572, -- head
                115573, -- legs
                115574 -- shoulder
            },
            ["SHAMAN"] = {
                115575, -- legs
                115576, -- shoulder
                115577, -- chest
                115578, -- hands
                115579 -- head
            },
            ["WARLOCK"] = {
                115585, -- hands
                115586, -- head
                115587, -- legs
                115588, -- chest
                115589 -- shoulder
            },
            ["WARRIOR"] = {
                115580, -- legs
                115581, -- shoulder
                115582, -- chest
                115583, -- hands
                115584 -- head
            }
        }
    }
    -- scan every items
    for i=1, 19 do
        -- if there is an item in that slot
        if GetInventoryItemID("player", i) ~= nil then
            -- compare to items in our items list
            for j = 1, 5 do
            	--print(sets[thisTier][myClass][j]) 
                if GetItemInfo(GetInventoryItemID("player", i)) == GetItemInfo(sets[thisTier][myClass][j]) then
                    equippedItems = equippedItems + 1;
                end
            end
        end
    end
    return equippedItems;
end





function FHGetRangeRadianTotem(Type,jl,Degrees,spellName)
       
            for i = 1, #FHenemiesTable do
                    local thisUnit = FHenemiesTable[i].unit
                    if FHObjectDistance("player",thisUnit) < jl and FHgetFacing(thisUnit,Degrees) == true and FHINSight(thisUnit) == true then
                      

                      ---检测图腾目标
		      local EnemyTotem = {
		             2484,	-- 地缚图腾
		             5394,	-- 治疗之泉图腾
		             8177,	-- 根基图腾
		             8143,	-- 战栗图腾
		             108269,	-- 电能图腾
		             98008,	-- 灵魂链接图腾
		             108280,	-- 治疗之潮图腾
	              }
		  
	              for i=1,#EnemyTotem do
	                    local Totemname = GetSpellInfo(EnemyTotem[i]);
	    		    local name, rank, icon, castTime, minRange, maxRange, spellId = GetSpellInfo(spellName) 
                            local Facing = ObjectFacing("player");
			    
			      if amSpellCooldown(spellId) == 0 and Totemname ==  ObjectName(thisUnit) and UnitHealth(thisUnit) > 0 then   
			       AutoFaceTarget2(thisUnit);
			        --FaceDirection(GetAnglesBetweenObjects("player",thisUnit));
				--CastSpellByName(spellName,thisUnit);
				
				amrun(spellName,thisUnit);
                                --FaceDirection(Facing);
				return true;

			      end
                    
  
                      end
                end
	   end 

      return false;

end



function amCheckRace(UnitId1,UnitRace1)
	local raceName, raceId = UnitRace(UnitId1);
	if raceName == UnitRace1 then
	    return true;
	end
	return false;
end

function FHCountGos()
  local countgos = 0;
    if GetTime() - lastgoscount  > 0.1 then
	lastgoscount = GetTime();
         for i = 1,GetObjectCount() do

                if    ObjectType(GetObjectWithIndex(i)) == 257 and FHIsObjectCreatedBy("player",GetObjectWithIndex(i)) then
		    
                     countgos = countgos + 1;
                     
		end
	end
     end
	return countgos;
end


-----------fish---------


local function FHgetBobber()
	local BobberName = "鱼漂"
	local Total = GetObjectCount(TYPE_GAMEOBJECT)
	local BobberDescriptor = nil
	
	for i = 1, Total,1 do
		local Object = GetObjectWithIndex(i)
		local ObjectName2 = ObjectName(ObjectPointer(Object))

		if ObjectName2 == BobberName then
				return Object
		end

	end
end

local function FHisBobbing()
        local animation_offset = 0x1E0
	---local bobbing = ObjectField(getBobber(),animation_offset,SInt)
        local bobbing = ObjectField(FHgetBobber(),animation_offset,Types.Byte)
	if bobbing == 1 then
		return true
	else
		return false
	end
end

function FHGoFish()
	local BobberObject = FHgetBobber()
	if BobberObject then
		if FHisBobbing() == true then
			--print("|cffff6060[|r|cFF00FFFFGCFishbot|cffff6060]|r 一条鱼 !")
			ObjectInteract(FHgetBobber())
			return true;
		end
	else
		CastSpellByName(tostring(select(1,GetSpellInfo(131474))));
		return true;
	end
    return false;
end

-------------------fish end---------
function amCheckSpec_bak(unit,CheckSpec)        ----通过天赋确定职责
   local TankSpec = {
         66,    --防护  qs
	 250,   --鲜血  dk
	 104,   --守护  xd
	 268,   --酒仙  ws
	 73,    --防护  zs
	}
   local HealSpec = {
         65,    --神圣  qs
         105,   --恢复  xd
	 270,   --织雾  ws
	 264,   --恢复  sm
	 257,   --神圣  ms
	 256,   --戒律  ms
         }
  
	           local Specname = GetInspectSpecialization(unit);
		   if 	Specname ~= 0 then    
			    if CheckSpec == 1 then
			      for i=1,5 do	    		    			    
			          if Specname == TankSpec[i] then   
					return true;
				  end
			      end
			    end
 			    if CheckSpec == 2 then
			       for j=1,6 do
			         if Specname == HealSpec[j] then   
					return true;
			         end
			       end
			    end
                 end
  return false;
end


function amCheckSpec(unit,CheckSpec)      ------通过职责选择确定职责
        local Role;
	if CheckSpec == 0 then
            Role = "TANK"
	elseif CheckSpec == 1 then
            Role = "HEALER"
	elseif CheckSpec == 2 then
            Role = "DAMAGER"
	end
	local roleToken = UnitGroupRolesAssigned(unit);
	if roleToken == Role then
	    return true;
	end
	return false;
end

function amCheckBuffStealable(Unit)           ----检测是否有可偷取buff或驱散buff
	for i=1,40 do 
	local name, _, _, _, _, _, _, _, isStealable = UnitBuff(Unit,i); 
		if name then
		   if isStealable then
			return true;
		   end
	       end
	end;
	return false;
end

function amUnitInfront(unit1, unit2)
            if not (UnitExists(unit1) and UnitExists(unit2)) then return end
            local x1, y1, z1 = ObjectPosition(unit1)
            local x2, y2, z2 = ObjectPosition(unit2)
            local facing = ObjectFacing(unit1)
            local angle = atan2(y1 - y2, x1 - x2) - deg(facing)
            if angle < 0 then
                angle = angle + 360
            end
            return (angle > 120 and angle < 240)
end

function FHAutoLoot(checked)
 local looted = 0;
     
        for i=1,GetObjectCount() do
            if ObjectType(GetObjectWithIndex(i)) == 9 then
                local thisUnit = GetObjectWithIndex(i)
                local hasLoot,canLoot = CanLootUnit(UnitGUID(thisUnit))
                local inRange = FHObjectDistance("player",thisUnit) < 2
                if UnitIsDeadOrGhost(thisUnit) then
		    
                     if hasLoot and canLoot then   
                           if checked == 1 then
			       UseItemByName(GetItemInfo(60854),thisUnit)  ---工程拾取器
                               if GetNumLootItems() > 0 then
                                   return true
                               end
                               looted = 1
			   else
			       if inRange then
			           InteractUnit(thisUnit)
				   if GetNumLootItems() > 0 then
                                        return true
                                   end
                                   looted = 1
			       else 
			           local X, Y, Z = PositionBetweenObjects(2,thisUnit,"player");
			           FaceDirection(GetAnglesBetweenObjects("player",thisUnit));
				   MoveTo(X, Y, Z);
                                   InteractUnit(thisUnit);
				   if GetNumLootItems() > 0 then
                                        return true
                                   end
                                  
                                   looted = 1
			       end
			   end
   
                    end
	     
                end
		
            end
       end
        if looted==1 and GetNumLootItems() == 0 then
            ClearTarget()
            looted=0
        end

	return false;

end



function fhtest()
   for i=1,GetObjectCount() do
        if FHObjectDistance("player",GetObjectWithIndex(i)) < 10 then
	print(ObjectType(GetObjectWithIndex(i)))
        print(ObjectName(GetObjectWithIndex(i)))
	end
   end
end

function fhtest2()
   	print(#FHenemiesTable)
        --print(ObjectName(GetObjectWithIndex(i)))
end

function fhtest3()
     for i=1,#FHenemiesTable do
   	print(ObjectType(FHenemiesTable[i]))
        print(ObjectName(FHenemiesTable[i]))
     end
        --print(ObjectName(GetObjectWithIndex(i)))
end

function FHCheck()
	if FireHack == nil then
           Wowam_Message("FireHack未解锁");
           return;
        else
            --makeFHenemiesTable(55);
	    Wowam_Message("FireHack已解锁");
	    --print(#FHenemiesTable);
        end
end

function table_is_empty(t)
        return _G.next(t) == nil
end

function table_is_clear(t)
        for i = #t, 1, -1 do
             table.remove(t, i)
        end
end
------------------test-----------------

-----------enemy
function FHmakeenemiesTable(maxDistance)
	local  maxDistance = maxDistance or 50
	if not table_is_empty(FHenemiesTable) then 
		for i = #FHenemiesTable, 1, -1 do
		-- here i want to scan the enemies table and find any occurances of invalid units
		     if not ObjectExists(FHenemiesTable[i].unit)  then
			-- i will remove such units from table
			table.remove(FHenemiesTable,i)
		     end
		end
                FHenemiesvaluechange()
		-------------------------
		--for i = 1, #FHenemiesTable, 1 do
		    
		  -- _G[FHenemies..i] = UnitGUID(FHenemiesTable[i].unit);
		--end
		--------------------
	end
	
	if table_is_empty(FHenemiesTable) or FHenemiesTableTimer == nil or FHenemiesTableTimer <= GetTime() - 1 then
	--if FHenemiesTableTimer <= GetTime() - 0.1 then
		FHenemiesTableTimer = GetTime()
		-- create/empty table
		
		if table_is_empty(FHenemiesTable) then
			FHenemiesTable = {}
		else
			table_is_clear(FHenemiesTable)
			
			--FHcleanupEngine()
		end

		-- use objectmanager to build up table
	 	for i = 1, GetObjectCount() do
	 		-- define our unit
		  	local thisUnit = GetObjectWithIndex(i)
	 		-- sanity checks
	 		if FHgetSanity(thisUnit) == true then
  				-- get the unit distance
  				local unitDistance = FHObjectDistance("player",thisUnit)
				-- distance check according to profile needs
  				if unitDistance <= maxDistance then
		  			-- get unit Infos
                                       table.insert(FHenemiesTable,{
				       unit = thisUnit
				       })
   				end
		  	end
	 	end
	 	

	end
       -- for i = 1, #FHenemiesTable do
          --local FHenemies..i = FHenemiesTable[i].unit
	--end
end

-- remove invalid units on pulse
function FHcleanupEngine()
	for i = #FHenemiesTable, 1, -1 do
		-- here i want to scan the enemies table and find any occurances of invalid units
		if not ObjectExists(FHenemiesTable[i].unit) then
			-- i will remove such units from table
			table.remove(FHenemiesTable,i)
		end
	end
end

-- returns true if Unit is a valid enemy
function FHgetSanity(unit)
	if ObjectExists(unit) and bit.band(ObjectType(unit), ObjectTypes.Unit) == 8
	  and UnitIsVisible(unit) == true and FHgetCreatureType(unit) == true
	  and UnitCanAttack(unit, "player") == true and UnitIsDeadOrGhost(unit) == false
	  and (UnitAffectingCombat(unit) or FHisDummy(unit))  and UnitCanAttack("player",unit) == true then
	  	return true
	else
		return false
	end
end

-- if getCreatureType(Unit) == true then
function FHgetCreatureType(Unit)
	local CreatureTypeList = {"Critter","Totem","Non-combat Pet","Wild Pet"}
	for i=1,#CreatureTypeList do
		if UnitCreatureType(Unit) == CreatureTypeList[i] then
			return false
		end
	end
	if not UnitIsBattlePet(Unit) and not UnitIsWildBattlePet(Unit) then
		return true
	else
		return false
	end
end

---dummy
function FHisDummy(Unit)
	if Unit == nil then
		Unit = "target"
	end
    if UnitExists(Unit) and UnitGUID(Unit) then
	    local dummies = {
	        [87329] = "Raider's Training Dummy", -- Lvl ?? (Stormshield - Tank)
	        [88837] = "Raider's Training Dummy", -- Lvl ?? (Warspear - Tank)
	        [87320] = "Raider's Training Dummy", -- Lvl ?? (Stormshield - Damage)
		[87762] = "Raider's Training Dummy", -- Lvl ?? (Warspear - Damage)
	        [31146] = "Raider's Training Dummy", -- Lvl ?? (Ogrimmar,Stormwind,Darnassus,...)
	        [70245] = "Training Dummy", -- Lvl ?? (Throne of Thunder)
	        [88314] = "Dungeoneer's Training Dummy", -- Lvl 102 (Lunarfall - Tank)
	        [88288] = "Dungeoneer's Training Dummy", -- Lvl 102 (Frostwall - Tank)
	        [88836] = "Dungeoneer's Training Dummy", -- Lvl 102 (Warspear - Tank)
	        [87322] = "Dungeoneer's Training Dummy ", -- Lvl 102 (Stormshield,Warspear - Tank)
	    	[87317] = "Dungeoneer's Training Dummy", -- Lvl 102 (Lunarfall - Damage)
	    	[87318] = "Dungeoneer's Training Dummy", -- Lvl 102 (Lunarfall - Damage)
	    	[87761] = "Dungeoneer's Training Dummy", -- Lvl 102 (Frostwall - Damage)
	    	[88906] = "Combat Dummy", -- Lvl 100 (Nagrand)
	    	[89078] = "Training Dummy", -- Lvl 100 (Lunarfall,Frostwall)
	    	[87321] = "Training Dummy", -- Lvl 100 (Stormshield,Warspear - Healing)
	    	[88835] = "Training Dummy", -- Lvl 100 (Warspear - Healing)
	    	[88967] = "Training Dummy", -- Lvl 100 (Lunarfall,Frostwall)
	    	[88316] = "Training Dummy", -- Lvl 100 (Lunarfall - Healing)
	    	[88289] = "Training Dummy", -- Lvl 100 (Frostwall - Healing)
	    	[79414] = "Training Dummy", -- Lvl 95 (Talador)
	        [67127] = "Training Dummy", -- Lvl 90 (Vale of Eternal Blossoms)
	        [46647] = "Training Dummy", -- Lvl 85 (Orgrimmar,Stormwind)
	        [32546] = "Ebon Knight's Training Dummy", -- Lvl 80 (Eastern Plaguelands)
	        [31144] = "Training Dummy", -- Lvl 80 (Orgrimmar,Darnassus,Ruins of Gileas,...)
	        [32543] = "Veteran's Training Dummy", -- Lvl 75 (Eastern Plaguelands)
	        [32667] = "Training Dummy", -- Lvl 70 (Darnassus,Silvermoon,Orgrimar,...)
	        [32542] = "Disciple's Training Dummy", -- Lvl 65 (Eastern Plaguelands)
	        [32666] = "Training Dummy", -- Lvl 60 (Orgrimmar,Ironforge,Darnassus,...)
	        [32541] = "Initiate's Training Dummy", -- Lvl 55 (Scarlet Enclave)
	        [32545] = "Initiate's Training Dummy", -- Lvl 55 (Eastern Plaguelands)
	        [60197] = "Scarlet Monastery Dummy",
	        [64446] = "Scarlet Monastery Dummy",
	    }
        if dummies[tonumber(string.match(UnitGUID(Unit),"-(%d+)-%x+$"))] ~= nil then
            return true
        end
    end
    return false
end

function FHenemiesvaluechange()
   if table_is_empty(FHenemiesTable) then
       return
   else

       for i=1,#FHenemiesTable do
		_G["FHenemies"..tostring(i)] = FHenemiesTable[i].unit;
		
       end
   end
end
--------------enemy
local amBloodLustList = {
      2825,           -- Bloodlust
      80353,          -- Timewarp
      32182,          -- Heroism
      90355,          -- Ancient Hysteria
      146555,         -- Drums of Rage
      }
function amBloodLust(unit)
    for i = 1,#amBloodLustList do
	local  name = GetSpellInfo(amBloodLustList[i]);
	if UnitBuff(unit,tostring(name)) ~= nil then
	    return true
	end
    end
	return false
end

------------------蔡蔡
function amDANCE()
   if UnitAffectingCombat("player") == false then
       RunMacroText("/DANCE") 
       return true
   end
    return false
end

-------------------3X
function amCheckMelee(unit)
       if(
			        	GetInspectSpecialization(unit) == 70 or --惩戒
			        	GetInspectSpecialization(unit) == 71 or --武器战
			        	GetInspectSpecialization(unit) == 72 or --狂暴战
			        	GetInspectSpecialization(unit) == 103 or --猫德
			        	GetInspectSpecialization(unit) == 251 or --冰dk
			        	GetInspectSpecialization(unit) == 252 or --邪dk
			        	GetInspectSpecialization(unit) == 259 or --刺杀贼
			        	GetInspectSpecialization(unit) == 260 or --战斗贼
			        	GetInspectSpecialization(unit) == 261 or --敏锐贼
			        	GetInspectSpecialization(unit) == 263 or --增强萨
			        	GetInspectSpecialization(unit) == 269    --踏风武僧
			        	)  then
        return true
        end
  return false
  end

  --------------GCD Start--------------
local am_BASE_GCD = {
    ["DEATHKNIGHT"]    = { 1.0 },
    ["DRUID"]        = { 1.5 },
    ["HUNTER"]        = { 1.0 },
    ["MAGE"]        = { 1.5 },
    ["MONK"]        = { 1.5 },
    ["PALADIN"]        = { 1.5 },
    ["PRIEST"]        = { 1.5 },
    ["ROGUE"]        = { 1.0 },
    ["SHAMAN"]        = { 1.5 },
    ["WARLOCK"]        = { 1.5 },
    ["WARRIOR"]        = { 1.5 },
}

local am_MAX_GCD = nil
local am_NOW_GCD = nil

function am_GetBaseGCD()
    local gcd
    local baseGCD = am_BASE_GCD[select(2, UnitClass("player"))]

    if baseGCD then
        gcd = baseGCD[1]
    else
        gcd = 1.5
    end
    return gcd
end

function am_GetMaxGCD()
    if am_MAX_GCD==nil
    then
        am_RegGCD()
        return am_GetBaseGCD()
    else
        return am_MAX_GCD
    end
end


function am_GetNowGCD()
    if am_NOW_GCD==nil
    then
        am_RegGCD()
        return am_GetBaseGCD()
    else
        return am_NOW_GCD
    end
end

function am_RegGCD()    
    am_GCD_EVENT=am_GCD_EVENT or CreateFrame("frame")
    am_GCD_EVENT:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
    am_GCD_EVENT:SetScript("OnEvent",function(_,_,_,e,_,_,_,_,_,_,_,_,_,_)
            if(e=="SPELL_CAST_SUCCESS")
            then  
                local _,x=GetSpellCooldown(61304)
                if (x>0)
                then
                    if UnitAffectingCombat("player")
                    then
                        am_NOW_GCD=x
                        --print("NOW "..x.."")
                    else
                        am_MAX_GCD=x
                        am_NOW_GCD=x
                        --print("MAX "..x.."")
                    end
                end
            end 
    end)
end

--------------GCD End--------------

function amCheckHealer(unit)
       if(
			        	GetInspectSpecialization(unit) == 105 or --奶德
			        	GetInspectSpecialization(unit) == 270 or --织雾武僧
			        	GetInspectSpecialization(unit) == 65 or --奶骑
			        	GetInspectSpecialization(unit) == 256 or --神牧
			        	GetInspectSpecialization(unit) == 257 or --戒律牧
			        	GetInspectSpecialization(unit) == 264  --奶萨
			        	)  then
        return true
        end
  return false
end

function amHasPet()
       
  return HasPetUI()
end

--统计技能可用数量
function amGetSpellCharges(spellName)
local currentCharges
local spellID = select(7,GetSpellInfo(spellName))
	
	if GetSpellCharges(spellID) ~= nil then
	currentCharges = select(1,GetSpellCharges(spellID));
		return currentCharges;
	else 
	return -1;
	end
end

----------图腾
local objectcreater_offset = 0x30
-- Test whether an object is created/belongs to another object.
--
-- @return True if it's created by the other object.
function FHIsObjectCreatedBy(owner, object)
  return tonumber(ObjectDescriptor(object, objectcreater_offset, Types.ULong)) == ObjectGUID(owner)
end
-----------------------------暗影幻灵统计

function amSpaMoveCount()
     
         return tonumber(SpaCount);

end

function amorbTotal()
      --local orbnum = TotalOrb(event, ...)
      return 0
end
--------------------------------------------FH自动目标选择
------------------------------------近战  BY：htt0528
function FHmeleeautotarget(jl)
local nowTarget=nil

--FH未解锁返回
if FireHack == nil then 
print("FH未解锁") 
return true 
end

--坐骑上返回
if IsMounted() then 
return true 
end

--不在战斗返回
if not UnitAffectingCombat("player") then 
return true 
end

--有目标且不可攻击返回
if UnitGUID("target")~=nil and not UnitCanAttack("player","target") then 
return true 
end

--当前目标不在技能范围进入判断（RANGE范围内找最近的 在视野、在战斗、可攻击目标）
--local _, _, _, _, _, SPELLID = GetSpellInfo(SPELLNAME)
--if IsSpellInRange(SPELLID, "target")~=1 then
--[[
if UnitGUID("target")~=nil then 
    if FHObjectDistance("player","target") > jl then 
      local outrange = true
    end
end
]]

if UnitGUID("target") == nil  or (UnitGUID("target")~=nil and FHObjectDistance("player","target") > jl) then
    for i = 1, #FHenemiesTable do
        local thisUnit = FHenemiesTable[i].unit
        if FHObjectDistance("player",thisUnit) < jl and FHgetFacing(thisUnit,Degrees) == true and FHINSight(thisUnit) == true and UnitIsDeadOrGhost(thisUnit) == false and UnitCanAttack("player",thisUnit) == true then
            --range=FHObjectDistance("player",thisUnit)
            --nowTarget=thisUnit
	    TargetUnit(thisUnit) --选中目标
            return true; 
        end
    end
    --[[
    if nowTarget and (UnitGUID(nowTarget) ~= UnitGUID("target") or UnitGUID("target") == nil) then
        TargetUnit(nowTarget) --选中目标
        return true;
    end
    ]]
end




--自己在战斗但RANGE内找不到符合条件的目标返回
--[[
if not UnitAffectingCombat("target") then 
  return true 
end
]]
return false;
end


------------------远程

local ambesttarget = {
"邪火碎",
"邪火喷",
"邪火巨", 
"邪火攻", 
"易爆火", 
"血球", 
"阴暗构", 
"血缚之", 
"血缚精", 
"腐化的泰", 
"邪影守望", 
"邪能渡鸦", 
"萨格雷", 
"萨格雷统", 
"野生纵", 
"不稳定的空", 
"上古", 
"地狱火", 
"魔火", 
"邪脉", 
"炎狱召", 
"虚空之心", 
"地狱火末",
}

function FHTargetAutoChoose(jl,Degrees)

--FH未解锁返回
if FireHack == nil then 
print("FH未解锁") 
return true 
end

--坐骑上返回
if IsMounted() then 
return true 
end

--不在战斗返回
if not UnitAffectingCombat("player") then 
return true 
end

--有目标且不可攻击返回
if UnitGUID("target")~=nil and not UnitCanAttack("player", "target") then 
return true 
end

   --if UnitGUID("target") == nil and UnitAffectingCombat("player") then
   if UnitGUID("target") == nil  or (UnitGUID("target")~=nil and FHObjectDistance("player","target") > jl) then
     for i = 1, #FHenemiesTable do
           local thisUnit = FHenemiesTable[i].unit
           if FHObjectDistance("player",thisUnit) < jl and FHgetFacing(thisUnit,Degrees) == true and FHINSight(thisUnit) == true and UnitIsDeadOrGhost(thisUnit) == false and UnitCanAttack("player",thisUnit) == true then
             
	       ----------目标优选
             for j = 1,#ambesttarget do
	       if string.match(UnitName(thisUnit),ambesttarget[j]) ~= nil then
	          TargetUnit(thisUnit);
		  return true;
		  --break;
	       end
	     end
	         ---- 随便选个
           TargetUnit(thisUnit);
	   return true;
		     
          end
    end



    end
    return false;

end

-------------------------------
function msGetSpellNumber(spell,num)             ---------By:Leckie
	local text = GetSpellDescription(spell);
	local v = {};
	local i = 1;
	if text then
		while true do
			j = string.find(text,"%d,%d")
			if not j then
				break
			end
			local firsthalf = string.sub(text,1,j)
			local lasthalf = string.sub(text,j+2,#text)
			text = firsthalf .. lasthalf
		end
		for k in string.gmatch(text, "%d+") do
			if tonumber(k) >100 then
				v[i] = tonumber(k);
				i = i + 1;
			end
		end
	end
	return v[num] or -1;
end
