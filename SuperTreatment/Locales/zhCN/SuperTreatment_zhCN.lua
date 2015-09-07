if (GetLocale() ~= 	"zhCN") then return; end;

local GetSpellInfo = GetSpellInfo;
local UnitName = UnitName;
local UnitPlayerOrPetInParty = UnitPlayerOrPetInParty;
local UnitPlayerOrPetInRaid = UnitPlayerOrPetInRaid;
local GetRaidRosterInfo = GetRaidRosterInfo;
local UnitClass = UnitClass;
local UnitGroupRolesAssigned = UnitGroupRolesAssigned;


local aml = aml;
local UnitHealth = UnitHealth;
local UnitHealthMax = UnitHealthMax;
local UnitMana = UnitMana;
local UnitManaMax = UnitManaMax;
local UnitDebuff = UnitDebuff;
local format = format;
local tonumber = tonumber;
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






local UnitDB =SuperTreatmentDBF["Unit"];
local RDB =SuperTreatmentDBF["Unit"]["RaidList"];
local Config = SuperTreatmentDBF["Config"]
--SuperTreatmentInf["MTList"]={};

SuperTreatmentInf["Spells_Index"]=nil;



local ST = SuperTreatmentInf;
local STUP = SuperTreatmentInf["UP"]
local RaidList_OK;

UnitDB["MTList"]={};
UnitDB["MTList"]["Default"]={};
UnitDB["MTList"]["Custom"]={};

SuperTreatmentDBF["Unit"]["ExcludeTarget"]={};


SuperTreatmentInf["Copyexchange"]={};
SuperTreatmentInf["Copyexchange"]["CastProgram"]=nil;

SuperTreatmentDBF["AddOnMemory"]={};
SuperTreatmentDBF["AddOnMemory"]["max"]=60;
SuperTreatmentDBF["AddOnMemory"]["on"]=false;
SuperTreatmentDBF["AddOnMemory"]["Leftfighting"]=false;

SuperTreatmentDBF["AddOnMemory"]["inf"]=false;
	
	
	
--[[
SuperTreatmentInf["CastSpellInf"]={};
SuperTreatmentInf["CastSpellInf"]["spell"]={};
SuperTreatmentInf["CastSpellInf"]["HEAL_PREDICTION"]={};
--]]

ST.ForTime=GetTime();
ST.gospellname=nil;
ST.gospellnameTime = GetTime();
ST.GospellnameButtontext =SuperTreatmentFrame:CreateFontString();
ST.GospellnameButtontext:SetFontObject("GameFontNormal");
ST.GospellnameButtontext:SetPoint("TOPLEFT",SuperTreatmentFrame,"TOPLEFT",0,-98);

ST.GospellnameButtontext:SetWidth(200);
ST.GospellnameButtontext:SetHeight(32);
ST.GospellnameButtontext:SetJustifyH("LEFT")
--------------------------------------------------------------


ST_UpUnitFrame = CreateFrame("Frame");
ST_UpUnitFrame:RegisterEvent("PARTY_MEMBER_ENABLE");
ST_UpUnitFrame:RegisterEvent("PARTY_MEMBER_DISABLE");
ST_UpUnitFrame:RegisterEvent("PARTY_LEADER_CHANGED");
ST_UpUnitFrame:RegisterEvent("PARTY_CONVERTED_TO_RAID");
ST_UpUnitFrame:RegisterEvent("PARTY_MEMBERS_CHANGED");
ST_UpUnitFrame:RegisterEvent("RAID_ROSTER_UPDATE");
ST_UpUnitFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");

ST_UpUnitFrame:RegisterEvent("UPDATE_BATTLEFIELD_STATUS");
ST_UpUnitFrame:RegisterEvent("UNIT_NAME_UPDATE");
ST_UpUnitFrame:RegisterEvent("UNIT_CONNECTION");
ST_UpUnitFrame:RegisterEvent("RAID_ROSTER_UPDATE");
ST_UpUnitFrame:RegisterEvent("GROUP_ROSTER_UPDATE");





--UPDATE_BATTLEFIELD_STATUS
	--UNIT_NAME_UPDATE
	--UNIT_CONNECTION
	--PARTY_MEMBER_ENABLE
	--PARTY_MEMBER_DISABLE
	--PARTY_LEADER_CHANGED


--uni tfr
--ST_UpUnitFrame:RegisterEvent("CHAT_MSG_RAID_WARNING");
--ST_UpUnitFrame:RegisterEvent("CHAT_MSG_RAID_LEADER");
--ST_UpUnitFrame:RegisterEvent("CHAT_MSG_RAID");
--ST_UpUnitFrame:RegisterEvent("CHAT_MSG_PARTY_LEADER");
--ST_UpUnitFrame:RegisterEvent("UI_ERROR_MESSAGE");
--ST_UpUnitFrame:RegisterEvent("CHAT_MSG_WHISPER");
--ST_UpUnitFrame:RegisterEvent("UNIT_COMBAT");
--ST_UpUnitFrame:RegisterEvent("COMBAT_TEXT_UPDATE");




--UnregisterEvent
--CHAT_MSG_PARTY
--[[
ST_CastSpellFrame = CreateFrame("Frame");
ST_CastSpellFrame:RegisterEvent("UNIT_HEAL_PREDICTION"); -- 获得治疗目标
ST_CastSpellFrame:RegisterEvent("UNIT_SPELLCAST_SENT"); -- 施放目标技能

ST_CastSpellFrame:RegisterEvent("UNIT_SPELLCAST_STOP");
ST_CastSpellFrame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED");
ST_CastSpellFrame:RegisterEvent("UNIT_SPELLCAST_FAILED");
ST_CastSpellFrame:RegisterEvent("UNIT_SPELLCAST_INTERRUPTED");
ST_CastSpellFrame:RegisterEvent("UNIT_COMBAT");

--]]

function stprint(...)
	
	if SuperTreatmentAllDBF.show_Hide_StInf then
		return;
	end
	
	return print(...);
end


function stGetClassicon(Class,Size)
	return "|TInterface\\AddOns\\SuperTreatment\\media\\"..(Class or "")..":"..Size.."|t";
end

function DecompositionValue(v)

	return {strsplit("_",v)};
	
end



local function OnLoad()
	
	
	
	UnitDB =SuperTreatmentDBF["Unit"];
	
	SlashCmdList["st"]=SuperTreatment_comman;
	SLASH_st1 = "/st";
	
	SlashCmdList["srun"]=SuperTreatment_run	;		
	SLASH_srun1 = "/srun";
	
	
	
	if not SuperTreatmentDBF["Unit"]["IsInfListIndex"] then
		SuperTreatmentDBF["Unit"]["IsInfListIndex"]={};
	end
	
	if not SuperTreatmentDBF["Unit"]["ExcludedGroup"] then
		SuperTreatmentDBF["Unit"]["ExcludedGroup"]={};
	end
	
	if not SuperTreatmentDBF["Unit"]["ExcludeTarget"] then
		SuperTreatmentDBF["Unit"]["ExcludeTarget"]={};
	end
	
	if not SuperTreatmentDBF["Unit"]["IsInfList"] then
		SuperTreatmentDBF["Unit"]["IsInfList"]={};
	end
	
	if not SuperTreatmentDBF["Unit"]["IsInfListSet"] then
		SuperTreatmentDBF["Unit"]["IsInfListSet"]={};
	end
	
	local tbl = SuperTreatmentDBF["Unit"]["IsInfListSet"];
		
	if tbl["CHAT_MSG_RAID_WARNING"] then
		ST_UpUnitFrame:RegisterEvent("CHAT_MSG_RAID_WARNING");
	end
	
	if tbl["CHAT_MSG_RAID_LEADER"] then
		ST_UpUnitFrame:RegisterEvent("CHAT_MSG_RAID_LEADER");
	end
	
	if tbl["CHAT_MSG_RAID"] then
		ST_UpUnitFrame:RegisterEvent("CHAT_MSG_RAID");
	end
	
	if tbl["CHAT_MSG_PARTY_LEADER"] then
		ST_UpUnitFrame:RegisterEvent("CHAT_MSG_PARTY_LEADER");
	end
	
	if tbl["UI_ERROR_MESSAGE"] then
		ST_UpUnitFrame:RegisterEvent("UI_ERROR_MESSAGE");
	end
	
	if tbl["CHAT_MSG_WHISPER"] then
		ST_UpUnitFrame:RegisterEvent("CHAT_MSG_WHISPER");
	end
	
	if tbl["UNIT_COMBAT"] then
		ST_UpUnitFrame:RegisterEvent("UNIT_COMBAT");
	end
	
	if tbl["COMBAT_TEXT_UPDATE"] then
		ST_UpUnitFrame:RegisterEvent("COMBAT_TEXT_UPDATE");
	end
	
	if tbl["CHAT_MSG_PARTY"] then
		ST_UpUnitFrame:RegisterEvent("CHAT_MSG_PARTY");
	end
	
	if not SuperTreatmentDBF["Unit"]["CustomMT"] then
	
		SuperTreatmentDBF["Unit"]["CustomMT"]={};
		SuperTreatmentDBF["Unit"]["CustomMT"]["list"]={};
		SuperTreatmentDBF["Unit"]["CustomMT"]["checked"]=false;
	end
	
	
	if not UnitDB["MTList"] then
	
		UnitDB["MTList"]={};
		UnitDB["MTList"]["Default"]={};
		UnitDB["MTList"]["Custom"]={};
	end
	
	
	
	if #UnitDB["MTList"]["Custom"]~=8 then
		
		UnitDB["MTList"]["Custom"]={};
		for i=1, 8 do

			table.insert(UnitDB["MTList"]["Custom"],"MT" .. i);
			
		end
	end
	
	
	
	if not SuperTreatmentAllDBF.SetSounds then
	
		SuperTreatmentAllDBF.SetSounds={};
	end
	

	
	MyAddOn_Orig_amCastInf = amCastInf;
	
	amCastInf = MyAddOn_amCastInf ;
	
	
end

function MyAddOn_amCastInf(spell,target)
	
	if ST.showruninf then
		ST.showruninf(spell,target);
	end
	
	
	return MyAddOn_Orig_amCastInf(spell,target);
end

function SuperTreatment_run(text)
	
	local ST = SuperTreatmentInf;
	
	if text and type(text) == "number" then
		
		
		local tbl = SuperTreatmentDBF["Spells"]["List"][text];
	
		if not tbl then
			
			print("|cffff0000[" .. text .. "]方案不存在！")
			return false;
		end
	
		return ST.SpellsRun_1(text);
	
	
	
	elseif text and text~="" then
			
			for k,v in pairs(SuperTreatmentDBF["Spells"]["List"]) do
				
				if v["name"]==text then
					
					return ST.SpellsRun_1(k);
				end
				
			end
			
			print("|cffff0000[" .. text .. "]方案不存在！")
			
			
	elseif not text or  text=="" then
		
		print("请输入方案名称！")
	
			
	end
	
	
end


function SuperTreatment_comman(text)
	local V=Decompositioninf(text," ")
	
	
	if V[1]=="load" then
		SuperTreatment_Program_load(V[2])
	
	elseif V[1]=="reset" then
			SuperTreatmentReset();
		
	elseif V[1]=="select:on" or V[1]=="select:off" or V[1]=="select" then
		
		if not V[2] then
			stprint("请输入方案名称！")
			return;
		end
		
		local A ;-- =Decompositioninf(V[2],":")
		local B;
		local A1 = Decompositioninf(V[1],":")
		
		
		local a,b,a1,b1;
		
		a = V[2];
		a1 = A1[2];
		
		if a1 == "on" then
			a1=true;
		elseif a1 == "off" then
			a1=false;
		end
		
		if V[3] then
		
			B =Decompositioninf(V[3],":")
		
			b = B[1];
			b1 = B[2];
			
			
			if b1 == "on" then
				b1=true;
			elseif b1 == "off" then
				b1=false;
			elseif b1 and (b1 ~= "off" or b1 ~= "on") then
				--print("技能的开关参数错误!请选 on/off");
				stprint("|cff00ff00" .. a .. "方案下的|cffff0000[|r" .. b.."|cffff0000]技能的开关参数错误!请选 on/off")
				return;
			end
		end
			
		SuperTreatment_Program_Show(a,a1,b,b1)
		
		--SuperTreatment_Program_Show(V[2],V[3])
	
	elseif V[1]=="show" then
	
		SuperTreatment_Show();
		
	elseif V[1]=="startstop" then
		SuperTreatment_Start();
		
	elseif V[1]=="run" then
		SuperTreatment_Run();
		
	elseif V[1]=="auto" then
		SuperTreatment_Auto();
	
	elseif V[1]=="stop" then
		SuperTreatment_Stop();
	
	elseif V[1]=="MT" then
		
		local name = amGetUnitName("target",true);
		if V[3] then
		
			if V[3] == "off" and V[2] and tonumber(V[2]) and tonumber(V[2])>=1 and tonumber(V[2])<=8 then
				
				SuperTreatmentDBF["Unit"]["MTList"]["Custom"][tonumber(V[2])]="MT"..V[2];
				stprint("成功取消 MT"..V[2]);
				 SuperTreatment["Menu"]["Main"]["DropDownMenu"]:Refresh(3);
			else
				stprint("|cffff0000MT命令格式/参数错误！");
			end
			
		else
			
			if name and V[2] and tonumber(V[2]) and tonumber(V[2])>=1 and tonumber(V[2])<=8 then
				
				SuperTreatmentDBF["Unit"]["MTList"]["Custom"][tonumber(V[2])]=name;
				stprint("成功设定 MT"..V[2].." 为:" .. name);
				 SuperTreatment["Menu"]["Main"]["DropDownMenu"]:Refresh(3);
			else
				stprint("|cffff0000MT命令格式错误或没当前目标！");
			end
			
		end
		
	else
		--print("无效命令！");
		SuperTreatment_commaninf();
	
	end
	
	if WowStHelperFrame and WowStHelperFrame:IsShown() then
		WowStHelperFrame_Show();
	end
	
end

stcommand = SuperTreatment_comman;


function SuperTreatment_commaninf()
	
	print("|cffffff00上帝指令宏命令:")
	print("|cffff0000重置窗口:|r /st reset")
	
	print("|cffff0000显示/隐藏插件:|r /st show")
	print("|cffff0000自动施放(启动/停止):|r /st startstop")
	print("|cffff0000手动施放:|r /st run")
	print("|cffff0000启动自动施放:|r /st auto")
	print("|cffff0000停止自动施放:|r /st stop")
	
	print("|cffff0000加载方案:|r /st load 方案名称")
	print("|cffff0000选择/放弃施法方案:|r /st select 施法方案名称")
	print("|cffff0000选择/放弃施法方案下的技能:|r /st select 施法方案名称 技能序号")
	
	print("|cffff0000选择施法方案:|r /st select:on 施法方案名称")
	print("|cffff0000放弃施法方案:|r /st select:off 施法方案名称")
	
	print("|cffff0000选择施法方案及其下的技能:|r /st select:on 施法方案名称 技能序号:on")
	print("|cffff0000放弃施法方案及其下的技能:|r /st select:off 施法方案名称 技能序号:off")
	
	print("|cffff0000施法方案及其下的技能(on/off):|r /st select:on/off 施法方案名称 技能序号:on/off")
	print("|cffff0000施法方案及其下的技能(on/off):|r /st select:on/off 施法方案名称 技能序号:on/off")
	
	print("|cffff0000手动执行方案:|r /srun 方案名称")
	
	print('|cffff0000用函数 stcommand 来替代|r /st 如: stcommand("show") 显示/隐藏插件')
	
	print("|cffff0000设定当前目标为全局MT目标:|r /st MT 编号 如: /st MT 1")
	print("|cffff0000取消全局MT目标:|r /st MT 编号 off  如: /st MT 1 off")
	
end





 
local function SortLevelNameAsc(a, b)

	 
	 
	if a.subgroup == b.subgroup then
	return a.raidn < b.raidn
	else
	return a.subgroup < b.subgroup
	end
end 


local function RaidList()
	
	UnitDB = SuperTreatmentDBF["Unit"];
	UnitDB["TeamNumber"]=0;
	UnitDB["TeamCount"]={};
	UnitDB["RaidListClass"]={};
	
	if not SuperTreatmentDBF["Unit"]["RaidList"] then
		SuperTreatmentDBF["Unit"]["RaidList"]={};
	end
	
	
	if not SuperTreatmentInf["UnitId"] then
		SuperTreatmentInf["UnitId"]={};
	end

	RDB =SuperTreatmentDBF["Unit"]["RaidList"];
	local UnitId =SuperTreatmentInf["UnitId"];
	
	local ClassTBL = SuperTreatmentDBF["Unit"]["RaidListClass"];
	local PlayerName = UnitName("player");
	
	if not UnitDB["MTList"] then
	
		UnitDB["MTList"]={};
		UnitDB["MTList"]["Default"]={};
		UnitDB["MTList"]["Private"]={};
		UnitDB["MTList"]["Custom"]={};
	end
	
	
	UnitDB["MTList"]["Default"]={};
	
	for i, data in pairs(RDB) do
		
		if data["subgroup"]>=0 then
			
			if  not amGetUnitName(data["unit"],true) then
				
				
				RDB[i] = nil;
			
		
			elseif data["unit"] ~= PlayerName and not ( UnitPlayerOrPetInParty(data["unit"]) or  UnitPlayerOrPetInRaid(data["unit"])) then
				RDB[i] = nil;
			end
			
		end
	
	end
                RDB["maintank1target"]={};
		RDB["maintank1target"]["raidn"]=-30;
		RDB["maintank1target"]["name"]="MT2的目标";
		RDB["maintank1target"]["subgroup"]=-1;
		RDB["maintank1target"]["class"]="";
		RDB["maintank1target"]["englishClass"]="";
		RDB["maintank1target"]["unit"]="maintank2target";
	        RDB["maintank1target"]["cuid"]=22;

               	RDB["maintank1target"]={};
		RDB["maintank1target"]["raidn"]=-29;
		RDB["maintank1target"]["name"]="MT1的目标";
		RDB["maintank1target"]["subgroup"]=-1;
		RDB["maintank1target"]["class"]="";
		RDB["maintank1target"]["englishClass"]="";
		RDB["maintank1target"]["unit"]="maintank1target";
	        RDB["maintank1target"]["cuid"]=21;


		RDB["boss4target"]={};
		RDB["boss4target"]["raidn"]=-28;
		RDB["boss4target"]["name"]="Boss4的目标";
		RDB["boss4target"]["subgroup"]=-1;
		RDB["boss4target"]["class"]="";
		RDB["boss4target"]["englishClass"]="";
		RDB["boss4target"]["unit"]="boss4target";

		RDB["boss4"]={};
		RDB["boss4"]["raidn"]=-27;
		RDB["boss4"]["name"]="Boss4";
		RDB["boss4"]["subgroup"]=-1;
		RDB["boss4"]["class"]="";
		RDB["boss4"]["englishClass"]="";
		RDB["boss4"]["unit"]="boss4";
		
                RDB["boss3target"]={};
		RDB["boss3target"]["raidn"]=-26;
		RDB["boss3target"]["name"]="Boss3的目标";
		RDB["boss3target"]["subgroup"]=-1;
		RDB["boss3target"]["class"]="";
		RDB["boss3target"]["englishClass"]="";
		RDB["boss3target"]["unit"]="boss3target";

		RDB["boss3"]={};
		RDB["boss3"]["raidn"]=-25;
		RDB["boss3"]["name"]="Boss3";
		RDB["boss3"]["subgroup"]=-1;
		RDB["boss3"]["class"]="";
		RDB["boss3"]["englishClass"]="";
		RDB["boss3"]["unit"]="boss3";
		
		RDB["boss2target"]={};
		RDB["boss2target"]["raidn"]=-24;
		RDB["boss2target"]["name"]="Boss2的目标";
		RDB["boss2target"]["subgroup"]=-1;
		RDB["boss2target"]["class"]="";
		RDB["boss2target"]["englishClass"]="";
		RDB["boss2target"]["unit"]="boss2target";
		
		RDB["boss2"]={};
		RDB["boss2"]["raidn"]=-23;
		RDB["boss2"]["name"]="Boss2";
		RDB["boss2"]["subgroup"]=-1;
		RDB["boss2"]["class"]="";
		RDB["boss2"]["englishClass"]="";
		RDB["boss2"]["unit"]="boss2";
		
                RDB["boss1target"]={};
		RDB["boss1target"]["raidn"]=-22;
		RDB["boss1target"]["name"]="Boss1的目标";
		RDB["boss1target"]["subgroup"]=-1;
		RDB["boss1target"]["class"]="";
		RDB["boss1target"]["englishClass"]="";
		RDB["boss1target"]["unit"]="boss1target";

		RDB["boss1"]={};
		RDB["boss1"]["raidn"]=-21;
		RDB["boss1"]["name"]="Boss1";
		RDB["boss1"]["subgroup"]=-1;
		RDB["boss1"]["class"]="";
		RDB["boss1"]["englishClass"]="";
		RDB["boss1"]["unit"]="boss1";
		
		
		RDB["vehicle"]={};
		RDB["vehicle"]["raidn"]=-20;
		RDB["vehicle"]["name"]="你控制的车辆";
		RDB["vehicle"]["subgroup"]=-1;
		RDB["vehicle"]["class"]="";
		RDB["vehicle"]["englishClass"]="";
		RDB["vehicle"]["unit"]="vehicle";
		
	--if not RDB["pet"] then
	
		RDB["pet"]={};
		RDB["pet"]["raidn"]=-19;
		RDB["pet"]["name"]="宠物";
		RDB["pet"]["subgroup"]=-1;
		RDB["pet"]["class"]="";
		RDB["pet"]["englishClass"]="";
		RDB["pet"]["unit"]="pet";
		
		RDB["pettarget"]={};
		RDB["pettarget"]["raidn"]=-18;
		RDB["pettarget"]["name"]="宠物的目标";
		RDB["pettarget"]["subgroup"]=-1;
		RDB["pettarget"]["class"]="";
		RDB["pettarget"]["englishClass"]="";
		RDB["pettarget"]["unit"]="pettarget";
		
	--end
	
	--if not RDB["maintank8"]["cuid"] then
	
		RDB["maintank8"]={};
		RDB["maintank8"]["raidn"]=-17;
		RDB["maintank8"]["name"]="MT8";
		RDB["maintank8"]["subgroup"]=-1;
		RDB["maintank8"]["class"]="";
		RDB["maintank8"]["englishClass"]="";
		RDB["maintank8"]["unit"]="maintank8";
		RDB["maintank8"]["cuid"]=18;
		
		RDB["maintank7"]={};
		RDB["maintank7"]["raidn"]=-16;
		RDB["maintank7"]["name"]="MT7";
		RDB["maintank7"]["subgroup"]=-1;
		RDB["maintank7"]["class"]="";
		RDB["maintank7"]["englishClass"]="";
		RDB["maintank7"]["unit"]="maintank7";
		RDB["maintank7"]["cuid"]=17;
		
		RDB["maintank6"]={};
		RDB["maintank6"]["raidn"]=-15;
		RDB["maintank6"]["name"]="MT6";
		RDB["maintank6"]["subgroup"]=-1;
		RDB["maintank6"]["class"]="";
		RDB["maintank6"]["englishClass"]="";
		RDB["maintank6"]["unit"]="maintank6";
		RDB["maintank6"]["cuid"]=16;
		
		RDB["maintank5"]={};
		RDB["maintank5"]["raidn"]=-14;
		RDB["maintank5"]["name"]="MT5";
		RDB["maintank5"]["subgroup"]=-1;
		RDB["maintank5"]["class"]="";
		RDB["maintank5"]["englishClass"]="";
		RDB["maintank5"]["unit"]="maintank5";
		RDB["maintank5"]["cuid"]=15;
		

		RDB["maintank4"]={};
		RDB["maintank4"]["raidn"]=-13;
		RDB["maintank4"]["name"]="MT4";
		RDB["maintank4"]["subgroup"]=-1;
		RDB["maintank4"]["class"]="";
		RDB["maintank4"]["englishClass"]="";
		RDB["maintank4"]["unit"]="maintank4";
		RDB["maintank4"]["cuid"]=14;
		

		RDB["maintank3"]={};
		RDB["maintank3"]["raidn"]=-12;
		RDB["maintank3"]["name"]="MT3";
		RDB["maintank3"]["subgroup"]=-1;
		RDB["maintank3"]["class"]="";
		RDB["maintank3"]["englishClass"]="";
		RDB["maintank3"]["unit"]="maintank3";
		RDB["maintank3"]["cuid"]=13;
		
		RDB["maintank2"]={};
		RDB["maintank2"]["raidn"]=-11;
		RDB["maintank2"]["name"]="MT2";
		RDB["maintank2"]["subgroup"]=-1;
		RDB["maintank2"]["class"]="";
		RDB["maintank2"]["englishClass"]="";
		RDB["maintank2"]["unit"]="maintank2";
		RDB["maintank2"]["cuid"]=12;
		
	
		RDB["maintank1"]={};
		RDB["maintank1"]["raidn"]=-10;
		RDB["maintank1"]["name"]="MT1";
		RDB["maintank1"]["subgroup"]=-1;
		RDB["maintank1"]["class"]="";
		RDB["maintank1"]["englishClass"]="";
		RDB["maintank1"]["unit"]="maintank1";
		RDB["maintank1"]["cuid"]=11;
		
	--end
		
	if not RDB["target"] then	
		RDB["nogoal"]={};
		RDB["nogoal"]["raidn"]=-9;
		RDB["nogoal"]["name"]="无目标";
		RDB["nogoal"]["subgroup"]=-1;
		RDB["nogoal"]["class"]="";
		RDB["nogoal"]["englishClass"]="";
		RDB["nogoal"]["unit"]="nogoal";
		RDB["nogoal"]["cuid"]=2;
		
		RDB["player"]={};
		RDB["player"]["raidn"]=-8;
		RDB["player"]["name"]="自己";
		RDB["player"]["subgroup"]=-1;
		RDB["player"]["class"]="";
		RDB["player"]["englishClass"]="";
		RDB["player"]["unit"]="player";
	
		RDB["target"]={};
		RDB["target"]["raidn"]=-7;
		RDB["target"]["name"]="当前目标";
		RDB["target"]["subgroup"]=-1;
		RDB["target"]["class"]="";
		RDB["target"]["englishClass"]="";
		RDB["target"]["unit"]="target";
		
		RDB["targettarget"]={};
		RDB["targettarget"]["raidn"]=-6;
		RDB["targettarget"]["name"]="当前目标的目标";
		RDB["targettarget"]["subgroup"]=-1;
		RDB["targettarget"]["class"]="";
		RDB["targettarget"]["englishClass"]="";
		RDB["targettarget"]["unit"]="targettarget";
		
		RDB["focus"]={};
		RDB["focus"]["raidn"]=-5;
		RDB["focus"]["name"]="焦点目标";
		RDB["focus"]["subgroup"]=-1;
		RDB["focus"]["class"]="";
		RDB["focus"]["englishClass"]="";
		RDB["focus"]["unit"]="focus";
		
		RDB["focustarget"]={};
		RDB["focustarget"]["raidn"]=-4;
		RDB["focustarget"]["name"]="焦点目标的目标";
		RDB["focustarget"]["subgroup"]=-1;
		RDB["focustarget"]["class"]="";
		RDB["focustarget"]["englishClass"]="";
		RDB["focustarget"]["unit"]="focustarget";
		
		RDB["FireHasBeenSet"]={};
		RDB["FireHasBeenSet"]["raidn"]=-3;
		RDB["FireHasBeenSet"]["name"]="被集火目标";
		RDB["FireHasBeenSet"]["subgroup"]=-1;
		RDB["FireHasBeenSet"]["class"]="";
		RDB["FireHasBeenSet"]["englishClass"]="";
		RDB["FireHasBeenSet"]["unit"]="FireHasBeenSet";
		RDB["FireHasBeenSet"]["cuid"]=1;
		
		RDB["mouseover"]={};
		RDB["mouseover"]["raidn"]=-2;
		RDB["mouseover"]["name"]="鼠标目标";
		RDB["mouseover"]["subgroup"]=-1;
		RDB["mouseover"]["class"]="";
		RDB["mouseover"]["englishClass"]="";
		RDB["mouseover"]["unit"]="mouseover";
		
		RDB["mouseovertarget"]={};
		RDB["mouseovertarget"]["raidn"]=-1;
		RDB["mouseovertarget"]["name"]="鼠标目标的目标";
		RDB["mouseovertarget"]["subgroup"]=-1;
		RDB["mouseovertarget"]["class"]="";
		RDB["mouseovertarget"]["englishClass"]="";
		RDB["mouseovertarget"]["unit"]="mouseovertarget";
	
	end
	
	

					
	local k = GetNumGroupMembers();
	local MtIndex=0;
	--if k > 0 then
	if UnitInRaid("player") then					
			for i=1 , k do
			
				local name, rank, subgroup, level, class, fileName, zone, online, isDead, role, isML,CT = GetRaidRosterInfo(i);
				
				if name then
					local localizedClass, englishClass = UnitClass(name);
										
						RDB[name]={};
					
						RDB[name]["name"]=name;
						
						RDB[name]["class"]=localizedClass;
						RDB[name]["englishClass"]=englishClass;
						RDB[name]["unit"]=name;
					
						
					
					RDB[name]["subgroup"]=subgroup;
					RDB[name]["raidn"]=i;
					
					
					if PlayerName == name then
						UnitDB["TeamNumber"]=subgroup;
						RDB[name]["subgroup"]=subgroup;
					end
					
					if not UnitDB["TeamCount"][subgroup] then
						UnitDB["TeamCount"][subgroup]=0;
					end
					
						UnitDB["TeamCount"][subgroup] = UnitDB["TeamCount"][subgroup] +1;
					
					
					if localizedClass and not ClassTBL[localizedClass] then
						ClassTBL[localizedClass]={};
						ClassTBL[localizedClass]["englishClass"]=englishClass;
						ClassTBL[localizedClass]["Count"]=0;
					end
					
					if localizedClass and ClassTBL[localizedClass] and ClassTBL[localizedClass]["Count"] then
						ClassTBL[localizedClass]["Count"] = ClassTBL[localizedClass]["Count"]  + 1;
					end
						
					
					RDB[name]["role"]=role;
					
					if role == "MAINTANK" or role == "MAINASSIST" or CT == "TANK" then
					
						MtIndex = MtIndex +1;
						
						UnitDB["MTList"]["Default"][MtIndex]=name;
						
						
						
					end
					
					RDB[name]["unitid"]="raid"..i;
					UnitId["raid"..i]=RDB[name];
					UnitId[name]=RDB[name];
					
				end
			end
						
			table.sort(RDB,SortLevelNameAsc)
		
			
			
	elseif UnitInParty("player") and not UnitInRaid("player") then

			
		local k=GetNumSubgroupMembers();
		for i=1 , k do
			
			local name = amGetUnitName("party" .. tostring(i),true);
			
			if name then
			
				local localizedClass, englishClass = UnitClass(name);
				
				local role = UnitGroupRolesAssigned(name);
	
				if ( role == "TANK") then
					MtIndex = MtIndex +1;
					UnitDB["MTList"]["Default"][MtIndex]=name;
				end
	
				if localizedClass then
											
					RDB[name]={};		
					RDB[name]["unit"]=name ;
					RDB[name]["name"]=name;
					RDB[name]["subgroup"]=0;
					RDB[name]["class"]=localizedClass;
					RDB[name]["englishClass"]=englishClass;
						
									
					RDB[name]["raidn"]=i;


					if not UnitDB["TeamCount"][0] then
						UnitDB["TeamCount"][0]=GetNumSubgroupMembers();
					else
						UnitDB["TeamCount"][0]=GetNumSubgroupMembers();
					end
						
					
						
					if not ClassTBL[localizedClass] then
						ClassTBL[localizedClass]={};
						ClassTBL[localizedClass]["englishClass"]=englishClass;
						ClassTBL[localizedClass]["Count"]=0;
					end
						ClassTBL[localizedClass]["Count"] = ClassTBL[localizedClass]["Count"] + 1;
				
					RDB[name]["unitid"]="party"..i;
					UnitId["party"..i]=RDB[name];
					UnitId[name]=RDB[name];
				
				end
				
				
			end		
				
		end
	
		
		
	end
	
	
		
	if not UnitInRaid("player") then
	
		local name = UnitName("player");
		local localizedClass, englishClass = UnitClass("player");
				
			RDB[name]={};
			RDB[name]["raidn"]=1;
			RDB[name]["name"]=name;
			RDB[name]["unit"]=name;
			RDB[name]["subgroup"]=0;
			RDB[name]["class"]=localizedClass;
			RDB[name]["englishClass"]=englishClass;
			
				
		if not UnitInParty("player") then
			
			UnitDB["TeamNumber"]=0;
		end
		
		
		
		if not UnitDB["TeamCount"][0] then
			UnitDB["TeamCount"][0]=0;
		end
		
		UnitDB["TeamCount"][0] = GetNumSubgroupMembers()+1;
		
		
		if not ClassTBL[localizedClass] then
			ClassTBL[localizedClass]={};
			ClassTBL[localizedClass]["englishClass"]=englishClass;
			ClassTBL[localizedClass]["Count"]=0;
		end
			ClassTBL[localizedClass]["Count"] = ClassTBL[localizedClass]["Count"] + 1;
		
		RDB[name]["unitid"]="player";
		UnitId["player"]=RDB[name];
		UnitId[name]=RDB[name];
		
		local role = UnitGroupRolesAssigned(name);
		if ( role == "TANK") then
			
			MtIndex = MtIndex +1;
			UnitDB["MTList"]["Default"][MtIndex]=name;
		end
	end
	
	
	IsOpenDropDownMenu();
	
end



local function CollectionInf_Buff_Spell(self, event, ...)
	
	--[[
	local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16;
	
	if GetSpellBookItemName then
		arg1,arg2 = select(1, ...);
		arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = select(4, ...);
		
	else
	
		arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = ...;
	
	end
	
	--]]
	
	local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16;

	if tonumber((select(4, GetBuildInfo()))) >= 40200 then	
		
		arg1,arg2 = select(1, ...);
		arg3,arg4,arg5,_,arg6,arg7,arg8,_,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = select(4, ...);
		
	else
	
		arg1,arg2 = select(1, ...);
		arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = select(4, ...);
	
	end
	
	
	if not SuperTreatmentDBF["CollectionInf"] or not SuperTreatmentDBF["CollectionInf"]["Buff_Spell"] or not SuperTreatmentDBF["CollectionInf"]["Buff_Spell"]["checked"] then
		return false;
	end
	
	local _, _, prefix, suffix = string.find(arg2, "(.-)_(.+)");
		
		if arg9 then
		
			local name, rank, icon, cost, isFunnel, powerType = GetSpellInfo(arg9)
			
			if "AURA_APPLIED" == suffix and arg7 and arg3 then
			
				local v = CollectionInf["Buff_Spell"]["Buff"];
				
				if not v[arg9] then
					v[arg9]={};
				end
					
					
				if not powerType then
					powerType="";
				end
				
				if not rank then
					rank="";
				end
				
						
				
				v[arg9]["name"] = name;
				v[arg9]["rank"] = rank;
				v[arg9]["icon"] = icon;
				v[arg9]["powerType"] = powerType;
				v[arg9]["UnitGUID"] = arg3;
				v[arg9]["englishClass"] = "";
				local localizedClass, englishClass = UnitClass(arg7);
				if englishClass then
					v[arg9]["englishClass"] = englishClass;
				else
					v[arg9]["englishClass"] = "";
				end
			
				--print("附加>>",arg4,arg9,arg12)
			
						
			elseif ("CAST_SUCCESS" == suffix or "CAST_FAILED" == suffix  or "CAST_START" == suffix) and arg4 and arg9 then
				
				--print(arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16)
				local v = CollectionInf["Buff_Spell"]["Spell"];
				
				if not v[arg9] then
					v[arg9]={};
				end	
					
					
				if not powerType then
					powerType="";
				end
				
				if not rank then
					rank="";
				end
				
				
				v[arg9]["name"] = name;
				v[arg9]["rank"] = rank;
				v[arg9]["icon"] = icon;
				v[arg9]["powerType"] = powerType;
				v[arg9]["UnitGUID"] = arg3;
			
					
				local localizedClass, englishClass = UnitClass(arg4);
				if englishClass then
					v[arg9]["englishClass"] = englishClass;
				else
					v[arg9]["englishClass"] = "";
				end
					
				
				
				--print("技能>>",arg4,name)
			end
		end

end

local function AnalysisInf(str)
	
	if not str or  type(str) ~= "string" then
		return false;
	end
		
	local tbl = SuperTreatmentDBF["Unit"]["IsInfList"];
	
	
	for k,v in pairs(tbl) do
		
		local isok = false;
		for j,v1 in pairs(v["Condition"]) do
		
			local pattern = v1["Text"];
			local plain = v1["Plain"];
			local init = v1["Init"];
			local xEnd = v1["End"];
			
			if xEnd ==0  then
				xEnd =999999;
			end
			
			local n , n1 = string.find(str, pattern, init, plain) ;
			local x;
			if n then
				
				if n >= init and n1 <= xEnd then
					
					x = true;
				end
				
			
			end
			
			if not x then
				return false;
			end
			--print(j,x,n,n1,init,pattern,strlen(str))
			isok = true;
			
			--break;

		end
		
		if isok then
	
			v["Time"]= GetTime();
			--v["Date"]= date("%H:%M:%S");
		end
		
	end
	
	
	
	
	return isok;

end

local function UpUnitFrame_OnEvent(self, event, ...)
	
	--[[
	local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16;
	
	if GetSpellBookItemName then
		arg1,arg2 = select(1, ...);
		arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = select(4, ...);
	else
		arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = ...;
	end
	
	--]]
	
	local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16;

	if tonumber((select(4, GetBuildInfo()))) >= 40200 then	
		
		arg1,arg2 = select(1, ...);
		arg3,arg4,arg5,_,arg6,arg7,arg8,_,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = select(4, ...);
		
	else
	
		arg1,arg2 = select(1, ...);
		arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = select(4, ...);
	
	end
	
	--print(event)
	--UPDATE_BATTLEFIELD_STATUS
	--UNIT_NAME_UPDATE
	--UNIT_CONNECTION
	--PARTY_MEMBER_ENABLE
	--PARTY_MEMBER_DISABLE
	--PARTY_LEADER_CHANGED
	if  event ==  "UPDATE_BATTLEFIELD_STATUS" or
		event ==  "UNIT_NAME_UPDATE" or
		event ==  "UNIT_CONNECTION" or
		event ==  "PARTY_MEMBER_ENABLE" or
		event ==  "PARTY_MEMBER_DISABLE" or
		event ==  "PARTY_LEADER_CHANGED" or
		event ==  "RAID_ROSTER_UPDATE" or
		event ==  "GROUP_ROSTER_UPDATE" or
		event ==  "PARTY_CONVERTED_TO_RAID"
		
		then
		
		RaidList();
	
	
	
	elseif ( event ==  "RAID_ROSTER_UPDATE")  then
	
		if GetNumGroupMembers()>0 then
			RaidList();
		end
	

	elseif ( event == "PARTY_MEMBERS_CHANGED" )  then
		
		if GetNumGroupMembers() == 0 then
			RaidList();
		end
		
	elseif ( event == "COMBAT_LOG_EVENT_UNFILTERED" ) then
		
		
		if not SuperTreatmentSet["COMBAT_LOG"] then
			CollectionInf_Buff_Spell(self, event, ...);
		end
		
		
				
	
	elseif ( event == "CHAT_MSG_RAID_WARNING" ) then
		
		AnalysisInf(arg1);
		--print(event,arg1,arg2,arg11,arg12)
	
	elseif ( event == "CHAT_MSG_RAID_LEADER" ) then
		
		AnalysisInf(arg1);
		--print(event,arg1,arg2,arg11,arg12)
	
	elseif ( event == "CHAT_MSG_RAID_WARNING" ) then

		AnalysisInf(arg1);
		--print(event,arg1,arg2,arg11,arg12)
	
	elseif ( event == "CHAT_MSG_RAID" ) then

		AnalysisInf(arg1);
		--print(event,arg1,arg2,arg11,arg12)
	
	elseif ( event == "CHAT_MSG_PARTY_LEADER" ) then

		AnalysisInf(arg1);
		--print(event,arg1,arg2,arg11,arg12)
	
	elseif ( event == "UI_ERROR_MESSAGE" ) then
		--print("xx>>>",arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16)	
		AnalysisInf(arg1);
		
	elseif ( event == "CHAT_MSG_WHISPER" and arg1) then

		local n , n1 = string.find(arg1, "@R_", 1, true) ;
		
		if n == 1 then
			V = DecompositionValue(arg1)
			local pass = SuperTreatmentDBF["Unit"]["IsInfListSet"]["ReceiverSpellRequestPass"];	
			
			if pass and pass~="" and pass == V[2] then
			
						
				if strsub(V[3],1,1) == "/" then
					
					aminspell(V[3],"Macro");
					
				else
					if V[5] and V[5] == "1" then
						aminspell(V[4],V[3],true);
					else
						aminspell(V[4],V[4],false);
					end
				
				end
			end


		else
			AnalysisInf(arg1);
			
		end
	
	elseif ( event == "UNIT_COMBAT" ) then

	
		local text = GetSpellInfo(arg3);
		--print("5>>",event,arg1,arg2,arg3,arg4,arg5)
		AnalysisInf(text);
	
	elseif ( event == "COMBAT_TEXT_UPDATE" )  then
		
		
            if (arg1 == "SPELL_ACTIVE") then
			
				--if GetSpellInfo(SpellIds["复仇(防御姿态)"]) == arg2 then
				--print(arg2)
				AnalysisInf(arg2);
			end
	
	end

end			


--[[

local function ST_CastSpellFrame_OnEvent(self, event, ...)
	
	local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16;
		
		arg1,arg2 = select(1, ...);
		arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = select(4, ...);
		
			
	if ( event == "UNIT_HEAL_PREDICTION" )  then
		
		--print("1>>",event,arg1,arg2,arg3,arg4)
		local GUID = UnitGUID(arg1);
		if GUID then
			
			SuperTreatmentInf["CastSpellInf"]["HEAL_PREDICTION"][GUID] ={};
			SuperTreatmentInf["CastSpellInf"]["HEAL_PREDICTION"][GUID]["heal"]=UnitGetIncomingHeals(arg1);
			SuperTreatmentInf["CastSpellInf"]["HEAL_PREDICTION"][GUID]["name"]=arg1;
		end
		
	elseif ( event == "UNIT_SPELLCAST_SENT" )  then
		
		--print("2>>",UnitGUID(arg3),event,arg1,arg2,arg3,arg4)
		
		local GUID = UnitGUID(arg3);
		local name,target;
		target="";
		if arg3=="" then
		
			GUID ="nogoal";
			name = "";
			target ="player";
			
		elseif not GUID and arg3==UnitName("target") then
		
			GUID = UnitGUID("target");
			name = arg3;
			target ="target";
		
		elseif not GUID and arg3==UnitName("focus") then
			GUID = UnitGUID("focus");
			name = arg3;
			target="focus";
		end
		
		if arg3==UnitName("player") then
			target="player";
		end
		
		
		if GUID then
		
			local castguid=UnitGUID(arg1);
			local castunit = SuperTreatmentInf["CastSpellInf"]["spell"];
			
			if not castunit[castguid] then
			
				castunit[castguid]={};
			end
			
			local tbl = castunit[castguid];
			
			if not tbl[arg2] then
				tbl[arg2]={};
			end
								
						
			tbl[arg2][arg4] = {};
			
			tbl[arg2][arg4]["guit"] = GUID;
			tbl[arg2][arg4]["name"] = name;
			
			tbl[arg2][arg4]["time"] = GetTime();
			
			
			--print("123",amGetSIlink(arg2),arg3)
			if not arg3 or arg3 == "" then
			
				ST.showruninf(amGetSIlink(arg2),UnitName("player"));
			else
			
				ST.showruninf(amGetSIlink(arg2),arg3);
			
			end
			
		
		end
		
	elseif (event=="UNIT_SPELLCAST_STOP") or (event=="UNIT_SPELLCAST_SUCCEEDED") or (event=="UNIT_SPELLCAST_FAILED") or (event=="UNIT_SPELLCAST_INTERRUPTED") then
       --print("3>>",event,arg1,arg2,arg3,arg4)
    	
				
		local castguid=UnitGUID(arg1);
		local castunit = SuperTreatmentInf["CastSpellInf"]["spell"];
			
		if castunit[castguid] and castunit[castguid][arg2] and castunit[castguid][arg2][arg3] then
		
			castunit[castguid][arg2] = nil;
			
		end
	end
	

	
	

end
--]]
local function Initialization()
	
	BINDING_HEADER_SuperTreatment = "上帝指令";
	BINDING_NAME_SuperTreatment_SHOW = "显示/隐藏";
	BINDING_NAME_SuperTreatment_STARTSTOP = "自动施放(启动/停止)";
	BINDING_NAME_SuperTreatment_RUN = "手动施放";
	BINDING_NAME_SuperTreatment_AUTO = "启动自动施放";
	BINDING_NAME_SuperTreatment_STOPALL = "停止自动施放";
	BINDING_NAME_SuperTreatment_BURSTS = "连发(按下启动反之停止)"
	
	BINDING_NAME_SuperTreatment_CastProgram1 = "选择/放弃 施法方案 1";
	BINDING_NAME_SuperTreatment_CastProgram2 = "选择/放弃 施法方案 2";
	BINDING_NAME_SuperTreatment_CastProgram3 = "选择/放弃 施法方案 3";
	BINDING_NAME_SuperTreatment_CastProgram4 = "选择/放弃 施法方案 4";
	BINDING_NAME_SuperTreatment_CastProgram5 = "选择/放弃 施法方案 5";
	
	BINDING_NAME_SuperTreatment_CastProgram6 = "选择/放弃 施法方案 6";
	BINDING_NAME_SuperTreatment_CastProgram7 = "选择/放弃 施法方案 7";
	BINDING_NAME_SuperTreatment_CastProgram8 = "选择/放弃 施法方案 8";
	BINDING_NAME_SuperTreatment_CastProgram9 = "选择/放弃 施法方案 9";
	BINDING_NAME_SuperTreatment_CastProgram10 = "选择/放弃 施法方案 10";
	
	BINDING_NAME_SuperTreatment_CastProgram11 = "选择/放弃施法方案 11";
	BINDING_NAME_SuperTreatment_CastProgram12 = "选择/放弃施法方案 12";
	
		
	BINDING_NAME_SuperTreatment_RunProgram1 = "手动执行施法方案 1";
	BINDING_NAME_SuperTreatment_RunProgram2 = "手动执行施法方案 2";
	BINDING_NAME_SuperTreatment_RunProgram3 = "手动执行施法方案 3";
	BINDING_NAME_SuperTreatment_RunProgram4 = "手动执行施法方案 4";
	BINDING_NAME_SuperTreatment_RunProgram5 = "手动执行施法方案 5";
	
	BINDING_NAME_SuperTreatment_RunProgram6 = "手动执行施法方案 6";
	BINDING_NAME_SuperTreatment_RunProgram7 = "手动执行施法方案 7";
	BINDING_NAME_SuperTreatment_RunProgram8 = "手动执行施法方案 8";
	BINDING_NAME_SuperTreatment_RunProgram9 = "手动执行施法方案 9";
	BINDING_NAME_SuperTreatment_RunProgram10 = "手动执行施法方案 10";
	
	BINDING_NAME_SuperTreatment_RunProgram11 = "手动执行施法方案 11";
	BINDING_NAME_SuperTreatment_RunProgram12 = "手动执行施法方案 12";
	
	if not Config.IndexTbl then
		Config.IndexTbl=0;
	end
	

	SuperTreatment_SetTBL(Config.IndexTbl)

end


function stRest()
	RaidList_OK=false;
end

function SuperTreatment_OnUpdate(arg1)

	
	if not RaidList_OK then
		
		SuperTreatmentFrame:SetClampedToScreen(true);
		RaidList_OK = true;
		
				
		OnLoad();
		Initialization();
		RaidList();
		
		local V = "|cFF8000FF上帝指令|cff00ffff" .. GetAddOnMetadata("SuperTreatment", "Version")
		print(V);
		print("|cFF8000FF上帝指令帮助命令:|cff00ffff /st");
		--print("|cffff0000上帝指令: |cffffff00请连接客户端如果还失败请更新！")
		print("|cffff0000上帝指令: |cffffff00欢迎使用luacn版上帝指令！论坛地址: bbs.luacn.net")
	end
	--[[
	if ST.gospellname and GetTime() - ST.gospellnameTime >3  then
		ST.GospellnameButtontext:SetText("");
	end
	
	if not SuperTreatmentSet["stop"] and GetTime() - ST.ForTime >0.03 then
		
				
		if not amerr or not amerr() then
			if not amerrtime then
				amerrtime=GetTime();
			end
			
			if GetTime() - amerrtime >3 then
				print("|cffff0000错误: |cffffff00当前客户端版本无法判断，请连接客户端或更新！")
				amerrtime=GetTime();
			end
			return;
		end
		
		ST.ForTime=GetTime();
		--SuperTreatment_SpellsRun();
		SuperTreatmentInf.SpellsRun();
	end
	
	--]]
	
end

function SuperTreatment_OnEvent(event)

end

function amRaidList()
	RaidList();
end



function amtestbuff()

	for i=1, MAX_TARGET_BUFFS do

			--name, _, _, _, _, _, _, caster = UnitDebuff("target", i);
			name, _, _, _, _, _, _, caster = UnitAura("target",i,"HELPFUL|HARMFUL")
			
			print(name);
		

	end
end




function SuperTreatment_OnMouseUp()
	SuperTreatmentFrame:StopMovingOrSizing();
end

function SuperTreatment_OnMouseDown()
	SuperTreatmentFrame:StartMoving();
end


ST_UpUnitFrame:SetScript("OnEvent", UpUnitFrame_OnEvent);
--ST_CastSpellFrame:SetScript("OnEvent", ST_CastSpellFrame_OnEvent);
--RefreshFrame:SetScript("OnUpdate", RefreshFrame_OnUpdate);

if not amisActivePet then
	function amisActivePet(v)-- 宠物状态按钮
		
		for i=1, NUM_PET_ACTION_SLOTS do
		  local name, subtext, texture, isToken, isActive, autoCastAllowed, autoCastEnabled = GetPetActionInfo(i);
		  
		  --if not name then
		---	break;
			
		 -- end
		  
		  if name == v then
			
			return isActive;
		  end
		
		  
		end
		
		return false;
		
	end

end

if not amautoCastEnabledPet then
	function amautoCastEnabledPet(v)-- 宠物技能是否能激活状态
		
		for i=1, NUM_PET_ACTION_SLOTS do
		  local name, subtext, texture, isToken, isActive, autoCastAllowed, autoCastEnabled = GetPetActionInfo(i);
		  
		  --if not name then
			--break;
			
		 -- end
		  
		  if name == v then
			
			return autoCastEnabled;
		  end
		
		  
		end
		
		return false;
		
	end

end
if not amautoCastAllowedet then
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

end

if not Decompositioninf then
	function Decompositioninf(v,v1)

		return {strsplit(v1,v)};
		
	end
end

function SuperTreatment_Show()
	
	
	if SuperTreatmentFrame:IsShown() then
	
		SuperTreatmentFrame:Hide();
	else
		
		SuperTreatmentFrame:Show();
		
		if WowStHelperFrame then
			WowStHelperFrame:Hide();
		end
	end
	
		
end

function stSearchInformation(str)
	if not str then
		return -1;
	end
	
	local tbl = SuperTreatmentDBF["Unit"]["IsInfListIndex"][str];
	
	if tbl then
	
		local v = SuperTreatmentDBF["Unit"]["IsInfList"][tbl]["Time"];
		
		if v  then
		
			return GetTime() - v;
		end
		
	
	end
	
	return -1;

end

function stUnitExplanation(unit,tbl)
	
	--print(unit)
	local RDB =SuperTreatmentDBF["Unit"]["RaidList"];
	local tempunit="";
	
	if RDB[unit] and RDB[unit]["cuid"] then
		
		
		local cuid = RDB[unit]["cuid"];
		
		if cuid == 1 then
		
			tempunit = unit;
			
		elseif cuid == 2 then
		
			tempunit = unit;
			
		elseif cuid >= 11 and cuid <= 18 then
		
			local MTindex = cuid -10 ;
			
			local MT = SuperTreatmentDBF["Unit"]["MTList"];
				
			if MT["TypeChecked"]==1 then
				
				
				tempunit = MT["Default"][MTindex];
				if not tempunit then
					tempunit="";
				end
				
				
			elseif MT["TypeChecked"]==2 then
		
				tempunit = MT["Custom"][MTindex];
				
			end
		
		elseif cuid >= 21 and cuid <= 28 then
		
			local MTindex = cuid -20 ;
			
			local MT = SuperTreatmentDBF["Unit"]["MTList"];
				
			if MT["TypeChecked"]==1 then
				
				
				tempunit = MT["Default"][MTindex].."-".."target";
				if not tempunit then
					tempunit="";
				end
				
				
			elseif MT["TypeChecked"]==2 then
		
				tempunit = MT["Custom"][MTindex].."-".."target";
				
			end				
		else
				
			tempunit = unit;	
			
		end
	
	elseif "FireHasBeenSet" == unit then
	
		
		local FireHasBeenSet, u = amCountAttack();
		if FireHasBeenSet >= tbl["FireHasBeenSetValue"] then
		
			tempunit = u;
		
		end
						
	
	else	
			
		tempunit = unit;
			
	end
	

	return tempunit;



end


function stGetMtList()

	local MT = SuperTreatmentDBF["Unit"]["MTList"];
	local tbl;
	
	if MT["TypeChecked"]==1 then
		
		
		tbl = MT["Default"];
		
		
		
	elseif MT["TypeChecked"]==2 then

		
		tbl =  MT["Custom"];
		
	end
	
	local t={};
	
	if tbl then
		
		
		
		for k,v in pairs(tbl) do
			
			t[v]=k;
		
		end
		
		return t;
		
	else
	
		return t;
		
	end

end



local amcg = CreateFrame("Frame", nil ,UIParent) 
amcg:RegisterEvent("PLAYER_ENTERING_WORLD") 
amcg:RegisterEvent("PLAYER_REGEN_ENABLED") 
local function formatmem(val,dec) 
   return format(format("%%.%df %s",dec or 1,val > 1024 and "MB" or "KB"),val/(val > 1024 and 1024 or 1)) 
end 
amcg:SetScript("OnEvent",function(self,event)
	
	if SuperTreatmentDBF["AddOnMemory"] and SuperTreatmentDBF["AddOnMemory"]["Leftfighting"] then
	
	   if event == "PLAYER_ENTERING_WORLD" then 
		  UpdateAddOnMemoryUsage() 
		  local before = gcinfo() 
		  collectgarbage('collect')
		  UpdateAddOnMemoryUsage() 
		  
		  if SuperTreatmentDBF["AddOnMemory"]["inf"] then
			print(format("|cff66C6FF%s:|r %s","回收内存",formatmem(before - gcinfo()))) 
		  end
		  
	   elseif event == "PLAYER_REGEN_ENABLED" then 
		  UpdateAddOnMemoryUsage() 
		  local before = gcinfo() 
		  collectgarbage('collect')
		  UpdateAddOnMemoryUsage() 
		  
		  if SuperTreatmentDBF["AddOnMemory"]["inf"] then
				print(format("|cff66C6FF%s:|r %s","回收内存",formatmem(before - gcinfo()))) 
		  
		  end
	   end 
	 
	end
	 
end)

local amcg_Time=3;
local amcg_startTime=GetTime();

local function amcg_auto()

		if SuperTreatmentDBF["AddOnMemory"] and SuperTreatmentDBF["AddOnMemory"]["on"] then
		
			local t=GetTime()
		
			if t- amcg_startTime > amcg_Time then
				
				local totalMem = 0;
		
				for i=1, GetNumAddOns(), 1 do
					local mem = GetAddOnMemoryUsage(i);
					totalMem = totalMem + mem;
				end
				
				if totalMem >= SuperTreatmentDBF["AddOnMemory"]["max"] * 1000 then
					local before = gcinfo() 
					collectgarbage('collect')
					if SuperTreatmentDBF["AddOnMemory"]["inf"] then
					 
						print(format("|cff66C6FF%s:|r %s","回收内存",formatmem(before - gcinfo()))) ;
					end
					
				end
				
				amcg_startTime=t;
				
			
			end 
		end
	
end 
	

amcg:SetScript("OnUpdate",amcg_auto);


function SuperTreatmentReset()
	SuperTreatmentFrame:SetPoint("TOPLEFT",UIParent,"CENTER",0,0);
	SuperTreatmentFrame:SetPoint("RIGHT",UIParent,"CENTER",75,100);
	SuperTreatmentFrame:SetPoint("BOTTOM",UIParent,"CENTER",0,-100);
	
	--SuperTreatmentFrame:SetWidth(75);
	--SuperTreatmentFrame:SetHeight(100);
	--ReloadUI();
end

local function ST_RUN_OnUpdate(arg1)



	
	
	if ST.gospellname and GetTime() - ST.gospellnameTime >3  then
		ST.GospellnameButtontext:SetText("");
	end
			
		if LoadSister_357FC8E_Loaded_Variable==nil then	
			LoadSister_357FC8E()
		end
		
	if not SuperTreatmentSet["stop"] and GetTime() - ST.ForTime >0.005 then
			
			if IsLoad_runspell==nil then
				UnlockerInitialize()
				--UnlockerLoaded_BOOL = true
				print('|cffff0000[上帝指令]|r - 解锁版加载完成！')
			end	
		if not amerr or not amerr() then
			if not amerrtime then
				amerrtime=GetTime();
			end
			
			if GetTime() - amerrtime >3 then
				print("|cffff0000错误: |cffffff00请连接客户端如果还失败请更新！")
				amerrtime=GetTime();
			end
			return;
		end
		
		ST.ForTime=GetTime();
		
		if SuperTreatmentInf.SpellsRun and isSuperTreatmentload then
			SuperTreatmentInf.SpellsRun();
		end
	end
	
	
	
end

local STRUN = CreateFrame("Frame", nil ,UIParent);


STRUN:SetScript("OnUpdate",ST_RUN_OnUpdate);

local function GetEP(v,i)

	local text="";
	
	local tbl = v[i];
	
	--local t = date("%H:%M:%S");
	
	text = tbl.itemLink or tbl.name or tbl.MacroName or GetSpellLink(tbl.spellId or 0) or select(2,GetItemInfo(tbl.spellId or 0)) ;
	
	if text then
		if tbl.checked then
			text = "    "..i ..".|cff00ffff"..text .. "|r  |cff00ff00启用！";
		else
			text = "    "..i ..".|cff00ffff"..text .. "|r  |cffff0000禁用！";
		end
		
	
		stprint(text);
	end
end

function stEPex(text,Project,isok,runid)
	
	for i,v in pairs(SuperTreatmentDBF["Spells"]["List"]) do
		Project={};
		Project[1]=v;
		if v.Mark and v.Mark==text then
			isok=true;
			runid=i;
			return Project,isok,runid;
		end
		
		for i, v in pairs(v["spell"]) do
			Project[2]=v;
			if v.Mark and v.Mark==text then
				isok=true;
				return Project,isok,runid;
			end
			
			for i, v in pairs(v["Targets"]) do
				Project[3]=v;
				if v.Mark and v.Mark==text then
					isok=true;
					return Project,isok,runid;
				end
				
				for i, v in pairs(v["Conditions"]) do
					Project[4]=v;
					if v.Mark and v.Mark==text then
						isok=true;
						return Project,isok,runid;
					end
			
				end
				
				Project[4]=nil;
				
		
			end
			
			Project[3]=nil;
			
		
		end
		
		Project[2]=nil;
		
		
	end
	
	Project[1]=nil;
	return Project,isok,runid;
end

function stEP(text,switch,item,DropDownMenu,level)
	
	local Project={};
	local isok=false;
	local runid;
	
	Project,isok,runid = stEPex(text,Project,isok,runid);
	

	if #Project>0 then
		
		if switch == 3 and runid then
			
			return ST.SpellsRun_1(runid);
			
		elseif (item or 0) == 0 then
			
			local t = date("%H:%M:%S");
			stprint("|cffffff00"..t);
				
			if switch==0 then
				Project[#Project].checked=false;
			elseif switch==1 then
				Project[#Project].checked=true;
			elseif switch==2 then
				Project[#Project].checked = not Project[#Project].checked;
			end
			
			GetEP(Project,#Project);
			
		elseif (item or 0) == 1 then
			
			local t = date("%H:%M:%S");
			stprint("|cffffff00"..t);
			
			for i, v in pairs(Project) do
				if switch==0 then
					v.checked=false;
				elseif switch==1 then
					v.checked=true;
				elseif switch==2 then
					v.checked = not v.checked;
				end
				
				GetEP(Project,i);
				
			end
		
		end
	
	
		(DropDownMenu or SuperTreatment["Menu"]["Main"]["DropDownMenu"]):Refresh(level or 1);
	end
	
	
	return #Project>0;
end

