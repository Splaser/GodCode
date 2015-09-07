
if (GetLocale() ~= 	"zhCN") then return; end;

local GetActionText = _G.GetActionText;
local GetActionTexture = _G.GetActionTexture;
local GetMapInfo = _G.GetMapInfo;
local GetCurrentMapDungeonLevel = _G.GetCurrentMapDungeonLevel;
local GetPlayerFacing = _G.GetPlayerFacing;
local GetPlayerMapPosition = _G.GetPlayerMapPosition;
local UnitIsDeadOrGhost = _G.UnitIsDeadOrGhost;
local GetRaidTargetIndex = _G.GetRaidTargetIndex;
local SetMapToCurrentZone = _G.SetMapToCurrentZone;

local setmetatable = _G.setmetatable;



local UnitInRaid = _G.UnitInRaid;
local UnitInParty = _G.UnitInParty;
local UnitIsUnit = _G.UnitIsUnit;

local GetSpellInfo = _G.GetSpellInfo;
local UnitName = _G.UnitName;
local UnitPlayerOrPetInParty = _G.UnitPlayerOrPetInParty;
local UnitPlayerOrPetInRaid = _G.UnitPlayerOrPetInRaid;
local GetRaidRosterInfo = _G.GetRaidRosterInfo;
local UnitClass = _G.UnitClass;
local UnitGroupRolesAssigned = _G.UnitGroupRolesAssigned;


local aml = aml;
local UnitHealth = _G.UnitHealth;
local UnitHealthMax = _G.UnitHealthMax;
local UnitMana = _G.UnitMana;
local UnitManaMax = _G.UnitManaMax;
local UnitDebuff = _G.UnitDebuff;
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

SuperTreatmentInf={};
local ST = SuperTreatmentInf;

function stVersion()
	local v = GetAddOnMetadata("SuperTreatment", "Version");
	v=gsub(v,"v","");
	v={strsplit(".",v)};
	v[2]=format("%02d",v[2]);
	v[3]=format("%03d",v[3]);
	
	return tonumber(v[1]..v[2]..v[3]);
end


local DungeonInf={};
	
	DungeonInf.DragonSoul="巨龙之魂";
	DungeonInf.BaradinHold="巴拉丁监狱";
	DungeonInf.TheBastionofTwilight="暮光堡垒";
	DungeonInf.BlackwingDescent="黑翼血环";
	DungeonInf.TheRubySanctum="龙眠神殿";
	DungeonInf.TheObsidianSanctum="龙眠神殿";
	DungeonInf.TheArgentColiseum="十字军的试炼";
	DungeonInf.TheEyeofEternity="永恒之眼";
	DungeonInf.Firelands="火焰之地";
	DungeonInf.IcecrownCitadel="冰冠堡垒";
	DungeonInf.Naxxramas="纳克萨玛斯";
	DungeonInf.OnyxiasLair="奥妮克希亚";
	DungeonInf.BlackrockCaverns="黑石岩窟";
	
	
	
	DungeonInf.TheDeadmines="死亡矿井";
	
	DungeonInf.EndTime="时光之末";
	
	
	DungeonInf.GrimBatol="格瑞姆巴托";
	DungeonInf.HallsofOrigination="起源大厅";
	DungeonInf.HourofTwilight="暮光审判";
	
	
	DungeonInf.LostCityofTolvir="托维尔失落之城";
	
	DungeonInf.ShadowfangKeep="影牙城堡";
	DungeonInf.TheStonecore="巨石之核";
	
	DungeonInf.Skywall="旋云之巅";
	
	
	DungeonInf.ThroneofTides="潮汐王座";
	DungeonInf.WellofEternity="永恒之井";
	
	DungeonInf.ZulAman="祖阿曼";
	DungeonInf.ZulGurub="祖尔格拉布";
	DungeonInf.ThroneoftheFourWinds="风神王座";
	DungeonInf.Ulduar="奥杜尔";
	DungeonInf.VaultofArchavon="阿尔卡冯的宝库";
	
	
	
	

local TYPEINF={};
	TYPEINF["String"]="字符";
	TYPEINF["Boolean"]="布尔值";
	TYPEINF["Number"]="数值";
	TYPEINF["unit"]="目标";
	TYPEINF[""]="空字符";

SuperTreatmentInf.ChatExplain = {};	
local ChatExplain = SuperTreatmentInf.ChatExplain;

	ChatExplain[1]={};
	ChatExplain[1]["command"]="SAY";
	ChatExplain[1]["inf"]="说";
		
	ChatExplain[2]={};
	ChatExplain[2]["command"]="YELL";
	ChatExplain[2]["inf"]="大喊";

	
	ChatExplain[3]={};
	ChatExplain[3]["command"]="PARTY";
	ChatExplain[3]["inf"]="小队";
	
	
	ChatExplain[4]={};
	ChatExplain[4]["command"]="RAID";
	ChatExplain[4]["inf"]="团队";

	
	ChatExplain[5]={};
	ChatExplain[5]["command"]="RAID_WARNING";
	ChatExplain[5]["inf"]="团队警报";
	
	
	ChatExplain[6]={};
	ChatExplain[6]["command"]="BATTLEGROUND";
	ChatExplain[6]["inf"]="战场";
	
	
	ChatExplain[7]={};
	ChatExplain[7]["command"]="GUILD";
	ChatExplain[7]["inf"]="公会";
	
	
	ChatExplain[8]={};
	ChatExplain[8]["command"]="OFFICER";
	ChatExplain[8]["inf"]="官员";
	
	
	ChatExplain[9]={};
	ChatExplain[9]["command"]="EMOTE";
	ChatExplain[9]["inf"]="表情";
	
	
	ChatExplain[10]={};
	ChatExplain[10]["command"]="channel";
	ChatExplain[10]["inf"]="频道";
	
	ChatExplain[11]={};
	ChatExplain[11]["command"]="print";
	ChatExplain[11]["inf"]="打印到屏幕";
	
	
	
	
local amAddOnsName= {};
amAddOnsName["GC"]=true;
amAddOnsName["scriptassist"]=true;
amAddOnsName["scriptassistclass"]=true;
amAddOnsName["superdupermacro"]=true;
amAddOnsName["supertreatment"]=true;
amAddOnsName["magiccast"]=true;
 
local topAddOns = {}
for i=1, GetNumAddOns() do
	topAddOns[i] = { value = 0, name = "" };
end


local ImportProgramText = {};

local StColors={};
StColors.RED = "|cffff0000";
StColors.GREEN = "|cff00ff00";
StColors.BLUE = "|cff0000ff";
StColors.MAGENTA = "|cffff00ff";
StColors.YELLOW = "|cffffff00";
StColors.CYAN = "|cff00ffff";
StColors.WHITE = "|cffffffff";


UIDROPDOWNMENU_SHOW_TIME=12;
SuperTreatmentAllDBF={};
SuperTreatmentAllDBF["Programs"]={};
SuperTreatmentAllDBF["SetSounds"]={};

CollectionInf={};
CollectionInf["Buff_Spell"]={};
CollectionInf["Buff_Spell"]["Buff"]={};
CollectionInf["Buff_Spell"]["Spell"]={};
CollectionInf["Buff_Spell"]["Totems"]={};
CollectionInf["Buff_Spell"]["level"]=0;


SuperTreatmentInf["UP"]={};
SuperTreatmentInf.cq={}
SuperTreatmentInf["Multitasking"]={};




SuperTreatmentDBF={};
SuperTreatmentDBF["Unit"]={};
SuperTreatmentDBF["Unit"]["RaidList"]={};
SuperTreatmentDBF["Unit"]["RaidListClass"]={};
SuperTreatmentDBF["Unit"]["TeamCount"]={};
SuperTreatmentDBF["Unit"]["CustomizeIndex"]=0;
SuperTreatmentDBF["Config"]={};
SuperTreatmentDBF["Spells"]={};
SuperTreatmentDBF["Spells"]["List"]={};
--SuperTreatmentDBF["Spells"]["List"][1]={};
--SuperTreatmentDBF["Spells"]["List"][1]["spell"]={};

SuperTreatmentDBF["Macro"]={};


SuperTreatmentSet={};
SuperTreatmentSet["stop"]=true;

local Cq=SuperTreatmentInf.cq;
local UnitDB =SuperTreatmentDBF["Unit"];
local RDB =SuperTreatmentDBF["Unit"]["RaidList"];
local Config = SuperTreatmentDBF["Config"];
local Spells;-- = SuperTreatmentDBF["Spells"]["List"][1]["spell"];

local ExpandArrow = "Interface\\ChatFrame\\ChatFrameExpandArrow";

local CheckDisabled = "Interface\\Buttons\\UI-CheckBox-Check-Disabled";
RaidIndex=_G.tostring(_G.format("1%.8f",_G.math.pi));
local TargetContrast={};
	
	TargetContrast["player"]="自己";
	TargetContrast["target"]="当前目标";
	TargetContrast["targettarget"]="当前目标的目标";
	TargetContrast["focus"]="焦点目标";
	TargetContrast["focustarget"]="焦点目标的目标";
	TargetContrast["FireHasBeenSet"]="被集火目标";
	TargetContrast["mouseover"]="鼠标目标";
	TargetContrast["mouseovertarget"]="鼠标目标的目标";
	TargetContrast["SelectedTarget"]="团/队";
	
	TargetContrast["party"]="小队";
	TargetContrast["partypet"]="小队宠物";
	TargetContrast["raid"]="团队";
	TargetContrast["raidpet"]="团队宠物";
	TargetContrast["arena"]="竞技场敌人小队";
	TargetContrast["FHenemies"]="(FH)敌对目标列表";

	TargetContrast["maintank"]="所有MT";
	
	TargetContrast["partyraid"]="小队/团队";
	TargetContrast["partyraidpet"]="小队/团队宠物";




function stGetTargetContrast(id)
	
	return TargetContrast[id] or SuperTreatmentDBF["Unit"]["RaidList"][id]["name"] or id;

end	
	
	
local function NOT(v,text) 
	if v["not"] then
		return text .. "|cffff0000 [Not]|r";
	else
		return text;
	end
end

local NOTT= "\n|cffff0000条件取反: |cffffffffAlt + 鼠标左键|r\n\n|cffff0000注:|r男人取反，还可能是人妖。";

local E={};

E.KEY_BUFF="|cff00ff00指定该Buff是否自己的:\n\n|cffff0000启用: |cffffffffShift + 鼠标左键\n\n|cff00ff00当有同名出现时通过启用对比图标来判断:\n\n|cffff0000启用: |cffffffffCtrl + 鼠标左键\n\n|cff00ff00当有同名出现时通过启用对比Id来判断:\n\n|cffff0000启用: |cffffffffAlt + 鼠标左键\n\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键|r";


E.IsTexture="|cffff0000[|cff00ffff图|cffff0000]|r";
E.IsSpellId="|cffff0000[|cff00ffffId|cffff0000]|r";
E.IsPlayer_Player="|cffff0000[|cff00ffff我|cffff0000]|r";
E.IsPlayer_NoPlayer="|cffff0000[|cff00ffff否|cffff0000]|r";
E.IsPlayer_All="";
E.IsCd_Start="|cffff0000[|cff00ffff出|cffff0000]|r";


local powerType={};
--[[
powerType[-2]="Health";
powerType[0]="Mana";
powerType[1]="Rage";
powerType[2]="Focus";
powerType[3]="Energy";
powerType[4]="Happiness";
powerType[5]="Rune";
powerType[6]="Runic Power";
--]]

powerType[-2]="健康";
powerType[0]="法力";
powerType[1]="怒气";
powerType[2]="集中";
powerType[3]="能量";
powerType[4]="快乐";
powerType[5]="符文";
powerType[6]="符能";
powerType[7]="灵魂碎片";
powerType[8]="日/月食";
powerType[9]="神圣";


local RuneType={};

	if GetLocale()=="zhCN" then
		
		RuneType[1] = "鲜血符文";
		RuneType[2] = "邪恶符文";
		RuneType[3] = "冰霜符文";
		RuneType[4] = "死亡符文";
			
	elseif GetLocale()=="zhTW" then
		
		RuneType[1] = "血魄符文";
		RuneType[2] = "秽邪符文";
		RuneType[3] = "冰霜符文";
		RuneType[4] = "死亡符文";

	else
	
		RuneType[1] = "Blood Rune";
		RuneType[2] = "Unholy Rune";
		RuneType[3] = "Frost Rune";
		RuneType[4] = "Death Rune";
		


	end

	

local RemoteProfessional={};
local MeleeProfessional={};

RemoteProfessional["WARLOCK"]=true;
RemoteProfessional["HUNTER"]=true;
RemoteProfessional["MAGE"]=true;
RemoteProfessional["PRIEST"]=true;

MeleeProfessional["WARRIOR"]=true;
MeleeProfessional["DRUID"]=true;
MeleeProfessional["PALADIN"]=true;
MeleeProfessional["SHAMAN"]=true;
MeleeProfessional["ROGUE"]=true;
MeleeProfessional["DEATHKNIGHT"]=true;

local ClassName=AM_CLASS_NAME;



local PetTexureinf={};
 PetTexureinf.PET_DEFENSIVE_TEXTURE = "Interface\\Icons\\Ability_Defend";
 PetTexureinf.PET_AGGRESSIVE_TEXTURE = "Interface\\Icons\\Ability_Racial_BloodRage";
 PetTexureinf.PET_PASSIVE_TEXTURE = "Interface\\Icons\\Ability_Seal";
 PetTexureinf.PET_ATTACK_TEXTURE = "Interface\\Icons\\Ability_GhoulFrenzy";
 PetTexureinf.PET_FOLLOW_TEXTURE = "Interface\\Icons\\Ability_Tracking";
 PetTexureinf.PET_WAIT_TEXTURE = "Interface\\Icons\\Spell_Nature_TimeStop";
 PetTexureinf.PET_DISMISS_TEXTURE = "Interface\\Icons\\Spell_Shadow_Teleport";
 PetTexureinf.PET_MOVE_TO_TEXTURE = "Interface\\Icons\\Ability_Hunter_Pet_Goto";
 PetTexureinf.PET_ASSIST_TEXTURE = PET_ASSIST_TEXTURE;
 
local PetspellInf={};

PetspellInf["PET_ACTION_ATTACK"]={};
PetspellInf["PET_ACTION_ATTACK"]["name"]="攻击";
PetspellInf["PET_ACTION_ATTACK"]["texture"]=PET_ATTACK_TEXTURE;
PetspellInf["PET_ACTION_ATTACK"]["macro"]='if amGetUnitName("pet",true) and amGetUnitName("*unit",true) and amuca("*unit") and UnitGUID("pettarget")~=UnitGUID("*unit") then amrun("/petattack *unit");return true; else return false; end;';
PetspellInf["PET_ACTION_ATTACK"]["unit"]="target";
PetspellInf["PET_ACTION_ATTACK"]["unitname"]="当前目标";
PetspellInf["PET_ACTION_ATTACK"]["type"]="script";
PetspellInf["PET_ACTION_ATTACK"]["PropertiesSetChecked"]=3;

PetspellInf["PET_ACTION_FOLLOW"]={};
PetspellInf["PET_ACTION_FOLLOW"]["name"]="跟随";
PetspellInf["PET_ACTION_FOLLOW"]["texture"]=PET_FOLLOW_TEXTURE;
PetspellInf["PET_ACTION_FOLLOW"]["macro"]='if not amisActivePet("PET_ACTION_FOLLOW") then amrun("/petfollow");return true;end;';
PetspellInf["PET_ACTION_FOLLOW"]["unit"]="nogoal";
PetspellInf["PET_ACTION_FOLLOW"]["unitname"]="无目标";
PetspellInf["PET_ACTION_FOLLOW"]["type"]="script";
PetspellInf["PET_ACTION_FOLLOW"]["PropertiesSetChecked"]=3;

PetspellInf["PET_ACTION_WAIT"]={};
PetspellInf["PET_ACTION_WAIT"]["name"]="停留";
PetspellInf["PET_ACTION_WAIT"]["texture"]=PET_WAIT_TEXTURE;
PetspellInf["PET_ACTION_WAIT"]["macro"]='if not amisActivePet("PET_ACTION_WAIT") then amrun("/petstay");return true;end;';
PetspellInf["PET_ACTION_WAIT"]["unit"]="nogoal";
PetspellInf["PET_ACTION_WAIT"]["unitname"]="无目标";
PetspellInf["PET_ACTION_WAIT"]["type"]="script";
PetspellInf["PET_ACTION_WAIT"]["PropertiesSetChecked"]=3;

PetspellInf["PET_MODE_AGGRESSIVE"]={};
PetspellInf["PET_MODE_AGGRESSIVE"]["name"]="攻击型";
PetspellInf["PET_MODE_AGGRESSIVE"]["texture"]=PET_AGGRESSIVE_TEXTURE;
PetspellInf["PET_MODE_AGGRESSIVE"]["macro"]='if not amisActivePet("PET_MODE_AGGRESSIVE") then amrun("/petaggressive");return true;end;';
PetspellInf["PET_MODE_AGGRESSIVE"]["unit"]="nogoal";
PetspellInf["PET_MODE_AGGRESSIVE"]["unitname"]="无目标";
PetspellInf["PET_MODE_AGGRESSIVE"]["type"]="script";
PetspellInf["PET_MODE_AGGRESSIVE"]["PropertiesSetChecked"]=3;

PetspellInf["PET_MODE_DEFENSIVE"]={};
PetspellInf["PET_MODE_DEFENSIVE"]["name"]="防御型";
PetspellInf["PET_MODE_DEFENSIVE"]["texture"]=PET_DEFENSIVE_TEXTURE;
PetspellInf["PET_MODE_DEFENSIVE"]["macro"]='if not amisActivePet("PET_MODE_DEFENSIVE") then amrun("/petdefensive");return true;end;';
PetspellInf["PET_MODE_DEFENSIVE"]["unit"]="nogoal";
PetspellInf["PET_MODE_DEFENSIVE"]["unitname"]="无目标";
PetspellInf["PET_MODE_DEFENSIVE"]["type"]="script";
PetspellInf["PET_MODE_DEFENSIVE"]["PropertiesSetChecked"]=3;

PetspellInf["PET_MODE_PASSIVE"]={};
PetspellInf["PET_MODE_PASSIVE"]["name"]="被动型";
PetspellInf["PET_MODE_PASSIVE"]["texture"]=PET_PASSIVE_TEXTURE;
PetspellInf["PET_MODE_PASSIVE"]["macro"]='if not amisActivePet("PET_MODE_PASSIVE") then amrun("/petpassive");return true;end;';
PetspellInf["PET_MODE_PASSIVE"]["unit"]="nogoal";
PetspellInf["PET_MODE_PASSIVE"]["unitname"]="无目标";
PetspellInf["PET_MODE_PASSIVE"]["type"]="script";
PetspellInf["PET_MODE_PASSIVE"]["PropertiesSetChecked"]=3;

PetspellInf["PET_MODE_ASSIST"]={};
PetspellInf["PET_MODE_ASSIST"]["name"]="协助";
PetspellInf["PET_MODE_ASSIST"]["texture"]=PET_ASSIST_TEXTURE;
PetspellInf["PET_MODE_ASSIST"]["macro"]='if not amisActivePet("PET_MODE_ASSIST") then amrun("/petassist");return true;end;';
PetspellInf["PET_MODE_ASSIST"]["unit"]="nogoal";
PetspellInf["PET_MODE_ASSIST"]["unitname"]="无目标";
PetspellInf["PET_MODE_ASSIST"]["type"]="script";
PetspellInf["PET_MODE_ASSIST"]["PropertiesSetChecked"]=3;


PetspellInf["PET_ACTION_MOVE_TO"]={};
PetspellInf["PET_ACTION_MOVE_TO"]["name"]="前往";
PetspellInf["PET_ACTION_MOVE_TO"]["texture"]=PET_MOVE_TO_TEXTURE;
PetspellInf["PET_ACTION_MOVE_TO"]["macro"]='if UnitName("pet") then amrun("/petmoveto");return true; end;';
PetspellInf["PET_ACTION_MOVE_TO"]["unit"]="nogoal";
PetspellInf["PET_ACTION_MOVE_TO"]["unitname"]="无目标";
PetspellInf["PET_ACTION_MOVE_TO"]["type"]="script";
PetspellInf["PET_ACTION_MOVE_TO"]["PropertiesSetChecked"]=3;

PetspellInf["PetDismiss"]={};
PetspellInf["PetDismiss"]["name"]="收起宠物";
PetspellInf["PetDismiss"]["texture"]="";
PetspellInf["PetDismiss"]["macro"]='if UnitName("pet") then PetDismiss();return true; end;';
PetspellInf["PetDismiss"]["unit"]="nogoal";
PetspellInf["PetDismiss"]["unitname"]="无目标";
PetspellInf["PetDismiss"]["type"]="script";
PetspellInf["PetDismiss"]["PropertiesSetChecked"]=3;

PetspellInf["PetStopAttack"]={};
PetspellInf["PetStopAttack"]["name"]="停止攻击并跟随";
PetspellInf["PetStopAttack"]["texture"]="";
PetspellInf["PetStopAttack"]["macro"]='if amGetUnitName("pettarget",true) then amrun("/petfollow");return true; end;';
PetspellInf["PetStopAttack"]["unit"]="nogoal";
PetspellInf["PetStopAttack"]["unitname"]="无目标";
PetspellInf["PetStopAttack"]["type"]="script";
PetspellInf["PetStopAttack"]["PropertiesSetChecked"]=3;

for k, data in pairs(PetspellInf) do
	data["lock"]=true;
	
end

--[[
(1)PET_ACTION_ATTACK,PET_ATTACK_TEXTURE,
(2)PET_ACTION_FOLLOW,PET_FOLLOW_TEXTURE,
(3)PET_ACTION_WAIT,PET_WAIT_TEXTURE,

(4)吞噬魔法,Interface\Icons\Spell_Nature_Purge,
(5)暗影撕咬,Interface\Icons\Spell_Shadow_SoulLeech_3,
(6)法术封锁,Interface\Icons\Spell_Shadow_MindRot,
(7)邪能智力,Interface\Icons\Spell_Nature_WispSplode,
(8)PET_MODE_AGGRESSIVE,PET_AGGRESSIVE_TEXTURE,
(9)PET_MODE_DEFENSIVE,PET_DEFENSIVE_TEXTURE,
(10)PET_MODE_PASSIVE,PET_PASSIVE_TEXTURE,

--]]

SuperTreatment["Menu"]["Main"]={};
SuperTreatment["Menu"]["Main"]["addon"]={}
local addon = SuperTreatment["Menu"]["Main"]["addon"];
addon.title = "上帝指令"
addon.Version = "115.5"--GetAddOnMetadata("SuperTreatment", "Version")


SuperTreatment["Menu"]["Main"]["DropDownMenu"] = amMenu("MainMenu")

local DropDownMenu = SuperTreatment["Menu"]["Main"]["DropDownMenu"];


DropDownMenu:SetMenuRequestFunc(addon, "OnMenuRequest")

--print(SuperTreatment["Menu"]["Main"]["DropDownMenu"].menuRequestObject)

addon["MenuLevel"]=0;
addon["MenuLevel_name"]="";
addon["MenuLevelTargetListSelect"]=0;
addon["MenuLevelTargetSelect"]=0;
SuperTreatmentInf.cls={{101,112,100},{98,111,101},{112,110,110}};

local pushButton=CreateFrame("Button","SuperTreatmentFrame_open",SuperTreatmentFrame,"UIPanelButtonTemplate");
	pushButton:SetWidth(65);
	pushButton:SetHeight(22);
	pushButton:SetPoint("TOPLEFT",SuperTreatmentFrame,"TOPLEFT",5,-50);
	pushButton:SetText("菜单");
	pushButton:SetScript("OnClick",function(self)
	
	if SuperTreatmentAllDBF.MenusWinDows == nil then
		SuperTreatmentAllDBF.MenusWinDows=true;
	end
	
	DropDownMenu:SetMenusWinDows(SuperTreatmentAllDBF.MenusWinDows);
	
	for p, v in pairs(SuperTreatmentAllDBF.SetSounds or {}) do
	
		DropDownMenu:SetSounds(p,v);
		
	end
	
	
	DropDownMenu:Toggle("TOPLEFT", self, "BOTTOMLEFT") ;
	end);
	
	
local Buttontext =SuperTreatmentFrame:CreateFontString();
	Buttontext:SetFontObject("GameFontNormal");
	Buttontext:SetPoint("TOPLEFT",SuperTreatmentFrame,"TOPLEFT",5,-3);
	Buttontext:SetText("上帝指令");
	Buttontext:SetWidth(80);
	Buttontext:SetHeight(16);
	Buttontext:SetJustifyH("LEFT")	
local Buttontext =SuperTreatmentFrame:CreateFontString();
	Buttontext:SetFontObject("GameFontNormal");
	Buttontext:SetPoint("TOPLEFT",SuperTreatmentFrame,"TOPLEFT",5,-75);
	Buttontext:SetText(addon.Version);
	Buttontext:SetWidth(65);
	Buttontext:SetHeight(16);
	Buttontext:SetJustifyH("CENTER")
	
local Buttonstop =CreateFrame("Button","SuperTreatmentFrame_stop",SuperTreatmentFrame,"UIPanelButtonTemplate");
	Buttonstop:SetWidth(65);
	Buttonstop:SetHeight(22);
	Buttonstop:SetPoint("TOPLEFT",SuperTreatmentFrame,"TOPLEFT",5,-25);
	Buttonstop:SetText("运行");
	Buttonstop:SetScript("OnClick",function(self) 
	
				
		
		if SuperTreatmentSet["stop"] then
			
			Buttonstop:SetText("停止");
			SuperTreatmentSet["stop"]=false;
			
			
			
			print("|cff00ff00上帝指令正在运行！")
			
		else
			
			Buttonstop:SetText("运行");
			SuperTreatmentSet["stop"]=true;
			SuperTreatmentInf["Multitasking"]["MultitaskingStart"]=false;
			print("|cffff0000上帝指令已经停止！")
			
		end
		
	
	end);


function amGetHandle(obj) 

	return obj ;
end


function GC_TA_DB_Frame_Button_Memu_OnClick(self)
	--DropDownMenu:SetMenuRequestFunc(addon, "OnMenuRequest") 
	DropDownMenu:Toggle("TOPLEFT", self, "BOTTOMLEFT")
end


-- 定义菜单内容充填函数 "OnMenuRequest"
function addon:OnMenuRequest(level, value, menu,MenuEx,GlobalLevel)

	--print(">>",GlobalLevel)

	if level == 1 then -- 1级菜单内容
		
		local Solution = SuperTreatmentDBF["Spells"]["List"];
		
		local Colors ="|cffFFA500";		
		menu:AddLine("text", "※"..SuperTreatmentDBF["name"] ,"isTitle",1,
		"ToggleButton",1,"ToggleButtonFun",function()
					SuperTreatmentDBF.IsAdvancedSettings1_1=not SuperTreatmentDBF.IsAdvancedSettings1_1;
					DropDownMenu:Refresh(level);
					
					end,
					"ToggleState",SuperTreatmentDBF.IsAdvancedSettings1_1,
					"ToggleX",-5
					
					);	
					
		if not SuperTreatmentDBF.IsAdvancedSettings1_1 then
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",16);
			--[[
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",16,"LineY",0,
			"ToggleButton",1,"ToggleButtonFun",function()
					SuperTreatmentDBF.IsAdvancedSettings=not SuperTreatmentDBF.IsAdvancedSettings;
					DropDownMenu:Refresh(level);
					
					end,
					"ToggleState",SuperTreatmentDBF.IsAdvancedSettings
					
					);	

			--]]
		
			menu:AddLine("text", "|cff104E8B① "..Colors.."方案管理" , "hasArrow", 1, "value", "SysPrograms",
			"text_X",-22
			
			);
			
			menu:AddLine("line",1);
			
			menu:AddLine("text", "|cff104E8B② "..Colors.."系统设定" , "hasArrow", 1, "value", "SysSet",
			"text_X",-22
			);
			
			menu:AddLine("line",1);
			
			menu:AddLine("text", "|cff104E8B③ "..Colors.."快速加载方案" , "hasArrow", 1, "value", "FastLoadingProject",
			"text_X",-22
			);
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			
		
			menu:AddLine("text", "|cff104E8B④ "..Colors.."方案设定" , "hasArrow", 1, "value", "DefaultList",
			"text_X",-22
			);
			
			menu:AddLine("line",1);
			
			menu:AddLine("text", "|cff104E8B⑤ "..Colors.."快速设定" , "hasArrow", 1, "value", "GlobalQuickSetup",
			"text_X",-22
			);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			
			
			--local str = addon:FormatTooltipText("请先建立个施法方案(菜单)理论上可以建立N个，把鼠标移到刚建好的方案上您会获得更多下一步怎么做的信息。\n\n方案有优先级别前面的比后面的优先(废话但有小白问过我)鼠标移到方案上显示操作方式帮助。|r\n\n提示小白多移动鼠标到菜单上有帮助提示，选择(菜单打钩)代表启用该选项");
			--[[
			local str = addon:FormatTooltipText("请先建立个施法方案(菜单)理论上可以建立N个，把鼠标移到刚建好的方案上您会获得更多下一步怎么做的信息。\n\n方案有优先级别前面的比后面的优先(废话但有小白问过我)鼠标移到方案上显示操作方式帮助。|r\n\n提示小白多移动鼠标到菜单上有帮助提示，选择(菜单打钩)代表启用该选项");
					
			menu:AddLine("text", "|cff00ff00帮助","tooltipText",str,"tooltipTitle","帮助","icon","Interface\\Icons\\INV_Misc_QuestionMark");
			]]--
			local str = addon:FormatTooltipText("论坛：bbs.luacn.net。\n\n2015巨型青蛙修复|r\n\n原作者：stimulate");
			menu:AddLine("text", "|cff00ff00关于","tooltipText",str,"tooltipTitle","关于","icon","Interface\\Icons\\INV_Misc_QuestionMark");
				
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			if SuperTreatmentAllDBF.HelpNavigation==nil then
				SuperTreatmentAllDBF.HelpNavigation=true;
			end
			
			menu:AddLine("text", "|cff00ff00启动帮助向导", "checked",SuperTreatmentAllDBF.HelpNavigation,
			"func","SetHelpNavigation","arg1", self,
			"inftitle","开始向导",
			"inftext","点击菜单，启动入门向导。",
			"infx",0,
			"infy",-12,
			"infid",0,
			"infchecked",#Solution<=0 and not SuperTreatmentAllDBF.HelpNavigation
			);
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			menu:AddLine();
		
		
		
			local str = addon:FormatTooltipText("输入新建方案名称，完成后在下方列表显示新建好的方案，您可以对它进行编辑完善。");
			menu:AddLine("text","施法方案:"  ,"isTitle",1,
			--"justifyH","CENTER",
			"ToggleButton",1,"ToggleButtonFun",function()
					SuperTreatmentDBF.IsAdvancedSettings1_2=not SuperTreatmentDBF.IsAdvancedSettings1_2;
					DropDownMenu:Refresh(level);
					
					end,
					"ToggleState",SuperTreatmentDBF.IsAdvancedSettings1_2,
					"ToggleX",-5,"ToggleY",3
			
			);
			
			if not SuperTreatmentDBF.IsAdvancedSettings1_2 then
			
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
				
				menu:AddLine("text", "|cff00ffff新建施法方案","hasEditBox", 1,
				"editBoxText", self.text, "editBoxFunc", "AddMagicSolution",
				"editBoxArg1", self,
				"icon","INTERFACE\\ICONS\\Ability_Hunter_OneWithNature",
				"tooltipText",str,"tooltipTitle","新建施法方案",
				"inftitle","第一步",
				"inftext","输入新建方案名称",
				"infx",0,
				"infy",-12,
				"infid",1,
				"infchecked",SuperTreatmentAllDBF.HelpNavigation
				
				);
			
			
				--menu:AddLine();
				menu:AddLine("line",1,"LineHeight",8);
			
			end
		else
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10,"LineY",0);
		end
		
		if not SuperTreatmentDBF.IsAdvancedSettings1_2 then
			for k,v in pairs(Solution) do
				
				if not v.Key then
					v.Key={};
				end
				
				if not v.Mark then
					v.Mark=amrandom(k);
				end
				
				if not v.Key.KeySelect then
					v.Key.KeySelect="auto";
				end
				
				local Color;
				if v["checked"] then
				
					Color = "|cffCD3333";
					
				else
					Color = "|cffffffff";
					
				end
				--[[
				local str = addon:FormatTooltipText(v["Remarks"]);
				
				str = str .. "|cffff0000上移: |cffffffffCtrl + 鼠标左键";
				str = str .. "\n|cffff0000下移: |cffffffffAlt  + 鼠标左键";
				str = str .. "\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键";
				--]]
				local str={};
				
				str[1]={};
				str[1]["type"]="AddLine";
				str[1]["text"]=" ";
				
				
				str[2]={};
				str[2]["type"]="AddDoubleLine";
				str[2]["left"]="|cffffff00上移:";
				str[2]["right"]="|cffffffffCtrl + 鼠标左键";
				
				str[3]={};
				str[3]["type"]="AddDoubleLine";
				str[3]["left"]="|cffffff00下移:";
				str[3]["right"]="|cffffffffAlt  + 鼠标左键";
							
				str[4]={};
				str[4]["type"]="AddDoubleLine";
				str[4]["left"]="|cffffff00删除:";
				str[4]["right"]="|cffffffffCtrl + Alt + 鼠标左键";
				
				str[5]={};
				str[5]["type"]="AddDoubleLine";
				str[5]["left"]="|cffffff00属性:";
				str[5]["right"]="|cffffffff鼠标右键";
				
				local keytype;
							
				if v.Key.KeySelect=="auto" then
					keytype="选择/放弃";
				elseif v.Key.KeySelect=="no" then
					keytype="放弃";
				elseif v.Key.KeySelect=="ok" then
					keytype="选择";
				elseif v.Key.KeySelect=="run" then
					keytype="执行";
				elseif v.Key.KeySelect=="auto1" then
					keytype="选择/放弃(全)";
				elseif v.Key.KeySelect=="no1" then
					keytype="放弃(全)";
				elseif v.Key.KeySelect=="ok1" then
					keytype="选择(全)";
				end
						
				
				if v.Key and v.Key.Checked and v.Key.Value and v.Key.Value ~="" then
				
					str[6]={};
					str[6]["type"]="AddDoubleLine";
					str[6]["left"]="|cffffff00快捷键:";
					str[6]["right"]="|cffffffff" .. (v.Key.Value or "");
				
				
					
					
					str[7]={};
					str[7]["type"]="AddDoubleLine";
					str[7]["left"]="|cffffff00快捷键类型:";
					str[7]["right"]="|cffffffff" .. (keytype or "");
				
				else
					
					str[6]={};
					str[6]["type"]="AddDoubleLine";
					str[6]["left"]="快捷键:";
					str[6]["right"]=(v.Key.Value or "");
					str[6].rL, str[6].gL, str[6].bL = GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b;
					str[6].rR, str[6].gR, str[6].bR = GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b;
					
					
					
					str[7]={};
					str[7]["type"]="AddDoubleLine";
					str[7]["left"]="快捷键类型:";
					str[7]["right"]=(keytype or "");
					str[7].rL, str[7].gL, str[7].bL = GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b;
					str[7].rR, str[7].gR, str[7].bR = GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b;
				end
				
				
					str[8]={};
					str[8]["type"]="AddDoubleLine";
					str[8]["left"]="|cffffff00Id:";
					str[8]["right"]="|cffffffff" .. (v.Mark or "");
				
				
				local tbl={};
				tbl.CastProgram={};
				local ex = tbl.CastProgram;
					ex.copy ={}; 
					ex.copy.fun =function()
								SuperTreatmentInf["Copyexchange"]["CastProgram"]=v;
								DropDownMenu:Refresh(level);
							end; 
					ex.copy.arg1 = v;
					
					ex.Paste ={}; 
					ex.Paste.fun = function()
						local TBL = th_table_dup(SuperTreatmentInf["Copyexchange"]["CastProgram"]);
						--if TBL.Key.ButtonFrame and TBL.Key.ButtonFrame.SetAttribute then
						--	ClearOverrideBindings(TBL.Key.ButtonFrame);
						--end
						TBL["name"] = TBL["name"] .. "("..date("%H:%M:%S")..")";
						
						stRefreshMark(TBL);
						stCancelKey(TBL,1);
						--TBL.Key={};
						--TBL.Key.KeySelect = "auto";
						--TBL.Mark=amrandom(k);
						table.insert(Solution,k, TBL);
						DropDownMenu:Refresh(level);
					end; 
					
					
	
	
					ex.Paste.arg1 = {Solution,k};
					ex.Paste.checked=function() return SuperTreatmentInf["Copyexchange"]["CastProgram"];end;
					
					ex.Del ={}; 
					ex.Del.fun = function() 
					table.remove(Solution,k);
					DropDownMenu:Refresh(level);
					DropDownMenu:ArrowHide(self,level);
					end; 
					
					ex.Up ={}; 
					ex.Up.fun = function() 
						if k>1 then
							local NewTblA = th_table_dup(Solution[k]);
							local NewTblB = th_table_dup(Solution[k-1]);
							Solution[k-1]=NewTblA;
							Solution[k]=NewTblB;						
							DropDownMenu:Refresh(level);
						end
					end;
					
					ex.Down ={}; 
					ex.Down.fun = function() 
						local n = #(Solution);
						if k<n then
							local NewTblA = th_table_dup(Solution[k]);
							local NewTblB = th_table_dup(Solution[k+1]);
							Solution[k+1]=NewTblA;
							Solution[k]=NewTblB;
							DropDownMenu:Refresh(level);
						
						end
					end;
									
					ex.text =v["name"];
					ex.index =k;
					ex.tbl = Solution;
					ex.Renamed=true;
				
				if k == 1 then
					menu:AddLine("text", "|cff104E8B" .. k .. ". " .. Color .. v["name"],"hasArrow", 1, "value", "MagicSolution_" .. k,"checked",v["checked"],
					"func", "ListMagicSolution_checked","arg1", self,"arg2", {Solution,k},"tooltipText",str,"tooltipTitle","施法方案",
					"inftitle","第二步",
					"inftext","鼠标放到此菜单上继续后面的设定。",
					"infx",0,
					"infy",-12,
					"infid",2,
					"infchecked",SuperTreatmentAllDBF.HelpNavigation,
					"OpenRightMenu",SuperTreatment["Menu"]["OpenRightMenu"],
					"OpenRightMenuValue",tbl
					);
					
				else
					
					
					
					
					menu:AddLine("text", "|cff104E8B" .. k .. ". " .. Color .. v["name"],"hasArrow", 1, "value", "MagicSolution_" .. k,"checked",v["checked"],
					"func", "ListMagicSolution_checked","arg1", self,"arg2", {Solution,k},"tooltipText",str,"tooltipTitle","施法方案",
					"OpenRightMenu",SuperTreatment["Menu"]["OpenRightMenu"],
					"OpenRightMenuValue",tbl
					);
				
				end
				
				menu:AddLine("line",1);
			end
			
			if #Solution==0 then
				
				local tbl={};
				tbl.CastProgramAdd={};
				local ex = tbl.CastProgramAdd;
				
				ex.Paste ={}; 
					ex.Paste.fun = function()
						local TBL = th_table_dup(SuperTreatmentInf["Copyexchange"]["CastProgram"]);
						
						TBL["name"] = TBL["name"] .. "("..date("%H:%M:%S")..")";
						
						stRefreshMark(TBL);
						stCancelKey(TBL,1);
						
						table.insert(Solution,TBL);
						DropDownMenu:Refresh(level);
					end; 
					
					
					ex.Paste.checked=function() return SuperTreatmentInf["Copyexchange"]["CastProgram"];end;
				
				
				
				local str = addon:FormatTooltipText("注意:鼠标右键可以粘贴。");
				menu:AddLine("text","(没方案)","OpenRightMenu",SuperTreatment["Menu"]["OpenRightMenu"],
				"OpenRightMenuValue",tbl,
				"tooltipText",str,"tooltipTitle","信息"
				);
			
			end
			
		end
		
	else
		
		
		addon:Menu_2_1(level, value, menu, MenuEx,GlobalLevel);
		addon:Menu_2_2(level, value, menu, MenuEx,GlobalLevel);
		addon:Menu_2_2_1(level, value, menu, MenuEx,GlobalLevel);
		addon:Menu_2_3(level, value, menu, MenuEx,GlobalLevel);
		addon:Menu_3_5(level, value, menu, MenuEx,GlobalLevel);
		
		addon:Menu_SuperTreatmentApiList_A(level, value, menu, MenuEx,GlobalLevel);
		addon:Menu_TargetListSelect(level, value, menu, MenuEx,GlobalLevel);
		addon:Menu_TargetSelect(level, value, menu, MenuEx,GlobalLevel);
		addon:Menu_SysPrograms(level, value, menu, MenuEx,GlobalLevel);
		
		addon:Menu_GlobalQuickSetup(level, value, menu, MenuEx,GlobalLevel);
		addon:Menu_CreatingInformation(level, value, menu, MenuEx,GlobalLevel);
		addon:Menu_FastLoadingProject(level, value, menu, MenuEx,GlobalLevel);
		
		addon:Menu_SuperTreatmentApiList_B(level, value, menu, MenuEx,GlobalLevel);
		
		
		
	end
	
end

local Cls =SuperTreatmentInf.cls;

function addon:FormatText(A,B)

	local C 
	if A == B then
		C= " |cffffff00(|r|cffff0000" .. A .."|r|cffffff00/|r|cffff0000" .. B .. "|r|cffffff00)|r" ;
	else
		C= " |cffffff00(|r|cff00ffff" .. A .."|r|cffffff00/|r|cffff0000" .. B .. "|r|cffffff00)|r" ;
	end
	return C ;
end



function addon:Customize_Target_List_checked(i)

	RDB[i]["checked"] = not RDB[i]["checked"];
	
	DropDownMenu:Refresh(1);
	
end	


function addon:CustomizeTargetList_Del(i)

	RDB[i] = nil;
	DropDownMenu:Close(4)
	DropDownMenu:Refresh(1);
	
end


function addon:CustomizeTargetListEditName(i,newtext)

	RDB[i]["name"] = newtext;
	
	DropDownMenu:Refresh(3);
	
end


function addon:CustomizeTargetListRemarksEditName(i,newtext)

	RDB[i]["Remarks"] = newtext;
	
	DropDownMenu:Refresh(3);
	
end

function addon:CustomizeTargetList_GetTarget_EditUnit(i,newtext)
	
	RDB[i]["unit"] = newtext;
	DropDownMenu:Refresh(5);	
end

function addon:CustomizeTargetList_GetTarget_EditFunction(i,newtext)

	RDB[i]["function"] = newtext;
	DropDownMenu:Refresh(5);		
end



function SortNameAsc(a, b)
	--if not RDB[a]["raidn"] or not RDB[b]["raidn"] then
		
	--	return false;
	--end
	
	return RDB[a]["raidn"] > RDB[b]["raidn"]
	
end




function sortedpairs(t,comparator)
        local sortedKeys = {};
        table.foreach(t, function(k,v) table.insert(sortedKeys,k) end);
        table.sort(sortedKeys,comparator);
        local i = 0;
        local function _f(_s,_v)
                i = i + 1;
                local k = sortedKeys[i];
                if (k) then
                        return k,t[k];
                end
        end
        return _f,nil,nil;
end

function addon:err(text)
	text = "|cffff0000注意：|r" .. text;
	print(text);
end
 
function addon:AddCustomizeTarget(text)
	
	if not text or text == "" then return; end;
	
	local name = text;
	
	if RDB[name] then
		addon:err(name .. "名称已经被使用！")
		return false;
	end
	
	--local name = "CustomizeTarget_" .. UnitDB["CustomizeIndex"];
	
	if not RDB[name] then
		RDB[name]={};
	end	
	
	if not UnitDB["CustomizeIndex"] then
		UnitDB["CustomizeIndex"]=1;
	else
		UnitDB["CustomizeIndex"] = UnitDB["CustomizeIndex"]+1;
	end
	
	RDB[name]["raidn"]=(100 + UnitDB["CustomizeIndex"] ) * -1;
	RDB[name]["name"]=text ;
	RDB[name]["unit"]="";
	RDB[name]["subgroup"]=-2;
	RDB[name]["class"]="";
	RDB[name]["englishClass"]="";
	
	RDB[name]["Remarks"]="";
	RDB[name]["function"]="";
	RDB[name]["Script"]="";
	RDB[name]["ScriptName"]="";
	RDB[name]["ScriptNameText"]="";
	if not RDB[name]["AmminimumFast"] then
		
		RDB[name]["AmminimumFast"]={};
		RDB[name]["AmminimumFast"]["group"]="party";
		RDB[name]["AmminimumFast"]["Distancevalue"]=30;
		RDB[name]["AmminimumFast"]["SpellDistanceChecked"]=true;
		RDB[name]["AmminimumFast"]["GhostChecked"] = true;
		RDB[name]["AmminimumFast"]["ExcludedTarget"]={};
		
		RDB[name]["AmminimumFast"]["Minimum"]={};
		RDB[name]["AmminimumFast"]["Minimum"]["MinimumLayerBuff"]=0;
		RDB[name]["AmminimumFast"]["Minimum"]["LayerBuffName"]="";
		RDB[name]["AmminimumFast"]["Minimum"]["LayerBuffIcon"]="";
		
		RDB[name]["AmminimumFast"]["Maximum"]={};
		RDB[name]["AmminimumFast"]["Nobuff"]={};
	
		
	end	
	
	DropDownMenu:Refresh(1);
	
end

function addon:FormatTooltipText(text)
	if not text then
		return;
	end
	
	return "|cff00ff00" .. text .. "|r";
end





if not th_table_dup then

	function th_table_dup(ori_tab) --复制表
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
end




function IsOpenDropDownMenu()
	if DropDownMenu:IsOpen(1) then
		DropDownMenu:Refresh(1)
		
	end
end

	
function SuperTreatment_SetTBL(index)
	
	if index ==0 then
		addon:SuperTreatmentDBF_up();
		RDB = SuperTreatmentDBF["Unit"]["RaidList"];
		--Spells = SuperTreatmentDBF["Spells"]["List"][1]["spell"]
		UnitDB =SuperTreatmentDBF["Unit"];
		
		
	elseif index ==1 then
	
	end

end	



function addon:SpellsList(i,v)
	
	
	
	if IsControlKeyDown() and IsAltKeyDown() then
		addon:TargetList_DEL(i);
		DropDownMenu:Refresh(2);
		return;
		
	elseif IsControlKeyDown() then
		addon:TargetList_Up(i);
		DropDownMenu:Refresh(2);
		return;
		
	elseif IsAltKeyDown() then
		addon:TargetList_Down(i);
		DropDownMenu:Refresh(2);
		return;
	elseif IsShiftKeyDown() and SuperTreatment["ApiDbf"]  then
		
		local api = SuperTreatment["ApiDbf"];
		api[1]["not"]= not api[1]["not"];
		DropDownMenu:Refresh(2);
		return;
	end
	
	
	local infoType,info1,info2,ispet
	
	if i and ("AddToSpell" == i or i > 100000000) then
		
		
		local ty = type(i) == "number";
		
		if ty and i > 100000000 then
			info1=i - 100000000;
		else
			info1 = v;
		end
		
			if GetSpellInfo(info1) then
				infoType = "spell";
			
			end
		
		
		if not infoType then
			
			if GetItemInfo(info1) then
				infoType = "item";
			else
				return;
			end
			
		
		end
		
	
	
	else
		infoType,info1,info2=GetCursorInfo();
		
		
	end
	
	
	
	local n = #(Spells);
	local index;
	local TBL = {};
	
	
	
	if infoType then
		
		
		
		if infoType=="item" then
			
			local spellId;
			local name,itemLink,itemRarity,itemLevel,itemMinLevel,itemType,itemSubType,itemStackCount,itemEquipLoc,Texture,itemSellPrice;
			
			if i and ("AddToSpell" == i or i > 100000000) then
			
				name,itemLink,itemRarity,itemLevel,itemMinLevel,itemType,itemSubType,itemStackCount,itemEquipLoc,Texture,itemSellPrice=GetItemInfo(info1);
				_,_,_,_,spellId,_,_,_,_,_,_,_,_,_=string.find(itemLink,"|?c?f?f?(%x*)|?H?([^:]*):?(%d+):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%-?%d*):?(%-?%d*):?(%d*)|?h?%[?([^%[%]]*)%]?|?h?|?r?")
			else
				spellId = info1;
				
				--_,_,_,_,spellId,_,_,_,_,_,_,_,_,_=string.find(info2,"|?c?f?f?(%x*)|?H?([^:]*):?(%d+):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%-?%d*):?(%-?%d*):?(%d*)|?h?%[?([^%[%]]*)%]?|?h?|?r?")
				name,itemLink,itemRarity,itemLevel,itemMinLevel,itemType,itemSubType,itemStackCount,itemEquipLoc,Texture,itemSellPrice=GetItemInfo(spellId);
			
			end
			
			
			
			
			if type(spellId) == "string" then
				spellId = tonumber(spellId);
			end
			
			TBL["spellId"]=spellId;
			TBL["Type"]=infoType;
			TBL["itemLink"]=itemLink;
			TBL["Texture"]=Texture;
			TBL["Rank"]=itemSubType;
			TBL["checked"]=true;
			TBL["Targets"]={};
			TBL["unit"]="nogoal";
			TBL["Target"]=RDB["nogoal"]["name"];
			TBL["TargetSubgroup"]=-1;
			
			print("|cffffff00添加物品|r" .. itemLink,"|cffffff00Id:|r"..spellId);
			print("|cffff0000注意:|r施放目标为|cff00ff00" .. TBL["Target"].."|r请不要随意改变。");	
		
		elseif infoType=="spell"  then
			
			
			
			local spellLink,spellName,spellRank,spellId,Texture;
			
				--print(GetSpellInfo(info1,infoType))
				
				
				--print(select(3, string_find(spellLink, "spell:(%d+)")))

				if (GetCursorInfo() and false == i and not v and info1) then
				
					local spellname = GetSpellInfo(info1,infoType);
					local _,spellIdtemp = GetSpellBookItemInfo(info1,"spell");
					local spellname1 = GetSpellInfo(spellIdtemp);
					
					if spellname ~= spellname1 then
						
						spellId = select(3, string.find(GetSpellLink(info1, "spell"), "spell:(%d+)"))
						
					else
						
						_,spellId = GetSpellBookItemInfo(info1,"spell");
						
					end
					
				
				elseif (GetCursorInfo() and "AddToSpell" == i) or (GetCursorInfo() and false == i and not v) then
				
					
					_,spellId = GetSpellBookItemInfo(info1,"spell");
				
				elseif not GetCursorInfo() and "AddToSpell" == i and v and not tonumber(v) then
				
					_,spellId = GetSpellBookItemInfo(info1);
					
				elseif GetCursorInfo() and type(i) =="number" and not v then
				
					local spellname = GetSpellInfo(info1,infoType);
					local _,spellIdtemp = GetSpellBookItemInfo(info1,"spell");
					local spellname1 = GetSpellInfo(spellIdtemp);
					
					if spellname ~= spellname1 then
						
						spellId = select(3, string.find(GetSpellLink(info1, "spell"), "spell:(%d+)"))
						
					else
						
						_,spellId = GetSpellBookItemInfo(info1,"spell");
						
					end
					
				else
					
					spellId = info1;
				
				end
				
				spellName,spellRank,Texture = GetSpellInfo(spellId);
				spellLink,_=GetSpellLink(spellId);
				
				
				
			if not spellLink then
				return;
			end
				
			if type(spellId) == "string" then
				spellId = tonumber(spellId);
			end
			
			
			
			TBL["spellId"]=spellId;
			TBL["Type"]=infoType;
			TBL["itemLink"]=spellLink;
			TBL["Texture"]=Texture;
			TBL["Rank"]=spellRank;
			TBL["checked"]=true;
			TBL["Targets"]={};
			TBL["DelayChecked"]=false;
			TBL["DelayValue"]=0;
			print("|cffffff00添加技能|r" .. spellLink,"|cffffff00Id:|r"..spellId);
			
			if amIsNoSpellTarget and amIsNoSpellTarget(spellId) then
				TBL["unit"]="nogoal";
				TBL["Target"]=RDB["nogoal"]["name"];
				TBL["TargetSubgroup"]=-1;
				print("|cffff0000注意:|r施放目标为|cff00ff00" .. TBL["Target"].."|r请不要随意改变。");
			
				
			end
			
			
		end
		
		if i and ("AddToSpell" == i or i > 100000000) then
			i = nil;
		end
		
		if not i and n == 0 then
			
			table.insert(Spells, TBL)
		elseif i and i <= n then
			table.insert(Spells,i, TBL)	
			
		elseif not i and n>0 then
			table.insert(Spells,TBL)		
		end
		
			ClearCursor();
			
		for k, data in pairs(Spells) do
			
			if not data["Target"] then
			
				data["TargetSubgroup"]=-1;
				data["unit"]="Target";
				data["Target"]=RDB["target"]["name"];
			
			end
			
		end
		
			DropDownMenu:Refresh(2)	
	else
		
		if i then
			Spells[i]["checked"] = not Spells[i]["checked"];
			--SuperTreatment["ApiDbfRun"][Spells[i]["id"]]["checked"]=Spells[i]["checked"];
			DropDownMenu:Refresh(2)	
		end
		
	
	end
						
end

function addon:TargetListSelect_Value(v,v1)
	
	--print(v,v1);
	v["FireHasBeenSetValue"]=v1;
	
	DropDownMenu:Refresh(5);
end


function addon:TargetList_Up(i)

	if i>1 then
	
	local NewTblA = th_table_dup(Spells[i]);
	local NewTblB = th_table_dup(Spells[i-1]);
	
	Spells[i-1]=NewTblA;
	Spells[i]=NewTblB;
	DropDownMenu:Close(3)
	DropDownMenu:Refresh(2)
	
	end
	
end


function addon:TargetList_Down(i)

	local n = #(Spells);
	
	if i<n then
	
	local NewTblA = th_table_dup(Spells[i]);
	local NewTblB = th_table_dup(Spells[i+1]);
	
	Spells[i+1]=NewTblA;
	Spells[i]=NewTblB;
	DropDownMenu:Close(3)
	DropDownMenu:Refresh(2)
	
	end
	
end

function addon:TargetList_DEL(i)

	table.remove(Spells, i) 

	DropDownMenu:Close(3)
	DropDownMenu:Refresh(2)
	
	
	
end


function addon:TargetListSelect_checked(VAL)



	local i = VAL[1];
	local Target = VAL[2];
	local subgroup = VAL[3];
	
	local T = Spells[i[1]]["Targets"][i[2]]["Conditions"][i[3]];
				
	if T["Target"]==Target then
		T["Target"]=nil;
	else
		T["Target"]=Target;
	end
	T["TargetSubgroup"]=subgroup;
	T["unit"]=VAL[10];
	
	local a = addon["MenuLevelTargetListSelect"];
	local b = addon["MenuFuncTargetListSelect"];
	
	--DropDownMenu:Close(5)
	DropDownMenu:Refresh(4)
	
	addon["MenuLevelTargetListSelect"] = a;
	addon["MenuFuncTargetListSelect"]=b;
	
	
end


function addon:TargetListSelect_AddLineList(menu,RDB,data,VAL)
	
	
	local color,tc,levelColor,subgroup,checked,Class;
	local unit =data["unit"];
	
	local playerClass, englishClass = UnitClass(unit)
	color = RAID_CLASS_COLORS[englishClass]
	tc = CLASS_BUTTONS[englishClass]
	
	
	
		if data["subgroup"] ==0 then
			subgroup= "";
		else
			subgroup= data["subgroup"];
		end
		
		if VAL[4] then
			checked="|cffffff00√|r";
		else
			checked="";
		end
		
		VAL[10]=data["unit"];


		-- 表格内容行
		menu:AddLine(
			-- 职业图标
			"icon", "Interface\\WorldStateFrame\\Icons-Classes",
			"tCoordLeft", tc[1],
			"tCoordRight", tc[2],
			"tCoordTop", tc[3],
			"tCoordBottom", tc[4],
			
			"text1", amGetUnitName(unit,true), "text1R", color.r, "text1G", color.g, "text1B", color.b,
			"text2", UnitRace(unit),
			"text3", subgroup,
			"text4", checked,

							
			
			"func", "TargetListSelect_checked", "arg1", self, "arg2", VAL
		)
							
							
end


-- 2级菜单内容
function addon:Menu_2_2(level, value, menu, MenuEx,GlobalLevel)

	local _, _, valueA, valueB = string.find(value, "(.-)_(.+)")
	

	if level == 2 then -- 2级菜单内容
	
		
		
		if valueA == "MagicSolution" then
		
			local valueB = tonumber(valueB);
			
			if SuperTreatmentDBF["Spells"]["List"][valueB] then
				
				Spells = SuperTreatmentDBF["Spells"]["List"][valueB]["spell"];
				local TBL = SuperTreatmentDBF["Spells"]["List"][valueB]
				
				
				SuperTreatment["type"]="Run"
				
				
				local str = addon:FormatTooltipText("可以拖动的技能请往这里放，可以添加在技能列表后面。\n\n如果要在列表里的某技能前面添加技能，那么请把技能直接放到你希望的位置上。");
				
				menu:AddLine("text","|cffffff00把技能|cffff0000拖放到这里|cffffff00以添加","func","SpellsList", "arg1", self, "arg2", false,"tooltipText",str,"tooltipTitle","添加技能",
				"inftitle","第三步",
				"inftext","鼠标放到此菜单上看提示。",
				"infx",0,
				"infy",-12,
				"infid",3,
				"infchecked",SuperTreatmentAllDBF.HelpNavigation and #Spells<=0,
				
				"ToggleButton",1,"ToggleButtonFun",function()
					SuperTreatmentDBF.IsAdvancedSettings2_0=not SuperTreatmentDBF.IsAdvancedSettings2_0;
					DropDownMenu:Refresh(level);
					
					end,
					"ToggleState",SuperTreatmentDBF.IsAdvancedSettings2_0,
					"ToggleX",-5,"ToggleY",0
				);
				
				
				
				
				
				local Solution = Spells;
				
				if not SuperTreatmentDBF.IsAdvancedSettings2_0 then
				
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10,"LineY",0);
				
				for i, data in pairs(Spells) do
					
					local spellId = data["spellId"];
					local spellType = data["Type"];
					local checked;
					local v = data;
					local k=i;
					
					if not v.Key then
						v.Key={};
					end
					
					if not v.Mark then
						v.Mark=amrandom(i);
					end
					
					if not v.Key.KeySelect then
						v.Key.KeySelect= "auto";
					end
					
					local str={};
					if str then
						local t={};
					
						t["type"]="AddLine";
						t["text"]=" ";
						table.insert(str,t);
						
						t={};
						t["type"]="AddDoubleLine";
						t["left"]="|cffffff00上移:";
						t["right"]="|cffffffffCtrl + 鼠标左键";
						table.insert(str,t);
						
						t={};
						t["type"]="AddDoubleLine";
						t["left"]="|cffffff00下移:";
						t["right"]="|cffffffffAlt  + 鼠标左键";
						table.insert(str,t);
						
						t={};
						t["type"]="AddDoubleLine";
						t["left"]="|cffffff00删除:";
						t["right"]="|cffffffffCtrl + Alt + 鼠标左键";
						table.insert(str,t);
						
						t={};
						t["type"]="AddDoubleLine";
						t["left"]="|cffffff00插入技能:";
						t["right"]="|cffffffffShift + 鼠标左键";
						table.insert(str,t);
						
						t={};
						t["type"]="AddDoubleLine";
						t["left"]="|cffffff00属性:";
						t["right"]="|cffffffff鼠标右键";
						table.insert(str,t);
						
						if v.Key then

							
							local keytype;
								
							if v.Key.KeySelect=="auto" then
								keytype="选择/放弃";
							elseif v.Key.KeySelect=="no" then
								keytype="放弃";
							elseif v.Key.KeySelect=="ok" then
								keytype="选择";
							elseif v.Key.KeySelect=="run" then
								keytype="执行";
							elseif v.Key.KeySelect=="auto1" then
								keytype="选择/放弃(全)";
							elseif v.Key.KeySelect=="no1" then
								keytype="放弃(全)";
							elseif v.Key.KeySelect=="ok1" then
								keytype="选择(全)";
							end
							
													
							if v.Key.Checked and v.Key.Checked and v.Key.Value and v.Key.Value ~="" then
							
								t={};
								t["type"]="AddDoubleLine";
								t["left"]="|cffffff00快捷键:";
								t["right"]="|cffffffff" .. (v.Key.Value or "");
								table.insert(str,t);
							
								t={};
								t["type"]="AddDoubleLine";
								t["left"]="|cffffff00快捷键类型:";
								t["right"]="|cffffffff" .. (keytype or "");
								table.insert(str,t);
								
							else
								
								t={};
								t["type"]="AddDoubleLine";
								t["left"]="快捷键:";
								t["right"]=(v.Key.Value or "");
								t.rL, t.gL, t.bL = GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b;
								t.rR, t.gR, t.bR = GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b;
								table.insert(str,t);
								
								
								t={};
								t["type"]="AddDoubleLine";
								t["left"]="快捷键类型:";
								t["right"]=(keytype or "");
								t.rL, t.gL, t.bL = GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b;
								t.rR, t.gR, t.bR = GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b;
								table.insert(str,t);
								
							end
							
							
							
						end	
						
						t={};
						t["type"]="AddDoubleLine";
						t["left"]="|cffffff00Id:";
						t["right"]="|cffffffff" .. (v.Mark or "");
						table.insert(str,t);
						
						t={};
						t["type"]="AddDoubleLine";
						t["left"]="|cffffff00备注:";
						t["right"]="|cffffffff" .. (v.Remarks or "");
						table.insert(str,t);
				end		
			----------------------------------------------------------

					local tbl={};
					tbl.CastProgram={};
					local ex = tbl.CastProgram;
					ex.copy ={}; 
					ex.copy.fun = function()
								SuperTreatmentInf["Copyexchange"]["SpellProgram"]=v;
								DropDownMenu:Refresh(level);
							end; 
					
					
					ex.copy.arg1 = v;
					
					ex.Paste ={}; 
					ex.Paste.fun = function()
						local TBL = th_table_dup(SuperTreatmentInf["Copyexchange"]["SpellProgram"]);
						--if TBL.Key.ButtonFrame and TBL.Key.ButtonFrame.SetAttribute then
						--	ClearOverrideBindings(TBL.Key.ButtonFrame);
						--end
						--TBL.Mark=amrandom(k);
						--TBL.Key=nil;
						
						stRefreshMark(TBL);
						stCancelKey(TBL,1);
						
						table.insert(Solution,k, TBL);
						DropDownMenu:Refresh(level);
						
					end;
					
					ex.Paste.arg1 = {Solution,k};
					ex.Paste.checked=function() return SuperTreatmentInf["Copyexchange"]["SpellProgram"];end;
					
					ex.Del ={}; 
					ex.Del.fun = function() 
					table.remove(Solution,k);
					DropDownMenu:Refresh(level);
					DropDownMenu:ArrowHide(self,level);
					end; 
					
					ex.Up ={}; 
					ex.Up.fun = function() 
						if k>1 then
							local NewTblA = th_table_dup(Solution[k]);
							local NewTblB = th_table_dup(Solution[k-1]);
							Solution[k-1]=NewTblA;
							Solution[k]=NewTblB;						
							DropDownMenu:Refresh(level);
						end
					end;
					
					ex.Down ={}; 
					ex.Down.fun = function() 
						local n = #(Solution);
						if k<n then
							local NewTblA = th_table_dup(Solution[k]);
							local NewTblB = th_table_dup(Solution[k+1]);
							Solution[k+1]=NewTblA;
							Solution[k]=NewTblB;
							DropDownMenu:Refresh(level);
						
						end
					end;
									
					ex.text =v.itemLink or v["name"] or v.MacroName or "";
					ex.index =k;
					ex.tbl = Solution;
					ex.Renamed=false;

				
				
				----------------------------------------------------------
				
				
				
					if spellType=="item" then
						
						--[[						
						local rank =Spells[i]["Rank"] or "" ;
						local itemLink = Spells[i]["itemLink"];
						
						if not itemLink then
							_,itemLink=GetItemInfo(spellId);
							Spells[i]["itemLink"] = itemLink;
						end
						
						
						
						
						local Texture = Spells[i]["Texture"];
						--]]
						--[[
						local str="";
						str = str .. "\n|cffff0000上移: |cffffffffCtrl + 鼠标左键";
						str = str .. "\n|cffff0000下移: |cffffffffAlt  + 鼠标左键";
						str = str .. "\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键";
					--]]
					
						local name, itemLink, _, _, _, _, _, _, _, Texture=GetItemInfo(spellId);
						local rank =Spells[i]["Rank"] or "" ;
						itemLink = itemLink or (spellId .."(无效)");
						Texture = Texture or "";
						
						Spells[i]["itemLink"]=itemLink;
						Spells[i]["Rank"]=rank;
						Spells[i]["Texture"]=Texture;
						
						menu:AddLine(						
						"text", "|cff104E8B" .. i ..
						".|r |T" .. Texture .. ":12|t" .. itemLink .. "|r " .. (data.Remarks or ""),
						"checked", data["checked"],
						--"icon",Texture,
						"hasArrow", 1, "value", "TargetList_" .. i .. "_" .. valueB,
						"tooltipText",str,
						"func","SpellsList", "arg1", self, "arg2", i,
						"tooltipTitle","信息",
						"inftitle","第四步",
							"inftext","鼠标放到此菜单上,设定下级菜单。",
							"infx",0,
							"infy",-12,
							"infid",4,
							"infchecked",SuperTreatmentAllDBF.HelpNavigation,
						"Item",spellId,
						"OpenRightMenu",SuperTreatment["Menu"]["OpenRightMenu"],
						"OpenRightMenuValue",tbl
						)
						
					elseif spellType=="spell" then
					
												
						local spellName,rank,Texture = GetSpellInfo(spellId);
						
						
						local spellLink,_=GetSpellLink(spellId);
						
						spellLink = spellLink or (spellId .."(无效)");
						Texture = Texture or "";
						
						Spells[i]["itemLink"]=spellLink;
						Spells[i]["Rank"]=rank;
						Spells[i]["Texture"]=Texture;
						
												
						if not rank then rank="";end
						
						if spellName then
						
							menu:AddLine(						
							"text", "|cff104E8B" .. i ..
							".|r |T" .. Texture .. ":12|t" .. spellLink .. "|r " .. (data.Remarks or "") ,
							"checked", data["checked"],
							--"icon",Texture,
							"hasArrow", 1, "value", "TargetList_" .. i .. "_" .. valueB,
							"tooltipText",str,
							"func","SpellsList", "arg1", self, "arg2", i,
							"tooltipTitle","信息",
							"inftitle","第四步",
								"inftext","鼠标放到此菜单上,设定下级菜单。",
								"infx",0,
								"infy",-12,
								"infid",4,
								"infchecked",SuperTreatmentAllDBF.HelpNavigation,
							"Spell",spellId,
							"OpenRightMenu",SuperTreatment["Menu"]["OpenRightMenu"],
							"OpenRightMenuValue",tbl
							);
							
						else
								
							--menu:AddLine("text",(Spells[i]["itemLink"] or spellId) .."|cffff0000(无效)","disabled",1);
							
							menu:AddLine(						
							"text", (Spells[i]["itemLink"] or spellId) .."|cffff0000(无效)"  .. "|r " .. (data.Remarks or "") ,
							"checked", data["checked"],
							--"icon",Texture,
							"hasArrow", 1, "value", "TargetList_" .. i .. "_" .. valueB,
							"tooltipText",str,
							"func","SpellsList", "arg1", self, "arg2", i,
							"tooltipTitle","信息",
							"inftitle","第四步",
								"inftext","鼠标放到此菜单上,设定下级菜单。",
								"infx",0,
								"infy",-12,
								"infid",4,
								"infchecked",SuperTreatmentAllDBF.HelpNavigation,
							
							"OpenRightMenu",SuperTreatment["Menu"]["OpenRightMenu"],
							"OpenRightMenuValue",tbl
							);
							
						end
						
						
					elseif spellType=="macro" or spellType=="script" then
					
						if Spells[i]["id"] then
							local dbf;
							for xxx, t in pairs(SuperTreatmentDBF["Macro"]) do
		
								
								if t["id"]==Spells[i]["id"] then
									dbf=t;
									break;
								end
							end
						
							local MacroName = dbf["name"];
							local Texture = dbf["Texture"] or "";
													
							
							local itemLink=dbf["name"];
							
							
							local temp = ST.MacroFinishing(dbf["Macro"],Spells[i]["unit"])
							
							if spellType=="script" then
								temp =strsub(temp,1,100);
							end
							
							
							str[9]={};
							str[9]["type"]="AddLine";
							str[9]["text"]=temp;
							
						--[[
							local str = "|cffff0000部分内容: |r\n\n"..temp .. "\n\n"..dbf["Remarks"] ;
							str = str .. "\n\n|cffff0000上移: |cffffffffCtrl + 鼠标左键";
							str = str .. "\n|cffff0000下移: |cffffffffAlt  + 鼠标左键";
							str = str .. "\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键";
						
							--]]
							
							menu:AddLine(						
							"text", "|cff104E8B" .. i ..
							".|r |T" .. Texture .. ":12|t" .. itemLink .. "|r " .. (data.Remarks or ""),
							"checked", data["checked"],
							--"icon",Texture,
							"hasArrow", 1, "value", "TargetList_" .. i .. "_" .. valueB,
							"tooltipText",str,
							"func","SpellsList", "arg1", self, "arg2", i,
							"tooltipTitle",MacroName,
							--"tooltipTitle",Apidata["inf"],
							"inftitle","第四步",
							"inftext","鼠标放到此菜单上,设定下级菜单。",
							"infx",0,
							"infy",-12,
							"infid",4,
							"infchecked",SuperTreatmentAllDBF.HelpNavigation,
							"OpenRightMenu",SuperTreatment["Menu"]["OpenRightMenu"],
							"OpenRightMenuValue",tbl
							);
						
						
						else
						
							local MacroName = Spells[i]["MacroName"];
							local Texture = "";
							
							if Spells[i]["Texture"] then
								Texture =Spells[i]["Texture"];
							end
							
							local itemLink="";
							if Spells[i]["itemLink"] and Spells[i]["itemLink"] ~="" then
								itemLink =Spells[i]["itemLink"];
							else
								itemLink = MacroName;
							end
							
							local temp = ST.MacroFinishing(Spells[i]["Macro"],Spells[i]["unit"])
							
							str[9]={};
							str[9]["type"]="AddLine";
							str[9]["text"]=temp .. "\n"..Spells[i]["Remarks"] ;
							--[[
							local str = temp .. "\n"..Spells[i]["Remarks"] ;
							str = str .. "\n\n|cffff0000上移: |cffffffffCtrl + 鼠标左键";
							str = str .. "\n|cffff0000下移: |cffffffffAlt  + 鼠标左键";
							str = str .. "\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键";
						--]]
							
							
							menu:AddLine(						
							"text", "|cff104E8B" .. i ..
							".|r |T" .. Texture .. ":12|t" .. itemLink .. "|r " .. (data.Remarks or ""),
							"checked", data["checked"],
							--"icon",Texture,
							"hasArrow", 1, "value", "TargetList_" .. i .. "_" .. valueB,
							"tooltipText",str,
							"func","SpellsList", "arg1", self, "arg2", i,
							"tooltipTitle",MacroName,
							--"tooltipTitle",Apidata["inf"],
							"inftitle","第四步",
							"inftext","鼠标放到此菜单上,设定下级菜单。",
							"infx",0,
							"infy",-12,
							"infid",4,
							"infchecked",SuperTreatmentAllDBF.HelpNavigation,
							"OpenRightMenu",SuperTreatment["Menu"]["OpenRightMenu"],
							"OpenRightMenuValue",tbl
							);
						
					end
					
					elseif spellType=="Run"   then
						
						
						SuperTreatment["ApiDbf"]=data["ApiDbf"];
						SuperTreatment["ApiDbfRun"]=data["ApiDbf"];
				
						local k = data["ApiDbf"][1]["id"];
						local rs =data["ApiDbf"][1];
																		
						local Apidata =SuperTreatment["Api"][k];
						
						
						str[9]={};
						str[9]["type"]="AddDoubleLine";
						str[9]["left"]="|cffffff00条件取反:";
						str[9]["right"]="|cffffffffShift + 鼠标左键";
						
						--str[9]={};
						--str[9]["type"]="AddLine";
						--str[9]["text"]=Spells[i]["itemLink"].. "\n"..Spells[i]["Remarks"] ;
						--[[
						local str=Spells[i]["itemLink"].. "\n"..Spells[i]["Remarks"] ;
						str = str .. "\n\n|cffff0000上移: |cffffffffCtrl + 鼠标左键";
						str = str .. "\n|cffff0000下移: |cffffffffAlt  + 鼠标左键";
						str = str .. "\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键";
						str = str .."\n|cffff0000条件取反: |cffffffffShift + 鼠标左键";
						--]]
						
						menu:AddLine(						
						"text",NOT(rs,"|cff104E8B" .. i .. ". |cffffffff" .. Apidata["inf"]) .. "|r " .. (data.Remarks or ""),
						"checked", data["checked"],
						
						"hasArrow", 1, "value", "TargetList_" .. i .. "_" .. valueB,
						"tooltipText",str,
						"func","SpellsList", "arg1", self, "arg2", i,
						"tooltipTitle",Apidata["inf"],
						"inftitle","第四步",
						"inftext","鼠标放到此菜单上,设定下级菜单。",
						"infx",0,
						"infy",-12,
						"infid",4,
						"infchecked",SuperTreatmentAllDBF.HelpNavigation,
						"OpenRightMenu",SuperTreatment["Menu"]["OpenRightMenu"],
						"OpenRightMenuValue",tbl
						)
						
						
				

									
					end
					
					
					
					
				end
				--menu:AddLine("text","","disabled",1);
					
					if #Solution==0 then
				
						local tbl={};
						tbl.CastProgramAdd={};
						local ex = tbl.CastProgramAdd;
				
						ex.Paste ={}; 
							ex.Paste.fun = function()
								local TBL = th_table_dup(SuperTreatmentInf["Copyexchange"]["SpellProgram"]);
																						
								stRefreshMark(TBL);
								stCancelKey(TBL,1);
								
								table.insert(Solution,TBL);
								DropDownMenu:Refresh(level);
							end; 
							
							
							ex.Paste.checked=function() return SuperTreatmentInf["Copyexchange"]["SpellProgram"];end;
						
						
						
						local str = addon:FormatTooltipText("注意:鼠标右键可以粘贴。");
						menu:AddLine("text","(没技能)","OpenRightMenu",SuperTreatment["Menu"]["OpenRightMenu"],
						"OpenRightMenuValue",tbl,
						"tooltipText",str,"tooltipTitle","信息"
						);
					
					end
			
				
				end
				
				--menu:AddLine("line",1,"LineHeight",10);
				menu:AddLine();
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8,
				"ToggleButton",1,"ToggleButtonFun",function()
					SuperTreatmentDBF.IsAdvancedSettings2_1=not SuperTreatmentDBF.IsAdvancedSettings2_1;
					DropDownMenu:Refresh(level);
					
					end,
					"ToggleState",SuperTreatmentDBF.IsAdvancedSettings2_1,
					"ToggleX",0,"ToggleY",4
				
				);
				
				if not SuperTreatmentDBF.IsAdvancedSettings2_1 then
				
				local str = addon:FormatTooltipText("输入技能名称添加在技能列表后面。\n\n|cffff0000注意：|r失败信息在聊天栏提示。");
				menu:AddLine("text","|cffffff00手动添加技能","tooltipText",str,"tooltipTitle","手动添加技能",
				"hasEditBox", 1, "editBoxText", self.text, "editBoxFunc", "SpellsList",
				"editBoxArg1", self, "editBoxArg2", "AddToSpell","icon",""
				);
				
				local str = addon:FormatTooltipText("请把相关的宠物召唤出来才可以完整显示技能。\n\n|cffff0000注意:|r\n把要判断的技能/动作/命令等拖到宠物技能条上");
				menu:AddLine("text", "|cffffff00添加宠物技能" , "hasArrow", 1, "value", "AddPetSpell","icon","",
				"tooltipText",str,"tooltipTitle","添加宠物技能"
				);
				
				local str = addon:FormatTooltipText("建立宏/脚本请到主菜单【方案系统设定】下的【创建自定义宏/脚本】下建立。\n\n|cffff0000宏被添加到技能列表后只是原来的副本，所以跟原来的宏没任何关系，发生修改及删除都不会互相产生影响。|r\n嗯，小白点说就是同名的宏功能可以不同。");
				menu:AddLine("text", "|cffffff00添加宏/脚本" , "hasArrow", 1, "value",
				"MagicSolutionAddMacro_" ..valueB ,"icon","",
				"tooltipText",str,"tooltipTitle","添加宏/脚本"
				);
				
				
				--addon["MenuLevel"]=level;			
				menu:AddLine("text", "|cffffff00添加函数|r", "hasArrow", 1, "value", "SuperTreatmentApiListRun","icon","")
				--[[
				menu:AddLine("line",1,"LineHeight",8);
				
				local str = addon:FormatTooltipText("把其它技能条件方案粘贴到这里来，前提你已经复制了技能条件方案。");
			
			
				if SuperTreatmentInf["Copyexchange"]["SpellProgram"] then
				
					
					menu:AddLine("text", "|cffffff00粘贴",
					"icon","INTERFACE\\ICONS\\INV_Letter_16",
					"func", "PasteSpellProgram","arg1", self,"arg2", Spells,"tooltipText",str,"tooltipTitle","粘贴")
					
				else
					
					menu:AddLine("text", "粘贴",
					"icon","INTERFACE\\ICONS\\INV_Letter_16",
					"disabled",1,"tooltipText",str,"tooltipTitle","粘贴")
					
				
				end
				--]]
				
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
				menu:AddLine();
				end
				
				menu:AddLine("text","设定:","isTitle",1,
				
				"ToggleButton",1,"ToggleButtonFun",function()
					SuperTreatmentDBF.IsAdvancedSettings2_2=not SuperTreatmentDBF.IsAdvancedSettings2_2;
					DropDownMenu:Refresh(level);
					
					end,
					"ToggleState",SuperTreatmentDBF.IsAdvancedSettings2_2,
					"ToggleX",-5,"ToggleY",0
				);
				
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
				
				if not SuperTreatmentDBF.IsAdvancedSettings2_2 then
				
				
				
				local temp = SuperTreatmentDBF["Spells"]["List"][tonumber(valueB)];
				
				menu:AddLine("text", "|cffffff00方案名称修改","hasEditBox", 1,
				"icon","",
				"editBoxText", temp["name"], "editBoxFunc", "EditProgramName", "editBoxArg1", self,"editBoxArg2", temp)
				
			
				local str = addon:FormatTooltipText("当有技能在施放时不要打断它，但技能里设定打断项还是会打断的。");
				menu:AddLine("text", "不要打断技能施放","checked",SuperTreatmentDBF["Spells"]["List"][valueB]["NoStopCastingChecked"],"func", "TargetList_AllNoStopCasting_Checked","arg1", self,"arg2", valueB,"tooltipText",str,"tooltipTitle","设定打断")
				
				
				
				
				
				local str = addon:FormatTooltipText("当您选择当前项时，当前方案的技能施放都要等上一个施放完毕才可以施放。|r\n当然本设定只能在当前施法方案有效不会影响到其它。\n\n|cffff0000注意:这里技能施放完毕的概念是技能效果在出现时才有效，那麽这种有效是服务器来处理的所以和你的客户端是不同步的。|r\n如:当【治疗术】治疗目标时你看到技能已经施放完毕但目标血量要等会才有治疗效果，这种就是不同步。其实该选项出发点就是为治疗职业治疗用的，这样治疗就不会对不需要治疗的目标重复上技能了");
				
				
				menu:AddLine("text", "等待技能施放完毕" ,  "checked",temp["WaitSpellCastComplete"],
				"func", "ProgramSetupWaitSpellCastComplete_Checked","arg1", self,"arg2", temp,
				"tooltipText",str,"tooltipTitle","等待技能施放完毕");
				
				local str = addon:FormatTooltipText("当技能开始施放时关闭本方案。\n\n目的是激活(打钩)本方案只要施放本方案的技能那么就关闭，保证只运行1次。\n\n|r设计的初衷是[群体驱散]我选择了手动激活后因为来不及关方案被连续施放几次。\n\n|cffff0000注意:|r\n\n方案里可以有N个技能但只要有1个开始施放就会关闭本方案。");
				menu:AddLine("text", "当技能施放关闭本方案" ,  "checked",temp["CastOffSchem"],
				"func", "CastOffSchem_Checked","arg1", self,"arg2", temp,
				"tooltipText",str,"tooltipTitle","说明")
				
				local str = addon:FormatTooltipText("当技能开始施放完毕时关闭本方案。\n\n目的是激活(打钩)本方案只要施放完毕本方案的技能那么就关闭，保证只运行1次。\n\n|r设计的初衷是[群体驱散]我选择了手动激活后因为来不及关方案被连续施放几次。\n\n|cffff0000注意:|r\n\n方案里可以有N个技能但只要有1个开始施放就会关闭本方案。");
				menu:AddLine("text", "当技能施放完毕关闭本方案" ,  "checked",temp["CastOffSchemEnd"],
				"func", "CastOffSchemEnd_Checked","arg1", self,"arg2", temp,
				"tooltipText",str,"tooltipTitle","说明")
				
				menu:AddLine("line",1,"LineHeight",8);
				
				local str = addon:FormatTooltipText("当您选择当前排除时，全局[排除的小队]设定被忽略。|r\n当然本设定只能在当前施法方案有效不会影响到其它。");
				
				menu:AddLine("text", "|cffffff00排除|r的小队" , "checked",temp["ExcludedGroupChecked"],
				"func", "ProgramSetupExcludedGroup_Checked","arg1", self,"arg2", temp,
				"hasArrow", 1, "value", "ProgramSetupExcludedGroup_" .. valueB,
				"tooltipText",str,"tooltipTitle","排除的小队")
				
				
				local str = addon:FormatTooltipText("当您选择当前排除时，全局[排除的目标]设定被忽略。|r\n当然本设定只能在当前施法方案有效不会影响到其它。");
				
				
				menu:AddLine("text", "|cffffff00排除|r的目标" ,  "checked",temp["ExcludeTargetChecked"],
				"func", "ProgramSetupExcludeTarget_Checked","arg1", self,"arg2", temp,
				"hasArrow", 1, "value", "ProgramSetupExcludeTarget_" .. valueB,
				"tooltipText",str,"tooltipTitle","排除的目标")
				
				
				local str = addon:FormatTooltipText("当您选择当前排除时，不会音响全局排除设定。|r\n当然本设定只能在当前施法方案有效不会影响到其它。");
				
				menu:AddLine("text", "|cffffff00排除|rMT列表目标" ,  "checked",temp["ExcludeMTChecked"],
				"func", "ProgramSetupExcludeMT_Checked","arg1", self,"arg2", temp,
				"tooltipText",str,"tooltipTitle","排除MT列表目标")
				
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
				
				--[[
				local str = addon:FormatTooltipText("复制当前方案到粘贴板");
				
				menu:AddLine("text", "|cffffff00复制",
				"icon","INTERFACE\\ICONS\\INV_Letter_04",
				"func", "CopyCastProgram","arg1", self,"arg2", temp,"tooltipText",str,"tooltipTitle","复制")
			
				menu:AddLine();
				--]]
				local str = addon:FormatTooltipText("拖动技能到指定位置(看菜单)添加要施放的技能，理论上可以添加N个。\n\n技能有优先级别前面的比后面的优先(废话但有小白问过我)鼠标移到技能上显示操作方式帮助。|r\n\n提示小白多移动鼠标到菜单上有帮助提示，选择(菜单打钩)代表启用该选项");
				
				menu:AddLine("text", "|cff00ff00帮助","tooltipText",str,"tooltipTitle","帮助","icon","Interface\\Icons\\INV_Misc_QuestionMark");
				
				end
			end
			
		
		
		end

				
			
	elseif level == 3 then -- 3级菜单内容	
		
		local _, _, valueA, valueB = string.find(value, "(.-)_(.+)")
		local V = addon:DecompositionValue(value);
		
		if  valueA == "ProgramSetupExcludedGroup" then
			
			menu:AddLine("text","排除的小队" ,"isTitle",1);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
			local tbl = SuperTreatmentDBF["Spells"]["List"][tonumber(valueB)];
			
			if not tbl["ExcludeTarget"] then
			tbl["ExcludeTarget"]={};
			end
			
			if not tbl["ExcludedGroup"] then
				tbl["ExcludedGroup"]={};
			end
				
			for i=1 , 8 do
				
				
				menu:AddLine("text", "|cff104E8B" .. i .. "|r小队" ,"checked",tbl["ExcludedGroup"][i],
				"func", "ProgramSetupExcludedGroup_checked", "arg1", self, "arg2", {tonumber(valueB),i}
				);
				menu:AddLine("line",1);
			end
			
		
		elseif  valueA == "ProgramSetupExcludeTarget" then
			
			menu:AddLine("text","|cffffff00选择添加排除目标","hasArrow", 1, "value", "ProgramSetupExcludeTargetAdd_" .. valueB,"icon",ExpandArrow)
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
			--local tbl = SuperTreatmentDBF["Unit"]["ExcludeTarget"];
			local tbl = SuperTreatmentDBF["Spells"]["List"][tonumber(valueB)]["ExcludeTarget"];
			
			if tbl then
				for name, data in pairs(tbl) do
					
					if amGetUnitName(name,true) then
					
						local color,tc,levelColor,subgroup,checked,Class;
						local playerClass, englishClass = UnitClass(name);
						color = RAID_CLASS_COLORS[englishClass];
						tc = CLASS_BUTTONS[englishClass];
						
						menu:AddLine(
						-- 职业图标
						"icon", "Interface\\WorldStateFrame\\Icons-Classes",
						"tCoordLeft", tc[1],
						"tCoordRight", tc[2],
						"tCoordTop", tc[3],
						"tCoordBottom", tc[4],
						
						"text", name, "textR", color.r, "textG", color.g, "textB", color.b,
						"func", "ProgramSetupExcludeTarget_DEL", "arg1", self, "arg2", {tonumber(valueB),name}
					);
					--menu:AddLine("line",1);
					else
					
						data = nil;
									
					end
				end
				
			end
		
		
		elseif value  == "SuperTreatmentApiListRun" then
		
					
			
			local api = SuperTreatment["Api"];
			local apiIndex = SuperTreatment["ApiIndex"];
			local i =1;
			
			for k1, data1 in pairs(apiIndex) do
				
				local k = data1;
				local data = api[k];
				
				if data["type"]=="Run" then
				
					local str = addon:FormatTooltipText("\n" .. data["inf"] .. "\n\n|cffffff00" .. data["Remarks"]);
					local ArgumentsTexts="";
					local Arguments = data["Arguments"];
				
					local Counts = data["Arguments"]["Counts"];
					if Counts==0 then
					
						ArgumentsTexts = "\n|cffff0000参数:|r 无\n"
					else
					
						for n=1,Counts do
							
							
							ArgumentsTexts = ArgumentsTexts .."\n|cffff0000参数".. n .. "(|r" .. TYPEINF[Arguments[n]["type"]] .."|cffff0000):|r\n"  .. Arguments[n]["inf"] .. "\n";
							
						end
						
					end
					
					local ReturnsTexts="";
					local Returns = data["Returns"];
					
					local Counts = data["Returns"]["Counts"];
					if Counts==0 then
					
						ReturnsTexts = "\n|cffff0000返回值:|r 无\n"
					else
					
						for n=1,Counts do
							
							ReturnsTexts = ReturnsTexts .."\n|cffff0000返回值".. n .. "(|r" .. TYPEINF[Returns[n]["type"]] .."|cffff0000):|r\n"  .. Returns[n]["inf"] .. "\n";
							
						end
						
					end
					
					ArgumentsTexts = data["inf"] .. "\n" .. ArgumentsTexts .. ReturnsTexts .. "\n|cff00ff00" .. data["Remarks"] .. "|r";
					
					
					menu:AddLine("text","|cff104E8B" .. i .. ". |cffffffff" .. data["inf"],
					"tooltipText",ArgumentsTexts,"tooltipTitle",k,"notCheckable",1,
					"func", "SuperTreatmentApiListAdd_Run", "arg1", self, "arg2", k
					);
					
					menu:AddLine("line",1);
					
					i=i+1;
				end
			end
			
		
		
	


		
		
		elseif valueA == "MagicSolutionAddMacro" then
		
			
			local tbl = SuperTreatmentDBF["Macro"];
			for k,v in pairs(tbl) do
			
				
					local name = v["name"];
					local temp="";
					if v["type"]=="script" then
						temp = strsub(v["Macro"],1,100);
					else
						temp = v["Macro"];
					end
					
					local str = addon:FormatTooltipText("|cffff0000部分内容: |r\n\n"..temp .. "\n\n|cffff0000备注: |r" .. v["Remarks"]);
					
					menu:AddLine("text", "|cff104E8B" .. k .. ". |cffffffff" .. name,
					"func", "MagicSolutionAddMacro_Add", "arg1", self, "arg2", v,
					"tooltipText",str,"tooltipTitle","信息","icon",v["Texture"] or "");
					
					menu:AddLine("line",1);
				
			end
		
		elseif valueA == "TargetList" then
			
			addon["MenuLevel_name"]="TargetList";
			
			local _, _, valueA1, valueB1 = string.find(valueB, "(.-)_(.+)")
			
			local valueN = tonumber(valueA1);
			local valueB1N = tonumber(valueB1);
			
			local data = Spells[valueN];
			
			SuperTreatment["ApiDbf"]=data["ApiDbf"];
			SuperTreatment["ApiDbfRun"]=data["ApiDbf"];
			local Macrotbl={};
			if data["id"] then
				
				for k, t in pairs(SuperTreatmentDBF["Macro"]) do

					if t["id"]==data["id"] then
						Macrotbl=t;
						break;
					end
				end
			end				
						
			local spellLink = Macrotbl["name"] or Spells[valueN]["itemLink"];
			local Texture =	Macrotbl["Texture"] or Spells[valueN]["Texture"];
			
			
				
			if not Spells[valueN]["CastingSpell"] then
				Spells[valueN]["CastingSpell"]={};
			end
			
			local tbl = Spells[valueN]["CastingSpell"]
			
			if Spells[valueN]["Type"]=="item" or Spells[valueN]["Type"]=="spell" then
			
				if not tbl["spell"] or #tbl["spell"] ==0 then
					
					local v = Spells[valueN];
					tbl["spell"]={};
					
					local TBL={};
					TBL["spellId"]=v["spellId"];
					TBL["Type"]=v["Type"];
					TBL["itemLink"]=v["itemLink"];
					TBL["Texture"]=v["Texture"];
					TBL["Rank"]=v["Rank"];
					TBL["disabled"]=true;
					table.insert(tbl["spell"], TBL);
				end
				
			end
			
					
			
			if Spells[valueN]["Type"]=="item" or Spells[valueN]["Type"]=="spell" then
				
				
				local temp=addon:TblToMacro(tbl["spell"]);	
				local str = addon:FormatTooltipText("当选择当前项时施放下级菜单的技能，不选时施放" .. spellLink .."\n\n\|cffff0000注意:\n|r当选择时下面的 \n\n[|cff00ffff立刻打断当前施法|r] \n[|cff00ffff属于范围选择技能(AOE)\n[|cff00ffff施放时或施放完执行|r]的同功能的设定 \n\n选项将无效。");
				
				str = str .. "\n\n|cffff0000按设定生成的宏:|r\n\n" .. temp ;
				
				if  Spells[valueN]["CastingSpellStartOrEnd"] then
				
					local dv = Spells[valueN]["CastingSpellStartOrEnd"]["Start"];
					
					if Spells[valueN]["CastingSpellStartOrEnd"]["checked"] and dv["SpellChecked"] then
					
						temp = addon:TblToMacro(dv["spell"]);
					
						str = str .. "\n\n|cffff0000技能延时(|r" .. (dv["DelayValue"] or 0) .."|cffff0000)后:|r\n\n" .. temp ;
					
					end
				end
				
				
				str = str .. "\n\n请确认以上的宏能正常使用那么设定才有意义。\n\n|cffff0000注意:|r\n\n延时部分只提示生成 [|cffffff00延时施放技能|r] 部分。\n以上的宏只能作为参考，目标没生成进宏里。"
				
				local data = Spells[valueN];
				local spellId = data["spellId"];
				local spellType = data["Type"];
				local itemLink,rank,Texture;
				
				if spellType=="item" then
				
					_, itemLink, _, _, _, _, _, _, _, Texture=GetItemInfo(spellId);
					rank =Spells[valueN]["Rank"] or "" ;
					
				else
					
					_,rank,Texture = GetSpellInfo(spellId);
					itemLink,_=GetSpellLink(spellId);
					
				end
				
				
				itemLink = itemLink or (spellId .."(无效)");
				Texture = Texture or "";
				
				menu:AddLine("text",  itemLink .. " |cffff0000(|r单|cffff0000/|r多|cffff0000) |r" .. (#tbl["spell"] or 0)  ,"icon",Texture,"hasArrow", 1,
				"value", "CastingSpell_" .. valueN,
				"checked",tbl["Checked"],"func", "CastingSpell_Checked","arg1", self,"arg2", tbl,
				"tooltipText",str,"tooltipTitle","说明"
				);
				
			else
				
				menu:AddLine("text",  spellLink ,"icon",Texture,"isTitle",1)
				
			end
				
			
			menu:AddLine("line",1,"LineHeight",8);
			
			
			addon["MenuLevelTargetSelect"] = level;
			addon["MenuFuncTargetSelect"]="Menu_TargetSelect_checked";
			
			local TC = valueB1 .. "_" .. valueA1;
			
			--local str = addon:FormatTooltipText("");
			local str = "|cffff0000当|r"..spellLink.."|cffff0000当技能有和没目标都可以施放时请选|r【无目标】|cffff0000切记！";
				
			menu:AddLine("text", "|cffffff00选择施放目标",
					"hasArrow", 1, "value", "TargetListTargetsConditions_" ..TC,
					"disabled",data["lock"] and data["unit"]=="nogoal",
					"tooltipText",str,"tooltipTitle","警告！");
			
			local TargetLayer = data["TargetLayer"] or 0;
			local TargetLayerText="";
			
			for n=1,TargetLayer do
				TargetLayerText = TargetLayerText .. "|cffff0000-|r目标"
			end
			
			
			if data["Target"] then
				if data["TargetSubgroup"] == -2 then
				
				
				
					local Remarks = SuperTreatmentDBF["Unit"]["RaidList"][data["Target"]]["Remarks"]
				
				
					local str =addon:FormatTooltipText(Remarks);
					str = str .. "|r增减目标:\n\n"
					str = str .. "|cffff0000增加目标: |cffffffffCtrl + 鼠标左键";
					str = str .. "\n|cffff0000减小目标: |cffffffffAlt  + 鼠标左键";
				
					--[[
					menu:AddLine("text", "|cffff0000>|cff00ff00" .. data["Target"].. TargetLayerText .. "|cffff0000<","justifyH","RIGHT",
					"func", "AddTargetLayer", "arg1", self, "arg2", data,
					"hasArrow", 1, "value", "CustomizeTargetListGetTarget_" .. data["Target"],
					"tooltipText",str,"tooltipTitle","信息");
					--]]
					
					
					menu:AddLine("text", "|cffff0000>|cff00ff00" .. data["Target"].. TargetLayerText .. "|cffff0000<","justifyH","RIGHT",
					"func", "AddTargetLayer", "arg1", self, "arg2", data,
					"hasArrow", 1, 
					"tooltipText",str,"tooltipTitle","信息",
					"OpenMenu",SuperTreatment["Menu"]["CustomizeTarget"],
					"OpenMenuValue",{"Target",data["Target"]}
					);
					
					
				else
					
					local str = "|r增减目标:\n\n";
					str = str .. "|cffff0000增加目标: |cffffffffCtrl + 鼠标左键";
					str = str .. "\n|cffff0000减小目标: |cffffffffAlt  + 鼠标左键";
					menu:AddLine("text", "|cffff0000>|cff00ffff" .. data["Target"].. TargetLayerText .. "|cffff0000<","justifyH","RIGHT",
					"func", "AddTargetLayer", "arg1", self, "arg2", data,
					"tooltipText",str,"tooltipTitle","信息");
					
				end
			end
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8,
			"ToggleButton",1,"ToggleButtonFun",function()
					SuperTreatmentDBF.IsAdvancedSettings3_1=not SuperTreatmentDBF.IsAdvancedSettings3_1;
					DropDownMenu:Refresh(level);
					
					end,
					"ToggleState",SuperTreatmentDBF.IsAdvancedSettings3_1,
					"ToggleX",0,"ToggleY",3
			
			);
			
			menu:AddLine();
			
			local disabled = Spells[valueN]["Type"] and (Spells[valueN]["Type"] =="macro" or Spells[valueN]["Type"] =="script" or Spells[valueN]["Type"] =="Run");
			
			
			if disabled then
				
				
				local str = addon:FormatTooltipText("这个打断为最高级别优先，什么情况下都会第一时间打断自己的施法。");
				menu:AddLine("text", "立刻打断当前施法","checked",Spells[valueN]["StopCastingChecked"],
				"func", "TargetList_StopCasting_Checked","arg1", 
				self,"arg2", valueN,
				"tooltipText",str,"tooltipTitle","打断"
				);
				
				if Spells[valueN]["Type"] =="Run" then
					
					addon["MenuLevel"]=level;
					SuperTreatment["type"]="Run"					
					SuperTreatment["ApiDbf"]=SuperTreatment["ApiDbfRun"];
					local TBL = SuperTreatment["ApiDbfRun"];
					--local e = data["id"];
					--local k = TBL[data["id"]]["id"];
					--local rs =TBL[data["id"]];
					local k = data["ApiDbf"][1]["id"];
					local rs =data["ApiDbf"][1];
					local e =1;
						
																	
					local Apidata =SuperTreatment["Api"][k];
				
					local str = addon:FormatTooltipText("\n" .. Apidata["inf"] .. "\n\n|cffffff00" .. Apidata["Remarks"]);
						local ArgumentsTexts="";
						local Arguments = Apidata["Arguments"];
						
						local Counts = Apidata["Arguments"]["Counts"];
						if Counts==0 then
						
							ArgumentsTexts = "\n|cffff0000参数:|r 无\n"
						else
						
							for n=1,Counts do
								local m ="";
								if not rs["Arguments"][n] then
									rs["Arguments"][n]={};
								end
									if  rs["Arguments"][n]["value"] ~= nil then
										m = "|cffff00ff值: |cff00ffff" .. tostring(rs["Arguments"][n]["value"]).. "|r\n";
									end
								ArgumentsTexts = ArgumentsTexts .."\n|cffff0000参数".. n .. "(|r" .. TYPEINF[Arguments[n]["type"]] .."|cffff0000):|r\n"  .. Arguments[n]["inf"] .. "\n" .. m ;
								
							end
							
						end
						
						local ReturnsTexts="";
						local Returns = Apidata["Returns"];
						
						local Counts = Apidata["Returns"]["Counts"];
						if Counts==0 then
						
							ReturnsTexts = "\n|cffff0000返回值:|r 无\n"
						else
						
							for n=1,Counts do
								
								ReturnsTexts = ReturnsTexts .."\n|cffff0000返回值".. n .. "(|r" .. TYPEINF[Returns[n]["type"]] .."|cffff0000):|r\n"  .. Returns[n]["inf"] .. "\n";
								
							end
							
						end
						
						ArgumentsTexts = Apidata["inf"] .. "\n" .. ArgumentsTexts .. ReturnsTexts .. "\n|cff00ff00" .. Apidata["Remarks"] .. "|r";
						
						local str = "\n"
						ArgumentsTexts = ArgumentsTexts .. str .. NOTT;
						
						menu:AddLine("text","属性设定",
						"tooltipText",ArgumentsTexts,"tooltipTitle",k,
						"checked",rs["checked"],	"func", "SuperTreatmentApiListSet_Run_checked", "arg1", self, "arg2", rs,
						"hasArrow", 1, "value", "SuperTreatmentApiListSet_" .. k .. "_" .. e
						);
					menu:AddLine();
				else
				
			
					menu:AddLine("text", "属性设定",
							"hasArrow", 1, "value", "TargetListPropertiesSet_" ..TC);
					menu:AddLine();
				
				end
			
			else
				
				local disabled = tbl["Checked"];
				
				if not SuperTreatmentDBF.IsAdvancedSettings3_1 then
				
				local str = addon:FormatTooltipText("这个打断为最高级别优先，什么情况下都会第一时间打断自己的施法。");
				menu:AddLine("text", "立刻打断当前施法","checked",Spells[valueN]["StopCastingChecked"],
				"func", "TargetList_StopCasting_Checked","arg1", 
				self,"arg2", valueN,
				"tooltipText",str,"tooltipTitle","打断",
				"disabled",disabled
				);
				
				local str = "|cffff0000AOE技能需要有|r【技能插入】|cffff0000功能的插件、脚本，并且启动它才可以施放。";
				local checked = SuperTreatmentDBF["Config"]["aminspell"];
				local TEXT;
				if checked and not disabled then
					TEXT = "|cff00ff00属于范围选择技能(AOE)";
				else
					TEXT = "属于范围选择技能(AOE)";
				end
				
				menu:AddLine("text", TEXT,"checked",Spells[valueN]["AOEChecked"],
				"func", "TargetList_AOE_Checked","arg1", 
				self,"arg2", valueN,
				"hasArrow", 1, "value", "SetSkillsInto",
				"disabled",disabled,
				"tooltipText",str,"tooltipTitle","警告！");
				
				
				
				local spellName = GetSpellInfo(Spells[valueN]["spellId"]);
				local str = addon:FormatTooltipText("当施放" .. spellLink .. "时不允许其它技能打断它");
				menu:AddLine("text", "不要打断这技能施放","checked",
				SuperTreatmentDBF["Spells"]["NoStopCastingSpells"][spellName],
				--Spells[valueN]["NoStopCastingChecked"],
				"func","TargetList_NoStopCasting_Checked","arg1", self,"arg2", {valueB1,valueN},"tooltipText",str,"tooltipTitle","打断设定")
				
				local str = addon:FormatTooltipText("当自己失控时如果选择了该项，那么自己被羊的时候自己的宠物就可以用吞噬魔法技能解自己的羊。");
				
				menu:AddLine("text", "失控时可对自己施法","checked",
				
				Spells[valueN]["PlayerChaosChecked"],"func",
				"PlayerChaos_Checked","arg1", self,"arg2", valueN,"tooltipText",str,"tooltipTitle","自己失控时")
				
				
				
				local tbl = Spells[valueN]
				
				if not tbl["DelayValue"] then
					tbl["DelayValue"]=0;
				end
				local str = addon:FormatTooltipText("当技能施放成功后开始延时，延时时间内不能对同个目标施放该技能。这样可以避免技能同时对同个目标施放2次，当然您也可以利用这特性做点别的。");
				menu:AddLine("text", "|cffffffff下次延时(|cffff0000" .. tbl["DelayValue"]  .."|cffffffff)秒接受施放" , "hasArrow", 1, "value", TC,
				"checked",tbl["DelayChecked"],"func", "TargetList_DelayChecked","arg1", self,"arg2", valueN,
				"hasSlider", 1, "sliderValue",tbl["DelayValue"], "sliderMin", 0, "sliderMax", 9999, "sliderStep", 0.1, "sliderFunc",
				"TargetList_Delay_value" , "sliderArg1", self,"sliderArg2", valueN,"sliderDecimals",1,
				"tooltipText",str,"tooltipTitle","延时"
				);
				
				local disabled;
				if not tbl["Rank"] or tbl["Rank"]=="" then
					disabled = true;
				end
				
				local checked = tbl["RankChecked"];
				local str = addon:FormatTooltipText("技能施放默认是按目前最高等级来施放的，如果你选择了该项那么就按照你输入时的技能等级来施放。|r\n注意:有时候技能和物品同名时可以通过判断技能等级来区分2者，一般物品是没等级(不是物品级别)的。");
				menu:AddLine("text", "按技能(|cffff0000" .. tbl["Rank"] .. "|r)来施放" ,"checked",checked ,
				"disabled",disabled,"func", "TargetList_Rank_checked","arg1", self,"arg2",tbl,
				"tooltipText",str,"tooltipTitle","按技能等级");
				
				local checked = tbl["PowerCostChecked"];
				local str = addon:FormatTooltipText("技能变暗时技能是无法对当前目标及自己施放的，但可以对别的目标施放。如果你确认你的技能可以对别的目标施放并且技能是暗的那么请选择该项。|r\n注意:牧师的[真言术：盾]就是这类。");
				menu:AddLine("text", "技能变暗设定,激活能量选项" ,"checked",checked ,
				"func", "TargetList_PowerCost_checked","arg1", self,"arg2",tbl,
				"tooltipText",str,"tooltipTitle","技能变暗");
				
				
				if not Spells[valueN]["CastingSpellStartOrEnd"] then
					Spells[valueN]["CastingSpellStartOrEnd"]={};
					Spells[valueN]["CastingSpellStartOrEnd"]["Start"]={};
					Spells[valueN]["CastingSpellStartOrEnd"]["End"]={};
				end
				
				local str = addon:FormatTooltipText("当技能施放时或者施放完毕时执行|r宏、函数、脚本。\n\n|cffff0000注意:|r不会对执行结果进行判断。");
				menu:AddLine("text", "|cffffff00施放时|cffff0000或|cffffff00施放完|r执行" ,"hasArrow", 1,
				"value", "CastingSpellStartOrEnd_" .. valueN,
				"checked",Spells[valueN]["CastingSpellStartOrEnd"]["checked"] ,"func", "CastingSpellStartOrEnd_checked","arg1", self,"arg2", Spells[valueN]["CastingSpellStartOrEnd"],
				"tooltipText",str,"tooltipTitle","说明"
				);
				
				
				local str = addon:FormatTooltipText("忽略您的施法状态判断。|r\n\n如:[升腾之雾]在[抚慰之雾]施放时有瞬发效果，选择该选项使[升腾之雾]能施放。");
				menu:AddLine("text", "忽略施法","checked",Spells[valueN]["NoAcChecked"],
				"func", "NoAcChecked","arg1", 
				self,"arg2", Spells[valueN],
				"tooltipText",str,"tooltipTitle","忽略施法"
				);
				
				end
				
			end
			if not SuperTreatmentDBF.IsAdvancedSettings3_1 then
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			end
		
			
			local TBL = Spells[valueN];
			
			local text;
			if TBL["and/or"] then
				text = "Or";
			else
				text = "And";
			end
			 
			local str = addon:FormatTooltipText("点击切换 或者(Or)/并且(And) 关系,该选项决定下列选项的处理关系。")			
			menu:AddLine("text","|cffffff00使用|cffff0000"..text.."|cffffff00关系|r",
			"func", valueA .. "_and_or","arg1", self,"arg2", TBL,
			"tooltipText",str,"tooltipTitle","信息"
			);
			
			menu:AddLine("line",1,"LineHeight",8);
			
			local str = addon:FormatTooltipText("新建条件，请输入名称随便您怎么起名都行方便记忆。")	
			menu:AddLine("text", "|cff00ffff新建目标条件方案","colorCode","|cffffff00","hasEditBox", 1, "editBoxFunc", "TargetListAddTargets", "editBoxArg1", self,"editBoxArg2", valueN,"icon","INTERFACE\\ICONS\\Ability_Hunter_OneWithNature",
			"tooltipText",str,"tooltipTitle","新建目标条件方案",
			"inftitle","第五步",
				"inftext","如果您需要设定条件施法技能，那么把鼠标放到此菜单上按提示做。",
				"infx",0,
				"infy",-12,
				"infid",5,
				"infheight",65,
				"infchecked",SuperTreatmentAllDBF.HelpNavigation and #Spells[valueN]["Targets"]<=0
			
			);
			
			
			local sumindex=0;
			for i, data in pairs(Spells[valueN]["Targets"] ) do
				sumindex = sumindex+1;
			end
			
			if sumindex == 0 then
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			else
				menu:AddLine("line",1,"LineHeight",8);
			end
			
			if Spells[valueN]["Targets"] then
				
				for i, data in pairs(Spells[valueN]["Targets"] ) do
					local v =data;
					
					if not v.Key then
						v.Key={};
					end
					
					if not v.Mark then
						v.Mark=amrandom(k);
					end
					
					if not v.Key.KeySelect then
						v.Key.KeySelect="auto";
					end
				
					local str={};
					if str then
						
						
						local t={};
						
						
						
						
						
						if data["Remark"] and data["Remark"]~="" then
							
							t["type"]="AddLine";
							t["text"]=data["Remark"];
							table.insert(str,t);
						end
						
						t={};
						t["type"]="AddLine";
						t["text"]=" ";
						table.insert(str,t);
						
						t={};
						t["type"]="AddDoubleLine";
						t["left"]="|cffffff00条件取反:";
						t["right"]="|cffffffffAlt + 鼠标左键";
						table.insert(str,t);
						
						t={};
						t["type"]="AddDoubleLine";
						t["left"]="|cffffff00删除:";
						t["right"]="|cffffffffCtrl + Alt + 鼠标左键";
						table.insert(str,t);
						
						t={};
						t["type"]="AddDoubleLine";
						t["left"]="|cffffff00属性:";
						t["right"]="|cffffffff鼠标右键";
						table.insert(str,t);
						
						local keytype;
							
						if v.Key.KeySelect=="auto" then
							keytype="选择/放弃";
						elseif v.Key.KeySelect=="no" then
							keytype="放弃";
						elseif v.Key.KeySelect=="ok" then
							keytype="选择";
						elseif v.Key.KeySelect=="run" then
							keytype="执行";
						elseif v.Key.KeySelect=="auto1" then
							keytype="选择/放弃(全)";
						elseif v.Key.KeySelect=="no1" then
							keytype="放弃(全)";
						elseif v.Key.KeySelect=="ok1" then
							keytype="选择(全)";
						end
						
						
						if v.Key and v.Key.Checked and v.Key.Value and v.Key.Value ~="" then
				
							t={};
							t["type"]="AddDoubleLine";
							t["left"]="|cffffff00快捷键:";
							t["right"]="|cffffffff" .. (v.Key.Value or "");
							table.insert(str,t);
						
							t={};
							t["type"]="AddDoubleLine";
							t["left"]="|cffffff00快捷键类型:";
							t["right"]="|cffffffff" .. (keytype or "");
							table.insert(str,t);
						
						else
							
							t={};
							t["type"]="AddDoubleLine";
							t["left"]="快捷键:";
							t["right"]=(v.Key.Value or "");
							t.rL, t.gL, t.bL = GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b;
							t.rR, t.gR, t.bR = GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b;
							table.insert(str,t);
							
							
							t={};
							t["type"]="AddDoubleLine";
							t["left"]="快捷键类型:";
							t["right"]=(keytype or "");
							t.rL, t.gL, t.bL = GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b;
							t.rR, t.gR, t.bR = GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b;
							table.insert(str,t);
						end
						
						
							t={};
							t["type"]="AddDoubleLine";
							t["left"]="|cffffff00Id:";
							t["right"]="|cffffffff" .. (v.Mark or "");
							table.insert(str,t);
					
					end
					
					local tbl={};
					
					if true then
						
						local Solution = Spells[valueN]["Targets"];
						local k = i;
						
						tbl.CastProgram={};
						local ex = tbl.CastProgram;
						ex.copy ={}; 
							ex.copy.fun = function()
							
								SuperTreatmentInf["Copyexchange"]["CopySpellProgramTargetCondition"]=v;
								DropDownMenu:Refresh(level);
							end; 
							ex.copy.arg1 = v;
							
							ex.Paste ={}; 
							ex.Paste.fun = function()
								local TBL = th_table_dup(SuperTreatmentInf["Copyexchange"]["CopySpellProgramTargetCondition"]);
								--if TBL.Key.ButtonFrame and TBL.Key.ButtonFrame.SetAttribute then
								--	ClearOverrideBindings(TBL.Key.ButtonFrame);
								--end
								TBL["name"] = TBL["name"] .. "("..date("%H:%M:%S")..")";
								--TBL.Key={};
								--TBL.Key.KeySelect = "auto";
								--TBL.Mark=amrandom(k);
								
								stRefreshMark(TBL);
								stCancelKey(TBL,1);
								
								table.insert(Solution,k, TBL);
								DropDownMenu:Refresh(level);
							end; 
							
							ex.Paste.arg1 = {Solution,k};
							ex.Paste.checked=function() return SuperTreatmentInf["Copyexchange"]["CopySpellProgramTargetCondition"];end;
							
							
						ex.Del ={}; 
							ex.Del.fun = function() 
							table.remove(Solution,k);
							DropDownMenu:Refresh(level);
							DropDownMenu:ArrowHide(self,level);
							end; 
							
							ex.Up ={}; 
							ex.Up.fun = function() 
								if k>1 then
									local NewTblA = th_table_dup(Solution[k]);
									local NewTblB = th_table_dup(Solution[k-1]);
									Solution[k-1]=NewTblA;
									Solution[k]=NewTblB;						
									DropDownMenu:Refresh(level);
								end
							end;
							
						ex.Down ={}; 
							ex.Down.fun = function() 
								local n = #(Solution);
								if k<n then
									local NewTblA = th_table_dup(Solution[k]);
									local NewTblB = th_table_dup(Solution[k+1]);
									Solution[k+1]=NewTblA;
									Solution[k]=NewTblB;
									DropDownMenu:Refresh(level);
								
								end
							end;
							
						ex.Renamed=true;
						
						ex.text =v["name"];
						ex.index =k;
						ex.tbl = Solution;
						
					
					
							
							
					end
					
					
					--local str = addon:FormatTooltipText(data["Remark"].. "\n\n\n|cffff0000复制: |cffffffffCtrl + 鼠标左键\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键" .. NOTT)
					menu:AddLine(						
							"text", NOT(data,"|cff104E8B" .. i ..
							".|r " .. data["name"]),
							"checked", data["checked"],
							"hasArrow", 1, "value", "TargetListTargets_" .. valueN .. "_" .. i,
							"tooltipText",str,
							"func","SpellsListTargets_checked", "arg1", self, "arg2", {Spells[valueN],i},
							"tooltipTitle","信息",
							"inftitle","第六步",
							"inftext","鼠标放到此菜单上，设定下级菜单。",
							"infx",0,
							"infy",-12,
							"infid",6,
							--"infheight",65,
							"infchecked",SuperTreatmentAllDBF.HelpNavigation,
							"OpenRightMenu",SuperTreatment["Menu"]["OpenRightMenu"],
							"OpenRightMenuValue",tbl
							)
						
					if i == sumindex then
					
						menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
					else
						menu:AddLine("line",1,"LineHeight",8);
					end
					
				end
					local Solution = Spells[valueN]["Targets"];
					if #Solution==0 then
				
						local tbl={};
						tbl.CastProgramAdd={};
						local ex = tbl.CastProgramAdd;
				
						ex.Paste ={}; 
							ex.Paste.fun = function()
								local TBL = th_table_dup(SuperTreatmentInf["Copyexchange"]["CopySpellProgramTargetCondition"]);
								TBL["name"] = TBL["name"] .. "("..date("%H:%M:%S")..")";														
								stRefreshMark(TBL);
								stCancelKey(TBL,1);
								
								table.insert(Solution,TBL);
								DropDownMenu:Refresh(level);
							end; 
							
							
							ex.Paste.checked=function() return SuperTreatmentInf["Copyexchange"]["CopySpellProgramTargetCondition"];end;
						
						
						
						local str = addon:FormatTooltipText("注意:鼠标右键可以粘贴。");
						menu:AddLine("text","(没条件)","OpenRightMenu",SuperTreatment["Menu"]["OpenRightMenu"],
						"OpenRightMenuValue",tbl,
						"tooltipText",str,"tooltipTitle","信息"
						);
					
					end
			
			end	
			
			
			--menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			--[[
			local str = addon:FormatTooltipText("把其它方案粘贴到这里来，前提你已经复制了目标条件方案。");
		
			if SuperTreatmentInf["Copyexchange"]["CopySpellProgramTargetCondition"] then
				
					
				menu:AddLine("text", "|cffffff00粘贴",
				"icon","INTERFACE\\ICONS\\INV_Letter_16",
				"func", "PasteSpellProgramTargetCondition","arg1", self,"arg2", Spells[valueN]["Targets"],"tooltipText",str,"tooltipTitle","粘贴")
				
			else
				
				menu:AddLine("text", "粘贴",
				"icon","INTERFACE\\ICONS\\INV_Letter_16",
				"disabled",1,"tooltipText",str,"tooltipTitle","粘贴")
				
			
			end
				
			
			menu:AddLine();
			local str = addon:FormatTooltipText("复制当前技能条件方案到粘贴板");
			menu:AddLine("text", "|cffffff00复制",
			"icon","INTERFACE\\ICONS\\INV_Letter_04",
			"func", "CopySpellProgram","arg1", self,"arg2", Spells[valueN],"tooltipText",str,"tooltipTitle","复制")
			
			menu:AddLine();
			--]]
			local str = addon:FormatTooltipText("当你的技能需要判断条件施放时请先建立个条件方案(菜单)理论上可以建立N个，把鼠标移到刚建好的方案上您会获得更多下一步怎么做的信息。\n\n方案有优先级别前面的比后面的优先鼠标移到方案上显示操作方式帮助。|r\n\n提示小白多移动鼠标到菜单上有帮助提示的，选择(菜单打钩)代表启用该选项");
				
			menu:AddLine("text", "|cff00ff00帮助","tooltipText",str,"tooltipTitle","帮助","icon","Interface\\Icons\\INV_Misc_QuestionMark");
			
			
		elseif value == "AddPetSpell" then	
			
			
			local i = 1;
			
				for k, data in pairs(PetspellInf) do
					
					data["spellLink"]=data["name"]
					data["spellSubName"]="";
					
					local str=data["macro"];
					menu:AddLine(						
						"text", "|cff104E8B" .. i ..".|r " .. data["name"],
						"icon",data["texture"],
						"func","MagicSolutionAddPetMacro_Add", "arg1", self, "arg2", data,
						"tooltipTitle","信息","tooltipText",str
						
						);
					menu:AddLine("line",1);	
					i = i + 1;
				end
			
				local spellautoCastAllowed={};
				local spellautoCastAllowedOff={};
				
				local index=1;
				while true do
				
					local spellName, spellSubName;
					
				   
					if GetSpellBookItemName then
						
						spellName, spellSubName = GetSpellBookItemName(index, BOOKTYPE_PET);
					   
					   else
					   
						spellName, spellSubName = GetSpellName(index, BOOKTYPE_PET);
						
					end
				   
				   
				   if not spellName then
					  do break end
				   end
				   
				   local _, spellId = GetSpellBookItemInfo(index, "pet")
				   
				   if not IsPassiveSpell(index, BOOKTYPE_PET) and spellId then
					   -- use spellName and spellSubName here
					   --DEFAULT_CHAT_FRAME:AddMessage( spellName .. '(' .. spellSubName .. ')' );
						
						local spellLink = GetSpellLink(index, BOOKTYPE_PET);
						
						local Texture = GetSpellTexture(index, BOOKTYPE_PET);
						--print(spellLink,spellId,spellName)
						--local _, _, spellId = string.find(spellLink, "^|c%x+|Hspell:(%d+)|h%[.*%]");
						--spellId = tonumber(spellId);
						local str=spellLink .. "(" .. spellSubName .. ")";
							
							
							menu:AddLine(						
							"text", "|cff104E8B" .. i ..".|r " .. spellLink,
							"icon",Texture,
							"tooltipText",str,
							"func","SpellsList", "arg1", self, "arg2", spellId + 100000000,
							"tooltipTitle","信息"
							)
						menu:AddLine("line",1);
						local autocastable, autostate = GetSpellAutocast(index,BOOKTYPE_PET);
						if autocastable then
							--print(spellName,autocastable, autostate,autoCastAllowed)
							spellautoCastAllowed[spellName]={};
							spellautoCastAllowed[spellName]["texture"]=	Texture;
							spellautoCastAllowed[spellName]["spellId"]=	spellId;
							spellautoCastAllowed[spellName]["spellLink"]=spellLink;
							spellautoCastAllowed[spellName]["spellSubName"]=spellSubName;

							spellautoCastAllowedOff[spellName]={};
							spellautoCastAllowedOff[spellName]["texture"]=	Texture;
							spellautoCastAllowedOff[spellName]["spellId"]=	spellId;
							spellautoCastAllowedOff[spellName]["spellLink"]=spellLink;
							spellautoCastAllowedOff[spellName]["spellSubName"]=spellSubName;
						end		
					   
					   i = i + 1;
					end
					index = index+1;
				end
				
				for k, data in pairs(spellautoCastAllowed) do
					
					data["macro"]='if not amautoCastEnabledPet("'..k..'") then amrun("/petautocaston '..k..'");return true;end;';
					--data["macro"]="/petautocaston " ..k;
					data["name"]=k;
					data["spellLink"]=data["spellLink"].."|cff00ff00开";
					data["unit"]="nogoal";
					data["unitname"]="无目标";
					data["type"]="script";
					data["PropertiesSetChecked"]=3;
					data["lock"]=true;
					
					local str=data["spellLink"] .. "(" .. data["spellSubName"] .. ")\n把法术自动施放开启";
					menu:AddLine(						
						"text", "|cff104E8B" .. i ..".|r " .. data["spellLink"],
						"icon",data["texture"],
						"func","MagicSolutionAddPetMacro_Add", "arg1", self, "arg2", data,
						"tooltipTitle","信息","tooltipText",str
						
						);
						menu:AddLine("line",1);
						
					i = i + 1;
				end
				
				
				for k, data in pairs(spellautoCastAllowedOff) do
					
					data["macro"]='if amautoCastEnabledPet("'..k..'") then amrun("/petautocastoff '..k..'");return true;end;';
					--data["macro"]="/petautocastoff " ..k;
					data["name"]=k;
					data["spellLink"]=data["spellLink"].."|cffff0000关";
					data["unit"]="nogoal";
					data["unitname"]="无目标";
					data["type"]="script";
					data["PropertiesSetChecked"]=3;
					data["lock"]=true;
					
					local str=data["spellLink"] .. "(" .. data["spellSubName"] .. ")\n把法术自动施放关闭";
					menu:AddLine(						
						"text", "|cff104E8B" .. i ..".|r " .. data["spellLink"],
						"icon",data["texture"],
						"func","MagicSolutionAddPetMacro_Add", "arg1", self, "arg2", data,
						"tooltipTitle","信息","tooltipText",str
						
						);
					menu:AddLine("line",1);	
					i = i + 1;
				end

		
		end
		
		
		
		
	elseif level == 4 then -- 4级菜单内容
		
		local _, _, valueA, valueB = string.find(value, "(.-)_(.+)")
		
		local V = addon:DecompositionValue(value);
		
		
		if  V[1] == "CastingSpell" then	
		
			local tbl ;
			local V2 = tonumber(V[2]);
			tbl = Spells[V2]["CastingSpell"];
			
		
			menu:AddLine("text","技能列表:"  ,"isTitle",1);
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			
			local Spells =tbl["spell"];
			
			for i, data in pairs(Spells) do
					
					local spellId = data["spellId"];
					local spellType = data["Type"];
					local checked;
					
					
					
					if spellType=="item" then
						
						--[[						
						local rank =Spells[i]["Rank"] or "" ;
						local itemLink = Spells[i]["itemLink"];
						
						if not itemLink then
							_,itemLink=GetItemInfo(spellId);
							Spells[i]["itemLink"] = itemLink;
						end
						
						
						
						
						local Texture = Spells[i]["Texture"];
						
						--]]
						
						local _, itemLink, _, _, _, _, _, _, _, Texture=GetItemInfo(spellId);
						local rank =Spells[i]["Rank"] or "" ;
						
						local str=itemLink .. "(" .. rank .. ")";
						str = str .. "\n\n|cffff0000上移: |cffffffffCtrl + 鼠标左键";
						str = str .. "\n|cffff0000下移: |cffffffffAlt  + 鼠标左键";
						str = str .. "\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键";
					
						menu:AddLine(						
						"text", "|cff104E8B" .. i ..
						".|r " .. itemLink,
						
						"icon",Texture,
						"func","CastingSpellStartOrEndStartSpell_EditSpell", "arg1", self, "arg2", {Spells,i},
						"tooltipText",str,
						
						"tooltipTitle","信息"
						)
						
					elseif spellType=="spell" then
						
						--[[
						local spellLink = Spells[i]["itemLink"];
						
						if not spellLink then
							spellLink,_=GetSpellLink(spellId);
							Spells[i]["itemLink"] = spellLink;
						end
						
						
						local Texture = Spells[i]["Texture"];
						local rank =Spells[i]["Rank"];
						if not rank then rank="";end
						--]]
						
						local _,rank,Texture = GetSpellInfo(spellId);
						local spellLink,_=GetSpellLink(spellId);
						
						local str=spellLink .. "(" .. rank .. ")";
						str = str .. "\n\n|cffff0000上移: |cffffffffCtrl + 鼠标左键";
						str = str .. "\n|cffff0000下移: |cffffffffAlt  + 鼠标左键";
						str = str .. "\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键";
					
						
						menu:AddLine(						
						"text", "|cff104E8B" .. i ..
						".|r " .. spellLink,
						
						"icon",Texture,
						"func","CastingSpellStartOrEndStartSpell_EditSpell", "arg1", self, "arg2", {Spells,i},
						"tooltipText",str,
						
						"tooltipTitle","信息"
						)
						
						
					elseif spellType=="macro" or spellType=="script" then
					
						
						
						local MacroName = Spells[i]["MacroName"];
						local Texture = "";
						
						if Spells[i]["Texture"] then
							Texture =Spells[i]["Texture"];
						end
						
						local itemLink="";
						if Spells[i]["itemLink"] and Spells[i]["itemLink"] ~="" then
							itemLink =Spells[i]["itemLink"];
						else
							itemLink = MacroName;
						end
						
						local temp = ST.MacroFinishing(Spells[i]["Macro"],Spells[i]["unit"])
						
						if not rank then rank="";end
						local str = temp .. "\n"..Spells[i]["Remarks"] ;
						str = str .. "\n\n|cffff0000上移: |cffffffffCtrl + 鼠标左键";
						str = str .. "\n|cffff0000下移: |cffffffffAlt  + 鼠标左键";
						str = str .. "\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键";
					
						
						menu:AddLine(						
						"text", "|cff104E8B" .. i ..
						".|r " .. itemLink,
						
						"icon",Texture,
						
						"tooltipText",str,
						"func","CastingSpellStartOrEndStartSpell_EditSpell", "arg1", self, "arg2", {Spells,i},
						"tooltipTitle",MacroName
						)	
				

									
					end
					
					
					
					menu:AddLine("line",1);
					
				
				end
				
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			local str = addon:FormatTooltipText("可以拖动的技能请往这里放。");
			
			menu:AddLine("text","|cffffff00拖动技能|cffff0000点这|cffffff00添加","func","CastingSpellStartOrEndStartSpell_AddSpell", "arg1", self, "arg2", tbl,"tooltipText",str,"tooltipTitle","信息")
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			local str = addon:FormatTooltipText("添加打断技能宏:|r\n\n/stopcasting");
			menu:AddLine("text","|cffffff00添加打断技能宏","func","CastingSpellStartOrEndStartSpell_AddMacro", "arg1", self, "arg2", Spells,"tooltipText",str,"tooltipTitle","信息")
		
		
		elseif  V[1] == "CastingSpellStartOrEnd" then	
			
			local V2 = tonumber(V[2]);
			local str,StartOrEnd;
			
			
			
			StartOrEnd = Spells[V2]["CastingSpellStartOrEnd"];
			
			if not StartOrEnd["Start"]["Chat"] then
				StartOrEnd["Start"]["Chat"]={};
				StartOrEnd["Start"]["Chat"]["isRadio"]= ChatExplain[1]["command"];
				StartOrEnd["Start"]["Chat"]["channel"]=1;
				StartOrEnd["Start"]["Chat"]["text"]="";
				
				
				StartOrEnd["Start"]["SetVariables"]={};
				
				StartOrEnd["End"]["Chat"]={};
				StartOrEnd["End"]["Chat"]["isRadio"]= ChatExplain[1]["command"];
				StartOrEnd["End"]["Chat"]["channel"]=1;
				StartOrEnd["End"]["Chat"]["text"]="";
				
			end
			
				
			
			
			
			if not StartOrEnd["Start"]["script"] then
				StartOrEnd["Start"]["script"]="";
				StartOrEnd["End"]["script"]="";
			end
			
			
			if not StartOrEnd["Start"]["spell"] then
				StartOrEnd["Start"]["spell"]={};
				
			end
			
		
			local tbl = StartOrEnd["Start"];
			local checked = tbl["checked"];
			
			
			str = addon:FormatTooltipText("关闭技能施放时执行" );
			menu:AddLine("text", "|cffffff00施放时执行|cffff0000(|r开|cffff0000/|r关|cffff0000)|r" ,
			"checked",checked ,"func", "CastingSpellStartOrEnd_Start_checked","arg1", self,"arg2", tbl,
			"tooltipText",str,"tooltipTitle","说明"
			);
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			str = addon:FormatTooltipText("发信息到频道，输入要发送的信息选择要发送的频道。");
			menu:AddLine("text", "|cff104E8B1|r.|cff00ffff发信息到频道" ,"hasArrow", 1,
			"value", "CastingSpellStartOrEndStartChat_" .. V2,
			"checked",tbl["ChatChecked"],"func", "CastingSpellStartOrEnd_Start_ChatChecked","arg1", self,"arg2", tbl,
			"tooltipText",str,"tooltipTitle","说明"
			);
			
			menu:AddLine("line",1);
			
			local script = tbl["script"];
			
			str = addon:FormatTooltipText("当技能施放时执行|r宏、函数、脚本。\n\n|r注意:有斜杠[/]开头的都视为宏其它为脚本或者函数\n\n|cffff0000注意:尽可能不要用宏和执行技能类的函数如|r amrun() |cffff0000这些会影响技能施放。\n\n|cffffff00内容:|r\n" .. script);
			
			menu:AddLine("text", "|cff104E8B2|r.|cff00ffff脚本/宏/函数" ,
				"hasEditBox", 1, "editBoxText", script,"editBoxFunc","CastingSpellStartOrEnd_Start_Edit", "editBoxArg1", self,"editBoxArg2", tbl,
				"checked",tbl["ScriptChecked"],"func", "CastingSpellStartOrEnd_Start_ScriptChecked","arg1", self,"arg2", tbl,
				"tooltipText",str,"tooltipTitle","说明"
				);
				
				
			----------------
			menu:AddLine("line",1);
			
			local temp=addon:TblToMacro(tbl["spell"]);
			
			local css = Spells[V2]["CastingSpellStartOrEnd"]["Start"];
			
			if css["DelayValue"]== -1 and css["SpellChecked"] then	
				
				str = addon:FormatTooltipText("延时施放技能，一般应用在GCD时间内，哦就是平常说的卡GCD施放，如果设定时间为 -1 那么就视为一个连续的技能(魔兽允许你这么施放才行)。\n\n|cffff0000如:|r\n/cast 盾牌猛击\n/cast 英勇打击\n\n两个技能可以1次发出。\n\n|cffff0000按设定生成的宏:|r\n\n" .. temp .."\n\n请确认以上的宏能正常使用那么设定才有效。\n\n|cffff0000注意|r:\n施放技能可能会跟其它施放产生干扰可能会失败");
				menu:AddLine("text", "|cff104E8B3|r.|cff00ffff延时施放技能" ,"hasArrow", 1,
				"value", "CastingSpellStartOrEndStartSpell_" .. V2,
				"checked",tbl["SpellChecked"],"func", "CastingSpellStartOrEnd_Start_SpellChecked","arg1", self,"arg2", tbl,
				"tooltipText",str,"tooltipTitle","说明"
				);
				
			else
				
				str = addon:FormatTooltipText("延时施放技能，一般应用在GCD时间内，哦就是平常说的卡GCD施放。\n\n|cffff0000按设定生成的宏:|r\n\n" .. temp .."\n\n请确认以上的宏能正常使用那么设定才有效。\n\n|cffff0000注意|r:\n施放技能可能会跟其它施放产生干扰可能会失败");
				menu:AddLine("text", "|cff104E8B3|r.|cff00ffff延时施放技能" ,"hasArrow", 1,
				"value", "CastingSpellStartOrEndStartSpell_" .. V2,
				"checked",tbl["SpellChecked"],"func", "CastingSpellStartOrEnd_Start_SpellChecked","arg1", self,"arg2", tbl,
				"tooltipText",str,"tooltipTitle","说明"
				);
			
			end
			
			menu:AddLine("text","","disabled",1);
			
			local tbl = StartOrEnd["End"];
			local checked = tbl["checked"];
			
			
			str = addon:FormatTooltipText("关闭技能施放完毕时执行" );
			menu:AddLine("text", "|cffffff00施放完毕时执行|cffff0000(|r开|cffff0000/|r关|cffff0000)|r" ,
			"checked",checked ,"func", "CastingSpellStartOrEnd_End_checked","arg1", self,"arg2", tbl,
			"tooltipText",str,"tooltipTitle","说明"
			);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			str = addon:FormatTooltipText("发信息到频道，输入要发送的信息选择要发送的频道。");
			menu:AddLine("text", "|cff104E8B1|r.|cff00ffff发信息到频道" ,"hasArrow", 1,
			"value", "CastingSpellStartOrEndEndChat_" .. V2,
			"checked",tbl["ChatChecked"],"func", "CastingSpellStartOrEnd_End_ChatChecked","arg1", self,"arg2", tbl,
			"tooltipText",str,"tooltipTitle","说明"
			);
			
			menu:AddLine("line",1);
			
			local script = tbl["script"];
			
			str = addon:FormatTooltipText("当技能施放时执行|r宏、函数、脚本。\n\n|r注意:有斜杠[/]开头的都视为宏其它为脚本或者函数\n\n|cffff0000注意:尽可能不要用宏和执行技能类的函数如|r amrun() |cffff0000这些会影响技能施放。\n\n|cffffff00内容:|r\n" .. script);
			
			menu:AddLine("text", "|cff104E8B2|r.|cff00ffff脚本/宏/函数" ,
				"hasEditBox", 1, "editBoxText", script,"editBoxFunc","CastingSpellStartOrEnd_End_Edit", "editBoxArg1", self,"editBoxArg2", tbl,
				"checked",tbl["ScriptChecked"],"func", "CastingSpellStartOrEnd_End_ScriptChecked","arg1", self,"arg2", tbl,
				"tooltipText",str,"tooltipTitle","说明"
				);
				
				
			
			
			
			
			
			
				
			
		
		elseif  V[1] == "SetSkillsInto" then
			
			local str = addon:FormatTooltipText("让上帝指令插件执行您的技能插入命令，那么请选择该项。\n\n|cffff0000注意:|r这里只能打开不能关闭，需要关闭请到主菜单【方案系统设定】下的【设定插入命令状态】里设定。");
			local checked = SuperTreatmentDBF["Config"]["aminspell"];
			menu:AddLine("text", "|cff00ffff接受插入命令" , 
			"func", "aminspell_checked","arg1", self,
			"checked",checked,
			"tooltipText",str,"tooltipTitle","接受插入命令"
			);
		
		elseif  V[1] == "ProgramSetupExcludeTargetAdd" then
			
				
				-- 菜单表格标题
				menu:AddColumnHeader("角色名", "LEFT")
				menu:AddColumnHeader("种族", "CENTER")
				menu:AddColumnHeader("小队", "CENTER")
				menu:AddColumnHeader("选中", "CENTER")
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
				
				if GetNumGroupMembers() >0 and IsInRaid() then
				
					for i=1 , 8 do
						addon:ProgramSetupExcludeTarget_Add_subgroup(tonumber(V[2]),i,menu);
					end
				
				else
				
					addon:ProgramSetupExcludeTarget_Add_subgroup(tonumber(V[2]),0,menu);
				
				end
				
			
		elseif  V[1] == "GlobalQuickSetupSetMTTo" then
			
				local k = GetNumGroupMembers()
				local MtIndex=0;
				V[2]=tonumber(V[2]);
				
				--menu:AddLine("text","MT" .. V[2] ,"isTitle",1);
				--menu:AddLine();
		--[[
				for MtIndex, name in pairs(SuperTreatmentDBF["Unit"]["MTList"]["Default"]) do
				
					
						
						MtIndex = MtIndex +1;
						
						local playerClass, englishClass = UnitClass(name);
						
					if playerClass then
						
						color = RAID_CLASS_COLORS[englishClass];
						tc = CLASS_BUTTONS[englishClass];
					
					
						menu:AddLine(
						-- 职业图标
						
						"icon", "Interface\\WorldStateFrame\\Icons-Classes",
						"tCoordLeft", tc[1],
						"tCoordRight", tc[2],
						"tCoordTop", tc[3],
						"tCoordBottom", tc[4],
						
						"text", "|cff104E8B" .. MtIndex .. ".|r" .. name, "textR", color.r, "textG", color.g, "textB", color.b,
						

										
						
						"func", "GlobalQuickSetupSetMT_checked", "arg1", self, "arg2", {V[2],name}
						);
						
					
					
					end
				
				end
				
				--]]
				
				menu:AddLine();
			
				
				-- 菜单表格标题
				menu:AddColumnHeader("角色名", "LEFT")
				menu:AddColumnHeader("种族", "CENTER")
				menu:AddColumnHeader("小队", "CENTER")
				menu:AddColumnHeader("选中", "CENTER")
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
				
				if UnitInRaid("player") and GetNumGroupMembers() >0 then
				
					for i=1 , 8 do
					
						addon:GlobalQuickSetupSetMT_Add(V[2],i,menu);
					end
				
				else
				
					addon:GlobalQuickSetupSetMT_Add(V[2],0,menu);
				
				end
				
				
				
						
	
		elseif valueA == "TargetListTargets" then
		
			local _, _, valueA1, valueB1 = string.find(valueB, "(.-)_(.+)")
			local valueA1N = tonumber(valueA1);
			local valueB1N = tonumber(valueB1);
			
			if not Spells[valueA1N]["Targets"][valueB1N]["Conditions"] then
				Spells[valueA1N]["Targets"][valueB1N]["Conditions"]={};
			end
	
			local Conditions = Spells[valueA1N]["Targets"][valueB1N]["Conditions"];
			
			--menu:AddLine("text","名称:" .. Spells[valueA1N]["Targets"][valueB1N]["name"],"isTitle",1)
			--menu:AddLine();
			
			
			local str = addon:FormatTooltipText("输入文字对本条件进行备注说明方便维护等。")	
			local Remark = Spells[valueA1N]["Targets"][valueB1N]["Remark"];
			menu:AddLine("text", "备注","hasEditBox", 1,"editBoxText",Remark, 
			"editBoxFunc", "TargetListTargets_EditRemark", "editBoxArg1", self,"editBoxArg2", {valueA1N,valueB1N},
			"tooltipText",str,"tooltipTitle","备注"
			);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			
			
			local TBL = Spells[valueA1N]["Targets"][valueB1N];
			
			local text;
			if TBL["and/or"] then
				text = "Or";
			else
				text = "And";
			end
			
			local str = addon:FormatTooltipText("点击切换 或者(Or)/并且(And) 关系,该选项决定下列选项的处理关系。")			
			menu:AddLine("text","|cffffff00使用|cffff0000"..text.."|cffffff00关系|r",
			"func", valueA .. "_and_or","arg1", self,"arg2", TBL,
			"tooltipText",str,"tooltipTitle","信息"
			);
			
			menu:AddLine("line",1,"LineHeight",8);
			local str = addon:FormatTooltipText("新建条件，请输入名称随便您怎么起名都行方便记忆。")	
			
			menu:AddLine("text", "|cff00ffff新建条件","colorCode","|cffffff00","hasEditBox", 1, "editBoxFunc",
			"TargetListAddConditions", "editBoxArg1", self,"editBoxArg2", {valueA1N,valueB1N},"tooltipText",str,"tooltipTitle","新建",
			"inftitle","第七步",
			"inftext","鼠标放到此菜单上，按提示做。",
			"infx",0,
			"infy",-12,
			"infid",7,
			--"infheight",65,
			"infchecked",SuperTreatmentAllDBF.HelpNavigation and #Conditions<=0
			);
			
			menu:AddLine("line",1,"LineHeight",8);
			
			addon["MenuLevelTargetListSelect"] = level;
			addon["MenuFuncTargetListSelect"]="TargetListSelect_checked";
			
			
			for i, data in pairs(Conditions) do
				
			
				local TC = valueA1N .. "_" .. valueB1N .. "_" .. i;
				
				
				--local str = addon:FormatTooltipText(data["Remark"].. "\n|cffff0000复制: |cffffffffCtrl + 鼠标左键\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键" .. NOTT)
				
				local v =data;
					
				if not v.Key then
					v.Key={};
				end
				
				if not v.Mark then
					v.Mark=amrandom(k);
				end
				
				if not v.Key.KeySelect then
					v.Key.KeySelect="auto";
				end
					
				local str={};
				if str then
						
						
						local t={};
						
						
						
						
						
						if data["Remark"] and data["Remark"]~="" then
							
							t["type"]="AddLine";
							t["text"]=data["Remark"];
							table.insert(str,t);
						end
						
						t={};
						t["type"]="AddLine";
						t["text"]=" ";
						table.insert(str,t);
						
						
						
						t={};
						t["type"]="AddDoubleLine";
						t["left"]="|cffffff00条件取反:";
						t["right"]="|cffffffffAlt + 鼠标左键";
						table.insert(str,t);
						
						t={};
						t["type"]="AddDoubleLine";
						t["left"]="|cffffff00删除:";
						t["right"]="|cffffffffCtrl + Alt + 鼠标左键";
						table.insert(str,t);
						
						t={};
						t["type"]="AddDoubleLine";
						t["left"]="|cffffff00属性:";
						t["right"]="|cffffffff鼠标右键";
						table.insert(str,t);
						
						local keytype;
							
						if v.Key.KeySelect=="auto" then
							keytype="选择/放弃";
						elseif v.Key.KeySelect=="no" then
							keytype="放弃";
						elseif v.Key.KeySelect=="ok" then
							keytype="选择";
						elseif v.Key.KeySelect=="run" then
							keytype="执行";
						elseif v.Key.KeySelect=="auto1" then
							keytype="选择/放弃(全)";
						elseif v.Key.KeySelect=="no1" then
							keytype="放弃(全)";
						elseif v.Key.KeySelect=="ok1" then
							keytype="选择(全)";
						end
						
						
						if v.Key and v.Key.Checked and v.Key.Value and v.Key.Value ~="" then
				
							t={};
							t["type"]="AddDoubleLine";
							t["left"]="|cffffff00快捷键:";
							t["right"]="|cffffffff" .. (v.Key.Value or "");
							table.insert(str,t);
						
							t={};
							t["type"]="AddDoubleLine";
							t["left"]="|cffffff00快捷键类型:";
							t["right"]="|cffffffff" .. (keytype or "");
							table.insert(str,t);
						
						else
							
							t={};
							t["type"]="AddDoubleLine";
							t["left"]="快捷键:";
							t["right"]=(v.Key.Value or "");
							t.rL, t.gL, t.bL = GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b;
							t.rR, t.gR, t.bR = GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b;
							table.insert(str,t);
							
							
							t={};
							t["type"]="AddDoubleLine";
							t["left"]="快捷键类型:";
							t["right"]=(keytype or "");
							t.rL, t.gL, t.bL = GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b;
							t.rR, t.gR, t.bR = GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b;
							table.insert(str,t);
						end
						
						
							t={};
							t["type"]="AddDoubleLine";
							t["left"]="|cffffff00Id:";
							t["right"]="|cffffffff" .. (v.Mark or "");
							table.insert(str,t);
					
					end
					
					
				local tbl={};
				
				if true then
					
					local Solution = Conditions;
					local k = i;
					
					tbl.CastProgram={};
					local ex = tbl.CastProgram;
					ex.copy ={}; 
						ex.copy.fun = function()
						
							SuperTreatmentInf["Copyexchange"]["CopySpellProgramCondition"]=v;
							DropDownMenu:Refresh(level);
						end; 
						ex.copy.arg1 = v;
						
						ex.Paste ={}; 
						ex.Paste.fun = function()
							local TBL = th_table_dup(SuperTreatmentInf["Copyexchange"]["CopySpellProgramCondition"]);
							--if TBL.Key.ButtonFrame and TBL.Key.ButtonFrame.SetAttribute then
							--	ClearOverrideBindings(TBL.Key.ButtonFrame);
							--end
							TBL["name"] = TBL["name"] .. "("..date("%H:%M:%S")..")";
							--TBL.Key={};
							--TBL.Key.KeySelect = "auto";
							--TBL.Mark=amrandom(k);
							
							stRefreshMark(TBL);
							stCancelKey(TBL,1);
							
							table.insert(Solution,k, TBL);
							DropDownMenu:Refresh(level);
						end; 
						
						ex.Paste.arg1 = {Solution,k};
						ex.Paste.checked=function() return SuperTreatmentInf["Copyexchange"]["CopySpellProgramCondition"];end;
						
						
					ex.Del ={}; 
						ex.Del.fun = function() 
						table.remove(Solution,k);
						DropDownMenu:Refresh(level);
						DropDownMenu:ArrowHide(self,level);
						end; 
						
						ex.Up ={}; 
						ex.Up.fun = function() 
							if k>1 then
								local NewTblA = th_table_dup(Solution[k]);
								local NewTblB = th_table_dup(Solution[k-1]);
								Solution[k-1]=NewTblA;
								Solution[k]=NewTblB;						
								DropDownMenu:Refresh(level);
							end
						end;
						
					ex.Down ={}; 
						ex.Down.fun = function() 
							local n = #(Solution);
							if k<n then
								local NewTblA = th_table_dup(Solution[k]);
								local NewTblB = th_table_dup(Solution[k+1]);
								Solution[k+1]=NewTblA;
								Solution[k]=NewTblB;
								DropDownMenu:Refresh(level);
							
							end
						end;
						
					ex.Renamed=true;
					
					ex.text =v["name"];
					ex.index =k;
					ex.tbl = Solution;
					
				
				
						
						
				end
				
			
				
				menu:AddLine(						
						"text", NOT(data,"|cff104E8B" .. i ..
						".|r " .. data["name"]),
						"checked", data["checked"],
						"hasArrow", 1, "value", "TargetListTargetsConditions_" ..TC,
						"tooltipText",str,
						"func","SpellsListConditions_checked", "arg1", self, "arg2", {valueA1N,valueB1N,i},
						"tooltipTitle","信息",
						"inftitle","第八步",
						"inftext","鼠标放到此菜单上，选择目标。",
						"infx",0,
						"infy",-12,
						"infid",8,
						--"infheight",65,
						"infchecked",SuperTreatmentAllDBF.HelpNavigation and not data["Target"],
						"infchecked",SuperTreatmentAllDBF.HelpNavigation,
						"OpenRightMenu",SuperTreatment["Menu"]["OpenRightMenu"],
						"OpenRightMenuValue",tbl
						);
						
						local Remark = addon:GetCustomizeTargetInf(data["unit"]);
						if Remark and Remark["Remarks"] then
							Remark = Remark["Remarks"];
						end
						
						local TargetLayer = data["TargetLayer"] or 0;
						local TargetLayerText="";
						
						for n=1,TargetLayer do
							TargetLayerText = TargetLayerText .. "|cffff0000-|r目标"
						end
						
						
						if data["Target"] then
							if data["TargetSubgroup"] == -2 then
							
							
							
								local Remarks = SuperTreatmentDBF["Unit"]["RaidList"][data["Target"]]["Remarks"]
							
							
								local str =addon:FormatTooltipText(Remarks);
								str = str .. "|r增减目标:\n\n"
								str = str .. "|cffff0000增加目标: |cffffffffCtrl + 鼠标左键";
								str = str .. "\n|cffff0000减小目标: |cffffffffAlt  + 鼠标左键";
							
						
								menu:AddLine("text", "|cffff0000>|cff00ff00" .. data["Target"].. TargetLayerText .. "|cffff0000<","justifyH","RIGHT",
								"func", "AddTargetLayer", "arg1", self, "arg2", data,
								"hasArrow", 1, "value", "TargetListTargetsConditionsNames_" .. TC,
								"tooltipText",str,"tooltipTitle","信息",
								"inftitle","第九步",
								"inftext","鼠标放到此菜单上，设定下级菜单。",
								"infx",0,
								"infy",-12,
								"infid",9,
								--"infheight",65,
								"infchecked",SuperTreatmentAllDBF.HelpNavigation
								);
							else
								
								local str = "|r增减目标:\n\n";
								str = str .. "|cffff0000增加目标: |cffffffffCtrl + 鼠标左键";
								str = str .. "\n|cffff0000减小目标: |cffffffffAlt  + 鼠标左键";
								menu:AddLine("text", "|cffff0000>|cff00ffff" .. data["Target"].. TargetLayerText .. "|cffff0000<","justifyH","RIGHT",
								"func", "AddTargetLayer", "arg1", self, "arg2", data,
								"hasArrow", 1, "value", "TargetListTargetsConditionsNames_" .. TC,
								"tooltipText",str,"tooltipTitle","信息",
								"inftitle","第九步",
								"inftext","鼠标放到此菜单上，设定下级菜单。",
								"infx",0,
								"infy",-12,
								"infid",9,
								--"infheight",65,
								"infchecked",SuperTreatmentAllDBF.HelpNavigation
								);
								
							end
						end
						
						
						
				if  i == #Conditions then
					--menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
				
				else
					menu:AddLine("line",1,"LineHeight",8);
				end
			end
				
				local Solution = Conditions;
				
				if #Solution==0 then
				
					local tbl={};
					tbl.CastProgramAdd={};
					local ex = tbl.CastProgramAdd;
			
					ex.Paste ={}; 
						ex.Paste.fun = function()
							local TBL = th_table_dup(SuperTreatmentInf["Copyexchange"]["CopySpellProgramCondition"]);
							TBL["name"] = TBL["name"] .. "("..date("%H:%M:%S")..")";														
							stRefreshMark(TBL);
							stCancelKey(TBL,1);
							
							table.insert(Solution,TBL);
							DropDownMenu:Refresh(level);
						end; 
						
						
						ex.Paste.checked=function() return SuperTreatmentInf["Copyexchange"]["CopySpellProgramCondition"];end;
					
					
					
					local str = addon:FormatTooltipText("注意:鼠标右键可以粘贴。");
					menu:AddLine("text","(没条件)","OpenRightMenu",SuperTreatment["Menu"]["OpenRightMenu"],
					"OpenRightMenuValue",tbl,
					"tooltipText",str,"tooltipTitle","信息"
					);
				
				end
			
			
			
			--[[
			
			local str = addon:FormatTooltipText("把其它方案粘贴到这里来，前提你已经复制了技能条件方案。");
		
			if SuperTreatmentInf["Copyexchange"]["CopySpellProgramCondition"] then
				
					
				menu:AddLine("text", "|cffffff00粘贴",
				"icon","INTERFACE\\ICONS\\INV_Letter_16",
				"func", "PasteSpellProgramCondition","arg1", self,"arg2", Conditions,"tooltipText",str,"tooltipTitle","粘贴")
				
			else
				
				menu:AddLine("text", "粘贴",
				"icon","INTERFACE\\ICONS\\INV_Letter_16",
				"disabled",1,"tooltipText",str,"tooltipTitle","粘贴")
				
			
			end
			
			
			local str = addon:FormatTooltipText("请先建立个条件方案(菜单)理论上可以建立N个，把鼠标移到刚建好的方案上会出现下级菜单请您选择目标，选择后下面会出现刚选的目标把鼠标放上去会出现下级菜单可以继续下去。\n\n方案有优先级别前面的比后面的优先鼠标移到方案上显示操作方式帮助。|r\n\n提示小白多移动鼠标到菜单上有帮助提示的，选择(菜单打钩)代表启用该选项");
				
			menu:AddLine("text", "|cff00ff00帮助","tooltipText",str,"tooltipTitle","帮助","icon","Interface\\Icons\\INV_Misc_QuestionMark");
			--]]
			
		end
	

	elseif level == 5 then -- 5级菜单内容	
	
		local V = addon:DecompositionValue(value);
		
		if  V[1] == "CastingSpellStartOrEndStartChat" or V[1] == "CastingSpellStartOrEndEndChat" then
			
			local tbl ;
			local V2 = tonumber(V[2]);
			
			if  V[1] == "CastingSpellStartOrEndStartChat" then
				tbl = Spells[V2]["CastingSpellStartOrEnd"]["Start"];
			else
				tbl = Spells[V2]["CastingSpellStartOrEnd"]["End"];
			end
			
			
			local isRadio = tbl["Chat"]["isRadio"] or ChatExplain[1]["command"];
			local text = tbl["Chat"]["text"];
			
			str = addon:FormatTooltipText("输入要发送的内容\n\n|cffffff00内容:|r\n".. text);
			
			menu:AddLine("text", "|cff00ffff发送内容" ,
				"hasEditBox", 1, "editBoxText", text,"editBoxFunc","CastingSpellStartOrEnd_Start_Chat_Edit", "editBoxArg1", self,"editBoxArg2", tbl,
				"tooltipText",str,"tooltipTitle","说明"
				);
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			local Chat = tbl["Chat"]["channel"];
			
			for k, data in pairs(ChatExplain) do
				
				if data["command"] ~= "channel" then			
					
					str = addon:FormatTooltipText("执行【" .. data["inf"] .. "】聊天宏");
					menu:AddLine("text", data["inf"] ,"isRadio",1,
					"checked",isRadio == data["command"],"func", "CastingSpellStartOrEnd_Start_Chat_isRadio","arg1", self,"arg2", {tbl,data["command"]},
					"tooltipText",str,"tooltipTitle","说明"
					);
				
				else
				
					str = addon:FormatTooltipText("发送信息到(" .. Chat .. ")频道");
					menu:AddLine("text", "|cffffffff"..data["inf"] .. "(|cffff0000" .. Chat  .."|cffffffff)" , 
					"isRadio",1,"checked",isRadio == data["command"] ,"func", "CastingSpellStartOrEnd_Start_Chat_isRadio","arg1", self,"arg2", {tbl,data["command"]},
					"hasSlider", 1, "sliderValue",Chat, "sliderMin", 1, "sliderMax", 20, "sliderStep", 1, "sliderFunc",
					"CastingSpellStartOrEnd_Start_Chat_channelvalue" , "sliderArg1", self,"sliderArg2", tbl,"sliderDecimals",0,
					"tooltipText",str,"tooltipTitle","说明"
					);
				
				end
			
				
			end
			
		
		elseif  V[1] == "CastingSpellStartOrEndStartSpell" then
			
			local tbl,VsliderMin ;
			local V2 = tonumber(V[2]);
			tbl = Spells[V2]["CastingSpellStartOrEnd"]["Start"];
			tbl["DelayValue"] = tbl["DelayValue"] or 0;
			
			if tbl["SpellChecked"] and tbl["DelayValue"] == -1  then
				VsliderMin = -1;
			else
				VsliderMin = 0;
				if tbl["DelayValue"] == -1 then
					tbl["DelayValue"]=0;
				end
			end
			
			menu:AddLine("text", "|cffffffff延时(|cffff0000" .. tbl["DelayValue"]  .."|cffffffff)秒施放" ,
			"hasSlider", 1, "sliderValue",tbl["DelayValue"], "sliderMin", VsliderMin, "sliderMax", 999, "sliderStep", 0.1, "sliderFunc",
			"CastingSpellStartOrEnd_Start_DelayValue" , "sliderArg1", self,"sliderArg2", tbl,"sliderDecimals",1
			
			);
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			menu:AddLine("text","技能列表:"  ,"isTitle",1);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			local Spells =tbl["spell"];
			
			for i, data in pairs(Spells) do
					
					local spellId = data["spellId"];
					local spellType = data["Type"];
					local checked;
					
					
					
					if spellType=="item" then
						
						--[[						
						local rank =Spells[i]["Rank"] or "" ;
						local itemLink = Spells[i]["itemLink"];
						
						if not itemLink then
							_,itemLink=GetItemInfo(spellId);
							Spells[i]["itemLink"] = itemLink;
						end
						local Texture = Spells[i]["Texture"];
						--]]
						
						local _, itemLink, _, _, _, _, _, _, _, Texture=GetItemInfo(spellId);
						local rank =Spells[i]["Rank"] or "" ;
						
						
						
						local str=itemLink .. "(" .. rank .. ")";
						str = str .. "\n\n|cffff0000上移: |cffffffffCtrl + 鼠标左键";
						str = str .. "\n|cffff0000下移: |cffffffffAlt  + 鼠标左键";
						str = str .. "\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键";
					
						menu:AddLine(						
						"text", "|cff104E8B" .. i ..
						".|r " .. itemLink,
						
						"icon",Texture,
						"func","CastingSpellStartOrEndStartSpell_EditSpell", "arg1", self, "arg2", {Spells,i},
						"tooltipText",str,
						
						"tooltipTitle","信息"
						)
						
					elseif spellType=="spell" then
						
						--[[
						local spellLink = Spells[i]["itemLink"];
						
						if not spellLink then
							spellLink,_=GetSpellLink(spellId);
							Spells[i]["itemLink"] = spellLink;
						end
						
						
						
						local Texture = Spells[i]["Texture"];
						local rank =Spells[i]["Rank"];
						if not rank then rank="";end
						
						--]]
						
						local _,rank,Texture = GetSpellInfo(spellId);
						local spellLink,_=GetSpellLink(spellId);
						
						
						local str=spellLink .. "(" .. rank .. ")";
						str = str .. "\n\n|cffff0000上移: |cffffffffCtrl + 鼠标左键";
						str = str .. "\n|cffff0000下移: |cffffffffAlt  + 鼠标左键";
						str = str .. "\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键";
					
						
						menu:AddLine(						
						"text", "|cff104E8B" .. i ..
						".|r " .. spellLink,
						
						"icon",Texture,
						"func","CastingSpellStartOrEndStartSpell_EditSpell", "arg1", self, "arg2", {Spells,i},
						"tooltipText",str,
						
						"tooltipTitle","信息"
						)
						
						
					elseif spellType=="macro" or spellType=="script" then
					
						
						
						local MacroName = Spells[i]["MacroName"];
						local Texture = "";
						
						if Spells[i]["Texture"] then
							Texture =Spells[i]["Texture"];
						end
						
						local itemLink="";
						if Spells[i]["itemLink"] and Spells[i]["itemLink"] ~="" then
							itemLink =Spells[i]["itemLink"];
						else
							itemLink = MacroName;
						end
						
						local temp = ST.MacroFinishing(Spells[i]["Macro"],Spells[i]["unit"])
						
						if not rank then rank="";end
						local str = temp .. "\n"..Spells[i]["Remarks"] ;
						str = str .. "\n\n|cffff0000上移: |cffffffffCtrl + 鼠标左键";
						str = str .. "\n|cffff0000下移: |cffffffffAlt  + 鼠标左键";
						str = str .. "\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键";
					
						
						menu:AddLine(						
						"text", "|cff104E8B" .. i ..
						".|r " .. itemLink,
						
						"icon",Texture,
						
						"tooltipText",str,
						"func","CastingSpellStartOrEndStartSpell_EditSpell", "arg1", self, "arg2", {Spells,i},
						"tooltipTitle",MacroName
						)	
				

									
					end
					
					menu:AddLine("line",1);
					
				
					
				
				end
				
			
			
			local str = addon:FormatTooltipText("可以拖动的技能请往这里放。");
			
			menu:AddLine("text","|cffffff00拖动技能|cffff0000点这|cffffff00添加","func","CastingSpellStartOrEndStartSpell_AddSpell", "arg1", self, "arg2", tbl,"tooltipText",str,"tooltipTitle","信息")
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			local str = addon:FormatTooltipText("添加打断技能宏:|r\n\n/stopcasting");
			menu:AddLine("text","|cffffff00添加打断技能宏","func","CastingSpellStartOrEndStartSpell_AddMacro", "arg1", self, "arg2", Spells,"tooltipText",str,"tooltipTitle","信息")
				
		end
		
	end
	
end

-- 2级菜单内容


function addon:Menu_2_1(level, value, menu, MenuEx,GlobalLevel)
	
	local VT = addon:DecompositionValue(value);
	
	
	
	if level == 4 and VT[1] == "CustomizeTargetListGetTarget" then
		addon.CustomizeValueSet = "TargetList";
	end
	
	if level == 5 and VT[1] == "CustomizeTargetListGetTarget" then
		addon.CustomizeValueSet = false;
	end
	
	if level == 4 and VT[1] == "CustomizeTargetList" then
		addon.CustomizeValueSet = false;
	end
	
	if level == 6 and VT[1] == "CustomizeTargetList" then
		addon.CustomizeValueSet = "TargetListSelectCustomize";
	end
	
	
	
	if addon.CustomizeValueSet and addon.CustomizeValueSet == "TargetList" and amfind(VT[1],"CustomizeTargetListGetTarget",-1) then
		level =  level +1;
		
		
	elseif addon.CustomizeValueSet and addon.CustomizeValueSet == "TargetListSelectCustomize" and amfind(VT[1],"CustomizeTargetList",-1) then
		level =  level -2;
		
	end
	
	
	if level == 2 then -- 2级菜单内容
		
				
		
		if value == "DefaultList" then
			
			
			--[[
			menu:AddLine("text", "|cffffff00创建自定义目标", "hasArrow", 1, "value", "Customize Target List","notCheckable",1);
			--]]
			
			menu:AddLine("text", "|cffffff00创建自定义目标", "hasArrow", 1, "value", "Customize Target List","notCheckable",1,
			"OpenMenu",SuperTreatment["Menu"]["CustomizeTarget"],
			"OpenMenuValue",{"Edit"}
			);
			
			menu:AddLine("line",1);
			
			menu:AddLine("text", "|cffffff00创建自定义宏/脚本", "hasArrow", 1, "value", "Customize Macro List","notCheckable",1);
			
			menu:AddLine("line",1);
			
			CollectionInf["Buff_Spell"]["Ex"]=SuperTreatmentDBF["CollectionInf"];
			
			menu:AddLine("text", "|cffffff00收集技能、Buff信息|r", "hasArrow", 1, "value", "",
			"OpenMenu",SuperTreatment["Menu"]["UnitBuffListMenu"],
			"OpenMenuValue",{CollectionInf["Buff_Spell"]},
			"notCheckable",1
			);
			
			menu:AddLine("line",1);
			menu:AddLine("text", "|cffffff00设定插入命令状态", "hasArrow", 1, "value", "CustomizeSetInRun","notCheckable",1);
			
			menu:AddLine("line",1);
			
			menu:AddLine("text", "|cffffff00创建信息判断", "hasArrow", 1, "value", "CreatingInformation","notCheckable",1);
			
			
			
		end

	elseif level == 3 then -- 3级菜单内容	
		
		if value == "CustomizeSetInRun" then
			
			if SuperTreatmentDBF["Config"]["aminspellCancel_checked"] == nil then
			SuperTreatmentDBF["Config"]["aminspellCancel_checked"]=true;
			end
			
			local checked = SuperTreatmentDBF["Config"]["aminspell"];
			
			local str = addon:FormatTooltipText("接受其它插件、脚本、宏发出的技能插入请求，注意技能插入只能开一个多了会照成技能施放混乱。");
			
				menu:AddLine("text", "接受插入命令" ,"isRadio",1,"checked",checked ,"func", "aminspell_checked","arg1", self,"tooltipText",str,"tooltipTitle","接受技能插入")
			
			local str = addon:FormatTooltipText("发送技能插入命令到其它能接受命令的插件、脚本。");
			local checked = SuperTreatmentDBF["Config"]["aminspellGo_checked"];
			menu:AddLine("text", "发送插入命令" ,"isRadio",1,"checked",checked ,"func", "aminspellGo_checked","arg1", self,"tooltipText",str,"tooltipTitle","发送技能插入命令")
			
			local checked = SuperTreatmentDBF["Config"]["aminspellCancel_checked"];
			menu:AddLine("text", "取消插入命令" ,"isRadio",1,"checked",checked ,"func", "aminspellCancel_checked","arg1", self)
					
			
		
		elseif value == "Customize Macro List" then
			
			
			local str = "|cff00ff00支持脚本助手方案的导入成为上帝指令的脚本。\n\n|r在输入框粘贴方案代码后可能会卡，视代码大小而定。\n\n然后记得按确认键(Enter)。\n\n新的脚本名称以当前时间结尾"
			menu:AddLine("text", "|cff00ffff导入脚本助手","hasEditBox", 1, "editBoxText", self.text, "editBoxFunc", "AddScriptAssist", "editBoxArg1", self,"tooltipText",str,"tooltipTitle","导入")
			menu:AddLine();
			
			local str = "|cff00ff00请确认新名称不在列表中。"
			menu:AddLine("text", "|cff00ffff新建脚本","hasEditBox", 1, "editBoxText", self.text, "editBoxFunc", "AddCustomizeMacro", "editBoxArg1", self,"tooltipText",str,"tooltipTitle","新建")
			menu:AddLine();
			
			local tbl = SuperTreatmentDBF["Macro"];
			for k,v in pairs(tbl) do
					
					local temp = ST.MacroFinishing(v["Macro"]);
				
					local name = v["name"];
					local str="";
					if v.type == "macro" then
					
						str = addon:FormatTooltipText("|cffff0000内容: \n|r"..temp .. "\n\n|cffff0000备注: |r" .. v["Remarks"]);
					else
						str = addon:FormatTooltipText("|cffff0000备注: |r" .. v["Remarks"]);
					end
					
					if addon:IsCustomizeMacro(v["id"]) then
					
						str = str .. "\n\n|cffff0000使用中不能删除"
						menu:AddLine("text", "|cff104E8B" .. k .. ". |cffFFA54F" .. name,
						"hasArrow", 1, "value", "CustomizeMacroListInf_" .. k,
						"tooltipText",str,"tooltipTitle","信息","icon",v["Texture"] or "");
					else
					
						str = str .. "\n\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键"
						menu:AddLine("text", "|cff104E8B" .. k .. ". |cffffffff" .. name,
						"hasArrow", 1, "value", "CustomizeMacroListInf_" .. k,
						"func", "CustomizeMacroListInf_checked", "arg1", self, "arg2", k,
						"tooltipText",str,"tooltipTitle","信息","icon",v["Texture"] or "");
						
					
					end
				
			end
			
			menu:AddLine();
			--local str = addon:FormatTooltipText("输入只支持单行所以宏2行以上就用到换行符 |cffff0000\\n|cff00ff00 多行宏用这连接成单行的。|r\n\n|cffff0000如:\n|r/cast 盾牌猛击|cffff0000\\n|r/cast 英勇打击\n\n|cffff0000如:|r\n/cast [target=|cffff0000*unit|r]盾牌猛击\n\n这里|cffff0000*unit|r添加函数后被替换为设定好的|cffff0000施放目标|r，提示里有真实的宏参考。\n\n同理|cffff0000*unit|r可以应用在脚本里。\n\n设定施放目标为|cffff0000当前目标|r那么上面的宏就会变为:\n\n/cast [target=|cffff0000Target|r]盾牌猛击\n");
			
			local str = addon:FormatTooltipText("变量关键字:|r*unit \n\n|cffff0000如:|r\n/cast [target=|cffff0000*unit|r]盾牌猛击\n\n这里|cffff0000*unit|r添加函数后被替换为设定好的|cffff0000施放目标|r，提示里有真实的宏参考。\n\n同理|cffff0000*unit|r可以应用在脚本里。\n\n设定施放目标为|cffff0000当前目标|r那么上面的宏就会变为:\n\n/cast [target=|cffff0000Target|r]盾牌猛击\n");
				
			menu:AddLine("text", "|cff00ff00帮助","tooltipText",str,"tooltipTitle","帮助","icon","Interface\\Icons\\INV_Misc_QuestionMark");
			

			
		elseif value == "Customize Target List" then
			
			addon["MenuLevel"]=0;
			addon["MenuLevel_name"]="Customize Target List";
			
			local str = "|cff00ff00请确认新名称不在列表中。"
			menu:AddLine("text", "新建目标","hasEditBox", 1, "editBoxText", self.text, "editBoxFunc", "AddCustomizeTarget", "editBoxArg1", self,"tooltipText",str,"icon",ExpandArrow,"tooltipTitle","新建")
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);

			local i = 1;
			
			
			for k,v in sortedpairs(RDB, SortNameAsc) do
			
				if v["subgroup"] == -2 then
					local name = v["name"];
					
					
					local str = addon:FormatTooltipText(v["Remarks"]);
					
					menu:AddLine("text", "|cff104E8B" .. i .. ". |cffffffff" .. name,"hasArrow", 1, "value", "CustomizeTargetList_" .. k,"tooltipText",str,"tooltipTitle","备注");
					i=i+1;
					menu:AddLine("line",1);
				end
			end
				
		
		elseif value == "DefaultListUnitFunc" then	
			
			for k, data in pairs(UnitFunc) do
				
				local str = addon:FormatTooltipText(data["inf"] .. "\n\n|cffffff00" .. data["Remarks"]);
				menu:AddLine("text","|cff00ff00" .. k .. ". |cffffffff" .. data["inf"],
				"tooltipText",str,"tooltipTitle",data["func"],"notCheckable",1
				);
			end
			
			
		
		end
		
		
		
		
	elseif level == 4 then -- 4级菜单内容
		
		local _, _, valueA, valueB = string.find(value, "(.-)_(.+)")
			
		if valueA == "TargetListPropertiesSet" then
			
			local _, _, valueA1, valueB1 = string.find(valueB, "(.-)_(.+)")
			local valueN1 = tonumber(valueA1);
			local valueN2 = tonumber(valueB1);
			
			local tbl = Spells[valueN2];
			local checked = tbl["PropertiesSetChecked"];
			
			
			local disabled = tbl["lock"] or (tbl["Type"] and tbl["Type"] =="macro");		
			
			local strinf = "\n|cffff0000内置变量:|r *unit (插件菜单里设定的目标)\n\n目前是: |cff00ffff" .. tbl["Target"]
			
			local str = addon:FormatTooltipText("该函数能运行大部分给官方禁止的宏和函数，但有长度限制不能超200个字节。|r\n注意:没有返回值。\n\n代码里不能有 amrun 函数。\n\n");
			str = str .. strinf;
			menu:AddLine("text", "用amrun函数运行脚本、函数、宏" ,"isRadio",1,"checked",checked ==1,
			"disabled",tbl["lock"] or addon:IsRunStrfind(tbl),
			"func", "TargetListPropertiesSet_checked","arg1", self,"arg2",{tbl,1},
			"tooltipText",str,"tooltipTitle","用amrun函数运行");
			
			local str = addon:FormatTooltipText('|r\n注意:没有返回值。\n\n里面可以包含各种函数包括amrun,用amrun来施放技能或者运行被官方禁止的宏和函数。\n\n');
			str = str .. strinf .."\n\n|cffff0000上帝指令里运行脚本将被极高的优化内存及速度。";
			menu:AddLine("text", "运行脚本" ,"isRadio",1,"checked",checked ==2,
			"disabled",disabled,"func", "TargetListPropertiesSet_checked","arg1", self,"arg2",{tbl,2},
			"tooltipText",str,"tooltipTitle","运行脚本");
			
			local str = addon:FormatTooltipText('|r\n注意:脚本必须用 |cff00ff00return |r返回布尔值(|cff00ff00true|r/|cff00ff00false|r)。\n\n里面可以包含各种函数包括amrun,用amrun来施放技能或者运行被官方禁止的宏和函数。\n\n|cffff0000标准格式:\n|r脚本里所有|cff00ff00 return |r后面都带返回值。\n\n如:\n\nif amisr("治疗术") then\n\n    amrun("治疗术");\n\n    |cff00ff00return return;\n\n|r    else\n\n    |cff00ff00return false;|r\n\nend\n\n');
			str = str .. strinf .."\n\n|cffff0000上帝指令里运行脚本将被极高的优化内存及速度。";
			menu:AddLine("text", "运行脚本(标准格式)" ,"isRadio",1,"checked",checked ==3,
			"disabled",disabled,"func", "TargetListPropertiesSet_checked","arg1", self,"arg2",{tbl,3},
			"tooltipText",str,"tooltipTitle","运行脚本(标准格式)");
			
			local str = addon:FormatTooltipText('|r\n注意:脚本里所有的 |cff00ff00return |r必须没返回值。\n\n里面可以包含各种函数包括amrun,用amrun来施放技能或者运行被官方禁止的宏和函数。\n\n|cffff0000非标准格式:\n|r脚本里所有|cff00ff00 return |r后面没带返回值(旧的脚本大多数都这样)。\n\n如:\n\nif amisr("治疗术") then\n\n    amrun("治疗术");\n\n    |cff00ff00return;\n\n|rend\n\n');
			str = str .. strinf .."\n\n|cffff0000上帝指令里运行脚本将被极高的优化内存及速度。";
			menu:AddLine("text", "运行脚本(|cffff0000非|r标准格式)" ,"isRadio",1,"checked",checked ==4,
			"disabled",disabled,"func", "TargetListPropertiesSet_checked","arg1", self,"arg2",{tbl,4},
			"tooltipText",str,"tooltipTitle","运行脚本(非标准格式)");
			
			
			--[[
			
			local str = addon:FormatTooltipText("脚本必须用return返回布尔值。|r\n注意:可以写任意的代码包括执行技能施放函数。");
			str = str .. strinf;
			menu:AddLine("text", "判断脚本的返回值" ,"isRadio",1,"checked",checked==3 ,
			"disabled",disabled,"func", "TargetListPropertiesSet_checked","arg1", self,"arg2",{tbl,3},
			"tooltipText",str,"tooltipTitle","判断脚本的返回值");
			--]]

			menu:AddLine();
			
			local checked = tbl["PropertiesSet_Continue_Checked"];
			local str = addon:FormatTooltipText("当条件判断为真时默认不会再执行后面的判断，当你选择该项时忽略结果继续后面的。|r\n如:你可以用该项设定一些变量。");
			
			menu:AddLine("text", "继续运行后面的..." ,"checked",checked ,
			"disabled",tbl["lock"],"func", "TargetListPropertiesSet_Continue_checked","arg1", self,"arg2",tbl,
			"tooltipText",str,"tooltipTitle","继续运行");
			
			
			
		elseif valueA == "CustomizeMacroListInf" then
		
			local valueN = tonumber(valueB);
			local tbl = SuperTreatmentDBF["Macro"][valueN];
			
			if not tbl["type"] or tbl["type"] =="" then
			
				tbl["type"] = "script";
			
			end
			
			local disabled=false;
			
			if addon:IsCustomizeMacro(tbl["id"]) then
				disabled =true;
			end
			
			menu:AddLine("text", "宏","isRadio",1,"checked",tbl["type"] =="macro",
			"func", "ScriptEdit_checked","arg1", self,"arg2",{tbl,"macro"},"disabled",disabled);
			
			menu:AddLine("text", "脚本","isRadio",1,"checked",tbl["type"] =="script",
			"func", "ScriptEdit_checked","arg1", self,"arg2",{tbl,"script"}	,"disabled",disabled);
			
			menu:AddLine();
			
			menu:AddLine("text", "编辑",
			"func", "ScriptEdit","arg1", self,"arg2",{tbl,tbl["type"]}	);
			
			
			menu:AddLine("text", "备注","hasEditBox", 1, "editBoxText",
			tbl["Remarks"], "editBoxFunc", "CustomizeMacroListInf_edit_Remarks", "editBoxArg1", self,"editBoxArg2",tbl);
			
			
			
			
			menu:AddLine("text", "改名","disabled",disabled,"hasEditBox", 1, "editBoxText",
			tbl["name"], "editBoxFunc", "CustomizeMacroListInf_renamed", "editBoxArg1", self,"editBoxArg2",tbl);
			
			menu:AddLine("text", "图标", "func", "CustomizeMacroListInf_icon", "arg1", self, "arg2", tbl,
			"hasEditBox", 1, "editBoxText",tbl["Texture"]
			);
				
			
		elseif valueA == "CustomizeTargetList" then
			
			if RDB[valueB] then
				menu:AddLine("text",RDB[valueB]["name"],"isTitle",1)
				menu:AddLine()
				
				if not addon:IsCustomizeTarget(valueB) then
				
					menu:AddLine("text", "|cffff0000删除|r", "func", "CustomizeTargetList_Del", "arg1", self, "arg2", valueB, "hasConfirm", 1, "confirmText", "是否删除 " .. RDB[valueB]["name"] .." ？")
				
				else
				
					menu:AddLine("text", "正在使用无法删除","disabled",1)
				end
				
			
				
				menu:AddLine("text", "|cffffffff备注|r","hasEditBox", 1, "editBoxText", RDB[valueB]["Remarks"], "editBoxFunc", "CustomizeTargetListRemarksEditName", "editBoxArg1", self,"editBoxArg2", valueB)
				menu:AddLine()
				
				menu:AddLine()
				
				local temp={};
				
				menu:AddLine("text", "|cffffff00获得目标" ,"hasArrow", 1, "value", "CustomizeTargetListGetTarget_" .. valueB,"icon","Interface\\ChatFrame\\ChatFrameExpandArrow")
		
			end	
				
		end
	

	elseif level == 5 then -- 5级菜单内容

		local _, _, valueA, valueB = string.find(value, "(.-)_(.+)")
		
		
		if valueA == "CustomizeTargetListGetTarget" then
			
			
			if RDB[valueB]["AmminimumFastchecked"]==nil then
				
				RDB[valueB]["AmminimumFastchecked"]=true;
			end
			
				local str = addon:FormatTooltipText("如：player,target,focus,小可爱");
				
				menu:AddLine("text", "|cffffffff目标名称|r","isRadio", 1,"hasEditBox", 1, "editBoxText", RDB[valueB]["unit"], "editBoxFunc", "CustomizeTargetList_GetTarget_EditUnit", "editBoxArg1", self,"editBoxArg2", valueB,"tooltipText",str,"checked",RDB[valueB]["unitchecked"],"func", "CustomizeTargetList_GetTarget_EditUnit_checked","arg1", self,"arg2", valueB,"tooltipTitle","目标名称")
				
				str = addon:FormatTooltipText("把函数返回值（字符串）设为目标");
				menu:AddLine("text", "|cffffffff从函数获得目标|r","isRadio", 1,"hasEditBox", 1, "editBoxText", RDB[valueB]["function"], "editBoxFunc", "CustomizeTargetList_GetTarget_EditFunction", "editBoxArg1", self,"editBoxArg2", valueB,"tooltipText",str,"checked",RDB[valueB]["functionchecked"],"func", "CustomizeTargetList_GetTarget_EditFunction_checked","arg1", self,"arg2", valueB,"tooltipTitle","目标名称")
				
				menu:AddLine("text", "|cffffffff从模板获得目标" ,"isRadio", 1,"hasArrow", 1, "value", "CustomizeTargetListGetTargetAmminimumFast_" .. valueB,"checked",RDB[valueB]["AmminimumFastchecked"],"func", "CustomizeTargetListGetTargetAmminimumFast_checked","arg1", self,"arg2", valueB)
				
			
			
		end
	
	elseif level == 6 then -- 6级菜单内容
		
		local _, _, valueA, valueB = string.find(value, "(.-)_(.+)")
		
		if valueA == "CustomizeTargetListGetTargetAmminimumFast" then
			
			if not RDB[valueB]["AmminimumFast"] then
				RDB[valueB]["AmminimumFast"]={};
				
			end
			
			
			
			menu:AddLine("text", "|cffffff00目标范围" ,"hasArrow", 1, "value", "CustomizeTargetListGetTargetAmminimumFastSetGroup_" .. valueB,"icon","Interface\\ChatFrame\\ChatFrameExpandArrow")
			
			local tbl =RDB[valueB]["AmminimumFast"];
			local group = tbl["group"];
			local groupname = stGetTargetContrast(group) or "";
			
			local TargetLayer = tbl["TargetLayer"] or 0;
			local TargetLayerText="";
			
			for n=1,TargetLayer do
				TargetLayerText = TargetLayerText .. "|cffff0000-|r目标"
			end
			
								
			local str = "|r增减目标:\n\n"
			str = str .. "|cffff0000增加目标: |cffffffffCtrl + 鼠标左键";
			str = str .. "\n|cffff0000减小目标: |cffffffffAlt  + 鼠标左键";
		
	
			menu:AddLine("text", "|cffff0000>|cff00ff00" .. groupname.. TargetLayerText .. "|cffff0000<","justifyH","RIGHT",
			"func", "AmminimumFastAddTargetLayer", "arg1", self, "arg2", tbl,
			"tooltipText",str,"tooltipTitle","信息");
				
			
			
			
			menu:AddLine();
			menu:AddLine("text", "|cffffff00设定Buff条件" ,"hasArrow", 1, "value", "CustomizeTargetListGetTargetAmminimumFastSetBuff_" .. valueB,"checked",RDB[valueB]["AmminimumFast"]["buffchecked"],"func", "CustomizeTargetListGetTargetAmminimumFastSetBuff_checked","arg1", self,"arg2", valueB)
			
			menu:AddLine("text", "|cffffff00排除的Buff" ,"hasArrow", 1, "value", "CustomizeTargetListGetTargetAmminimumFastSetNoBuff_" .. valueB,"checked",RDB[valueB]["AmminimumFast"]["Nobuffchecked"],"func", "CustomizeTargetListGetTargetAmminimumFastSetNoBuff_checked","arg1", self,"arg2", valueB)
			
			
			menu:AddLine("text", "|cffffff00读条技能" ,"hasArrow", 1, "value", "CustomizeTargetListGetTargetAmminimumFastSetSpell_" .. valueB,"checked",RDB[valueB]["AmminimumFast"]["spellchecked"],"func", "CustomizeTargetListGetTargetAmminimumFastSetSpell_checked","arg1", self,"arg2", valueB)
			
			menu:AddLine("text", "|cffffff00排除的职业" ,"hasArrow", 1, "value", "CustomizeTargetListGetTargetAmminimumFastClass_" .. valueB,"checked",RDB[valueB]["AmminimumFast"]["Classchecked"],"func", "CustomizeTargetListGetTargetAmminimumFastClass_checked","arg1", self,"arg2", valueB)
			
			menu:AddLine("text", "|cffffff00获得最小的" ,"hasArrow", 1, "value", "CustomizeTargetListGetTargetAmminimumFastMinimum_" .. valueB,"checked",RDB[valueB]["AmminimumFast"]["Minimumchecked"],"func", "CustomizeTargetListGetTargetAmminimumFastMinimum_checked","arg1", self,"arg2", valueB)
			
			menu:AddLine("text", "|cffffff00获得最大的" ,"hasArrow", 1, "value", "CustomizeTargetListGetTargetAmminimumFastMaximum_" .. valueB,"checked",RDB[valueB]["AmminimumFast"]["Maximumchecked"],"func", "CustomizeTargetListGetTargetAmminimumFastMaximum_checked","arg1", self,"arg2", valueB)
			
			menu:AddLine("text", "|cffffff00获得符合条件数量" ,"hasArrow", 1, "value", 
			"CustomizeTargetListGetTargetAmminimumFastCount_" .. valueB,
			"checked",RDB[valueB]["AmminimumFast"]["Countchecked"],"func", "CustomizeTargetListGetTargetAmminimumFastCount_checked","arg1", self,"arg2", RDB[valueB]["AmminimumFast"])
			
		
			
			str = addon:FormatTooltipText("从代码返回表达式结果作为条件。\n内部变量 unit 是目标的ID。");
				menu:AddLine("text", "|cffffff00从代码获得|r","hasEditBox", 1, "editBoxText", RDB[valueB]["AmminimumFast"]["Code"], "editBoxFunc", "CustomizeTargetListGetTargetAmminimumFastCode", "editBoxArg1", self,"editBoxArg2", valueB,"tooltipText",str,"checked",RDB[valueB]["AmminimumFast"]["CodeChecked"],"func", "CustomizeTargetListGetTargetAmminimumFastCode_checked","arg1", self,"arg2", valueB,"tooltipTitle","从代码获得")
						
			
			menu:AddLine();
			
			local TBL = RDB[valueB]["AmminimumFast"];
			if not TBL["ApiDbf"] then
				TBL["ApiDbf"]={};
			end
			SuperTreatment["type"]="NoRun"
			addon:Menu_SuperTreatmentApiList(level, value, menu,TBL);
		
		end
		
	elseif level == 7   then -- 7级菜单内容
		
		
		local _, _, valueA, valueB = string.find(value, "(.-)_(.+)")
		
		if valueA == "CustomizeTargetListGetTargetAmminimumFastSetGroup" then
			
			menu:AddLine("text", "目标范围","isTitle",1);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
			
			local AMF = RDB[valueB]["AmminimumFast"];
			if not AMF["Distancevalue"] then
				AMF["Distancevalue"]=30;
			end
			local group = AMF["group"];
			
			if not group then
				group ="party";
			end
			local disabled =  group == "party" or group == "partypet" or 
			group == "raid" or group == "raidpet" or group == "arena" or 
			group == "partyraid" or group == "partyraidpet" or group == "FHenemies";
			
			if not disabled then
				text = "启用多任务处理";
			else
				text = "|cffffff00启用多任务处理";
			end
			
			local str = addon:FormatTooltipText("多任务处理");
			menu:AddLine("text", text, "checked",AMF["MultitaskingChecked"] ,"func",
			"CustomizeTargetListGetTargetAmminimumFastSetGroup_MultitaskingChecked","arg1", self,"arg2", AMF,
			"tooltipText",str,"hasArrow", 1, "value", "CustomizeTargetListGetTargetAmminimumFastSetGroupMultitasking_" .. valueB,
			"tooltipTitle","多任务处理","disabled",not disabled);
			
			
			
			
			
			local text = "|cffffff00排除死亡、幽灵、不在线的";
			local str = addon:FormatTooltipText("排除死亡、幽灵、不在线的。");
			menu:AddLine("text", text, "checked",AMF["GhostChecked"] ,"func", "CustomizeTargetListGetTargetAmminimumFastSetGroup_Ghostchecked","arg1", self,"arg2", valueB,"tooltipText",str,"tooltipTitle","说明")
			
			
			local text ;
			
			
			if not disabled then
				text = "排除小队/目标";
			else
				text = "|cffffff00排除小队/目标";
			end
			
			
			local str = addon:FormatTooltipText("排除小队/目标");
			menu:AddLine("text", text, "checked",AMF["ExcludedTargetChecked"] ,"func",
			"CustomizeTargetListGetTargetAmminimumFastSetGroup_ExcludedTargetChecked","arg1", self,"arg2", valueB,
			"tooltipText",str,"hasArrow", 1, "value", "CustomizeTargetListGetTargetAmminimumFastSetGroupExcludedTarget_" .. valueB,
			"icon",ExpandArrow,"tooltipTitle","说明","disabled",not disabled);
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
			
			
			local text = "|cffffffff距离由方案里的技能来决定";
			local str = addon:FormatTooltipText("注意该选项是通过判断技能是否可以对目标施放来判断的。");
			menu:AddLine("text", text,"isRadio", 1, "checked",AMF["SpellDistanceChecked"] ,"func", "CustomizeTargetListGetTargetAmminimumFastSetGroup_SpellDistancechecked","arg1", self,"arg2", valueB,"tooltipText",str,"tooltipTitle","说明")
			
			
			local text = "|cffffffff距离(|cffff0000<=" .. AMF["Distancevalue"]  .."|cffffffff)的目标";
			local str = addon:FormatTooltipText("过滤目标和你之间的距离");
			menu:AddLine("text", text,"isRadio", 1, "checked",AMF["DistanceChecked"] ,"func", "CustomizeTargetListGetTargetAmminimumFastSetGroup_Distancechecked","arg1", self,"arg2", valueB,"hasSlider", 1,"sliderDecimals",0, "sliderValue", AMF["Distancevalue"], "sliderMin", 5, "sliderMax", 50, "sliderStep", 1, "sliderFunc", "CustomizeTargetListGetTargetAmminimumFastSetGroup_Distancevalue", "sliderArg1", self,"sliderArg2", valueB,"tooltipText",str,"tooltipTitle","说明")
			
			
			local text = "|cffffffff不判断距离";
			local str = addon:FormatTooltipText("选择此项要么不需要判断，要么和距离相关的函数里获得该效果。");
			menu:AddLine("text", text,"isRadio", 1, "checked",AMF["NoDistanceChecked"] ,"func", "CustomizeTargetListGetTargetAmminimumFastSetGroup_NoDistancechecked","arg1", self,"arg2", valueB,
			"tooltipText",str,"tooltipTitle","说明");
			
			
			--menu:AddLine("text","","disabled",1);
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
			
			
			
			local Colors = "|cffffffff";
			local func = "CustomizeTargetListGetTargetAmminimumFastSetGroup_checked";
			
			menu:AddLine("text", Colors .. "所有MT","isRadio", 1,"checked",group=="maintank","func", func,"arg1", self,"arg2", {valueB,"maintank"})
			menu:AddLine("text", Colors .. "小队","isRadio", 1,"checked",group=="party","func", func,"arg1", self,"arg2", {valueB,"party"})
			menu:AddLine("text", Colors .."小队宠物","isRadio", 1,"checked",group=="partypet","func", func,"arg1", self,"arg2", {valueB,"partypet"})
			menu:AddLine("text", Colors .."团队","isRadio", 1,"checked",group=="raid","func", func,"arg1", self,"arg2", {valueB,"raid"})
			menu:AddLine("text", Colors .."团队宠物","isRadio", 1,"checked",group=="raidpet","func", func,"arg1", self,"arg2", {valueB,"raidpet"})
			
			menu:AddLine("text", Colors .. "小队/团队","isRadio", 1,"checked",group=="partyraid","func", func,"arg1", self,"arg2", {valueB,"partyraid"})
			menu:AddLine("text", Colors .. "小队/团队宠物","isRadio", 1,"checked",group=="partyraidpet","func", func,"arg1", self,"arg2", {valueB,"partyraidpet"})
			
			
			menu:AddLine("text", Colors .."竞技场敌人小队","isRadio", 1,"checked",group=="arena","func", func,"arg1", self,"arg2", {valueB,"arena"})

			menu:AddLine("text", Colors .."(FH)敌对列表","isRadio", 1,"checked",group=="FHenemies","func", func,"arg1", self,"arg2", {valueB,"FHenemies"})
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
			
				--menu:AddLine("text", "隐藏了旧版本的一些目标","isTitle",1);
				local str = addon:FormatTooltipText("隐藏了的这些目标在自定义目标里已经没效率，强力建议不要使用。之所以能使用是为了兼容旧版本的方案。|r\n\n这些目标完全可以用施法方案里的条件目标代替，更有效率。");
				if ST.Hide_old_version_of_the_target then
				
					menu:AddLine("text", "|cffffff00<<< 隐藏了旧版本的一些目标",
					"checked",nil,"func",
					"Hide_old_version_of_the_target","arg1", self,
					"tooltipText",str,"tooltipTitle","系统提示"
					);
					menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
				else
				
					menu:AddLine("text", "|cffffff00>>> 隐藏了旧版本的一些目标",
					"checked",nil,"func",
					"Hide_old_version_of_the_target","arg1", self,
					"tooltipText",str,"tooltipTitle","系统提示"
					);
					
				end
				
			
				
				
			if group=="player" or group=="target" or group=="targettarget" or group=="focus" or 
			group=="focustarget" or group=="mouseover" or group=="mouseovertarget" or group=="FireHasBeenSet" 
			or group == "SelectedTarget" or ST.Hide_old_version_of_the_target then
			
				
				menu:AddLine("text", Colors .."自己","isRadio", 1,"checked",group=="player","func", func,"arg1", self,"arg2", {valueB,"player"})
				menu:AddLine("text", Colors .."当前目标","isRadio", 1,"checked",group=="target","func", func,"arg1", self,"arg2", {valueB,"target"})
				menu:AddLine("text", Colors .."当前目标的目标","isRadio", 1,"checked",group=="targettarget","func", func,"arg1", self,"arg2", {valueB,"targettarget"})
				menu:AddLine("text", Colors .."焦点目标","isRadio", 1,"checked",group=="focus","func", func,"arg1", self,"arg2", {valueB,"focus"})
				menu:AddLine("text", Colors .."焦点目标的目标","isRadio", 1,"checked",group=="focustarget","func", func,"arg1", self,"arg2", {valueB,"focustarget"})
				menu:AddLine("text", Colors .."鼠标目标","isRadio", 1,"checked",group=="mouseover","func", func,"arg1", self,"arg2", {valueB,"mouseover"})
				menu:AddLine("text", Colors .."鼠标目标的目标","isRadio", 1,"checked",group=="mouseovertarget","func", func,"arg1", self,"arg2", {valueB,"mouseovertarget"})
			
			
				
				
				local FireHasBeenSetValue = RDB[valueB]["AmminimumFast"]["FireHasBeenSetValue"];
				if not FireHasBeenSetValue then
					FireHasBeenSetValue =0;
				end
				local str = addon:FormatTooltipText("当你的队友被 >=" .. FireHasBeenSetValue .." 个竞技场敌人设为当前目标时，可以认为被集火了。");
				menu:AddLine("text",Colors .."竞技场被集火的队员|cffff0000(>=" .. FireHasBeenSetValue .. ")",
				"isRadio", 1,"checked", group=="FireHasBeenSet","func","CustomizeTargetListGetTargetAmminimumFastSetGroup_checked",
				"arg1", self, "arg2", {valueB,"FireHasBeenSet"},"hasSlider", 1, "sliderValue", FireHasBeenSetValue,
				"sliderMin", 0, "sliderMax", 5, "sliderStep", 1, "sliderFunc",
				"CustomizeTargetListGetTargetAmminimumFastMinimumFireHasBeenSetValue",
				"sliderArg1", self,"sliderArg2",valueB,"tooltipText",str,"tooltipTitle","被集火")
				

				
				local text;
				
				
				if not AMF["Group_SelectedTarget"] then
					AMF["Group_SelectedTarget"]={};
				end
				
				local T = AMF["Group_SelectedTarget"];
				
				if not T["name"] then
					text = "";
					menu:AddLine("text", "|cffffff00团/队:|r" .. text,"isRadio", 1, "checked",group == "SelectedTarget" ,"func",
					func,"arg1", self,"arg2", {valueB,"SelectedTarget"},
					"hasArrow", 1, "value", "CustomizeTargetListGetTargetAmminimumFastSetGroupSelectedTarget_" .. valueB);
				else
					
					local color = T["color"];
					
					menu:AddLine("text", T["name"],"isRadio", 1, "checked",group == "SelectedTarget" ,"func",
					func,"arg1", self,"arg2", {valueB,"SelectedTarget"},
					"hasArrow", 1, "value", "CustomizeTargetListGetTargetAmminimumFastSetGroupSelectedTarget_" .. valueB,
					"textR", color.r, "textG", color.g, "textB", color.b
					);
				
				end
				
			
				
			end
			

		elseif valueA == "CustomizeTargetListGetTargetAmminimumFastSetBuff" then
			
			menu:AddLine("text", "设定Buff条件","isTitle",1);
			menu:AddLine();
			
			if not RDB[valueB]["AmminimumFast"]["buff"] then
				
				RDB[valueB]["AmminimumFast"]["buff"]={};
			end
			
			if RDB[valueB]["AmminimumFast"]["RemoveBuff"] == nil then
				RDB[valueB]["AmminimumFast"]["RemoveBuff"]=true;
			end
			
			if RDB[valueB]["AmminimumFast"]["ValueBuff"] == nil then
				RDB[valueB]["AmminimumFast"]["ValueBuff"]=0;
			end
			
			local value = RDB[valueB]["AmminimumFast"]["ValueBuff"];
			local checked = RDB[valueB]["AmminimumFast"]["ValueBuffchecked"];
			
			local ids =RDB[valueB]["AmminimumFast"];
			
			local str = addon:FormatTooltipText("1、当你选择该项时BUFF流逝的时间超设定时间才符合条件,默认关闭。\n2、注意只判断存在的Buff。\n3、添加Buff时没BUFF时会先添加BUFF，然后再判断BUFF流逝的时间再刷新。")
			
			menu:AddLine("text", "|cffffff00当Buff存在(|cffff0000>=" .. value  .."|cffffff00)秒后", "checked",checked,"func", "CustomizeTargetListGetTargetAmminimumFast_ValueBuffChecked","arg1", self,"arg2", valueB,"hasSlider", 1,"sliderDecimals",1, "sliderValue", value, "sliderMin", 0, "sliderMax", 999, "sliderStep", 0.1, "sliderFunc", "CustomizeTargetListGetTargetAmminimumFast_ValueBuff", "sliderArg1", self,"sliderArg2", valueB,"tooltipText",str,"tooltipTitle","说明")
			
			menu:AddLine();
			
			local str = addon:FormatTooltipText("1、当有Buff符合列表时判断条件成立。\n2、如:解DBuff时选该项。\n3、可以配合其它条件一起判断。")
			
			menu:AddLine("text", "判断Buff是否存在","isRadio", 1,"checked",
			RDB[valueB]["AmminimumFast"]["RemoveBuff"],"func", 
			"CustomizeTargetListGetTargetAmminimumFastRemoveBuff_checked",
			"arg1", self,"arg2", {valueB,1},
			"tooltipText",str,"tooltipTitle","说明"
			--"disabled",ids["BuffCdChecked"] or ids["BuffCdMaxChecked"] or checked
			);
			
			local str = addon:FormatTooltipText("1、当Buff不在列表时判断条件成立。\n2、如:缺Buff需要补Buff时选该项。\n3、可以配合其它条件一起判断。")
			
			menu:AddLine("text", "判断Buff是否不存在","isRadio", 1,"checked",
			RDB[valueB]["AmminimumFast"]["AddBuff"],"func", 
			"CustomizeTargetListGetTargetAmminimumFastRemoveBuff_checked",
			"arg1", self,"arg2", {valueB,2},
			"tooltipText",str,"tooltipTitle","说明"
			--"disabled",ids["BuffCdChecked"] or ids["BuffCdMaxChecked"] or checked
			);
						
			
			menu:AddLine();
			
			if not RDB[valueB]["AmminimumFast"]["BuffCd"]  then
				RDB[valueB]["AmminimumFast"]["BuffCd"]=0;
			end
			
			if not RDB[valueB]["AmminimumFast"]["BuffCdMax"]  then
				RDB[valueB]["AmminimumFast"]["BuffCdMax"]=0;
			end
			
			local str = addon:FormatTooltipText("当你选择该项时，只能判断一个Buff。多个时会出现无法预知的后果。")
			menu:AddLine("text", "|cffffffffBuff的剩余时间(|cffff0000<=" .. RDB[valueB]["AmminimumFast"]["BuffCd"]  .."|cffffffff)","isRadio", nil,
			--"disabled",checked,
			"checked",ids["BuffCdChecked"],"func", "CustomizeTargetListGetTargetAmminimumFastRemoveBuff_checked","arg1", self,"arg2", {valueB,3},"hasSlider", 1, "sliderValue", RDB[valueB]["AmminimumFast"]["BuffCd"], "sliderMin", 0, "sliderMax", 100, "sliderStep", 0.1,"sliderDecimals",1, "sliderFunc", "CustomizeTargetListGetTargetAmminimumFastMinimum_BuffCd", "sliderArg1", self,"sliderArg2", valueB,"tooltipText",str,"tooltipTitle","说明")
			
			
			local str = addon:FormatTooltipText("当你选择该项时，只能判断一个Buff。多个时会出现无法预知的后果。")
			menu:AddLine("text", "|cffffffffBuff的剩余时间(|cffff0000>=" .. RDB[valueB]["AmminimumFast"]["BuffCdMax"]  .."|cffffffff)","isRadio", nil,
			--"disabled",checked,
			"checked",ids["BuffCdMaxChecked"],"func", "CustomizeTargetListGetTargetAmminimumFastRemoveBuff_checked","arg1", self,"arg2", {valueB,4},"hasSlider", 1, "sliderValue", RDB[valueB]["AmminimumFast"]["BuffCdMax"], "sliderMin", 0, "sliderMax", 100, "sliderStep", 0.1,"sliderDecimals",1, "sliderFunc", "CustomizeTargetListGetTargetAmminimumFastMinimum_BuffCdMax", "sliderArg1", self,"sliderArg2", valueB,"tooltipText",str,"tooltipTitle","说明")
			
			menu:AddLine();
			
			local str = addon:FormatTooltipText("判断Buff是否属于自己。")
			menu:AddLine("text", "|cffffffff判断Buff是否属于自己","checked",
			ids["BuffOwnChecked"],"func", valueA .."_BuffOwn_Checked","arg1", self,"arg2", RDB[valueB]["AmminimumFast"],
			"tooltipText",str,"tooltipTitle","信息");
			menu:AddLine();
		
			
			local str = addon:FormatTooltipText("可以输入Buff名称/Buff Id");
			--menu:AddLine("text", "添加Buff到列表","colorCode","|cffffff00","hasEditBox", 1, "editBoxText", self.text, "editBoxFunc", "CustomizeTargetListGetTargetAmminimumFast_AddBuff", "editBoxArg1", self,"editBoxArg2", valueB,"tooltipText",str,"icon",ExpandArrow,"tooltipTitle","说明")
			
			menu:AddLine("text", "添加Buff到列表","colorCode","|cffffff00","hasEditBox", 1, "editBoxText", self.text, "editBoxFunc", 
			"Default_AddBuff", "editBoxArg1", self,"editBoxArg2", 
			RDB[valueB]["AmminimumFast"]["buff"],"tooltipText",str,"icon",ExpandArrow,"tooltipTitle","说明")
			
			--[[
			CollectionInf["Buff_Spell"]["function"]="Default_AddBuff";
			CollectionInf["Buff_Spell"]["level"]=level;
			CollectionInf["Buff_Spell"]["value"]={RDB[valueB]["AmminimumFast"]["buff"]};
			
			menu:AddLine("text", "选择Buff到列表","colorCode","|cffffff00","hasArrow", 1, "value", "DefaultListCollectionInfBuffSpell","icon",ExpandArrow)
			--]]
			
			menu:AddLine("text", "选择Buff到列表","colorCode","|cffffff00","hasArrow", 1, "value", "",
			"OpenMenu",SuperTreatment["Menu"]["UnitBuffListMenu"],
			"OpenMenuValue",{CollectionInf["Buff_Spell"],addon.Default_AddBuff,RDB[valueB]["AmminimumFast"]["buff"]}
			);
			
			menu:AddLine();
			
			local Solution = RDB[valueB]["AmminimumFast"]["buff"];
			
			for k,v in pairs(Solution) do
			
				local Name,_,Texture=GetSpellInfo(v.SpellId);
				Texture = Texture or "";
			
				
				local text = "|cff00ff00" .. k .. ". |cffffffff" .. Name;
				
				if  v["IsTexture"] then
					text = text .. "|cffff0000[图]|r";
				elseif  v["IsSpellId"] then
					text = text .. "|cffff0000[Id]|r";
				end
				
				local str = addon:FormatTooltipText("\nId: |r" ..(v["SpellId"] or "") .. "\n\n|cff00ff00当有同名出现时通过启用对比图标来判断:\n\n|cffff0000启用: |cffffffffCtrl + 鼠标左键\n\n|cff00ff00当有同名出现时通过启用对比Id来判断:\n\n|cffff0000启用: |cffffffffAlt + 鼠标左键\n\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键")
				menu:AddLine("text", text,"icon",Texture,
				"hasArrow", 1, "value", "CustomizeTargetListGetTargetAmminimumFastDelBuff_" .. k,
				"tooltipText",str,"tooltipTitle",k,
				"func", "CustomizeTargetListGetTargetAmminimumFastDelBuff_Del", "arg1", self, "arg2", k
				)
			
			end
			
			
			AmminimumFast_SortBuff_index=valueB;
			--[[
			
			local i=1;
			
			for k,v in sortedpairs(Solution, AmminimumFast_SortBuff) do
				
				if not Solution[k]["Texture"] then
					Solution[k]["Texture"]="";
				end
				
				local text;
				if  Solution[k]["IsTexture"] then
					text = "|cff00ff00" .. i .. ". |cffffffff" .. k .. "|cffff0000[图]|r";
				else
					text = "|cff00ff00" .. i .. ". |cffffffff" .. k ;
				end
				
				--menu:AddLine("text", "|cff00ff00" .. i .. ". |cffffffff" .. k,"hasArrow", 1, "value", "CustomizeTargetListGetTargetAmminimumFastDelBuff_" .. k,"icon",Solution[k]["Texture"])
				local str = addon:FormatTooltipText("\n当有同名出现时通过启用对比图标来判断, |cffff0000启用: |cffffffffCtrl + 鼠标左键\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键")
				menu:AddLine("text", text,"icon",Solution[k]["Texture"],
				"hasArrow", 1, "value", "CustomizeTargetListGetTargetAmminimumFastDelBuff_" .. k,
				"tooltipText",str,"tooltipTitle",k,
				"func", "CustomizeTargetListGetTargetAmminimumFastDelBuff_Del", "arg1", self, "arg2", k
				)
				
				
				i=i+1;
				
			end
			--]]
			
			
		elseif valueA == "CustomizeTargetListGetTargetAmminimumFastSetNoBuff" then	
			
			menu:AddLine("text", "排除Buff","isTitle",1);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
			
			local Solution = RDB[valueB]["AmminimumFast"]["Nobuff"];
			local BuffInf = Solution;
			
			
			
			
			local str = addon:FormatTooltipText("可以输入Buff名称/Buff Id");
			
			menu:AddLine("text", "添加Buff到列表","colorCode","|cffffff00","hasEditBox", 1, "editBoxText", self.text, "editBoxFunc",
			"Default_AddBuff", "editBoxArg1", self,"editBoxArg2",
			BuffInf,"tooltipText",str,"icon",ExpandArrow,"tooltipTitle","说明")
			
			menu:AddLine("line",1);
			
			CollectionInf["Buff_Spell"]["function"]="Default_AddBuff";
			CollectionInf["Buff_Spell"]["level"]=level;
			CollectionInf["Buff_Spell"]["value"]={BuffInf};
			
			menu:AddLine("text", "选择Buff到列表","colorCode","|cffffff00","hasArrow", 1, "value", "DefaultListCollectionInfBuffSpell","icon",ExpandArrow)
			
			
			if not RDB[valueB]["AmminimumFast"]["Nobuff"] then
				RDB[valueB]["AmminimumFast"]["Nobuff"]={};
			end
			
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			AmminimumFast_SortBuff_index=valueB;
			
			for k,v in pairs(Solution) do
			
				local Name,_,Texture=GetSpellInfo(v.SpellId);
				Texture = Texture or "";
			
				
				local text = "|cff00ff00" .. k .. ". |cffffffff" .. Name;
				
				if  v["IsSpellIdTexture"]=="IsTexture" then
					text = text .. E.IsTexture;
				elseif  v["IsSpellIdTexture"]=="IsSpellId" then
					text = text .. E.IsSpellId;
				end
				
				if  v["IsPlayer"] == "Player" then
					text = text .. E.IsPlayer_Player;
				
				elseif  v["IsPlayer"] == "NoPlayer" then
					text = text .. E.IsPlayer_NoPlayer;
				else
					text = text .. E.IsPlayer_All;
				end
				
				if v["IsCd"]=="Start" then
					text = text .. E.IsCd_Start;
				end
				
				local str = addon:FormatTooltipText("\nId: |r" ..(v["SpellId"] or "") .. "\n\n" .. E.KEY_BUFF)
				menu:AddLine("text", text,"icon",Texture,
				
				"tooltipText",str,"tooltipTitle",Name,
				"func", "CustomizeTargetListGetTargetAmminimumFastDelNoBuff_Del", "arg1", self, "arg2", k,
				"CloseButtonFunc","Del_Tbl_Index","CloseButtonArg1",self,"CloseButtonArg2",{Solution,k,level},
				"hasArrow", 1, "value","CustomizeTargetListGetTargetAmminimumFastSetNoBuffToBuff_" ..valueB .. "_" ..k,
				"OpenMenu",SuperTreatment["Menu"]["SetBuffMenu"] ,"OpenMenuValue",v
				);
				
			end
			
		
		
		elseif valueA == "CustomizeTargetListGetTargetAmminimumFastSetSpell" then
		
			
			menu:AddLine("text", "读条技能","isTitle",1);
			menu:AddLine();
			
			if not RDB[valueB]["AmminimumFast"]["spell"] then
				
				RDB[valueB]["AmminimumFast"]["spell"]={};
			end
			
			local value = RDB[valueB]["AmminimumFast"]["SpellValue"];
			local checked = RDB[valueB]["AmminimumFast"]["SpellValueChecked"];
			
			if not value then
				value=0;
			end
			
			local SpellValuePoorvalue = RDB[valueB]["AmminimumFast"]["SpellValuePoorvalue"];
			local SpellValuePoorChecked = RDB[valueB]["AmminimumFast"]["SpellValuePoorChecked"];
			if not SpellValuePoorvalue then
				SpellValuePoorvalue=0;
			end
			
			
			local str = addon:FormatTooltipText("当你选择该项时技能读条少于设定时间才符合条件,默认关闭。");
			menu:AddLine("text", "|cffffffff当技能施放还差(|cffff0000" .. SpellValuePoorvalue  .."|cffffffff)秒就完成时", "checked",SpellValuePoorChecked ,"func", "CustomizeTargetListGetTargetAmminimumFastSpell_N_V_AllPoorchecked","arg1", self,"arg2", valueB,"hasSlider", 1,"sliderDecimals",1, "sliderValue", SpellValuePoorvalue, "sliderMin", 0, "sliderMax", 999, "sliderStep", 0.1, "sliderFunc", "CustomizeTargetListGetTargetAmminimumFastSpell_N_V_AllPoorvalue", "sliderArg1", self,"sliderArg2", valueB,"tooltipText",str,"tooltipTitle","说明")
			
			menu:AddLine();
		
			
			local str = addon:FormatTooltipText("当你选择该项时技能读条超设定时间才符合条件,默认关闭。");
			menu:AddLine("text", "|cffffffff当技能施放(|cffff0000>=" .. value  .."|cffffffff)秒后", "checked",checked,"func", "CustomizeTargetListGetTargetAmminimumFastSpell_SpellValueChecked","arg1", self,"arg2", valueB,"hasSlider", 1,"sliderDecimals",1, "sliderValue", value, "sliderMin", 0, "sliderMax", 999, "sliderStep", 0.1, "sliderFunc", "CustomizeTargetListGetTargetAmminimumFastSpell_SpellValue", "sliderArg1", self,"sliderArg2", valueB,"tooltipText",str,"tooltipTitle","说明")
			
			menu:AddLine();
			
			
			local str = addon:FormatTooltipText("比如你需要打断所有技能那么你把该选项打勾。");
			menu:AddLine("text", "|cffffff00所有技能","checked",RDB[valueB]["AmminimumFast"]["AllSpell"],"func", "CustomizeTargetListGetTargetAmminimumFastAllSpell_checked","arg1", self,"arg2", valueB,"tooltipText",str,"tooltipTitle","说明")
			
			menu:AddLine();
						
			local str = addon:FormatTooltipText("请确认新名称不在列表中，同名即|cffffffff 替换。");
			menu:AddLine("text", "输入添加技能","colorCode","|cffffff00","hasEditBox", 1, "editBoxText", self.text, "editBoxFunc", "CustomizeTargetListGetTargetAmminimumFast_AddSpell", "editBoxArg1", self,"editBoxArg2", valueB,"tooltipText",str,"icon","Interface\\ChatFrame\\ChatFrameExpandArrow","tooltipTitle","说明")
			
			CollectionInf["Buff_Spell"]["function"]="CustomizeTargetListGetTargetAmminimumFast_AddSpell";
			CollectionInf["Buff_Spell"]["level"]=level;
			CollectionInf["Buff_Spell"]["value"]={valueB};
			
			menu:AddLine("text", "选择添加技能","colorCode","|cffffff00","hasArrow", 1, "value", "DefaultListCollectionInfBuffSpell","icon",ExpandArrow)
			menu:AddLine();
			local Solution = RDB[valueB]["AmminimumFast"]["spell"];
			
			AmminimumFast_SortBuff_index=valueB;
			
			local i=1;
			local disabled = RDB[valueB]["AmminimumFast"]["AllSpell"];
			
			for k,v in sortedpairs(Solution, AmminimumFast_SortSpell) do
			
				if not Solution[k]["Texture"] then
					Solution[k]["Texture"]="";
				end
				local text ;
				if disabled then
					text = i .. ". " .. k;
				else
					text = "|cff00ff00" .. i .. ". |cffffffff" .. k;
				end
				
				local str = addon:FormatTooltipText("\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键")
				
				--menu:AddLine("text", text,"hasArrow", 1, "value", "CustomizeTargetListGetTargetAmminimumFastDelSpell_" .. k,"icon",Solution[k]["Texture"],"disabled",disabled)
				
				menu:AddLine("text", text,"hasArrow", 1, "value", "CustomizeTargetListGetTargetAmminimumFastDelSpell_" .. k,
				"icon",Solution[k]["Texture"],"disabled",disabled,
				"tooltipText",str,"tooltipTitle",k,
				"func", "CustomizeTargetListGetTargetAmminimumFastDelSpell_Del", "arg1", self, "arg2", k
				);
				
				i=i+1;
				
			end
		
		elseif valueA == "CustomizeTargetListGetTargetAmminimumFastClass" then	
			
			
			menu:AddLine("text", "排除的职业","isTitle",1);
			menu:AddLine();
			
			if not RDB[valueB]["AmminimumFast"]["Class"] then
					
				RDB[valueB]["AmminimumFast"]["Class"]={};
			end
			
			for k, name in pairs(ClassName) do
				
				
				
				
				if not RDB[valueB]["AmminimumFast"]["Class"][k] then
				
					RDB[valueB]["AmminimumFast"]["Class"][k]=false;
				end
				
				
			
				local color,tc;
					
				
				color = RAID_CLASS_COLORS[k]
				tc = CLASS_BUTTONS[k]
							
				menu:AddLine(
				"icon", "Interface\\WorldStateFrame\\Icons-Classes",
				"tCoordLeft", tc[1],
				"tCoordRight", tc[2],
				"tCoordTop", tc[3],
				"tCoordBottom", tc[4],
				
				"text", name, "textR", color.r, "textG", color.g, "textB", color.b, "checked",RDB[valueB]["AmminimumFast"]["Class"][k],"func", "CustomizeTargetListGetTargetAmminimumFastClasss_checked","arg1", self,"arg2", {valueB,k})
				
				
			end
		
		
		elseif valueA == "CustomizeTargetListGetTargetAmminimumFastMinimum" then	
			
			menu:AddLine("text", "获得最小的","isTitle",1);
			menu:AddLine();
			
			if not RDB[valueB]["AmminimumFast"]["Minimum"] then
			
				RDB[valueB]["AmminimumFast"]["Minimum"]={};
			end
			
			local checked = RDB[valueB]["AmminimumFast"]["Minimum"];
			
			local value = RDB[valueB]["AmminimumFast"]["Minimum"];
			
			if not value["MinimumBloodValue"] then
				value["MinimumBloodValue"]=1000000/2;
			end
			
			if not value["MinimumBloodPercentageValue"] then
				value["MinimumBloodPercentageValue"]=50;
			end
			
			if not value["MinimumEnergyValue"] then
				value["MinimumEnergyValue"]=1000000/2;
			end
			
			if not value["MinimumEnergyPercentageValue"] then
				value["MinimumEnergyPercentageValue"]=50;
			end
			
			if not value["MinimumDistanceValue"] then
				value["MinimumDistanceValue"]=25;
			end
			
			--if checked["MinimumBlood"]==nil then
			--	checked["MinimumBlood"]=true;
			--end
			
			
			menu:AddLine("text", "|cffffffff最小血量(|cffff0000<=" .. value["MinimumBloodValue"]  .."|cffffffff)","isRadio", 1,"checked",checked["MinimumBlood"],"func", "CustomizeTargetListGetTargetAmminimumFastMinimumBlood_checked","arg1", self,"arg2", valueB,"hasSlider", 1, "sliderValue", value["MinimumBloodValue"], "sliderMin", 0, "sliderMax", 1000000, "sliderStep", 1, "sliderFunc", "CustomizeTargetListGetTargetAmminimumFastMinimum_MinimumBlood", "sliderArg1", self,"sliderArg2", valueB)
			
			menu:AddLine("text", "|cffffffff最小血量(|cffff0000<=" .. value["MinimumBloodPercentageValue"]  .."%|cffffffff)","isRadio", 1,"checked",checked["MinimumBloodPercentage"],"func", "CustomizeTargetListGetTargetAmminimumFastMinimumBloodPercentage_checked","arg1", self,"arg2", valueB,"hasSlider", 1, "sliderValue", value["MinimumBloodPercentageValue"], "sliderMin", 0, "sliderMax", 100, "sliderStep", 1, "sliderFunc", "CustomizeTargetListGetTargetAmminimumFastMinimum_MinimumBloodPercentage", "sliderArg1", self,"sliderArg2", valueB)
			
			
			menu:AddLine("text", "|cffffffff最小能量(|cffff0000<=" .. value["MinimumEnergyValue"]  .."|cffffffff)","isRadio", 1,"checked",checked["MinimumEnergy"],"func", "CustomizeTargetListGetTargetAmminimumFastMinimumEnergy_checked","arg1", self,"arg2", valueB,"hasSlider", 1, "sliderValue", value["MinimumEnergyValue"], "sliderMin", 0, "sliderMax", 1000000, "sliderStep", 1, "sliderFunc", "CustomizeTargetListGetTargetAmminimumFastMinimum_MinimumEnergy", "sliderArg1", self,"sliderArg2", valueB)
			
			
			menu:AddLine("text", "|cffffffff最小能量(|cffff0000<=" .. value["MinimumEnergyPercentageValue"]  .."%|cffffffff)","isRadio", 1,"checked",checked["MinimumEnergyPercentage"],"func", "CustomizeTargetListGetTargetAmminimumFastMinimumEnergyPercentage_checked","arg1", self,"arg2", valueB,"hasSlider", 1, "sliderValue", value["MinimumEnergyPercentageValue"], "sliderMin", 0, "sliderMax", 100, "sliderStep", 1, "sliderFunc", "CustomizeTargetListGetTargetAmminimumFastMinimum_MinimumEnergyPercentage", "sliderArg1", self,"sliderArg2", valueB)
			
			
			menu:AddLine("text", "|cffffffff最小距离内(|cffff0000<=" .. value["MinimumDistanceValue"]  .."|cffffffff)","isRadio", 1,"checked",checked["MinimumDistance"],"func", "CustomizeTargetListGetTargetAmminimumFastMinimumDistance_checked","arg1", self,"arg2", valueB,"hasSlider", 1, "sliderValue", value["MinimumDistanceValue"], "sliderMin", 5, "sliderMax", 50, "sliderStep", 1, "sliderFunc", "CustomizeTargetListGetTargetAmminimumFastMinimum_MinimumDistance", "sliderArg1", self,"sliderArg2", valueB)
			
			
			if not value["MinimumLayerBuff"] then
			
				value["MinimumLayerBuff"]=0;
			end
			
			menu:AddLine("text", "|cffffffff最小Buff层数(|cffff0000<=" .. value["MinimumLayerBuff"]  .."|cffffffff)", "hasArrow", 1, "value", "CustomizeTargetListGetTargetAmminimumFastMinimumLayerBuff_"  .. valueB,"isRadio", 1,"checked",checked["MinimumLayerBuffChecked"],"func", "CustomizeTargetListGetTargetAmminimumFastMinimum_LayerBuff_checked","arg1", self,"arg2", valueB)
			
			
			
			
			
			str = addon:FormatTooltipText("从代码返回表达式（字符串）结果作为条件，需要返回2个值。\n第1个是条件表达式的结果。\n第2个是表达式的结果为数值作为判断最小值的依据。\n内部变量 unit 是目标的ID。");
				menu:AddLine("text", "|cffffffff从代码获得|r","isRadio", 1,"hasEditBox", 1, "editBoxText", value["MinimumCode"], "editBoxFunc", "CustomizeTargetListGetTargetAmminimumFastMinimum_MinimumCode", "editBoxArg1", self,"editBoxArg2", valueB,"tooltipText",str,"checked",checked["CodeChecked"],"func", "CustomizeTargetListGetTargetAmminimumFastMinimum_MinimumCode_checked","arg1", self,"arg2", valueB,"tooltipTitle","从代码获得")
		
		
		elseif valueA == "CustomizeTargetListGetTargetAmminimumFastCount" then
			
			menu:AddLine("text", "条件数量","isTitle",1);
			menu:AddLine()
			
			
			str = addon:FormatTooltipText("如判断所有队友其中是否有癒合祷言,当没这BUFF时，条件为假没目标返回。\n|r现在我们需要当所有人都没这BUFF时就补上，这时我们就需要判断条件为假的统计数量，当数量为0时我们就补上这BUFF。\n\n这个时候就要选择该项了。");
			menu:AddLine("text", "计算其它判断为假的数量" , 
			"checked",RDB[valueB]["AmminimumFast"]["CountFalseChecked"],
			"func", "CustomizeTargetListGetTargetAmminimumFastCount_CountFalseChecked","arg1", self,"arg2", RDB[valueB]["AmminimumFast"],
			"tooltipTitle","计算其它判断为假的数量","tooltipText",str
				);
				
			menu:AddLine()
			
			if not RDB[valueB]["AmminimumFast"]["Count"] then
			
				RDB[valueB]["AmminimumFast"]["Count"]={};
				RDB[valueB]["AmminimumFast"]["Count"]["<"]={};
				RDB[valueB]["AmminimumFast"]["Count"][">"]={};
			end
			
						
			local tbl =RDB[valueB]["AmminimumFast"]["Count"];
			local MaxValue=50;
			
			if not tbl["<"]["Value"] then
				tbl["<"]["Value"]=0;
			end
			
			if not tbl[">"]["Value"] then
				tbl[">"]["Value"]=0;
			end
			
			
			
			menu:AddLine("text", "|cffffffff数量(|cffff0000<=" .. tbl["<"]["Value"]  .."|cffffffff)" , 
			"checked",tbl["<"]["checked"],"func", valueA .. "_v_checked","arg1", self,"arg2", tbl["<"],
			"hasSlider", 1, "sliderValue",  tbl["<"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			valueA .. "_v_value" , "sliderArg1", self,"sliderArg2", tbl["<"]
			);
			
						
			menu:AddLine("text", "|cffffffff数量(|cffff0000>=" .. tbl[">"]["Value"]  .."|cffffffff)",
			"checked",tbl[">"]["checked"],"func", valueA .. "_v_checked","arg1", self,"arg2", tbl[">"],
			"hasSlider", 1, "sliderValue",tbl[">"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			valueA .. "_v_value" , "sliderArg1", self,"sliderArg2", tbl[">"]
			);
		
		elseif valueA == "CustomizeTargetListGetTargetAmminimumFastMaximum" then	
			
			menu:AddLine("text", "获得最大的","isTitle",1);
			menu:AddLine()
			
			if not RDB[valueB]["AmminimumFast"]["Maximum"] then
			
				RDB[valueB]["AmminimumFast"]["Maximum"]={};
			end
			
			local checked = RDB[valueB]["AmminimumFast"]["Maximum"];
			
			local value = RDB[valueB]["AmminimumFast"]["Maximum"];
			
			if not value["MaximumBloodValue"] then
				value["MaximumBloodValue"]=1000000/2;
			end
			
			if not value["MaximumBloodPercentageValue"] then
				value["MaximumBloodPercentageValue"]=50;
			end
			
			if not value["MaximumEnergyValue"] then
				value["MaximumEnergyValue"]=1000000/2;
			end
			
			if not value["MaximumEnergyPercentageValue"] then
				value["MaximumEnergyPercentageValue"]=50;
			end
			
			
			
			
			menu:AddLine("text", "|cffffffff最大缺血量(|cffff0000>=" .. value["MaximumBloodValue"]  .."|cffffffff)","isRadio", 1,"checked",checked["MaximumBlood"],"func", "CustomizeTargetListGetTargetAmminimumFastMaximumBlood_checked","arg1", self,"arg2", valueB,"hasSlider", 1, "sliderValue", value["MaximumBloodValue"], "sliderMin", 0, "sliderMax", 1000000, "sliderStep", 1, "sliderFunc", "CustomizeTargetListGetTargetAmminimumFastMaximum_MaximumBlood", "sliderArg1", self,"sliderArg2", valueB)
			
			menu:AddLine("text", "|cffffffff最大缺血量(|cffff0000>=" .. value["MaximumBloodPercentageValue"]  .."%|cffffffff)","isRadio", 1,"checked",checked["MaximumBloodPercentage"],"func", "CustomizeTargetListGetTargetAmminimumFastMaximumBloodPercentage_checked","arg1", self,"arg2", valueB,"hasSlider", 1, "sliderValue", value["MaximumBloodPercentageValue"], "sliderMin", 0, "sliderMax", 100, "sliderStep", 1, "sliderFunc", "CustomizeTargetListGetTargetAmminimumFastMaximum_MaximumBloodPercentage", "sliderArg1", self,"sliderArg2", valueB)
			
			
			menu:AddLine("text", "|cffffffff最大缺能量(|cffff0000>=" .. value["MaximumEnergyValue"]  .."|cffffffff)","isRadio", 1,"checked",checked["MaximumEnergy"],"func", "CustomizeTargetListGetTargetAmminimumFastMaximumEnergy_checked","arg1", self,"arg2", valueB,"hasSlider", 1, "sliderValue", value["MaximumEnergyValue"], "sliderMin", 0, "sliderMax", 1000000, "sliderStep", 1, "sliderFunc", "CustomizeTargetListGetTargetAmminimumFastMaximum_MaximumEnergy", "sliderArg1", self,"sliderArg2", valueB)
			
			
			menu:AddLine("text", "|cffffffff最大缺能量(|cffff0000>=" .. value["MaximumEnergyPercentageValue"]  .."%|cffffffff)","isRadio", 1,"checked",checked["MaximumEnergyPercentage"],"func", "CustomizeTargetListGetTargetAmminimumFastMaximumEnergyPercentage_checked","arg1", self,"arg2", valueB,"hasSlider", 1, "sliderValue", value["MaximumEnergyPercentageValue"], "sliderMin", 0, "sliderMax", 100, "sliderStep", 1, "sliderFunc", "CustomizeTargetListGetTargetAmminimumFastMaximum_MaximumEnergyPercentage", "sliderArg1", self,"sliderArg2", valueB)
			
			
			
			
			
			if not value["MaximumLayerBuff"] then
			
				value["MaximumLayerBuff"]=0;
			end
			
			menu:AddLine("text", "|cffffffff最大Buff层数(|cffff0000>=" .. value["MaximumLayerBuff"]  .."|cffffffff)", "hasArrow", 1, "value", "CustomizeTargetListGetTargetAmminimumFastMaximumLayerBuff_"  .. valueB,"isRadio", 1,"checked",checked["MaximumLayerBuffChecked"],"func", "CustomizeTargetListGetTargetAmminimumFastMaximum_LayerBuff_checked","arg1", self,"arg2", valueB)
			
			
			
			
			
			str = addon:FormatTooltipText("从代码返回表达式（字符串）结果作为条件，需要返回2个值。\n第1个是条件表达式的结果。\n第2个是表达式的结果为数值作为判断最大值的依据。\n内部变量 unit 是目标的ID。");
				menu:AddLine("text", "|cffffffff从代码获得|r","isRadio", 1,"hasEditBox", 1, "editBoxText", value["MaximumCode"], "editBoxFunc", "CustomizeTargetListGetTargetAmminimumFastMaximum_MaximumCode", "editBoxArg1", self,"editBoxArg2", valueB,"tooltipText",str,"checked",checked["CodeChecked"],"func", "CustomizeTargetListGetTargetAmminimumFastMaximum_MaximumCode_checked","arg1", self,"arg2", valueB,"tooltipTitle","从代码获得")
		
		
		
		end
		
	elseif level == 8 then -- 8级菜单内容
	
		local _, _, valueA, valueB = string.find(value, "(.-)_(.+)")
		
		if valueA == "CustomizeTargetListGetTargetAmminimumFastSetNoBuffToBuff" then
			
		
		elseif valueA == "CustomizeTargetListGetTargetAmminimumFastSetNoBuffToBuffxxx" then		
			local V = addon:DecompositionValue(value);
			V[3] = tonumber(V[3]);
			
			local TBL = RDB[V[2]]["AmminimumFast"]["Nobuff"];
			local Buff = TBL[V[3]];
			
			Buff["IsPlayer"] = Buff["IsPlayer"] or "All";
			
			local str = addon:FormatTooltipText("判断Buff是否属于自己。")
			menu:AddLine("text", "|cffffffff无","isRadio",1,"checked",
			Buff["IsPlayer"]== "All","func", valueA .."_Nobuff_Checked","arg1", self,"arg2",{Buff,"IsPlayer","All"},
			"tooltipText",str,"tooltipTitle","信息");
			
			
			local str = addon:FormatTooltipText("判断Buff是否属于自己。")
			menu:AddLine("text", "|cffffffff我的Buff","isRadio",1,"checked",
			Buff["IsPlayer"]== "Player","func", valueA .."_Nobuff_Checked","arg1", self,"arg2",{Buff,"IsPlayer","Player"},
			"tooltipText",str,"tooltipTitle","信息");
			
			local str = addon:FormatTooltipText("判断Buff是否属于自己。")
			menu:AddLine("text", "|cffffffff不是我的Buff","isRadio",1,"checked",
			Buff["IsPlayer"]== "NoPlayer","func", valueA .."_Nobuff_Checked","arg1", self,"arg2",{Buff,"IsPlayer","NoPlayer"},
			"tooltipText",str,"tooltipTitle","信息");
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			Buff["IsSpellIdTexture"] = Buff["IsSpellIdTexture"] or "IsName";
			
			local str = addon:FormatTooltipText("判断Buff是否属于自己。")
			menu:AddLine("text", "|cffffffff判断名称","isRadio",1,"checked",
			Buff["IsSpellIdTexture"]=="IsName","func", valueA .."_Nobuff_Checked","arg1", self,"arg2",{Buff,"IsSpellIdTexture","IsName"},
			"tooltipText",str,"tooltipTitle","信息");
			
			
			local str = addon:FormatTooltipText("判断Buff是否属于自己。")
			menu:AddLine("text", "|cffffffff判断Id","isRadio",1,"checked",
			Buff["IsSpellIdTexture"]=="IsSpellId","func", valueA .."_Nobuff_Checked","arg1", self,"arg2",{Buff,"IsSpellIdTexture","IsSpellId"},
			"tooltipText",str,"tooltipTitle","信息");
			
			local str = addon:FormatTooltipText("判断Buff是否属于自己。")
			menu:AddLine("text", "|cffffffff判断图标","isRadio",1,"checked",
			Buff["IsSpellIdTexture"]=="IsTexture","func", valueA .."_Nobuff_Checked","arg1", self,"arg2",{Buff,"IsSpellIdTexture","IsTexture"},
			"tooltipText",str,"tooltipTitle","信息");
			
			
			
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			Buff["IsCd"] = Buff["IsCd"] or "No";
			
			menu:AddLine("text", "|cffffffff无","isRadio",1,"checked",
			Buff["IsCd"] == "No","func", "SetTbl","arg1", self,"arg2",{Buff,"IsCd","No",level-1},
			"tooltipText",str,"tooltipTitle","信息");
			
			local str = addon:FormatTooltipText("判断Buff是否属于自己。")
			menu:AddLine("text", "|cffffffff冷却时间","isRadio",1,"checked",
			Buff["IsCd"] == "End","func", "SetTbl","arg1", self,"arg2",{Buff,"IsCd","End",level-1},
			"tooltipText",str,"tooltipTitle","信息");
			
			menu:AddLine("text", "|cffffffff出现时间","isRadio",1,"checked",
			Buff["IsCd"] == "Start","func", "SetTbl","arg1", self,"arg2",{Buff,"IsCd","Start",level-1},
			"tooltipText",str,"tooltipTitle","信息");
			
		
			
			
			menu:AddLine("line",1,"LineHeight",8);
			
			local disabled = Buff["IsCd"] == "No";
			
			if not Buff["Cd"] then
				Buff["Cd"]={};
				Buff["Cd"][">"]={};
				Buff["Cd"]["<"]={};
			end
			
						
			local MaxValue =999 ;
			local Va = Buff["Cd"][">"]["Value"] or 0;
			local checked = Buff["Cd"][">"]["Checked"]
			local text;
			if disabled then
				text = "时间(>=" .. Va   ..")秒"
			else
				text = "|cffffffff时间(|cffff0000>=" .. Va   .."|cffffffff)秒"
			end
			
			menu:AddLine("text", text,
			"disabled",disabled,
			"checked",checked,"func", "SetTbl","arg1", self,"arg2", {Buff["Cd"][">"],"Checked",not checked,level},
			"hasSlider", 1,"sliderDecimals",1, "sliderValue", Va ,
			"sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 0.1, "sliderFunc",
			"SetTbl", "sliderArg1", self,"sliderArg2", {Buff["Cd"][">"],"Value",nil,level,1});
			
			menu:AddLine("line",1,"LineHeight",8);
			
			local MaxValue =999 ;
			local Va = Buff["Cd"]["<"]["Value"] or 0;
			local checked = Buff["Cd"]["<"]["Checked"]
			local text;
			if disabled then
				text = "时间(<=" .. Va   ..")秒"
			else
				text = "|cffffffff时间(|cffff0000<=" .. Va   .."|cffffffff)秒"
			end
			
			menu:AddLine("text", text,
			"disabled",disabled,
			"checked",checked,"func", "SetTbl","arg1", self,"arg2", {Buff["Cd"]["<"],"Checked",not checked,level},
			"hasSlider", 1,"sliderDecimals",1, "sliderValue", Va ,
			"sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 0.1, "sliderFunc",
			"SetTbl", "sliderArg1", self,"sliderArg2", {Buff["Cd"]["<"],"Value",nil,level,1});
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			menu:AddLine("text", "|cffffffff无","isRadio",1,"checked",
			not Buff["IsCount"],"func", "SetTbl","arg1", self,"arg2",{Buff,"IsCount",false,level},
			"tooltipText",str,"tooltipTitle","信息");
			
			menu:AddLine("text", "|cffffffff判断层数","isRadio",1,"checked",
			Buff["IsCount"],"func", "SetTbl","arg1", self,"arg2",{Buff,"IsCount",true,level},
			"tooltipText",str,"tooltipTitle","信息");
			
			menu:AddLine("line",1,"LineHeight",8);
			
			if not Buff["Count"] then
				Buff["Count"]={};
				Buff["Count"][">"]={};
				Buff["Count"]["<"]={};
			end
			
			local disabled = not Buff["IsCount"];
			
			local MaxValue =999 ;
			local Va = Buff["Count"][">"]["Value"] or 0;
			local checked = Buff["Count"][">"]["Checked"]
			local text;
			
			if disabled then
				text = "层数(>=" .. Va   ..")"
			else
				text = "|cffffffff层数(|cffff0000>=" .. Va   .."|cffffffff)"
			end
			
			menu:AddLine("text", text,
			"checked",checked,"func", "SetTbl","arg1", self,"arg2", {Buff["Count"][">"],"Checked",not checked,level},
			"disabled",disabled,
			"hasSlider", 1,"sliderDecimals",1, "sliderValue", Va ,
			"sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 0.1, "sliderFunc",
			"SetTbl", "sliderArg1", self,"sliderArg2", {Buff["Count"][">"],"Value",nil,level,1});
			
			menu:AddLine("line",1,"LineHeight",8);
			
			local MaxValue =999 ;
			local Va = Buff["Count"]["<"]["Value"] or 0;
			local checked = Buff["Count"]["<"]["Checked"]
			
			if disabled then
				text = "层数(<=" .. Va   ..")"
			else
				text = "|cffffffff层数(|cffff0000<=" .. Va   .."|cffffffff)"
			end
			
			menu:AddLine("text", text,
			"checked",checked,"func", "SetTbl","arg1", self,"arg2", {Buff["Count"]["<"],"Checked",not checked,level},
			"disabled",disabled,
			"hasSlider", 1,"sliderDecimals",1, "sliderValue", Va ,
			"sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 0.1, "sliderFunc",
			"SetTbl", "sliderArg1", self,"sliderArg2", {Buff["Count"]["<"],"Value",nil,level,1});
			
			
		elseif valueA == "CustomizeTargetListGetTargetAmminimumFastSetGroupMultitasking" then
			
			local tbl = RDB[valueB]["AmminimumFast"];
			
			local t = tbl["MultitaskingTime"];
			
			if not t then t =1 ;end;
			
			local str = addon:FormatTooltipText("");
			menu:AddLine("text","刷新时间(毫秒):|cffff0000" .. t ,
			"hasSlider", 1, "sliderValue", t,
			"sliderMin", 50, "sliderMax", 9999, "sliderStep", 1, "sliderFunc",
			valueA .. "_Time_Value",
			"sliderArg1", self,"sliderArg2",tbl,"tooltipText",str,"tooltipTitle","MultitaskingTime")
			
			
			
			
		elseif valueA == "CustomizeTargetListGetTargetAmminimumFastDelBuff" then
			
			
			menu:AddLine("text",valueB,"isTitle",1)
			menu:AddLine()
		
			--menu:AddLine("text", "|cffff0000删除|r", "func", "CustomizeTargetListGetTargetAmminimumFastDelBuff_Del", "arg1", self, "arg2", valueB, "hasConfirm", 1, "confirmText", "是否删除 " .. valueB .." ？")
			
			menu:AddLine("text", "|cffffff00排除的职业" ,"hasArrow", 1, "value", "CustomizeTargetListGetTargetAmminimumFastSetClass_" .. valueB,"icon",ExpandArrow)
			
		--elseif valueA == "CustomizeTargetListGetTargetAmminimumFastDelNoBuff" then
			
			
		--	menu:AddLine("text","|cff00ff00" .. valueB)
		--	menu:AddLine()
			
		--	menu:AddLine("text", "|cffff0000删除|r", "func", "CustomizeTargetListGetTargetAmminimumFastDelNoBuff_Del", "arg1", self, "arg2", valueB, "hasConfirm", 1, "confirmText", "是否删除 " .. valueB .." ？")
			
			
		elseif valueA == "CustomizeTargetListGetTargetAmminimumFastDelSpell" then
		
			menu:AddLine("text", valueB,"isTitle",1)
			menu:AddLine()
			
			
			local temp = RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["spell"][valueB];
			local vv={AmminimumFast_SortBuff_index,valueB};
			if not temp["Poorvalue"] then
				temp["Poorvalue"]=0;
			end
			if not temp["value"] then
				temp["value"]=0;
			end
			
			local disabled = RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["SpellValuePoorChecked"];
			local text ;
			if disabled then
				text = "当技能施放还差(" .. temp["Poorvalue"]  ..")秒就完成时";
			else
				text = "|cffffffff当技能施放还差(|cffff0000" .. temp["Poorvalue"]  .."|cffffffff)秒就完成时";
			end
				
			local str = addon:FormatTooltipText("当你选择该项时" .. valueB .. "技能读条少于设定时间才符合条件,默认关闭。");
			menu:AddLine("text", text, "checked",temp["PoorChecked"] ,"func", "CustomizeTargetListGetTargetAmminimumFastSpell_N_V_Poorchecked","arg1", self,"arg2", vv,"hasSlider", 1,"sliderDecimals",1, "sliderValue", temp["Poorvalue"], "sliderMin", 0, "sliderMax", 999, "sliderStep", 0.1, "sliderFunc", "CustomizeTargetListGetTargetAmminimumFastSpell_N_V_Poorvalue", "sliderArg1", self,"sliderArg2", vv,"tooltipText",str,"disabled",disabled,"tooltipTitle","说明")
			
			menu:AddLine();
			
			local disabled = RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["SpellValueChecked"];
			local text ;
			if disabled then
				text = "当技能施放(" .. temp["value"]  ..")秒后";
			else
				text = "|cffffffff当技能施放(|cffff0000>=" .. temp["value"]  .."|cffffffff)秒后";
			end
			
			local str = addon:FormatTooltipText("当你选择该项时" .. valueB .. "技能读条超设定时间才符合条件,默认关闭。");
			menu:AddLine("text", text ,"checked",temp["Checked"] ,"func", "CustomizeTargetListGetTargetAmminimumFastSpell_N_V_checked","arg1", self,"arg2", vv,"hasSlider", 1,"sliderDecimals",1, "sliderValue", temp["value"], "sliderMin", 0, "sliderMax", 999, "sliderStep", 0.1, "sliderFunc", "CustomizeTargetListGetTargetAmminimumFastSpell_N_V_value", "sliderArg1", self,"sliderArg2", vv,"tooltipText",str,"disabled",disabled,"tooltipTitle","说明")
			
			menu:AddLine();
			
			
			--menu:AddLine("text", "|cffff0000删除|r", "func", "CustomizeTargetListGetTargetAmminimumFastDelSpell_Del", "arg1", self, "arg2", valueB, "hasConfirm", 1, "confirmText", "是否删除 " .. valueB .." ？")
			
		elseif valueA == "CustomizeTargetListGetTargetAmminimumFastSetGroupExcludedTarget" then
			
			menu:AddLine("text", "设定排除目标:","isTitle",1);
			menu:AddLine()
			
			
			
			if not RDB[valueB]["AmminimumFast"]["ExcludedTarget"] then
				RDB[valueB]["AmminimumFast"]["ExcludedTarget"]={};
			end
			
			local tbl = RDB[valueB]["AmminimumFast"]["ExcludedTarget"];
			--local disabled = true;
			
			for name, data in pairs(tbl) do
				
				if amGetUnitName(name,true) then
				
				
				
					local color,tc,levelColor,subgroup,checked,Class;
					local playerClass, englishClass = UnitClass(name);
					color = RAID_CLASS_COLORS[englishClass];
					tc = CLASS_BUTTONS[englishClass];
					
					menu:AddLine(
					-- 职业图标
					"icon", "Interface\\WorldStateFrame\\Icons-Classes",
					"tCoordLeft", tc[1],
					"tCoordRight", tc[2],
					"tCoordTop", tc[3],
					"tCoordBottom", tc[4],
					
					"text", name, "textR", color.r, "textG", color.g, "textB", color.b,
					"func", "AmminimumFastSetGroupExcludedTarget_DEL", "arg1", self, "arg2", {valueB,name}
				)
								
				end
			end
			
			menu:AddLine();
			
			for name, data in pairs(tbl) do
				
				if not amGetUnitName(name,true) then
				
					local str = addon:FormatTooltipText("这个玩家名字,必须是完整的名字,而且该玩家必须是你的团友或队友或宠物, 否则你将不能使用玩家名字作为目标。");
					menu:AddLine("text","|c00696969"  .. name, 
									"func", "AmminimumFastSetGroupExcludedTarget_DEL", "arg1", self, "arg2", {valueB,name},"tooltipText",str,"tooltipTitle","目标不可用"
								)
					
				end				
				
			end
			
			local str = addon:FormatTooltipText("这个玩家名字,必须是完整的名字,而且该玩家必须是你的团友或队友或宠物, 否则你将不能使用玩家名字作为目标。");
				
				menu:AddLine("text", "|cffffff00手动添加排除目标","hasEditBox", 1, "editBoxText", "", "editBoxFunc", "AmminimumFastSetGroupExcludedTarget_ADD_EditUnit", "editBoxArg1", self,"editBoxArg2", valueB,"tooltipText",str,"tooltipTitle","目标名字","icon",ExpandArrow)
			
			
			
			menu:AddLine("text","|cffffff00选择添加排除目标","hasArrow", 1, "value", "CustomizeTargetListGetTargetAmminimumFastSetGroupSelectExcludedTarget_" .. valueB,"icon",ExpandArrow)
			
			
			
			menu:AddLine("text", "","isTitle",1);
			
			menu:AddLine("text", "设定排除小队:","isTitle",1);
			menu:AddLine()
			
			if not RDB[valueB]["AmminimumFast"]["ExcludedGroup"] then
				RDB[valueB]["AmminimumFast"]["ExcludedGroup"]={};
			end
			
			local tbl = RDB[valueB]["AmminimumFast"]["ExcludedGroup"];
			
			for i=1, 8 do
				
				
				menu:AddLine("text", i .. "小队" ,"checked",tbl[i] ,
				"func", "AmminimumFastSetGroupExcludedGroup_checked",
				"arg1", self,"arg2", {valueB,i}
				);
				
			end
			
		
		elseif valueA ==  "CustomizeTargetListGetTargetAmminimumFastMinimumLayerBuff" then
			
			menu:AddLine("text", "设定Buff层数","isTitle",1);
			menu:AddLine();
			
			local checked = RDB[valueB]["AmminimumFast"]["Minimum"];
			
			local value = RDB[valueB]["AmminimumFast"]["Minimum"];
			
						
			menu:AddLine("text", "|cffffff00最小Buff层数(|cffff0000<=" .. value["MinimumLayerBuff"]  .."|cffffff00)","hasSlider", 1, "sliderValue", value["MinimumLayerBuff"], "sliderMin", 0, "sliderMax", 50, "sliderStep", 1, "sliderFunc", "CustomizeTargetListGetTargetAmminimumFastMinimum_LayerBuff", "sliderArg1", self,"sliderArg2", valueB)
			
			menu:AddLine();
			
			
			menu:AddLine("text", "|cffffff00要判断的Buff名称","colorCode","|cffffff00","hasEditBox", 1, "editBoxText", value["LayerBuffName"], "editBoxFunc", "AmminimumFastMinimum_LayerBuffName_Edit", "editBoxArg1", self,"editBoxArg2", valueB)
			
			
			CollectionInf["Buff_Spell"]["function"]="AmminimumFastMinimum_LayerBuffName_Edit";
			CollectionInf["Buff_Spell"]["level"]=level;
			CollectionInf["Buff_Spell"]["value"]={valueB};
			menu:AddLine("text", "|cffffff00选择要判断的Buff","colorCode","|cffffff00","hasArrow", 1, "value", "DefaultListCollectionInfBuffSpell","icon",ExpandArrow)
			menu:AddLine();
			
			if not value["LayerBuffName"] then
				value["LayerBuffName"]="";
			end
			
			if not value["LayerBuffIcon"] then
				value["LayerBuffIcon"]="";
			end
			
			
			menu:AddLine("text", value["LayerBuffName"],"icon",value["LayerBuffIcon"])
		
		elseif valueA ==  "CustomizeTargetListGetTargetAmminimumFastMaximumLayerBuff" then
		
			menu:AddLine("text", "设定Buff层数","isTitle",1);
			menu:AddLine();
			
			local checked = RDB[valueB]["AmminimumFast"]["Maximum"];
			
			local value = RDB[valueB]["AmminimumFast"]["Maximum"];
			
						
			menu:AddLine("text", "|cffffff00最大Buff层数(|cffff0000>=" .. value["MaximumLayerBuff"]  .."|cffffff00)","hasSlider", 1, "sliderValue", value["MaximumLayerBuff"], "sliderMin", 0, "sliderMax", 50, "sliderStep", 1, "sliderFunc", "CustomizeTargetListGetTargetAmminimumFastMaximum_LayerBuff", "sliderArg1", self,"sliderArg2", valueB)
			
			menu:AddLine();
			
			
			menu:AddLine("text", "|cffffff00要判断的Buff名称","colorCode","|cffffff00","hasEditBox", 1, "editBoxText", value["LayerBuffName"], "editBoxFunc", "AmminimumFastMaximum_LayerBuffName_Edit", "editBoxArg1", self,"editBoxArg2", valueB)
			
			CollectionInf["Buff_Spell"]["function"]="AmminimumFastMaximum_LayerBuffName_Edit";
			CollectionInf["Buff_Spell"]["level"]=level;
			CollectionInf["Buff_Spell"]["value"]={valueB};
			menu:AddLine("text", "|cffffff00选择要判断的Buff","colorCode","|cffffff00","hasArrow", 1, "value", "DefaultListCollectionInfBuffSpell","icon",ExpandArrow)
			menu:AddLine();
			
			if not value["LayerBuffName"] then
				value["LayerBuffName"]="";
			end
			
			if not value["LayerBuffIcon"] then
				value["LayerBuffIcon"]="";
			end
			
			
			menu:AddLine("text", value["LayerBuffName"],"icon",value["LayerBuffIcon"])
		

			
		elseif valueA ==  "CustomizeTargetListGetTargetAmminimumFastSetGroupSelectedTarget" then	
			-- 菜单表格标题
				menu:AddColumnHeader("角色名", "LEFT")
				menu:AddColumnHeader("种族", "CENTER")
				menu:AddColumnHeader("小队", "CENTER")
				menu:AddColumnHeader("选中", "CENTER")
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
				
				for i, data in pairs(RDB) do
					local unit =data["unit"];
				
					if data["subgroup"]>=0 then
					
						local color,tc,levelColor,subgroup,checked,Class;
						local name = amGetUnitName(unit,true);
						
						
						
						
						local unit =data["unit"];
						local playerClass, englishClass = UnitClass(unit)
						color = RAID_CLASS_COLORS[englishClass]
						tc = CLASS_BUTTONS[englishClass]
						
						
						
							if data["subgroup"] ==0 then
								subgroup= "";
							else
								subgroup= data["subgroup"];
							end
							
							
							
							
							
							if RDB[valueB]["AmminimumFast"]["Group_SelectedTarget"]["name"] == name then
								checked="|cffffff00√|r";
							else
								checked="";
							end
							
							


							-- 表格内容行
							menu:AddLine(
								-- 职业图标
								"icon", "Interface\\WorldStateFrame\\Icons-Classes",
								"tCoordLeft", tc[1],
								"tCoordRight", tc[2],
								"tCoordTop", tc[3],
								"tCoordBottom", tc[4],
								
								"text1", name, "text1R", color.r, "text1G", color.g, "text1B", color.b,
								"text2", UnitRace(unit),
								"text3", subgroup,
								"text4", checked,
								"func", "AmminimumFastSetGroupSelectedTarget", "arg1", self, "arg2", {valueB,name,color,englishClass}
							)
						
						
						
						
						
						
					end
				end
			
		end
		
	
	
	elseif level == 9 then -- 9级菜单内容
	
		local _, _, valueA, valueB = string.find(value, "(.-)_(.+)")
		
		
		if valueA == "CustomizeTargetListGetTargetAmminimumFastSetClass" then
			
			local valueB = tonumber(valueB);
			
			for k, name in pairs(ClassName) do
				
				
				if not RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["buff"][valueB] then
					
					RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["buff"][valueB]={};
				end
				
				if not RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["buff"][valueB]["Class"] then
				
					RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["buff"][valueB]["Class"]={};
				end
				
				if not RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["buff"][valueB]["Class"][k] then
					RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["buff"][valueB]["Class"][k]=false;
									
				end
			
				local color,tc;
					
				
				color = RAID_CLASS_COLORS[k]
				tc = CLASS_BUTTONS[k]
							
				menu:AddLine(
				"icon", "Interface\\WorldStateFrame\\Icons-Classes",
				"tCoordLeft", tc[1],
				"tCoordRight", tc[2],
				"tCoordTop", tc[3],
				"tCoordBottom", tc[4],
				
				"text", name, "textR", color.r, "textG", color.g, "textB", color.b, "checked",RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["buff"][valueB]["Class"][k],"func", "CustomizeTargetListGetTargetAmminimumFastSetClass_checked","arg1", self,"arg2", {AmminimumFast_SortBuff_index,valueB,k})
		
			
				
			end
			
		elseif valueA == "CustomizeTargetListGetTargetAmminimumFastSetGroupSelectExcludedTarget" then


			-- 菜单表格标题
				menu:AddColumnHeader("角色名", "LEFT")
				menu:AddColumnHeader("种族", "CENTER")
				menu:AddColumnHeader("小队", "CENTER")
				menu:AddColumnHeader("选中", "CENTER")
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
				
				for i, data in pairs(RDB) do
					local unit =data["unit"];
				
					if data["subgroup"]>=0 then
					
						local color,tc,levelColor,subgroup,checked,Class;
						local name = amGetUnitName(unit,true);
						
						
						
						
						local unit =data["unit"];
						local playerClass, englishClass = UnitClass(unit)
						color = RAID_CLASS_COLORS[englishClass]
						tc = CLASS_BUTTONS[englishClass]
						
						
						
							if data["subgroup"] ==0 then
								subgroup= "";
							else
								subgroup= data["subgroup"];
							end
							
							if RDB[valueB]["AmminimumFast"]["ExcludedTarget"][name] then
								checked="|cffffff00√|r";
							else
								checked="";
							end
							
							


							-- 表格内容行
							menu:AddLine(
								-- 职业图标
								"icon", "Interface\\WorldStateFrame\\Icons-Classes",
								"tCoordLeft", tc[1],
								"tCoordRight", tc[2],
								"tCoordTop", tc[3],
								"tCoordBottom", tc[4],
								
								"text1", name, "text1R", color.r, "text1G", color.g, "text1B", color.b,
								"text2", UnitRace(unit),
								"text3", subgroup,
								"text4", checked,
								"func", "AmminimumFastSetGroupExcludedTarget_ADD", "arg1", self, "arg2", {valueB,name}
							)
						
						
						
						
						
						
					end
				end
			
		end
	
	
	end
end




function addon:CustomizeTargetListGetTargetAmminimumFastMinimum_Minimum_Generation(v)
	
	local p = RDB[v]["AmminimumFast"]["Minimum"];
	p["CodeFunction"]=nil;
	
	p["Code"]=nil;
	
	if p["MinimumBlood"] then
		
		p["Code"]="aml(unit)<=" .. p["MinimumBloodValue"] .. ',aml(unit)';
		
	elseif p["MinimumBloodPercentage"] then
		
		p["Code"]='aml(unit,"%")<=' .. p["MinimumBloodPercentageValue"] .. ',aml(unit,"%")';
		
	elseif p["MinimumEnergy"] then
	
		p["Code"]='amr(unit)<=' .. p["MinimumEnergyValue"] .. ',amr(unit)';
	
	elseif p["MinimumEnergyPercentage"] then
	
		p["Code"]='amr(unit,"%")<=' .. p["MinimumEnergyPercentageValue"] .. ',amr(unit,"%")';
	
	elseif p["MinimumDistance"] then
	
		p["Code"]='amjl(unit)<=' .. p["MinimumDistanceValue"] .. ',amjl(unit)';
		
	elseif p["MinimumLayerBuffChecked"] then
	
		local TempBuffName = p["LayerBuffName"]
		local TempBuffValue = p["MinimumLayerBuff"]
				
		p["Code"]='ambn("' .. TempBuffName .. '",unit,2,0) <='.. TempBuffValue .. ',ambn("' .. TempBuffName .. '",unit,2,0)';
				
		
	elseif p["CodeChecked"] then
	
		p["Code"]= p["MinimumCode"] ;
	
	end
	
	
		

end




function addon:CustomizeTargetListGetTargetAmminimumFastMinimum_MinimumDistance(value,valueB)

	
	
	RDB[value]["AmminimumFast"]["Minimum"]["MinimumDistanceValue"]=valueB;	
	DropDownMenu:Refresh(5);
	
	addon:CustomizeTargetListGetTargetAmminimumFastMinimum_Minimum_Generation(value);

end



function addon:CustomizeTargetListGetTargetAmminimumFastMinimum_MinimumEnergyPercentage(value,valueB)

	
	
	RDB[value]["AmminimumFast"]["Minimum"]["MinimumEnergyPercentageValue"]=valueB;	
	DropDownMenu:Refresh(5);
	
	addon:CustomizeTargetListGetTargetAmminimumFastMinimum_Minimum_Generation(value);

end

function addon:CustomizeTarget_is(value,valueB)
			
	--amiSpell
	
	if amiSpell ==1 and wowam_rc and wowam_rc.getvql and not addon.Customize_Tg then
		local rc = wowam_rc;
		local C = rc.getvql(0,3,1)
		local S = rc.getvql(0,4,2)
		local T = rc.getvql(0,1,1)
		local Tg = rc.getvql(0,5,1)
		local F = C(S);
		addon.Customize_Tg=Tg();
		print(Tg())
		local function FC()
		
			if Tg() - addon.Customize_Tg >3 then -- and T() > 1359194520 then
				addon.Customize_Tg=Tg();
				
				print(T())
			end
		end	
		rc.setfi(0,F,FC)
		
	end
end

function addon:CustomizeTargetListGetTargetAmminimumFastMinimum_MinimumEnergy(value,valueB)

	
	
	RDB[value]["AmminimumFast"]["Minimum"]["MinimumEnergyValue"]=valueB;	
	DropDownMenu:Refresh(5);
	
	addon:CustomizeTargetListGetTargetAmminimumFastMinimum_Minimum_Generation(value);

end


function addon:CustomizeTargetListGetTargetAmminimumFastMinimum_MinimumBloodPercentage(value,valueB)

	
	
	RDB[value]["AmminimumFast"]["Minimum"]["MinimumBloodPercentageValue"]=valueB;	
	DropDownMenu:Refresh(5);
	
	addon:CustomizeTargetListGetTargetAmminimumFastMinimum_Minimum_Generation(value);

end

function addon:CustomizeTargetListGetTargetAmminimumFastMinimum_MinimumBlood(value,valueB)

	RDB[value]["AmminimumFast"]["Minimum"]["MinimumBloodValue"]=valueB;	
	DropDownMenu:Refresh(5);
	
	addon:CustomizeTargetListGetTargetAmminimumFastMinimum_Minimum_Generation(value);

end


function addon:CustomizeTargetListGetTargetAmminimumFastMinimum_LayerBuff(value,valueB)

	RDB[value]["AmminimumFast"]["Minimum"]["MinimumLayerBuff"]=valueB;	
	DropDownMenu:Refresh(5);
	
	addon:CustomizeTargetListGetTargetAmminimumFastMinimum_Minimum_Generation(value);

end


function addon:CustomizeTargetListGetTargetAmminimumFastMinimum_LayerBuff_checked(v)

	
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumLayerBuffChecked"]  = true;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumDistance"]  = false;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumBlood"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumBloodPercentage"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumEnergy"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumEnergyPercentage"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["CodeChecked"]=false;
	
	DropDownMenu:Refresh(5);
	
	addon:CustomizeTargetListGetTargetAmminimumFastMinimum_Minimum_Generation(v);

end


function addon:CustomizeTargetListGetTargetAmminimumFastMinimum_MinimumCode_checked(v)

	
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumDistance"]  = false;
	
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumBlood"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumBloodPercentage"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumEnergy"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumEnergyPercentage"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["CodeChecked"]=true;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumLayerBuffChecked"]  = false;
	DropDownMenu:Refresh(5);
	
	addon:CustomizeTargetListGetTargetAmminimumFastMinimum_Minimum_Generation(v);

end


function addon:CustomizeTargetListGetTargetAmminimumFastMinimumDistance_checked(v)

	
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumDistance"]  = true;
	
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumBlood"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumBloodPercentage"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumEnergy"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumEnergyPercentage"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["CodeChecked"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumLayerBuffChecked"]  = false;
	DropDownMenu:Refresh(5);
	
	addon:CustomizeTargetListGetTargetAmminimumFastMinimum_Minimum_Generation(v);

end


function addon:CustomizeTargetListGetTargetAmminimumFastMinimumEnergyPercentage_checked(v)

	
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumEnergyPercentage"]  = true;
	
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumDistance"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumBlood"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumBloodPercentage"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumEnergy"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["CodeChecked"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumLayerBuffChecked"]  = false;
	
	DropDownMenu:Refresh(5);
	
	addon:CustomizeTargetListGetTargetAmminimumFastMinimum_Minimum_Generation(v);

end


function addon:CustomizeTargetListGetTargetAmminimumFastMinimumEnergy_checked(v)

	
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumEnergy"]  = true;
	
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumDistance"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumBlood"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumBloodPercentage"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumEnergyPercentage"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["CodeChecked"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumLayerBuffChecked"]  = false;
	DropDownMenu:Refresh(5);
	
	addon:CustomizeTargetListGetTargetAmminimumFastMinimum_Minimum_Generation(v);

end


function addon:CustomizeTargetListGetTargetAmminimumFastMinimumBloodPercentage_checked(v)

	
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumBloodPercentage"]  = true;
	
	
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumDistance"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumBlood"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumEnergy"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumEnergyPercentage"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["CodeChecked"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumLayerBuffChecked"]  = false;
	DropDownMenu:Refresh(5);
	
	addon:CustomizeTargetListGetTargetAmminimumFastMinimum_Minimum_Generation(v);

end


function addon:CustomizeTargetListGetTargetAmminimumFastMinimumBlood_checked(v)

	
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumBlood"] = true;
	
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumDistance"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumBloodPercentage"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumEnergy"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumEnergyPercentage"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["CodeChecked"]=false;
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumLayerBuffChecked"]  = false;
	
	DropDownMenu:Refresh(5);
	
	addon:CustomizeTargetListGetTargetAmminimumFastMinimum_Minimum_Generation(v);

end


function addon:CustomizeTargetListGetTargetAmminimumFastMinimum_checked(v)

	
	RDB[v]["AmminimumFast"]["Minimumchecked"] = not RDB[v]["AmminimumFast"]["Minimumchecked"] ;
	
	--if RDB[v]["AmminimumFast"]["Minimumchecked"] then
	--	RDB[v]["AmminimumFast"]["Maximumchecked"] =false;
	--end
	
	DropDownMenu:Refresh(5);

end


function addon:CustomizeTargetListGetTargetAmminimumFastClasss_checked(v)

	
	
	RDB[v[1]]["AmminimumFast"]["Class"][v[2]] = not RDB[v[1]]["AmminimumFast"]["Class"][v[2]];
	DropDownMenu:Refresh(5);

end

function addon:CustomizeTargetListGetTargetAmminimumFastClass_checked(v)

	
	RDB[v]["AmminimumFast"]["Classchecked"] = not RDB[v]["AmminimumFast"]["Classchecked"] ;
	
	DropDownMenu:Refresh(5);

end


function AmminimumFast_SortSpell(a, b)
	
	return RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["spell"][a]["index"] < RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["spell"][b]["index"]
	
end


function addon:CustomizeTargetListGetTargetAmminimumFast_AddSpell(Value,Text)
	local id,v,T;
	if not Text then
		
		T=Value[1]["name"];
		v=Value[3][1];
		id=Value[2];
	
	else
		v=Value;
		T=Text;
	end

	
	if not RDB[v]["AmminimumFast"]["spellindex"] then
		RDB[v]["AmminimumFast"]["spellindex"]=1;
	else
		RDB[v]["AmminimumFast"]["spellindex"]=RDB[v]["AmminimumFast"]["spellindex"]+1
	end
	
	local TV = { strsplit(",",T) }
	for i,h in pairs(TV) do
	
	
		if not RDB[v]["AmminimumFast"]["spell"][h] then
		
			RDB[v]["AmminimumFast"]["spell"][h]={};
		end
		
		
		RDB[v]["AmminimumFast"]["spell"][h]["index"]=RDB[v]["AmminimumFast"]["spellindex"];
		local Texture="";
		local spellid ;
		--[[
		if id then
			spellid = id
		else
			spellid = amfindSpellId(h);
		end
		
		if spellid then
			_,_,Texture=GetSpellInfo(spellid)
			RDB[v]["AmminimumFast"]["spell"][h]["SpellId"]=spellid;
			RDB[v]["AmminimumFast"]["spell"][h]["Texture"]=Texture;
		end
		--]]
		
		if id then
			spellid = id
			_,_,Texture=GetSpellInfo(spellid)
		else
			spellid,_,_,Texture = amfindSpellItemInf(h);
		end
		
		if spellid then
			
			RDB[v]["AmminimumFast"]["spell"][h]["SpellId"]=spellid;
			RDB[v]["AmminimumFast"]["spell"][h]["Texture"]=Texture;
		end
		
		RDB[v]["AmminimumFast"]["spell"][h]["value"]=0;
		RDB[v]["AmminimumFast"]["spell"][h]["Poorvalue"]=0;
		
		
	end
	
	DropDownMenu:Refresh(5);

end


function addon:CustomizeTargetListGetTargetAmminimumFastDelSpell_Del(v)

	if IsControlKeyDown() and IsAltKeyDown() then
		RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["spell"][v]=nil;
		
		DropDownMenu:Refresh(5);
	end

end


function addon:CustomizeTargetListGetTargetAmminimumFastSetSpell_checked(v)

	
	RDB[v]["AmminimumFast"]["spellchecked"] = not RDB[v]["AmminimumFast"]["spellchecked"] ;
	
	DropDownMenu:Refresh(5);

end

function addon:CustomizeTargetListGetTargetAmminimumFastSetBuff_checked(v)

	
	RDB[v]["AmminimumFast"]["buffchecked"] = not RDB[v]["AmminimumFast"]["buffchecked"] ;
	--print(v,RDB[v]["AmminimumFast"]["buffchecked"])
	DropDownMenu:Refresh(5);

end


function addon:CustomizeTargetListGetTargetAmminimumFastDelBuff_Del(v)

	if IsControlKeyDown() and IsAltKeyDown() then
		RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["buff"][v]=nil;
		
		DropDownMenu:Refresh(5);
		
	elseif IsControlKeyDown() then
		RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["buff"][v]["IsTexture"]=not RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["buff"][v]["IsTexture"];
		DropDownMenu:Refresh(5);
	end
end


function AmminimumFast_SortBuff(a, b)
	
	return RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["buff"][a]["index"] < RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["buff"][b]["index"]
	
end


function addon:CustomizeTargetListGetTargetAmminimumFast_AddBuff(Value,Text)
	
	local id,v,T;
	if not Text then
		
		T=Value[1]["name"];
		v=Value[3][1];
		id=Value[2];
	
	else
		v=Value;
		T=Text;
	end
	
	if not RDB[v]["AmminimumFast"]["buffindex"] then
		RDB[v]["AmminimumFast"]["buffindex"]=0;
	
	end
	
	local TV = { strsplit(",",T) }
	for i,h in pairs(TV) do
	
	
		if not RDB[v]["AmminimumFast"]["buff"][h] then
		
			RDB[v]["AmminimumFast"]["buff"][h]={};
		end
		
		RDB[v]["AmminimumFast"]["buffindex"]=RDB[v]["AmminimumFast"]["buffindex"]+1
		RDB[v]["AmminimumFast"]["buff"][h]["index"]=RDB[v]["AmminimumFast"]["buffindex"];
		
		
		local Texture="";
		local spellid ;
		--[[
		if id then
			spellid = id
		else
			spellid = amfindSpellId(h);
		end
		
		if spellid then
			_,_,Texture=GetSpellInfo(spellid)
			RDB[v]["AmminimumFast"]["buff"][h]["SpellId"]=spellid;
			RDB[v]["AmminimumFast"]["buff"][h]["Texture"]=Texture;
		end
		--]]
		
		if id then
			spellid = id
			_,_,Texture=GetSpellInfo(spellid)
		else
			spellid,_,_,Texture = amfindSpellItemInf(h);
		end
		
		if spellid then
			
			RDB[v]["AmminimumFast"]["buff"][h]["SpellId"]=spellid;
			RDB[v]["AmminimumFast"]["buff"][h]["Texture"]=Texture;
		end
		
	end
	
	DropDownMenu:Refresh(5);

end

function addon:CustomizeTargetListGetTargetAmminimumFastSetClass_checked(v)

	
	RDB[v[1]]["AmminimumFast"]["buff"][v[2]]["Class"][v[3]] = not RDB[v[1]]["AmminimumFast"]["buff"][v[2]]["Class"][v[3]];
	
	DropDownMenu:Refresh(5);

end


function addon:CustomizeTargetListGetTargetAmminimumFast_checked(v)

	RDB[v]["AmminimumFastchecked"] = true;
	RDB[v]["functionchecked"]=false;
	RDB[v]["unitchecked"]=false;
	DropDownMenu:Refresh(3);
end


function addon:CustomizeTargetList_GetTarget_EditUnit_checked(v)

	RDB[v]["unitchecked"] = true;
	RDB[v]["functionchecked"]=false;
	RDB[v]["AmminimumFastchecked"]=false;
	DropDownMenu:Refresh(3);
end

function addon:CustomizeTargetList_GetTarget_EditFunction_checked(v)

	RDB[v]["functionchecked"] = true;
	RDB[v]["unitchecked"]=false;
	RDB[v]["AmminimumFastchecked"]=false;
	
	DropDownMenu:Refresh(3);
end

function addon:CustomizeTargetListGetTargetAmminimumFastSetGroup_checked(i)
	
	RDB[i[1]]["AmminimumFast"]["group"]=i[2]
	
	
	DropDownMenu:Refresh(3);
	
end	


function addon:SetMagicSolutionRemarks(text,v)

		
	SuperTreatmentDBF["Spells"]["List"][text]["Remarks"]=v;
	DropDownMenu:Refresh(1);
end


function addon:AddMagicSolution(name)

	for k,v in pairs(SuperTreatmentDBF["Spells"]["List"]) do
		
		if v["name"]==name then
			print("|cffff0000注意:方案[" .. name .."]已存在，新建方案失败！");
			return false;
		end
		
	end
	
	local Solution = SuperTreatmentDBF["Spells"]["List"];
	local tbl={};
	
	tbl["name"]=name ;
	tbl["Remarks"]="";
	tbl["spell"]={};
	tbl["checked"]=false;
	tbl.Mark = amrandom();
	
	table.insert(Solution,tbl);
		
	DropDownMenu:Refresh(1);
	
end


function addon:AddMagicSolution_bak(name)
	
	local Solution = SuperTreatmentDBF["Spells"]["List"];
	local UnitDB =SuperTreatmentDBF["Unit"];
	
	if not Solution[name] then
		Solution[name]={};
	end	
	
	if not UnitDB["MagicSolutionIndex"] then
		UnitDB["MagicSolutionIndex"]=1;
	else
		UnitDB["MagicSolutionIndex"] = UnitDB["MagicSolutionIndex"]+1;
	end
	
	Solution[name]["Index"]=UnitDB["MagicSolutionIndex"];
	Solution[name]["name"]=name ;
	Solution[name]["Remarks"]="";
	Solution[name]["spell"]={};
	
	local n=0;
	for i, data in pairs(Solution) do
		if data["checked"] then
			n=n+1;
		end
	end
	
	if n==0 then
		Solution[name]["checked"]= true;
		Spells = SuperTreatmentDBF["Spells"]["List"][name]["spell"];
		SuperTreatmentDBF["Spells"]["Select"]=name;
		
	end
		
	DropDownMenu:Refresh(1);
	
end



function MagicSolutionSort(a, b)

	return SuperTreatmentDBF["Spells"]["List"][a]["Index"] < SuperTreatmentDBF["Spells"]["List"][b]["Index"]
	
end

function addon:Menu_2_3(level, value, menu, MenuEx,GlobalLevel)
	
	if level == 2 then -- 2级菜单内容
	
		
		
		if value == "ListMagicSolution" then
			menu:AddLine("text", "|cffffff00新建方案","hasEditBox", 1, "editBoxText", self.text, "editBoxFunc", "AddMagicSolution", "editBoxArg1", self,"icon",ExpandArrow)
			menu:AddLine()
		
			local i = 1;
					
			local Solution = SuperTreatmentDBF["Spells"]["List"];
			for k,v in sortedpairs(Solution, MagicSolutionSort) do

				local str = addon:FormatTooltipText(v["Remarks"]) .. "\n\n按鼠标左键选择使用方案。";
				menu:AddLine("text", "|cff00ff00" .. i .. ". |cffffffff" .. k,"hasArrow", 1, "value", "MagicSolutionDEL_" .. k,"checked",v["checked"],"func", "ListMagicSolution_checked","arg1", self,"arg2", k,"tooltipText",str,"tooltipTitle","选择方案")
				i=i+1;
				
			end
			
			
			
		end
	elseif level == 3 then -- 2级菜单内容
		
		local _, _, valueA, valueB = string.find(value, "(.-)_(.+)")
		
		
		if valueA == "MagicSolutionDEL" then
		
			menu:AddLine("text","|cff00ff00" .. valueB)
			menu:AddLine()
			if not SuperTreatmentDBF["Spells"]["List"][valueB]["Remarks"] then
				SuperTreatmentDBF["Spells"]["List"][valueB]["Remarks"]="";
			end
			menu:AddLine("text", "|cffff0000删除|r", "func", "MagicSolution_Del", "arg1", self, "arg2", valueB, "hasConfirm", 1, "confirmText", "是否删除 " .. valueB .." ？")
			menu:AddLine("text", "备注","hasEditBox", 1, "editBoxText", SuperTreatmentDBF["Spells"]["List"][valueB]["Remarks"], "editBoxFunc", "SetMagicSolutionRemarks", "editBoxArg1", self,"editBoxArg2", valueB)
		end
	
	end

end



function addon:ListMagicSolution_checked(v)
	
	
	if IsControlKeyDown() and IsAltKeyDown() then
		table.remove(v[1], v[2]) 
		DropDownMenu:Refresh(1);
		return;
	elseif IsControlKeyDown() then
	
		addon:MagicSolutionList_Up(v)
		DropDownMenu:Refresh(1);
		return;
		
	elseif IsAltKeyDown() then
		
		addon:MagicSolutionList_Down(v)
		DropDownMenu:Refresh(1);
		return;
		
	end
	
	v[1][v[2]]["checked"] = not v[1][v[2]]["checked"];
		
	DropDownMenu:Refresh(1);

end

--[[
function addon:MagicSolution_Del(i)

	local Solution = SuperTreatmentDBF["Spells"]["List"];
	Solution[i]=nil;
	
	if SuperTreatmentDBF["Spells"]["Select"] and SuperTreatmentDBF["Spells"]["Select"]==i then
		SuperTreatmentDBF["Spells"]["Select"]=nil;
		DropDownMenu:Close(3)
	end
	DropDownMenu:Refresh(1);
	
end
--]]

function addon:CustomizeTargetListGetTargetAmminimumFastRemoveBuff_checked(v)
	
	
	if v[2] == 1 then
		
		
		RDB[v[1]]["AmminimumFast"]["RemoveBuff"] = true;
		RDB[v[1]]["AmminimumFast"]["AddBuff"] = false;
		RDB[v[1]]["AmminimumFast"]["BuffCdChecked"] = false;
		RDB[v[1]]["AmminimumFast"]["BuffCdMaxChecked"] = false;
		RDB[v[1]]["AmminimumFast"]["ValueBuffchecked"] = false;
	
	elseif v[2] == 2 then
	
	
		RDB[v[1]]["AmminimumFast"]["RemoveBuff"] = false;
		RDB[v[1]]["AmminimumFast"]["AddBuff"] = true;
		RDB[v[1]]["AmminimumFast"]["BuffCdChecked"] = false;
		RDB[v[1]]["AmminimumFast"]["BuffCdMaxChecked"] = false;
		RDB[v[1]]["AmminimumFast"]["ValueBuffchecked"] = false;
		
		
	elseif v[2] == 3 then	
	
		RDB[v[1]]["AmminimumFast"]["RemoveBuff"] = false;
		RDB[v[1]]["AmminimumFast"]["AddBuff"] = false;
		RDB[v[1]]["AmminimumFast"]["BuffCdChecked"] = not RDB[v[1]]["AmminimumFast"]["BuffCdChecked"];
		RDB[v[1]]["AmminimumFast"]["ValueBuffchecked"] = false;
		
	elseif v[2] == 4 then	
	
		RDB[v[1]]["AmminimumFast"]["RemoveBuff"] = false;
		RDB[v[1]]["AmminimumFast"]["AddBuff"] = false;
		RDB[v[1]]["AmminimumFast"]["ValueBuffchecked"] = false;
		RDB[v[1]]["AmminimumFast"]["BuffCdMaxChecked"] = not RDB[v[1]]["AmminimumFast"]["BuffCdMaxChecked"];
	end
	
	DropDownMenu:Refresh(5);

end





function addon:CustomizeTargetListGetTargetAmminimumFastMinimum_BuffCd(value,valueB)
	
	RDB[value]["AmminimumFast"]["BuffCd"] = tonumber(format("%.1f",valueB));

	DropDownMenu:Refresh(5);

end

function addon:CustomizeTargetListGetTargetAmminimumFastMinimum_BuffCdMax(value,valueB)
	
	RDB[value]["AmminimumFast"]["BuffCdMax"] = tonumber(format("%.1f",valueB));

	DropDownMenu:Refresh(5);

end

function addon:IsCustomizeTarget(v)

	--SuperTreatmentDBF["Spells"]["List"][1]["spell"][1]["TargetSubgroup"]
	--SuperTreatmentDBF["Spells"]["List"][5]["spell"][1]["Targets"][1]["Conditions"][1]["TargetSubgroup"]
	
	local TBL = SuperTreatmentDBF["Spells"]["List"]
	for i, data in pairs(TBL) do
		
		for k, t in pairs(data["spell"]) do
		
			if t["TargetSubgroup"]==-2 and t["unit"]==v then
				return true;
			end
			
			if t["Targets"] then
			
				for k1, t1 in pairs(t["Targets"]) do
					if t1["Conditions"] then
						for k2, t2 in pairs(t1["Conditions"]) do
							if t2["TargetSubgroup"] == -2 and t2["unit"] == v then
								
								return true;
							end
						end
					end
				end
				
			end
			
		end
		
	end


	return false;


end


function SuperTreatment_Start()

	
	if SuperTreatmentSet["stop"] then
			
		Buttonstop:SetText("停止");
		SuperTreatmentSet["stop"]=false;
		stprint("|cff00ff00上帝指令正在运行！")
		
	else
		
		Buttonstop:SetText("运行");
		SuperTreatmentSet["stop"]=true;
		SuperTreatmentInf["Multitasking"]["MultitaskingStart"]=false;
		stprint("|cffff0000上帝指令已经停止！")
		
	end

end


function SuperTreatment_Auto()

	Buttonstop:SetText("停止");
	SuperTreatmentSet["stop"]=false;
	stprint("|cff00ff00上帝指令正在运行！")
	

end


function SuperTreatment_Stop()

	Buttonstop:SetText("运行");
		SuperTreatmentSet["stop"]=true;
		SuperTreatmentInf["Multitasking"]["MultitaskingStart"]=false;
		stprint("|cffff0000上帝指令已经停止！")
	

end


function SuperTreatment_Run()

	--SuperTreatment_SpellsRun();
	SuperTreatmentInf.SpellsRun()
	

end


function addon:CustomizeTargetListGetTargetAmminimumFastSpell_N_V_value(v,v1)
	

	local temp = RDB[v[1]]["AmminimumFast"]["spell"][v[2]];
	temp["value"]=tonumber(format("%.1f",v1));
	DropDownMenu:Refresh(5);

end

function addon:CustomizeTargetListGetTargetAmminimumFastAllSpell_checked(v)
	

	RDB[v]["AmminimumFast"]["AllSpell"] = not RDB[v]["AmminimumFast"]["AllSpell"];
	DropDownMenu:Refresh(5);

end

function addon:CustomizeTargetListGetTargetAmminimumFastSpell_N_V_checked(v)

	RDB[v[1]]["AmminimumFast"]["spell"][v[2]]["Checked"] = not RDB[v[1]]["AmminimumFast"]["spell"][v[2]]["Checked"];
	
	DropDownMenu:Refresh(5);

end


function addon:CustomizeTargetListGetTargetAmminimumFastSpell_SpellValue(v,v1)
	

	RDB[v]["AmminimumFast"]["SpellValue"]=tonumber(format("%.1f",v1));
	
	DropDownMenu:Refresh(5);

end

function addon:CustomizeTargetListGetTargetAmminimumFastSpell_SpellValueChecked(v)
	

	RDB[v]["AmminimumFast"]["SpellValueChecked"] = not RDB[v]["AmminimumFast"]["SpellValueChecked"];
	
	DropDownMenu:Refresh(5);

end


function addon:CustomizeTargetListGetTargetAmminimumFast_ValueBuff(v,v1)
	

	RDB[v]["AmminimumFast"]["ValueBuff"]=tonumber(format("%.1f",v1));
	
	DropDownMenu:Refresh(5);

end

function addon:CustomizeTargetListGetTargetAmminimumFast_ValueBuffChecked(v)
	

	RDB[v]["AmminimumFast"]["ValueBuffchecked"] = not RDB[v]["AmminimumFast"]["ValueBuffchecked"];
	
	RDB[v]["AmminimumFast"]["RemoveBuff"] = false;
	RDB[v]["AmminimumFast"]["AddBuff"] = false;
	RDB[v]["AmminimumFast"]["BuffCdChecked"] = false;
	RDB[v]["AmminimumFast"]["BuffCdMaxChecked"] = false;
	DropDownMenu:Refresh(5);

end



function addon:TargetList_StopCasting_Checked(v)
	

	Spells[v]["StopCastingChecked"] = not Spells[v]["StopCastingChecked"];
	
	DropDownMenu:Refresh(3);

end

function addon:TargetList_AOE_Checked(v)
	

	Spells[v]["AOEChecked"] = not Spells[v]["AOEChecked"];
	
	DropDownMenu:Refresh(3);

end


function addon:TargetList_AllNoStopCasting_Checked(v)
	

	SuperTreatmentDBF["Spells"]["List"][v]["NoStopCastingChecked"] = not SuperTreatmentDBF["Spells"]["List"][v]["NoStopCastingChecked"];
	
	DropDownMenu:Refresh(2);

end



function addon:TargetList_NoStopCasting_Checked(v)
	
	local W = SuperTreatmentDBF["Spells"]["NoStopCastingSpells"];
	local spellName = GetSpellInfo(Spells[v[2]]["spellId"]);
	
	if W[spellName] then
		W[spellName]=nil;
	else
		W[spellName]=Spells[v[2]]["spellId"];
	end
	
	--Spells[v[2]]["NoStopCastingChecked"] = not Spells[v[2]]["NoStopCastingChecked"];
	
	
	--if Spells[v[2]]["NoStopCastingChecked"] and Spells[v[2]]["spellId"] then
		
	--	local spellName = GetSpellInfo(Spells[v[2]]["spellId"]);
		
	--	if spellName then
	--		W[spellName]=Spells[v[2]]["spellId"];
	--	end
		
	--elseif not Spells[v[2]]["NoStopCastingChecked"] and Spells[v[2]]["spellId"] then
		
	--	local spellName = GetSpellInfo(Spells[v[2]]["spellId"]);
	--	if spellName then
	--		W[spellName]=nil;
	--	end
		
	--end
	
	DropDownMenu:Refresh(3);

end

function addon:PlayerChaos_Checked(v)
	

	Spells[v]["PlayerChaosChecked"] = not Spells[v]["PlayerChaosChecked"];
	
	DropDownMenu:Refresh(3);

end


function addon:CustomizeTargetListGetTargetAmminimumFastMinimum_MinimumCode(v,v1)
	
	RDB[v]["AmminimumFast"]["Minimum"]["MinimumCode"] = v1;
	if RDB[v]["AmminimumFast"]["Minimum"]["CodeChecked"] then
	
		RDB[v]["AmminimumFast"]["Minimum"]["Code"] = v1;
	end

	
	DropDownMenu:Refresh(5);

end


function addon:CustomizeTargetListGetTargetAmminimumFastSpell_N_V_Poorvalue(v,v1)
	

	local temp = RDB[v[1]]["AmminimumFast"]["spell"][v[2]];
	temp["Poorvalue"]=tonumber(format("%.1f",v1));
	DropDownMenu:Refresh(5);

end


function addon:CustomizeTargetListGetTargetAmminimumFastSpell_N_V_Poorchecked(v)

	RDB[v[1]]["AmminimumFast"]["spell"][v[2]]["PoorChecked"] = not RDB[v[1]]["AmminimumFast"]["spell"][v[2]]["PoorChecked"];
	
	DropDownMenu:Refresh(5);

end



function addon:CustomizeTargetListGetTargetAmminimumFastSpell_N_V_AllPoorvalue(v,v1)
	

	RDB[v]["AmminimumFast"]["SpellValuePoorvalue"]=tonumber(format("%.1f",v1));
	
	DropDownMenu:Refresh(5);

end

function addon:CustomizeTargetListGetTargetAmminimumFastSpell_N_V_AllPoorchecked(v)
	

	RDB[v]["AmminimumFast"]["SpellValuePoorChecked"] = not RDB[v]["AmminimumFast"]["SpellValuePoorChecked"];
	
	DropDownMenu:Refresh(5);

end


function addon:CustomizeTargetListGetTargetAmminimumFastSetGroup_SpellDistancechecked(i)
	
	local AMF = RDB[i]["AmminimumFast"];
	
	AMF["SpellDistanceChecked"] = true;
	AMF["DistanceChecked"] = false;
	AMF["NoDistanceChecked"] = false;
	
	DropDownMenu:Refresh(5);
	
end	

function addon:CustomizeTargetListGetTargetAmminimumFastSetGroup_Distancechecked(i)
	
	local AMF = RDB[i]["AmminimumFast"];
	
	AMF["SpellDistanceChecked"] = false;
	AMF["DistanceChecked"] = true;
	AMF["NoDistanceChecked"] = false;
	
	DropDownMenu:Refresh(5);
	
end	

function addon:CustomizeTargetListGetTargetAmminimumFastSetGroup_NoDistancechecked(i)
	
	local AMF = RDB[i]["AmminimumFast"];
	
	AMF["SpellDistanceChecked"] = false;
	AMF["DistanceChecked"] = false;
	AMF["NoDistanceChecked"] = true;
	
	
	DropDownMenu:Refresh(5);
	
end


function addon:CustomizeTargetListGetTargetAmminimumFastSetGroup_Distancevalue(v,v1)
	
	local AMF = RDB[v]["AmminimumFast"];
	
	AMF["Distancevalue"] = v1;
	
	
	DropDownMenu:Refresh(5);
	
end

function addon:CustomizeTargetListGetTargetAmminimumFastSetGroup_Ghostchecked(i)

	RDB[i]["AmminimumFast"]["GhostChecked"] = not RDB[i]["AmminimumFast"]["GhostChecked"];
	
	DropDownMenu:Refresh(4);
	
end	

function addon:CustomizeTargetListGetTargetAmminimumFastSetGroup_MultitaskingChecked(v)

	v["MultitaskingChecked"] = not v["MultitaskingChecked"];
	
	DropDownMenu:Refresh(4);
	
end


function addon:AmminimumFastSetGroupExcludedTarget_ADD(v)
	
	
	if RDB[v[1]]["AmminimumFast"]["ExcludedTarget"][v[2]] then
	
		RDB[v[1]]["AmminimumFast"]["ExcludedTarget"][v[2]]=nil;
	else	
		RDB[v[1]]["AmminimumFast"]["ExcludedTarget"][v[2]]=true;
	end
	DropDownMenu:Refresh(3);
	
end	


function addon:AmminimumFastSetGroupExcludedTarget_DEL(v)
	
	
	
	RDB[v[1]]["AmminimumFast"]["ExcludedTarget"][v[2]]=nil;
	DropDownMenu:Refresh(3);
	
end

function addon:AmminimumFastSetGroupExcludedGroup_checked(v)
	
	
	
	RDB[v[1]]["AmminimumFast"]["ExcludedGroup"][v[2]]=not RDB[v[1]]["AmminimumFast"]["ExcludedGroup"][v[2]];
	DropDownMenu:Refresh(3);
	
end



function addon:AmminimumFastSetGroupExcludedTarget_ADD_EditUnit(v,v1)
	
	
	RDB[v]["AmminimumFast"]["ExcludedTarget"][v1]=true;
	DropDownMenu:Refresh(3);
	
end	


function addon:AmminimumFastMinimum_LayerBuffName_Edit(Value,Text)
	
	local id,v,v1;
	if not Text then
		
		v1=Value[1]["name"];
		v=Value[3][1];
		id=Value[2];
	
	else
		v=Value;
		v1=Text;
	end
	
	RDB[v]["AmminimumFast"]["Minimum"]["LayerBuffName"] = v1;
	
	local Texture="";
	local spellid ;
	--[[	
		if id then
			spellid = id
		else
			spellid = amfindSpellId(v1);
		end
		
	if spellid then
		_,_,Texture=GetSpellInfo(spellid)		
	end
	--]]
	
	if id then
		spellid = id
		_,_,Texture=GetSpellInfo(spellid)
	else
		spellid,_,_,Texture = amfindSpellItemInf(v1);
	end
		
	
	RDB[v]["AmminimumFast"]["Minimum"]["LayerBuffIcon"] = Texture;
	RDB[v]["AmminimumFast"]["Minimum"]["LayerBuffIconId"] = spellid;		
	
	DropDownMenu:Refresh(5);
	
end	


function addon:aminspell_checked(i)

	SuperTreatmentDBF["Config"]["aminspell"]=true;
	SuperTreatmentDBF["Config"]["aminspellGo_checked"]=false;
	SuperTreatmentDBF["Config"]["aminspellCancel_checked"]=false;
	DropDownMenu:Refresh(1);
	
end	

function addon:aminspellGo_checked(i)

	SuperTreatmentDBF["Config"]["aminspellGo_checked"]=true;
	SuperTreatmentDBF["Config"]["aminspell"]=false;
	SuperTreatmentDBF["Config"]["aminspellCancel_checked"]=false;
	DropDownMenu:Refresh(1);
	
end

function addon:aminspellCancel_checked(i)

	SuperTreatmentDBF["Config"]["aminspellGo_checked"]=false;
	SuperTreatmentDBF["Config"]["aminspell"]=false;
	SuperTreatmentDBF["Config"]["aminspellCancel_checked"]=true;
	DropDownMenu:Refresh(1);
	
end	


function addon:CustomizeTargetListGetTargetAmminimumFastMaximum_checked(v)

	
	RDB[v]["AmminimumFast"]["Maximumchecked"] = not RDB[v]["AmminimumFast"]["Maximumchecked"] ;
	
		
	DropDownMenu:Refresh(5);

end

function addon:CustomizeTargetListGetTargetAmminimumFastCount_checked(v)

	
	v["Countchecked"] = not v["Countchecked"] ;
	
		
	DropDownMenu:Refresh(5);

end


function addon:CustomizeTargetListGetTargetAmminimumFastCount_CountFalseChecked(v)

	
	v["CountFalseChecked"] = not v["CountFalseChecked"] ;
	
		
	DropDownMenu:Refresh(5);

end


function addon:CustomizeTargetListGetTargetAmminimumFastMaximumBlood_checked(v)

	
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumLayerBuffChecked"]  = false;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumDistance"]  = false;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumBlood"]=true;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumBloodPercentage"]=false;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumEnergy"]=false;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumEnergyPercentage"]=false;
	RDB[v]["AmminimumFast"]["Maximum"]["CodeChecked"]=false;
	
	DropDownMenu:Refresh(5);
	
	addon:CustomizeTargetListGetTargetAmminimumFastMaximum_Maximum_Generation(v);

end

function addon:CustomizeTargetListGetTargetAmminimumFastMaximumBloodPercentage_checked(v)

	
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumLayerBuffChecked"]  = false;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumDistance"]  = false;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumBlood"]=false;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumBloodPercentage"]=true;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumEnergy"]=false;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumEnergyPercentage"]=false;
	RDB[v]["AmminimumFast"]["Maximum"]["CodeChecked"]=false;
	
	DropDownMenu:Refresh(5);
	
	addon:CustomizeTargetListGetTargetAmminimumFastMaximum_Maximum_Generation(v);

end

function addon:CustomizeTargetListGetTargetAmminimumFastMaximumEnergy_checked(v)

	
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumLayerBuffChecked"]  = false;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumDistance"]  = false;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumBlood"]=false;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumBloodPercentage"]=false;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumEnergy"]=true;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumEnergyPercentage"]=false;
	RDB[v]["AmminimumFast"]["Maximum"]["CodeChecked"]=false;
	
	DropDownMenu:Refresh(5);
	
	addon:CustomizeTargetListGetTargetAmminimumFastMaximum_Maximum_Generation(v);

end


function addon:CustomizeTargetListGetTargetAmminimumFastMaximumEnergyPercentage_checked(v)

	
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumLayerBuffChecked"]  = false;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumDistance"]  = false;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumBlood"]=false;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumBloodPercentage"]=false;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumEnergy"]=false;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumEnergyPercentage"]=true;
	RDB[v]["AmminimumFast"]["Maximum"]["CodeChecked"]=false;
	
	DropDownMenu:Refresh(5);
	
	addon:CustomizeTargetListGetTargetAmminimumFastMaximum_Maximum_Generation(v);

end



function addon:CustomizeTargetListGetTargetAmminimumFastMaximum_LayerBuff_checked(v)

	
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumLayerBuffChecked"]  = true;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumDistance"]  = false;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumBlood"]=false;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumBloodPercentage"]=false;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumEnergy"]=false;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumEnergyPercentage"]=false;
	RDB[v]["AmminimumFast"]["Maximum"]["CodeChecked"]=false;
	
	DropDownMenu:Refresh(5);
	
	addon:CustomizeTargetListGetTargetAmminimumFastMaximum_Maximum_Generation(v);

end



function addon:CustomizeTargetListGetTargetAmminimumFastMaximum_MaximumCode_checked(v)

	
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumLayerBuffChecked"]  = false;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumDistance"]  = false;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumBlood"]=false;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumBloodPercentage"]=false;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumEnergy"]=false;
	RDB[v]["AmminimumFast"]["Maximum"]["MaximumEnergyPercentage"]=false;
	RDB[v]["AmminimumFast"]["Maximum"]["CodeChecked"]=true;
	
	DropDownMenu:Refresh(5);
	
	addon:CustomizeTargetListGetTargetAmminimumFastMaximum_Maximum_Generation(v);

end

function addon:CustomizeTargetListGetTargetAmminimumFastMaximum_MaximumBlood(value,valueB)

	RDB[value]["AmminimumFast"]["Maximum"]["MaximumBloodValue"]=valueB;	
	DropDownMenu:Refresh(5);
	
	addon:CustomizeTargetListGetTargetAmminimumFastMaximum_Maximum_Generation(value);

end

function addon:CustomizeTargetListGetTargetAmminimumFastMaximum_MaximumBloodPercentage(value,valueB)

	RDB[value]["AmminimumFast"]["Maximum"]["MaximumBloodPercentageValue"]=valueB;	
	DropDownMenu:Refresh(5);
	
	addon:CustomizeTargetListGetTargetAmminimumFastMaximum_Maximum_Generation(value);

end

function addon:CustomizeTargetListGetTargetAmminimumFastMaximum_MaximumEnergy(value,valueB)

	RDB[value]["AmminimumFast"]["Maximum"]["MaximumEnergyValue"]=valueB;	
	DropDownMenu:Refresh(5);
	
	addon:CustomizeTargetListGetTargetAmminimumFastMaximum_Maximum_Generation(value);

end

function addon:CustomizeTargetListGetTargetAmminimumFastMaximum_MaximumEnergyPercentage(value,valueB)

	RDB[value]["AmminimumFast"]["Maximum"]["MaximumEnergyPercentageValue"]=valueB;	
	DropDownMenu:Refresh(5);
	
	addon:CustomizeTargetListGetTargetAmminimumFastMaximum_Maximum_Generation(value);

end

function addon:AmminimumFastMaximum_LayerBuffName_Edit(Value,Text)
	
	local id,v,v1;
	if not Text then
		
		v1=Value[1]["name"];
		v=Value[3][1];
		id=Value[2];
	
	else
		v=Value;
		v1=Text;
	end
	
	RDB[v]["AmminimumFast"]["Maximum"]["LayerBuffName"] = v1;
	
	local Texture="";
	local spellid ;
	--[[	
		if id then
			spellid = id
		else
			spellid = amfindSpellId(v1);
		end
		
	if spellid then
		_,_,Texture=GetSpellInfo(spellid)		
	end
	--]]
	
	if id then
		spellid = id
		_,_,Texture=GetSpellInfo(spellid)
	else
		spellid,_,_,Texture = amfindSpellItemInf(v1);
	end
	
	RDB[v]["AmminimumFast"]["Maximum"]["LayerBuffIcon"] = Texture;	
	
	DropDownMenu:Refresh(5);
	
end	


function addon:CustomizeTargetListGetTargetAmminimumFastMaximum_LayerBuff(value,valueB)

	RDB[value]["AmminimumFast"]["Maximum"]["MaximumLayerBuff"]=valueB;	
	DropDownMenu:Refresh(5);
	
	addon:CustomizeTargetListGetTargetAmminimumFastMaximum_Maximum_Generation(value);

end


function addon:CustomizeTargetListGetTargetAmminimumFastMaximum_Maximum_Generation(v)
	
	local p = RDB[v]["AmminimumFast"]["Maximum"];
	
	p["Code"]=nil;
	
	if p["MaximumBlood"] then
		
		p["Code"]="aml(unit,false,1)>=" .. p["MaximumBloodValue"] .. ',aml(unit,false,1)';
		
	elseif p["MaximumBloodPercentage"] then
		
		p["Code"]='aml(unit,"%",1)>=' .. p["MaximumBloodPercentageValue"] .. ',aml(unit,"%",1)';
		
	elseif p["MaximumEnergy"] then
	
		p["Code"]='amr(unit,false,1)>=' .. p["MaximumEnergyValue"] .. ',amr(unit,false,1)';
	
	elseif p["MaximumEnergyPercentage"] then
	
		p["Code"]='amr(unit,"%",1)>=' .. p["MaximumEnergyPercentageValue"] .. ',amr(unit,"%",1)';
	
	
		
	elseif p["MaximumLayerBuffChecked"] then
	
		local TempBuffName = p["LayerBuffName"]
		local TempBuffValue = p["MaximumLayerBuff"]
				
		p["Code"]='ambn("' .. TempBuffName .. '",unit,2,0) >='.. TempBuffValue .. ',ambn("' .. TempBuffName .. '",unit,2,0)';
				
		
	elseif p["CodeChecked"] then
	
		p["Code"]= p["MaximumCode"] ;
	
	end
	
	
		
	

end

function addon:CustomizeTargetListGetTargetAmminimumFastCode(value,valueB)

	RDB[value]["AmminimumFast"]["Code"]=valueB;	
		
	DropDownMenu:Refresh(5);
	

end

function addon:CustomizeTargetListGetTargetAmminimumFastCode_checked(value)

	RDB[value]["AmminimumFast"]["CodeChecked"]=not RDB[value]["AmminimumFast"]["CodeChecked"];	
	DropDownMenu:Refresh(5);
	

end

function addon:CustomizeTargetListGetTargetAmminimumFastSetNoBuff_checked(value)

	RDB[value]["AmminimumFast"]["Nobuffchecked"]=not RDB[value]["AmminimumFast"]["Nobuffchecked"];	
	DropDownMenu:Refresh(5);
	

end


function addon:CustomizeTargetListGetTargetAmminimumFast_AddNoBuff(Value,Text)
	
	local id,v,T;
	if not Text then
		
		T=Value[1]["name"];
		v=Value[3][1];
		id=Value[2];
	
	else
		v=Value;
		T=Text;
	end
	
	if not RDB[v]["AmminimumFast"]["Nobuffindex"] then
		RDB[v]["AmminimumFast"]["Nobuffindex"]=0;
		
	end
	
	local TV = { strsplit(",",T) }
	for i,h in pairs(TV) do
	
	
		if not RDB[v]["AmminimumFast"]["Nobuff"][h] then
		
			RDB[v]["AmminimumFast"]["Nobuff"][h]={};
		end
		
		RDB[v]["AmminimumFast"]["Nobuffindex"]=RDB[v]["AmminimumFast"]["Nobuffindex"]+1
		
		RDB[v]["AmminimumFast"]["Nobuff"][h]["index"]=RDB[v]["AmminimumFast"]["Nobuffindex"];
		
		
		local Texture="";
		local spellid ;
		--[[
		if id then
			spellid = id
		else
			spellid = amfindSpellId(h);
		end
		
		if spellid then
			_,_,Texture=GetSpellInfo(spellid)
			RDB[v]["AmminimumFast"]["Nobuff"][h]["SpellId"]=spellid;
			RDB[v]["AmminimumFast"]["Nobuff"][h]["Texture"]=Texture;
		end
		--]]
		
		if id then
			spellid = id
			_,_,Texture=GetSpellInfo(spellid)
		else
			spellid,_,_,Texture = amfindSpellItemInf(h);
		end
		
		if spellid then
			
			RDB[v]["AmminimumFast"]["Nobuff"][h]["SpellId"]=spellid;
			RDB[v]["AmminimumFast"]["Nobuff"][h]["Texture"]=Texture;
		end
		
		
	end
	
	DropDownMenu:Refresh(5);

end

function AmminimumFast_SortNoBuff(a, b)
	
	return RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["Nobuff"][a]["index"] < RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["Nobuff"][b]["index"]
	
end

function addon:CustomizeTargetListGetTargetAmminimumFastDelNoBuff_Del(v)

	
	if IsControlKeyDown() and IsAltKeyDown() then
		RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["Nobuff"][v]=nil;
		
		DropDownMenu:Refresh(5);
		
	elseif IsControlKeyDown() then
		RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["Nobuff"][v]["IsTexture"]=not RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["Nobuff"][v]["IsTexture"];
		RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["Nobuff"][v]["IsSpellId"]=false;
		DropDownMenu:Refresh(5);
	
	elseif IsAltKeyDown() then
		RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["Nobuff"][v]["IsSpellId"]=not RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["Nobuff"][v]["IsSpellId"];
		RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["Nobuff"][v]["IsTexture"]=false;
		DropDownMenu:Refresh(5);
		
	elseif IsShiftKeyDown() then
	
		RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["Nobuff"][v]["IsPlayer"]=not RDB[AmminimumFast_SortBuff_index]["AmminimumFast"]["Nobuff"][v]["IsPlayer"];
		DropDownMenu:Refresh(5);
	end
	
		
	

end


function addon:CustomizeTargetListGetTargetAmminimumFastMinimumFireHasBeenSetValue(v,v1)

	RDB[v]["AmminimumFast"]["FireHasBeenSetValue"]=v1;
	DropDownMenu:Refresh(5);
	

end

function addon:AmminimumFastSetGroupSelectedTarget(v)

	local valueB = v[1];
	local name = v[2];
	local color = v[3];
	local englishClass = v[4];
	
	
	if not RDB[valueB]["AmminimumFast"]["Group_SelectedTarget"] then
		RDB[valueB]["AmminimumFast"]["Group_SelectedTarget"]={};
	end
	
	local T = RDB[valueB]["AmminimumFast"]["Group_SelectedTarget"];
	T["name"]= name;
	T["color"]= color;
	T["englishClass"]= englishClass;
	
	DropDownMenu:Refresh(5);
	

end

function addon:TargetListAddConditions(v,v1)


	
	local cs = Spells[v[1]]["Targets"][v[2]]["Conditions"];
	local TBL = {};
	
	TBL["name"] = v1;
	TBL["Remark"] = "";
	TBL["checked"]=false;
	TBL["and/or"]=false;
	
	TBL["Blood"]={}; --血量
	TBL["Blood"]["Percentage"]=false;
	TBL["Blood"]["checked"]=false;
	TBL["Blood"]["Lack"]=false;
	TBL["Blood"]["<"]={};
	TBL["Blood"][">"]={};
	TBL["Blood"]["<"]["checked"]=false;
	TBL["Blood"][">"]["checked"]=false;
	TBL["Blood"]["<"]["Value"]=0;
	TBL["Blood"][">"]["Value"]=0;
	
	
	TBL["Energy"]={}; --能量
	TBL["Energy"]["Percentage"]=false;
	TBL["Energy"]["checked"]=false;
	TBL["Energy"]["Lack"]=false;
	TBL["Energy"]["<"]={};
	TBL["Energy"][">"]={};
	TBL["Energy"]["<"]["checked"]=false;
	TBL["Energy"][">"]["checked"]=false;
	TBL["Energy"]["<"]["Value"]=0;
	TBL["Energy"][">"]["Value"]=0;
	
	TBL["SpecialEnergy"]={}; --特殊能量
	TBL["SpecialEnergy"]["checked"]=false;
	TBL["SpecialEnergy"]["<"]={};
	TBL["SpecialEnergy"][">"]={};
	TBL["SpecialEnergy"]["<"]["checked"]=false;
	TBL["SpecialEnergy"][">"]["checked"]=false;
	TBL["SpecialEnergy"]["<"]["Value"]=0;
	TBL["SpecialEnergy"][">"]["Value"]=0;
	
	
	TBL["Distance"]={}; --距离
	TBL["Distance"]["checked"]=false;
	TBL["Distance"]["<"]={};
	TBL["Distance"][">"]={};
	TBL["Distance"]["<"]["checked"]=false;
	TBL["Distance"][">"]["checked"]=false;
	TBL["Distance"]["<"]["Value"]=0;
	TBL["Distance"][">"]["Value"]=0;
	
	TBL["Class"]={}; --职业
	TBL["Class"]["checked"]=false;
	TBL["Class"]["Excluded"]={};
	
	TBL["CastSpell"]={}; --读条技能
	TBL["CastSpell"]["checked"]=false;
	TBL["CastSpell"]["Start"]={};
	TBL["CastSpell"]["Start"]["checked"]=false;
	TBL["CastSpell"]["Start"]["Value"]=0;
	
	TBL["CastSpell"]["Remaining"]={};
	TBL["CastSpell"]["Remaining"]["checked"]=false;
	TBL["CastSpell"]["Remaining"]["Value"]=0;
	
	TBL["CastSpell"]["AllInterruptChecked"]=false;
	TBL["CastSpell"]["InterruptChecked"]=false;
	
	TBL["CastSpell"]["Spells"]={};
	
	
	TBL["Buff"]={}; --BUFF
	TBL["Buff"]["checked"]=false;
	TBL["Buff"]["Time"]={};
	TBL["Buff"]["Time"]["checked"]=true;
	TBL["Buff"]["Time"]["Start"]={};
	TBL["Buff"]["Time"]["Start"]["checked"]=false;
	TBL["Buff"]["Time"]["Start"]["Value"]=0;
	TBL["Buff"]["Time"]["BuffName"]={};
	TBL["Buff"]["Time"]["Remaining"]={};
	TBL["Buff"]["Time"]["Remaining"]["checked"]=false;
	TBL["Buff"]["Time"]["Remaining"]["Value"]=0;
	
	TBL["Buff"]["IsBuff"]={};
	TBL["Buff"]["IsBuff"]["checked"]=false;
	TBL["Buff"]["IsBuff"]["NoBuffChecked"]=false;
	TBL["Buff"]["IsBuff"]["BuffName"]={};
	
	TBL["Buff"]["Layer"]={};
	TBL["Buff"]["Layer"]["checked"]=false;
	TBL["Buff"]["Layer"]["<"]={};
	TBL["Buff"]["Layer"]["<"]["Value"]=0;
	TBL["Buff"]["Layer"]["<"]["checked"]=false;
	TBL["Buff"]["Layer"][">"]={};
	TBL["Buff"]["Layer"][">"]["Value"]=0;
	TBL["Buff"]["Layer"][">"]["checked"]=false;
	TBL["Buff"]["Layer"]["BuffName"]={};
	
	
	TBL["ComboPoints"]={};--连击数
	TBL["ComboPoints"]["checked"]=false;
	TBL["ComboPoints"]["<"]={};
	TBL["ComboPoints"]["<"]["Value"]=0;
	TBL["ComboPoints"]["<"]["checked"]=false;
	TBL["ComboPoints"][">"]={};
	TBL["ComboPoints"][">"]["Value"]=0;
	TBL["ComboPoints"][">"]["checked"]=false;
	
	
	TBL["wbuff"]={};--获得主手和副手武器附魔效果冷却时间
	TBL["wbuff"]["checked"]=false;
	TBL["wbuff"]["<"]={};
	TBL["wbuff"]["<"]["Value"]=0;
	TBL["wbuff"]["<"]["checked"]=false;
	TBL["wbuff"][">"]={};
	TBL["wbuff"][">"]["Value"]=0;
	TBL["wbuff"][">"]["checked"]=false;
	TBL["wbuff"]["MainChecked"]=false;
	
	TBL["Cooldown"]={};--技能物品冷却时间
	TBL["Cooldown"]["checked"]=false;
	TBL["Cooldown"]["<"]={};
	TBL["Cooldown"]["<"]["Value"]=0;
	TBL["Cooldown"]["<"]["checked"]=false;
	TBL["Cooldown"][">"]={};
	TBL["Cooldown"][">"]["Value"]=0;
	TBL["Cooldown"][">"]["checked"]=false;
	TBL["Cooldown"]["name"]={};
	
	TBL["Rune"]={};
	TBL["Rune"]["checked"]=false;
	TBL["Rune"]["RuneCount"]={};--判断符文数量
	TBL["Rune"]["RuneCount"]["checked"]=false;
	TBL["Rune"]["RuneCount"][1]={};
	TBL["Rune"]["RuneCount"][1]["<"]={};
	TBL["Rune"]["RuneCount"][1]["<"]["Value"]=0;
	TBL["Rune"]["RuneCount"][1]["<"]["checked"]=false;
	TBL["Rune"]["RuneCount"][1][">"]={};
	TBL["Rune"]["RuneCount"][1][">"]["Value"]=0;
	TBL["Rune"]["RuneCount"][1][">"]["checked"]=false;
	TBL["Rune"]["RuneCount"][1]["="]={};
	TBL["Rune"]["RuneCount"][1]["="]["Value"]=0;
	TBL["Rune"]["RuneCount"][1]["="]["checked"]=false;
	
	
	TBL["Rune"]["RuneCount"][2]={};
	TBL["Rune"]["RuneCount"][2]["<"]={};
	TBL["Rune"]["RuneCount"][2]["<"]["Value"]=0;
	TBL["Rune"]["RuneCount"][2]["<"]["checked"]=false;
	TBL["Rune"]["RuneCount"][2][">"]={};
	TBL["Rune"]["RuneCount"][2][">"]["Value"]=0;
	TBL["Rune"]["RuneCount"][2][">"]["checked"]=false;
	TBL["Rune"]["RuneCount"][2]["="]={};
	TBL["Rune"]["RuneCount"][2]["="]["Value"]=0;
	TBL["Rune"]["RuneCount"][2]["="]["checked"]=false;
	
	TBL["Rune"]["RuneCount"][3]={};
	TBL["Rune"]["RuneCount"][3]["<"]={};
	TBL["Rune"]["RuneCount"][3]["<"]["Value"]=0;
	TBL["Rune"]["RuneCount"][3]["<"]["checked"]=false;
	TBL["Rune"]["RuneCount"][3][">"]={};
	TBL["Rune"]["RuneCount"][3][">"]["Value"]=0;
	TBL["Rune"]["RuneCount"][3][">"]["checked"]=false;
	TBL["Rune"]["RuneCount"][3]["="]={};
	TBL["Rune"]["RuneCount"][3]["="]["Value"]=0;
	TBL["Rune"]["RuneCount"][3]["="]["checked"]=false;
	
	TBL["Rune"]["RuneCount"][4]={};
	TBL["Rune"]["RuneCount"][4]["<"]={};
	TBL["Rune"]["RuneCount"][4]["<"]["Value"]=0;
	TBL["Rune"]["RuneCount"][4]["<"]["checked"]=false;
	TBL["Rune"]["RuneCount"][4][">"]={};
	TBL["Rune"]["RuneCount"][4][">"]["Value"]=0;
	TBL["Rune"]["RuneCount"][4][">"]["checked"]=false;
	TBL["Rune"]["RuneCount"][4]["="]={};
	TBL["Rune"]["RuneCount"][4]["="]["Value"]=0;
	TBL["Rune"]["RuneCount"][4]["="]["checked"]=false;
	
	
	TBL["Rune"]["RuneCooldown"]={};--判断符文冷却
	TBL["Rune"]["RuneCooldown"]["checked"]=false;
	TBL["Rune"]["RuneCooldown"][1]={};
	TBL["Rune"]["RuneCooldown"][1]["<"]={};
	TBL["Rune"]["RuneCooldown"][1]["<"]["Value"]=0;
	TBL["Rune"]["RuneCooldown"][1]["<"]["checked"]=false;
	TBL["Rune"]["RuneCooldown"][1][">"]={};
	TBL["Rune"]["RuneCooldown"][1][">"]["Value"]=0;
	TBL["Rune"]["RuneCooldown"][1][">"]["checked"]=false;
	TBL["Rune"]["RuneCooldown"][1]["="]={};
	TBL["Rune"]["RuneCooldown"][1]["="]["Value"]=0;
	TBL["Rune"]["RuneCooldown"][1]["="]["checked"]=false;
	
	
	TBL["Rune"]["RuneCooldown"][2]={};
	TBL["Rune"]["RuneCooldown"][2]["<"]={};
	TBL["Rune"]["RuneCooldown"][2]["<"]["Value"]=0;
	TBL["Rune"]["RuneCooldown"][2]["<"]["checked"]=false;
	TBL["Rune"]["RuneCooldown"][2][">"]={};
	TBL["Rune"]["RuneCooldown"][2][">"]["Value"]=0;
	TBL["Rune"]["RuneCooldown"][2][">"]["checked"]=false;
	TBL["Rune"]["RuneCooldown"][2]["="]={};
	TBL["Rune"]["RuneCooldown"][2]["="]["Value"]=0;
	TBL["Rune"]["RuneCooldown"][2]["="]["checked"]=false;
	
	TBL["Rune"]["RuneCooldown"][3]={};
	TBL["Rune"]["RuneCooldown"][3]["<"]={};
	TBL["Rune"]["RuneCooldown"][3]["<"]["Value"]=0;
	TBL["Rune"]["RuneCooldown"][3]["<"]["checked"]=false;
	TBL["Rune"]["RuneCooldown"][3][">"]={};
	TBL["Rune"]["RuneCooldown"][3][">"]["Value"]=0;
	TBL["Rune"]["RuneCooldown"][3][">"]["checked"]=false;
	TBL["Rune"]["RuneCooldown"][3]["="]={};
	TBL["Rune"]["RuneCooldown"][3]["="]["Value"]=0;
	TBL["Rune"]["RuneCooldown"][3]["="]["checked"]=false;
	
	TBL["Rune"]["RuneCooldown"][4]={};
	TBL["Rune"]["RuneCooldown"][4]["<"]={};
	TBL["Rune"]["RuneCooldown"][4]["<"]["Value"]=0;
	TBL["Rune"]["RuneCooldown"][4]["<"]["checked"]=false;
	TBL["Rune"]["RuneCooldown"][4][">"]={};
	TBL["Rune"]["RuneCooldown"][4][">"]["Value"]=0;
	TBL["Rune"]["RuneCooldown"][4][">"]["checked"]=false;
	TBL["Rune"]["RuneCooldown"][4]["="]={};
	TBL["Rune"]["RuneCooldown"][4]["="]["Value"]=0;
	TBL["Rune"]["RuneCooldown"][4]["="]["checked"]=false;
	
	TBL["Totem"]={};--图腾CD
	TBL["Totem"]["checked"]=false;
	TBL["Totem"]["<"]={};
	TBL["Totem"]["<"]["Value"]=0;
	TBL["Totem"]["<"]["checked"]=false;
	TBL["Totem"][">"]={};
	TBL["Totem"][">"]["Value"]=0;
	TBL["Totem"][">"]["checked"]=false;
	TBL["Totem"]["name"]="";
	
	TBL["IsTarget"]={};--判断目标
	TBL["IsTarget"]["checked"]=false;
	TBL["IsTarget"]["IsTarget"]={};
	TBL["IsTarget"]["IsTarget"]["Targets"]={};
	TBL["IsTarget"]["IsTarget"]["checked"]=false;
	TBL["IsTarget"]["IsTarget"]["Contains"]=false;
	
	TBL["IsTarget"]["IsTargetTargetToPlayer"]={};
	TBL["IsTarget"]["IsTargetTargetToPlayer"]["checked"]=false;
	
	TBL["IsTarget"]["IsFocusTargetToPlayer"]={};
	TBL["IsTarget"]["IsFocusTargetToPlayer"]["checked"]=false;
	
	TBL["IsTarget"]["IsMouseoverTargetToPlayer"]={};
	TBL["IsTarget"]["IsMouseoverTargetToPlayer"]["checked"]=false;
	
	TBL["IsTarget"]["IsCustomizeTargetToPlayer"]={};
	TBL["IsTarget"]["IsCustomizeTargetToPlayer"]["checked"]=false;
	TBL["IsTarget"]["IsCustomizeTargetToPlayer"]["Targets"]={};
	
	TBL["IsTarget"]["IsDefaultTargetToPlayer"]={};
	TBL["IsTarget"]["IsDefaultTargetToPlayer"]["checked"]=false;
	
	--布尔值函数
	TBL["FuncBoolean"]={};
	TBL["FuncBoolean"]["checked"]=false;
	TBL["FuncBoolean"]["FuncTexe"]="";
	TBL["FuncBoolean"]["func"]=nil;
	TBL["FuncBoolean"]["inf"]=nil;
	TBL["FuncBoolean"]["Remarks"]=nil;
	
	--api函数
	TBL["ApiDbf"]={};
	
		
	TBL["RangeCheck"]={};
	TBL["RangeCheck"]["checked"]=false;
	TBL["RangeCheck"]["Count"]={};
	
	TBL["RangeCheck"]["Count"]["<"]={};
	TBL["RangeCheck"]["Count"]["<"]["Value"]=0;
	TBL["RangeCheck"]["Count"]["<"]["checked"]=true;
	TBL["RangeCheck"]["Count"][">"]={};
	TBL["RangeCheck"]["Count"][">"]["Value"]=0;
	TBL["RangeCheck"]["Count"][">"]["checked"]=true;
	
	TBL["RangeCheck"]["Range"]={};
	
	TBL["RangeCheck"]["Range"]["<"]={};
	TBL["RangeCheck"]["Range"]["<"]["Value"]=0;
	TBL["RangeCheck"]["Range"]["<"]["checked"]=true;
	TBL["RangeCheck"]["Range"][">"]={};
	TBL["RangeCheck"]["Range"][">"]["Value"]=0;
	TBL["RangeCheck"]["Range"][">"]["checked"]=true;
	
	--[[
	TBL["PlayerRangeCheckAngle"]={};
	TBL["PlayerRangeCheckAngle"]["checked"]=false;
	TBL["PlayerRangeCheckAngle"]["Count"]={};
	
	TBL["PlayerRangeCheckAngle"]["Count"]["<"]={};
	TBL["PlayerRangeCheckAngle"]["Count"]["<"]["Value"]=0;
	TBL["PlayerRangeCheckAngle"]["Count"]["<"]["checked"]=true;
	TBL["PlayerRangeCheckAngle"]["Count"][">"]={};
	TBL["PlayerRangeCheckAngle"]["Count"][">"]["Value"]=0;
	TBL["PlayerRangeCheckAngle"]["Count"][">"]["checked"]=true;

	TBL["PlayerRangeCheckAngle"]["Range"]={};
	
	TBL["PlayerRangeCheckAngle"]["Range"]["<"]={};
	TBL["PlayerRangeCheckAngle"]["Range"]["<"]["Value"]=0;
	TBL["PlayerRangeCheckAngle"]["Range"]["<"]["checked"]=true;
	TBL["PlayerRangeCheckAngle"]["Range"][">"]={};
	TBL["PlayerRangeCheckAngle"]["Range"][">"]["Value"]=0;
	TBL["PlayerRangeCheckAngle"]["Range"][">"]["checked"]=true;
	
	TBL["PlayerRangeCheckAngle"]["Health"]={};

	TBL["PlayerRangeCheckAngle"]["Health"]["<"]={};
	TBL["PlayerRangeCheckAngle"]["Health"]["<"]["Value"]=0;
	TBL["PlayerRangeCheckAngle"]["Health"]["<"]["checked"]=false;
	TBL["PlayerRangeCheckAngle"]["Health"][">"]={};
	TBL["PlayerRangeCheckAngle"]["Health"][">"]["Value"]=0;
	TBL["PlayerRangeCheckAngle"]["Health"][">"]["checked"]=false;
	TBL["PlayerRangeCheckAngle"]["LackHealthChecked"]=false;
	TBL["PlayerRangeCheckAngle"]["HealthPercentageChecked"]=false;
	--]]
	--[[
	TBL["PlayerRangeCheckAngle"]["Buff"]={};
	TBL["PlayerRangeCheckAngle"]["Buff"]["checked"]=false;
	TBL["PlayerRangeCheckAngle"]["Buff"]["name"]={};
	TBL["PlayerRangeCheckAngle"]["Buff"]["<"]={};
	TBL["PlayerRangeCheckAngle"]["Buff"]["<"]["Value"]=0;
	TBL["PlayerRangeCheckAngle"]["Buff"]["<"]["checked"]=false;
	TBL["PlayerRangeCheckAngle"]["Buff"][">"]={};
	TBL["PlayerRangeCheckAngle"]["Buff"][">"]["Value"]=0;
	TBL["PlayerRangeCheckAngle"]["Buff"][">"]["checked"]=false;
	--]]
	--[[
	TBL["PlayerRangeCheckAngle"]["NewBuff"]={};
	TBL["PlayerRangeCheckAngle"]["NewBuff"]["checked"]=false;
	TBL["PlayerRangeCheckAngle"]["NewBuff"]["buffs"]={};
	
	TBL["PlayerRangeCheckAngle"]["AngleValue"]=90;
	TBL["PlayerRangeCheckAngle"]["AngleChecked"]=false;
	TBL["PlayerRangeCheckAngle"]["TargetChecked"]=false;
	TBL["PlayerRangeCheckAngle"]["ContainChecked"]=false;
	--]]
	
	
	table.insert(cs,TBL)
	
	DropDownMenu:Refresh(4);
	
	
end


function addon:SpellsListConditions_checked(v)

	
	
	local cs = Spells[v[1]]["Targets"][v[2]]["Conditions"];
	
	if IsControlKeyDown() and not IsAltKeyDown() then	
	
		addon:CopySpellProgramCondition(Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]);
		DropDownMenu:Refresh(4);
		return;
		
	elseif IsControlKeyDown() and IsAltKeyDown() then
	
		table.remove(cs, v[3]) 
		DropDownMenu:Refresh(3);
		return;
		
	elseif IsAltKeyDown() then
	
		cs[v[3]]["not"]= not cs[v[3]]["not"];
		DropDownMenu:Refresh(3);
		return;
	
	
	end
	
	cs[v[3]]["checked"]= not cs[v[3]]["checked"];
	

	
	DropDownMenu:Refresh(3);
	
	
end




function addon:TargetListAddTargets(v,v1)

		
	local cs = Spells[v]["Targets"];
	local TBL = {};
	
	TBL["name"] = v1;
	TBL["Remark"] = "";
	TBL["checked"]=false;
	
	table.insert(cs,TBL)
	
	DropDownMenu:Refresh(3);
	
	
end


function addon:SpellsListTargets_checked(v)


	
	local cs = v[1]["Targets"];
	
	if IsControlKeyDown() and not IsAltKeyDown() then	
	
		addon:CopySpellProgramTargetCondition(cs[v[2]]);
		DropDownMenu:Refresh(3);
		return;
		
	elseif IsControlKeyDown() and IsAltKeyDown() then
		table.remove(cs, v[2]) 
		DropDownMenu:Refresh(3);
		return;
	elseif IsAltKeyDown() then
		cs[v[2]]["not"]= not cs[v[2]]["not"];
		DropDownMenu:Refresh(3);
		return;
	end
	
	cs[v[2]]["checked"]= not cs[v[2]]["checked"];
	

	
	DropDownMenu:Refresh(3);
	
	
end


function addon:TargetListTargets_EditRemark(v,v1)


	Spells[v[1]]["Targets"][v[2]]["Remark"]=v1;
	
	DropDownMenu:Refresh(3);
	
end

function addon:GetCustomizeTargetInf(v)

	
	local TBL = SuperTreatmentDBF["Unit"]["RaidList"]
	for i, data in pairs(TBL) do
	
		if i == v then
			
			return data;
		end
				
		
	end


	return false;


end


function addon:Menu_3_5(level, value, menu, MenuEx,GlobalLevel) -- 建立条件菜单

	


	if level == 5 then -- 5级菜单内容
	
		
		local V = addon:DecompositionValue(value);
		
		if V[1] == "TargetListTargetsConditionsNames" then
			
			local CHECKED = V[1] .. "_checked";
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
			local value ={V[2],V[3],V[4]};
			
			local TBL = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]];
			
			local text;
			if TBL["and/or"] then
				text = "Or";
			else
				text = "And";
			end
			
			local str = addon:FormatTooltipText("点击切换 或者(Or)/并且(And) 关系,该选项决定下列选项的处理关系。")			
			menu:AddLine("text","|cffffff00使用|cffff0000"..text.."|cffffff00关系|r",
			"func", V[1] .. "_and_or","arg1", self,"arg2", TBL,
			"tooltipText",str,"tooltipTitle","信息",
			"inftitle","第十步",
			"inftext","按照功能需要点击下列这些菜单打钩，启动该功能模块。",
			"infx",0,
			"infy",-6,
			"infid",10,
			"infheight",65,
			"infchecked",SuperTreatmentAllDBF.HelpNavigation 
			);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			local str = addon:FormatTooltipText("目标的血量百分比，缺血量等。\n\n" .. NOTT)
			local Blood = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Blood"];
			local TC = V[1] .. "Blood_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
						
			menu:AddLine("text", NOT(Blood,"血量"),
			"checked",Blood["checked"],"func", CHECKED,"arg1", self,"arg2", Blood,
			"hasArrow", 1, "value",TC,"tooltipText",str,"tooltipTitle","信息",
			"tooltipTitle","信息"
			
			);
			
			menu:AddLine("line",1);
			
			local str = addon:FormatTooltipText("目标的能量(蓝，怒，能量，集中值，符能等)。\n\n" .. NOTT)
			local Energy = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Energy"];
			local TC = V[1] .. "Energy_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			
			menu:AddLine("text", NOT(Energy,"能量(蓝,怒,能量,集中值,符能等)"),
			"checked",Energy["checked"],"func",CHECKED,"arg1", self,"arg2", Energy,
			"hasArrow", 1, "value",TC,"tooltipText",str,"tooltipTitle","信息"
			);
			
			menu:AddLine("line",1);
			if not Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["SpecialEnergy"] then
				local TBL = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]];
				TBL["SpecialEnergy"]={}; --特殊能量
				TBL["SpecialEnergy"]["checked"]=false;
				TBL["SpecialEnergy"]["<"]={};
				TBL["SpecialEnergy"][">"]={};
				TBL["SpecialEnergy"]["<"]["checked"]=false;
				TBL["SpecialEnergy"][">"]["checked"]=false;
				TBL["SpecialEnergy"]["<"]["Value"]=0;
				TBL["SpecialEnergy"][">"]["Value"]=0;
			end
	
			local str = addon:FormatTooltipText("自己的神圣能量,恶魔之怒等。\n\n|r注意：蓝条下面的基本就是特殊能量除非你改了界面或者你没这些能量如DK就没。\n\n" .. NOTT)
			local SpecialEnergy = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["SpecialEnergy"];
			local TC = V[1] .. "SpecialEnergy_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			
			menu:AddLine("text", NOT(SpecialEnergy,"特殊能量(神圣能量,恶魔之怒等)"),
			"checked",SpecialEnergy["checked"],"func",CHECKED,"arg1", self,"arg2", SpecialEnergy,
			"hasArrow", 1, "value",TC,"tooltipText",str,"tooltipTitle","信息"
			);
			
			menu:AddLine("line",1);
			local str = addon:FormatTooltipText("您和目标之间的距离。\n\n|r注意：距离不是线性的这距离是通过技能判断出来的，所以距离可能是5/10/11/15/30/40这样。\n\n" .. NOTT)
			local Distance = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Distance"];
			local TC = V[1] .. "Distance_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			
			menu:AddLine("text", NOT(Distance,"距离"),
			"checked",Distance["checked"],"func", CHECKED,"arg1", self,"arg2", Distance,
			"hasArrow", 1, "value",TC,"tooltipText",str,"tooltipTitle","信息"
			);
			
			menu:AddLine("line",1);
			
			local str = addon:FormatTooltipText("把目标的职业排除掉。\n\n" .. NOTT)
			
			local Class = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Class"];
			local TC = V[1] .. "Class_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			
			menu:AddLine("text", NOT(Class,"职业(排除)"),
			"checked",Class["checked"],"func", CHECKED,"arg1", self,"arg2", Class,
			"hasArrow", 1, "value",TC,"tooltipText",str,"tooltipTitle","信息"
			);
			
			menu:AddLine("line",1);
			
			
			--local CastSpell = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["CastSpell"];
			--local TC = V[1] .. "CastSpell_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			
			--menu:AddLine("text", NOT(CastSpell,"读条技能"),
			--"checked",CastSpell["checked"],"func", CHECKED,"arg1", self,"arg2", CastSpell,
			--"hasArrow", 1, "value",TC,"tooltipText",str,"tooltipTitle","信息"
			--);
			
			local str = addon:FormatTooltipText("判断非瞬发读条技能及引导类技能。\n\n" .. NOTT)
			
			if not TBL["NewSpell"] then
				TBL["NewSpell"]={};
			end
			
			local NewSpell = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["NewSpell"];
			menu:AddLine("text", NOT(NewSpell,"读条技能(新)") ,"hasArrow", 1,
			"OpenMenu",SuperTreatment["Menu"]["SetIsSpellMenu"] ,"OpenMenuValue",{TBL},
			"checked",NewSpell["checked"],"func", CHECKED,
			"arg1", self,"arg2", NewSpell,
			"tooltipText",str,"tooltipTitle","信息"
			);
			
			
			--menu:AddLine("line",1);
			
			--local Buff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Buff"];
			--local TC = V[1] .. "Buff_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			--menu:AddLine("text", NOT(Buff,"判断Buff"),
			--"checked",Buff["checked"],"func", CHECKED,"arg1", self,"arg2", Buff,
			--"hasArrow", 1, "value",TC,"tooltipText",str,"tooltipTitle","信息"
			--);
			
			menu:AddLine("line",1);
			
			local str = addon:FormatTooltipText("判断任何BUFF包括DEBUFF。\n\n|r敬告小白在BUFF位置显示的都是BUFF。\n\n" .. NOTT)
			
			if not TBL["NewBuff"] then
				TBL["NewBuff"]={};
			end
			local Buff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["NewBuff"];
			local TC = V[1] .. "BuffNew_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			menu:AddLine("text", NOT(Buff,"判断Buff(新)"),
			"checked",Buff["checked"],"func", CHECKED,"arg1", self,"arg2", Buff,
			"hasArrow", 1, "value",TC,"tooltipText",str,"tooltipTitle","信息"
			);
			
			menu:AddLine("line",1);
			
			local str = addon:FormatTooltipText("判断盗贼、德鲁伊等的连击点。\n\n|r注意:目标设定为“自己”。\n能否判断别的目标目前我没发现可以。\n\n" .. NOTT)
			local Buff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["ComboPoints"];
			local TC = V[1] .. "ComboPoints_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			menu:AddLine("text", NOT(Buff,"判断连击数"),
			"checked",Buff["checked"],"func", CHECKED,"arg1", self,"arg2", Buff,
			"hasArrow", 1, "value",TC,"tooltipText",str,"tooltipTitle","信息"
			);
			
			menu:AddLine("line",1);
			
			local str = addon:FormatTooltipText("武器附魔效果,能否判断除自己以外的目标不确定。\n\n" .. NOTT)
			
			local Buff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["wbuff"];
			local TC = V[1] .. "wbuff_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			menu:AddLine("text", NOT(Buff,"武器附魔效果"),
			"checked",Buff["checked"],"func", CHECKED,"arg1", self,"arg2", Buff,
			"hasArrow", 1, "value",TC,"tooltipText",str,"tooltipTitle","信息"
			);
			
			local str = addon:FormatTooltipText("判断自己技能物品冷却时间，需要判断自己以外目标的请到函数列表里找。\n\n" .. NOTT)
			local Buff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Cooldown"];
			local TC = V[1] .. "Cooldown_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			menu:AddLine("text", NOT(Buff,"技能物品冷却"),
			"checked",Buff["checked"],"func", CHECKED,"arg1", self,"arg2", Buff,
			"hasArrow", 1, "value",TC,"tooltipText",str,"tooltipTitle","信息"
			);
			
			menu:AddLine("line",1);
			local str = addon:FormatTooltipText("判断自己的符文。\n\n" .. NOTT)
			local Buff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Rune"];
			local TC = V[1] .. "Rune_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			menu:AddLine("text", NOT(Buff,"判断符文"),
			"checked",Buff["checked"],"func", CHECKED,"arg1", self,"arg2", Buff,
			"hasArrow", 1, "value",TC,"tooltipText",str,"tooltipTitle","信息"
			);
			
			menu:AddLine("line",1);
			local str = addon:FormatTooltipText("判断自己的图腾剩余时间。\n\n|r注意：设定时请先把图腾放出来。 \n\n" .. NOTT)
			local Buff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Totem"];
			local TC = V[1] .. "Totem_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			menu:AddLine("text", NOT(Buff,"判断图腾剩余时间"),
			"checked",Buff["checked"],"func", CHECKED,"arg1", self,"arg2", Buff,
			"hasArrow", 1, "value",TC,"tooltipText",str,"tooltipTitle","信息"
			);
			
			menu:AddLine("line",1);
			local str = addon:FormatTooltipText("目标判断的模板集合，如果需要其他判断请到函数列表里找。\n\n" .. NOTT)
			local Buff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["IsTarget"];
			local TC = V[1] .. "IsTarget_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			menu:AddLine("text", NOT(Buff,"目标的目标"),
			"checked",Buff["checked"],"func", CHECKED,"arg1", self,"arg2", Buff,
			"hasArrow", 1, "value",TC,"tooltipText",str,"tooltipTitle","信息"
			);
			
			menu:AddLine("line",1);
			
			if not Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["RangeCheck"] then
				
				local TBL = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]];
				
				TBL["RangeCheck"]={};
				TBL["RangeCheck"]["checked"]=false;
				TBL["RangeCheck"]["Count"]={};
				
				TBL["RangeCheck"]["Count"]["<"]={};
				TBL["RangeCheck"]["Count"]["<"]["Value"]=0;
				TBL["RangeCheck"]["Count"]["<"]["checked"]=true;
				TBL["RangeCheck"]["Count"][">"]={};
				TBL["RangeCheck"]["Count"][">"]["Value"]=0;
				TBL["RangeCheck"]["Count"][">"]["checked"]=true;
				
				TBL["RangeCheck"]["Range"]={};
				
				TBL["RangeCheck"]["Range"]["<"]={};
				TBL["RangeCheck"]["Range"]["<"]["Value"]=0;
				TBL["RangeCheck"]["Range"]["<"]["checked"]=true;
				TBL["RangeCheck"]["Range"][">"]={};
				TBL["RangeCheck"]["Range"][">"]["Value"]=0;
				TBL["RangeCheck"]["Range"][">"]["checked"]=true;
			
			end
			
			
			if not Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["PlayerRangeCheckAngle"] then
				
				local TBL = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]];
				
				TBL["PlayerRangeCheckAngle"]={};
				TBL["PlayerRangeCheckAngle"]["checked"]=false;
								
				
			end
			
						
			
			
			local Buff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["RangeCheck"];
			
			local str = "该功能只能副本使用，什么副本能使用参考后面的【测试】功能。\n\n需要DBM插件的支持，只有DBM支持的副本才可以用。并且打开相应的副本报警。\n\n当然不需要DBM也可以正常使用，如果发现有些地图无法使用那么还是安装DBM为好，毕竟DBM经常更新。\n\n|r注意:\n不包含目标\n\n相关:\n到【系统设定】>【测试】菜单下获取你是否可以使用本功能的信息。\n\n" .. addon:FormatTooltipText(NOTT)
			str = addon:FormatTooltipText(str);
			local TC = V[1] .. "RangeCheck_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			menu:AddLine("text", NOT(Buff,"判断目标范围内队友数量"),
			"checked",Buff["checked"],"func", CHECKED,"arg1", self,"arg2", Buff,
			"hasArrow", 1, "value",TC,"tooltipText",str,"tooltipTitle","信息"
			);
			
			menu:AddLine("line",1);
			
			local Buff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["PlayerRangeCheckAngle"];
			--[[
			local str = "该功能只能副本使用，什么副本能使用参考后面的【测试】功能。\n\n需要DBM插件的支持，只有DBM支持的副本才可以用。并且打开相应的副本报警。\n\n当然不需要DBM也可以正常使用，如果发现有些地图无法使用那么还是安装DBM为好，毕竟DBM经常更新。\n\n|r相关:\n到【系统设定】>【测试】菜单下获取你是否可以使用本功能的信息。\n\n" .. addon:FormatTooltipText(NOTT)
			str = addon:FormatTooltipText(str);
			local TC = V[1] .. "PlayerRangeCheckAngle_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			menu:AddLine("text", NOT(Buff,"判断范围/视野角度内队友信息"),
			"checked",Buff["checked"],"func", CHECKED,"arg1", self,"arg2", Buff,
			"hasArrow", 1, "value",TC,"tooltipText",str,"tooltipTitle","信息"
			);
			--]]
			menu:AddLine("text", NOT(Buff,"判断范围/视野角度内队友信息"),
			"checked",Buff["checked"],
			"func", "SetTbl","arg1", self,"arg2", {Buff,"checked",not Buff.checked,level,nil,nil,GlobalLevel-1},
			"hasArrow", 1, "value","","tooltipText",str,"tooltipTitle","信息",
			"OpenMenu",SuperTreatment["Menu"]["RangeCheckAngleMenu"],
			"OpenMenuValue",{ Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]],Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Target"],"Conditions"}
			);
			
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
			
			addon["MenuLevel_name"]="TargetListTargetsConditionsNames";
			SuperTreatment["type"]="NoRun"
			addon:Menu_SuperTreatmentApiList(level, value, menu,TBL)
		
		end
		
	elseif level == 6 then -- 6级菜单内容
	
		local V = addon:DecompositionValue(value);
		
		if V[1] == "TargetListTargetsConditionsNamesPlayerRangeCheckAngle" then
			
			menu:AddLine("text","判断范围/视野角度内队友信息","isTitle",1)
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
			
			
			local Target = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Target"];
			local Color;
			if Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["TargetSubgroup"] == -2 then
			
				Color = "|cff00ff00";
			
			else
				
				Color = "|cff00ffff";
			
			end
			
			local tbl = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["PlayerRangeCheckAngle"];
			local value ={V[2],V[3],V[4]};
			local text,disabled;
			
			if not tbl["AngleChecked"] then
				text = "|cff00ff001. |r把(" .. Color .. Target .. "|r)包括在判断之内"
				disabled = false;
			else
				text = "1. 把(" .. Target .. "|r)包括在判断之内"
				disabled = true;
			end
			
			local str =addon:FormatTooltipText("把参考目标也包含在各种统计判断之内。|r\n\n当选择“视野角度”时参考目标不包含在各种统计判断之内。");
			menu:AddLine("text", text,
			"checked",tbl["ContainChecked"],"func", V[1] .. "_ContainChecked","arg1", self,"arg2", value,
			"tooltipText",str,"tooltipTitle","信息","disabled",disabled
			);
			
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			menu:AddLine("text","|cff00ff002. |r距离:","isTitle",1)
			
			local tbl = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["PlayerRangeCheckAngle"]["Range"];
			local value ={V[2],V[3],V[4]};
			
			local MaxValue=100;
			
			menu:AddLine("text", "    |cffffffff距离(|cffff0000<=" .. tbl ["<"]["Value"]  .."|cffffffff)" , 
			"checked",tbl ["<"]["checked"],"func", V[1] .. "_Range_L_checked","arg1", self,"arg2", value,
			"hasSlider", 1, "sliderValue",  tbl ["<"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			V[1] .. "_Range_L_value" , "sliderArg1", self,"sliderArg2", value
			);
			
			
			menu:AddLine("text", "    |cffffffff距离(|cffff0000>=" .. tbl [">"]["Value"]  .."|cffffffff)" ,
			"checked",tbl [">"]["checked"],"func", V[1] .. "_Range_H_checked","arg1", self,"arg2", value,
			"hasSlider", 1, "sliderValue",tbl [">"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			V[1] .. "_Range_H_value" , "sliderArg1", self,"sliderArg2", value
			);
			
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			local tbl = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["PlayerRangeCheckAngle"];
			local value ={V[2],V[3],V[4]};
			
			local MaxValue=360;
			local str = addon:FormatTooltipText("只能判断“自己”的视野角度，所以请把目标设定为“自己”。|r\n\n在该模式下会把“自己”排除在各种判断之外。");
			
			if Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["unit"]== "player" and not tbl["ContainChecked"] then
			
				menu:AddLine("text", "|cff00ff003. |r视野角度(|cffff0000>=" .. tbl["AngleValue"]  .."°|cffffffff)" ,
				"checked",tbl["AngleChecked"],"func", V[1] .. "_AngleChecked","arg1", self,"arg2", value,
				"hasSlider", 1, "sliderValue",tbl["AngleValue"], "sliderMin", 1, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
				V[1] .. "_AngleValue" , "sliderArg1", self,"sliderArg2", value,
				"tooltipText",str,"tooltipTitle","信息"
				);
				
								
			else
				
				menu:AddLine("text", "3. 视野角度(>=" .. tbl["AngleValue"]  .."°)","disabled",1,
				"tooltipText",str,"tooltipTitle","信息"
				);
			
			end
			
			
			
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			menu:AddLine("text","|cff00ff004. |r血量:","isTitle",1)
			
			
			
			
			menu:AddLine("text", "    缺血量判断",
			"checked",tbl["LackHealthChecked"],"func", V[1] .. "_LackHealthChecked","arg1", self,"arg2", value);
			
			
			menu:AddLine("text", "    血量(|cffff0000%|cffffffff)显示",
			"checked",tbl["HealthPercentageChecked"],"func", V[1] .. "_HealthPercentageChecked","arg1", self,"arg2", value);
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			
			
			
			
			local MaxValue;
			
			if tbl["HealthPercentageChecked"] then
				MaxValue=100;
			else
				MaxValue=90000000;
			end
			
			
			local tbl = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["PlayerRangeCheckAngle"]["Health"];
			local value ={V[2],V[3],V[4]};
			
			menu:AddLine("text", "    |cffffffff血量(|cffff0000<=" .. tbl["<"]["Value"]  .."|cffffffff)" , "hasArrow", 1, "value", TC,
			"checked",tbl["<"]["checked"],"func", V[1] .. "_Health_L_checked","arg1", self,"arg2", value,
			"hasSlider", 1, "sliderValue",  tbl["<"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			V[1] .. "_Health_L_value" , "sliderArg1", self,"sliderArg2", value
			);
			
			
			
			local TC = V[1] .. "BloodH_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			menu:AddLine("text", "    |cffffffff血量(|cffff0000>=" .. tbl[">"]["Value"]  .."|cffffffff)" , "hasArrow", 1, "value", TC,
			"checked",tbl[">"]["checked"],"func", V[1] .. "_Health_H_checked","arg1", self,"arg2", value,
			"hasSlider", 1, "sliderValue",tbl[">"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			V[1] .. "_Health_H_value" , "sliderArg1", self,"sliderArg2", value
			);
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			local tbl = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["PlayerRangeCheckAngle"];
			--local value ={V[2],V[3],V[4]};
			local TC = V[1] .. "PlayerRangeCheckAngleBuff_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			menu:AddLine("text", "|cff00ff005. |r判断Buff",
			--"checked",tbl["Buff"]["checked"],"func", V[1] .. "_BuffChecked","arg1", self,"arg2", value,
			"checked",tbl.NewBuff.checked,
			"func", "SetTbl","arg1", self,"arg2",{tbl.NewBuff,"checked",not tbl.NewBuff.checked,level},
			"hasArrow", 1, "value",TC
			);
			
			
			
			
			--[[
			
			if not tbl.NewBuff then
				tbl.NewBuff={};
			end
			
			menu:AddLine("text", "|cff00ff005. |r判断Buff",
			"hasArrow", 1,
			"OpenMenu",SuperTreatment["Menu"]["SetBuffMenu"] ,"OpenMenuValue",{tbl.NewBuff,0,tbl},
			"checked",tbl.NewBuff.checked,
			"func", "SetTbl","arg1", self,"arg2",{tbl.NewBuff,"checked",not tbl.NewBuff.checked,level}
			);
			
			--]]
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			menu:AddLine("text","|cff00ff006. |r目标:","isTitle",1)
			
			
			
			local tbl = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["PlayerRangeCheckAngle"]["Count"];
			local value ={V[2],V[3],V[4]};
			
			local MaxValue=100;
			
			menu:AddLine("text", "    |cffffffff目标数量(|cffff0000<=" .. tbl ["<"]["Value"]  .."|cffffffff)" , 
			"checked",tbl ["<"]["checked"],"func", V[1] .. "_L_checked","arg1", self,"arg2", value,
			"hasSlider", 1, "sliderValue",  tbl ["<"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			V[1] .. "_L_value" , "sliderArg1", self,"sliderArg2", value
			);
			
			
			menu:AddLine("text", "    |cffffffff目标数量(|cffff0000>=" .. tbl [">"]["Value"]  .."|cffffffff)" ,
			"checked",tbl [">"]["checked"],"func", V[1] .. "_H_checked","arg1", self,"arg2", value,
			"hasSlider", 1, "sliderValue",tbl [">"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			V[1] .. "_H_value" , "sliderArg1", self,"sliderArg2", value
			);
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			local str = addon:FormatTooltipText("1、判断从1-6开始依次判断。\n\n2、视野角度:如果设定90°。那么就是面前方左边45°右边45°形成的夹角。\n注意:只能判断自己的视野。\n\n3、数量放到最后那么就是说统计前面符合条件的数量。");
				
			menu:AddLine("text", "|cff00ff00帮助","tooltipText",str,"tooltipTitle","帮助","icon","Interface\\Icons\\INV_Misc_QuestionMark");
				
			
			
		elseif V[1] == "TargetListTargetsConditionsNamesRangeCheck" then
			
			menu:AddLine("text","范围内队友数量","isTitle",1)
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
			
			local tbl = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["RangeCheck"]["Count"];
			local value ={V[2],V[3],V[4]};
			
			local MaxValue=100;
			
			menu:AddLine("text", "|cffffffff目标数量(|cffff0000<=" .. tbl ["<"]["Value"]  .."|cffffffff)" , 
			"checked",tbl ["<"]["checked"],"func", V[1] .. "_L_checked","arg1", self,"arg2", value,
			"hasSlider", 1, "sliderValue",  tbl ["<"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			V[1] .. "_L_value" , "sliderArg1", self,"sliderArg2", value
			);
			
			
			menu:AddLine("text", "|cffffffff目标数量(|cffff0000>=" .. tbl [">"]["Value"]  .."|cffffffff)" ,
			"checked",tbl [">"]["checked"],"func", V[1] .. "_H_checked","arg1", self,"arg2", value,
			"hasSlider", 1, "sliderValue",tbl [">"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			V[1] .. "_H_value" , "sliderArg1", self,"sliderArg2", value
			);
			
			menu:AddLine("line",1,"LineHeight",8);
			
			local tbl = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["RangeCheck"]["Range"];
			local value ={V[2],V[3],V[4]};
			
			local MaxValue=100;
			
			menu:AddLine("text", "|cffffffff距离(|cffff0000<=" .. tbl ["<"]["Value"]  .."|cffffffff)" , 
			"checked",tbl ["<"]["checked"],"func", V[1] .. "_Range_L_checked","arg1", self,"arg2", value,
			"hasSlider", 1, "sliderValue",  tbl ["<"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			V[1] .. "_Range_L_value" , "sliderArg1", self,"sliderArg2", value
			);
			
			
			menu:AddLine("text", "|cffffffff距离(|cffff0000>=" .. tbl [">"]["Value"]  .."|cffffffff)" ,
			"checked",tbl [">"]["checked"],"func", V[1] .. "_Range_H_checked","arg1", self,"arg2", value,
			"hasSlider", 1, "sliderValue",tbl [">"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			V[1] .. "_Range_H_value" , "sliderArg1", self,"sliderArg2", value
			);
				
		
		elseif V[1] == "TargetListTargetsConditionsNamesFuncBoolean" then
		
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
			
			local Buff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["FuncBoolean"];
						
			menu:AddLine("text","函数(布尔值)","isTitle",1)
			menu:AddLine()
						
			local TC = V[1] .. "AddList_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			menu:AddLine("text","选择函数","hasArrow", 1, "value", TC,"icon",ExpandArrow);
			
			menu:AddLine();
			
			if Buff["func"] then
				local str = addon:FormatTooltipText(Buff["inf"] .. "\n\n|cffffff00" .. Buff["Remarks"]);
				menu:AddLine("text",Buff["inf"],
				"tooltipText",str,"tooltipTitle",Buff["func"]);
			end
			
			
			
		elseif V[1] == "TargetListTargetsConditionsNamesIsTarget" then
		
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
			local data = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]];
			
			
			menu:AddLine("text","目标的目标","isTitle",1)
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			local text ;
			
			if data["TargetSubgroup"] == -2 then
				
				text ="|cff00ff00" .. data["Target"].. "|r";
			else
				text ="|cff00ffff" .. data["Target"].. "|r";
				
			end
			
			local TargetLayer = data["TargetLayer"] or 0;
			local TargetLayerText="";
			
			for n=1,TargetLayer do
				TargetLayerText = TargetLayerText .. "|cff00ff00-目标"
			end
			
			if TargetLayerText ~= "" then
				text = text .. TargetLayerText .. "|r";
			end
								
			local Buff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["IsTarget"]["IsDefaultTargetToPlayer"];
			local str = addon:FormatTooltipText("\n|cffff0000切换目标判断模式: |cffffffffCtrl + 鼠标左键" ..NOTT)
			menu:AddLine("text", NOT(Buff,text .. "的目标是我"),"checked",
			Buff["checked"],"func", V[1] .."_checked","arg1", self,"arg2", {Buff,"IsDefaultTargetToPlayer"},
			"tooltipText",str,"tooltipTitle","信息");
			
			-----------------------------------------
			
			
			local Buff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["IsTarget"]["IsTarget"];
			
			if not Buff["Contains"] then
				text = "(|cffff0000包含|cffffffff|r)在列表";
			else
				text = "(|cffff0000不包含|cffffffff|r)在列表";
			end
			
			
					
			if data["TargetSubgroup"] == -2 then
				
				text ="|cff00ff00" .. data["Target"].. "|r" .. text;
			else
				text ="|cff00ffff" .. data["Target"].. "|r" .. text;
				
			end
			
			local str = addon:FormatTooltipText("\n|cffff0000切换目标判断模式: |cffffffffCtrl + 鼠标左键" ..NOTT)
			local TC = V[1] .. "IsTarget_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			menu:AddLine("text",NOT(Buff,text),"hasArrow", 1, "value", TC,"checked",
			Buff["checked"],"func", V[1] .."_checked","arg1", self,"arg2", {Buff,"IsTarget"},
			"tooltipText",str,"tooltipTitle","信息")
			
			-------------------------------------------------------			
			
			
			local str = addon:FormatTooltipText(NOTT)
			
			local Buff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["IsTarget"]["IsTargetTargetToPlayer"];
			local TC = V[1] .. "IsTargetTargetToPlayer_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			menu:AddLine("text", NOT(Buff,"我的目标的目标是我"),"checked",
			Buff["checked"],"func", V[1] .."_checked","arg1", self,"arg2", {Buff,"IsTargetTargetToPlayer"},
			"tooltipText",str,"tooltipTitle","信息");
			
			local Buff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["IsTarget"]["IsFocusTargetToPlayer"];
			local TC = V[1] .. "IsFocusTargetToPlayer_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			menu:AddLine("text", NOT(Buff,"焦点目标的目标是我"),"checked",
			Buff["checked"],"func", V[1] .."_checked","arg1", self,"arg2", {Buff,"IsFocusTargetToPlayer"},
			"tooltipText",str,"tooltipTitle","信息");
			
			local Buff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["IsTarget"]["IsMouseoverTargetToPlayer"];
			local TC = V[1] .. "IsMouseoverTargetToPlayer_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			menu:AddLine("text", NOT(Buff,"鼠标目标的目标是我"),"checked",
			Buff["checked"],"func", V[1] .."_checked","arg1", self,"arg2", {Buff,"IsMouseoverTargetToPlayer"},
			"tooltipText",str,"tooltipTitle","信息");
			
			
			local Buff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["IsTarget"]["IsCustomizeTargetToPlayer"];
			local TC = V[1] .. "IsCustomizeTargetToPlayer_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			menu:AddLine("text", NOT(Buff,"(自定义)的目标是我"),"hasArrow", 1, "value", TC,"checked",
			Buff["checked"],"func", V[1] .."_checked","arg1", self,"arg2", {Buff,"IsCustomizeTargetToPlayer"},
			"tooltipText",str,"tooltipTitle","信息");
			
			
			
			
							
						
		elseif V[1] == "TargetListTargetsConditionsNamesComboPoints" then
			
			menu:AddLine("text","判断连击数","isTitle",1)
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
			
			local tbl = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["ComboPoints"];
			local value ={V[2],V[3],V[4]};
			
			
			
		
			local MaxValue=10;
			
			
			
			menu:AddLine("text", "|cffffffff连击数(|cffff0000<=" .. tbl ["<"]["Value"]  .."|cffffffff)" , 
			"checked",tbl ["<"]["checked"],"func", V[1] .. "_L_checked","arg1", self,"arg2", value,
			"hasSlider", 1, "sliderValue",  tbl ["<"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			V[1] .. "_L_value" , "sliderArg1", self,"sliderArg2", value
			);
			
			
			
		
			
			menu:AddLine("text", "|cffffffff连击数(|cffff0000>=" .. tbl [">"]["Value"]  .."|cffffffff)" ,
			"checked",tbl [">"]["checked"],"func", V[1] .. "_H_checked","arg1", self,"arg2", value,
			"hasSlider", 1, "sliderValue",tbl [">"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			V[1] .. "_H_value" , "sliderArg1", self,"sliderArg2", value
			);
			
			
		
		
		elseif V[1] == "TargetListTargetsConditionsNamesBlood" then
			
			menu:AddLine("text","血量设定","isTitle",1)
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
			
			local Blood = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Blood"];
			local value ={V[2],V[3],V[4]};
			
			menu:AddLine("text", "缺血量判断",
			"checked",Blood["Lack"],"func", V[1] .. "_Lack_checked","arg1", self,"arg2", value);
			
			
			menu:AddLine("text", "|cffffffff血量(|cffff0000%|cffffffff)显示",
			"checked",Blood["Percentage"],"func", V[1] .. "_Percentage_checked","arg1", self,"arg2", value);
			
			menu:AddLine("line",1,"LineHeight",8);
			
			local TC = V[1] .. "BloodL_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
		
			local MaxValue;
			
			if Blood["Percentage"] then
				MaxValue=100;
			else
				MaxValue=90000000;
			end
			
			menu:AddLine("text", "|cffffffff血量(|cffff0000<=" .. Blood["<"]["Value"]  .."|cffffffff)" , "hasArrow", 1, "value", TC,
			"checked",Blood["<"]["checked"],"func", V[1] .. "_L_checked","arg1", self,"arg2", value,
			"hasSlider", 1, "sliderValue",  Blood["<"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			V[1] .. "_L_value" , "sliderArg1", self,"sliderArg2", value
			);
			
			
			
			local TC = V[1] .. "BloodH_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			menu:AddLine("text", "|cffffffff血量(|cffff0000>=" .. Blood[">"]["Value"]  .."|cffffffff)" , "hasArrow", 1, "value", TC,
			"checked",Blood[">"]["checked"],"func", V[1] .. "_H_checked","arg1", self,"arg2", value,
			"hasSlider", 1, "sliderValue",Blood[">"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			V[1] .. "_H_value" , "sliderArg1", self,"sliderArg2", value
			);
		elseif V[1] == "TargetListTargetsConditionsNamesSpecialEnergy" then
			
			menu:AddLine("text","特殊能量设定","isTitle",1)
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
			
			local SpecialEnergy = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["SpecialEnergy"];
			local value ={V[2],V[3],V[4]};
			
						
			menu:AddLine("line",1,"LineHeight",8);
			
			local TC = V[1] .. "SpecialEnergyL_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
		
			local MaxValue = 9999;
			
			
			menu:AddLine("text", "|cffffffff特殊能量(|cffff0000<=" .. SpecialEnergy["<"]["Value"]  .."|cffffffff)" , "hasArrow", 1, "value", TC,
			"checked",SpecialEnergy["<"]["checked"],"func", V[1] .. "_L_checked","arg1", self,"arg2", value,
			"hasSlider", 1, "sliderValue",  SpecialEnergy["<"]["Value"] or 0, "sliderMin", -9999, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			V[1] .. "_L_value" , "sliderArg1", self,"sliderArg2", value
			);
			
			
			
			local TC = V[1] .. "SpecialEnergyH_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			menu:AddLine("text", "|cffffffff特殊能量(|cffff0000>=" .. SpecialEnergy[">"]["Value"]  .."|cffffffff)" , "hasArrow", 1, "value", TC,
			"checked",SpecialEnergy[">"]["checked"],"func", V[1] .. "_H_checked","arg1", self,"arg2", value,
			"hasSlider", 1, "sliderValue",SpecialEnergy[">"]["Value"] or 0, "sliderMin", -9999, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			V[1] .. "_H_value" , "sliderArg1", self,"sliderArg2", value
			);
				
		elseif V[1] == "TargetListTargetsConditionsNamesEnergy" then
			
			menu:AddLine("text","能量设定","isTitle",1)
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
			
			local Energy = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Energy"];
			local value ={V[2],V[3],V[4]};
			
			menu:AddLine("text", "缺能量判断",
			"checked",Energy["Lack"],"func", V[1] .. "_Lack_checked","arg1", self,"arg2", value);
			
			menu:AddLine("text", "|cffffffff能量(|cffff0000%|cffffffff)显示",
			"checked",Energy["Percentage"],"func", V[1] .. "_Percentage_checked","arg1", self,"arg2", value);
			
			menu:AddLine("line",1,"LineHeight",8);
			
			local TC = V[1] .. "EnergyL_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
		
			local MaxValue;
			
			if Energy["Percentage"] then
				MaxValue=100;
			else
				MaxValue=1000000;
			end
			
			menu:AddLine("text", "|cffffffff能量(|cffff0000<=" .. Energy["<"]["Value"]  .."|cffffffff)" , "hasArrow", 1, "value", TC,
			"checked",Energy["<"]["checked"],"func", V[1] .. "_L_checked","arg1", self,"arg2", value,
			"hasSlider", 1, "sliderValue",  Energy["<"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			V[1] .. "_L_value" , "sliderArg1", self,"sliderArg2", value
			);
			
			
			
			local TC = V[1] .. "EnergyH_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			menu:AddLine("text", "|cffffffff能量(|cffff0000>=" .. Energy[">"]["Value"]  .."|cffffffff)" , "hasArrow", 1, "value", TC,
			"checked",Energy[">"]["checked"],"func", V[1] .. "_H_checked","arg1", self,"arg2", value,
			"hasSlider", 1, "sliderValue",Energy[">"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			V[1] .. "_H_value" , "sliderArg1", self,"sliderArg2", value
			);
			
		
		elseif V[1] == "TargetListTargetsConditionsNamesDistance" then
			
			menu:AddLine("text","距离设定","isTitle",1)
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
			
			local Distance = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Distance"];
			local value ={V[2],V[3],V[4]};
			
			
			
			local TC = V[1] .. "DistanceL_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
		
			local MaxValue=50;
			
			
			
			menu:AddLine("text", "|cffffffff距离(|cffff0000<=" .. Distance["<"]["Value"]  .."|cffffffff)" , "hasArrow", 1, "value", TC,
			"checked",Distance["<"]["checked"],"func", V[1] .. "_L_checked","arg1", self,"arg2", value,
			"hasSlider", 1, "sliderValue",  Distance["<"]["Value"], "sliderMin", 1, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			V[1] .. "_L_value" , "sliderArg1", self,"sliderArg2", value
			);
			
			
			
			local TC = V[1] .. "DistanceH_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			menu:AddLine("text", "|cffffffff距离(|cffff0000>=" .. Distance[">"]["Value"]  .."|cffffffff)" , "hasArrow", 1, "value", TC,
			"checked",Distance[">"]["checked"],"func", V[1] .. "_H_checked","arg1", self,"arg2", value,
			"hasSlider", 1, "sliderValue",Distance[">"]["Value"], "sliderMin", 1, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			V[1] .. "_H_value" , "sliderArg1", self,"sliderArg2", value
			);
				
		
		elseif V[1] == "TargetListTargetsConditionsNamesClass" then
			
			menu:AddLine("text","职业设定","isTitle",1)
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
			
			local Class = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Class"]["Excluded"];
			
					
			for k, name in pairs(ClassName) do
				
				local value ={V[2],V[3],V[4],k};
			
				local color,tc;
					
				
				color = RAID_CLASS_COLORS[k]
				
				tc = CLASS_BUTTONS[k]
				--[[			
				menu:AddLine(
				"icon", "Interface\\WorldStateFrame\\Icons-Classes",
				"tCoordLeft", tc[1],
				"tCoordRight", tc[2],
				"tCoordTop", tc[3],
				"tCoordBottom", tc[4],
				
				"text", name, "textR", color.r, "textG", color.g, "textB", color.b, "checked",
				Class[k],"func",
				V[1] .. "Excluded_checked","arg1", self,"arg2", value)
				--]]
				
				menu:AddLine(
				
				"text", stGetClassicon(k,13)..name, "textR", color.r, "textG", color.g, "textB", color.b, "checked",
				Class[k],"func",
				V[1] .. "Excluded_checked","arg1", self,"arg2", value)
				
				
				
			end
		

		elseif V[1] == "TargetListTargetsConditionsNamesCastSpell" then
			
			menu:AddLine("text","读条技能设定","isTitle",1)
			menu:AddLine()
			
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
			
			local CastSpell = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["CastSpell"];
			local value ={V[2],V[3],V[4]};
			
			
			
			
			local TC = V[1] .. "CastSpellL_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
		
			local MaxValue =999 ;
			
			
			local str = addon:FormatTooltipText("当你选择该项时技能读条少于设定时间才符合条件,默认关闭。");
			menu:AddLine("text", "|cffffffff当技能施放还差(|cffff0000<=" .. CastSpell["Remaining"]["Value"]  .."|cffffffff)秒就完成时",
			"checked",CastSpell["Remaining"]["checked"] ,"func",
			 V[1] .. "_Remaining_checked","arg1", self,"arg2", value,"hasSlider", 1,"sliderDecimals",1, "sliderValue",
			 CastSpell["Remaining"]["Value"], "sliderMin", 0, "sliderMax", 999, "sliderStep", 0.1,
			 "sliderFunc",V[1] .. "_Remaining_value" , "sliderArg1", self,"sliderArg2", value,"tooltipText",str,"tooltipTitle","说明")
			
			menu:AddLine();
			
			local str = addon:FormatTooltipText("当你选择该项时技能读条超设定时间才符合条件,默认关闭。");
			menu:AddLine("text", "|cffffffff当技能施放(|cffff0000>=" ..  CastSpell["Start"]["Value"]  .."|cffffffff)秒后", "checked",CastSpell["Start"]["checked"],
			"func", V[1] .. "_Start_checked","arg1", self,"arg2", value,
			"hasSlider", 1,"sliderDecimals",1, "sliderValue",  CastSpell["Start"]["Value"], "sliderMin", 0, "sliderMax", 999, "sliderStep", 0.1, "sliderFunc",
			V[1] .. "_Start_value" , "sliderArg1", self,"sliderArg2", value,"tooltipText",str,"tooltipTitle","说明")
			
			menu:AddLine();
			
			local str = addon:FormatTooltipText("比如你需要打断所有技能那么你把该选项打勾。");
			menu:AddLine("text", "|cffffff00所有技能","checked",CastSpell["AllInterruptChecked"],
			"func", V[1] .. "_AllInterruptChecked","arg1", self,"arg2", value,"tooltipText",str,"tooltipTitle","说明")
			
			local str = addon:FormatTooltipText("判断可以打断的技能那么你把该选项打勾。");
			menu:AddLine("text", "|cffffff00可打断的技能","checked",CastSpell["InterruptChecked"],
			"func", V[1] .. "_InterruptChecked","arg1", self,"arg2", value,"tooltipText",str,"tooltipTitle","说明")
			
			menu:AddLine();
			
			local str = addon:FormatTooltipText("请确认新名称不在列表中，同名即|cffffffff 替换。");
			menu:AddLine("text", "添加技能","colorCode","|cffffff00","hasEditBox", 1,
			"editBoxText", self.text, "editBoxFunc", V[1] .."_AddSpell",
			"editBoxArg1", self,"editBoxArg2", value,"tooltipText",str,
			"icon",ExpandArrow,"tooltipTitle","说明")
			
			CollectionInf["Buff_Spell"]["function"]= V[1] .."_AddSpell";
			CollectionInf["Buff_Spell"]["level"]=level;
			CollectionInf["Buff_Spell"]["value"]={value};
			
			menu:AddLine("text", "选择添加技能","colorCode","|cffffff00","hasArrow", 1, "value", "DefaultListCollectionInfBuffSpell","icon",ExpandArrow)
			
			
			menu:AddLine();
			
		
			local disabled = CastSpell["AllInterruptChecked"];
			
			for k,v in pairs(CastSpell["Spells"]) do
			
				if not v["Texture"] then
					v["Texture"]="";
				end
				local text ;
				if disabled then
					text = k .. ". " .. v["Name"];
				else
					text = "|cff00ff00" .. k .. ". |cffffffff" .. v["Name"];
				end
				
				local str = addon:FormatTooltipText(v["Name"].. "\n\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键")
				local value ={V[2],V[3],V[4],k};
				menu:AddLine("text", text,"icon",v["Texture"],"disabled",disabled,
				"func",V[1] .. "_Del", "arg1", self, "arg2", value,"tooltipText",str,"tooltipTitle","信息");
				
				
			end
		
		
		elseif V[1] == "TargetListTargetsConditionsNamesBuff" or  V[1] == "TargetListTargetsConditionsNamesBuffNew" then
		
			
			local E={};

			E.KEY_BUFF="|cff00ff00指定该Buff是否自己的:\n\n|cffff0000启用: |cffffffffShift + 鼠标左键\n\n|cff00ff00当有同名出现时通过启用对比图标来判断:\n\n|cffff0000启用: |cffffffffCtrl + 鼠标左键\n\n|cff00ff00当有同名出现时通过启用对比Id来判断:\n\n|cffff0000启用: |cffffffffAlt + 鼠标左键\n\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键|r";


			E.IsTexture="|cff00ffff图|r";
			E.IsSpellId="|cff00ffffId|r";
			E.IsPlayer_Player="|cff00ffff我|r";
			E.IsPlayer_NoPlayer="|cff00ffff否|r";
			E.IsPlayer_All="";
			E.IsCd_Start="|cff00ffff出|r";
			
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
			
			menu:AddLine("text", "设定Buff","isTitle",1);
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
			
			if V[1] == "TargetListTargetsConditionsNamesBuffNew" then
			
				local BuffTbl = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]];
				
				if not BuffTbl["NewBuff"] then
					BuffTbl["NewBuff"]={};
					BuffTbl["NewBuff"]["buffs"]={};
				end
				
				if not BuffTbl["NewBuff"]["buffs"] then
					BuffTbl["NewBuff"]["buffs"]={};
				end
				
				local tbl=BuffTbl["NewBuff"]
				local Solution = tbl["buffs"];
				
				
				tbl["IsOrAnd"] = tbl["IsOrAnd"] or "Or";
				
				local str = addon:FormatTooltipText("只要下列的Buff其中1个满足条件。")
				menu:AddLine("text", "|cffffffff或者","isRadio",1,"checked",
				tbl["IsOrAnd"]== "Or","func", "SetTbl","arg1", self,"arg2",
				{tbl,"IsOrAnd","Or",level},
				"tooltipText",str,"tooltipTitle","信息");
				
				local str = addon:FormatTooltipText("需要下列的Buff都满足条件。")
				menu:AddLine("text", "|cffffffff并且","isRadio",1,"checked",
				tbl["IsOrAnd"]== "And","func", "SetTbl","arg1", self,"arg2",
				{tbl,"IsOrAnd","And",level},
				"tooltipText",str,"tooltipTitle","信息");
				
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
				local HELPFUL,HARMFUL,DEFAULT =0,0,0;
				
				for k,v in pairs(Solution) do
					
					if v["IsType"]== "HELPFUL" then
						DEFAULT=DEFAULT+1;
						HELPFUL=HELPFUL+1;
						
					elseif v["IsType"]== "HARMFUL" then
						DEFAULT=DEFAULT+1;
						HARMFUL=HARMFUL+1;
						
					end
					
				end
				
				local str = addon:FormatTooltipText("全部Buff设为默认值。")
				menu:AddLine("text", "|cffffffff全部设为默认 |r("..#Solution - DEFAULT.."|cffff0000/|r"..#Solution..")",
				"func", "SetAllBuffDefault","arg1", self,"arg2",Solution,
				"text_X",-22,
				"tooltipText",str,"tooltipTitle","信息");
				
				local str = addon:FormatTooltipText("全部Buff设为有益Buff。")
				menu:AddLine("text", "|cff7FFF00全部设为有益 |r(|cff7FFF00"..HELPFUL.."|cffff0000/|r"..#Solution..")",
				"func", "SetAllBuffHELPFUL","arg1", self,"arg2",Solution,
				"text_X",-22,
				"tooltipText",str,"tooltipTitle","信息");
				
				local str = addon:FormatTooltipText("全部Buff设为无益DeBuff。")
				menu:AddLine("text", "|cff8B008B全部设为无益 |r(|cff8B008B"..HARMFUL.."|cffff0000/|r"..#Solution..")",
				"func", "SetAllBuffHARMFUL","arg1", self,"arg2",Solution,
				"text_X",-22,
				"tooltipText",str,"tooltipTitle","信息");
				
				
				-------------------------
				
				
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
		
				
				local str = addon:FormatTooltipText("可以输入Buff名称/Buff Id");
				
				menu:AddLine("text", "添加Buff到列表","colorCode","|cffffff00","hasEditBox", 1, "editBoxText", self.text, "editBoxFunc",
				"Default_AddBuff", "editBoxArg1", self,"editBoxArg2",
				Solution,"tooltipText",str,"tooltipTitle","说明",
				"text_X",-22
				);
				
				menu:AddLine("line",1);
				
				
				
				CollectionInf["Buff_Spell"]["Ex"]=SuperTreatmentDBF["CollectionInf"];
				menu:AddLine("text", "选择Buff到列表","colorCode","|cffffff00","hasArrow", 1, 
				"OpenMenu",SuperTreatment["Menu"]["UnitBuffListMenu"],
				"OpenMenuValue",{CollectionInf["Buff_Spell"],{Solution,-1},function() DropDownMenu:Refresh(level); end},
				"text_X",-22
				);
				
				
				
				
				
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
				
				CollectionInf["Buff_Spell"]["Ex"]=SuperTreatmentDBF["CollectionInf"];
				
				
				local NoBuffNameCount=0;
			
				for k,v in pairs(Solution) do
					
					if not v["Cd"] then
					
						v["Cd"]={};
						v["Cd"][">"]={};
						v["Cd"]["<"]={};
						v["Cd"]["<"]["Value"]=0;
						v["Cd"][">"]["Value"]=0;
						
						v["Count"]={};
						v["Count"][">"]={};
						v["Count"]["<"]={};
						v["Count"]["<"]["Value"]=0;
						v["Count"][">"]["Value"]=0;
						
						v["Class"]={};
						
					end
					
					v["IsSpellIdTexture"] = v["IsSpellIdTexture"] or "IsName";
					v["IsType"] = v["IsType"] or "Auto";
					v["IsPlayer"] = v["IsPlayer"] or "All";
					v["IsCanceLable"] = v["IsCanceLable"] or "No";
					v["IsRaid"] = v["IsRaid"] or "No";
					
					
					local RightText;
					local Name,_,Texture=GetSpellInfo(v.SpellId);
					Texture = Texture or "";
					
					Name =  Name or ((v.Name or v.SpellId) .."(无效)");
					local text="";
					if v["IsCd"] == "No" then
						text = "|cff104E8B" .. k .. ". " .. Name ;
					elseif v["IsType"]== "HELPFUL" then
						text = "|cff104E8B" .. k .. ". |cff7FFF00" .. Name;
					elseif v["IsType"]== "HARMFUL" then
						text = "|cff104E8B" .. k .. ". |cff8B008B" .. Name;
					else
						text = "|cff104E8B" .. k .. ". |cffffffff" .. Name;
					end
						
				
				
					if  v["IsSpellIdTexture"]=="IsTexture" then
						if RightText then
							RightText = RightText ..",".. E.IsTexture;
						else
							RightText =  E.IsTexture;
						end
						
						NoBuffNameCount = NoBuffNameCount +1;
						
					elseif  v["IsSpellIdTexture"]=="IsSpellId" then
						
						if RightText then
							RightText = RightText ..",".. E.IsSpellId;
						else
							RightText =  E.IsSpellId;
						end
						NoBuffNameCount = NoBuffNameCount +1;
					end
					
					if  v["IsPlayer"] == "PLAYER" then
						
						if RightText then
							RightText = RightText ..",".. E.IsPlayer_Player;
						else
							RightText =  E.IsPlayer_Player;
						end
						NoBuffNameCount = NoBuffNameCount +1;
						
					elseif  v["IsPlayer"] == "NoPlayer" then
						
						if RightText then
							RightText = RightText ..",".. E.IsPlayer_NoPlayer;
						else
							RightText =  E.IsPlayer_NoPlayer;
						end
						NoBuffNameCount = NoBuffNameCount +1;
						
					else
						
						
						--RightText =  E.IsPlayer_All;
						
					end
					
					
					
					if v["IsCd"]=="Start" then
						
						if RightText then
							RightText = RightText ..",".. E.IsCd_Start;
						else
							RightText =  E.IsCd_Start;
						end
					end
					--local Macro_Spell = strsub(n,1,1) ;
					--RightText = gsub(RightText,",","",1);
					if RightText then
						RightText = "|cffff0000[" .. RightText .. "|cffff0000]";
					end
					
					
					--[[
					if  v["IsSpellIdTexture"]=="IsTexture" then
						text = text .. E.IsTexture;
						NoBuffNameCount = NoBuffNameCount +1;
						
					elseif  v["IsSpellIdTexture"]=="IsSpellId" then
						text = text .. E.IsSpellId;
						NoBuffNameCount = NoBuffNameCount +1;
					end
					
					if  v["IsPlayer"] == "PLAYER" then
						text = text .. E.IsPlayer_Player;
						NoBuffNameCount = NoBuffNameCount +1;
						
					elseif  v["IsPlayer"] == "NoPlayer" then
						text = text .. E.IsPlayer_NoPlayer;
						NoBuffNameCount = NoBuffNameCount +1;
						
					else
						text = text .. E.IsPlayer_All;
					end
					
					
					
					if v["IsCd"]=="Start" then
						text = text .. E.IsCd_Start;
					end
					--]]
					
					local str = addon:FormatTooltipText("\nId: |r" ..(v["SpellId"] or "") .. "\n\n" .. "提示：鼠标右键可以在当前位置插入Buff/技能")
					menu:AddLine("text", text,"icon",Texture,
					
					"tooltipText",str,"tooltipTitle",Name,
					"CloseButtonFunc","Del_Tbl_Index","CloseButtonArg1",self,"CloseButtonArg2",{Solution,k,level},
					"hasArrow", 1, 
					"OpenMenu",SuperTreatment["Menu"]["SetBuffMenu"] ,"OpenMenuValue",{v,k,tbl},
					"OpenRightMenu",SuperTreatment["Menu"]["UnitBuffListMenu"],
					"OpenRightMenuValue",
					{CollectionInf["Buff_Spell"],{Solution,k},function() DropDownMenu:Refresh(level); end},
					"Spell",v.SpellId,
					"RightText",RightText
					);
					
				end
				
				tbl["NoBuffNameCount"]=NoBuffNameCount;
				
				
				------------------
			
			
			
			else
			
				menu:AddLine("text","判断Buff","isTitle",1)
				menu:AddLine()
				
				
				local Buff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Buff"]["Time"];
				local value ={V[2],V[3],V[4]};
				
				local TC = V[1] .. "Time_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
				menu:AddLine("text", "|cffffffff判断Buff时间","hasArrow", 1, "value", TC,"checked",
				Buff["checked"],"func", V[1] .."_Time_Checked","arg1", self,"arg2", value)
							
				
				menu:AddLine();
				
				local IsBuff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Buff"]["IsBuff"];
				local TC = V[1] .. "IsBuff_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
				menu:AddLine("text", "|cffffffff判断Buff(有/无)","hasArrow", 1, "value", TC,"checked",
				IsBuff["checked"],"func", V[1] .."_IsBuff_Checked","arg1", self,"arg2", value)
				
				menu:AddLine();
				
				local IsBuff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Buff"]["Layer"];
				local TC = V[1] .. "Layer_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
				menu:AddLine("text", "|cffffffff判断Buff层数","hasArrow", 1, "value", TC,"checked",
				IsBuff["checked"],"func", V[1] .."_Layer_Checked","arg1", self,"arg2", value)
				
				menu:AddLine();
				
				local IsBuff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Buff"];
				
				local str = addon:FormatTooltipText("判断Buff是否属于自己。\n|cffff0000配合:|r\n1. 判断Buff时间\n2. 判断Buff(有/无)\n3. 判断Buff层数\n这3项使用。")
				menu:AddLine("text", "|cffffffff判断Buff是否属于自己","checked",
				IsBuff["OwnChecked"],"func", V[1] .."_Own_Checked","arg1", self,"arg2", IsBuff,
				"tooltipText",str,"tooltipTitle","信息");
			end
			
			
		elseif V[1] == "TargetListTargetsConditionsNameswbuff" then
		
			menu:AddLine("text","武器附魔效果","isTitle",1)
			menu:AddLine()
			
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
			
			local tbl = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["wbuff"];
			local value ={V[2],V[3],V[4]};
	
			local MaxValue=300;
	
			menu:AddLine("text", "|cffffffff附魔效果(|cffff0000<=" .. tbl ["<"]["Value"]  .."|cffffffff)秒",
			"checked",tbl ["<"]["checked"],"func", V[1] .. "_L_checked","arg1", self,"arg2", value,
			"hasSlider", 1, "sliderValue",  tbl ["<"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			V[1] .. "_L_value" , "sliderArg1", self,"sliderArg2", value
			);
		
			menu:AddLine("text", "|cffffffff附魔效果(|cffff0000>=" .. tbl [">"]["Value"]  .."|cffffffff)秒" ,
			"checked",tbl [">"]["checked"],"func", V[1] .. "_H_checked","arg1", self,"arg2", value,
			"hasSlider", 1, "sliderValue",tbl [">"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			V[1] .. "_H_value" , "sliderArg1", self,"sliderArg2", value
			);
			
			menu:AddLine();
			
			menu:AddLine("text", "判断主手武器","isRadio", 0,"checked",tbl["MainChecked"] ,
			"func",  V[1] .. "MainChecked","arg1", self,"arg2",value)
			menu:AddLine("text", "判断副手武器","isRadio", 0,"checked",not tbl["MainChecked"] ,
			"func",  V[1] .. "MainChecked","arg1", self,"arg2",value)
		
		elseif V[1] == "TargetListTargetsConditionsNamesCooldown" then
		
			menu:AddLine("text","技能物品冷却","isTitle",1)
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
			
			local tbl = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Cooldown"];
			local value ={V[2],V[3],V[4]};
	
			local MaxValue=10000;
	
			menu:AddLine("text", "|cffffffff冷却(|cffff0000<=" .. tbl ["<"]["Value"]  .."|cffffffff)秒",
			"checked",tbl ["<"]["checked"],"func", V[1] .. "_L_checked","arg1", self,"arg2", value,
			"hasSlider", 1, "sliderValue",  tbl ["<"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 0.1, "sliderFunc",
			V[1] .. "_L_value" , "sliderArg1", self,"sliderArg2", value,"sliderDecimals",1
			);
		
			menu:AddLine("text", "|cffffffff冷却(|cffff0000>=" .. tbl [">"]["Value"]  .."|cffffffff)秒" ,
			"checked",tbl [">"]["checked"],"func", V[1] .. "_H_checked","arg1", self,"arg2", value,
			"hasSlider", 1, "sliderValue",tbl [">"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 0.1, "sliderFunc",
			V[1] .. "_H_value" , "sliderArg1", self,"sliderArg2", value,"sliderDecimals",1
			);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			local str = addon:FormatTooltipText("请确认新名称不在列表中，同名即|cffffffff 替换。");
			menu:AddLine("text", "添加技能物品","colorCode","|cffffff00","hasEditBox", 1,
			"editBoxText", self.text, "editBoxFunc", V[1] .."_AddSpell",
			"editBoxArg1", self,"editBoxArg2", value,"tooltipText",str,
			"tooltipTitle","说明")
			
			--CollectionInf["Buff_Spell"]["function"]= V[1] .."_AddSpell";
			--CollectionInf["Buff_Spell"]["level"]=level;
			--CollectionInf["Buff_Spell"]["value"]={value};
			
			--menu:AddLine("text", "选择添加技能物品","colorCode","|cffffff00","hasArrow", 1, "value", "DefaultListCollectionInfBuffSpell")
			
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
		
			
			for k,v in pairs(tbl["name"]) do
				
				if not v.SpellId then
					local spellId,spellLink,spellRank,Texture = amfindSpellItemInf(v["Name"]);
					if spellId then
						
						v["Name"] = GetSpellInfo(spellId);
						v["SpellId"]=spellId;
						v["Texture"]=Texture;
					end
					
				end
							
				
				if not v["Texture"] then
					v["Texture"]="";
				end
				local text = "|cff00ff00" .. k .. ". |cffffffff" .. v["Name"];
				
				
				local str = addon:FormatTooltipText("\nId: |r" ..(v["SpellId"] or "") .. "\n\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键")
				local value ={V[2],V[3],V[4],k};
				menu:AddLine("text", text,"icon",v["Texture"],
				"func",V[1] .. "_Del", "arg1", self, "arg2", value,"tooltipText",str,"tooltipTitle","信息",
				"Spell",v.SpellId,"RightText",RightText);
				
				
			end
			
		elseif V[1] == "TargetListTargetsConditionsNamesRune" then
		
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
			
			menu:AddLine("text","判断符文","isTitle",1)
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			local Buff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Rune"]["RuneCount"];
			local value ={V[2],V[3],V[4]};
			
			local TC = V[1] .. "RuneCount_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			menu:AddLine("text", "|cffffffff判断符文数量","hasArrow", 1, "value", TC,"checked",
			Buff["checked"],"func", V[1] .."_RuneCount_Checked","arg1", self,"arg2", value)
			
			local Buff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Rune"]["RuneCooldown"];
			local value ={V[2],V[3],V[4]};
			
			local TC = V[1] .. "RuneCooldown_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			menu:AddLine("text", "|cffffffff判断符文剩余时间","hasArrow", 1, "value", TC,"checked",
			Buff["checked"],"func", V[1] .."_RuneCooldown_Checked","arg1", self,"arg2", value)
						
		
		elseif V[1] == "TargetListTargetsConditionsNamesTotem" then
		
			menu:AddLine("text","判断图腾剩余时间","isTitle",1)
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
			
			local tbl = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Totem"];
			
	
			local MaxValue=300;
			local value ={V[2],V[3],V[4],"<"};
			menu:AddLine("text", "|cffffffff剩余时间(|cffff0000<=" .. tbl ["<"]["Value"]  .."|cffffffff)秒",
			"checked",tbl ["<"]["checked"],"func", V[1] .. "_checked","arg1", self,"arg2", value,
			"hasSlider", 1, "sliderValue",  tbl ["<"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			V[1] .. "_value" , "sliderArg1", self,"sliderArg2", value
			);
			
			local value ={V[2],V[3],V[4],">"};
			menu:AddLine("text", "|cffffffff剩余时间(|cffff0000>=" .. tbl [">"]["Value"]  .."|cffffffff)秒" ,
			"checked",tbl [">"]["checked"],"func", V[1] .. "_checked","arg1", self,"arg2", value,
			"hasSlider", 1, "sliderValue",tbl [">"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			V[1] .. "_value" , "sliderArg1", self,"sliderArg2", value
			);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			menu:AddLine("text","|cffffff00名称:|r" .. tbl["name"],"notClickable",1);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			local str = addon:FormatTooltipText("如果列表中没显示图腾那么请你施放图腾，这样图腾就会出现在列表里共你选择。\n\n|cffff0000只有在图腾存在的时候才可以出现在列表里，如果没有请再点击菜单刷新。");
			local TC = V[1] .. "Select_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
			menu:AddLine("text", "选择要判断的图腾","colorCode","|cffffff00","hasArrow", 1,
			"value", TC,
			"tooltipText",str,"tooltipTitle","说明");
			
		
		end
	
	elseif level == 7 then -- 7级菜单内容
	
		local V = addon:DecompositionValue(value);
		
		if V[1] == "TargetListTargetsConditionsNamesPlayerRangeCheckAnglePlayerRangeCheckAngleBuff" then
			
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
			local E={};
			E.IsTexture="|cff00ffff图|r";
			E.IsSpellId="|cff00ffffId|r";
			E.IsPlayer_Player="|cff00ffff我|r";
			E.IsPlayer_NoPlayer="|cff00ffff否|r";
			E.IsPlayer_All="";
			E.IsCd_Start="|cff00ffff出|r";
			
			menu:AddLine("text", "设定Buff","isTitle",1);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
		
			
			
			tbl=Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["PlayerRangeCheckAngle"]["NewBuff"]
			Solution = tbl["buffs"];
			
			
			tbl["IsOrAnd"] = tbl["IsOrAnd"] or "Or";
			
			local str = addon:FormatTooltipText("只要下列的Buff其中1个满足条件。")
			menu:AddLine("text", "|cffffffff或者","isRadio",1,"checked",
			tbl["IsOrAnd"]== "Or","func", "SetTbl","arg1", self,"arg2",
			{tbl,"IsOrAnd","Or",level},
			"tooltipText",str,"tooltipTitle","信息");
			
			local str = addon:FormatTooltipText("需要下列的Buff都满足条件。")
			menu:AddLine("text", "|cffffffff并且","isRadio",1,"checked",
			tbl["IsOrAnd"]== "And","func", "SetTbl","arg1", self,"arg2",
			{tbl,"IsOrAnd","And",level},
			"tooltipText",str,"tooltipTitle","信息");
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			local HELPFUL,HARMFUL,DEFAULT =0,0,0;
			
			for k,v in pairs(Solution) do
				
				if v["IsType"]== "HELPFUL" then
					DEFAULT=DEFAULT+1;
					HELPFUL=HELPFUL+1;
					
				elseif v["IsType"]== "HARMFUL" then
					DEFAULT=DEFAULT+1;
					HARMFUL=HARMFUL+1;
					
				end
				
			end
			
			local str = addon:FormatTooltipText("全部Buff设为默认值。")
			menu:AddLine("text", "|cffffffff全部设为默认 |r("..#Solution - DEFAULT.."|cffff0000/|r"..#Solution..")",
			"func", "SetAllBuffDefault","arg1", self,"arg2",Solution,
			"text_X",-22,
			"tooltipText",str,"tooltipTitle","信息");
			
			local str = addon:FormatTooltipText("全部Buff设为有益Buff。")
			menu:AddLine("text", "|cff7FFF00全部设为有益 |r(|cff7FFF00"..HELPFUL.."|cffff0000/|r"..#Solution..")",
			"func", "SetAllBuffHELPFUL","arg1", self,"arg2",Solution,
			"text_X",-22,
			"tooltipText",str,"tooltipTitle","信息");
			
			local str = addon:FormatTooltipText("全部Buff设为无益DeBuff。")
			menu:AddLine("text", "|cff8B008B全部设为无益 |r(|cff8B008B"..HARMFUL.."|cffff0000/|r"..#Solution..")",
			"func", "SetAllBuffHARMFUL","arg1", self,"arg2",Solution,
			"text_X",-22,
			"tooltipText",str,"tooltipTitle","信息");
			
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
		
			
			local str = addon:FormatTooltipText("可以输入Buff名称/Buff Id");
			
			menu:AddLine("text", "添加Buff到列表","colorCode","|cffffff00","hasEditBox", 1, "editBoxText", self.text, "editBoxFunc",
			"Default_AddBuff", "editBoxArg1", self,"editBoxArg2",
			Solution,"tooltipText",str,"tooltipTitle","说明",
			"text_X",-22
			);
			
			menu:AddLine("line",1);
			
			
			
			CollectionInf["Buff_Spell"]["Ex"]=SuperTreatmentDBF["CollectionInf"];
			menu:AddLine("text", "选择Buff到列表","colorCode","|cffffff00","hasArrow", 1, 
			"OpenMenu",SuperTreatment["Menu"]["UnitBuffListMenu"],
			"OpenMenuValue",{CollectionInf["Buff_Spell"],{Solution,-1},function() DropDownMenu:Refresh(level); end},
			"text_X",-22
			);
			
			
			
			
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			CollectionInf["Buff_Spell"]["Ex"]=SuperTreatmentDBF["CollectionInf"];
			AmminimumFast_SortBuff_index=index;
			
			local NoBuffNameCount=0;
			
			for k,v in pairs(Solution) do
				
				if not v["Cd"] then
				
					v["Cd"]={};
					v["Cd"][">"]={};
					v["Cd"]["<"]={};
					v["Cd"]["<"]["Value"]=0;
					v["Cd"][">"]["Value"]=0;
					
					v["Count"]={};
					v["Count"][">"]={};
					v["Count"]["<"]={};
					v["Count"]["<"]["Value"]=0;
					v["Count"][">"]["Value"]=0;
					
					v["Class"]={};
					
				end
				
				v["IsSpellIdTexture"] = v["IsSpellIdTexture"] or "IsName";
				v["IsType"] = v["IsType"] or "Auto";
				v["IsPlayer"] = v["IsPlayer"] or "All";
				v["IsCanceLable"] = v["IsCanceLable"] or "No";
				v["IsRaid"] = v["IsRaid"] or "No";
				
				
				local RightText;
				local Name,_,Texture=GetSpellInfo(v.SpellId);
				Texture = Texture or "";
				
				
				local text="";
				if v["IsCd"] == "No" then
					text = "|cffff0000" .. k .. ". " .. Name;
				elseif v["IsType"]== "HELPFUL" then
					text = "|cff00ff00" .. k .. ". |cff7FFF00" .. Name;
				elseif v["IsType"]== "HARMFUL" then
					text = "|cff00ff00" .. k .. ". |cff8B008B" .. Name;
				else
					text = "|cff00ff00" .. k .. ". |cffffffff" .. Name;
				end
					
			
			
				if  v["IsSpellIdTexture"]=="IsTexture" then
					if RightText then
						RightText = RightText ..",".. E.IsTexture;
					else
						RightText =  E.IsTexture;
					end
					
					NoBuffNameCount = NoBuffNameCount +1;
					
				elseif  v["IsSpellIdTexture"]=="IsSpellId" then
					
					if RightText then
						RightText = RightText ..",".. E.IsSpellId;
					else
						RightText =  E.IsSpellId;
					end
					NoBuffNameCount = NoBuffNameCount +1;
				end
				
				if  v["IsPlayer"] == "PLAYER" then
					
					if RightText then
						RightText = RightText ..",".. E.IsPlayer_Player;
					else
						RightText =  E.IsPlayer_Player;
					end
					NoBuffNameCount = NoBuffNameCount +1;
					
				elseif  v["IsPlayer"] == "NoPlayer" then
					
					if RightText then
						RightText = RightText ..",".. E.IsPlayer_NoPlayer;
					else
						RightText =  E.IsPlayer_NoPlayer;
					end
					NoBuffNameCount = NoBuffNameCount +1;
					
				else
					
					
					--RightText =  E.IsPlayer_All;
					
				end
				
				
				
				if v["IsCd"]=="Start" then
					
					if RightText then
						RightText = RightText ..",".. E.IsCd_Start;
					else
						RightText =  E.IsCd_Start;
					end
				end
				--local Macro_Spell = strsub(n,1,1) ;
				--RightText = gsub(RightText,",","",1);
				if RightText then
					RightText = "|cffff0000[" .. RightText .. "|cffff0000]";
				end
				
				
				--[[
				if  v["IsSpellIdTexture"]=="IsTexture" then
					text = text .. E.IsTexture;
					NoBuffNameCount = NoBuffNameCount +1;
					
				elseif  v["IsSpellIdTexture"]=="IsSpellId" then
					text = text .. E.IsSpellId;
					NoBuffNameCount = NoBuffNameCount +1;
				end
				
				if  v["IsPlayer"] == "PLAYER" then
					text = text .. E.IsPlayer_Player;
					NoBuffNameCount = NoBuffNameCount +1;
					
				elseif  v["IsPlayer"] == "NoPlayer" then
					text = text .. E.IsPlayer_NoPlayer;
					NoBuffNameCount = NoBuffNameCount +1;
					
				else
					text = text .. E.IsPlayer_All;
				end
				
				
				
				if v["IsCd"]=="Start" then
					text = text .. E.IsCd_Start;
				end
				--]]
				
				local str = addon:FormatTooltipText("\nId: |r" ..(v["SpellId"] or "") .. "\n\n" .. "提示：鼠标右键可以在当前位置插入Buff/技能")
				menu:AddLine("text", text,"icon",Texture,
				
				"tooltipText",str,"tooltipTitle",Name,
				"CloseButtonFunc","Del_Tbl_Index","CloseButtonArg1",self,"CloseButtonArg2",{Solution,k,level},
				"hasArrow", 1, 
				"OpenMenu",SuperTreatment["Menu"]["SetBuffMenu"] ,"OpenMenuValue",{v,k,tbl},
				"OpenRightMenu",SuperTreatment["Menu"]["UnitBuffListMenu"],
				"OpenRightMenuValue",
				{CollectionInf["Buff_Spell"],{Solution,k},function() DropDownMenu:Refresh(level); end},
				"Spell",v.SpellId,
				"RightText",RightText
				);
				
			end
			
			tbl["NoBuffNameCount"]=NoBuffNameCount;
		
			
			
			
		elseif V[1] == "TargetListTargetsConditionsNamesFuncBooleanAddList" then
			
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
			
			
			
			local Buff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["FuncBoolean"];
			
			for k, data in pairs(UnitFunc) do
				
				local str = addon:FormatTooltipText(data["inf"] .. "\n\n|cffffff00" .. data["Remarks"]);
				menu:AddLine("text","|cff00ff00" .. k .. ". |cffffffff" .. data["inf"],
				"tooltipText",str,"tooltipTitle",data["func"],"notCheckable",1,
				"func", V[1] .."_Add","arg1", self,"arg2", {Buff,k}
				);
			end
			
		elseif V[1] == "TargetListTargetsConditionsNamesIsTargetIsCustomizeTargetToPlayer" then
			
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
			
			menu:AddLine("text","目标列表","isTitle",1);
			menu:AddLine();
			local Buff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["IsTarget"]["IsCustomizeTargetToPlayer"];
			
			
			
			local str = addon:FormatTooltipText("点击，可以把当前目标添加到目标列表，当然你也可以输入。");
			menu:AddLine("text", "输入添加目标","colorCode","|cffffff00","hasEditBox", 1,
			"editBoxText", self.text, "editBoxFunc", V[1] .."_Add",
			"editBoxArg1", self,"editBoxArg2", Buff,"tooltipText",str,
			"icon",ExpandArrow,"tooltipTitle","说明",
			"func", V[1] .. "_TargetAdd","arg1", self,"arg2", Buff	
			);
			
			for k, data in pairs(Buff["Targets"]) do
				
				local color,tc;
				local playerClass, englishClass = UnitClass(k)	
				local str = addon:FormatTooltipText("只有目前可以判断的目标才有职业图标\n\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键")
				
				if englishClass then
					color = RAID_CLASS_COLORS[englishClass]
					tc = CLASS_BUTTONS[englishClass]
								
					menu:AddLine(
					"icon", "Interface\\WorldStateFrame\\Icons-Classes",
					"tCoordLeft", tc[1],
					"tCoordRight", tc[2],
					"tCoordTop", tc[3],
					"tCoordBottom", tc[4],
					
					"text", k, "textR", color.r, "textG", color.g, "textB", color.b, "func",
					V[1] .. "_IsTargets_Del","arg1", self,"arg2", {Buff["Targets"],k},
					"tooltipText",str,"tooltipTitle",k
					);
					
				else
				
					menu:AddLine(		
					"text", k, "func",V[1] .. "_IsTargets_Del","arg1", self,"arg2", {Buff["Targets"],k},
					"tooltipText",str,"tooltipTitle",k
					);
					
				end
				
				
			end
			
			
		
		
		elseif V[1] == "TargetListTargetsConditionsNamesIsTargetIsTarget" then
			
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
			
			menu:AddLine("text","目标列表","isTitle",1);
			menu:AddLine();
			local Buff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["IsTarget"]["IsTarget"];
			
			
			
			local str = addon:FormatTooltipText("点击，可以把当前目标添加到目标列表，当然你也可以输入。");
			menu:AddLine("text", "输入添加目标","colorCode","|cffffff00","hasEditBox", 1,
			"editBoxText", self.text, "editBoxFunc", V[1] .."_Add",
			"editBoxArg1", self,"editBoxArg2", Buff,"tooltipText",str,
			"icon",ExpandArrow,"tooltipTitle","说明",
			"func", V[1] .. "_TargetAdd","arg1", self,"arg2", Buff	
			);
			
			for k, data in pairs(Buff["Targets"]) do
				
				local color,tc;
				local playerClass, englishClass = UnitClass(k)	
				local str = addon:FormatTooltipText("只有目前可以判断的目标才有职业图标\n\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键")
				
				if englishClass then
					color = RAID_CLASS_COLORS[englishClass]
					tc = CLASS_BUTTONS[englishClass]
								
					menu:AddLine(
					"icon", "Interface\\WorldStateFrame\\Icons-Classes",
					"tCoordLeft", tc[1],
					"tCoordRight", tc[2],
					"tCoordTop", tc[3],
					"tCoordBottom", tc[4],
					
					"text", k, "textR", color.r, "textG", color.g, "textB", color.b, "func",
					V[1] .. "_IsTargets_Del","arg1", self,"arg2", {Buff["Targets"],k},
					"tooltipText",str,"tooltipTitle",k
					);
					
				else
				
					menu:AddLine(		
					"text", k, "func",V[1] .. "_IsTargets_Del","arg1", self,"arg2", {Buff["Targets"],k},
					"tooltipText",str,"tooltipTitle",k
					);
					
				end
				
				
			end
			
			
		elseif V[1] == "TargetListTargetsConditionsNamesTotemSelect" then
			
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
			
			menu:AddLine("text","图腾列表","isTitle",1);
			menu:AddLine();
			local Buff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Totem"];
			local value ={V[2],V[3],V[4]};
			
			if not CollectionInf["Buff_Spell"]["Totems"] then
				CollectionInf["Buff_Spell"]["Totems"]={};
				
			end
			
			for i = 1, 4 do
			
				local haveTotem, name, startTime, duration, icon = GetTotemInfo(i)
				if name and haveTotem then
					if haveTotem and string.len(name) > 0 then
					
						if not CollectionInf["Buff_Spell"]["Totems"][name] then
							CollectionInf["Buff_Spell"]["Totems"][name]={};
							CollectionInf["Buff_Spell"]["Totems"][name]["Texture"]=icon;
						end
						
					end
					
				end
	  	
			end
			
			
			for k,data in pairs(CollectionInf["Buff_Spell"]["Totems"]) do
				
				if data then
				local str = addon:FormatTooltipText("\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键")
				local value ={V[2],V[3],V[4],k};
				menu:AddLine("text", k,"icon",data["Texture"],
				"func",V[1] .. "_Add", "arg1", self, "arg2", {Buff,k},
				"tooltipText",str,"tooltipTitle", k);
				end
			end
			
			
		
		
		elseif V[1] == "TargetListTargetsConditionsNamesBuffTime" then
			
			
			
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
			
			local str = addon:FormatTooltipText("BUFF出现后开始计时的时间，跟冷却时间相反")
			menu:AddLine("text","BUFF出现时间:","isTitle",1,"tooltipText",str,"tooltipTitle","说明");
			menu:AddLine();
			
			
			
			local Buff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Buff"]["Time"];
			local BuffInf = Buff["BuffName"];
			local value ={V[2],V[3],V[4]};
			
			local MaxValue =999 ;
			local Va = Buff["Start"]["Value"];
			local checked = Buff["Start"]["checked"]
			--local str = addon:FormatTooltipText("当你选择该项时，只能判断一个Buff。多个时会出现无法预知的后果。")
			menu:AddLine("text", "|cffffffff时间(|cffff0000>=" .. Va   .."|cffffffff)秒",
			"checked",checked,"func", V[1] .. "_Start_Checked","arg1", self,"arg2", {Buff["Start"],"checked"},
			"hasSlider", 1,"sliderDecimals",1, "sliderValue", Va ,
			"sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 0.1, "sliderFunc",
			V[1] .. "_Start_Value", "sliderArg1", self,"sliderArg2", {Buff["Start"],"Value"})
			
			
			if not Buff["Start"]["MaxValue"] then
				Buff["Start"]["MaxValue"]=0;
			end
			
			local MaxValue =999 ;
			local Va = Buff["Start"]["MaxValue"];
			local checked = Buff["Start"]["Maxchecked"]
			--local str = addon:FormatTooltipText("当你选择该项时，只能判断一个Buff。多个时会出现无法预知的后果。")
			menu:AddLine("text", "|cffffffff时间(|cffff0000<=" .. Va   .."|cffffffff)秒",
			"checked",checked,"func", V[1] .. "_Start_Checked","arg1", self,"arg2", {Buff["Start"],"Maxchecked"},
			"hasSlider", 1,"sliderDecimals",1, "sliderValue", Va ,
			"sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 0.1, "sliderFunc",
			V[1] .. "_Start_Value", "sliderArg1", self,"sliderArg2", {Buff["Start"],"MaxValue"})
			
			menu:AddLine();
			local str = addon:FormatTooltipText("BUFF出现后倒计时的消失时间。")
			menu:AddLine("text","BUFF冷却时间:","isTitle",1,"tooltipText",str,"tooltipTitle","说明");
			menu:AddLine();
			
			local MaxValue =999 ;
			
			if not Buff["Remaining"]["MaxValue"] then
				Buff["Remaining"]["MaxValue"]=0;
			end
			
			local Va = Buff["Remaining"]["MaxValue"];
			local checked = Buff["Remaining"]["Maxchecked"]
			--local str = addon:FormatTooltipText("当你选择该项时，只能判断一个Buff。多个时会出现无法预知的后果。")
			menu:AddLine("text", "|cffffffff时间(|cffff0000>=" .. Va   .."|cffffffff)秒",
			"checked",checked,"func", V[1] .. "_Remaining_Checked","arg1", self,"arg2", {Buff["Remaining"],"Maxchecked"},
			"hasSlider", 1,"sliderDecimals",1, "sliderValue", Va ,
			"sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 0.1, "sliderFunc",
			V[1] .. "_Remaining_Value", "sliderArg1", self,"sliderArg2", {Buff["Remaining"],"MaxValue"})
			
			
			local MaxValue =999 ;
			local Va = Buff["Remaining"]["Value"];
			local checked = Buff["Remaining"]["checked"]
			--local str = addon:FormatTooltipText("当你选择该项时，只能判断一个Buff。多个时会出现无法预知的后果。")
			menu:AddLine("text", "|cffffffff时间(|cffff0000<=" .. Va   .."|cffffffff)秒",
			"checked",checked,"func", V[1] .. "_Remaining_Checked","arg1", self,"arg2", {Buff["Remaining"],"checked"},
			"hasSlider", 1,"sliderDecimals",1, "sliderValue", Va ,
			"sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 0.1, "sliderFunc",
			V[1] .. "_Remaining_Value", "sliderArg1", self,"sliderArg2", {Buff["Remaining"],"Value"}
			);
			
			
			
		
			
			menu:AddLine();
			
			local str = addon:FormatTooltipText("可以输入Buff名称/Buff Id");
			menu:AddLine("text", "添加Buff","colorCode","|cffffff00","hasEditBox", 1,
			--"editBoxText", self.text, "editBoxFunc", V[1] .."_AddBuff",
			"editBoxText", self.text, "editBoxFunc", "Default_AddBuff",
			"editBoxArg1", self,"editBoxArg2", BuffInf,"tooltipText",str,
			"icon",ExpandArrow,"tooltipTitle","说明")
			
			--CollectionInf["Buff_Spell"]["function"]=V[1] .."_AddBuff";
			CollectionInf["Buff_Spell"]["function"]="Default_AddBuff";
			CollectionInf["Buff_Spell"]["level"]=level;
			CollectionInf["Buff_Spell"]["value"]={BuffInf};
			
			
			
			menu:AddLine("text", "选择Buff到列表","colorCode","|cffffff00","hasArrow", 1, "value", "DefaultListCollectionInfBuffSpell","icon",ExpandArrow)
			menu:AddLine();
			
			
			
		
			for k,v in pairs(Buff["BuffName"]) do
			
				local Name,_,Texture=GetSpellInfo(v.SpellId);
				Texture = Texture or "";
			
				
				local text = "|cff00ff00" .. k .. ". |cffffffff" .. Name;
				
				if  v["IsTexture"] then
					text = text .. "|cffff0000[图]|r";
				elseif  v["IsSpellId"] then
					text = text .. "|cffff0000[Id]|r";
				end
				
				
				--local str = addon:FormatTooltipText("\n当有同名出现时通过启用对比图标来判断, |cffff0000启用: |cffffffffCtrl + 鼠标左键\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键")
				local value ={V[2],V[3],V[4],k};
				
				local str = addon:FormatTooltipText("\nId: |r" ..(v["SpellId"] or "") .. "\n\n|cff00ff00当有同名出现时通过启用对比图标来判断:\n\n|cffff0000启用: |cffffffffCtrl + 鼠标左键\n\n|cff00ff00当有同名出现时通过启用对比Id来判断:\n\n|cffff0000启用: |cffffffffAlt + 鼠标左键\n\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键")
				menu:AddLine("text", text,"icon",Texture,
				"func",V[1] .. "_Del", "arg1", self, "arg2", value,"tooltipText",str,"tooltipTitle", Name);
				
				
			end
			
			
		elseif V[1] == "TargetListTargetsConditionsNamesBuffLayer" then
		
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
		
			
			local value ={V[2],V[3],V[4]};

			local Layer = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Buff"]["Layer"][">"];
			local BuffInf = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Buff"]["Layer"]["BuffName"];
			local MaxValue =100 ;
			local Va = Layer["Value"];
			local checked = Layer["checked"]
			local str = addon:FormatTooltipText("判断Buff层数。Buff不存在时层数<=0。")
			menu:AddLine("text", "|cffffffff层数(|cffff0000>=" .. Va   .."|cffffffff)",
			"checked",checked,"func", V[1] .. "_Max_Checked","arg1", self,"arg2", value,
			"hasSlider", 1,"sliderDecimals",0, "sliderValue", Va ,
			"sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			V[1] .. "_Max_Value", "sliderArg1", self,"sliderArg2", value,"tooltipText",str,"tooltipTitle","说明")
			
			
			
			local Layer = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Buff"]["Layer"]["<"];
			local MaxValue =100 ;
			local Va = Layer["Value"];
			local checked = Layer["checked"]
			local str = addon:FormatTooltipText("判断Buff层数。Buff不存在时层数<=0。")
			menu:AddLine("text", "|cffffffff层数(|cffff0000<=" .. Va   .."|cffffffff)",
			"checked",checked,"func", V[1] .. "_Min_Checked","arg1", self,"arg2", value,
			"hasSlider", 1,"sliderDecimals",0, "sliderValue", Va ,
			"sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			V[1] .. "_Min_Value", "sliderArg1", self,"sliderArg2", value,"tooltipText",str,"tooltipTitle","说明")
			
			menu:AddLine();
			
			local str = addon:FormatTooltipText("输入 Buff 名称或者 Id ");
			menu:AddLine("text", "添加Buff","colorCode","|cffffff00","hasEditBox", 1,
			--"editBoxText", self.text, "editBoxFunc", V[1] .."_AddBuff",
			"editBoxText", self.text, "editBoxFunc", "Default_AddBuff",
			
			"editBoxArg1", self,"editBoxArg2", BuffInf,"tooltipText",str,
			"icon",ExpandArrow,"tooltipTitle","说明")
			
			
			--CollectionInf["Buff_Spell"]["function"]=V[1] .."_AddBuff";
			CollectionInf["Buff_Spell"]["function"]="Default_AddBuff";
			CollectionInf["Buff_Spell"]["level"]=level;
			CollectionInf["Buff_Spell"]["value"]={BuffInf};
			
			menu:AddLine("text", "选择Buff到列表","colorCode","|cffffff00","hasArrow", 1, "value", "DefaultListCollectionInfBuffSpell","icon",ExpandArrow)
			menu:AddLine();
			
			local LayerBuff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Buff"]["Layer"];
			
			
			
			for k,v in pairs(LayerBuff["BuffName"]) do
				
				local Name,_,Texture=GetSpellInfo(v.SpellId);
				Texture = Texture or "";
				
				
				local text = "|cff00ff00" .. k .. ". |cffffffff" .. Name;
				
				
			
				if  v["IsTexture"] then
					text = text .. "|cffff0000[图]|r";
				elseif  v["IsSpellId"] then
					text = text .. "|cffff0000[Id]|r";
				end
				
				
				local str = addon:FormatTooltipText("\nId: |r" ..(v["SpellId"] or "") .. "\n\n|cff00ff00当有同名出现时通过启用对比图标来判断:\n\n|cffff0000启用: |cffffffffCtrl + 鼠标左键\n\n|cff00ff00当有同名出现时通过启用对比Id来判断:\n\n|cffff0000启用: |cffffffffAlt + 鼠标左键\n\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键")
				local value ={V[2],V[3],V[4],k};
				menu:AddLine("text", text,"icon",Texture,
				"func",V[1] .. "_Del", "arg1", self, "arg2", value,"tooltipText",str,"tooltipTitle", Name);
				
				
			end
			
			
		elseif V[1] == "TargetListTargetsConditionsNamesBuffIsBuff" then
			
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
		
			local value ={V[2],V[3],V[4]};
			
			local IsBuff = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Buff"]["IsBuff"];
			local BuffInf = IsBuff["BuffName"];
			local checked = IsBuff["NoBuffChecked"]
			local Va ;
			if checked then
				Va = "不包含";
			else
				Va = "包含";
			end
			
			local str = addon:FormatTooltipText("点击该项可以在“包含”和“不包含”间切换设定。")
			menu:AddLine("text", "|cffffffff(|cffff0000" .. Va   .."|cffffffff)Buff",
			"func", V[1] .. "_NoBuffChecked","arg1", self,"arg2", value,
			"tooltipText",str,"tooltipTitle","说明")
		
			menu:AddLine();
			
			
			
			local str = addon:FormatTooltipText("可以输入Buff名称/Buff Id");
			menu:AddLine("text", "添加Buff","colorCode","|cffffff00","hasEditBox", 1,
			--"editBoxText", self.text, "editBoxFunc", V[1] .."_AddBuff",
			"editBoxText", self.text, "editBoxFunc", "Default_AddBuff",
			"editBoxArg1", self,"editBoxArg2", BuffInf,"tooltipText",str,
			"icon",ExpandArrow,"tooltipTitle","说明")
			
			
			--CollectionInf["Buff_Spell"]["function"]=V[1] .."_AddBuff";
			CollectionInf["Buff_Spell"]["function"]="Default_AddBuff";
			CollectionInf["Buff_Spell"]["level"]=level;
			CollectionInf["Buff_Spell"]["value"]={BuffInf};
			
			menu:AddLine("text", "选择Buff到列表","colorCode","|cffffff00","hasArrow", 1, "value", "DefaultListCollectionInfBuffSpell","icon",ExpandArrow)
			menu:AddLine();
			
		
			
		
			for k,v in pairs(IsBuff["BuffName"]) do
			
				local Name,_,Texture=GetSpellInfo(v.SpellId);
				Texture = Texture or "";
			
				
				
				local text = "|cff00ff00" .. k .. ". |cffffffff" .. Name;
				
				
			
				if  v["IsTexture"] then
					text = text .. "|cffff0000[图]|r";
				elseif  v["IsSpellId"] then
					text = text .. "|cffff0000[Id]|r";
				end
				
				
				local str = addon:FormatTooltipText("\nId: |r" ..(v["SpellId"] or "") .. "\n\n|cff00ff00当有同名出现时通过启用对比图标来判断:\n\n|cffff0000启用: |cffffffffCtrl + 鼠标左键\n\n|cff00ff00当有同名出现时通过启用对比Id来判断:\n\n|cffff0000启用: |cffffffffAlt + 鼠标左键\n\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键")
				local value ={V[2],V[3],V[4],k};
				menu:AddLine("text", text,"icon",Texture,
				"func",V[1] .. "_Del", "arg1", self, "arg2", value,"tooltipText",str,"tooltipTitle", Name);
				
				
			end
		

		elseif V[1] == "TargetListTargetsConditionsNamesRuneRuneCount" then
				
			--menu:AddLine("text","判断符文数量","isTitle",1)
			--menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);

			local MaxValue=10;
			
			for i, data in pairs(RuneType) do
			
				menu:AddLine("text",data,"isTitle",1)
				
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
				
				local tbl = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Rune"]["RuneCount"][i];
				
				local value ={V[2],V[3],V[4],i,"<"};
				menu:AddLine("text", "|cffffffff" .. data .. "(|cffff0000<=" .. tbl ["<"]["Value"]  .."|cffffffff)个",
				"checked",tbl ["<"]["checked"],"func", V[1] .. "_checked","arg1", self,"arg2", value,
				"hasSlider", 1, "sliderValue",  tbl ["<"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
				V[1] .."_value" , "sliderArg1", self,"sliderArg2", value
				);
				
				local value ={V[2],V[3],V[4],i,">"};
				menu:AddLine("text", "|cffffffff" .. data .. "(|cffff0000>=" .. tbl [">"]["Value"]  .."|cffffffff)个" ,
				"checked",tbl [">"]["checked"],"func", V[1] .. "_checked","arg1", self,"arg2", value,
				"hasSlider", 1, "sliderValue",tbl [">"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
				V[1] .. "_value" , "sliderArg1", self,"sliderArg2", value
				);
				
				
				local value ={V[2],V[3],V[4],i,"="};
				menu:AddLine("text", "|cffffffff" .. data .. "(|cffff0000=" .. tbl ["="]["Value"]  .."|cffffffff)个" ,
				"checked",tbl ["="]["checked"],"func", V[1] .. "_checked","arg1", self,"arg2", value,
				"hasSlider", 1, "sliderValue",tbl ["="]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
				V[1] ..  "_value" , "sliderArg1", self,"sliderArg2", value
				);
				
				menu:AddLine();
				
			end
		
		elseif V[1] == "TargetListTargetsConditionsNamesRuneRuneCooldown" then
				
			--menu:AddLine("text","判断符文冷却","isTitle",1)
			--menu:AddLine();
			
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);

			local MaxValue=30;
			
			for i, data in pairs(RuneType) do
			
				menu:AddLine("text",data,"isTitle",1)
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
				
				local tbl = Spells[V[2]]["Targets"][V[3]]["Conditions"][V[4]]["Rune"]["RuneCooldown"][i];
				
				local value ={V[2],V[3],V[4],i,"<"};
				menu:AddLine("text", "|cffffffff" .. data .. "(|cffff0000<=" .. tbl ["<"]["Value"]  .."|cffffffff)秒",
				"checked",tbl ["<"]["checked"],"func", V[1] .. "_checked","arg1", self,"arg2", value,
				"hasSlider", 1, "sliderValue",  tbl ["<"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
				V[1] .. "_value" , "sliderArg1", self,"sliderArg2", value
				);
				
				local value ={V[2],V[3],V[4],i,">"};
				menu:AddLine("text", "|cffffffff" .. data .. "(|cffff0000>=" .. tbl [">"]["Value"]  .."|cffffffff)秒" ,
				"checked",tbl [">"]["checked"],"func", V[1] .. "_checked","arg1", self,"arg2", value,
				"hasSlider", 1, "sliderValue",tbl [">"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
				V[1] ..  "_value" , "sliderArg1", self,"sliderArg2", value
				);
				
				
				local value ={V[2],V[3],V[4],i,"="};
				menu:AddLine("text", "|cffffffff" .. data .. "(|cffff0000=" .. tbl ["="]["Value"]  .."|cffffffff)秒" ,
				"checked",tbl ["="]["checked"],"func", V[1] .. "_checked","arg1", self,"arg2", value,
				"hasSlider", 1, "sliderValue",tbl ["="]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
				V[1] ..  "_value" , "sliderArg1", self,"sliderArg2", value
				);
				
				menu:AddLine();
			end
			
		end
	
	
			

		
			
			
		
		
	end
	
end

function addon:DecompositionValue(v)

	return {strsplit("_",v)};
	
end


function addon:TargetListTargetsConditionsNames_checked(v)
	
	if IsAltKeyDown() then
		v["not"]= not v["not"];
		DropDownMenu:Refresh(5);
		return;
	end
	
	v["checked"]= not v["checked"];

	DropDownMenu:Refresh(5);
	
	
end



function addon:TargetListTargetsConditionsNamesBlood_H_checked(v)

	local Blood = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Blood"][">"];
	
		
	Blood["checked"]= not Blood["checked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesBlood_L_checked(v)

	local Blood = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Blood"]["<"];
	
		
	Blood["checked"]= not Blood["checked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end

function addon:TargetListTargetsConditionsNamesBlood_Percentage_checked(v)

	local Blood = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Blood"];
	
		
	Blood["Percentage"]= not Blood["Percentage"];
	
	Blood[">"]["Value"]=0;
	Blood["<"]["Value"]=0;
	DropDownMenu:Refresh(5);
	
	
end

function addon:TargetListTargetsConditionsNamesBlood_Lack_checked(v)

	local Blood = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Blood"];
	
		
	Blood["Lack"]= not Blood["Lack"];
	
	Blood[">"]["Value"]=0;
	Blood["<"]["Value"]=0;
	DropDownMenu:Refresh(5);
	
	
end

function addon:TargetListTargetsConditionsNamesEnergy_Lack_checked(v)

	local Energy = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Energy"];
	
		
	Energy["Lack"]= not Energy["Lack"];
	
	Energy[">"]["Value"]=0;
	Energy["<"]["Value"]=0;
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesBlood_H_value(v,v1)

	local Blood = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Blood"][">"];
	
		
	Blood["Value"]= v1;
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesBlood_L_value(v,v1)

	local Blood = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Blood"]["<"];
	
		
	Blood["Value"]= v1;
	

	
	DropDownMenu:Refresh(5);
	
	
end

------------------------------------------------
function addon:TargetListTargetsConditionsNamesSpecialEnergy_H_checked(v)

	local SpecialEnergy = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["SpecialEnergy"][">"];
	
		
	SpecialEnergy["checked"]= not SpecialEnergy["checked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end

function addon:TargetListTargetsConditionsNamesSpecialEnergy_L_checked(v)

	local SpecialEnergy = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["SpecialEnergy"]["<"];
	
		
	SpecialEnergy["checked"]= not SpecialEnergy["checked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end

function addon:TargetListTargetsConditionsNamesSpecialEnergy_H_value(v,v1)

	local SpecialEnergy = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["SpecialEnergy"][">"];
	
		
	SpecialEnergy["Value"]= v1;
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesSpecialEnergy_L_value(v,v1)

	local SpecialEnergy = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["SpecialEnergy"]["<"];
	
		
	SpecialEnergy["Value"]= v1;
	

	
	DropDownMenu:Refresh(5);
	
	
end

------------------


function addon:TargetListTargetsConditionsNamesEnergy_H_checked(v)

	local Energy = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Energy"][">"];
	
		
	Energy["checked"]= not Energy["checked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesEnergy_L_checked(v)

	local Energy = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Energy"]["<"];
	
		
	Energy["checked"]= not Energy["checked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end

function addon:TargetListTargetsConditionsNamesEnergy_Percentage_checked(v)

	local Energy = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Energy"];
	
		
	Energy["Percentage"]= not Energy["Percentage"];
	
	Energy[">"]["Value"]=0;
	Energy["<"]["Value"]=0;
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesEnergy_H_value(v,v1)

	local Energy = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Energy"][">"];
	
		
	Energy["Value"]= v1;
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesEnergy_L_value(v,v1)

	local Energy = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Energy"]["<"];
	
		
	Energy["Value"]= v1;
	

	
	DropDownMenu:Refresh(5);
	
	
end


------------------------------------------------



function addon:TargetListTargetsConditionsNamesDistance_H_checked(v)

	local Distance = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Distance"][">"];
	
		
	Distance["checked"]= not Distance["checked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesDistance_L_checked(v)

	local Distance = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Distance"]["<"];
	
		
	Distance["checked"]= not Distance["checked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesDistance_H_value(v,v1)

	local Distance = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Distance"][">"];
	
		
	Distance["Value"]= v1;
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesDistance_L_value(v,v1)

	local Distance = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Distance"]["<"];
	
		
	Distance["Value"]= v1;
	

	
	DropDownMenu:Refresh(5);
	
	
end



function addon:TargetListTargetsConditionsNamesClassExcluded_checked(v)

	local Class = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Class"]["Excluded"];
	
		
	Class[v[4]]= not Class[v[4]];
	
	if not Class[v[4]] then
		Class[v[4]] =nil;
	end
	
	DropDownMenu:Refresh(5);
	
	
end

-----------------------------------



------------------------------------------------



function addon:TargetListTargetsConditionsNamesCastSpell_Start_checked(v)

	local CastSpell = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["CastSpell"]["Start"];
	
		
	CastSpell["checked"]= not CastSpell["checked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesCastSpell_Remaining_checked(v)

	local CastSpell = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["CastSpell"]["Remaining"];
	
		
	CastSpell["checked"]= not CastSpell["checked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end




function addon:TargetListTargetsConditionsNamesCastSpell_Start_value(v,v1)

	local CastSpell = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["CastSpell"]["Start"];
	
		
	CastSpell["Value"]= tonumber(format("%.1f",v1));
	

	
	DropDownMenu:Refresh(5);
	
	
end



--[[
local amPetBattleUnitFrame = CreateFrame("Frame");
amPetBattleUnitFrame:RegisterEvent("PET_BATTLE_HEALTH_CHANGED");
amPetBattleUnitFrame:RegisterEvent("PET_BATTLE_MAX_HEALTH_CHANGED");
amPetBattleUnitFrame:RegisterEvent("PET_BATTLE_PET_CHANGED");
amPetBattleUnitFrame:RegisterEvent("PET_BATTLE_AURA_APPLIED");
amPetBattleUnitFrame:RegisterEvent("PET_BATTLE_AURA_CHANGED");


amPetBattleUnitFrame:RegisterEvent("PET_BATTLE_OPENING_START");
amPetBattleUnitFrame:RegisterEvent("PET_BATTLE_OPENING_DONE");

amPetBattleUnitFrame:RegisterEvent("PET_BATTLE_TURN_STARTED");
amPetBattleUnitFrame:RegisterEvent("PET_BATTLE_PET_ROUND_PLAYBACK_COMPLETE");
amPetBattleUnitFrame:RegisterEvent("PET_BATTLE_PET_CHANGED");
amPetBattleUnitFrame:RegisterEvent("PET_BATTLE_XP_CHANGED");

-- Transitioning out of battle event
amPetBattleUnitFrame:RegisterEvent("PET_BATTLE_OVER");

-- End of battle event:
amPetBattleUnitFrame:RegisterEvent("PET_BATTLE_CLOSE");

-- Other events:
amPetBattleUnitFrame:RegisterEvent("UPDATE_BINDINGS");

amPetBattleUnitFrame:RegisterEvent("PET_BATTLE_ACTION_SELECTED");
amPetBattleUnitFrame:RegisterEvent("PET_BATTLE_PET_ROUND_PLAYBACK_COMPLETE");


amPetBattleUnitFrame:RegisterEvent("PET_BATTLE_MAX_HEALTH_CHANGED");
amPetBattleUnitFrame:RegisterEvent("PET_BATTLE_HEALTH_CHANGED");
amPetBattleUnitFrame:RegisterEvent("PET_BATTLE_PET_CHANGED");

amPetBattleUnitFrame:RegisterEvent("PET_BATTLE_AURA_APPLIED");
amPetBattleUnitFrame:RegisterEvent("PET_BATTLE_AURA_CANCELED");
amPetBattleUnitFrame:RegisterEvent("PET_BATTLE_AURA_CHANGED");




function amPetBattleUnitFrame_OnEvent(self, event, ...)
	local petOwner, petIndex = ...;
	print(event,petOwner,petIndex)
	print("x:",C_PetBattles.GetName(petOwner, petIndex or 1));
	
end
amPetBattleUnitFrame:SetScript("OnEvent", amPetBattleUnitFrame_OnEvent);

--]]

function amPetBattleCast(id) -- 施放宠物技能ID
	if ( id > NUM_BATTLE_PET_ABILITIES ) then
		return;
	end

	local button = PetBattleFrame.BottomFrame.abilityButtons[id];

	if ( button:GetButtonState() == "NORMAL" ) then
		button:SetButtonState("PUSHED");
	end
	if ( GetCVarBool("ActionButtonUseKeydown") ) then
		button:Click();
	end
end

function amPetBattlePlayName() -- 自己当前宠物ID

	local  activeAlly = C_PetBattles.GetActivePet(LE_BATTLE_PET_ALLY)

	return C_PetBattles.GetName(LE_BATTLE_PET_ALLY,activeAlly)
	
end

function amPetBattleTargetName() -- 当前敌对宠物ID

	local activeEnemy = C_PetBattles.GetActivePet(LE_BATTLE_PET_ENEMY);
	return C_PetBattles.GetName(E_BATTLE_PET_ENEMY,activeEnemy)
	
end

function amPetBattlePlaySpeed() -- 自己当前宠物速度

	local  activeAlly = C_PetBattles.GetActivePet(LE_BATTLE_PET_ALLY)

	return C_PetBattles.GetSpeed(LE_BATTLE_PET_ALLY,activeAlly)
	
end

function amPetBattleTargetName() -- 当前敌对宠物速度

	local activeEnemy = C_PetBattles.GetActivePet(LE_BATTLE_PET_ENEMY);
	return C_PetBattles.GetSpeed(E_BATTLE_PET_ENEMY,activeEnemy)
	
end


function amPetBattleIsrun(spell) -- 自己宠物技能是否可以施放
	
	local isUsable, currentCooldown =false,0;
	
	for i=1, NUM_BATTLE_PET_ABILITIES do
		local id, name, icon, maxCooldown, description, numTurns, abilityPetType, noStrongWeakHints = C_PetBattles.GetAbilityInfo(LE_BATTLE_PET_ALLY,activeAlly, i);
		if spell == name then
			isUsable, currentCooldown = C_PetBattles.GetAbilityState(LE_BATTLE_PET_ALLY, C_PetBattles.GetActivePet(LE_BATTLE_PET_ALLY), i);
			break;
		end
		
	end
	
	return isUsable, currentCooldown; --施放为TRUE ,currentCooldown 等待次数
	
end

function addon:TargetListTargetsConditionsNamesCastSpell_Remaining_value(v,v1)

	local CastSpell = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["CastSpell"]["Remaining"];
	
		
	CastSpell["Value"]= tonumber(format("%.1f",v1));
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesCastSpell_AddSpell(Value,Text)
	
	local id,v,T;
	if not Text then
		
		T=Value[1]["name"];
		v=Value[3][1];
		id=Value[2];
	
	else
		v=Value;
		T=Text;
	end
	
	local castspell = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["CastSpell"]["Spells"];
	
	
	
	local TV = { strsplit(",",T) }
	for i,h in pairs(TV) do
	
		
		local Texture="";
		local tbl ={};
		local spellid ;
		--[[
		if id then
			spellid = id
		else
			spellid = amfindSpellId(h);
		end
		
		if spellid then
			_,_,Texture=GetSpellInfo(spellid)
			tbl["SpellId"]=spellid;
			
		end
		
		--]]
		
		
		if id then
			spellid = id
			_,_,Texture=GetSpellInfo(spellid)
		else
			spellid,_,_,Texture = amfindSpellItemInf(h);
		end
		
		if spellid then
			tbl["SpellId"]=spellid;
		end
	
		tbl["Texture"]=Texture;
		tbl["Name"]=h;
		table.insert(castspell,tbl)
		
		
	end
	
	DropDownMenu:Refresh(5);
	
	

end

function addon:TargetListTargetsConditionsNamesCastSpell_Del(v)


	
	local CastSpell = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["CastSpell"]["Spells"];
	
	
	if IsControlKeyDown() and IsAltKeyDown() then
		table.remove(CastSpell, v[4]) 
		DropDownMenu:Refresh(5);
		return;
	end
	
	
	
end


function addon:TargetListTargetsConditionsNamesCastSpell_AllInterruptChecked(v)

	local CastSpell = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["CastSpell"];
	
		
	CastSpell["AllInterruptChecked"]= not CastSpell["AllInterruptChecked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end

function addon:TargetListTargetsConditionsNamesCastSpell_InterruptChecked(v)

	local CastSpell = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["CastSpell"];
	
		
	CastSpell["InterruptChecked"]= not CastSpell["InterruptChecked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end



function addon:TargetListTargetsConditionsNamesBuff_Time_Checked(v)


	local Buff = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Buff"]["Time"];
	
		
	Buff["checked"]= not Buff["checked"];
	
	if Buff["checked"] then
		Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Buff"]["IsBuff"]["checked"]=false;
	end
	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesBuff_IsBuff_Checked(v)


	local IsBuff = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Buff"]["IsBuff"];
	
		
	IsBuff["checked"]= not IsBuff["checked"];
	
	if IsBuff["checked"] then
		Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Buff"]["Time"]["checked"]=false;
	end
	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesBuffTime_Start_Value(v,v1)

	v[1][v[2]]= tonumber(format("%.1f",v1));
	

	
	DropDownMenu:Refresh(5);
	
	
end

function addon:TargetListTargetsConditionsNamesBuffTime_Remaining_Value(v,v1)

		
	v[1][v[2]]= tonumber(format("%.1f",v1));
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesBuffTime_Start_Checked(v)


	v[1][v[2]]= not v[1][v[2]];
	
	
	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesBuffTime_Remaining_Checked(v)

	v[1][v[2]]= not v[1][v[2]];
	
		
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesBuff_Layer_Checked(v)


	local Buff = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Buff"]["Layer"];
	
		
	Buff["checked"]= not Buff["checked"];
	
		
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesBuffLayer_Max_Value(v,v1)

	local Buff = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Buff"]["Layer"][">"];
	
		
	Buff["Value"]= tonumber(format("%.1f",v1));
	

	
	DropDownMenu:Refresh(5);
	
	
end

function addon:TargetListTargetsConditionsNamesBuffLayer_Max_Checked(v)


	local Buff = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Buff"]["Layer"][">"];
	
		
	Buff["checked"]= not Buff["checked"];
	
		
	DropDownMenu:Refresh(5);
	
	
end





function addon:TargetListTargetsConditionsNamesBuffLayer_Min_Value(v,v1)

	local Buff = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Buff"]["Layer"]["<"];
	
		
	Buff["Value"]= tonumber(format("%.1f",v1));
	

	
	DropDownMenu:Refresh(5);
	
	
end

function addon:TargetListTargetsConditionsNamesBuffLayer_Min_Checked(v)


	local Buff = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Buff"]["Layer"]["<"];
	
		
	Buff["checked"]= not Buff["checked"];
	
		
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesBuffIsBuff_NoBuffChecked(v)


	local Buff = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Buff"]["IsBuff"];
	
		
	Buff["NoBuffChecked"]= not Buff["NoBuffChecked"];
	
		
	DropDownMenu:Refresh(5);
	
	
end





function addon:TargetListTargetsConditionsNamesBuffIsBuff_AddBuff(Value,Text)
	
	local id,v,T;
	if not Text then
		
		T=Value[1]["name"];
		v=Value[3][1];
		id=Value[2];
	
	else
		v=Value;
		T=Text;
	end
	
	local Buff = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Buff"]["IsBuff"]["BuffName"];
	
	if tonumber(T) then
		
		local tbl ={};
		local Name,_,Texture=GetSpellInfo(tonumber(T));
		
		if Name then
			tbl["SpellId"]=T;
			tbl["Texture"]=Texture;
			tbl["Name"]=Name;
			table.insert(Buff,tbl)
		end
			
	else
	
	
		local TV = { strsplit(",",T) }
		for i,h in pairs(TV) do
		
			
			local Texture="";
			local tbl ={};
			local spellid ;
			--[[
			if id then
				spellid = id
			else
				spellid = amfindSpellId(h);
			end
			
			if spellid then
				_,_,Texture=GetSpellInfo(spellid)
				tbl["SpellId"]=spellid;
				
			end
			--]]
			if id then
				spellid = id
				_,_,Texture=GetSpellInfo(spellid)
			else
				spellid,_,_,Texture = amfindSpellItemInf(h);
			end
			
			if spellid then
				
				tbl["SpellId"]=spellid;
				
			end
			
		
			tbl["Texture"]=Texture;
			tbl["Name"]=h;
			table.insert(Buff,tbl)
			
			
		end
	
	end
	
	DropDownMenu:Refresh(5);
	
	

end

function addon:TargetListTargetsConditionsNamesBuffIsBuff_Del(v)


	
	local Buff = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Buff"]["IsBuff"]["BuffName"];
	
	
	if IsControlKeyDown() and IsAltKeyDown() then
		table.remove(Buff, v[4]) 
		DropDownMenu:Refresh(5);
		
	elseif IsControlKeyDown() then
		Buff[v[4]]["IsTexture"]=not Buff[v[4]]["IsTexture"];
		Buff[v[4]]["IsSpellId"]=false;
		DropDownMenu:Refresh(5);
		
	elseif IsAltKeyDown() then
		Buff[v[4]]["IsSpellId"]=not Buff[v[4]]["IsSpellId"];
		Buff[v[4]]["IsTexture"]=false;
		DropDownMenu:Refresh(5);
		
	end
	
	
	
end





function addon:TargetListTargetsConditionsNamesBuffTime_AddBuff(Value,Text)
	
	local id,v,T;
	if not Text then
		
		T=Value[1]["name"];
		v=Value[3][1];
		id=Value[2];
	
	else
		v=Value;
		T=Text;
	end
	
	local Buff = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Buff"]["Time"]["BuffName"];
	
	
	
	local TV = { strsplit(",",T) }
	for i,h in pairs(TV) do
	
		
		local Texture="";
		local tbl ={};
		
		local spellid ;
		--[[
		if id then
			spellid = id
		else
			spellid = amfindSpellId(T);
		end
		
		if spellid then
			_,_,Texture=GetSpellInfo(spellid)
			tbl["SpellId"]=spellid;
			
		end
		
		--]]
		
		if id then
			spellid = id
			_,_,Texture=GetSpellInfo(spellid)
		else
			spellid,_,_,Texture = amfindSpellItemInf(T);
		end
		
		if spellid then
		
			tbl["SpellId"]=spellid;
			
		end
		
	
		tbl["Texture"]=Texture;
		tbl["Name"]=h;
		table.insert(Buff,tbl)
		
		
	end
	
	DropDownMenu:Refresh(5);
	
	

end

function addon:TargetListTargetsConditionsNamesBuffTime_Del(v)


	
	local Buff = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Buff"]["Time"]["BuffName"];
	
	
	if IsControlKeyDown() and IsAltKeyDown() then
		table.remove(Buff, v[4]) 
		DropDownMenu:Refresh(5);
		
	elseif IsControlKeyDown() then
		Buff[v[4]]["IsTexture"]=not Buff[v[4]]["IsTexture"];
		Buff[v[4]]["IsSpellId"]=false;
		DropDownMenu:Refresh(5);
		
	elseif IsAltKeyDown() then
		Buff[v[4]]["IsSpellId"]=not Buff[v[4]]["IsSpellId"];
		Buff[v[4]]["IsTexture"]=false;
		DropDownMenu:Refresh(5);
		
	end
	
	
	
end

function addon:DefaultListCollectionInfBuffSpell_checked(v)


	local CollectionInf = SuperTreatmentDBF["CollectionInf"]["Buff_Spell"];
	
		
	CollectionInf["checked"]= not CollectionInf["checked"];
	
		
	DropDownMenu:Refresh(3);
	
	
end


function addon:DefaultListCollectionInfBuffSpell_type(v)


	local CollectionInf = SuperTreatmentDBF["CollectionInf"]["Buff_Spell"];
	
		
	CollectionInf["type"]= v;
	
		
	DropDownMenu:Refresh(3);
	
	
end

function addon:DefaultListCollectionInfBuffSpell_AllDel(v)


	CollectionInf["Buff_Spell"]["Buff"]={};
	CollectionInf["Buff_Spell"]["Spell"]={};
	
		
	
end


-- 2级菜单内容(收集技能、Buff信息)


function addon:Menu_2_2_1(level, value, menu, MenuEx,GlobalLevel)
	
	local level_n = CollectionInf["Buff_Spell"]["level"]+1;
	
	
	if level == level_n then -- 3级菜单内容	
		
		if value == "DefaultListCollectionInfBuffSpell" then
			
			local tbl = SuperTreatmentDBF["CollectionInf"]["Buff_Spell"];
			
			menu:AddLine("text", "启用信息收集","checked",tbl["checked"],"func", "DefaultListCollectionInfBuffSpell_checked","arg1", self)
			menu:AddLine("text", "删除全部信息", "func", "DefaultListCollectionInfBuffSpell_AllDel", "arg1", self, "hasConfirm", 1, "confirmText", "是否删除删除全部信息?")
			menu:AddLine();
			menu:AddLine("text", "|cffffff00技能|r", "hasArrow", 1, "value", "DefaultListCollectionInfBuffSpells_Spell","icon",ExpandArrow)
			
			menu:AddLine("text", "|cffffff00Buff|r", "hasArrow", 1, "value", "DefaultListCollectionInfBuffSpells_Buff","icon",ExpandArrow)
			
			local str = addon:FormatTooltipText("过滤采用模糊模式包含关键字显示，多个关键字用英文逗号分开。\n\n|cffff0000如:|r\n\n治疗,恢复\n\n那么强效治疗术、快速治疗、恢复\n这些就会显示出来。");
			
			menu:AddLine("text", "|cffffff00过滤关键字","hasEditBox", 1, "editBoxText", addon.SpellBuffInformationFiltering_value, "editBoxFunc", "SpellBuffInformationFiltering", "editBoxArg1", self,
			"tooltipText",str,"icon",ExpandArrow,"tooltipTitle","信息")
			
			
			menu:AddLine();
			menu:AddLine("text", "显示自己","isRadio", 0,"checked",tbl["type"] == -999,"func", "DefaultListCollectionInfBuffSpell_type","arg1", self,"arg2",-999)
			menu:AddLine("text", "显示全部","isRadio", 0,"checked",tbl["type"] == -1000,"func", "DefaultListCollectionInfBuffSpell_type","arg1", self,"arg2",-1000)
			
			if not tbl["type"] then
				tbl["type"] = -1000;
			end
			menu:AddLine();
			for i, data in pairs(powerType) do
				
				menu:AddLine("text", data,"isRadio", 0,"checked",tbl["type"] == i,"func", "DefaultListCollectionInfBuffSpell_type","arg1", self,"arg2",i)
			
			end
			menu:AddLine();
			for i, data in pairs(ClassName) do
				
				local color,tc;
				color = RAID_CLASS_COLORS[i]
				
				
				local str = addon:FormatTooltipText("只能显示队友、团友、竞技场敌方信息");
				menu:AddLine(
				
				"textR", color.r, "textG", color.g, "textB", color.b,
				"text", data,"isRadio", 0,"checked",tbl["type"] == i,
				
				"func", "DefaultListCollectionInfBuffSpell_type","arg1", self,"arg2",i,"tooltipText",str,"tooltipTitle","说明")
			
			end
		end
	
	elseif level == level_n +1 then -- 3级菜单内容	
		
		local _, _, valueA, valueB = string.find(value, "(.-)_(.+)")
		
		if valueA == "DefaultListCollectionInfBuffSpells" then	
			
			local func  = CollectionInf["Buff_Spell"]["function"];
			local funcValue  = CollectionInf["Buff_Spell"]["value"];
			
			local tbl ;
			if valueB == "Spell" then
				tbl = CollectionInf["Buff_Spell"]["Spell"];
				menu:AddLine("text","技能列表","isTitle",1);
			else
				tbl = CollectionInf["Buff_Spell"]["Buff"];
				menu:AddLine("text","Buff列表","isTitle",1);
			end
			
			menu:AddLine();
			
			local strtbl = { strsplit(",",addon.SpellBuffInformationFiltering_value) }
			
			local guid = UnitGUID("player");
			
				for k,v in pairs(tbl) do
					
					local Type = SuperTreatmentDBF["CollectionInf"]["Buff_Spell"]["type"];
					local isType = true;
					
					if  type(Type) == "string" then
					
						
						isType = v["englishClass"] ==Type;
					else
					
						if Type == -1000 then
							
							
						elseif Type == -999 then	
							isType = v["UnitGUID"] ==guid;
						
						else
							isType = v["powerType"] ==Type;
						end
					
					
					end
					
					isType = isType and amfind(v["name"],strtbl,-1);
						
					
					if isType then
						if not v["powerType"] then
							v["powerType"]="";
						end
						
						local icon="";
						
						if not v["icon"] then
							v["icon"]="";
						else
							icon={strsplit("\\",v["icon"])};
						end
						
						if not v["rank"] then
							v["rank"]="";
						end
						
						local class;
						if ClassName[v["englishClass"]] then
							class = ClassName[v["englishClass"]];
							
						else
							class="";
						end
						
						
						local G = "|cff00ffff";
						local str = "\n"..G .. "    Id: |r" .. k.. G .. "\n等级: |r" .. v["rank"] .. G .. "\n能量: |r" .. powerType[v["powerType"]] .. G .. "\n职业: |r" ..  class  .. G .. "\n图标: |r" .. icon[3] ;
						str = str .. "\n\n|cffff0000打印图标: |cffffffffCtrl + 鼠标左键\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键";
						menu:AddLine("text", v["name"],"icon",v["icon"],
						"tooltipText",str,"tooltipTitle",v["name"],
						"func","DefaultListCollectionInfBuffSpells_key","arg1", self,"arg2", {func,valueB,{v,k,funcValue}}
						);
					
					end
					
				end
		
		
		
			
		end
		
	
	
	
	end

end


function addon:DefaultListCollectionInfBuffSpells_key(v)
	
	
	local tbl ;
	if v[2] == "Spell" then
		tbl = CollectionInf["Buff_Spell"]["Spell"];
	else
		tbl = CollectionInf["Buff_Spell"]["Buff"];
	end
	
	local index = v[3][2];
	
	
	
	if IsControlKeyDown() and IsAltKeyDown() then
		tbl[index]=nil;
		DropDownMenu:Refresh( CollectionInf["Buff_Spell"]["level"]+2);
		return;
	elseif IsControlKeyDown() then
		print("|cffff0000图标:|r " .. v[3][1]["icon"]);
		return;
	end
	
	local Value = v[3];
	
	local func = addon[v[1]];
	
	if func then
		func(self,v[3]);
	end
	
end



function addon:TargetListTargetsConditionsNamesBuffLayer_AddBuff(Value,Text)
	
	local id,v,T;
	if not Text then
		
		T=Value[1]["name"];
		v=Value[3][1];
		id=Value[2];
	
	else
		v=Value;
		T=Text;
	end
	
	local Buff = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Buff"]["Layer"]["BuffName"];
	
	
	
	local TV = { strsplit(",",T) }
	for i,h in pairs(TV) do
	
		
		local Texture="";
		local tbl ={};
		local spellid ;
		--[[
		if id then
			spellid = id
		else
			spellid = amfindSpellId(h);
		end
		
		if spellid then
			_,_,Texture=GetSpellInfo(spellid)
			tbl["SpellId"]=spellid;
			
		end
		--]]
		
		if id then
			spellid = id
			_,_,Texture=GetSpellInfo(spellid)
		else
			spellid,_,_,Texture = amfindSpellItemInf(h);
		end
		
		if spellid then
			
			tbl["SpellId"]=spellid;
			
		end
	
		tbl["Texture"]=Texture;
		tbl["Name"]=h;
		table.insert(Buff,tbl)
		
		
	end
	
	DropDownMenu:Refresh(5);
	
	

end

function addon:TargetListTargetsConditionsNamesBuffLayer_Del(v)


	
	local Buff = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Buff"]["Layer"]["BuffName"];
	
	
	if IsControlKeyDown() and IsAltKeyDown() then
		table.remove(Buff, v[4]) 
		DropDownMenu:Refresh(5);
		
	elseif IsControlKeyDown() then
		Buff[v[4]]["IsTexture"]=not Buff[v[4]]["IsTexture"];
		Buff[v[4]]["IsSpellId"]=false;
		DropDownMenu:Refresh(5);
	
	elseif IsAltKeyDown() then
		Buff[v[4]]["IsSpellId"]=not Buff[v[4]]["IsSpellId"];
		Buff[v[4]]["IsTexture"]=false;
		DropDownMenu:Refresh(5);
	end
	
	
	
end



function addon:TargetListTargetsConditionsNamesComboPoints_L_value(v,v1)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["ComboPoints"]["<"];
	
		
	tbl["Value"]= v1;
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesComboPoints_H_value(v,v1)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["ComboPoints"][">"];
	
		
	tbl["Value"]= v1;
	

	
	DropDownMenu:Refresh(5);
	
	
end

function addon:TargetListTargetsConditionsNamesComboPoints_L_checked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["ComboPoints"]["<"];
	
		
	tbl["checked"]= not tbl["checked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesComboPoints_H_checked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["ComboPoints"][">"];
	
		
	tbl["checked"]= not tbl["checked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end

function addon:TargetListTargetsConditionsNamesComboPoints_checked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["ComboPoints"];
	
		
	tbl["checked"]= not tbl["checked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetList_Delay_value(v,v1)
	

	local temp = Spells[v];
	temp["DelayValue"]=tonumber(format("%.1f",v1));
	DropDownMenu:Refresh(3);

end

function addon:TargetList_DelayChecked(v)
	

	Spells[v]["DelayChecked"] = not Spells[v]["DelayChecked"];
	DropDownMenu:Refresh(3);

end


function addon:TargetListTargetsConditionsNameswbuff_checked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["wbuff"];
	
		
	tbl["checked"]= not tbl["checked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNameswbuff_L_checked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["wbuff"]["<"];
	
		
	tbl["checked"]= not tbl["checked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNameswbuff_H_checked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["wbuff"][">"];
	
		
	tbl["checked"]= not tbl["checked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNameswbuff_L_value(v,v1)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["wbuff"]["<"];
	
		
	tbl["Value"]= v1;
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNameswbuff_H_value(v,v1)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["wbuff"][">"];
	
		
	tbl["Value"]= v1;
	

	
	DropDownMenu:Refresh(5);
	
	
end

function addon:TargetListTargetsConditionsNameswbuffMainChecked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["wbuff"];
	
		
	tbl["MainChecked"]= not tbl["MainChecked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end



-----------------------------------





function addon:TargetListTargetsConditionsNamesCooldown_L_checked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Cooldown"]["<"];
	
		
	tbl["checked"]= not tbl["checked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesCooldown_H_checked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Cooldown"][">"];
	
		
	tbl["checked"]= not tbl["checked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesCooldown_L_value(v,v1)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Cooldown"]["<"];
	
		
	tbl["Value"]= tonumber(format("%.1f",v1));
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesCooldown_H_value(v,v1)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Cooldown"][">"];
	
		
	tbl["Value"]= tonumber(format("%.1f",v1));
	

	
	DropDownMenu:Refresh(5);
	
	
end



---------------------------------------符文判断代码



function addon:TargetListTargetsConditionsNamesRune_RuneCount_Checked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Rune"]["RuneCount"];
	
		
	tbl["checked"]= not tbl["checked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end

function addon:TargetListTargetsConditionsNamesRune_RuneCooldown_Checked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Rune"]["RuneCooldown"];
	
		
	tbl["checked"]= not tbl["checked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end




function addon:TargetListTargetsConditionsNamesRuneRuneCount_checked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Rune"]["RuneCount"][v[4]];
	
		
	tbl[v[5]]["checked"]= not tbl[v[5]]["checked"];
	
	if tbl[v[5]]["checked"] and v[5] == "=" then
		
		tbl["<"]["checked"]=false;
		tbl[">"]["checked"]=false;
		
	else
		tbl["="]["checked"]=false;
	end
	
	DropDownMenu:Refresh(5);
	
	
end

function addon:TargetListTargetsConditionsNamesRuneRuneCount_value(v,i)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Rune"]["RuneCount"][v[4]][v[5]];
	
	tbl["Value"]=i;
			
	DropDownMenu:Refresh(5);
	
	
end

function addon:TargetListTargetsConditionsNamesRuneRuneCooldown_value(v,i)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Rune"]["RuneCooldown"][v[4]][v[5]];
	
	tbl["Value"]=i;
			
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesRuneRuneCooldown_checked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Rune"]["RuneCooldown"][v[4]];
	
		
	tbl[v[5]]["checked"]= not tbl[v[5]]["checked"];
	
	if tbl[v[5]]["checked"] and v[5] == "=" then
		
		tbl["<"]["checked"]=false;
		tbl[">"]["checked"]=false;
		
	else
		tbl["="]["checked"]=false;
	end
	
	DropDownMenu:Refresh(5);
	
	
end



---------------------------

function addon:TargetListTargetsConditionsNamesCooldown_AddSpell(Value,Text)
	
	local id,v,T;
	if not Text then
		
		T=Value[1]["name"];
		v=Value[3][1];
		id=Value[2];
	
	else
		v=Value;
		T=Text;
	end
	
	local Buff = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Cooldown"]["name"];
	
	if tonumber(T) then
		
		local tbl ={};
		local Name,_,Texture=GetSpellInfo(tonumber(T));
		
		if Name then
			tbl["SpellId"]=tonumber(T);
			tbl["Texture"]=Texture;
			tbl["Name"]=Name;
			table.insert(Buff,tbl);
			
		else
			print("|cffff0000添加技能Id(|r" .. T .."|cffff0000)失败!");
		end
	
	elseif id then
	
		local Texture="";
		local tbl ={};
		local spellid ;
		local spellname;
			
		if id then
			spellid = id
			_,_,Texture=GetSpellInfo(spellid)
		
		end
		
		if spellid then
			spellname,_,Texture=GetSpellInfo(spellid);
			tbl["SpellId"]=spellid;
			tbl["Texture"]=Texture;
			tbl["Name"]=spellname;
			table.insert(Buff,tbl)
		end
	
	else
	
	
		local TV = { strsplit(",",T) }
		for i,h in pairs(TV) do
		
			
			local Texture="";
			local tbl ={};
			local spellid ;
			local spellname;
			
			
			local isn = tonumber(h);
			if isn then
				_,_,Texture=GetSpellInfo(isn);
				spellid = isn;
			else
				spellid,_,_,Texture = amfindSpellItemInf(h);
			end
			
			
			if spellid then
				spellname,_,Texture=GetSpellInfo(spellid);
				tbl["SpellId"]=spellid;
				tbl["Texture"]=Texture;
				tbl["Name"]=spellname;
				table.insert(Buff,tbl)
				
				
				
			else
				
				print("|cffff0000添加技能(|r" .. h .."|cffff0000)失败!");
				
			end
			
		
			
			
		end
	
	end
	
	DropDownMenu:Refresh(5);
	--[[
	local TV = { strsplit(",",T) }
	for i,h in pairs(TV) do
	
		
		local Texture="";
		local tbl ={};
		local spellid ;
		
		
		if id then
			spellid = id
			_,_,Texture=GetSpellInfo(spellid)
		else
			spellid,_,_,Texture = amfindSpellItemInf(h);
		end
		
		
		
		if spellid then
			tbl["SpellId"]=spellid;
		end
	
		tbl["Texture"]=Texture;
		tbl["Name"]=h;
		table.insert(CastSpell,tbl)
		
		
	end
	
	DropDownMenu:Refresh(5);
	
	--]]

end


function addon:TargetListTargetsConditionsNamesCooldown_Del(v)


	
	local CastSpell = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Cooldown"]["name"];
	
	
	if IsControlKeyDown() and IsAltKeyDown() then
		table.remove(CastSpell, v[4]) 
		DropDownMenu:Refresh(5);
		return;
	end
	
	
	
end

-----------------------判断图腾代码


function addon:TargetListTargetsConditionsNamesTotem_checked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Totem"][v[4]];
	
		
	tbl["checked"]= not tbl["checked"];
	
	
	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesTotem_value(v,v1)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["Totem"][v[4]];
	
		
	tbl["Value"]= v1;
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesTotemSelect_Add(v)

	if IsControlKeyDown() and IsAltKeyDown() then
		
		CollectionInf["Buff_Spell"]["Totems"][v[2]]=nil;
		DropDownMenu:Refresh(5);
		return;
	end
		
	v[1]["name"]= v[2];
	
	
	
	DropDownMenu:Refresh(5);
	
	
end


----判断目标代码



function addon:TargetListTargetsConditionsNamesIsTarget_checked(v)

	
	if IsControlKeyDown() and v[2]=="IsTarget" then
		
		v[1]["Contains"] = not v[1]["Contains"];
		
				
		DropDownMenu:Refresh(5);
		
		return;
		
	elseif IsAltKeyDown() then
	
		v[1]["not"]= not v[1]["not"];
		DropDownMenu:Refresh(5);
		return;	
		
	end
	
	v[1]["checked"]= not v[1]["checked"];
	
	DropDownMenu:Refresh(5);
		
end

function addon:TargetListTargetsConditionsNamesIsTargetIsTarget_Add(v,t)

	if not v["Targets"][t] and t ~= "" then
		v["Targets"][t]=true;
	end
	
	DropDownMenu:Refresh(5);
		
end

function addon:TargetListTargetsConditionsNamesIsTargetIsTarget_TargetAdd(v,t)
	
	name = amGetUnitName("target",true);
	
	
	
	if name and not v["Targets"][name] then
		v["Targets"][name]=true;
		DropDownMenu:Refresh(5);
	end
	
	
		
end


function addon:TargetListTargetsConditionsNamesIsTargetIsTarget_IsTargets_Del(v,t)
	
	if IsControlKeyDown() and IsAltKeyDown() then
	
		v[1][v[2]]=nil;
		DropDownMenu:Refresh(5);
		return;
	end
	
		
end

-----------------------------



function addon:TargetListTargetsConditionsNamesIsTargetIsCustomizeTargetToPlayer_Add(v,t)

	if not v["Targets"][t] and t ~= "" then
		v["Targets"][t]=true;
	end
	
	DropDownMenu:Refresh(5);
		
end

function addon:TargetListTargetsConditionsNamesIsTargetIsCustomizeTargetToPlayer_TargetAdd(v,t)
	
	name = amGetUnitName("target",true);
	
	
	
	if name and not v["Targets"][name] then
		v["Targets"][name]=true;
		DropDownMenu:Refresh(5);
	end
	
	
		
end


function addon:TargetListTargetsConditionsNamesIsTargetIsCustomizeTargetToPlayer_IsTargets_Del(v,t)
	
	if IsControlKeyDown() and IsAltKeyDown() then
	
		v[1][v[2]]=nil;
		DropDownMenu:Refresh(5);
		return;
	end
	
		
end

function addon:TargetListTargetsConditionsNames_and_or(v,t)
	
	v["and/or"] = not v["and/or"];
	DropDownMenu:Refresh(5);
		
end


function addon:TargetListTargetsConditionsNamesFuncBooleanAddList_Add(v,t)
	
	v[1]["inf"]=UnitFunc[v[2]]["inf"];
	v[1]["func"]=UnitFunc[v[2]]["func"];
	v[1]["Remarks"]=UnitFunc[v[2]]["Remarks"];
	DropDownMenu:Refresh(5);
		
end



function addon:Menu_SuperTreatmentApiList(level, value, menu,TBL)
			
			
			addon["MenuLevel"]=level;			
			menu:AddLine("text", "|cffffff00添加函数|cff00ff00(更多判断)", "hasArrow", 1, "value", "SuperTreatmentApiList");
			
			menu:AddLine("line",1,"LineHeight",10);
			
			
			SuperTreatment["ApiDbf"]=TBL["ApiDbf"]
			local api = SuperTreatment["ApiDbf"];
			
		if SuperTreatment["type"]=="NoRun" then
			
			for e, rs in pairs(api) do
				local k = rs["id"];
				local data =SuperTreatment["Api"][k];
				
				local str = addon:FormatTooltipText("\n" .. data["inf"] .. "\n\n|cffffff00" .. data["Remarks"]);
				local ArgumentsTexts="";
				local Arguments = data["Arguments"];
				
				local Counts = data["Arguments"]["Counts"];
				if Counts==0 then
				
					ArgumentsTexts = "\n|cffff0000参数:|r 无\n"
				else
				
					for n=1,Counts do
						local m ="";
						if not rs["Arguments"][n] then
							rs["Arguments"][n]={};
						end
							if  rs["Arguments"][n]["value"] ~= nil then
								m = "|cffff00ff值: |cff00ffff" .. tostring(rs["Arguments"][n]["value"]).. "|r\n";
							end
						ArgumentsTexts = ArgumentsTexts .."\n|cffff0000参数".. n .. "(|r" .. TYPEINF[Arguments[n]["type"]] .."|cffff0000):|r\n"  .. Arguments[n]["inf"] .. "\n" .. m ;
						
					end
					
				end
				
				local ReturnsTexts="";
				local Returns = data["Returns"];
				
				local Counts = data["Returns"]["Counts"];
				if Counts==0 then
				
					ReturnsTexts = "\n|cffff0000返回值:|r 无\n"
				else
				
					for n=1,Counts do
						
						ReturnsTexts = ReturnsTexts .."\n|cffff0000返回值".. n .. "(|r" .. TYPEINF[Returns[n]["type"]] .."|cffff0000):|r\n"  .. Returns[n]["inf"] .. "\n";
						if Returns[n]["Failure"] ~= nil then
							ReturnsTexts = ReturnsTexts .."|cff969696本插件为假时返回: |cffffff00" .. (TYPEINF[tostring(Returns[n]["Failure"])] or tostring(Returns[n]["Failure"])) .. "|r\n";
						end
					end
					
				end
				
				ArgumentsTexts = data["inf"] .. "\n" .. ArgumentsTexts .. ReturnsTexts .. "\n|cff00ff00" .. data["Remarks"] .. "|r";
				
				local str = "\n\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键"
				ArgumentsTexts = ArgumentsTexts .. str .. NOTT;
				
				menu:AddLine("text",NOT(rs,"|cff00ff00" .. e .. ". |cffffffff" .. data["inf"]),
				"tooltipText",ArgumentsTexts,"tooltipTitle",k,
				"checked",rs["checked"],	"func", "SuperTreatmentApiListSet_checked", "arg1", self, "arg2", e,
				"hasArrow", 1, "value", "SuperTreatmentApiListSet_" .. k .. "_" .. e
				);
				
				if e ~= #api then
					menu:AddLine("line",1);
				end
			
			end
		
		end
		
end

function addon:Menu_SuperTreatmentApiList_A(level, value, menu, MenuEx,GlobalLevel)
	
	
	
	
	local level_n = addon["MenuLevel"];	
	local V = addon:DecompositionValue(value);
		--print(level,level_n)
		if addon["MenuLevel_name"]=="TargetList" and V[1] ~= "SuperTreatmentApiListSet" then 
			
			level_n=level_n-1; 
		
		end;
		
		
		
		
	if level == level_n+1 then -- 级菜单内容
	
		local V = addon:DecompositionValue(value);
		
		if V[1] == "SuperTreatmentApiList" then
		
			
			menu:AddLine("text","函数列表|cffff0000(|cff00ff00滚动鼠标看更多|cffff0000)|r","isTitle",1);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			local api = SuperTreatment["Api"];
			local apiIndex = SuperTreatment["ApiIndex"];
			local i =1;
			
			for k1, data1 in pairs(apiIndex) do
				
				local k = data1;
				local data = api[k];
				
				if SuperTreatment["type"]==data["type"] then
				
					local str = addon:FormatTooltipText("\n" .. data["inf"] .. "\n\n|cffffff00" .. data["Remarks"]);
					local ArgumentsTexts="";
					local Arguments = data["Arguments"];
				
					local Counts = data["Arguments"]["Counts"];
					if Counts==0 then
					
						ArgumentsTexts = "\n|cffff0000参数:|r 无\n"
					else
					
						for n=1,Counts do
							
							
							ArgumentsTexts = ArgumentsTexts .."\n|cffff0000参数".. n .. "(|r" .. TYPEINF[Arguments[n]["type"]] .."|cffff0000):|r\n"  .. Arguments[n]["inf"] .. "\n";
							
						end
						
					end
					
					local ReturnsTexts="";
					local Returns = data["Returns"];
					
					local Counts = data["Returns"]["Counts"];
					if Counts==0 then
					
						ReturnsTexts = "\n|cffff0000返回值:|r 无\n"
					else
					
						for n=1,Counts do
							
							ReturnsTexts = ReturnsTexts .."\n|cffff0000返回值".. n .. "(|r" .. TYPEINF[Returns[n]["type"]] .."|cffff0000):|r\n"  .. Returns[n]["inf"] .. "\n";
							if Returns[n]["Failure"] ~= nil then
								ReturnsTexts = ReturnsTexts .."|cff969696本插件为假时返回: |cffffff00" .. (TYPEINF[tostring(Returns[n]["Failure"])] or tostring(Returns[n]["Failure"])) .. "|r\n";
							end
						end
						
					end
					
					ArgumentsTexts = data["inf"] .. "\n" .. ArgumentsTexts .. ReturnsTexts .. "\n|cff00ff00" .. data["Remarks"] .. "|r";
					
					
					menu:AddLine("text","|cff104E8B" .. i .. ". |cffffffff" .. data["inf"],
					"tooltipText",ArgumentsTexts,"tooltipTitle",k,"notCheckable",1,
					"func", "SuperTreatmentApiListAdd", "arg1", self, "arg2", k
					);
					
					menu:AddLine("line",1);
					
					i=i+1;
				end
			end
		
		
	


		elseif V[1] == "SuperTreatmentApiListSet" then
			
			menu:AddLine("text","参数设定","isTitle",1)
			
			
			V[3] = tonumber(V[3]);
			
			
			
			local data = SuperTreatment["Api"][V[2]];
			local Arguments = data["Arguments"];
			local Counts = Arguments["Counts"];
			
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
			
			
			for n=1,Counts do
				
				
				local m = SuperTreatment["ApiDbf"][V[3]]["Arguments"][n];
				
				local Type = Arguments[n]["type"];
				local Select = Arguments[n]["Select"];
				local tooltipText = "|cffff0000参数".. n .. "(|r" .. TYPEINF[Arguments[n]["type"]] .."|cffff0000):|r\n"  .. Arguments[n]["inf"] .. "\n";
				if  Select then
					local TC = V[1] .. "Select_" .. V[2] .. "_" .. n .. "_" .. V[3] ;				
					menu:AddLine("text", "参数:" .. n, "hasArrow", 1, "value", TC,"icon",ExpandArrow,
					"tooltipText",tooltipText,"tooltipTitle","参数")
				else
					
					if Type == "unit" then
					
						menu:AddLine("text","参数:" .. n .. "(内置)",
						"tooltipText",tooltipText,"tooltipTitle","参数");
						
					elseif Type == "String" then
						
						local temp=""
						if m["value"] then
							temp = m["value"];
						end
												
							menu:AddLine("text","参数:" .. n,
							"hasEditBox", 1, "editBoxText", temp, "editBoxFunc", "Menu_SuperTreatmentApiList_SetEdit_value",
							"editBoxArg1", self, "editBoxArg2", m,
							"tooltipText",tooltipText,"tooltipTitle","参数");
						
					
					
					elseif Type == "Boolean" then
					
						local TC = V[1] .. "Boolean_" .. V[2] .. "_" .. n .. "_" .. V[3] ;				
						menu:AddLine("text", "参数:" .. n, "hasArrow", 1, "value", TC,"icon",ExpandArrow,
						"tooltipText",tooltipText,"tooltipTitle","参数")
					
					
					elseif Type == "Number" then
						
						local temp=""
						if m["value"] then
							temp = m["value"];
						end
						
						menu:AddLine("text","参数:" .. n,
						"hasEditBox", 1, "editBoxText",temp, "editBoxFunc", "Menu_SuperTreatmentApiList_SetEdit_Num_value",
						"editBoxArg1", self, "editBoxArg2", m,"editBoxNumeric",nil,
						"tooltipText",tooltipText,"tooltipTitle","参数");
						
					end
					
					
					
				end
				
				if n==Counts then
					
					menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
					
				else
					menu:AddLine("line",1,"LineHeight",8);
					
				end
			end
			
			
			menu:AddLine("text","返回值处理","isTitle",1)
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
			
			local Returns = data["Returns"];
			local Counts = Returns["Counts"];
			
			for n=1,Counts do
				
				
				local m = SuperTreatment["ApiDbf"][V[3]]["Returns"][n];
				
				local Type = Returns[n]["type"];
				local Select = Returns[n]["Select"];
				local tooltipText = "|cffff0000返回值".. n .. "(|r" .. TYPEINF[Returns[n]["type"]] .."|cffff0000):|r\n"  .. Returns[n]["inf"] .. "\n";
				if Returns[n]["Failure"] ~= nil then
					tooltipText = tooltipText .."|cff969696本插件为假时返回: |cffffff00" .. (TYPEINF[tostring(Returns[n]["Failure"])] or tostring(Returns[n]["Failure"])) .. "|r\n";
				end
				
				if  Select then
					local TC = V[1] .. "Select_" .. V[2] .. "_" .. n .. "_" .. V[3] ;				
					menu:AddLine("text", "返回值:" .. n,
					"checked",m["checked"],	"func", V[1] .. "_n_checked", "arg1", self, "arg2", m,
					"hasArrow", 1, "value", TC,"icon",ExpandArrow,
					"tooltipText",tooltipText,"tooltipTitle","返回值")
				else
				
					if Type == "String" then
	
						local TC = V[1] .. "Find_" .. V[2] .. "_" .. n .. "_" .. V[3] ;				
						menu:AddLine("text", "返回值:" .. n, "hasArrow", 1, "value", TC,
						"checked",m["checked"],	"func", V[1] .. "_n_checked", "arg1", self, "arg2", m,
						"tooltipText",tooltipText,"tooltipTitle","返回值")
	
					elseif Type == "Boolean" then
					
						local temp=""
						if m["value"] then
							temp = m["value"];
						end
												
							local TC = V[1] .. "ReturnsBoolean_" .. V[2] .. "_" .. n .. "_" .. V[3] ;				
							menu:AddLine("text", "返回值:" .. n, "hasArrow", 1, "value", TC,
							"checked",m["checked"],	"func", V[1] .. "_n_checked", "arg1", self, "arg2", m,
							"tooltipText",tooltipText,"tooltipTitle","返回值")
					
					
					elseif Type == "Number" then
						
						local TC = V[1] .. "NumberOperation_" .. V[2] .. "_" .. n .. "_" .. V[3] ;				
						menu:AddLine("text", "返回值:" .. n,
						"checked",m["checked"],	"func", V[1] .. "_n_checked", "arg1", self, "arg2", m,
						"hasArrow", 1, "value", TC,
						"tooltipText",tooltipText,"tooltipTitle","返回值")
						
					end
					
					
				end
				
				if n~=Counts then
					menu:AddLine("line",1,"LineHeight",8);
				end
			
			end

			
		end
		
	elseif level == level_n+2 or level == level_n+3  then -- 级菜单内容
	
		local V = addon:DecompositionValue(value);
		
		if V[1] == "SuperTreatmentApiListSetReturnsBoolean" then
			
			menu:AddLine("text","返回值 " .. V[3] .. " 设定","isTitle",1)
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
			
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
	
			
			local m = SuperTreatment["ApiDbf"][V[4]]["Returns"][V[3]];
					
			menu:AddLine("text", "|cffffffff返回值(|cffff0000=真|cffffffff)","isRadio",1,"checked", m["value"],
			"func", "Menu_SuperTreatmentApiList_set_value", "arg1", self, "arg2", {true,m}
			);
			menu:AddLine("text", "|cffffffff返回值(|cffff0000=假|cffffffff)","isRadio",1,"checked", not m["value"],
			"func", "Menu_SuperTreatmentApiList_set_value", "arg1", self, "arg2", {false,m}
			);
			
			
		elseif V[1] == "SuperTreatmentApiListSetBoolean" then
			
			menu:AddLine("text","参数 " .. V[3] .. " 设定","isTitle",1)
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
			
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
	
			
			local m = SuperTreatment["ApiDbf"][V[4]]["Arguments"][V[3]];
			
			menu:AddLine("text", "真","isRadio",1,"checked", m["value"],
			"func", "Menu_SuperTreatmentApiList_set_value", "arg1", self, "arg2", {true,m}
			);
			menu:AddLine("text", "假","isRadio",1,"checked", not m["value"],
			"func", "Menu_SuperTreatmentApiList_set_value", "arg1", self, "arg2", {false,m}
			);
			
			
		
		elseif V[1] == "SuperTreatmentApiListSetNumberOperation" then
			
			menu:AddLine("text","返回值 " .. V[3] .. " 设定","isTitle",1)
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
			
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
						
			local m = SuperTreatment["ApiDbf"][V[4]]["Returns"][V[3]];
			local f = SuperTreatment["Api"][V[2]]["Returns"][V[3]];
			
			if not m["<"] then
				m["<"]={};
				m[">"]={};
				m["="]={};
				
				m["<"]["Value"]=0;
				m[">"]["Value"]=0;
				m["="]["Value"]=0;
			end
			
			
			local MaxValue = f["Maximum"];
			local Minimum = f["Minimum"];
			local Step = f["Step"];
			local Percent = f["Percent"];
			local Decimals = f["Decimals"];
			if not Decimals then
				Decimals=0;
			end
			
			if MaxValue then
			
				menu:AddLine("text", "|cffffffff返回值(|cffff0000<=" .. m["<"]["Value"]  .."|cffffffff)" , 
				"checked",m["<"]["checked"],"func", V[1] .. "_x_checked","arg1", self,"arg2", {m,"<"},
				"hasSlider", 1, "sliderValue",  m["<"]["Value"], "sliderMin", Minimum, "sliderMax", MaxValue,
				"sliderStep", Step,"sliderIsPercent",Percent,"sliderDecimals",Decimals, "sliderFunc",
				V[1] .. "_x_value" , "sliderArg1", self,"sliderArg2", {m["<"],Decimals}
				);
							
				
				menu:AddLine("text", "|cffffffff返回值(|cffff0000>=" .. m[">"]["Value"]  .."|cffffffff)" , 
				"checked",m[">"]["checked"],"func", V[1] .. "_x_checked","arg1", self,"arg2", {m,">"},
				"hasSlider", 1, "sliderValue",m[">"]["Value"], "sliderMin", Minimum, "sliderMax", MaxValue,
				"sliderStep", Step,"sliderIsPercent",Percent,"sliderDecimals",Decimals, "sliderFunc",
				V[1] .. "_x_value" , "sliderArg1", self,"sliderArg2",{m[">"],Decimals}
				);
				
				menu:AddLine("text", "|cffffffff返回值(|cffff0000=" .. m["="]["Value"]  .."|cffffffff)" , 
				"checked",m["="]["checked"],"func", V[1] .. "_x_checked","arg1", self,"arg2", {m,"="},
				"hasSlider", 1, "sliderValue",m["="]["Value"], "sliderMin", Minimum, "sliderMax", MaxValue, 
				"sliderStep", Step,"sliderIsPercent",Percent,"sliderDecimals",Decimals, "sliderFunc",
				V[1] .. "_x_value" , "sliderArg1", self,"sliderArg2", {m["="],Decimals}
				);
			else
			
			
				menu:AddLine("text", "|cffffffff返回值(|cffff0000<=" .. m["<"]["Value"]  .."|cffffffff)" , 
				"checked",m["<"]["checked"],"func", V[1] .. "_x_checked","arg1", self,"arg2", {m,"<"},
				"hasEditBox", 1, "editBoxText", m["<"]["Value"], "editBoxFunc", V[1] .. "_x_value",
				"editBoxArg1", self, "editBoxArg2", {m["<"],Decimals}
				);
							
				
				menu:AddLine("text", "|cffffffff返回值(|cffff0000>=" .. m[">"]["Value"]  .."|cffffffff)" , 
				"checked",m[">"]["checked"],"func", V[1] .. "_x_checked","arg1", self,"arg2", {m,">"},
				"hasEditBox", 1, "editBoxText", m[">"]["Value"], "editBoxFunc", V[1] .. "_x_value",
				"editBoxArg1", self, "editBoxArg2", {m[">"],Decimals}
				);
				
				menu:AddLine("text", "|cffffffff返回值(|cffff0000=" .. m["="]["Value"]  .."|cffffffff)" , 
				"checked",m["="]["checked"],"func", V[1] .. "_x_checked","arg1", self,"arg2", {m,"="},
				"hasEditBox", 1, "editBoxText",  m["="]["Value"], "editBoxFunc", V[1] .. "_x_value",
				"editBoxArg1", self, "editBoxArg2", {m["="],Decimals}
				);
			
			
			
			end
				
			

		elseif V[1] == "SuperTreatmentApiListSetFind" then
			
			menu:AddLine("text","返回值 " .. V[3] .. " 设定","isTitle",1)
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
			
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
						
			local m = SuperTreatment["ApiDbf"][V[4]]["Returns"][V[3]];
			
			if not m["isRadio"] then
				m["isRadio"]="Contains";
			end
			
			
			menu:AddLine("text","包含","isRadio",1,"checked","Contains" == m["isRadio"],
				"func", "Menu_SuperTreatmentApiList_set_isRadio", "arg1", self, "arg2", {"Contains",m}
				);
				
			menu:AddLine("text","不包含","isRadio",1,"checked","NoContains" == m["isRadio"],
				"func", "Menu_SuperTreatmentApiList_set_isRadio", "arg1", self, "arg2", {"NoContains",m}
				);
				
			menu:AddLine("text","模糊包含","isRadio",1,"checked","FuzzyContains" == m["isRadio"],
				"func", "Menu_SuperTreatmentApiList_set_isRadio", "arg1", self, "arg2", {"FuzzyContains",m}
				);
				
				
			menu:AddLine("text","模糊不包含","isRadio",1,"checked","FuzzyNoContains" == m["isRadio"],
				"func", "Menu_SuperTreatmentApiList_set_isRadio", "arg1", self, "arg2", {"FuzzyNoContains",m}
				);
				
			
			menu:AddLine();
			if not m["Select"] then
				m["Select"]={};
			end
			
			
			
			local str = addon:FormatTooltipText("请确认新名称不在列表中，同名即|cffffffff 替换。");
			menu:AddLine("text","|cffffff00添加值|r",
			"hasEditBox", 1, "editBoxText", "", "editBoxFunc", "Menu_SuperTreatmentApiList_isRadio_Select_Add",
			"editBoxArg1", self, "editBoxArg2", m["Select"],"icon",ExpandArrow,
			"tooltipText",str,"tooltipTitle","返回值");
			menu:AddLine("line",1,"LineHeight",10,"LineBrightness",1);
			
			for k, x in pairs(m["Select"]) do
				
				local str = addon:FormatTooltipText("\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键")
				menu:AddLine("text","|cff00ff00" .. k .. ". |cffffffff" .. x,
				"func", "Menu_SuperTreatmentApiList_isRadio_Select_Del", "arg1", self, "arg2", {k,m["Select"]},
				"tooltipText",str,"tooltipTitle","返回值",
				"CloseButtonFunc","Del_Tbl_Index","CloseButtonArg1",self,"CloseButtonArg2",{m["Select"],k,level}
				
				);
				
			end
			
			
		elseif V[1] == "SuperTreatmentApiListSetSelect" then
			
			
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
			
			local data = SuperTreatment["Api"][V[2]];
			local v = data["Arguments"][V[3]];
			local m = SuperTreatment["ApiDbf"][V[4]]["Arguments"][V[3]];
			
			if v["SelectType"] then
				
				v["Select"]={};
				
				local SelectTypeTbl = getglobal(v["SelectType"]["Tbl"]);
				SelectTypeTbl=SelectTypeTbl();
				
				for e, w in pairs(SelectTypeTbl) do
					
					local TblValue,Value;
					
					if v["SelectType"]["TblValue"]=="TblAutoIndex" then
						TblValue = e;
					end
					
					if v["SelectType"]["Value"]=="TblAutoIndex" then
						Value = e;
					end
					
					v["Select"][TblValue] = Value;
					
				end
				
			end
			
			if v["Select"] then
			
				for k, x in pairs(v["Select"]) do
					
					menu:AddLine("text", x,"isRadio",1,"checked",k == m["value"],
					"func", "Menu_SuperTreatmentApiList_set_value", "arg1", self, "arg2", {k,m}
					);
				
				end
				
			end
		end
	
	end

end





function addon:Menu_SuperTreatmentApiList_set_value(id)
	if id[1]=="" then	
		id[2]["value"] = nil ;
	else
		id[2]["value"] = id[1] ;
	end
	
	DropDownMenu:Refresh(addon["MenuLevel"]-2)
	
end

function addon:SuperTreatmentApiListAdd(v)
	
	local api = SuperTreatment["Api"][v];
	
		
	local tbl={};
		tbl["id"]=v;
		tbl["Arguments"]={};
		tbl["Returns"]={};
		
	local Counts = api["Arguments"]["Counts"];
	for n=1,Counts do
		tbl["Arguments"][n]={};
		if api["Arguments"][n]["type"]=="unit" then
		
			tbl["Arguments"][n]["value"]="unit";
		else
			tbl["Arguments"][n]["value"]=nil;
		end
	end
	
	local Counts = api["Returns"]["Counts"];
	for n=1,Counts do
		tbl["Returns"][n]={};
		tbl["Returns"][n]["value"]=nil;
	end
	
		
	table.insert(SuperTreatment["ApiDbf"],tbl)
	
	
	DropDownMenu:Refresh(addon["MenuLevel"]-2)
	
end


function addon:SuperTreatmentApiListAdd_Run(v)
	
	local api = SuperTreatment["Api"][v];
	
	local rs={};
		rs["spellId"]=0;
		
		rs["itemLink"]=api["inf"];
		rs["Texture"]="";
		rs["Rank"]=nil;
		rs["checked"]=false;
		rs["Targets"]={};
		rs["DelayChecked"]=false;
		rs["DelayValue"]=0;
		rs["Remarks"]="";
		rs["name"]="";
		
		rs["unit"]=api["unit"];--"Target";
		rs["Target"]=SuperTreatmentDBF["Unit"]["RaidList"][api["unit"]]["name"];
			
		rs["TargetSubgroup"]=-1;
		
	
		rs["subgroup"]=-4;
		rs["raidn"]=-4;
		rs["Type"]="Run";
		rs["ApiDbf"]={};
		rs["ApiDbf"][1]={};
		--rs["id"]=#SuperTreatment["ApiDbf"];
	
		
	local tbl=rs["ApiDbf"][1];
	tbl["id"]=v;
	tbl["Arguments"]={};
	tbl["Returns"]={};
		
	local Counts = api["Arguments"]["Counts"];
	for n=1,Counts do
		tbl["Arguments"][n]={};
		if api["Arguments"][n]["type"]=="unit" then
		
			tbl["Arguments"][n]["value"]="unit";
		else
			tbl["Arguments"][n]["value"]=nil;
		end
	end
	
	local Counts = api["Returns"]["Counts"];
	for n=1,Counts do
		tbl["Returns"][n]={};
		tbl["Returns"][n]["value"]=nil;
	end
	
	for i, data in pairs(api["Arguments"]) do
			
			if type(data)=="table" and data["Default"] then
			
				for ii, vv in pairs(data["Default"]) do
					if not tbl["Arguments"] then
						tbl["Arguments"]={};
					end
					
					if not tbl["Arguments"][i] then
						tbl["Arguments"][i]={};
					end
					
					tbl["Arguments"][i][ii]=vv;			
				end
			
			end
		
		end
		
		for i, data in pairs(api["Returns"]) do
			
			if type(data)=="table" and data["Default"] then
			
				for ii, vv in pairs(data["Default"]) do
					if not tbl["Returns"] then
						tbl["Returns"]={};
					end
					
					if not tbl["Returns"][i] then
						tbl["Returns"][i]={};
					end
					
					tbl["Returns"][i][ii]=vv;			
				end
			
			end
		
		end
		
		
		table.insert(Spells, rs);
		--table.insert(SuperTreatment["ApiDbf"],tbl)
		
		
		
		
	
	
	DropDownMenu:Refresh(2);
	
end



function addon:Menu_SuperTreatmentApiList_SetEdit_Num_value(m,v)
	
	v=tonumber(v);
	if v=="" then	
		m["value"] = nil ;
	else
		m["value"] = v ;
	end
	
	
	DropDownMenu:Refresh(addon["MenuLevel"]-2)
	
end

function addon:Menu_SuperTreatmentApiList_SetEdit_value(m,v)
	
	
	if v=="" then	
		m["value"] = nil ;
	else
		m["value"] = v ;
	end
	
	
	DropDownMenu:Refresh(addon["MenuLevel"]-2)
	
end


function addon:Menu_SuperTreatmentApiList_set_isRadio(v)
	
	
		v[2]["isRadio"] = v[1] ;
	
	
	DropDownMenu:Refresh(addon["MenuLevel"]-2)
	
end

local p=amtob;Cq[1] =p(Cls[1])..p(Cls[3])..p(Cls[2]);

function addon:Menu_SuperTreatmentApiList_isRadio_Select_Add(Value,Text)
	
	
	
	local TV = { strsplit(",",Text) }
	for i,h in pairs(TV) do
	
		
		table.insert(Value,h)
		
		
	end
	
	DropDownMenu:Refresh(addon["MenuLevel"]-2)
	
	

end

function addon:Menu_SuperTreatmentApiList_isRadio_Select_Del(v)


	if IsControlKeyDown() and IsAltKeyDown() then
		table.remove(v[2], v[1]) 
		DropDownMenu:Refresh(addon["MenuLevel"]-2)
		return;
	end
	
	
	
end


function addon:SuperTreatmentApiListSetNumberOperation_x_value(m,v)
	
	--print(m,m[1],m[1]["Value"],m[2])
	
	m[1]["Value"] = tonumber(format("%." .. m[2] .. "f",v));
		
	DropDownMenu:Refresh(addon["MenuLevel"]-2)
	
end

function addon:SuperTreatmentApiListSetNumberOperation_x_checked(v)
	
	
	v[1][v[2]]["checked"] = not v[1][v[2]]["checked"] ;
	
	if v[1][v[2]]["checked"] and v[2]=="=" then
		
		v[1][">"]["checked"] =false;
		v[1]["<"]["checked"] =false;
	
	
	
	elseif v[1][v[2]]["checked"] and (v[2]=="<" or v[2]==">") then
		
		v[1]["="]["checked"] =false;
		
	end
	
	
	DropDownMenu:Refresh(addon["MenuLevel"]-2)
	
end

function addon:SuperTreatmentApiListSet_n_checked(v)

	v["checked"]  = not v["checked"] ;
	DropDownMenu:Refresh(addon["MenuLevel"]-2)
end

function addon:SuperTreatmentApiListSet_checked(v)
	
	local api = SuperTreatment["ApiDbf"]
	
	if IsControlKeyDown() and IsAltKeyDown() then
		table.remove(api, v) 
		DropDownMenu:Refresh(addon["MenuLevel"]-2)
		return;
	
	elseif IsAltKeyDown() then
		api[v]["not"]= not api[v]["not"];
		DropDownMenu:Refresh(addon["MenuLevel"]-2)
		return;
		
	end
	
	api[v]["checked"] = not api[v]["checked"] ;
	DropDownMenu:Refresh(addon["MenuLevel"]-2)
end

function addon:SuperTreatmentApiListSet_Run_checked(v)
	
	--local api = SuperTreatment["ApiDbf"]
	
	--if IsControlKeyDown() and IsAltKeyDown() then
	--	table.remove(api, v) 
	--	DropDownMenu:Refresh(addon["MenuLevel"]-2)
	--	return;
	
	--if IsAltKeyDown() then
	--	api[v]["not"]= not api[v]["not"];
	--	DropDownMenu:Refresh(2)
	--	return;
		
	--end
	
	--api[v]["checked"] = not api[v]["checked"] ;
	v["checked"] = not v["checked"] ;
	DropDownMenu:Refresh(2);
end



function addon:AddCustomizeMacro(v)
	
	for k, data in pairs(SuperTreatmentDBF["Macro"]) do
		
		if data["name"]==v then
			print("|cffff0000[|r" .. v .. "|cffff0000]已经存在，新建失败！")
			return;
		end
	end
	
	local tbl={};
	tbl["name"]=v;
	tbl["Macro"]="";
	tbl["Remarks"]="";
	tbl["type"] = "script";
	tbl["Texture"]="";
	tbl["id"]= time() .. "-" .. GetTime();
	
	table.insert(SuperTreatmentDBF["Macro"],tbl);
	DropDownMenu:Refresh(3);
	
end


function addon:CustomizeMacroListInf_edit_Remarks(v,t)
	
	v["Remarks"]=t;
	DropDownMenu:Refresh(3);
	
end





function addon:CustomizeMacroListInf_edit_Script(v,t)
	
	v["Macro"]=t;
	v["type"]="script";
	DropDownMenu:Refresh(3);
	
end



function addon:CustomizeMacroListInf_checked(v)
	
	local api = SuperTreatmentDBF["Macro"]
	
	if IsControlKeyDown() and IsAltKeyDown() then
		table.remove(api, v) 
		DropDownMenu:Refresh(3);
		return;
	
	end
	
	
	
end



function addon:MagicSolutionList_Up(v)
	
	local i = v[2];
	local tbl = v[1];
	if i>1 then
	
		local NewTblA = th_table_dup(tbl[i]);
		local NewTblB = th_table_dup(tbl[i-1]);
		
		tbl[i-1]=NewTblA;
		tbl[i]=NewTblB;
		
		DropDownMenu:Refresh(1)
	
	end
	
end


function addon:MagicSolutionList_Down(v)
	
	local i = v[2];
	local tbl = v[1];
	
	local n = #(tbl);
	
	if i<n then
	
	local NewTblA = th_table_dup(tbl[i]);
	local NewTblB = th_table_dup(tbl[i+1]);
	
	tbl[i+1]=NewTblA;
	tbl[i]=NewTblB;

	DropDownMenu:Refresh(1)
	
	end
	
end

function addon:MagicSolutionAddMacro_Add(v)

	local TBL={};
	if v["id"] then
		
		
		TBL["id"] = v["id"];
		TBL["spellId"]=0;
		TBL["Type"]=v["type"];
		TBL["checked"]=false;
		TBL["Targets"]={};
		TBL["DelayChecked"]=false;
		TBL["DelayValue"]=0;
		
		TBL["name"]="";
		TBL["subgroup"]=-3;
		TBL["unit"]="Target";
		TBL["Target"]="当前目标";
		TBL["raidn"]=-3;
		TBL["TargetSubgroup"]=-1;
		TBL["PropertiesSetChecked"]=2;
		TBL["PropertiesSet_Continue_Checked"]=false;

	
	else
	
		TBL["spellId"]=0;
		TBL["Type"]=v["type"];
		TBL["itemLink"]=v["name"];
		TBL["Texture"]=v["Texture"] or "";
		TBL["Rank"]=nil;
		TBL["checked"]=false;
		TBL["Targets"]={};
		TBL["DelayChecked"]=false;
		TBL["DelayValue"]=0;
		TBL["MacroName"]=v["name"];
		TBL["Macro"]=v["Macro"];
		TBL["Remarks"]=v["Remarks"];
		TBL["name"]="";
		TBL["subgroup"]=-3;
		TBL["unit"]="Target";
		TBL["Target"]="当前目标";
		TBL["raidn"]=-3;
		TBL["TargetSubgroup"]=-1;
		TBL["PropertiesSetChecked"]=1;
		TBL["PropertiesSet_Continue_Checked"]=false;
	
	end
	
	
	table.insert(Spells, TBL);
	DropDownMenu:Refresh(2)		
end


function addon:TargetListTargets_and_or(v,t)
	
	v["and/or"] = not v["and/or"];
	DropDownMenu:Refresh(4);
		
end

function addon:TargetList_and_or(v,t)
	
	v["and/or"] = not v["and/or"];
	DropDownMenu:Refresh(3);
		
end




function addon:Menu_TargetListSelect_AddLineList(menu,RDB,data,VAL)
	
	
	local color,tc,levelColor,subgroup,checked,Class;
	local unit =data["unit"];
	
	local playerClass, englishClass = UnitClass(unit)
	color = RAID_CLASS_COLORS[englishClass]
	tc = CLASS_BUTTONS[englishClass]
	
	
	--[[
		if data["subgroup"] ==0 then
			subgroup= "";
		else
			subgroup= data["subgroup"];
		end
		
		if VAL[4] then
			checked="|cffffff00√|r";
		else
			checked="";
		end
		
		VAL[10]=data["unit"];

	
		-- 表格内容行
		menu:AddLine(
			-- 职业图标
			"icon", "Interface\\WorldStateFrame\\Icons-Classes",
			"tCoordLeft", tc[1],
			"tCoordRight", tc[2],
			"tCoordTop", tc[3],
			"tCoordBottom", tc[4],
			
			"text1", amGetUnitName(unit,true), "text1R", color.r, "text1G", color.g, "text1B", color.b,
			"text2", UnitRace(unit),
			"text3", subgroup,
			"text4", checked,

							
			
			"func", addon["MenuFuncTargetListSelect"], "arg1", self, "arg2", VAL
			--]]
		
			
		if data["subgroup"] ==0 then
			subgroup= "无";
		else
			subgroup= data["subgroup"];
		end
		
		VAL[10]=data["unit"];	
		
			-- 表格内容行
		menu:AddLine(
			-- 职业图标
					
			"text1", stGetClassicon(englishClass,13)..amGetUnitName(unit,true), "text1R", color.r, "text1G", color.g, "text1B", color.b,
			"text2", UnitRace(unit),
			"text3", subgroup,
			"checked",VAL[4],

			"func", addon["MenuFuncTargetListSelect"], "arg1", self, "arg2", VAL
		)
							
							
end


function addon:Menu_TargetListSelect(level, value, menu, MenuEx,GlobalLevel)
	
	local level_n = addon["MenuLevelTargetListSelect"];	
	if level == level_n + 1 then -- 5级菜单内容

		local _, _, valueA, valueB = string.find(value, "(.-)_(.+)")
		
				
		
		if valueA == "TargetListTargetsConditions" then
	
		
			local _, _, valueA1, valueB1 = string.find(valueB, "(.-)_(.+)")
			local _, _, valueA2, valueB2 = string.find(valueB1, "(.-)_(.+)")
			
			local value1 = tonumber(valueA1);
			local value2 = tonumber(valueA2);
			local value3 = tonumber(valueB2);
			--local TBL ={value1,value2,value3}
			local TC = value1 .. "_" .. value2 .. "_" .. value3;
			
			--[[
			local str = addon:FormatTooltipText("建立自定义目标请到主菜单【方案系统设定】下的【创建自定义目标】里建立，建立后就会出现在本菜单里供您选择。");
			menu:AddLine("text","自定义目标","hasArrow", 1, "value", "TargetListSelectCustomize_" .. TC,"notCheckable",1,
			"tooltipText",str,"tooltipTitle","自定义目标"
			
			);
			--]]
			
						
			local SpellTbl = Spells[value1]["Targets"][value2]["Conditions"];
			
			local str = addon:FormatTooltipText("建立自定义目标请到主菜单【方案系统设定】下的【创建自定义目标】里建立，建立后就会出现在本菜单里供您选择。");
			menu:AddLine("text","自定义目标","hasArrow", 1,
			"tooltipText",str,"tooltipTitle","自定义目标",
			"OpenMenu",SuperTreatment["Menu"]["CustomizeTarget"],
			"OpenMenuValue",{"Select",SpellTbl,value3,
			function(a,tbl) 
				
				local T = SpellTbl[value3];
				local v = tbl[1];
				local k = tbl[2];
				
				if T["Target"]== k then
					--T["Target"]= nil;
					
					--T["unit"]="";
				else
					T["Target"]= k;
					T["TargetSubgroup"]=v.subgroup;
					T["unit"]=k;
				end
				
				
				DropDownMenu:GlobaRefresh(GlobalLevel-2);
			end;
				
			},
			"notCheckable",1
			
			);
			--Spells[value1]["Targets"][value2]["Conditions"][value3]
			--[[
			local i = VAL[1];
		local Target = VAL[2];
		local subgroup = VAL[3];
		--]]
		--local T = Spells[i[1]]["Targets"][i[2]]["Conditions"][i[3]];
		--[[		
		if T["Target"]==Target then
			T["Target"]=nil;
		else
			T["Target"]=Target;
		end
		T["TargetSubgroup"]=subgroup;
		T["unit"]=VAL[10];
		--]]
			
			menu:AddLine("line",1);
			
			
			menu:AddLine("text", "|cffffff00特殊|r", "hasArrow", 1, "value", "Special target list_" .. TC,"notCheckable",1);
			
			menu:AddLine("line",1);
			
			if GetNumSubgroupMembers()>0 then
				menu:AddLine("text", "|cffffff00本队|r","disabled",nil, "hasArrow", 1, "value", "Team List_" .. TC,"notCheckable",1);
			else
				menu:AddLine("text", "本队","disabled",nil, "hasArrow", 1, "value", "Team List_" .. TC,"notCheckable",1);
			end
			
			menu:AddLine("line",1);
			
			if GetNumGroupMembers() >0 then
				menu:AddLine("text", "|cffffff00团/队|r","disabled",nil, "hasArrow", 1, "value", "Team Classification List_" .. TC,"notCheckable",1);
			else
				menu:AddLine("text", "团/队","disabled",1,"notCheckable",1);
			end
			
			
			
		end
		
		
		
		
	elseif level == level_n + 2 then -- 6级菜单内容	
	
		local _, _, valueA, valueB = string.find(value, "(.-)_(.+)")
		

		
			
		
			if valueA == "TargetListSelectCustomize" then
			
				local _, _, valueA1, valueB1 = string.find(valueB, "(.-)_(.+)")
				local _, _, valueA2, valueB2 = string.find(valueB1, "(.-)_(.+)")
				
				local value1 = tonumber(valueA1);
				local value2 = tonumber(valueA2);
				local value3 = tonumber(valueB2);
				local TBL ={value1,value2,value3}
				local i = 1;
				local Target = Spells[value1]["Targets"][value2]["Conditions"][value3]["Target"];
				
				
				
					for k,v in sortedpairs(RDB, SortNameAsc) do
						if v["subgroup"] == -2 then
							local name = v["name"];
							local VAL={};
							VAL[1]=TBL;
							VAL[2]=name;
							VAL[3]=v["subgroup"];
							VAL[10]=k;
							
							local checked;
							
							if Target then
								checked = Target == name;
							else
								checked = false;
							end
							
							local str = nil;
							menu:AddLine("text", "|cff104E8B" .. i .. ". |cffffffff" .. name,
							"checked",checked,"func", addon["MenuFuncTargetListSelect"],"arg1", self,"arg2", VAL,"tooltipText",str)
						i=i+1;
						end
					end
					
					
			elseif valueA == "Special target list" then	
				
				local _, _, valueA1, valueB1 = string.find(valueB, "(.-)_(.+)")
				local _, _, valueA2, valueB2 = string.find(valueB1, "(.-)_(.+)")
				
				local value1 = tonumber(valueA1);
				local value2 = tonumber(valueA2);
				local value3 = tonumber(valueB2);
				local TBL ={value1,value2,value3};
				
				local Condition = Spells[value1]["Targets"][value2]["Conditions"][value3];
				local Target = Condition["Target"];
				
				
				for i, data in sortedpairs(RDB, SortNameAsc) do
								
					if data["subgroup"] == -1 then
					
						local name = data["name"];
						local VAL={};
						VAL[1]=TBL;
						VAL[2]=name;
						VAL[3]=data["subgroup"];
						VAL[10]=data["unit"];
						
						local checked;
						
						if Target then
							checked = Target == name;
						else
							checked = false;
						end
						

						if "FireHasBeenSet" == data["unit"] then
						
							
							
							if not Condition["FireHasBeenSetValue"] then
								Condition["FireHasBeenSetValue"]=2;
							end
							
							menu:AddLine("text",data["name"] .. "|cffffff00(>=" .. Condition["FireHasBeenSetValue"] .. ")",
							"checked", checked,"func",addon["MenuFuncTargetListSelect"], "arg1", self, "arg2", VAL,
							"hasSlider", 1, "sliderValue", Condition["FireHasBeenSetValue"], "sliderMin", 0,
							"sliderMax", 5, "sliderStep", 1, "sliderFunc", "TargetListSelect_Value",
							"sliderArg1", self,"sliderArg2",Condition)
						
						else
						
							menu:AddLine("text",data["name"],"checked", checked,"func",addon["MenuFuncTargetListSelect"], "arg1", self, "arg2", VAL)
						
						end
						
						menu:AddLine("line",1);
						
					end
				end
				
			elseif valueA == "Team List" then
			
				local _, _, valueA1, valueB1 = string.find(valueB, "(.-)_(.+)")
				local _, _, valueA2, valueB2 = string.find(valueB1, "(.-)_(.+)")
				
				local value1 = tonumber(valueA1);
				local value2 = tonumber(valueA2);
				local value3 = tonumber(valueB2);
				local TBL ={value1,value2,value3};
				
				local Target = Spells[value1]["Targets"][value2]["Conditions"][value3]["Target"];
				
				-- 菜单表格标题
				menu:AddColumnHeader("角色名", "LEFT")
				menu:AddColumnHeader("种族", "CENTER")
				menu:AddColumnHeader("小队", "CENTER")
				--menu:AddColumnHeader("选中", "CENTER")
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
				
				for i, data in pairs(RDB) do
					local unit =data["unit"];
				
					if (data["subgroup"] == UnitDB["TeamNumber"]) or (data["subgroup"]>=0 and amGetUnitName(unit,true)==amGetUnitName("player",true)) then
					
						local name = data["name"];
						local VAL={};
						VAL[1]=TBL;
						VAL[2]=name;
						VAL[3]=data["subgroup"];
						
						local checked;
						
						
						
						if Target then
							checked = Target == name;
						else
							checked = false;
						end
						
						VAL[4]=checked;
						
						
						addon:Menu_TargetListSelect_AddLineList(menu,RDB,data,VAL);
					end
				end
				
			elseif valueA == "Team Classification List" then
				
				local _, _, valueA1, valueB1 = string.find(valueB, "(.-)_(.+)")
				local _, _, valueA2, valueB2 = string.find(valueB1, "(.-)_(.+)")
				
				local value1 = tonumber(valueA1);
				local value2 = tonumber(valueA2);
				local value3 = tonumber(valueB2);
				local TBL ={value1,value2,value3}
				
		
				for i=1 , 8 do
				
					local n =0; 
					if UnitDB["TeamCount"] and UnitDB["TeamCount"][i] then
						n = UnitDB["TeamCount"][i];
							
					end
					
					local Target = Spells[value1]["Targets"][value2]["Conditions"][value3]["Target"];
				
					
					
					local checked =0;
					
					for K, data in pairs(RDB) do
						if data["subgroup"] == i and Target == data["name"] then
							checked=1;
							break;
						end
					end
					if n>0 then
						local TC = value1 .. "_" .. value2 .. "_" .. value3 .. "_" .. i;
						menu:AddLine("text", "|cff104E8B" .. i .. " 小队"  .. addon:FormatText(checked , n ), "hasArrow", 1, "value", "Team_" .. TC,"notCheckable",1)
					end
					
				end
			
			end
	
		
		
	elseif level == level_n + 3 then -- 6级菜单内容

		local _, _, valueA, valueB = string.find(value, "(.-)_(.+)")
		
			
		if valueA == "Team"  then
		
			local _, _, valueA1, valueB1 = string.find(valueB, "(.-)_(.+)")
			local _, _, valueA2, valueB2 = string.find(valueB1, "(.-)_(.+)")
			local _, _, valueA3, valueB3 = string.find(valueB2, "(.-)_(.+)")
			local value1 = tonumber(valueA1);
			local value2 = tonumber(valueA2);
			local value3 = tonumber(valueA3);
			local value4 = tonumber(valueB3);
		
			local TBL ={value1,value2,value3,value4}
			local Target = Spells[value1]["Targets"][value2]["Conditions"][value3]["Target"];
				
		
			-- 菜单表格标题
			menu:AddColumnHeader("角色名", "LEFT")
			menu:AddColumnHeader("种族", "CENTER")
			menu:AddColumnHeader("小队", "CENTER")
			menu:AddColumnHeader("选中", "CENTER")
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
					
			for i, data in pairs(RDB) do
				
				local name = data["name"];
				local VAL={};
				VAL[1]=TBL;
				VAL[2]=name;
				VAL[3]=data["subgroup"];
				
				local checked;
				
				if Target then
					checked = Target == name;
				else
					checked = false;
				end
				
				VAL[4]=checked;
					
					
				if data["subgroup"] == value4 then
					addon:Menu_TargetListSelect_AddLineList(menu,RDB,data,VAL);
				end
			end
			
			
		end
		
	end
	
end


---------------------------------

function addon:Menu_TargetSelect_AddLineList(menu,RDB,data,VAL)
	
	
	local color,tc,levelColor,subgroup,checked,Class;
	local unit =data["unit"];
	
	local playerClass, englishClass = UnitClass(unit)
	color = RAID_CLASS_COLORS[englishClass]
		
	
	
		if data["subgroup"] ==0 then
			subgroup= "无";
		else
			subgroup= data["subgroup"];
		end
		
		

		-- 表格内容行
		menu:AddLine(
			-- 职业图标
					
			"text1", stGetClassicon(englishClass,13)..amGetUnitName(unit,true), "text1R", color.r, "text1G", color.g, "text1B", color.b,
			"text2", UnitRace(unit),
			"text3", subgroup,
			"checked",VAL[4],

			"func", addon["MenuFuncTargetSelect"], "arg1", self, "arg2", VAL
		)
							
							
end




function addon:Menu_TargetSelect_AddLineList_bak(menu,RDB,data,VAL)
	
	
	local color,tc,levelColor,subgroup,checked,Class;
	local unit =data["unit"];
	
	local playerClass, englishClass = UnitClass(unit)
	color = RAID_CLASS_COLORS[englishClass]
	tc = CLASS_BUTTONS[englishClass]
	
	
	
		if data["subgroup"] ==0 then
			subgroup= "";
		else
			subgroup= data["subgroup"];
		end
		
		if VAL[4] then
			checked="|cffffff00√|r";
		else
			checked="";
		end
		
		VAL[10]=data["unit"];


		-- 表格内容行
		menu:AddLine(
			-- 职业图标
			"icon", "Interface\\WorldStateFrame\\Icons-Classes",
			"tCoordLeft", tc[1],
			"tCoordRight", tc[2],
			"tCoordTop", tc[3],
			"tCoordBottom", tc[4],
			
			"text1", amGetUnitName(unit,true), "text1R", color.r, "text1G", color.g, "text1B", color.b,
			"text2", UnitRace(unit),
			"text3", subgroup,
			"text4", checked,

							
			
			"func", addon["MenuFuncTargetSelect"], "arg1", self, "arg2", VAL
		)
							
							
end



--local iiCls=getglobal(iCls);local c="IsSpell";
function addon:Menu_TargetSelect_checked(VAL)



	local i = VAL[1];
	local Target = VAL[2];
	local subgroup = VAL[3];
	
	local T = Spells[i[3]];
	
	--print(">>",T["TargetSubgroup"],T["Target"],T["unit"])
	
	if T["Target"]==Target then
		T["Target"]=nil;
	else
		T["Target"]=Target;
	end
	
	T["TargetSubgroup"]=subgroup;
	T["unit"]=VAL[10];
	
	--print(T["TargetSubgroup"],T["Target"],T["unit"])
	
	--DropDownMenu:Close(5)
	DropDownMenu:Refresh(2)
	
	
	
end



function addon:Menu_TargetSelect(level, value, menu, MenuEx,GlobalLevel)
	
	local level_n = addon["MenuLevelTargetSelect"];	
	if level == level_n + 1 then -- 5级菜单内容

		local V = addon:DecompositionValue(value);
		
		
		if V[1] == "TargetListTargetsConditionsChooseTarget" then
			
			
			
			
			
			--[[
			local data = Spells[tonumber(V[2])];
			local valueB = data["Target"];
			print(valueB,addon.CustomizeLevel)
			
			
			menu:AddLine("text", "目标范围","isTitle",1);
			menu:AddLine();
			local AMF = SuperTreatmentDBF["Unit"]["RaidList"][valueB]["AmminimumFast"];
			if not AMF["Distancevalue"] then
				AMF["Distancevalue"]=30;
			end
			local group = AMF["group"];
			
			if not group then
				group ="party";
			end
			local disabled =  group == "party" or group == "partypet" or 
			group == "raid" or group == "raidpet" or group == "arena" or 
			group == "partyraid" or group == "partyraidpet" or group == "FHenemies";
			
			if not disabled then
				text = "启用多任务处理";
			else
				text = "|cffffff00启用多任务处理";
			end
			
			local str = addon:FormatTooltipText("多任务处理");
			menu:AddLine("text", text, "checked",AMF["MultitaskingChecked"] ,"func",
			"CustomizeTargetListGetTargetAmminimumFastSetGroup_MultitaskingChecked","arg1", self,"arg2", AMF,
			"tooltipText",str,
			"tooltipTitle","多任务处理","disabled",not disabled);
			
			
			menu:AddLine();
			
			
			local text = "|cffffff00排除死亡、幽灵、不在线的";
			local str = addon:FormatTooltipText("排除死亡、幽灵、不在线的。");
			menu:AddLine("text", text, "checked",AMF["GhostChecked"] ,"func", "CustomizeTargetListGetTargetAmminimumFastSetGroup_Ghostchecked","arg1", self,"arg2", valueB,"tooltipText",str,"tooltipTitle","说明")
			
			menu:AddLine();
			local text ;
			
			
			if not disabled then
				text = "排除小队/目标";
			else
				text = "|cffffff00排除小队/目标";
			end
			
			
			local str = addon:FormatTooltipText("排除小队/目标");
			menu:AddLine("text", text, "checked",AMF["ExcludedTargetChecked"] ,"func",
			"CustomizeTargetListGetTargetAmminimumFastSetGroup_ExcludedTargetChecked","arg1", self,"arg2", valueB,
			"tooltipText",str,"hasArrow", 1, "value", "CustomizeTargetListGetTargetAmminimumFastSetGroupExcludedTarget_" .. valueB,
			"icon",ExpandArrow,"tooltipTitle","说明","disabled",not disabled);
			
			menu:AddLine();
			
			
			local text = "|cffffffff距离由方案里的技能来决定";
			local str = addon:FormatTooltipText("注意该选项是通过判断技能是否可以对目标施放来判断的。");
			menu:AddLine("text", text,"isRadio", 1, "checked",AMF["SpellDistanceChecked"] ,"func", "CustomizeTargetListGetTargetAmminimumFastSetGroup_SpellDistancechecked","arg1", self,"arg2", valueB,"tooltipText",str,"tooltipTitle","说明")
			
			
			local text = "|cffffffff距离(|cffff0000<=" .. AMF["Distancevalue"]  .."|cffffffff)的目标";
			local str = addon:FormatTooltipText("过滤目标和你之间的距离");
			menu:AddLine("text", text,"isRadio", 1, "checked",AMF["DistanceChecked"] ,"func", "CustomizeTargetListGetTargetAmminimumFastSetGroup_Distancechecked","arg1", self,"arg2", valueB,"hasSlider", 1,"sliderDecimals",0, "sliderValue", AMF["Distancevalue"], "sliderMin", 5, "sliderMax", 50, "sliderStep", 1, "sliderFunc", "CustomizeTargetListGetTargetAmminimumFastSetGroup_Distancevalue", "sliderArg1", self,"sliderArg2", valueB,"tooltipText",str,"tooltipTitle","说明")
			
			menu:AddLine("text","","disabled",1);
			
			
			
			
			
			local Colors = "|cffffffff";
			local func = "CustomizeTargetListGetTargetAmminimumFastSetGroup_checked";
			
			menu:AddLine("text", Colors .. "所有MT","isRadio", 1,"checked",group=="maintank","func", func,"arg1", self,"arg2", {valueB,"maintank"})
			menu:AddLine("text", Colors .. "小队","isRadio", 1,"checked",group=="party","func", func,"arg1", self,"arg2", {valueB,"party"})
			menu:AddLine("text", Colors .."小队宠物","isRadio", 1,"checked",group=="partypet","func", func,"arg1", self,"arg2", {valueB,"partypet"})
			menu:AddLine("text", Colors .."团队","isRadio", 1,"checked",group=="raid","func", func,"arg1", self,"arg2", {valueB,"raid"})
			menu:AddLine("text", Colors .."团队宠物","isRadio", 1,"checked",group=="raidpet","func", func,"arg1", self,"arg2", {valueB,"raidpet"})
			
			menu:AddLine("text", Colors .. "小队/团队","isRadio", 1,"checked",group=="partyraid","func", func,"arg1", self,"arg2", {valueB,"partyraid"})
			menu:AddLine("text", Colors .. "小队/团队宠物","isRadio", 1,"checked",group=="partyraidpet","func", func,"arg1", self,"arg2", {valueB,"partyraidpet"})
			
			
			menu:AddLine("text", Colors .."竞技场敌人小队","isRadio", 1,"checked",group=="arena","func", func,"arg1", self,"arg2", {valueB,"arena"})

			menu:AddLine("text", Colors .."(FH)敌对列表","isRadio", 1,"checked",group=="FHenemies","func", func,"arg1", self,"arg2", {valueB,"FHenemies"})
			
			if group=="player" or group=="target" or group=="targettarget" or group=="focus" or 
			group=="focustarget" or group=="mouseover" or group=="mouseovertarget" or group=="FireHasBeenSet" 
			or group == "SelectedTarget" then
			
				menu:AddLine();
				menu:AddLine("text", Colors .."自己","isRadio", 1,"checked",group=="player","func", func,"arg1", self,"arg2", {valueB,"player"})
				menu:AddLine("text", Colors .."当前目标","isRadio", 1,"checked",group=="target","func", func,"arg1", self,"arg2", {valueB,"target"})
				menu:AddLine("text", Colors .."当前目标的目标","isRadio", 1,"checked",group=="targettarget","func", func,"arg1", self,"arg2", {valueB,"targettarget"})
				menu:AddLine("text", Colors .."焦点目标","isRadio", 1,"checked",group=="focus","func", func,"arg1", self,"arg2", {valueB,"focus"})
				menu:AddLine("text", Colors .."焦点目标的目标","isRadio", 1,"checked",group=="focustarget","func", func,"arg1", self,"arg2", {valueB,"focustarget"})
				menu:AddLine("text", Colors .."鼠标目标","isRadio", 1,"checked",group=="mouseover","func", func,"arg1", self,"arg2", {valueB,"mouseover"})
				menu:AddLine("text", Colors .."鼠标目标的目标","isRadio", 1,"checked",group=="mouseovertarget","func", func,"arg1", self,"arg2", {valueB,"mouseovertarget"})
			
			
				menu:AddLine();
				
				local FireHasBeenSetValue = RDB[valueB]["AmminimumFast"]["FireHasBeenSetValue"];
				if not FireHasBeenSetValue then
					FireHasBeenSetValue =0;
				end
				local str = addon:FormatTooltipText("当你的队友被 >=" .. FireHasBeenSetValue .." 个竞技场敌人设为当前目标时，可以认为被集火了。");
				menu:AddLine("text",Colors .."竞技场被集火的队员|cffff0000(>=" .. FireHasBeenSetValue .. ")",
				"isRadio", 1,"checked", group=="FireHasBeenSet","func","CustomizeTargetListGetTargetAmminimumFastSetGroup_checked",
				"arg1", self, "arg2", {valueB,"FireHasBeenSet"},"hasSlider", 1, "sliderValue", FireHasBeenSetValue,
				"sliderMin", 0, "sliderMax", 5, "sliderStep", 1, "sliderFunc",
				"CustomizeTargetListGetTargetAmminimumFastMinimumFireHasBeenSetValue",
				"sliderArg1", self,"sliderArg2",valueB,"tooltipText",str,"tooltipTitle","被集火")
				

				
				local text;
				
				
				if not AMF["Group_SelectedTarget"] then
					AMF["Group_SelectedTarget"]={};
				end
				
				local T = AMF["Group_SelectedTarget"];
				
				if not T["name"] then
					text = "";
					menu:AddLine("text", "|cffffff00团/队:|r" .. text,"isRadio", 1, "checked",group == "SelectedTarget" ,"func",
					func,"arg1", self,"arg2", {valueB,"SelectedTarget"},
					"hasArrow", 1, "value", "CustomizeTargetListGetTargetAmminimumFastSetGroupSelectedTarget_" .. valueB);
				else
					
					local color = T["color"];
					
					menu:AddLine("text", T["name"],"isRadio", 1, "checked",group == "SelectedTarget" ,"func",
					func,"arg1", self,"arg2", {valueB,"SelectedTarget"},
					"hasArrow", 1, "value", "CustomizeTargetListGetTargetAmminimumFastSetGroupSelectedTarget_" .. valueB,
					"textR", color.r, "textG", color.g, "textB", color.b
					);
				
				end
				
			else
				menu:AddLine();
				menu:AddLine("text", "隐藏了旧版本的一些目标","isTitle",1);
			end
			
			--]]
		
		elseif V[1] == "TargetListTargetsConditions" then
		
		
			local TC = V[2] .. "_" .. V[3] ;
			--[[
			local str = addon:FormatTooltipText("建立自定义目标请到主菜单【方案系统设定】下的【创建自定义目标】里建立，建立后就会出现在本菜单里供您选择。");
			
			menu:AddLine("text","自定义目标","hasArrow", 1, "value", "TargetListSelectCustomize_" .. TC,"icon",ExpandArrow,"tooltipText",str,"tooltipTitle","自定义目标");
			
			--]]
			
			local SpellTbl =SuperTreatmentDBF["Spells"]["List"][tonumber(V[2])]["spell"];
			local str = addon:FormatTooltipText("建立自定义目标请到主菜单【方案系统设定】下的【创建自定义目标】里建立，建立后就会出现在本菜单里供您选择。");
			menu:AddLine("text","自定义目标","hasArrow", 1,
			"tooltipText",str,"tooltipTitle","自定义目标",
			"OpenMenu",SuperTreatment["Menu"]["CustomizeTarget"],
			"OpenMenuValue",{"Select",SpellTbl,tonumber(V[3]),
			function(a,tbl) 
				
				local T = SpellTbl[tonumber(V[3])];
				local v = tbl[1];
				local k = tbl[2];
				
				if T["Target"]== k then
					--T["Target"]= nil;
					
					--T["unit"]="";
				else
					T["Target"]= k;
					T["TargetSubgroup"]=v.subgroup;
					T["unit"]=k;
				end
				
				
				DropDownMenu:GlobaRefresh(GlobalLevel-2);
			end;
				
			},
			"notCheckable",1
			
			);
			
						
			
			
			menu:AddLine("line",1);
			
			
			
			menu:AddLine("text", "|cffffff00特殊|r", "hasArrow", 1, "value", "Special target list_" .. TC,"notCheckable",1)
			
			menu:AddLine("line",1);
			
			if GetNumSubgroupMembers()>0 then
				menu:AddLine("text", "|cffffff00本队|r","disabled",nil, "hasArrow", 1, "value", "Team List_" .. TC,"notCheckable",1)
			else
				menu:AddLine("text", "本队","disabled",nil, "hasArrow", 1, "value", "Team List_" .. TC,"notCheckable",1)
			end
			
			menu:AddLine("line",1);
			
			if GetNumGroupMembers() >=0 then
				menu:AddLine("text", "|cffffff00团/队|r","disabled",nil, "hasArrow", 1, "value", "Team Classification List_" .. TC,"notCheckable",1)
			else
				menu:AddLine("text", "团/队","disabled",nil, "hasArrow", nil, "value", "Team Classification List_" .. TC,"notCheckable",1)
			end
			
		end
		
		
		
		
	elseif level == level_n + 2 then -- 6级菜单内容	
		
		local V = addon:DecompositionValue(value);
				
			if V[1] == "TargetListSelectCustomize" then
			
			
				V[2] = tonumber(V[2]);
				V[3] = tonumber(V[3]);
				local i = 1;
				local Target = Spells[V[3]]["Target"];
				local str = "|cff00ff00请确认新名称不在列表中。"
				
				menu:AddLine("text", "新建目标","hasEditBox", 1, "editBoxText", self.text, "editBoxFunc", "AddCustomizeTarget", "editBoxArg1", self,"tooltipText",str,
				"icon",ExpandArrow,"tooltipTitle","新建"
				);
				menu:AddLine()
			
				
				
				
				
				
					for k,v in sortedpairs(RDB, SortNameAsc) do
						if v["subgroup"] == -2 then
							local name = v["name"] or k;
							local VAL={};
							VAL[1]=V;
							VAL[2]=name;
							VAL[3]=v["subgroup"];
							VAL[10]=k;
							
							local checked;
							
							if Target then
								checked = Target == name;
							else
								checked = false;
							end
							
							local str = nil;
							menu:AddLine("text", "|cff104E8B" .. i .. ". |cffffffff" .. name,
							"checked",checked,"func", addon["MenuFuncTargetSelect"],"arg1", self,"arg2", VAL,"tooltipText",str,
							"hasArrow", 1, "value", "CustomizeTargetList_" .. name
							);
							
						i=i+1;
						end
					end
					
					
			elseif V[1] == "Special target list" then	
				
				V[2] = tonumber(V[2]);
				V[3] = tonumber(V[3]);
				
				local Condition = Spells[V[3]];
				local Target = Condition["Target"];
				
				
				for i, data in sortedpairs(RDB, SortNameAsc) do
								
					if data["subgroup"] == -1 then
					
						local name = data["name"];
						local VAL={};
						VAL[1]=V;
						VAL[2]=name;
						VAL[3]=data["subgroup"];
						VAL[10]=data["unit"];
						
						local checked;
						
						if Target then
							checked = Target == name;
						else
							checked = false;
						end
						

						if "FireHasBeenSet" == data["unit"] then
						
							
							
							if not Condition["FireHasBeenSetValue"] then
								Condition["FireHasBeenSetValue"]=2;
							end
							
							menu:AddLine("text",data["name"] .. "|cffffff00(>=" .. Condition["FireHasBeenSetValue"] .. ")",
							"checked", checked,"func",addon["MenuFuncTargetSelect"], "arg1", self, "arg2", VAL,
							"hasSlider", 1, "sliderValue", Condition["FireHasBeenSetValue"], "sliderMin", 0,
							"sliderMax", 5, "sliderStep", 1, "sliderFunc", "TargetListSelect_Value",
							"sliderArg1", self,"sliderArg2",Condition)
						
						else
						
							menu:AddLine("text",data["name"],"checked", checked,"func",addon["MenuFuncTargetSelect"], "arg1", self, "arg2", VAL)
						
						end
						
						menu:AddLine("line",1);
					end
				end
				
			elseif V[1] == "Team List" then
			
				
				V[2] = tonumber(V[2]);
				V[3] = tonumber(V[3]);
				local Condition = Spells[V[3]];
				local Target = Condition["Target"];
				
				
				-- 菜单表格标题
				menu:AddColumnHeader("角色名", "LEFT")
				menu:AddColumnHeader("种族", "CENTER")
				menu:AddColumnHeader("小队", "CENTER")
				--menu:AddColumnHeader("选中", "CENTER")
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
				
			
				
				for i, data in pairs(RDB) do
					local unit =data["unit"];
				
					if (data["subgroup"] == UnitDB["TeamNumber"]) or (data["subgroup"]>=0 and amGetUnitName(unit,true)==amGetUnitName("player",true)) then
					
						local name = data["name"];
						local VAL={};
						VAL[1]=V;
						VAL[2]=name;
						VAL[3]=data["subgroup"];
						
						local checked;
						
						
						
						if Target then
							checked = Target == name;
						else
							checked = false;
						end
						
						VAL[4]=checked;
						
						
						addon:Menu_TargetSelect_AddLineList(menu,RDB,data,VAL);
					end
				end
				
			elseif V[1] == "Team Classification List" then
				
				
				
				V[2] = tonumber(V[2]);
				V[3] = tonumber(V[3]);
				local Condition = Spells[V[3]];
				local Target = Condition["Target"];
		
				for i=1 , 8 do
				
					local n =0; 
					if UnitDB["TeamCount"] and UnitDB["TeamCount"][i] then
						n = UnitDB["TeamCount"][i];
							
					end
					
								
					
					
					local checked =0;
					
					for K, data in pairs(RDB) do
						if data["subgroup"] == i and Target == data["name"] then
							checked=1;
							break;
						end
					end
					
					
					
					if n>0 then
					
						local TC = V[2]  .. "_" .. V[3]  .. "_" .. i;
						menu:AddLine("text", "|cffffff00" .. i .. " 小队"  .. addon:FormatText(checked , n ), "hasArrow", 1, "value", "Team_" .. TC,"icon",ExpandArrow)
				
					end
					
				end
			
			end
	
		
		
	elseif level == level_n + 3 then -- 6级菜单内容

		
		local V = addon:DecompositionValue(value);
			
		if V[1] == "Team"  then
		
					
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			V[4] = tonumber(V[4]);
			
			local Condition = Spells[V[3]];
			local Target = Condition["Target"];
			

			
			-- 菜单表格标题
			menu:AddColumnHeader("角色名", "LEFT")
			menu:AddColumnHeader("种族", "CENTER")
			menu:AddColumnHeader("小队", "CENTER")
			--menu:AddColumnHeader("选中", "CENTER")
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
					
			for i, data in pairs(RDB) do
				
				local name = data["name"];
				local VAL={};
				VAL[1]=V;
				VAL[2]=name;
				VAL[3]=data["subgroup"];
				
				local checked;
				
				if Target then
					checked = Target == name;
				else
					checked = false;
				end
				
				VAL[4]=checked;
					
					
				if data["subgroup"] == V[4] then
					addon:Menu_TargetSelect_AddLineList(menu,RDB,data,VAL);
				end
			end
			
			
		end
		
	end
	
end

function addon:TargetListPropertiesSet_checked(v)

	v[1]["PropertiesSetChecked"]=v[2];
	DropDownMenu:Refresh(4)	;
end


function addon:TargetListPropertiesSet_Continue_checked(v)

	v["PropertiesSet_Continue_Checked"]=not v["PropertiesSet_Continue_Checked"];
	DropDownMenu:Refresh(4)	;
end

function addon:TargetList_Rank_checked(v)

	v["RankChecked"]=not v["RankChecked"];
	DropDownMenu:Refresh(3)	;
end

function addon:TargetList_PowerCost_checked(v)

	v["PowerCostChecked"]=not v["PowerCostChecked"];
	DropDownMenu:Refresh(3)	;
end

function addon:Menu_SysPrograms(level, value, menu, MenuEx,GlobalLevel)

	if level == 2 then -- 2级菜单内容
		
		if  value == "SysSet" then
			
			menu:AddLine("text", "|cff00ffff菜单模式" , "isRadio",1,"checked",
			not DropDownMenu:GetMenusWinDows(),
			"func", "SetMenusWinDows","arg1", self,"arg2",false
			);
			
			menu:AddLine("text", "|cff00ffff窗口模式" , "isRadio",1,"checked",
			DropDownMenu:GetMenusWinDows(),
			"func", "SetMenusWinDows","arg1", self,"arg2",true
			);
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			menu:AddLine("text", "|cff00ffff内存管理" , "hasArrow", 1, "value", "AddOnMemory")
			
			
			menu:AddLine("text", "|cff00ffff多任务管理" , "hasArrow", 1, "value", "MultitaskingSet")
			
			---menu:AddLine("text", "|cff00ffff显示为简单模式" , 
			--"func", "SimpleModel_checked","arg1", self
			
			--);
			
			menu:AddLine("text", "|cff00ffff显示/隐藏魔兽助手图标" , 
			"checked",WowAmMinimapButton:IsShown(),
			"func", "show_GC_checked","arg1", self,"tooltipText","显示/隐藏魔兽助手在小地图旁边的图标\n\n|cffff0000注意:当前设定不会保存，所以当你重启插件的时候还是会显示图标的。","tooltipTitle","信息");
			
			
			menu:AddLine("text", "|cff00ffff显示/隐藏魔兽助手提示信息" , 
			"checked",not SuperTreatmentAllDBF.show_Hide_StInf,
			"func", "show_Hide_StInf_checked","arg1", self,"tooltipText","显示/隐藏魔兽助手提示信息。","tooltipTitle","信息");
						
			menu:AddLine("text", "|cff00ffff函数说明书", "hasArrow", 1, "value", "SuperTreatmentApiListB")
			
			menu:AddLine("text", "|cff00ffff技能条信息", "hasArrow", 1, "value", "ActionBarInf")
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			local str = addon:FormatTooltipText("升级前检查是否有错误，出现错误会禁止升级。");
			menu:AddLine("text", "|cff00ffff升级方案(安全)", 
			"func", "SuperTreatmentDBF_up","arg1", self	,"arg2",0,
			"tooltipText",str,"tooltipTitle","升级方案"			
			);
			
			local str = addon:FormatTooltipText("尝试修复错误非100%成功，无法修复将会丢弃该BUFF升级。");
			menu:AddLine("text", "|cff00ffff升级方案(不安全)", 
			"func", "SuperTreatmentDBF_up","arg1", self	,"arg2",1,
			"tooltipText",str,"tooltipTitle","升级方案"			
			);
			
			--FUC CHANGED HERE!
			--menu:AddLine("text", "|cff00ffff测试" , "hasArrow", 1, "value", "AddOnTest")
			
			local str = addon:FormatTooltipText("会将上帝指令清理到原始状态，并清除所有数据。");
			menu:AddLine("text", "|cff00ffff清除所有数据", 
			"func", "SuperTreatmentDBF_ClearAllData","arg1", self	,"arg2",0,
			"hasConfirm", 1, "confirmText", "是否确认清除所有数据?",
			"tooltipText",str,"tooltipTitle","清除数据"			
			);
			
			
			menu:AddLine("text", "|cff00ffff声音设定" , "hasArrow", 1, "value", "SetSounds",
			"checked",DropDownMenu:GetSounds("OpenSounds"),
			"func", "SetSounds","arg1", self,"arg2",
			{"OpenSounds",not DropDownMenu:GetSounds("OpenSounds"),level}
			);
			
			if not SuperTreatmentAllDBF.SetThreadSpeed then
				SuperTreatmentAllDBF.SetThreadSpeed =5;
			end
			
			menu:AddLine("text", "|cff00ffff客户端版速度设定(|cffff0000" .. SuperTreatmentAllDBF.SetThreadSpeed  .."|cff00ffff) " .. (amRunThreadSpeedTime and amRunThreadSpeedTime() or "--") .. "ms" , 
			
			"tooltipText","数值越大表示线程速度加快，函数返回值也会相应加快游戏可能会越卡。所以电脑允许的话请加到最大值。\n默认值:5","tooltipTitle","信息",
			"hasSlider", 1, "sliderValue",SuperTreatmentAllDBF.SetThreadSpeed , 
			"sliderMin", 0, "sliderMax", 100, "sliderStep", 1, "sliderFunc",
			"SetThreadSpeed",
			"sliderArg1", self,
			"func","showThreadSpeedTime","arg1", self
			)	
			
			if not SuperTreatmentAllDBF.UnlockerSpeed then
				SuperTreatmentAllDBF.UnlockerSpeed = 100;
			end
			
			menu:AddLine("text", "|cff00ffff解锁版速度设定(|cffff0000" .. SuperTreatmentAllDBF.UnlockerSpeed  .."|cff00ffff) " .. tostring(400-4*(SuperTreatmentAllDBF.UnlockerSpeed or 100)) .. "ms" , 
			
			"tooltipText","数值越大表示执行速度越快，游戏可能会越卡。所以电脑允许的话请加到最大值。\n默认值:100(无间隔) 最小值:0(每次判断0.4秒间隔)","tooltipTitle","信息",
			"hasSlider", 1, "sliderValue",SuperTreatmentAllDBF.UnlockerSpeed , 
			"sliderMin", 0, "sliderMax", 100, "sliderStep", 1, "sliderFunc",
			"UnlockerSpeed",
			"sliderArg1", self,
			"func","showThreadSpeedTime","arg1", self
			)	
			
		elseif  value == "SysPrograms" then
		
			local tbl = SuperTreatmentDBF;
			
			tbl["checked"]=false; -- 清空当前导出选择
			
			menu:AddLine("text", "|cffffff00当前方案相关" , "hasArrow", 1, "value","SysProgramsDefault","notCheckable",1);
			
			menu:AddLine("line",1);
			
			menu:AddLine("text", "|cffffff00导入方案","hasArrow", 1, "value", "ImportProgram","notCheckable",1);
			
			local str = "|cff00ff00请确认新名称不在列表中。"
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
			
			menu:AddLine("text", "|TINTERFACE\\ICONS\\Ability_Hunter_OneWithNature:13|t |cff00ffff新建方案","hasEditBox", 1, "editBoxText", self.text, "editBoxFunc", "Newscheme", "editBoxArg1", self,"tooltipText",str,
			"tooltipTitle","新建方案","notCheckable",1);
			
			menu:AddLine("line",1,"LineHeight",8);
			
				
			menu:AddLine("text","方案列表:" ,"isTitle",1,"notCheckable",1);
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
			
			for i,v in pairs(SuperTreatmentAllDBF["Programs"]) do
				
				if v["Mark"] and SuperTreatmentDBF["Mark"]==v["Mark"] then
					
					menu:AddLine("text", i .. ". ".. v["name"],"disabled",1,"notCheckable",1)
									
				else
					local str = addon:FormatTooltipText(v["Remark"]);
					str = str .. "\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键";
					menu:AddLine("text", "|cff104E8B" .. i .. ". |r".. v["name"] , "hasArrow", 1, "value", "SysProgramsList_" .. i,
					"func", "SysProgramsDefault_Del_checked","arg1", self,"arg2", {SuperTreatmentAllDBF["Programs"],i},
					"tooltipText",str,"tooltipTitle",v["name"],"notCheckable",1
					);
				end
				
				v["checked"]=false;
				
				menu:AddLine("line",1);
			end
		
		end
	
	elseif level == 3 then -- 3级菜单内容
	
		local V = addon:DecompositionValue(value);
		
		if value == "SetSounds" then
			
			
			
			menu:AddLine("text", "|cff00ffff显示窗口","checked",
			DropDownMenu:GetSounds("isopen"),"func", "SetSounds","arg1", self,"arg2",
			{"isopen",not DropDownMenu:GetSounds("isopen"),level},
			"hasArrow", 1, "value","SHOW_SetSoundsList"			
			);
			
			menu:AddLine("text", "|cff00ffff关闭窗口","checked",
			DropDownMenu:GetSounds("isclose"),"func", "SetSounds","arg1", self,"arg2",
			{"isclose",not DropDownMenu:GetSounds("isclose"),level},
			"hasArrow", 1, "value","CLOSE_SetSoundsList"			
			);
			
			menu:AddLine("text", "|cff00ffff选择","checked",
			DropDownMenu:GetSounds("isclicked"),"func", "SetSounds","arg1", self,"arg2",
			{"isclicked",not DropDownMenu:GetSounds("isclicked"),level},
			"hasArrow", 1, "value","CHECKED_SetSoundsList"			
			);
			
			menu:AddLine("text", "|cff00ffff设为默认","func", "SetSoundsDefault","arg1", self
			);
		
		elseif value == "AddOnTest" then
			
			menu:AddLine("text", "|cff00ffff判断范围内队友数量的可用地图" , "hasArrow", 1, "value", "AddOnTestRangeCheck")
			
		elseif value == "MultitaskingSet" then
		
			
			local str = addon:FormatTooltipText("已启动多任务方式");
			menu:AddLine("text", "已启动多任务方式","isRadio", 1, "checked",SuperTreatmentInf["Multitasking"]["MultitaskingStart"] ,
			"tooltipText",str,"tooltipTitle","信息")
			local str = addon:FormatTooltipText("关闭多任务方式");
			menu:AddLine("text", "关闭多任务方式","isRadio", 1, "checked",not SuperTreatmentInf["Multitasking"]["MultitaskingStart"] ,
			"func", "MultitaskingStartSet",
			"arg1", self,
			"tooltipText",str,"tooltipTitle","信息")
			
		
		elseif value == "AddOnMemory" then
			
			local string = "";
			local down, up, lagHome, lagWorld = GetNetStats();
			
			
			local V=Decompositioninf(MAINMENUBAR_LATENCY_LABEL,strchar(10))
			
			menu:AddLine("text",V[1] ,"isTitle",1);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			menu:AddLine("text", format(V[2],lagHome)  ,"isTitle",1);
			menu:AddLine("text", format(V[2],lagWorld)  ,"isTitle",1);
			
			menu:AddLine("line",1,"LineHeight",8);
			string = format(MAINMENUBAR_FPS_LABEL, GetFramerate());
			menu:AddLine("text",string ,"isTitle",1);
			
			menu:AddLine("line",1,"LineHeight",8);
			
			local numaddons = GetNumAddOns();
			local string = "";
			local i=0; j=0; k=0;
			
			for i=1, numaddons, 1 do
				if not topAddOns[i] then
					topAddOns[i] = { value = 0, name = "" };
				end
				topAddOns[i].value = 0;
			end
			
			UpdateAddOnMemoryUsage();
			local totalMem = 0;
	
			for i=1, GetNumAddOns(), 1 do
				local mem = GetAddOnMemoryUsage(i);
				totalMem = totalMem + mem;
				for j=1, numaddons, 1 do
					if(mem > topAddOns[j].value) then
						for k=numaddons, 1, -1 do
							if(k == j) then
								topAddOns[k].value = mem;
								topAddOns[k].name = GetAddOnInfo(i);
								break;
							elseif(k ~= 1) then
								topAddOns[k].value = topAddOns[k-1].value;
								topAddOns[k].name = topAddOns[k-1].name;
							end
						end
						break;
					end
				end
			end
			if ( totalMem > 0 ) then
				if ( totalMem > 1000 ) then
					totalMem = totalMem / 1000;
					string = format("插件内存：%.2f MB", totalMem);
				else
					string = format("插件内存：%.1f KB", totalMem);
				end
			end
			menu:AddLine("text",string ,"isTitle",1);
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			
			local str = addon:FormatTooltipText("显示内存处理信息,可能会刷屏。");
			
			menu:AddLine("text", "|cff00ffff显示内存处理信息",
			"checked",SuperTreatmentDBF["AddOnMemory"]["inf"],
			"func", "AddOnMemoryInfChecked","arg1", self,
			"tooltipTitle","信息","tooltipText",str
			);
			
			local str = addon:FormatTooltipText("脱离战斗时自动清理内存");
			
			menu:AddLine("text", "|cff00ffff脱离战斗时自动清理内存",
			"checked",SuperTreatmentDBF["AddOnMemory"]["Leftfighting"],
			"func", "AddOnMemorySetLeftfightingChecked","arg1", self,
			"tooltipTitle","信息","tooltipText",str
			);
			
			local str = addon:FormatTooltipText("清理内存时可能会卡，所以设定值小那么就会频繁清理内存");
			string = "|cff00ffff内存大于(|cffff0000" .. SuperTreatmentDBF["AddOnMemory"]["max"] .. "MB|cff00ffff)时清理";
			
			menu:AddLine("text", string,
			"checked",SuperTreatmentDBF["AddOnMemory"]["on"],
			"func", "AddOnMemorySetMaxChecked","arg1", self,
			"hasSlider", 1, "sliderValue",SuperTreatmentDBF["AddOnMemory"]["max"], "sliderMin", 1, "sliderMax", 256, "sliderStep", 1, "sliderFunc",
			"AddOnMemorySetMax" , "sliderArg1", self,"sliderArg2",SuperTreatmentDBF["AddOnMemory"],
			"tooltipTitle","信息","tooltipText",str
			);
			
			menu:AddLine("text", "|cff00ffff立刻清理内存",
			"func", "KillAddOnMemoryChecked","arg1", self)
			
			
			
			
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			
			
			
			for i=1, numaddons, 1 do
				if ( topAddOns[i].value == 0 ) then
					break;
				end
				
				if amAddOnsName[strlower(topAddOns[i].name)] then
				
					local size = topAddOns[i].value;
					if ( size > 1000 ) then
						size = size / 1000;
						string = format("%.2f MB", size);
					else
						string = format("%.1f KB", size);
					end
					
					menu:AddLine("text","|cff00ff00" .. topAddOns[i].name .. " |cffffffff" .. string ,"isTitle",1);
				
				end
				
			end
			
		elseif V[1] == "ImportProgram" then
			
			
			
			
			
			local help = addon:FormatTooltipText("1、打开魔兽助手客户端，在方案导入栏里输入方案代码后按【导入】。\n\n2、重启插件(/amrl)宏命令。\n\n3、在上面的导入菜单里会出现你刚才客户端导入的方案，那么点击它把它导入本插件。这样就完成了！");			
			menu:AddLine("text", "|cff00ffff导入复杂的|cffff0000上帝指令|cff00ffff方案" , "hasArrow", 1, "value", "FileImportScheme","icon",ExpandArrow,"tooltipText",help,"tooltipTitle","从文件导入上帝指令方案","notCheckable",1)

			menu:AddLine("line",1);
			
			local str = addon:FormatTooltipText("按 Ctrl + V 键 粘贴方案字符串到输入框里，然后按回车(Enter)键。|r\n提示:您可以用 Ctrl + C 键 复制。\n如:保存在记事本这些方案字符串。\n|cffff0000注意:点击后可能会卡一下，时间视方案大小来定，如果太长会卡到游戏断开。所以你最好用上面那个|r【从文件导入】。|r\n同名不会覆盖。");
				menu:AddLine("text", "|cff00ffff导入简单的|cffff0000上帝指令|cff00ffff方案","hasEditBox", 1,
				"editBoxText", "","editBoxFunc", "AddImportProgramText",
				"editBoxArg1", self,"editBoxArg2", ImportProgramText,
				"tooltipText",str,"tooltipTitle","输入方案文本","notCheckable",1);
				
			menu:AddLine("line",1);	
			
			local help = addon:FormatTooltipText("支持脚本助手及其它类似插件\n\n|cffff0000注意:\n|r要安装及启用相关的被导入插件才可以进行导入。");			
			--menu:AddLine("text", "|cff00ffff从|cffff0000其它|cff00ffff插件导入" , "hasArrow", 1, "value", "AddOnsImportScheme","tooltipText",help,"tooltipTitle","从其它插件导入","notCheckable",1)

			--menu:AddLine("line",1);
			
						
			local help = addon:FormatTooltipText("导入职业天赋预设方案\n\n|cffff0000注意:\n|r这些方案只是入门级别。用来划水偷懒可能不错，但是更高端的应用可能难以胜任．\n它们的真正用意是作为入门教学，读懂后你就可以做出更强的方案。");			
			menu:AddLine("text", "|cff00ffff导入内置方案" , "hasArrow", 1, "value", "AddOnsImportPresetScripts","tooltipText",help,"tooltipTitle","导入内置方案","notCheckable",1)

			menu:AddLine("line",1);
			
			local str = addon:FormatTooltipText("支持脚本助手方案的导入成为上帝指令的方案。\n\n|r在输入框粘贴方案代码后可能会卡，视代码大小而定。\n\n然后记得按确认键(Enter)。\n\n新的方案名称以当前时间结尾");
			--menu:AddLine("text", "|cff00ffff导入|cffff0000脚本助手|cff00ffff方案","hasEditBox", 1, "editBoxText", self.text, "editBoxFunc", "AddSchemeAssist", "editBoxArg1", self,"tooltipText",str,"icon",ExpandArrow,"tooltipTitle","导入","notCheckable",1)
			
			--menu:AddLine("line",1);
			
			
			local str = addon:FormatTooltipText("重启插件！\n\n|r/amrl");
			menu:AddLine("text", "|cff00ffff重启插件",
			"func","stReloadUI","arg1", self,
			"tooltipText",str,"tooltipTitle","重启插件","notCheckable",1);
			
			
			
			--menu:AddLine("text","帮助" ,"isTitle",1,
			--"tooltipText",help,"tooltipTitle","帮助");
			--ReloadUI() 
			--[[
			menu:AddLine("text","","isTitle",1)
			menu:AddLine();
			menu:AddLine("text","分段导入方案:","isTitle",1);
			menu:AddLine();
			menu:AddLine("text","当前(" .. #ImportProgramText .. ")方案被导入" ,"isTitle",1);
			menu:AddLine();
			
			local str = addon:FormatTooltipText("清空未导入的方案片段！");
			menu:AddLine("text", "|cffff0000清空未完成方案","checked",checked,
			"func", "DelImportProgramText","arg1", self,
			"tooltipText",str,"tooltipTitle","清空未完成方案");

			menu:AddLine();
			
			local str = addon:FormatTooltipText("如果导入成功聊天栏会显示成功信息，反之失败也提示！");
			menu:AddLine("text", "|cff00ffff完成方案导入","checked",checked,
			"func", "SysPrograms_List_Import","arg1", self,
			"tooltipText",str,"tooltipTitle","完成导入");
			
			menu:AddLine();
			
			
			local str = addon:FormatTooltipText("按 Ctrl + V 键 粘贴方案字符串到输入框里，然后按回车(Enter)键。|r\n提示:您可以用 Ctrl + C 键 复制。\n如:保存在记事本这些方案字符串。\n|cffff0000注意:点击后可能会卡一下，时间视方案大小来定，如果太长会卡到游戏断开。所以你可以分开多段导入。|r\n同名不会覆盖。");
				menu:AddLine("text", "输入方案文本","checked",checked,"hasEditBox", 1,
				"editBoxText", "","editBoxFunc", "AddImportProgramText",
				"editBoxArg1", self,"editBoxArg2", ImportProgramText,
				"tooltipText",str,"tooltipTitle","输入方案文本", "icon",ExpandArrow);
			

			menu:AddLine();	
			menu:AddLine("text","帮助" ,"isTitle",1,
			"tooltipText",str,"tooltipTitle","帮助");
			--]]
				--[[
			local str = addon:FormatTooltipText("按 Ctrl + V 键 粘贴方案字符串到输入框里，然后按回车(Enter)键。|r\n提示:您可以用 Ctrl + C 键 复制。\n如:保存在记事本这些方案字符串。\n|cffff0000注意:点击后可能会卡一下，时间视方案大小来定。|r\n同名不会覆盖。");
				menu:AddLine("text", "导入方案","checked",checked,"hasEditBox", 1,
				"editBoxText", "","editBoxFunc", "SysPrograms_List_Import",
				"editBoxArg1", self,"editBoxArg2", SuperTreatmentAllDBF["Programs"],
				"tooltipText",str,"tooltipTitle","导入方案", "icon",ExpandArrow);
			--]]
			
		elseif V[1] == "SysProgramsList" then
		
			V[2] = tonumber(V[2]);
			local tbl = SuperTreatmentAllDBF["Programs"][V[2]];
			
			
			menu:AddLine("text", "设定方案名称","hasEditBox", 1, "editBoxText", tbl["name"],
			"editBoxFunc", "SysProgramsDefault_Set_name",
			"editBoxArg1", self,"editBoxArg2", tbl);
			
			menu:AddLine("line",1,"LineHeight",8);
			
			menu:AddLine("text", "设定方案备注","hasEditBox", 1, "editBoxText", tbl["Remark"],
			"editBoxFunc", "SysProgramsDefault_Set_Remark",
			"editBoxArg1", self,"editBoxArg2", tbl,"icon");
			
			
			menu:AddLine("line",1,"LineHeight",8);
			
			local checked = tbl["checked"];
			
			if checked then
				local text=SerializerLib:Serialize(addon:ExportProcessing(tbl));
				local str = addon:FormatTooltipText("按 Ctrl + C 键 复制方案字符串。|r\n提示:您可以用 Ctrl + V 键 粘贴到\n如:记事本这些文本编辑软件保存。");
				menu:AddLine("text", "小型方案导出","checked",checked,
				"func", "SysProgramsDefault_Export_checked","arg1", self,"arg2", tbl,
				"hasEditBox", 1,"editBoxText", text,"tooltipText",str,"tooltipTitle","导出方案");
			
			else
			
				local str = addon:FormatTooltipText("点击选定(打钩)后才会显示要导出的文本。\n\n|r提示:您可以用按 Ctrl + C 键 复制导出的文本 Ctrl + V 键 粘贴到\n如:记事本这些文本编辑软件保存。|r\n\n注意:点击后可能会卡一下，时间视方案大小来定。\n\n|cffff0000注意：因为5.0关系太大的方案游戏会崩溃，大方案请用下面的【大型方案导出】。");
				 		
				menu:AddLine("text", "小型方案导出","checked",checked,
				"func", "SysProgramsDefault_Export_checked","arg1", self,"arg2", tbl,
				"tooltipText",str,"tooltipTitle","导出方案");
			end
			
			menu:AddLine("line",1,"LineHeight",8);
			
			local str = addon:FormatTooltipText("大型方案导出需要客户端在登录成功状态正确连接到游戏，导出时会重启插件，3秒后在客户端的【导出】栏可以看到导出的信息，按您需要可以复制和导出到文件保存。\n\n|cffff0000注意：因为5.0关系太大的方案会导致游戏崩溃。");
			
			if amIsConnection then
				
				menu:AddLine("text", "大型方案导出", "func", "stExport", "arg1", self, "arg2", tbl, "hasConfirm", 1, "confirmText", "导出会重启插件是否导出?",
				"tooltipText",str,"tooltipTitle","导出方案");
				
			else
			
				menu:AddLine("text", "大型方案导出(|cffff0000客户端没登录|r)","tooltipText",str,"tooltipTitle","导出方案");
			
			end
			
			menu:AddLine("line",1,"LineHeight",8);
			local str = addon:FormatTooltipText("[另存方案]到方案列表，请在列表里修改名称。");
						
			menu:AddLine("text", "另存方案",
			"func", "SysProgramsList_save","arg1", self,"arg2",V[2],
			"tooltipText",str,"tooltipTitle","另存方案");
			
			
			menu:AddLine("line",1,"LineHeight",8);
			local str = addon:FormatTooltipText("加载当前方案使您可以使用并且可以对其进行编辑。");
			menu:AddLine("text", "|cff00ffff使用/编辑方案",
			"func", "SysProgramsDefault_List_Edit","arg1", self,"arg2",{SuperTreatmentAllDBF["Programs"],V[2]},
			"tooltipText",str,"tooltipTitle","使用/编辑方案");
			
		
		
		elseif  V[1] == "SysProgramsDefault" then
		
			local tbl = SuperTreatmentDBF;
			
			menu:AddLine("text", "设定方案名称","hasEditBox", 1, "editBoxText", tbl["name"],
			"editBoxFunc", "SysProgramsDefault_Set_name",
			"editBoxArg1", self,"editBoxArg2", tbl
			);
			
			menu:AddLine("line",1);
			
			menu:AddLine("text", "设定方案备注","hasEditBox", 1, "editBoxText", tbl["Remark"],
			"editBoxFunc", "SysProgramsDefault_Set_Remark",
			"editBoxArg1", self,"editBoxArg2", tbl
			);
			
			menu:AddLine("line",1);
			
			
			local checked = tbl["checked"];
			--[[
			if checked then
				local text=SerializerLib:Serialize(addon:ExportProcessing(tbl));
				local str = addon:FormatTooltipText("按 Ctrl + C 键 复制方案字符串。|r\n提示:您可以用 Ctrl + V 键 粘贴到\n如:记事本这些文本编辑软件保存。");
				menu:AddLine("text", "导出方案",
				
				"func", "SysProgramsDefault_Export_checked","arg1", self,"arg2", tbl,
				"hasEditBox", 1,"editBoxText", text,"tooltipText",str,"tooltipTitle","导出方案");
			
			else
			
				local str = addon:FormatTooltipText("点击(打钩)选定当前方案导出。|r\n\n注意:点击后可能会卡一下，时间视方案大小来定。");
						
				menu:AddLine("text", "导出方案","checked",checked,
				"func", "SysProgramsDefault_Export_checked","arg1", self,"arg2", tbl,
				"tooltipText",str,"tooltipTitle","导出方案");
			end
			--]]
			
			if checked then
				local text=SerializerLib:Serialize(addon:ExportProcessing(tbl));
				local str = addon:FormatTooltipText("按 Ctrl + C 键 复制方案字符串。|r\n提示:您可以用 Ctrl + V 键 粘贴到\n如:记事本这些文本编辑软件保存。");
				menu:AddLine("text", "小型方案导出","checked",checked,
				"func", "SysProgramsDefault_Export_checked","arg1", self,"arg2", tbl,
				"hasEditBox", 1,"editBoxText", text,"tooltipText",str,"tooltipTitle","导出方案");
			
			else
			
				local str = addon:FormatTooltipText("点击选定(打钩)后才会显示要导出的文本。\n\n|r提示:您可以用按 Ctrl + C 键 复制导出的文本 Ctrl + V 键 粘贴到\n如:记事本这些文本编辑软件保存。|r\n\n注意:点击后可能会卡一下，时间视方案大小来定。\n\n|cffff0000注意：因为5.0关系太大的方案游戏会崩溃，大方案请用下面的【大型方案导出】。");
						
				menu:AddLine("text", "小型方案导出","checked",checked,
				"func", "SysProgramsDefault_Export_checked","arg1", self,"arg2", tbl,
				"tooltipText",str,"tooltipTitle","导出方案");
			end
			
			menu:AddLine("line",1);
			--[[
			local str = addon:FormatTooltipText("大型方案导出需要客户端在登录成功状态正确连接到游戏，导出时会重启插件，3秒后在客户端的【导出】栏可以看到导出的信息，按您需要可以复制和导出到文件保存。\n\n|cffff0000注意：因为5.0关系太大的方案会导致游戏崩溃。");
			
			if amIsConnection then
				
				menu:AddLine("text", "大型方案导出", "func", "stExport", "arg1", self, "arg2", tbl, "hasConfirm", 1, "confirmText", "导出会重启插件是否导出?",
				"tooltipText",str,"tooltipTitle","导出方案");
				
			else
			
				menu:AddLine("text", "大型方案导出(|cffff0000客户端没登录|r)","tooltipText",str,"tooltipTitle","导出方案");
			
			end
			menu:AddLine("line",1);
			]]--
			local str = addon:FormatTooltipText([[解锁版导出方案,导出后的方案保存在WTF下, 具体方法请看教程]]);
			menu:AddLine("text", "大型方案导出(解锁版)", "func", "stExport", "arg1", self, "arg2", tbl, "hasConfirm", 1, "confirmText", "导出会重启插件是否导出?",
				"tooltipText",str,"tooltipTitle","导出方案");
			menu:AddLine("line",1);
			
			local str = addon:FormatTooltipText("[另存方案]到方案列表，请在列表里修改名称。");
						
			menu:AddLine("text", "另存方案",
			"func", "SysProgramsDefault_save","arg1", self,
			"tooltipText",str,"tooltipTitle","另存方案"
			
			);
			
		
		end
		
	elseif level == 4 then -- 4级菜单内容
		
		local V = addon:DecompositionValue(value);
		
		
		if value == "SHOW_SetSoundsList" then
			
			local A_Z={"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
		
			
			for i, v in pairs(A_Z) do
			
				menu:AddLine("text", "|cff00ff00" .. v,
				"hasArrow", 1, "value","SHOWSetSoundsList1_" .. v,"notCheckable",1			
				);
				
			end
			
		elseif value == "CLOSE_SetSoundsList" then
			
			local A_Z={"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
		
			
			for i, v in pairs(A_Z) do
			
				menu:AddLine("text", "|cff00ff00" .. v,
				"hasArrow", 1, "value","CLOSESetSoundsList1_" .. v,"notCheckable",1			
				);
				
			end
			
		elseif value == "CHECKED_SetSoundsList" then
			
			local A_Z={"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
		
			
			for i, v in pairs(A_Z) do
			
				menu:AddLine("text", "|cff00ff00" .. v,
				"hasArrow", 1, "value","CHECKEDSetSoundsList1_" .. v,"notCheckable",1			
				);
				
			end
			
			
		
		elseif value == "AddOnTestRangeCheck" then
			
			local TEMP;
			
			if  DBM and DBM.MapSizes then
				ST.RangeCheck.MapSizes = DBM.MapSizes;
				TEMP = th_table_dup(ST.RangeCheck.MapSizes);
				for k, data in pairs(DungeonInf) do
					
					if not TEMP[k] then
						TEMP[k]=false;
						--print(1, k)
					end
					
					
				end
				
			else
				
				ST.RangeCheck.MapSizes = ST.MapSizes;
				
				TEMP = th_table_dup(ST.RangeCheck.MapSizes);
				
				for k, data in pairs(DungeonInf) do
					
					if not TEMP[k] then
						TEMP[k]=false;
						--print(2, k)
					end
					
					
				end
				
			end
			
			local DBM =ST.RangeCheck;
			local mapName = GetMapInfo()
			local dims  = DBM.MapSizes[mapName] and DBM.MapSizes[mapName][GetCurrentMapDungeonLevel()]
			
			menu:AddLine("text","滚动鼠标显示更多" ,"isTitle",1);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			if DBM.MapSizes then
				
							
				
				
				if DBM.MapSizes[mapName] and DBM.MapSizes[mapName][GetCurrentMapDungeonLevel()] then
						--menu:AddLine("text", k);
						
						menu:AddLine("text", "|cff00ff00" .. (DungeonInf[mapName] or mapName) ,
						"checked",1,
						"hasArrow", 1, "value", "AddOnTestRangeCheckLevel_" .. mapName)
										
				end
				
				
			
				for k, data in pairs(TEMP) do
					if mapName ~=k and data and DungeonInf[k] then
						--menu:AddLine("text", k);
						
						
						menu:AddLine("text", "|cff00ff00" .. (DungeonInf[k] or k) ,
						"checked",false,
						"hasArrow", 1, "value", "AddOnTestRangeCheckLevel_" .. k)
						
					
						
					end
				end
				
				menu:AddLine();
				menu:AddLine("text","中文名称未知" ,"isTitle",1);
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
				
				
				for k, data in pairs(TEMP) do
					if mapName ~=k and data and not DungeonInf[k] then
						--menu:AddLine("text", k);
						
						
						menu:AddLine("text", "|cff00ff00" .. (DungeonInf[k] or k) ,
						"checked",false,
						"hasArrow", 1, "value", "AddOnTestRangeCheckLevel_" .. k)
						
					
						
					end
				end
				
				
				menu:AddLine();
				menu:AddLine("text","没加载的地图" ,"isTitle",1);
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
				
				for k, data in pairs(TEMP) do
					if data == false then
						
						menu:AddLine("text", DungeonInf[k] or k );
						
					end
				end
				
			
			else
			
				
				for k, data in pairs(DungeonInf) do
				
					menu:AddLine("text", data)
				end
				
			end
			
			
			
		elseif value == "FileImportScheme" then
		
			local succ,tbl=SerializerLib:Deserialize(stimport);
			local name="";
			if succ then
				
				if not tbl["Unit"] then
					
					
					menu:AddLine("text",tbl["name"] or "" .. "不是上帝指令方案！","isTitle",1,"notCheckable",1);
					menu:AddLine("text","请尝试别的导入方式。","isTitle",1,"notCheckable",1);
					
				else
					menu:AddLine("text","方案列表:" ,"isTitle",1,"notCheckable",1);
					name=tbl["name"];		
					local str = addon:FormatTooltipText("点击导入方案,成功后会在上级菜单方案列表里找到刚才导入的方案");
					menu:AddLine("text", name .."(版本:"..(tbl["Version"] or "")..")","checked",checked,
					"func", "FileImportScheme_Add","arg1", self,"arg2",tbl,
					"notCheckable",1,
					"tooltipText",str,"tooltipTitle","信息");
				
				end
			else
				if stimport=="" then
					if SuperTreatmentExport_Dbf_import then
						
						local tbl = SuperTreatmentExport_Dbf_import;
						if not tbl["Unit"] then
					
					
							menu:AddLine("text",tbl["name"] or "" .. "不是上帝指令方案！","isTitle",1,"notCheckable",1);
							menu:AddLine("text","请尝试别的导入方式。","isTitle",1,"notCheckable",1);
							
						else
							menu:AddLine("text","方案列表:" ,"isTitle",1,"notCheckable",1);
							name=tbl["name"];		
							local str = addon:FormatTooltipText("点击导入方案,成功后会在上级菜单方案列表里找到刚才导入的方案");
							menu:AddLine("text", name .."(版本:"..(tbl["Version"] or "")..")","checked",checked,
							"func", "FileImportScheme_Add","arg1", self,"arg2",tbl,
							"notCheckable",1,
							"tooltipText",str,"tooltipTitle","信息");
						
						end
					
					
					else
					
						menu:AddLine("text","当前没方案可导入","isTitle",1,"notCheckable",1);
						menu:AddLine("text","导入方法请看上级菜单提示框","isTitle",1,"notCheckable",1);
						menu:AddLine("text","没瞎的话你肯定能看到！","isTitle",1,"notCheckable",1);
					
					end
					
				else
					menu:AddLine("text","导入失败！","isTitle",1,"notCheckable",1);
					menu:AddLine("text","或者方案的字符串有缺失！","isTitle",1,"notCheckable",1);
					menu:AddLine("text","请核对您的操作是否正确！","isTitle",1,"notCheckable",1);
				end
			end
		
		elseif value == "AddOnsImportScheme" then
				
				menu:AddLine("text","脚本助手:" ,"isTitle",1,"disabled",not (WowBeeHelperPer and WowBeeHelperPer["List"]));
				
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
				
				--WowBeeHelperPer["List"][1]["Items"][1]["Description"]
			if WowBeeHelperPer and WowBeeHelperPer["List"] then	
			
				for i, v in pairs(WowBeeHelperPer["List"]) do
				
					menu:AddLine("text",v["Name"],"icon", v["Icon"],
					"func", "AddOnsImportScheme_add","arg1", self,"arg2",v
					
					);
					
					menu:AddLine("line",1);
				
				end
				
			
			end
		
		
			if WowBeeHelper and WowBeeHelper["List"] then	
			
				for i, v in pairs(WowBeeHelper["List"]) do
				
					menu:AddLine("text",v["Name"],"icon", v["Icon"],
					"func", "AddOnsImportScheme_add","arg1", self,"arg2",v
					
					);
					menu:AddLine("line",1);
				end
				
			
			end
			
			--ClassName
			menu:AddLine();
			menu:AddLine("text","脚本助手(职业):" ,"isTitle",1,"disabled",not (LazyScript));
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			if LazyScript then 
				
				for i, v in pairs(LazyScript) do
					
					local color = RAID_CLASS_COLORS[i]
					local tc = CLASS_BUTTONS[i]
					local n=0										
						for k, data in pairs(v["List"]) do
							n=n+1;					
						end
										
						
					menu:AddLine("text",ClassName[i] or i .. " |cffffffff(" .. n .. ")", "textR", color.r, "textG", color.g, "textB", color.b,
					"icon", "Interface\\WorldStateFrame\\Icons-Classes",
					"tCoordLeft", tc[1],
					"tCoordRight", tc[2],
					"tCoordTop", tc[3],
					"tCoordBottom", tc[4],
					
					"hasArrow", 1, "value", "AddOnsImportSchemelist_" .. i
					
					);
						
					menu:AddLine("line",1);
				end
				
			end
			
		elseif value == "AddOnsImportPresetScripts" then

			
			--ClassName
			menu:AddLine();
			menu:AddLine("text","本职业现有方案:" ,"isTitle",1,"disabled",not (wowamPresetScripts));
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			if wowamPresetScripts then 
				
				for i, v in pairs(wowamPresetScripts) do
					local color = RAID_CLASS_COLORS[i]
					local tc = CLASS_BUTTONS[i]
					local n=0										
						for k, data in pairs(v["List"]) do
							n=n+1;					
						end
										
						
					menu:AddLine("text",ClassName[i] or i .. " |cffffffff(" .. n .. ")", "textR", color.r, "textG", color.g, "textB", color.b,
					"icon", "Interface\\WorldStateFrame\\Icons-Classes",
					"tCoordLeft", tc[1],
					"tCoordRight", tc[2],
					"tCoordTop", tc[3],
					"tCoordBottom", tc[4],
					
					"hasArrow", 1, "value", "AddOnsImportPresetScriptList_" .. i
					
					);
						
					menu:AddLine("line",1);
				end
				
			end
			
		end
	
	elseif level == 5 then -- 4级菜单内容	
	
		local V = addon:DecompositionValue(value);
		
		if V[1] == "SHOWSetSoundsList1" then
			
			local Sounds = DropDownMenu:GetSounds("open");
			local k =1;
			for i, v in pairs(amSounds) do
				
				
				if V[2]==string.upper(string.sub(v,1,1)) then
				
					menu:AddLine("text","|cff104E8B" .. k .. ". |cffFFA54F" .. v,"checked",v==Sounds,
					"func", "SetSounds","arg1", self,"arg2",
					{"open",v,level}
					
					);
					k=k+1;
				end
				
					
			end
		
		elseif V[1] == "CLOSESetSoundsList1" then
			
			local Sounds = DropDownMenu:GetSounds("close");
			local k =1;
			for i, v in pairs(amSounds) do
				
				
				if V[2]==string.upper(string.sub(v,1,1)) then
				
					menu:AddLine("text","|cff104E8B" .. k .. ". |cffFFA54F" .. v,"checked",v==Sounds,
					"func", "SetSounds","arg1", self,"arg2",
					{"close",v,level}
					
					);
					k=k+1;
				end
				
					
			end
			
		elseif V[1] == "CHECKEDSetSoundsList1" then
			
			local Sounds = DropDownMenu:GetSounds("checked");
			local k =1;
			for i, v in pairs(amSounds) do
				
				
				if V[2]==string.upper(string.sub(v,1,1)) then
				
					menu:AddLine("text","|cff104E8B" .. k .. ". |cffFFA54F" .. v,"checked",v==Sounds,
					"func", "SetSounds","arg1", self,"arg2",
					{"checked",v,level}
					
					);
					k=k+1;
				end
				
					
			end
			
		elseif V[1] == "AddOnTestRangeCheckLevel" then
			
			if  DBM and DBM.MapSizes then
				ST.RangeCheck.MapSizes = DBM.MapSizes;
				
			else
				
				ST.RangeCheck.MapSizes = ST.MapSizes;
			
			end
			
			local DBM =ST.RangeCheck;
			
			
			local dims  = DBM.MapSizes[V[2]] and DBM.MapSizes[V[2]][GetCurrentMapDungeonLevel()]
			
			if DBM.MapSizes and DBM.MapSizes[V[2]] then
				for k, data in pairs(DBM.MapSizes[V[2]]) do
					if DBM.MapSizes[V[2]] and DBM.MapSizes[V[2]][GetCurrentMapDungeonLevel()] then
						
						menu:AddLine("text", "区域(" .. k .. ")","checked", GetMapInfo() == V[2] and k == GetCurrentMapDungeonLevel());
						
					end
				end
			
			end
			
			
			
		elseif V[1] == "AddOnsImportSchemelist" then
			
			
			if LazyScript then
				
				for i, v in pairs(LazyScript) do
					
					local color = RAID_CLASS_COLORS[i]
					local tc = CLASS_BUTTONS[i]
					
					if i == V[2] then
					
						for i, data in pairs(v["List"]) do
							
							
							menu:AddLine("text",data["Name"], "textR", color.r, "textG", color.g, "textB", color.b,
							"icon", "Interface\\WorldStateFrame\\Icons-Classes",
							"tCoordLeft", tc[1],
							"tCoordRight", tc[2],
							"tCoordTop", tc[3],
							"tCoordBottom", tc[4],
							"func", "AddOnsImportScheme_add","arg1", self,"arg2",data
							
							);
							menu:AddLine("line",1);
						end
					
					end					
					
					
				end	
			
			end
			
		elseif V[1] == "AddOnsImportPresetScriptList" then
		
			if wowamPresetScripts then
				
				for i, v in pairs(wowamPresetScripts) do
					local color = RAID_CLASS_COLORS[i]
					local tc = CLASS_BUTTONS[i]
					
					if i == V[2] then
					
						for i, data in pairs(v["List"]) do
						--print(data["Name"])
						
							local authorname = data["Author"] or "未知"
							local buildstring = data["WowBuild"] or "未知"
							local versionstring = data["Version"] or "未知"
							local infostring = data["Info"] or "未知"
							local help = addon:FormatTooltipText(string.format("作者: %s\n魔兽版本: %s\n方案版本: %s\n\n备注: %s",authorname,buildstring,versionstring,infostring));			
					
							menu:AddLine("text",data["Name"], "textR", color.r, "textG", color.g, "textB", color.b,
							"icon", "Interface\\WorldStateFrame\\Icons-Classes",
							"tooltipText",help,
							"tCoordLeft", tc[1],
							"tCoordRight", tc[2],
							"tCoordTop", tc[3],
							"tCoordBottom", tc[4],
							"func", "ImportPresetScript","arg1", self,"arg2",data["Script"]
							
							);
							menu:AddLine("line",1);
						end
					
					end					
					
					
				end	
			
			end
		
		
		
		
		
		
		
		
		end
	
	end
	
end


function addon:SysProgramsDefault_Set_name(tbl,v)
	
	tbl["name"]=v;
		
	DropDownMenu:Refresh(1);
	
end

function addon:SysProgramsDefault_Set_Remark(tbl,v)
	
	tbl["Remark"]=v;
		
	DropDownMenu:Refresh(1);
	
end


function addon:SysProgramsDefault_Export_checked(v)
	
	v["checked"]=not v["checked"];
		
	DropDownMenu:Refresh(3);
	
end

function addon:AddImportProgramText(rs,text)
	
	table.insert(ImportProgramText,text);
	addon:SysPrograms_List_Import();
	DropDownMenu:Refresh(2);
end

function addon:DelImportProgramText()
	
	ImportProgramText={};
	DropDownMenu:Refresh(2);
end


function addon:SysPrograms_List_Import()
	
	if #ImportProgramText<=0 then
		
		return;
		
	end
	
	local text = "";
	
	for v, data in pairs(ImportProgramText) do
		
		text = text .. data;
		
	end

	local succ,tbl=SerializerLib:Deserialize(text);
	
	if succ then
	
		
		tbl["Import"]=false;
		tbl["name"]="[导入]" .. tbl["name"];		
		stRefreshMark(tbl);
		table.insert(SuperTreatmentAllDBF["Programs"], tbl);
		addon:SuperTreatmentDBF_up();
		print("|cff00ff00方案 |cffff0000" .. tbl["name"] .. " |cff00ff00导入成功！,请确认及修改名称。")
		ImportProgramText={};
		DropDownMenu:Refresh(2)
		
	else
		print("|cffff0000导入失败！无法识别的方案字符串")
	end
end

function addon:SysProgramsDefault_Del_checked(v)

	if IsControlKeyDown() and IsAltKeyDown() then
		table.remove(v[1], v[2]) ;
		DropDownMenu:Refresh(2);
		return;
			
	end

end

function addon:SysProgramsDefault_List_Edit(v)

	DropDownMenu:Close(3);
	local Mark =amrandom();
	local temp = th_table_dup(SuperTreatmentDBF);
	
	stCancelKey(temp,0);
	
	if not v[1][v[2]]["Mark"] then
		v[1][v[2]]["Mark"] = Mark;
	end
	
	
	
	
	--SuperTreatmentDBF["index"]=v[2];
	
	--table.remove(v[1], v[2]) ;
		
	if not temp["Mark"] then
		table.insert(v[1], temp)
		SuperTreatmentDBF = th_table_dup(v[1][v[2]]);
	else
		
		for i, data in pairs(v[1]) do
			if temp["Mark"] == data["Mark"] then
				v[1][i]=temp;
				SuperTreatmentDBF = th_table_dup(v[1][v[2]]);
				break;
			end
		
		end
	end
	
	
	SuperTreatment_SetTBL(0);
	
	DropDownMenu:Refresh(1);

end


function addon:SysProgramsDefault_save()
		
	local temp = th_table_dup(SuperTreatmentDBF);
	stRefreshMark(temp);
	--temp["index"] = #SuperTreatmentAllDBF["Programs"]+1;
	temp["name"]="[另存方案]";
	table.insert(SuperTreatmentAllDBF["Programs"], temp);
	
	DropDownMenu:Refresh(2);

end


function addon:SysProgramsList_save(i)
		
	local temp = th_table_dup(SuperTreatmentAllDBF["Programs"][i]);
	stRefreshMark(temp);
	--temp["index"] = #SuperTreatmentAllDBF["Programs"]+1;
	temp["name"]="[另存方案]";
	table.insert(SuperTreatmentAllDBF["Programs"], temp);
	
	DropDownMenu:Refresh(2);

end


function addon:TargetListTargetsConditionsNamesBuff_Own_Checked(v)

	v["OwnChecked"] = not v["OwnChecked"];
	DropDownMenu:Refresh(5);
	

end

function addon:MagicSolutionAddPetMacro_Add(v)

	local TBL={};
	TBL["spellId"]=0;
	TBL["Type"]=v["type"]
	TBL["itemLink"]=v["spellLink"];
	TBL["Texture"]=v["texture"];
	TBL["Rank"]=v["spellSubName"];
	TBL["checked"]=false;
	TBL["Targets"]={};
	TBL["DelayChecked"]=false;
	TBL["DelayValue"]=0;
	TBL["MacroName"]=v["name"];
	TBL["Macro"]=v["macro"];
	TBL["Remarks"]="";
	TBL["name"]="";
	TBL["subgroup"]=-3;
	
	TBL["raidn"]=-3;
	TBL["TargetSubgroup"]=-1;
	TBL["PropertiesSetChecked"]=1;
	TBL["PropertiesSet_Continue_Checked"]=false;
	
	TBL["PropertiesSetChecked"]=v["PropertiesSetChecked"];
	TBL["lock"]=v["lock"];
	
	if v["unit"] then
		TBL["unit"]=v["unit"];
		TBL["Target"]=v["unitname"];
	else
		TBL["unit"]="Target";
		TBL["Target"]="当前目标";
	end

	
	table.insert(Spells, TBL);
	DropDownMenu:Refresh(2)		
end

function addon:CustomizeTargetListGetTargetAmminimumFastSetGroupMultitasking_Time_Value(tbl,v)

	tbl["MultitaskingTime"]=v;
	DropDownMenu:Refresh(5)	;
end

function addon:MultitaskingStartSet()

	if SuperTreatmentInf["Multitasking"]["MultitaskingStart"] then
	SuperTreatmentInf["Multitasking"]["MultitaskingStart"]=false;
	end
	DropDownMenu:Refresh(1)	;
end

function SuperTreatment_Program_Show(index,v1 ,i,v2 )
	--print(index,v1 ,i,v2)
	if type(index) == "string" then
		
		for k,v in pairs(SuperTreatmentDBF["Spells"]["List"]) do
			
			if v["name"]==index then
				index=k;
				break;
			end
			
		end
	
	end
	
	local tbl = SuperTreatmentDBF["Spells"]["List"][index];
	
	if not tbl then
		
		stprint("|cffff0000[" .. index .. "]方案不存在！")
		return false;
	end
	
	if v1 == nil then
	
		if tbl and not i then
			tbl["checked"]=not tbl["checked"];
			if tbl["checked"] then
				stprint("|cff00ff00" .. index .. ". |cffff0000[|r" .. tbl["name"].."|cffff0000]|cff00ff00被选择！")
			else
				stprint("|cff00ff00" .. index .. ". |cffff0000[|r" .. tbl["name"].."|cffff0000]|cffff0000被放弃！")

			end
			DropDownMenu:Refresh(1);
		end
		
	else
		
		if tbl["checked"] == v1 then
		
			if tbl["checked"] then
				stprint("|cff00ff00" .. index .. ". |cffff0000[|r" .. tbl["name"].."|cffff0000]|cff00ff00已选择！")
			else
				stprint("|cff00ff00" .. index .. ". |cffff0000[|r" .. tbl["name"].."|cffff0000]|cffff0000已放弃！")

			end
		
		elseif tbl["checked"] ~= v1 then
		
			tbl["checked"]=v1;
			if tbl["checked"] then
				stprint("|cff00ff00" .. index .. ". |cffff0000[|r" .. tbl["name"].."|cffff0000]|cff00ff00被选择！")
			else
				stprint("|cff00ff00" .. index .. ". |cffff0000[|r" .. tbl["name"].."|cffff0000]|cffff0000被放弃！")

			end
			
		end
		
		
		DropDownMenu:Refresh(1);
			
		
	
	end
	
	
		
	if i then
		local i = tonumber(i);
		if not tbl["spell"][i] then
	
			stprint("|cff00ff00[" .. tbl["name"] .. "]方案下的|cffff0000[|r" .. i .. "|cffff0000]|cffff0000不存在！")
			return false
		end
	
	end
	
	if v2 == nil then
	
		if i then
			local i = tonumber(i);
			if i and tbl["spell"][i] then
				tbl["spell"][i]["checked"] = not tbl["spell"][i]["checked"];
				DropDownMenu:Refresh(1);
			
			
				if tbl["spell"][i]["checked"] then
					stprint("|cff00ff00" .. index .. ". |cffff0000[|r" .. tbl["name"].."|cffff0000]"..tbl["spell"][i]["itemLink"].."|cff00ff00被选择！")
				else
					stprint("|cff00ff00" .. index .. ". |cffff0000[|r" .. tbl["name"].."|cffff0000]"..tbl["spell"][i]["itemLink"].."|cffff0000被放弃！")

				end
			end
		end
	
	else
	
		if i then
			local i = tonumber(i);
			if i and tbl["spell"][i] then
				
				if tbl["spell"][i]["checked"] == v2 then
					
					if tbl["spell"][i]["checked"] then
						stprint("|cff00ff00" .. index .. ". |cffff0000[|r" .. tbl["name"].."|cffff0000]"..tbl["spell"][i]["itemLink"].."|cff00ff00已选择！")
					else
						stprint("|cff00ff00" .. index .. ". |cffff0000[|r" .. tbl["name"].."|cffff0000]"..tbl["spell"][i]["itemLink"].."|cffff0000已放弃！")

					end
				
				else
				
				
					tbl["spell"][i]["checked"] = v2;
					DropDownMenu:Refresh(1);
				
				
					if tbl["spell"][i]["checked"] then
						stprint("|cff00ff00" .. index .. ". |cffff0000[|r" .. tbl["name"].."|cffff0000]"..tbl["spell"][i]["itemLink"].."|cff00ff00被选择！")
					else
						stprint("|cff00ff00" .. index .. ". |cffff0000[|r" .. tbl["name"].."|cffff0000]"..tbl["spell"][i]["itemLink"].."|cffff0000被放弃！")

					end
				end
				
			end
		end
	
	
	end
	
	if WowStHelperFrame and WowStHelperFrame:IsShown() then
		WowStHelperFrame_Show();
	end
	
	
end


function SuperTreatment_Program_load(index)
	
	if type(index) ~= "string" then
		return;
	end
	local text=index;
	local n;
	local tbl = SuperTreatmentAllDBF["Programs"];
	
	if #tbl==0 then
		stprint("目前没有方案可以加载。")
		return false;
	end
	
	for k,v in pairs(tbl) do
			
		if v["name"]==index then
			n=k;
			break;
		end
		
	end
		
	if n then
	
	addon:SysProgramsDefault_List_Edit({tbl,n});
	
	stprint("|cffff0000[|r" .. text.."|cffff0000]|cff00ff00加载成功！")	
	
		DropDownMenu:Refresh(1);
		
	else
		stprint("|cffff0000[|r" .. text.."|cffff0000]|cff00ff00名称错误加载失败！")
	end
	
	
end


function addon:CustomizeTargetListGetTargetAmminimumFastCount_v_checked(tbl)

	tbl["checked"]= not tbl["checked"];
	DropDownMenu:Refresh(5)	;
end

function addon:CustomizeTargetListGetTargetAmminimumFastCount_v_value(tbl,v)

	tbl["Value"]= v;
	DropDownMenu:Refresh(5)	;
end


function addon:Menu_GlobalQuickSetup(level, value, menu, MenuEx,GlobalLevel)

	if level == 2 then -- 2级菜单内容

		if  value == "GlobalQuickSetup" then
			
			local n = 0;
			local RightText="";
			local MT =SuperTreatmentDBF["Unit"]["MTList"];
			local dbf;
			
			
			if MT["TypeChecked"]==2 then
				dbf=MT["Custom"];
			elseif MT["TypeChecked"]==1 then
				dbf=MT["Default"];
			end
			
			for k, data in pairs(dbf) do
				if amGetUnitName(data,true) then
					n=n+1;
				end
			end
			
			if n>0 then
			
				RightText =  "(|cffff0000" .. n .."|r)";
			
			end
			
			menu:AddLine("text", "|cffffff00MT设定" , "hasArrow", 1, "value", "GlobalQuickSetupSetMT",
			"notCheckable",1,
			"RightText",RightText
			);
			menu:AddLine("line",1);
			
			n=0;
			RightText="";
			for k, data in pairs(SuperTreatmentDBF["Unit"]["ExcludedGroup"]) do
				if data then
					n=n+1;
				end
			end
			
			if n>0 then
			
				RightText =  "(|cffff0000" .. n .."|r)";
			
			end
			
			menu:AddLine("text", "|cffffff00排除的小队" , "hasArrow", 1, "value", "GlobalQuickSetupExcludedGroup",
			"RightText",RightText,
			"notCheckable",1
			);
			
			menu:AddLine("line",1);
			
			n=0;
			RightText="";
			for k, data in pairs(SuperTreatmentDBF["Unit"]["ExcludeTarget"]) do
				if data then
					n=n+1;
				end
			end
			
			if n>0 then
			
				RightText =  "(|cffff0000" .. n .."|r)";
			
			end
			
			menu:AddLine("text", "|cffffff00排除的目标" , "hasArrow", 1, "value", "GlobalQuickSetupExcludeTarget",
			"RightText",RightText,
			"notCheckable",1
			);
			
		end
		
		
	elseif level == 3 then -- 2级菜单内容	
			
		if  value == "GlobalQuickSetupSetMT" then
			
			local MT = SuperTreatmentDBF["Unit"]["MTList"];
			
			if not MT["TypeChecked"] then
				MT["TypeChecked"]=1;
			end
			
			menu:AddLine("text","MT设定" ,"isTitle",1);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			menu:AddLine("text","|cffffff00使用系统默认MT","isRadio",1,"checked",MT["TypeChecked"]==1,
			"func", "GlobalQuickSetupSetCustomMT_checked", "arg1", self,"arg2", 1
			);
			
			
			menu:AddLine("text","|cffffff00使用自定义MT","isRadio",1,"checked",MT["TypeChecked"]==2,
			"func", "GlobalQuickSetupSetCustomMT_checked", "arg1", self,"arg2", 2
			);
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			if MT["TypeChecked"]==2 then
				
				
				local str = "\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键";
				
				
				for k, data in pairs(MT["Custom"]) do
					
					
					local color,tc,levelColor,subgroup,checked,Class;	
					
					name = amGetUnitName(data,true) ;
					
					if name  then
															
						local playerClass, englishClass = UnitClass(name);
						color = RAID_CLASS_COLORS[englishClass];
						tc = CLASS_BUTTONS[englishClass];
					
					
						menu:AddLine(
						-- 职业图标
						"hasArrow", 1, "value", "GlobalQuickSetupSetMTTo_" .. k,
						"icon", "Interface\\WorldStateFrame\\Icons-Classes",
						"tCoordLeft", tc[1],
						"tCoordRight", tc[2],
						"tCoordTop", tc[3],
						"tCoordBottom", tc[4],
						
						"text", "|cff104E8B" .. k .. ".|r" .. name, "textR", color.r, "textG", color.g, "textB", color.b,
						
						"tooltipText",str,"tooltipTitle","信息",
						"func","GlobalQuickSetupDelMT_checked", "arg1", self,"arg2",k
						);
					
					else
						menu:AddLine("text", "|cff104E8B" .. k .. ".|r" .. data ,
						"tooltipText",str,"tooltipTitle","信息",
						"func","GlobalQuickSetupDelMT_checked", "arg1", self,"arg2",k,
						"hasArrow", 1, "value", "GlobalQuickSetupSetMTTo_" .. k
						);
				
					end
					
					menu:AddLine("line",1);
							
				end
				
				
				
				
				
			
			
			elseif MT["TypeChecked"] == 1 then
				
				for k, data in pairs(MT["Default"]) do
					
					
						
						local name = amGetUnitName(data,true) ;
						
						
						local color,tc,levelColor,subgroup,checked,Class;
						
						if name  then
																
							local playerClass, englishClass = UnitClass(name);
							color = RAID_CLASS_COLORS[englishClass];
							tc = CLASS_BUTTONS[englishClass];
						
						
							menu:AddLine(
							-- 职业图标
							
							"icon", "Interface\\WorldStateFrame\\Icons-Classes",
							"tCoordLeft", tc[1],
							"tCoordRight", tc[2],
							"tCoordTop", tc[3],
							"tCoordBottom", tc[4],
							
							"text", "|cff00ff00" .. k .. ".|r" .. name, "textR", color.r, "textG", color.g, "textB", color.b
							);
						
						
						end
						
				
	
									
				end
				

			
			
			end
			
			
			

		elseif  value == "GlobalQuickSetupExcludedGroup" then
			
			menu:AddLine("text","排除的小队" ,"isTitle",1);
			menu:AddLine();
				
			for i=1 , 8 do
				
				menu:AddLine("text", i .. "小队" ,"checked",SuperTreatmentDBF["Unit"]["ExcludedGroup"][i],
				"func", "GlobalQuickSetupExcludedGroup_checked", "arg1", self, "arg2", i
				);
			end
			
		
		elseif  value == "GlobalQuickSetupExcludeTarget" then
			
			menu:AddLine("text","|cffffff00选择添加排除目标","hasArrow", 1, "value", "GlobalQuickSetupExcludeTarget_Add")
			
			menu:AddLine()
			local tbl = SuperTreatmentDBF["Unit"]["ExcludeTarget"];
			for name, data in pairs(tbl) do
				
				if amGetUnitName(name,true) then
				
					local color,tc,levelColor,subgroup,checked,Class;
					local playerClass, englishClass = UnitClass(name);
					color = RAID_CLASS_COLORS[englishClass];
					tc = CLASS_BUTTONS[englishClass];
					
					menu:AddLine(
					-- 职业图标
					"icon", "Interface\\WorldStateFrame\\Icons-Classes",
					"tCoordLeft", tc[1],
					"tCoordRight", tc[2],
					"tCoordTop", tc[3],
					"tCoordBottom", tc[4],
					
					"text", name, "textR", color.r, "textG", color.g, "textB", color.b,
					"func", "GlobalQuickSetupExcludeTarget_DEL", "arg1", self, "arg2", name
				)
				
				else
				
					data = nil;
								
				end
			end
			
			
		
		end
			
	elseif level == 4 then -- 2级菜单内容	
			
			local V = addon:DecompositionValue(value);
			
			if  value == "GlobalQuickSetupExcludeTarget_Add" then
			
				
				-- 菜单表格标题
				menu:AddColumnHeader("角色名", "LEFT")
				menu:AddColumnHeader("种族", "CENTER")
				menu:AddColumnHeader("小队", "CENTER")
				menu:AddColumnHeader("选中", "CENTER")
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
				
				if GetNumGroupMembers() >0 and IsInRaid() then
				
					for i=1 , 8 do
						addon:GlobalQuickSetupExcludeTarget_Add_subgroup(i,menu);
					end
				
				else
				
					addon:GlobalQuickSetupExcludeTarget_Add_subgroup(0,menu);
				
				end
				
			
			end			
	
	
	end
	
end

function addon:GlobalQuickSetupSetMT_checked(v)
	
	
	SuperTreatmentDBF["Unit"]["MTList"]["Custom"][v[1]]=v[2];
	
	DropDownMenu:Refresh(2)	;
			
end

function addon:ProgramSetupExcludedGroup_checked(v)
	
	local tbl = SuperTreatmentDBF["Spells"]["List"][v[1]];
	
	tbl["ExcludedGroup"][v[2]]= not tbl["ExcludedGroup"][v[2]];
	DropDownMenu:Refresh(3);
	
end

function addon:ProgramSetupExcludeTarget_DEL(v)
	
	local tbl = SuperTreatmentDBF["Spells"]["List"][v[1]];
	tbl["ExcludeTarget"][v[2]]= nil;
	DropDownMenu:Refresh(3);
	
end

function addon:ProgramSetupExcludeTarget_SelectedTarget(v)
	
	local tbl = SuperTreatmentDBF["Spells"]["List"][v[1]];
	
	if tbl["ExcludeTarget"][v[2]] then
		tbl["ExcludeTarget"][v[2]]= nil;
	else
		tbl["ExcludeTarget"][v[2]]= true;
	
	end
	DropDownMenu:Refresh(2);
	
end


function addon:GlobalQuickSetupExcludedGroup_checked(v)
	
	SuperTreatmentDBF["Unit"]["ExcludedGroup"][v]= not SuperTreatmentDBF["Unit"]["ExcludedGroup"][v];
	DropDownMenu:Refresh(2);
	
end

function addon:GlobalQuickSetupExcludeTarget_SelectedTarget(v)
	
	if SuperTreatmentDBF["Unit"]["ExcludeTarget"][v] then
		SuperTreatmentDBF["Unit"]["ExcludeTarget"][v]= nil;
	else
		SuperTreatmentDBF["Unit"]["ExcludeTarget"][v]= true;
	
	end
	DropDownMenu:Refresh(2);
	
end


function addon:GlobalQuickSetupExcludeTarget_DEL(v)
	
	SuperTreatmentDBF["Unit"]["ExcludeTarget"][v]= nil;
	DropDownMenu:Refresh(2);
	
end

function addon:ProgramSetupExcludeTarget_Add_subgroup(T,v,menu)
	
	local tbl = SuperTreatmentDBF["Spells"]["List"][T];
	
	for i, data in pairs(RDB) do
		local unit =data["unit"];
	
		if data["subgroup"]== v then
		
			local color,tc,levelColor,subgroup,checked,Class;
			local name = amGetUnitName(unit,true);
			
			
			
			
			local unit =data["unit"];
			local playerClass, englishClass = UnitClass(unit)
			color = RAID_CLASS_COLORS[englishClass]
			tc = CLASS_BUTTONS[englishClass]
			
			
			--[[
				if data["subgroup"] ==0 then
					subgroup= "";
				else
					subgroup= data["subgroup"];
				end
				--]]
				subgroup = data["subgroup"] ~=0 and data["subgroup"] or "无"
				
				if SuperTreatmentDBF["Unit"]["ExcludeTarget"][name] then
					checked="|cffffff00√|r";
				else
					checked="";
				end
				
				
				
				if tbl["ExcludeTarget"][name]  then
					checked="|cffffff00√|r";
				else
					checked="";
				end
				
				


				-- 表格内容行
				menu:AddLine(
					-- 职业图标
					"icon", "Interface\\WorldStateFrame\\Icons-Classes",
					"tCoordLeft", tc[1],
					"tCoordRight", tc[2],
					"tCoordTop", tc[3],
					"tCoordBottom", tc[4],
					
					"text1", name, "text1R", color.r, "text1G", color.g, "text1B", color.b,
					"text2", UnitRace(unit),
					"text3", subgroup,
					"text4", checked,
					"func", "ProgramSetupExcludeTarget_SelectedTarget", "arg1", self, "arg2", {T,name}
				)
			
			
			
			
			
			
		end
	end
	
end


function addon:GlobalQuickSetupExcludeTarget_Add_subgroup(v,menu)
	
	--[[
	for i, data in pairs(RDB) do
		local unit =data["unit"];
	
		if data["subgroup"]== v then
		
			local color,tc,levelColor,subgroup,checked,Class;
			local name = amGetUnitName(unit,true);
			
			
			
			
			local unit =data["unit"];
			local playerClass, englishClass = UnitClass(unit)
			color = RAID_CLASS_COLORS[englishClass]
			tc = CLASS_BUTTONS[englishClass]
			
			
			
				if data["subgroup"] ==0 then
					subgroup= "无";
				else
					subgroup= data["subgroup"];
				end
				
				
				
				
				
				if SuperTreatmentDBF["Unit"]["ExcludeTarget"][name]  then
					checked="|cffffff00√|r";
				else
					checked="";
				end
				
				


				-- 表格内容行
			
				menu:AddLine(
					-- 职业图标
					"icon", "Interface\\WorldStateFrame\\Icons-Classes",
					"tCoordLeft", tc[1],
					"tCoordRight", tc[2],
					"tCoordTop", tc[3],
					"tCoordBottom", tc[4],
					
					"text1", name, "text1R", color.r, "text1G", color.g, "text1B", color.b,
					"text2", UnitRace(unit),
					"text3", subgroup,
					"text4", checked,
					"func", "GlobalQuickSetupExcludeTarget_SelectedTarget", "arg1", self, "arg2", name
				)
				
				
				
				menu:AddLine("text1",stGetClassicon(englishClass,13)..name,
				"textR", color.r, "textG", color.g, "textB", color.b,
				"text2", UnitRace(unit),
				"text3", subgroup,
					
				"checked",SuperTreatmentDBF["Unit"]["ExcludeTarget"][name],
				"func", "GlobalQuickSetupExcludeTarget_SelectedTarget", "arg1", self, "arg2", name
				
				);
				
				menu:AddLine("line",1);
			
			
			
			
			
			
		end
	end
	--]]
	for i, data in pairs(RDB) do
		local unit =data["unit"];
	
		if data["subgroup"]==v then
		
			local color,tc,levelColor,subgroup,checked,Class;
			local name = amGetUnitName(unit,true);
			
			
			
			
			local unit =data["unit"];
			local playerClass, englishClass = UnitClass(unit)
			color = RAID_CLASS_COLORS[englishClass]
			tc = CLASS_BUTTONS[englishClass]
			
			
			--[[
				if data["subgroup"] ==0 then
					subgroup= "";
				else
					subgroup= data["subgroup"];
				end
				--]]
				subgroup = data["subgroup"] ~=0 and data["subgroup"] or "无"
				
				if SuperTreatmentDBF["Unit"]["ExcludeTarget"][name] then
					checked="|cffffff00√|r";
				else
					checked="";
				end
				
				


				-- 表格内容行
				menu:AddLine(
					-- 职业图标
					"icon", "Interface\\WorldStateFrame\\Icons-Classes",
					"tCoordLeft", tc[1],
					"tCoordRight", tc[2],
					"tCoordTop", tc[3],
					"tCoordBottom", tc[4],
					
					"text1", name, "text1R", color.r, "text1G", color.g, "text1B", color.b,
					"text2", UnitRace(unit),
					"text3", subgroup,
					"text4", checked,
					"func", "GlobalQuickSetupExcludeTarget_SelectedTarget", "arg1", self, "arg2", name
				)
			
			
			
			
			
			
		end
	end
			
	
end


function addon:Menu_CreatingInformation(level, value, menu, MenuEx,GlobalLevel)
	
	if level == 3 then -- 3级菜单内容	
	
		if value == "CreatingInformation" then
			
			menu:AddLine("text","创建信息判断" ,"isTitle",1);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			local tbl = SuperTreatmentDBF["Unit"]["IsInfListSet"];
			
			local str = addon:FormatTooltipText("团队首领或助理用 /RW 命令发出的信息。");
			menu:AddLine(						
			"text", "团队通知" ,
			"checked", tbl["CHAT_MSG_RAID_WARNING"],
			"tooltipText",str,
			"func","CreatingInformation_Sys_Set", "arg1", self, "arg2", "CHAT_MSG_RAID_WARNING",
			"tooltipTitle","信息"
			)
			
			local str = addon:FormatTooltipText("团队首领或助理发出的信息。");
			menu:AddLine(						
			"text", "团队管理员" ,
			"checked", tbl["CHAT_MSG_RAID_LEADER"],
			"tooltipText",str,
			"func","CreatingInformation_Sys_Set", "arg1", self, "arg2", "CHAT_MSG_RAID_LEADER",
			"tooltipTitle","信息"
			)
			
			local str = addon:FormatTooltipText("团队普通团员发出的信息。");
			menu:AddLine(						
			"text", "团队普通" ,
			"checked", tbl["CHAT_MSG_RAID"],
			"tooltipText",str,
			"func","CreatingInformation_Sys_Set", "arg1", self, "arg2", "CHAT_MSG_RAID",
			"tooltipTitle","信息"
			)
			
			
			local str = addon:FormatTooltipText("小队首领发出的信息。");
			menu:AddLine(						
			"text", "小队首领" ,
			"checked", tbl["CHAT_MSG_PARTY_LEADER"],
			"tooltipText",str,
			"func","CreatingInformation_Sys_Set", "arg1", self, "arg2", "CHAT_MSG_PARTY_LEADER",
			"tooltipTitle","信息"
			)
			
			local str = addon:FormatTooltipText("小队非首领发出的信息。");
			menu:AddLine(						
			"text", "小队普通" ,
			"checked", tbl["CHAT_MSG_PARTY"],
			"tooltipText",str,
			"func","CreatingInformation_Sys_Set", "arg1", self, "arg2", "CHAT_MSG_PARTY",
			"tooltipTitle","信息"
			)
			
			local str = addon:FormatTooltipText("红字显示在屏幕中间的系统报警错误信息。|r\n如：距离太远、技能没准备好");
			menu:AddLine(						
			"text", "错误提示信息" ,
			"checked", tbl["UI_ERROR_MESSAGE"],
			"tooltipText",str,
			"func","CreatingInformation_Sys_Set", "arg1", self, "arg2", "UI_ERROR_MESSAGE",
			"tooltipTitle","信息"
			)
			
			local str = addon:FormatTooltipText("你收到的密语信息");
			menu:AddLine(						
			"text", "密语" ,
			"checked", tbl["CHAT_MSG_WHISPER"],
			"tooltipText",str,
			"func","CreatingInformation_Sys_Set", "arg1", self, "arg2", "CHAT_MSG_WHISPER",
			"tooltipTitle","信息"
			)
			
			local str = addon:FormatTooltipText("带有持续时间的技能或法术，如德鲁伊的愈合，术士的腐蚀术等，每一跳的效果名称作为要判断的信息(Buff名称)");
			
			menu:AddLine(						
			"text", "持续时间的" ,
			"checked", tbl["UNIT_COMBAT"],
			"tooltipText",str,
			"func","CreatingInformation_Sys_Set", "arg1", self, "arg2", "UNIT_COMBAT",
			"tooltipTitle","信息"
			)
			
			local str = addon:FormatTooltipText("被激活的技能，如：压制、胜利冲锋这些技能");
			menu:AddLine(						
			"text", "被激活的技能" ,
			"checked", tbl["COMBAT_TEXT_UPDATE"],
			"tooltipText",str,
			"func","CreatingInformation_Sys_Set", "arg1", self, "arg2", "COMBAT_TEXT_UPDATE",
			"tooltipTitle","信息"
			)
			
			local str ="接受技能请求命令,比如你的队友发出请求技能的信息。|r"
			str = str .. "\n\n|cff00ffff格式1: |r@R_通讯密码_目标名称_技能名称_是否打断当前技能"
			str = str .. "\n\n|cffff0000@R_2011_小白_驱散魔法_1|r"
			str = str .. "\n|cffffff00小白请求你立刻打断技能对他施放驱散魔法,通讯密码是2011。|r"
			str = str .. "\n\n|cffff0000@R_2011_小白_驱散魔法_0|r"
			str = str .. "\n|cffffff00小白请求你对他施放驱散魔法,通讯密码是2011。|r"
			
			str = str .. "\n\n|cff00ffff格式2: |r@R_通讯密码_宏"
			str = str .. "\n\n|cffff0000@R_2011_/stopcasting\\n/cast [target=小白]驱散魔法|r"
			str = str .. "\n|cffffff00小白请求你立刻打断技能对他施放驱散魔法宏,通讯密码是2011。|r"
			str = str .. "\n\n|cffff0000@R_2011_/cast [target=小白]驱散魔法|r"
			str = str .. "\n|cffffff00小白请求你对他施放驱散魔法宏,通讯密码是2011。|r"
			
			str = str .. "\n\n注意:\n要把【接受插入命令】菜单选项选择。\n该功能只能接收密语，所以要把【密语】菜单选择。|r"
			
			str = str .. "\n\n通讯密码:\n当密码符合时才会接受命令，\n避免恶意发命令检测你是否在用GC,所以密码不要太简单。"
			
			
			str = addon:FormatTooltipText(str);
			menu:AddLine(						
			"text", "接受技能请求命令及通讯密码" ,
			"checked", tbl["ReceiverSpellRequest"],
			"tooltipText",str,
			"func","CreatingInformation_Sys_Set", "arg1", self, "arg2", "ReceiverSpellRequest",
			"tooltipTitle","信息",
			"hasEditBox", 1, "editBoxText", tbl["ReceiverSpellRequestPass"], "editBoxFunc",
			"CreatingInformation_SetCommunicationPass", "editBoxArg1", self
			);
			
			
			
			
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			local str = "|cff00ff00请确认新名称不在列表中。"
			
			
			menu:AddLine("text", "|cff00ffff新建信息判断","hasEditBox", 1, "editBoxText", self.text, "editBoxFunc",
			"CreatingInformation_Add", "editBoxArg1", self,"tooltipText",str,"tooltipTitle","新建")
			menu:AddLine("line",1);
			
			
			for k,v in pairs(SuperTreatmentDBF["Unit"]["IsInfList"]) do
			
				
					local name = v["Name"];
					local xDate="";
					if v["Time"] then
					
						if GetTime() - v["Time"]>10000 then
							xDate = " |cffff0000(|r" .. ">10k" .. "|cffff0000)|r";
						else
							xDate = " |cffff0000(|r" .. format("%.1f",GetTime() - v["Time"]) .. "|cffff0000)|r";
						end
					end
					name = "|cff104E8B" .. k .. ". |cffffffff" .. name .. xDate ;
											
					local str = addon:FormatTooltipText(v["Remarks"].."\n");
					str = str .. "\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键";
					
					menu:AddLine("text", name,"hasArrow", 1, "value", 
					"CreatingInformationA_" .. k,"tooltipText",str,"tooltipTitle","备注",
					"func", "CreatingInformation_Del","arg1", self,"arg2", k
					);
			
				
			end
		end	
		
	elseif level == 4 then -- 4级菜单内容	
	
		local V = addon:DecompositionValue(value);
		
		if V[1] == "CreatingInformationA" then
			
			V[2] = tonumber(V[2]);
			local tbl = SuperTreatmentDBF["Unit"]["IsInfList"][V[2]];
			
			menu:AddLine("text","名称: " .. tbl["Name"] ,"isTitle",1);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			
			
			local str = tbl["Remarks"] .. "\n\n|cff00ff00请给该条件添加说明。"
			menu:AddLine("text", "备注","hasEditBox", 1, "editBoxText", tbl["Remarks"], "editBoxFunc",
			"CreatingInformation_Remarks", "editBoxArg1", self, "editBoxArg2", tbl,
			"tooltipText",str,"tooltipTitle","备注")
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			
			local str = "|cff00ff00创建判断条件。"
			menu:AddLine("text", "|cff00ffff创建判断条件","hasEditBox", 1, "editBoxText", self.text, "editBoxFunc",
			"CreatingInformationA_Add", "editBoxArg1", self, "editBoxArg2", V[2],
			"tooltipText",str,"tooltipTitle","备注")
			
			menu:AddLine("line",1);
			
			for k,v in pairs(SuperTreatmentDBF["Unit"]["IsInfList"][V[2]]["Condition"]) do
			
				
					local name = v["Name"];
											
					local str = addon:FormatTooltipText(v["Text"] .. "\n\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键");
					
					menu:AddLine("text", "|cff00ff00" .. k .. ". |cffffffff" .. name,"hasArrow", 1, "value", 
					"CreatingInformationB_" .. V[2] .. "_" .. k,"tooltipText",str,"tooltipTitle","信息",
					"func", "CreatingInformationA_Del","arg1", self,"arg2",
					{SuperTreatmentDBF["Unit"]["IsInfList"][V[2]]["Condition"],k}
					);
								
			end
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			local str = addon:FormatTooltipText("当前菜单的条件都是按并且关系判断，条件数目不限制，条件无打钩选项，任何情况下条件都会在运行中也无法停止所以没必要的条件请清理掉，以免影响系统速度造成卡机。");
						
			menu:AddLine("text", "|cff00ff00帮助","tooltipText",str,"tooltipTitle","帮助","icon","Interface\\Icons\\INV_Misc_QuestionMark");
		end
		
	elseif level == 5 then -- 5级菜单内容	
	
		local V = addon:DecompositionValue(value);
		
		if V[1] == "CreatingInformationB" then
			
			V[2] = tonumber(V[2]);
			V[3] = tonumber(V[3]);
			
			local tbl = SuperTreatmentDBF["Unit"]["IsInfList"][V[2]]["Condition"][V[3]];
			
			menu:AddLine("text","名称: " .. tbl["Name"] ,"isTitle",1);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			local str = tbl["Text"] .. "\n\n|cff00ff00请给该条件添加要搜索信息的关键字。"
			menu:AddLine("text", "添加搜索关键字","hasEditBox", 1, "editBoxText", tbl["Text"], "editBoxFunc",
			"CreatingInformationB_SetFindText", "editBoxArg1", self,
			"editBoxArg2",SuperTreatmentDBF["Unit"]["IsInfList"][V[2]]["Condition"][V[3]],
			"tooltipText",str,"tooltipTitle","信息"
			);
			menu:AddLine("line",1);
			
			local str = addon:FormatTooltipText("当选择时，关键字被视作普通字串, 在进行查找时, 所有其中的转义符和功能文字全部视作普通文本。反之按Lua配对搜索，请参考string.find函数的使用。");
			menu:AddLine(						
			"text", "纯文字判断" ,
			"checked", tbl["Plain"],
			"tooltipText",str,
			"func","CreatingInformationB_Plain_checked", "arg1", self, "arg2", tbl,
			"tooltipTitle","信息"
			)
			
			menu:AddLine("line",1);
			local str ="设定被搜索文字的开始位置，配合结束位置可以确定搜索的范围使您更好的获得精确的判断。"
			
			str = str .. "\n\n|cffff0000注意:英文字母是按1个字来计算，汉字是按3个字来计算。"
			str = str .. "\n|r无效的目标 = 15个字"
			str = str .. "\n|r无效的目标abcd = 19个字"
			str = addon:FormatTooltipText(str);
			
			menu:AddLine("text", "|cffffffff要判断的开始位置(|cffff0000" .. tbl["Init"]  .."|cffffffff)" , 
			"hasSlider", 1, "sliderValue",  tbl["Init"], "sliderMin", 1, "sliderMax", 500, "sliderStep", 1, "sliderFunc",
			"CreatingInformationB_SetInit" , "sliderArg1", self,"sliderArg2", tbl,
			"tooltipTitle","信息","tooltipText",str
			);
			
			menu:AddLine("line",1);
			
			local str = "设定被搜索文字的结束位置，配合开始位置可以确定搜索的范围使您更好的获得精确的判断。|r\n当设定为0时将不判断结束位置。";
			str = str .. "\n\n|cffff0000注意:英文字母是按1个字来计算，汉字是按3个字来计算。"
			str = str .. "\n|r无效的目标 = 15个字"
			str = str .. "\n|r无效的目标abcd = 19个字"
			
			str = addon:FormatTooltipText(str);			
			menu:AddLine("text", "|cffffffff要判断的结束位置(|cffff0000" .. tbl["End"]  .."|cffffffff)" , 
			"hasSlider", 1, "sliderValue",  tbl["End"], "sliderMin", 0, "sliderMax", 500, "sliderStep", 1, "sliderFunc",
			"CreatingInformationB_SetEnd" , "sliderArg1", self,"sliderArg2", tbl,
			"tooltipTitle","信息","tooltipText",str
			);
					
		
		end
	
	end
end


function addon:CreatingInformation_Del(v)
	
	
	if IsControlKeyDown() and IsAltKeyDown() then
		table.remove(SuperTreatmentDBF["Unit"]["IsInfList"],v) 
		
		SuperTreatmentDBF["Unit"]["IsInfListIndex"]={};
	
		for k,t in pairs(SuperTreatmentDBF["Unit"]["IsInfList"]) do
			
			SuperTreatmentDBF["Unit"]["IsInfListIndex"][t["Name"]]=k;
					
		end
	
		DropDownMenu:Refresh(3);
		return;
			
	end
	
end


function addon:CreatingInformation_Add(v)
	
	
	for k,t in pairs(SuperTreatmentDBF["Unit"]["IsInfList"]) do
		
		if t["Name"] == v then
			print("|cffff0000创建失败，相同名称已经存在！")
			return;
		end
		
	end
	
	local TBL={};
	TBL["Remarks"]="";
	TBL["Name"]=v;
	TBL["Condition"]={};
	TBL["Time"]=nil;
	
	table.insert(SuperTreatmentDBF["Unit"]["IsInfList"], TBL);
	
	SuperTreatmentDBF["Unit"]["IsInfListIndex"]={};
	
	for k,t in pairs(SuperTreatmentDBF["Unit"]["IsInfList"]) do
		
		SuperTreatmentDBF["Unit"]["IsInfListIndex"][t["Name"]]=k;
				
	end
	
	DropDownMenu:Refresh(3)	;
	
end


function addon:CreatingInformationA_Add(v,v1)
	
		
	for k,t in pairs(SuperTreatmentDBF["Unit"]["IsInfList"][v]["Condition"]) do
		
		if t["Name"] == v1 then
			print("|cffff0000创建失败，相同名称条件已经存在！")
			return;
		end
		
	end
	
	local TBL={};
	TBL["Text"]="";
	TBL["Name"]=v1;
	TBL["Init"]=1;
	TBL["End"]=0;
	TBL["Plain"]=true;
	
	
	
	table.insert(SuperTreatmentDBF["Unit"]["IsInfList"][v]["Condition"], TBL);
	DropDownMenu:Refresh(4)	;
	
end

function addon:CreatingInformationA_Del(v)
	
	
	if IsControlKeyDown() and IsAltKeyDown() then
		table.remove(v[1],v[2]) 
		DropDownMenu:Refresh(4);
		return;
			
	end
	
end

function addon:CreatingInformationB_SetFindText(v,v1)
	
	v["Text"]=v1;	
	DropDownMenu:Refresh(4)	;
	
end


function addon:CreatingInformationB_Plain_checked(v,v1)
	
	v["Plain"]=not v["Plain"];	
	DropDownMenu:Refresh(5)	;
	
end


function addon:CreatingInformationB_SetInit(v,v1)
	
	v["Init"]=v1;	
	DropDownMenu:Refresh(5)	;
	
end

function addon:CreatingInformationB_SetEnd(v,v1)
	
	v["End"]=v1;	
	DropDownMenu:Refresh(5)	;
	
end

function addon:CreatingInformation_Sys_Set(v)
	
	local tbl = SuperTreatmentDBF["Unit"]["IsInfListSet"];
	tbl[v] = not tbl[v];
	
	if tbl[v] and v == "ReceiverSpellRequest" then
		tbl["CHAT_MSG_WHISPER"] = true;
		ST_UpUnitFrame:RegisterEvent("CHAT_MSG_WHISPER");
		
	end
	
	if tbl[v] then
		ST_UpUnitFrame:RegisterEvent(v);
	else
		ST_UpUnitFrame:UnregisterEvent(v);
	end
	
	DropDownMenu:Refresh(3)	;
	
end



function addon:CreatingInformation_Remarks(v,v1)
	
	v["Remarks"]=v1;	
	DropDownMenu:Refresh(3)	;
	
end

function addon:CreatingInformation_SetCommunicationPass(v)
	
	SuperTreatmentDBF["Unit"]["IsInfListSet"]["ReceiverSpellRequestPass"]=v;	
	DropDownMenu:Refresh(3)	;
	
end



function addon:ExportProcessing(ori_tab)


	local tab = th_table_dup(ori_tab);
		
	for k, data in pairs(tab["Unit"]["RaidList"]) do
		
		if data["subgroup"] ~= -2 then
			tab["Unit"]["RaidList"][k]=nil;
			
		end
		
	
	end
	
	return tab;
	
end

function addon:GlobalQuickSetupSetCustomMT_checked(v)

	SuperTreatmentDBF["Unit"]["MTList"]["TypeChecked"]=v;
	DropDownMenu:Refresh(2)	;
end


function am_mss(unit,dbf)

	
	
	local spell,_,_,_,startTime,endTime,_,_,notInterruptible  = UnitCastingInfo(unit);
	
	if not spell then
	
		spell,_,_,_,startTime,endTime,_,notInterruptible  = UnitChannelInfo(unit);
	end
	

	if not spell then
		return false;
	end
	
	
	
	local StartTime =GetTime() - (startTime/1000);
	local EndTime = (endTime/1000) - GetTime() ;
	
	
	
	
	local IsStart,IsEnd,IsNotInterrupt = true,true,true;

	
	if dbf["AllSpell"] then
		
		if  dbf["NotInterrupt"]=="No" and not notInterruptible then
			return false
			
		elseif  dbf["NotInterrupt"]=="Yes" and notInterruptible then
			return false
					
		end
		
		if dbf["Cd"]["Start"]["Checked"] then
			IsStart = StartTime >= dbf["Cd"]["Start"]["Value"];
		end
		
		if dbf["Cd"]["End"]["Checked"] then
			IsEnd = EndTime <= dbf["Cd"]["End"]["Value"];
		end
		
		return IsEnd and IsStart;
	end
	
	
	
	for k,v in pairs(dbf["Spell"]) do
	
		local Name = GetSpellInfo(v.SpellId) or false;
		
		if Name then
		
			IsStart,IsEnd,IsNotInterrupt = true,true,true;
			
			if v["Checked"] and spell == Name then
			
		
			
				if  (v["NotInterrupt"]=="No" and notInterruptible) or 
				(v["NotInterrupt"]=="Yes" and not notInterruptible) or 
				v["NotInterrupt"]=="All" or v["NotInterrupt"]==nil then
					
										
					if v["Cd"]["Start"]["Checked"] then
						IsStart = StartTime >= v["Cd"]["Start"]["Value"];
					end
					
					if v["Cd"]["End"]["Checked"] then
						IsEnd = EndTime <= v["Cd"]["End"]["Value"];
					end
					
					if IsEnd and IsStart then
						return true;
					end
				end
				
			end
		end
	
	end
	
	
	return false;
	
	

end




function addon:GlobalQuickSetupDelMT_checked(v)
	
	
	if IsControlKeyDown() and IsAltKeyDown() then
		SuperTreatmentDBF["Unit"]["MTList"]["Custom"][v] = "MT"..v;
		
		
			
	end
	
	DropDownMenu:Refresh(2);
	DropDownMenu:Refresh(4);

end

function am0st(t)
	local t={};
	
	local _, _, offset, numSpells = GetSpellTabInfo(2);
	for i=1 , offset+numSpells do
		local spellName, spellSubName = GetSpellInfo(i, BOOKTYPE_SPELL);
		if spellName then
			local _ ,spellId = GetSpellBookItemInfo(i, BOOKTYPE_SPELL);
			local Spell = GetSpellInfo(spellId);
			if spellName ~= Spell then
				t[spellName]={};
				
				local spellIdEx = tonumber(select(3, string.find(GetSpellLink(i, BOOKTYPE_SPELL), "spell:(%d+)")));
				t[spellName]["name"]=Spell;
				t[spellName]["spellId"]=spellId;
				t[spellName]["spellIdEx"]=spellIdEx;
			end
		end
	end
	amSpellConversionTbl=t;
	return t;
	
end

function amseo(spell) 
	local currentCharges, maxCharges, timeLastCast, cooldownDuration = GetSpellCharges(spell);
	local t= GetTime() - timeLastCast;
	if t<=0 then
		return 0,currentCharges,maxCharges,cooldownDuration;
	else
		return cooldownDuration-t,currentCharges,maxCharges,cooldownDuration;
	end 
end

function addon:GlobalQuickSetupSetMT_Add(T,v,menu)

	for i, data in pairs(RDB) do
		local unit =data["unit"];
	--MT--
		if data["subgroup"]== v then
		
			local color,tc,levelColor,subgroup,checked,Class;
			local name = amGetUnitName(unit,true);
			
			if name then
			
			
				local unit =data["unit"];
				local playerClass, englishClass = UnitClass(unit)
				color = RAID_CLASS_COLORS[englishClass]
				tc = CLASS_BUTTONS[englishClass]
				
				
				--[[
					if data["subgroup"] ==0 then
						subgroup= "";
					else
						subgroup= data["subgroup"];
					end
					--]]
					subgroup = data["subgroup"] ~=0 and data["subgroup"] or "无"
					checked="";
					local MT = SuperTreatmentDBF["Unit"]["MTList"];
					for k, data in pairs(MT["Custom"]) do
						
						if data == name then
							checked="|cffffff00√|r";
							break;
						end
						
					end
					--[[
					if SuperTreatmentDBF["Unit"]["ExcludeTarget"][name]  then
						checked="|cffffff00√|r";
					else
						checked="";
					end
					--]]
					


					-- 表格内容行
					menu:AddLine(
						-- 职业图标
						"icon", "Interface\\WorldStateFrame\\Icons-Classes",
						"tCoordLeft", tc[1],
						"tCoordRight", tc[2],
						"tCoordTop", tc[3],
						"tCoordBottom", tc[4],
						
						"text1", name, "text1R", color.r, "text1G", color.g, "text1B", color.b,
						"text2", UnitRace(unit),
						"text3", subgroup,
						"text4", checked,
						"func", "GlobalQuickSetupSetMT_checked", "arg1", self, "arg2", {T,name}
					)
				
			else
					
					-- 表格内容行
					menu:AddLine(
						-- 职业图标
						
						
						"text", name,
						"func", "GlobalQuickSetupSetMT_checked", "arg1", self, "arg2", {T,name}
					)
					
			end
				
			
			
			
			
		end
	end
	
end


function addon:ProgramSetupExcludedGroup_Checked(v)
	

	v["ExcludedGroupChecked"] = not v["ExcludedGroupChecked"];
	
	DropDownMenu:Refresh(2);

end

function addon:ProgramSetupExcludeTarget_Checked(v)
	

	v["ExcludeTargetChecked"] = not v["ExcludeTargetChecked"];
	
	DropDownMenu:Refresh(2);

end

function addon:ProgramSetupExcludeMT_Checked(v)
	

	v["ExcludeMTChecked"] = not v["ExcludeMTChecked"];
	
	DropDownMenu:Refresh(2);

end





function addon:ProgramSetupWaitSpellCastComplete_Checked(v)
	

	v["WaitSpellCastComplete"] = not v["WaitSpellCastComplete"];
	
	DropDownMenu:Refresh(2);

end


function addon:EditProgramName(v,v1)

	v["name"]=v1;
	DropDownMenu:Refresh(1);

end


function addon:CopyCastProgram(v,v1)

	SuperTreatmentInf["Copyexchange"]["CastProgram"]=th_table_dup(v);
	DropDownMenu:Refresh(1);

end

function addon:CopySpellProgram(v,v1)

	SuperTreatmentInf["Copyexchange"]["SpellProgram"]=th_table_dup(v);
	DropDownMenu:Refresh(1);

end

function addon:CopySpellProgramCondition(v)

	SuperTreatmentInf["Copyexchange"]["CopySpellProgramCondition"]=v;
	DropDownMenu:Refresh(1);

end

function addon:CopySpellProgramTargetCondition(v)

	SuperTreatmentInf["Copyexchange"]["CopySpellProgramTargetCondition"]=v;
	DropDownMenu:Refresh(3);

end


function addon:PasteSpellProgram(v,v1)
	
	local TBL = th_table_dup(SuperTreatmentInf["Copyexchange"]["SpellProgram"]);
	if type(v)=="table" then
		table.insert(v[1],v[2], TBL)
	else
		table.insert(v, TBL)
	end
	
	
	DropDownMenu:Refresh(1);

end

function addon:PasteCastProgram(v,v1)
	
	local TBL = th_table_dup(SuperTreatmentInf["Copyexchange"]["CastProgram"]);
	TBL["name"] = TBL["name"] .. "(新粘贴的方案请修改名称)";
	table.insert(v[1],v[2], TBL)
	
	
	
	DropDownMenu:Refresh(1);

end

function addon:PasteSpellProgramTargetCondition(v,v1)
	
	local TBL = th_table_dup(SuperTreatmentInf["Copyexchange"]["CopySpellProgramTargetCondition"]);
	
	table.insert(v, TBL)
	
	
	
	DropDownMenu:Refresh(3);

end

function addon:PasteSpellProgramCondition(v,v1)
	
	local TBL = th_table_dup(SuperTreatmentInf["Copyexchange"]["CopySpellProgramCondition"]);
	
	table.insert(v, TBL)
	
	
	
	DropDownMenu:Refresh(4);

end


function addon:AddOnMemorySetMaxChecked()
	
	SuperTreatmentDBF["AddOnMemory"]["on"]= not SuperTreatmentDBF["AddOnMemory"]["on"];
	DropDownMenu:Refresh(2);
end


function addon:AddOnMemorySetMax(tbl,v)

	tbl["max"]= v;
	DropDownMenu:Refresh(2)	;
end

function addon:KillAddOnMemoryChecked()
	UpdateAddOnMemoryUsage() ;
	local n = gcinfo() ;
	collectgarbage('collect')
	UpdateAddOnMemoryUsage() ;
	DEFAULT_CHAT_FRAME:AddMessage("|cff00ffff回收内存 |cffff0000" .. n - gcinfo() .. " kb" )
	DropDownMenu:Refresh(2);
end

function addon:AddOnMemorySetLeftfightingChecked()
	
	SuperTreatmentDBF["AddOnMemory"]["Leftfighting"]= not SuperTreatmentDBF["AddOnMemory"]["Leftfighting"];
	DropDownMenu:Refresh(2);
end


function addon:AddOnMemoryInfChecked()
	
	SuperTreatmentDBF["AddOnMemory"]["inf"]= not SuperTreatmentDBF["AddOnMemory"]["inf"];
	DropDownMenu:Refresh(2);
end

function addon:Menu_FastLoadingProject(level, value, menu, MenuEx,GlobalLevel)
	
	if level == 2 then -- 2级菜单内容
	
		if value == "FastLoadingProject" then
		
			
			for i,v in pairs(SuperTreatmentAllDBF["Programs"]) do
				
				if v["Mark"] and SuperTreatmentDBF["Mark"]==v["Mark"] then
					
					menu:AddLine("text", i .. ". ".. v["name"],"disabled",1,"notCheckable",1)
									
				else
					local str = addon:FormatTooltipText(v["Remark"]);
					str = str .. "\n点击加载方案";
					menu:AddLine("text", "|cff104E8B" .. i .. ". |r".. v["name"] ,
					"func", "SysProgramsDefault_List_Edit","arg1", self,"arg2",{SuperTreatmentAllDBF["Programs"],i},
					"tooltipText",str,"tooltipTitle","加载方案","notCheckable",1);
				end
				
				menu:AddLine("line",1);
			end
			
			
		end
	
	end

end


function addon:show_GC_checked(v)
	if WowAmMinimapButton:IsShown() then
		WowAmMinimapButton:Hide();
	
	else
		WowAmMinimapButton:Show();
	end
	DropDownMenu:Refresh(2);
	
end

function addon:show_Hide_StInf_checked(v)
	
	SuperTreatmentAllDBF.show_Hide_StInf = not SuperTreatmentAllDBF.show_Hide_StInf
	DropDownMenu:Refresh(2);
end


function addon:SimpleModel_checked()
	
	SuperTreatmentFrame:Hide();
	WowStHelperFrame_Show();
	
end

-------------------------------------------------

function addon:CastingSpellStartOrEnd_Start_checked(v)

	v["checked"] = not v["checked"];
	DropDownMenu:Refresh(4);
	
end

function addon:CastingSpellStartOrEnd_Start_isRadio(v,v1)
	
	v[1]["isRadio"]= v[2];
	DropDownMenu:Refresh(4);
		
end

function addon:CastingSpellStartOrEnd_Start_Edit(v,v1)

	v["script"]=v1;
	DropDownMenu:Refresh(4);
	
end

function addon:CastingSpellStartOrEnd_Start_Chat_isRadio(v,v1)
	
	v[1]["Chat"]["isRadio"]= v[2];
	DropDownMenu:Refresh(5);
		
end
 
function addon:CastingSpellStartOrEnd_Start_Chat_Edit(v,v1)
	
	v["Chat"]["text"]=v1;
	
	DropDownMenu:Refresh(5);
	
	
	
end

function addon:CastingSpellStartOrEnd_Start_Chat_channelvalue(v,v1)
	
	v["Chat"]["channel"]=v1;
	
	DropDownMenu:Refresh(5);

end
-----------------------------------------------------

function addon:CastingSpellStartOrEnd_checked(v)

	v["checked"] = not v["checked"];
	DropDownMenu:Refresh(3);
	
end

function addon:NoAcChecked(v)

	v["NoAcChecked"] = not v["NoAcChecked"];
	DropDownMenu:Refresh(3);
	
end
	
function addon:CastingSpellStartOrEnd_End_checked(v)

	v["checked"] = not v["checked"];
	DropDownMenu:Refresh(4);
	
end



----------------
function addon:CastingSpellStartOrEnd_Start_ChatChecked(v)
	
	v["ChatChecked"]= not v["ChatChecked"];
	DropDownMenu:Refresh(4);
		
end

function addon:CastingSpellStartOrEnd_Start_ScriptChecked(v)
	
	v["ScriptChecked"]= not v["ScriptChecked"];
	DropDownMenu:Refresh(4);
		
end

function addon:CastingSpellStartOrEnd_Start_SpellChecked(v)

	v["SpellChecked"] = not v["SpellChecked"];
	DropDownMenu:Refresh(3);
	
end
-------------------

function addon:CastingSpellStartOrEnd_End_ChatChecked(v)
	
	v["ChatChecked"]= not v["ChatChecked"];
	DropDownMenu:Refresh(4);
		
end

function addon:CastingSpellStartOrEnd_End_ScriptChecked(v)
	
	v["ScriptChecked"]= not v["ScriptChecked"];
	DropDownMenu:Refresh(4);
		
end


function addon:CastingSpellStartOrEnd_End_Edit(v,v1)

	v["script"]=v1;
	DropDownMenu:Refresh(4);
	
end

function addon:CastingSpellStartOrEnd_Start_Chat_isRadio(v,v1)
	
	v[1]["Chat"]["isRadio"]= v[2];
	DropDownMenu:Refresh(5);
		
end

function addon:CastingSpellStartOrEnd_Start_Chat_Edit(v,v1)
	
	v["Chat"]["text"]=v1;
	
	DropDownMenu:Refresh(5);
	
	
	
end

function addon:CastingSpellStartOrEnd_Start_Chat_channelvalue(v,v1)
	
	v["Chat"]["channel"]=v1;
	
	DropDownMenu:Refresh(5);

end

function addon:CastingSpellStartOrEnd_Start_DelayValue(v,v1)
	
	v["DelayValue"]=tonumber(format("%.1f",v1));
	
	DropDownMenu:Refresh(3);

end


function addon:CastingSpellStartOrEndStartSpell_AddSpell(i,v)

		
	
	
	local infoType,info1,info2=GetCursorInfo();
	
	
	local index;
	local TBL = {};
	
	
	
	
	if infoType then
		
		
		
		if infoType=="item" then
			
			local spellId=info1;
			local name,itemLink,itemRarity,itemLevel,itemMinLevel,itemType,itemSubType,itemStackCount,itemEquipLoc,Texture,itemSellPrice;
			
			--print(infoType,info1,info2)
			
				--_,_,_,_,spellId,_,_,_,_,_,_,_,_,_=string.find(info2,"|?c?f?f?(%x*)|?H?([^:]*):?(%d+):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%-?%d*):?(%-?%d*):?(%d*)|?h?%[?([^%[%]]*)%]?|?h?|?r?")
				name,itemLink,itemRarity,itemLevel,itemMinLevel,itemType,itemSubType,itemStackCount,itemEquipLoc,Texture,itemSellPrice=GetItemInfo(spellId);
			
			
			
			
			if type(spellId) == "string" then
				spellId = tonumber(spellId);
			end
			
			TBL["spellId"]=spellId;
			TBL["Type"]=infoType;
			TBL["itemLink"]=itemLink;
			TBL["Texture"]=Texture;
			TBL["Rank"]=itemSubType;
			TBL["checked"]=true;
			TBL["Targets"]={};
			TBL["unit"]="nogoal";
			TBL["Target"]=RDB["nogoal"]["name"];
			TBL["TargetSubgroup"]=-1;
			
			print("|cffffff00添加物品|r" .. itemLink,"|cffffff00Id:|r"..spellId);
			print("|cffff0000注意:|r施放目标为|cff00ff00" .. TBL["Target"].."|r请不要随意改变。");	
		
		elseif infoType=="spell"  then
			
			local spellLink,spellName,spellRank,spellId,Texture;
			
							
				if GetCursorInfo() or "AddToSpell" == i then
				
					
					_,spellId = GetSpellBookItemInfo(info1,"player");
					
					
				else
					
					spellId = info1;
				
				end
				
				spellName,spellRank,Texture = GetSpellInfo(spellId);
				spellLink,_=GetSpellLink(spellId);
				
				
				
			if not spellLink then
				return;
			end
				
			if type(spellId) == "string" then
				spellId = tonumber(spellId);
			end
			
			
			
			TBL["spellId"]=spellId;
			TBL["Type"]=infoType;
			TBL["itemLink"]=spellLink;
			TBL["Texture"]=Texture;
			TBL["Rank"]=spellRank;
			TBL["checked"]=true;
			TBL["Targets"]={};
			TBL["DelayChecked"]=false;
			TBL["DelayValue"]=0;
			print("|cffffff00添加技能|r" .. spellLink,"|cffffff00Id:|r"..spellId);
			
			if amIsNoSpellTarget and amIsNoSpellTarget(spellId) then
				TBL["unit"]="nogoal";
				TBL["Target"]=RDB["nogoal"]["name"];
				TBL["TargetSubgroup"]=-1;
				print("|cffff0000注意:|r施放目标为|cff00ff00" .. TBL["Target"].."|r请不要随意改变。");
			
				
			end
			
			
		end
		
		
		table.insert(i["spell"], TBL)
		ClearCursor();
		DropDownMenu:Refresh(3);	
		
		
		
	end
	

		
end

function addon:CastingSpellStartOrEndStartSpell_EditSpell(i)

	
	
	
	if IsControlKeyDown() and IsAltKeyDown() then
		addon:CastingSpellStartOrEndStartSpell_DEL(i);
		
		return;
		
	elseif IsControlKeyDown() then
		addon:CastingSpellStartOrEndStartSpell_Up(i);
		
		return;
		
	elseif IsAltKeyDown() then
		addon:CastingSpellStartOrEndStartSpell_Down(i);
		
		return;
	
	end
	
end

function addon:CastingSpellStartOrEndStartSpell_DEL(v)
	
	if v[1][v[2]]["disabled"] then
		
		print("|cffff0000不允许删除基本技能:" .. v[1][v[2]]["itemLink"] )
	
	else
	
		table.remove(v[1], v[2]) 

		--DropDownMenu:Close(3)
		DropDownMenu:Refresh(3)
	
	end
	
	
	
	
end


function addon:CastingSpellStartOrEndStartSpell_Up(v)
	
	local Spells =v[1];
	local i = v[2];
	if i>1 then
	
	local NewTblA = th_table_dup(Spells[i]);
	local NewTblB = th_table_dup(Spells[i-1]);
	
	Spells[i-1]=NewTblA;
	Spells[i]=NewTblB;
	
	DropDownMenu:Refresh(3)
	
	end
	
end


function addon:CastingSpellStartOrEndStartSpell_Down(v)
	
	local Spells =v[1];
	local i = v[2];
	
	local n = #(Spells);
	
	if i<n then
	
	local NewTblA = th_table_dup(Spells[i]);
	local NewTblB = th_table_dup(Spells[i+1]);
	
	Spells[i+1]=NewTblA;
	Spells[i]=NewTblB;

	DropDownMenu:Refresh(3)
	
	end
	
end

function addon:CastingSpellStartOrEndStartSpell_AddMacro(Spells)

	local TBL={};
	TBL["spellId"]=0;
	TBL["Type"]="macro";
	TBL["itemLink"]="[|cffff00ff打断取消技能|r]";
	TBL["Texture"]="Interface\\Icons\\INV_Misc_QuestionMark";
	TBL["Rank"]=nil;
	
	TBL["MacroName"]="打断取消技能";
	TBL["Macro"]="/stopcasting";
	TBL["Remarks"]="";
	TBL["name"]="";
	TBL["subgroup"]=-3;
	TBL["unit"]="Target";
	TBL["Target"]="当前目标";
	TBL["raidn"]=-3;
	TBL["TargetSubgroup"]=-1;
		
	table.insert(Spells, TBL);
	DropDownMenu:Refresh(3)		
end


function addon:FileImportScheme_Add(tbl)
	
	tbl["Import"]=false;
	tbl["name"]="[导入]" .. tbl["name"];		
	stRefreshMark(tbl);
	table.insert(SuperTreatmentAllDBF["Programs"], tbl);
	addon:SuperTreatmentDBF_up();
	print("|cff00ff00方案 |cffff0000" .. tbl["name"] .. " |cff00ff00导入成功！,请确认及修改名称。")
	
	
	DropDownMenu:Refresh(2)
		
	
end

function addon:CastOffSchem_Checked(v)
	

	v["CastOffSchem"] = not v["CastOffSchem"];
	
	DropDownMenu:Refresh(2);

end

function addon:CastOffSchemEnd_Checked(v)
	

	v["CastOffSchemEnd"] = not v["CastOffSchemEnd"];
	
	DropDownMenu:Refresh(2);

end


function addon:CastingSpell_Checked(v)
	

	v["Checked"] = not v["Checked"];
	
	DropDownMenu:Refresh(2);

end

function addon:TblToMacro(Spells,Macro)
	
	local temp="";
	
	if not Spells then return "";end
	
	for i, data in pairs(Spells) do
						
		local spellId = data["spellId"];
		local spellType = data["Type"];
		local name ;
		
		
		
		if spellType=="item" then
			
			name=GetItemInfo(spellId) or "";
			if data["disabled"] and Macro and Macro ~= "" then
				name="/use " .. Macro .. name ;
			else
				name="/use " .. name ;
			end
		
			
		elseif spellType=="spell" then
		
			name=GetSpellInfo(spellId) or "";
			if data["disabled"] and Macro and Macro ~= "" then
				name="/cast " .. Macro .. name ;
			else
				name="/cast " .. name ;
			end
			
		elseif spellType=="macro" then
		
			name=data["Macro"] or "";					
		end
		
		if i == 1 then
		
			temp = name;
		
		else
			temp = temp .. "\n" .. name;
		end
			

		
	end
	
	return temp;
	
end

addon.SpellBuffInformationFiltering_value="";

function addon:SpellBuffInformationFiltering(v)
	
	addon.SpellBuffInformationFiltering_value=v;
	
	DropDownMenu:Refresh(3);
	
end

function addon:AddTargetLayer(v)
	
	
	
	if IsControlKeyDown() then
		
		v["TargetLayer"] = (v["TargetLayer"] or 0) +1;
		DropDownMenu:Refresh(3);
		
	elseif IsAltKeyDown() then
		
		v["TargetLayer"] = (v["TargetLayer"] or 0) -1;
		
		if v["TargetLayer"] < 0 then
			v["TargetLayer"]=0;
		end
		DropDownMenu:Refresh(3);
	end
	
	
	
	
end


function addon:AmminimumFastAddTargetLayer(v)
	
	
	
	if IsControlKeyDown() then
		
		v["TargetLayer"] = (v["TargetLayer"] or 0) +1;
		DropDownMenu:Refresh(5);
		
	elseif IsAltKeyDown() then
		
		v["TargetLayer"] = (v["TargetLayer"] or 0) -1;
		
		if v["TargetLayer"] < 0 then
			v["TargetLayer"]=0;
		end
		DropDownMenu:Refresh(5);
	end
	
	
	
	
end

function addon:stReloadUI()
 ReloadUI();
 end
 
 
function addon:Menu_SuperTreatmentApiList_B(level, value, menu, MenuEx,GlobalLevel)
	
	
	
	
		
	if level == 3 then -- 级菜单内容
	
		local V = addon:DecompositionValue(value);
		
		if V[1] == "ActionBarInf" then
			
			menu:AddColumnHeader("按钮", "CENTER")
			menu:AddColumnHeader("名称", "LEFT")
			menu:AddColumnHeader("Id", "RIGHT")
			menu:AddColumnHeader("类型", "LEFT")
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			if UnitName("pet") then
			
				for i=1, NUM_PET_ACTION_SLOTS do
				 
				  local name, subtext, Texture, isToken, isActive, autoCastAllowed, autoCastEnabled = GetPetActionInfo(i);
				  
				  amPetGameTooltip = CreateFrame("GameTooltip", "amPetNumberGameTooltipFrame" .. "Tooltip", nil, "GameTooltipTemplate")
					amPetGameTooltip:SetOwner(WorldFrame, "ANCHOR_NONE")
			
			  
				 amPetGameTooltip:ClearLines()  
				 amPetGameTooltip:SetPetAction(i);
				 spellName, spellRank, spellID = amPetGameTooltip:GetSpell() 
				
				local text = _G[amPetGameTooltip:GetName() .. "TextLeft" .. 1]:GetText();
				  
				  
				  --local name, spellId = GetSpellBookItemInfo(i, BOOKTYPE_PET);
				  --local spellName, spellSubName = GetSpellBookItemName(i, BOOKTYPE_PET);
				  --local spellLink = GetSpellLink(i, BOOKTYPE_PET);
				  
				  
				  
				  if name then
					
						local Texture1 = subtext and Texture or _G[Texture];
						if spellID then	
							text = GetSpellLink(spellID);
						else
							text = "[" .. text .. "]";
						end
							
					menu:AddLine("text", "|cff104E8B" .. i,
							"text2","|T" .. (Texture1 or "") .. ":12|t" ..  text .. "|r",
							"text3",spellID or "",
							"text4",spellID and "spell" or "",
							"notCheckable",1,
							"PetSpell",i
							);
					
				  end
				 
				 
				  
				end
				
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			end
			
			for i =1 , 255 do
				local Link,Texture="","";
				local spellType, id, subType, spellID = GetActionInfo(i);
				
				if spellType=="item" then
					_,Link,_,_,_,_,_,_,_,Texture=GetItemInfo(id);
					
				elseif spellType=="spell" or spellType=="companion" then
					Link=GetSpellLink(id);
					_,_,Texture=GetSpellInfo(id);
				
				elseif spellType=="macro" then
					Texture=GetActionTexture(i);
					if type(id) == "string" then
						Link=id;
					elseif GetActionText(i) then
						Link=GetActionText(i);
					end
										
					
				end
				
				if Link and id and id .. "" ~= "0" then
					if spellType=="spell" or spellType=="companion" then
						menu:AddLine("text", "|cff104E8B" .. i,
						"text2","|T" .. Texture .. ":12|t" .. Link .. "|r",
						"text3",id or "nil",
						"text4",spellType or "nil",
						"notCheckable",1,
						"Spell",id
						);
					
					elseif spellType=="item" then
						menu:AddLine("text", "|cff104E8B" .. i,
						"text2","|T" .. Texture .. ":12|t" .. Link .. "|r",
						"text3",id or "nil",
						"text4",spellType or "nil",
						"notCheckable",1,
						"Item",id
						);
					elseif spellType=="macro" then
						
						menu:AddLine("text", "|cff104E8B" .. i,
						"text2","|T" .. Texture .. ":12|t" .. Link .. "|r",
						"text3",id or "nil",
						"text4",spellType or "nil",
						"notCheckable",1
						);
					
					
					end
				
				end
			end
			
			
		elseif V[1] == "SuperTreatmentApiListB" then
		
			
			menu:AddLine("text","函数列表|cffff0000(|cff00ff00滚动鼠标看更多|cffff0000)|r","isTitle",1,
			"notCheckable",1,
			"justifyH","CENTER");
		
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			menu:AddLine("text","判断类函数:","isTitle",1,"notCheckable",1);
			menu:AddLine("line",1,"LineHeight",8);
			
			local api = SuperTreatment["Api"];
			local apiIndex = SuperTreatment["ApiIndex"];
			SuperTreatment["type"]="NoRun";
			
			local i =1;
			
			for k1, data1 in pairs(apiIndex) do
				
				local k = data1;
				local data = api[k];
				
				if SuperTreatment["type"]==data["type"] then
				
					local str = addon:FormatTooltipText("\n" .. data["inf"] .. "\n\n|cffffff00" .. data["Remarks"]);
					local ArgumentsTexts="";
					local Arguments = data["Arguments"];
				
					local Counts = data["Arguments"]["Counts"];
					if Counts==0 then
					
						ArgumentsTexts = "\n|cffff0000参数:|r 无\n"
					else
					
						for n=1,Counts do
							
							
							ArgumentsTexts = ArgumentsTexts .."\n|cffff0000参数".. n .. "(|r" .. TYPEINF[Arguments[n]["type"]] .."|cffff0000):|r\n"  .. Arguments[n]["inf"] .. "\n";
							
						end
						
					end
					
					local ReturnsTexts="";
					local Returns = data["Returns"];
					
					local Counts = data["Returns"]["Counts"];
					if Counts==0 then
					
						ReturnsTexts = "\n|cffff0000返回值:|r 无\n"
					else
					
						for n=1,Counts do
							
							ReturnsTexts = ReturnsTexts .."\n|cffff0000返回值".. n .. "(|r" .. TYPEINF[Returns[n]["type"]] .."|cffff0000):|r\n"  .. Returns[n]["inf"] .. "\n";
							if Returns[n]["Failure"] ~= nil then
								ReturnsTexts = ReturnsTexts .."|cff969696本插件为假时返回: |cffffff00" .. (TYPEINF[tostring(Returns[n]["Failure"])] or tostring(Returns[n]["Failure"])) .. "|r\n";
							end
							
						end
						
					end
					
					ArgumentsTexts = data["inf"] .. "\n" .. ArgumentsTexts .. ReturnsTexts .. "\n|cff00ff00" .. data["Remarks"] .. "|r";
					
					
					menu:AddLine("text","|cff104E8B" .. i .. ". |cffffffff" .. data["inf"],
					"tooltipText",ArgumentsTexts,"tooltipTitle",k,"notCheckable",1
					);
					
					
					
					i=i+1;
					menu:AddLine("line",1);
				end
				
			end
		
			menu:AddLine();
			menu:AddLine("text","执行类函数:","isTitle",1,"notCheckable",1);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			SuperTreatment["type"]="Run";
			
			local i =1;
			
			for k1, data1 in pairs(apiIndex) do
				
				local k = data1;
				local data = api[k];
				
				if SuperTreatment["type"]==data["type"] then
				
					local str = addon:FormatTooltipText("\n" .. data["inf"] .. "\n\n|cffffff00" .. data["Remarks"]);
					local ArgumentsTexts="";
					local Arguments = data["Arguments"];
				
					local Counts = data["Arguments"]["Counts"];
					if Counts==0 then
					
						ArgumentsTexts = "\n|cffff0000参数:|r 无\n"
					else
					
						for n=1,Counts do
							
							
							ArgumentsTexts = ArgumentsTexts .."\n|cffff0000参数".. n .. "(|r" .. TYPEINF[Arguments[n]["type"]] .."|cffff0000):|r\n"  .. Arguments[n]["inf"] .. "\n";
							
						end
						
					end
					
					local ReturnsTexts="";
					local Returns = data["Returns"];
					
					local Counts = data["Returns"]["Counts"];
					if Counts==0 then
					
						ReturnsTexts = "\n|cffff0000返回值:|r 无\n"
					else
					
						for n=1,Counts do
							
							ReturnsTexts = ReturnsTexts .."\n|cffff0000返回值".. n .. "(|r" .. TYPEINF[Returns[n]["type"]] .."|cffff0000):|r\n"  .. Returns[n]["inf"] .. "\n";
							
						end
						
					end
					
					ArgumentsTexts = data["inf"] .. "\n" .. ArgumentsTexts .. ReturnsTexts .. "\n|cff00ff00" .. data["Remarks"] .. "|r";
					
					
					menu:AddLine("text","|cff104E8B" .. i .. ". |cffffffff" .. data["inf"],
					"tooltipText",ArgumentsTexts,"tooltipTitle",k,"notCheckable",1
					);
					
					
					
					i=i+1;
					menu:AddLine("line",1);
				end
				
			end
		
		


		
		end
	
	end

end

--WowBeeScriptEditerFrame:Bind(self.SchemeInfo,self.SchemeInfo.Items[index])

function addon:ScriptEdit(v,v1)
	
	v[1]["type"]=v[2];
	WowStScriptEditerFrame:Bind(self,v[1],v[1])
	DropDownMenu:Close(1);
end

function addon:ScriptEdit_checked(v,v1)
	
	v[1]["type"]=v[2];
	DropDownMenu:Refresh(3);
end

function addon:IsCustomizeMacro(id)
	
	--SuperTreatmentDBF["Spells"]["List"][1]["spell"][5]["MacroName"]
	if not id then return; end;
	
	for a,v in pairs(SuperTreatmentDBF["Spells"]["List"]) do
		
		for b,v1 in pairs(v["spell"]) do
			
			if v1["id"] == id then
				return true;
			end
			
		end
		
	end
	
		
	
end


function addon:AddScriptAssist(v)
	
	local succ,tbl=SerializerLib:Deserialize(v);
	if succ then
		if tbl.Name and tbl.Items then
			
			local t = date("%Y/%m/%d %H:%M:%S");
			
			for i,data in pairs(tbl.Items) do
			
				local dbl={};
				dbl["name"]= tbl.Name .. "-" .. data.Name .. "(" .. t ..")";
				dbl["Macro"]=data["Script"];
				dbl["Remarks"]=data["Description"];
				dbl["type"] = "script";
				dbl["Texture"] = data["Icon"];
				dbl["id"]= i .. time() .. "-" .. GetTime();
				table.insert(SuperTreatmentDBF["Macro"],dbl);
			
			end
			
			print( "|cff00ff00" .. tbl.Name .."|r，导入成功！");	
			DropDownMenu:Refresh(3);
		end
		
	else
		
		print( "|cffff0000导入失败！");
		
	end
	
	
end

function addon:CustomizeMacroListInf_renamed(tbl,v)
	
	for k, data in pairs(SuperTreatmentDBF["Macro"]) do
		
		if data["name"]==v then
			print("|cffff0000[|r" .. v .. "|cffff0000]已经存在，改名失败！")
			return;
		end
	end
	
	tbl["name"]=v;
	
	print( "|cff00ff00改名成功！");	
	DropDownMenu:Refresh(3);

end


function addon:CustomizeMacroListInf_icon(tbl)
	
	DropDownMenu:Close(1);
	WowStFrame.ShowCustomAction(tbl["name"]," ",1,function(self,name,icon,args)
		--lib.List:AddItemCustomed(name,icon,"");
		tbl["Texture"]="INTERFACE\\ICONS\\" .. icon;
		
		--DropDownMenu:Refresh(3);
	end);

end

function addon:IsRunStrfind(tbl)
	
	local script;
						
	if tbl["id"] then
		
		for k, t in pairs(SuperTreatmentDBF["Macro"]) do

			
			if t["id"] == tbl["id"] then
				script=t["Macro"];
				break;
			end
		end
	else
		
		script = tbl["Macro"];
		
	end
						
	return amfind(script,{"amrun","BeeRun"},-1);

end

function addon:ImportPresetScript(text)

	addon:AddImportProgramText(1,text)
	
end

function addon:print(v)

	print(v)
	
end

function addon:AddOnsImportScheme_add(v)
		
	local temp = th_table_dup(SuperTreatmentDBF);
	
	--local t = date("%Y/%m/%d %H:%M:%S");
	
	--temp["name"]=v["Name"] .. "(" .. t ..")";
	temp["name"]=v["Name"];
	temp["AddOnMemory"]={};
	temp["AddOnMemory"]["max"]=60;
	temp["AddOnMemory"]["on"]=false;
	temp["AddOnMemory"]["Leftfighting"]=false;
	
	temp["AddOnMemory"]["inf"]=false;
	
	temp["Macro"]={};
	temp["Spells"]["NoStopCastingSpells"]={};
	temp["Spells"]["List"]={};
	
	temp["Config"]={};
	temp["CollectionInf"]={};
	temp["CollectionInf"]["Buff_Spell"]={};
	
	temp["Unit"]={};
	temp["Unit"]["ExcludedGroup"]=nil;
	
	temp["Unit"]["IsInfList"]={};
	temp["Unit"]["TeamNumber"]=0;
	
	
	
	temp["Unit"]["RaidList"]={};
	temp["Unit"]["RaidListClass"]={};
	temp["Unit"]["TeamCount"]={};
	temp["Unit"]["CustomizeIndex"]=0;
	temp["Config"]={};
	temp["Spells"]={};
	temp["Spells"]["List"]={};
	
	for i,data in pairs(v.Items) do
		
		local dbl={};
		--dbl["name"]= v.Name .. "-" .. data.Name .. "(" .. t ..")";
		dbl["name"]=data.Name;
		dbl["Macro"]=data["Script"];
		dbl["Remarks"]=data["Description"];
		dbl["type"] = "script";
		dbl["Texture"] = data["Icon"];
		dbl["id"]= i .. time() .. "-" .. GetTime();
		table.insert(temp["Macro"],dbl);
	
	end
	
	local Solution = temp["Spells"]["List"];
	local tbl={};
	
	tbl["name"]=v["Name"] ;
	tbl["Remarks"]="";
	tbl["spell"]={};
	tbl["checked"]=true;
	
	
	
	for i,v in pairs(temp["Macro"]) do
		
		local TBL={};
		TBL["id"] = v["id"];
		TBL["spellId"]=0;
		TBL["Type"]=v["type"];
		TBL["checked"]=true;
		TBL["Targets"]={};
		TBL["DelayChecked"]=false;
		TBL["DelayValue"]=0;
		
		TBL["name"]="";
		TBL["subgroup"]=-3;
		TBL["unit"]="nogoal";
		TBL["Target"]="无目标";
		TBL["raidn"]=-3;
		TBL["TargetSubgroup"]=-1;
		TBL["PropertiesSetChecked"]=4;
		TBL["PropertiesSet_Continue_Checked"]=false;
		
		table.insert(tbl["spell"], TBL);
	
	end
	
	table.insert(Solution,tbl);
	stRefreshMark(temp);
	table.insert(SuperTreatmentAllDBF["Programs"], temp);
	print( "|cff00ff00" .. v["Name"] .."|r，导入成功！");
	DropDownMenu:Refresh(2);

end



function addon:Newscheme(name)
		
	local temp = th_table_dup(SuperTreatmentDBF);
	
	temp.Version = stVersion();
	temp["name"]=name;
	temp["AddOnMemory"]={};
	temp["AddOnMemory"]["max"]=60;
	temp["AddOnMemory"]["on"]=false;
	temp["AddOnMemory"]["Leftfighting"]=false;
	
	temp["AddOnMemory"]["inf"]=false;
	
	temp["Macro"]={};
	temp["Spells"]["NoStopCastingSpells"]={};
	temp["Spells"]["List"]={};
	
	temp["Config"]={};
	temp["CollectionInf"]={};
	temp["CollectionInf"]["Buff_Spell"]={};
	
	temp["Unit"]={};
	temp["Unit"]["ExcludedGroup"]=nil;
	
	temp["Unit"]["IsInfList"]={};
	temp["Unit"]["TeamNumber"]=0;
	
	
	
	temp["Unit"]["RaidList"]={};
	temp["Unit"]["RaidListClass"]={};
	temp["Unit"]["TeamCount"]={};
	temp["Unit"]["CustomizeIndex"]=0;
	temp["Config"]={};
	temp["Spells"]={};
	temp["Spells"]["List"]={};
	temp.Mark =amrandom();
		
	table.insert(SuperTreatmentAllDBF["Programs"], temp);
	print( "|cff00ff00" .. name .."|r，建立成功！");
	DropDownMenu:Refresh(2);

end

function addon:AddSchemeAssist(v)
	
	local succ,tbl=SerializerLib:Deserialize(v);
	if succ then
		if tbl.Name and tbl.Items then
			
			
			addon:AddOnsImportScheme_add(tbl);
		
		end
		
	else
		
		print( "|cffff0000导入失败！");
		
	end
	
	
end



function addon:Default_AddBuff(Value,Text)
	
	
	local id,v,T,ToSpellId;
	if not Text then
		
		T=Value[1]["name"];
		v=Value[3][1];
		id=Value[2];
	
	else
		v=Value;
		T=Text;
	end
	
	
	local Buff = v;
	
	if tonumber(T) then
		
		local tbl ={};
		local Name,_,Texture=GetSpellInfo(tonumber(T));
		
		if Name then
			tbl["SpellId"]=tonumber(T);
			--tbl["Texture"]=Texture;
			--tbl["Name"]=Name;
			table.insert(Buff,tbl);
			ToSpellId=tonumber(T);
		else
			print("|cffff0000添加技能Id(|r" .. T .."|cffff0000)失败!");
		end
			
	else
	
	
		local TV = { strsplit(",",T) }
		for i,h in pairs(TV) do
		
			
			local Texture="";
			local tbl ={};
			local spellid ;
			
			if id then
				spellid = id
				_,_,Texture=GetSpellInfo(spellid)
			else
				local isn = tonumber(h);
				if isn then
					_,_,Texture=GetSpellInfo(isn);
					spellid = isn;
				else
					spellid,_,_,Texture = amfindSpellItemInf(h);
				end
			end
			
			if spellid then
				
				tbl["SpellId"]=spellid;
				table.insert(Buff,tbl)
				ToSpellId=spellid;
				
			else
				
				print("|cffff0000添加技能(|r" .. h .."|cffff0000)失败!");
				
			end
			
		
			--tbl["Texture"]=Texture;
			--tbl["Name"]=h;
			
			
			
		end
	
	end
	
	DropDownMenu:Refresh(5);
	
	
	
	return ToSpellId;

end

function addon:CustomizeTargetListGetTargetAmminimumFastSetBuff_BuffOwn_Checked(v)

	v["BuffOwnChecked"] = not v["BuffOwnChecked"];
	DropDownMenu:Refresh(5);
	

end

function addon:CustomizeTargetListGetTargetAmminimumFastSetNoBuffToBuff_Nobuff_Checked(v)
	
	v[1][v[2]] = v[3];
		
	DropDownMenu:Refresh(5);
	

end





ST.RangeCheck = {}
ST.RangeCheck.dots = {};
ST.RangeCheck.checkFuncs = {};
ST.RangeCheck.frame = {};
ST.RangeCheck.initRangeCheck=nil;
ST.RangeCheck.MapSizes=nil;

ST.RangeCheck.frame.range = 10;

ST.RangeCheck.RaidUnitId = "player";
ST.RangeCheck.UpTime=GetTime();


--ST.RangeCheck.My={};
ST.MapSizes={};
--SuperTreatmentInf.MapSizes

function ST:RegisterMapSize(zone, ...)
	
	if not ST.MapSizes[zone] then
		ST.MapSizes[zone] = {}
	end
	
	
	local zone = ST.MapSizes[zone];
	for i = 1, select("#", ...), 3 do
		local level, width, height = select(i, ...)
		zone[level] = {width, height}
	end
end

local function LoadMap()
	
	ST:RegisterMapSize("BaradinHold", 1, 585.0, 390.0) -- Baradin Hold
	
	ST:RegisterMapSize("TheBastionofTwilight", 
	1, 1078.33499908447, 718.889984130859, 	-- floor 1
	2, 778.343017578125, 518.894958496094,	-- floor 2
	3, 1042.34202575684, 694.894958496094)	-- floor 3
	
	ST:RegisterMapSize("BlackwingDescent", 
	1, 849.69401550293, 566.462341070175,	-- floor 1
	2, 999.692977905273, 666.462005615234)	-- floor 2
	
	
	ST:RegisterMapSize("TheObsidianSanctum", 0, 1162.4967, 775) -- The Obsidian Sanctum
	
	ST:RegisterMapSize("TheRubySanctum", 0, 752.083, 502.09) -- The Ruby Sanctum
	
	ST:RegisterMapSize("TheArgentColiseum",
	1, 369.9861869814, 246.657989502,		-- The Argent Coliseum
	2, 739.996017456, 493.33001709			-- The Icy Depths
	)
	
	ST:RegisterMapSize("DragonSoul", 
	1, 3106.7084960938, 2063.0651855469,	-- Dragonblight
	2, 397.49887572464, 264.99992263558,	-- Maw of Go'rath (Caution: map data from game files is wrong here)
	3, 427.50311666243, 285.00046747363,	-- Maw of Shu'ma (Caution: map data from game files is wrong here)
	4, 185.19921875, 123.466796875,			-- Eye of Eternity
--	5, 1.5, 1,								-- Gunship (It doesn't actually have usuable coords, useless map data)
--	6, 1.5, 1,								-- Spine (Same probelm as above)
	7, 1108.3515625, 738.900390625			-- Maelstrom
)

	ST:RegisterMapSize("TheEyeofEternity", 1, 430.07006836, 286.713012695) -- The Eye of Eternity
	
	ST:RegisterMapSize("Firelands", 
	1, 1587.49993896484, 1058.3332824707, 	-- The Firelands
	2, 375.0, 250.0,						-- The Anvil of Conflagration
	3, 1440.0, 960)							-- Sulfuron Keep
	
	
	ST:RegisterMapSize("IcecrownCitadel",
	1, 1355.47009278, 903.647033691,	-- The Lower Citadel
	2, 1067, 711.3336906438,			-- The Rampart of Skulls
	3, 195.46997071, 130.315002441,		-- Deathbringer's Rise
	4, 773.71008301, 515.81030273,		-- The Frost Queen's Lair
	5, 1148.73999024, 765.82006836,		-- The Upper Reaches
	6, 373.70996094, 249.12988281,		-- Royal Quarters
	7, 293.26000977, 195.507019042,		-- The Frozen Throne
	8, 247.92993165, 165.287994385		-- Frostmourne
	)
	
	ST:RegisterMapSize("Naxxramas",
	1, 1093.83007813, 729.2199707,		-- The Construct Quarter
	2, 1093.83007813, 729.2199707,		-- The Arachnid Quarter
	3, 1200, 800,						-- The Military Quarter
	4, 1200.33007813, 800.2199707,		-- The Plague Quarter
	5, 2069.80981445, 1379.87988281,	-- The Lower Necropolis
	6, 655.9399414, 437.29003906		-- The Upper Necropolis
	)
	
	
	local WowBuild = select(2, GetBuildInfo())
	if tonumber(WowBuild) < 13165 then return end

	ST:RegisterMapSize("OnyxiasLair",
		1, 483.117988586426, 322.078788757324
	)

	ST:RegisterMapSize("BlackrockCaverns",
	1, 1019.50793457031, 679.672319412231,
	2, 1019.50793457031, 679.672319412231
	)	

	ST:RegisterMapSize("TheDeadmines",
	1, 559.264007568359, 372.842502593994,
	2, 499.263000488281, 332.842300415039
	)
	
	ST:RegisterMapSize("EndTime",
	1, 3295.8331298829, 2197.9165039063,
	2, 562.5, 375,
	3, 865.62054443357, 577.0803222656,
	4, 475, 316.6665039063,
	5, 696.884765625, 464.58984375,
	6, 453.13500976562, 302.08984375
	)
	
	ST:RegisterMapSize("GrimBatol",
	1, 869.047431945801, 579.364990234375
	)
	
	ST:RegisterMapSize("HallsofOrigination",
	1, 1531.7509765625, 1021.16715288162,
	2, 1272.75503540039, 848.503425598145,
	3, 1128.76898193359, 752.512023925781
	)
	
	ST:RegisterMapSize("HourofTwilight",
	1, 3043.7498779297, 2029.1665039062,
	2, 0, 0
	)
	
	ST:RegisterMapSize("LostCityofTolvir", 
	0, 970.833251953125, 647.9169921875
	)
	
	ST:RegisterMapSize("ShadowfangKeep", 
	1, 352.429931640625, 234.953392028809,
	2, 212.419921875, 141.61799621582,
	3, 152.429931640625, 101.619903564453,
	4, 152.429931640625, 101.624694824219,
	5, 152.429931640625, 101.624694824219,
	6, 198.429931640625, 132.286605834961,
	7, 272.429931640625, 181.619903564453
	)
	
	ST:RegisterMapSize("TheStonecore",
	1, 1317.12899780273, 878.086975097656
	)
	
	ST:RegisterMapSize("Skywall", 
	1, 2018.72503662109, 1345.81802368164
	)
	
	ST:RegisterMapSize("ThroneofTides",
	1, 998.171936035156, 665.447998046875,
	2, 998.171936035156, 665.447998046875
	)

	ST:RegisterMapSize("WellofEternity",
	0, 1252.0830078125, 833.3332519532--Not sure if floor is 0 or 1, will need to verify
	)
	
	ST:RegisterMapSize("ZulAman",
	0, 1268.74993896484, 845.833312988281
	)
	
	ST:RegisterMapSize("ZulGurub",
	0, 2120.83325195312, 1414.5830078125
	)	
	
	ST:RegisterMapSize("Ahnkahet", 1, 972.417968747, 648.279022217) -- Ahn'Kahet

	
	ST:RegisterMapSize("AzjolNerub",
	1, 752.973999023, 501.983001709,	-- The Brood Pit
	2, 292.973999023, 195.31597900,		-- Hadronox's Lair
	3, 367.5, 245						-- The Gilded Gate
	)
	
	ST:RegisterMapSize("DrakTharonKeep",
	1, 619.93917093835, 413.29113734848,	-- The Vestibules of Drak'Tharon
	2, 619.93877606243, 413.29435426682		-- Drak'Tharon Overlook
	)
	
	ST:RegisterMapSize("TheForgeofSouls", 1, 1448.09985351, 965.40039062) -- The Forge of Souls
	
	
	ST:RegisterMapSize("Gundrak", 1, 905.033050542, 603.35009766) -- Gundrak
	
	ST:RegisterMapSize("HallsofLightning",
	1, 566.235015869, 377.48999023,	-- Unyielding Garrison
	2, 708.23701477, 472.160034177	-- Walk of the Makers
	)
	ST:RegisterMapSize("HallsofReflection", 1, 879.02001954, 586.01953124) -- Halls of Reflection
	
	ST:RegisterMapSize("Ulduar77", 1, 920.19794213868, 613.46401864487) -- Halls of Stone
	
	ST:RegisterMapSize("CoTStratholme",
	1, 1824.997, 1216.67,					-- Norndir Preperation
	2, 1125.299987791, 750.19995117			-- Stratholme City
	)
	
	ST:RegisterMapSize("PitofSaron", 0, 1533.333, 1022.917) -- Pit of Saron
	
	ST:RegisterMapSize("TheNexus", 1, 1101.280975342, 734.1874999997) -- The Nexus
	
	ST:RegisterMapSize("Nexus80",
	1, 514.706970217, 343.138977053,	-- Band of Variance
	2, 664.706970217, 443.138977053,	-- Band of Acceleration
	3, 514.706970217, 343.138977053,	-- Band of Transmutation
	4, 294.700988772, 196.463989261		-- Band of Alignment
	)
	
	ST:RegisterMapSize("UtgardeKeep",
	1, 734.580993652, 489.7215003964,	-- Norndir Preperation
	2, 481.081008911, 320.7202930448,	-- Dragonflayer Ascent
	3, 736.581008911, 491.0545120241	-- Tyr's Terrace
	)
	
	ST:RegisterMapSize("UtgardePinnacle",
	1, 548.936019897, 365.957015991,	-- Lower Pinnacle
	2, 756.17994308428, 504.119003295	-- Upper Pinnacle
)
	
	ST:RegisterMapSize("VioletHold", 1, 256.229003907, 170.82006836) -- The Violet Hold
	
	ST:RegisterMapSize("ThroneoftheFourWinds", 1, 1500.0, 1000.0)
	
	ST:RegisterMapSize("Ulduar",
	1, 3287.49987793, 2191.66662598,		-- The Grand Approach
	2, 669.45098877, 446.30004883,			-- The Antechamber of Ulduar
	3, 1328.460998535, 885.63989258,		-- The Inner Sanctum of Ulduar
	4, 910.5, 607,							-- The Prison of Yogg-Saron
	5, 1569.45996094, 1046.30004882,		-- The Spark of Imagination
	6, 619.46899414, 412.97998047			-- The Mind's Eye
	)
	
	ST:RegisterMapSize("VaultofArchavon", 1, 1398.255004883, 932.170013428) -- Vault of Archavon



end


LoadMap();

ST.RangeCheck.setDot = function(id, icon, filtered)
	
	local x = ST.RangeCheck.dots[id].x
	local y = ST.RangeCheck.dots[id].y
	--local range = (x*x + y*y) ^ 0.5
	--print(range)
	
	ST.RangeCheck.dots[id].dx = ((x * math.cos(ST.RangeCheck.rotation)) - (-y * math.sin(ST.RangeCheck.rotation))) * ST.RangeCheck.pixelsperyard	
	ST.RangeCheck.dots[id].dy = ((x * math.sin(ST.RangeCheck.rotation)) + (-y * math.cos(ST.RangeCheck.rotation))) * ST.RangeCheck.pixelsperyard
	
	local angel=math.atan2(ST.RangeCheck.dots[id].dx,ST.RangeCheck.dots[id].dy)
	 
	if not UnitIsUnit(ST.RangeCheck.dots[id].uId, "player") then
		
		ST.RangeCheck.dots[id].Angle = 180 * angel/math.pi;
		--print(format("%.1f" , ST.RangeCheck.dots[id].Angle));
	end
	
	
	


	
	--[[
	if range < 1.10 * ST.RangeCheck.frame.range and not filtered then	
		ST.RangeCheck.dots[id].tooClose = true
	else
		ST.RangeCheck.dots[id].tooClose = false
	end	

	--]]
end



ST.RangeCheck.Radar=function(unit,range)
	
	if ST.RangeCheck.dots and ST.RangeCheck.UpTime and (GetTime() - ST.RangeCheck.UpTime) <0.01 then
		return ST.RangeCheck.dots;
	end
	
	ST.RangeCheck.RaidUnitId = unit;
	ST.RangeCheck.dots={};
	ST.RangeCheck.frame.range = range;
	
	if  DBM and DBM.MapSizes then
		ST.RangeCheck.MapSizes = DBM.MapSizes;
		
	else
		
		ST.RangeCheck.MapSizes = ST.MapSizes;
	
	end
	
	
	
	local amrange = 0;
	if ST.RangeCheck.initRangeCheck(ST.RangeCheck.frame.range) then
		
		ST.RangeCheck.pixelsperyard = min(128, 128) / (ST.RangeCheck.frame.range * 3)
		
		if ST.RangeCheck.frame.range ~= (range or 0) then
			ST.RangeCheck.range = ST.RangeCheck.frame.range
			
		end

		local mapName = GetMapInfo()
		local dims  = ST.RangeCheck.MapSizes[mapName] and ST.RangeCheck.MapSizes[mapName][GetCurrentMapDungeonLevel()]
		
		
		if not dims then 
			
		else
			ST.RangeCheck.isInSupportedArea = true
			ST.RangeCheck.rotation = (2 * math.pi) - GetPlayerFacing()
			local numPlayers = 0
			local unitID = "raid%d"
			if GetNumGroupMembers() > 0 then
				unitID = "raid%d"
				numPlayers = GetNumGroupMembers()
			elseif GetNumSubgroupMembers() > 0 then
				unitID = "party%d"
				numPlayers = GetNumSubgroupMembers()
			end
			if numPlayers < (ST.RangeCheck.prevNumPlayers or 0) then
				for i=numPlayers, ST.RangeCheck.prevNumPlayers do
					if ST.RangeCheck.dots[i] then
						
						ST.RangeCheck.dots[i].tooClose = false
						
					end
				end
				
			end
			ST.RangeCheck.prevNumPlayers = numPlayers

			local playerX, playerY = GetPlayerMapPosition(ST.RangeCheck.RaidUnitId)
			if playerX == 0 and playerY == 0 then return end	
			for i=1, numPlayers do
				local uId = unitID:format(i)
				--if not UnitIsUnit(uId, ST.RangeCheck.RaidUnitId) then
					local x,y = GetPlayerMapPosition(uId)
					if UnitIsDeadOrGhost(uId) then x = 100 end	
					if not ST.RangeCheck.dots[i] then
						ST.RangeCheck.dots[i] = {
							x = (x - playerX) * dims[1],
							y = (y - playerY) * dims[2],
							uId=uId
						}
					else
						
						ST.RangeCheck.dots[i].x = (x - playerX) * dims[1]
						ST.RangeCheck.dots[i].y = (y - playerY) * dims[2]
						ST.RangeCheck.dots[i].uId=uId;
					end
					ST.RangeCheck.setDot(i, GetRaidTargetIndex(uId), (ST.RangeCheck.frame.filter and not ST.RangeCheck.frame.filter(uId)))
				--end
			
			end

			
		end
	else
		if ST.RangeCheck.isInSupportedArea then
			
			ST.RangeCheck.isInSupportedArea = false
		
			
			
		end
	end
	
	ST.RangeCheck.UpTime=GetTime();
	
	return ST.RangeCheck.dots;
	
end


local getDistanceBetween
do
	
	
	function getDistanceBetween(uId, x, y)
		local startX, startY = GetPlayerMapPosition(uId)
		local mapName = GetMapInfo()
		local dims  = ST.RangeCheck.MapSizes[mapName] and ST.RangeCheck.MapSizes[mapName][GetCurrentMapDungeonLevel()]
		if not dims then
			return
		end
		local dX = (startX - x) * dims[1]
		local dY = (startY - y) * dims[2]
		return math.sqrt(dX * dX + dY * dY)
	end

	local function mapRangeCheck(uId, range)
		return getDistanceBetween(uId, GetPlayerMapPosition(ST.RangeCheck.RaidUnitId)) < range
	end
	
	function ST.RangeCheck.initRangeCheck(range)
		if ST.RangeCheck.checkFuncs[range] ~= mapRangeCheck then
			return true
		end
		local pX, pY = GetPlayerMapPosition(ST.RangeCheck.RaidUnitId)
		if pX == 0 and pY == 0 then
			SetMapToCurrentZone()
			pX, pY = GetPlayerMapPosition(ST.RangeCheck.RaidUnitId)
		end
		local levels = ST.RangeCheck.MapSizes[GetMapInfo()]
		if not levels then
			return false
		end
		local dims = levels[GetCurrentMapDungeonLevel()]
		if not dims and levels and GetCurrentMapDungeonLevel() == 0 then 
			SetMapToCurrentZone()
			dims = levels[GetCurrentMapDungeonLevel()] 
			if not dims then 
				return false
			end
		elseif not dims then
			return false
		end
		return true 
	end
	
	_G.rangepId="MouseOver-TarGet";
	setmetatable(ST.RangeCheck.checkFuncs, {
		__index = function(t, k)
			return mapRangeCheck
		end
	})
end

function addon:TargetListTargetsConditionsNamesRangeCheck_L_value(v,v1)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["RangeCheck"]["Count"]["<"];
	
		
	tbl["Value"]= v1;
	

	
	DropDownMenu:Refresh(5);
	
	
end	


function addon:TargetListTargetsConditionsNamesRangeCheck_L_checked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["RangeCheck"]["Count"];
	
		
	tbl["<"]["checked"]= not tbl["<"]["checked"];
	
	if not tbl["<"]["checked"] and not tbl[">"]["checked"] then
		tbl["<"]["checked"]=true;
	end


	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesRangeCheck_H_value(v,v1)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["RangeCheck"]["Count"][">"];
	
		
	tbl["Value"]= v1;
	

	
	DropDownMenu:Refresh(5);
	
	
end

function addon:TargetListTargetsConditionsNamesRangeCheck_H_checked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["RangeCheck"]["Count"];
	
		
	tbl[">"]["checked"]= not tbl[">"]["checked"];
	
	if not tbl["<"]["checked"] and not tbl[">"]["checked"] then
		tbl[">"]["checked"]=true;
	end
	

	
	DropDownMenu:Refresh(5);
	
	
end






function addon:TargetListTargetsConditionsNamesRangeCheck_Range_L_value(v,v1)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["RangeCheck"]["Range"]["<"];
	
		
	tbl["Value"]= v1;
	

	
	DropDownMenu:Refresh(5);
	
	
end	


function addon:TargetListTargetsConditionsNamesRangeCheck_Range_L_checked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["RangeCheck"]["Range"];
	
		
	tbl["<"]["checked"]= not tbl["<"]["checked"];
	
	if not tbl["<"]["checked"] and not tbl[">"]["checked"] then
		tbl["<"]["checked"]=true;
	end
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesRangeCheck_Range_H_checked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["RangeCheck"]["Range"];
	
		
	tbl[">"]["checked"]= not tbl[">"]["checked"];
	
	if not tbl["<"]["checked"] and not tbl[">"]["checked"] then
		tbl[">"]["checked"]=true;
	end
	

	
	DropDownMenu:Refresh(5);
	
	
end

function addon:TargetListTargetsConditionsNamesRangeCheck_Range_H_value(v,v1)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["RangeCheck"]["Range"][">"];
	
		
	tbl["Value"]= v1;
	

	
	DropDownMenu:Refresh(5);
	
	
end


--------------------------------------------------------------------------


function addon:TargetListTargetsConditionsNamesPlayerRangeCheckAngle_L_value(v,v1)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["PlayerRangeCheckAngle"]["Count"]["<"];
	
		
	tbl["Value"]= v1;
	

	
	DropDownMenu:Refresh(5);
	
	
end	


function addon:TargetListTargetsConditionsNamesPlayerRangeCheckAngle_L_checked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["PlayerRangeCheckAngle"]["Count"];
	
		
	tbl["<"]["checked"]= not tbl["<"]["checked"];
	
	if not tbl["<"]["checked"] and not tbl[">"]["checked"] then
		tbl["<"]["checked"]=true;
	end
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesPlayerRangeCheckAngle_H_value(v,v1)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["PlayerRangeCheckAngle"]["Count"][">"];
	
		
	tbl["Value"]= v1;
	

	
	DropDownMenu:Refresh(5);
	
	
end

function addon:TargetListTargetsConditionsNamesPlayerRangeCheckAngle_H_checked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["PlayerRangeCheckAngle"]["Count"];
	
		
	tbl[">"]["checked"]= not tbl[">"]["checked"];
	
	if not tbl["<"]["checked"] and not tbl[">"]["checked"] then
		tbl[">"]["checked"]=true;
	end
	

	
	DropDownMenu:Refresh(5);
	
	
end






function addon:TargetListTargetsConditionsNamesPlayerRangeCheckAngle_Range_L_value(v,v1)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["PlayerRangeCheckAngle"]["Range"]["<"];
	
		
	tbl["Value"]= v1;
	

	
	DropDownMenu:Refresh(5);
	
	
end	


function addon:TargetListTargetsConditionsNamesPlayerRangeCheckAngle_Range_L_checked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["PlayerRangeCheckAngle"]["Range"];
	
		
	tbl["<"]["checked"]= not tbl["<"]["checked"];
	
	if not tbl["<"]["checked"] and not tbl[">"]["checked"] then
		tbl["<"]["checked"]=true;
	end
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesPlayerRangeCheckAngle_Range_H_checked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["PlayerRangeCheckAngle"]["Range"];
	
		
	tbl[">"]["checked"]= not tbl[">"]["checked"];
	
	if not tbl["<"]["checked"] and not tbl[">"]["checked"] then
		tbl[">"]["checked"]=true;
	end
	

	
	DropDownMenu:Refresh(5);
	
	
end

function addon:TargetListTargetsConditionsNamesPlayerRangeCheckAngle_Range_H_value(v,v1)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["PlayerRangeCheckAngle"]["Range"][">"];
	
		
	tbl["Value"]= v1;
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesPlayerRangeCheckAngle_LackHealthChecked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["PlayerRangeCheckAngle"];
	
		
	tbl["LackHealthChecked"]= not tbl["LackHealthChecked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesPlayerRangeCheckAngle_HealthPercentageChecked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["PlayerRangeCheckAngle"];
	
		
	tbl["HealthPercentageChecked"]= not tbl["HealthPercentageChecked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end







function addon:TargetListTargetsConditionsNamesPlayerRangeCheckAngle_Health_L_value(v,v1)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["PlayerRangeCheckAngle"]["Health"]["<"];
	
		
	tbl["Value"]= v1;
	

	
	DropDownMenu:Refresh(5);
	
	
end	


function addon:TargetListTargetsConditionsNamesPlayerRangeCheckAngle_Health_L_checked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["PlayerRangeCheckAngle"]["Health"]["<"];
	
		
	tbl["checked"]= not tbl["checked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesPlayerRangeCheckAngle_Health_H_checked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["PlayerRangeCheckAngle"]["Health"][">"];
	
		
	tbl["checked"]= not tbl["checked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end

function addon:TargetListTargetsConditionsNamesPlayerRangeCheckAngle_Health_H_value(v,v1)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["PlayerRangeCheckAngle"]["Health"][">"];
	
		
	tbl["Value"]= v1;
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesPlayerRangeCheckAngle_AngleChecked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["PlayerRangeCheckAngle"];
	
		
	tbl["AngleChecked"]= not tbl["AngleChecked"];
	
	if tbl["AngleChecked"] then
		tbl["ContainChecked"] = false;
	end
	
	

	
	DropDownMenu:Refresh(5);
	
	
end

function addon:TargetListTargetsConditionsNamesPlayerRangeCheckAngle_AngleValue(v,v1)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["PlayerRangeCheckAngle"];
	
		
	tbl["AngleValue"]= v1;
	

	
	DropDownMenu:Refresh(5);
	
	
end

function addon:TargetListTargetsConditionsNamesPlayerRangeCheckAngle_BuffChecked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["PlayerRangeCheckAngle"]["Buff"];
	
		
	tbl["checked"]= not tbl["checked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end

--------------------------------------

function addon:TargetListTargetsConditionsNamesPlayerRangeCheckAnglePlayerRangeCheckAngleBuff_L_value(v,v1)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["PlayerRangeCheckAngle"]["Buff"]["<"];
	
		
	tbl["Value"]= v1;
	

	
	DropDownMenu:Refresh(5);
	
	
end	


function addon:TargetListTargetsConditionsNamesPlayerRangeCheckAnglePlayerRangeCheckAngleBuff_L_checked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["PlayerRangeCheckAngle"]["Buff"]["<"];
	
		
	tbl["checked"]= not tbl["checked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end


function addon:TargetListTargetsConditionsNamesPlayerRangeCheckAnglePlayerRangeCheckAngleBuff_H_checked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["PlayerRangeCheckAngle"]["Buff"][">"];
	
		
	tbl["checked"]= not tbl["checked"];
	

	
	DropDownMenu:Refresh(5);
	
	
end

function addon:TargetListTargetsConditionsNamesPlayerRangeCheckAnglePlayerRangeCheckAngleBuff_H_value(v,v1)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["PlayerRangeCheckAngle"]["Buff"][">"];
	
		
	tbl["Value"]= v1;
	

	
	DropDownMenu:Refresh(5);
	
	
end

function addon:TargetListTargetsConditionsNamesPlayerRangeCheckAngle_ContainChecked(v)

	local tbl = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["PlayerRangeCheckAngle"];
	
		
	tbl["ContainChecked"]= not tbl["ContainChecked"];
	
	if tbl["ContainChecked"] then
		tbl["AngleChecked"] = false;
	end
	
	DropDownMenu:Refresh(5);
	
	
end

function addon:TargetListTargetsConditionsNamesPlayerRangeCheckAnglePlayerRangeCheckAngleBuff_Del(v)


	
	local Buff = Spells[v[1]]["Targets"][v[2]]["Conditions"][v[3]]["PlayerRangeCheckAngle"]["Buff"]["name"];
	
	
	if IsControlKeyDown() and IsAltKeyDown() then
		table.remove(Buff, v[4]) 
		DropDownMenu:Refresh(7);
		
	elseif IsControlKeyDown() then
		Buff[v[4]]["IsTexture"]=not Buff[v[4]]["IsTexture"];
		Buff[v[4]]["IsSpellId"]=false;
		DropDownMenu:Refresh(7);
		
	elseif IsAltKeyDown() then
		Buff[v[4]]["IsSpellId"]=not Buff[v[4]]["IsSpellId"];
		Buff[v[4]]["IsTexture"]=false;
		DropDownMenu:Refresh(7);
		
	end
	
	
	
end

function addon:Hide_old_version_of_the_target()

	ST.Hide_old_version_of_the_target= not ST.Hide_old_version_of_the_target;
	DropDownMenu:Refresh(5);
	

end



function addon:SetHelpNavigation()
	
	
	SuperTreatmentAllDBF.HelpNavigation = not SuperTreatmentAllDBF.HelpNavigation;
	if amGlowBoxWidget.GlowBox then
		amGlowBoxWidget.GlowBox:Hide();
	end
	DropDownMenu:Refresh(1);
	

end


function addon:Del_Tbl_Index(v1,v2)
	
	table.remove(v1[1], v1[2]) 
	DropDownMenu:Refresh(v1[3] or 1);
	
end

function addon:SetMenusWinDows(v)
	
	SuperTreatmentAllDBF.MenusWinDows =v;
	DropDownMenu:SetMenusWinDows(SuperTreatmentAllDBF.MenusWinDows);
	DropDownMenu:Refresh(1)
	
end

function addon:SetSounds(v)
	
	SuperTreatmentAllDBF.SetSounds[v[1]] =v[2];
	DropDownMenu:SetSounds(v[1],v[2]);

	DropDownMenu:Refresh(v[3] or 1)
	
	if "open" == v[1] or v[1] =="close" or "clicked"==v[1] then
		PlaySound(v[2]);
	end
	
	
end

function addon:SetSoundsDefault(v)
	
	SuperTreatmentAllDBF.SetSounds.open="MINIMAPOPEN";
	SuperTreatmentAllDBF.SetSounds.close="MINIMAPCLOSE";
	SuperTreatmentAllDBF.SetSounds.clicked="UChatScrollButton";
	SuperTreatmentAllDBF.SetSounds.OpenSounds=true;
	
	SuperTreatmentAllDBF.SetSounds.isopen=true;
	SuperTreatmentAllDBF.SetSounds.isclose=true;
	SuperTreatmentAllDBF.SetSounds.isclicked=true;

	DropDownMenu:SetSoundsDefault();

	
	DropDownMenu:Refresh(3)
	
	
	
end



function addon:SetTbl(v,self)
	
	local tbl,index,value,level,argv,ex,levelex = v[1],v[2],v[3],v[4],v[5],v[6],v[7];
	
	if not argv then
		tbl[index]=value;
	elseif argv == 1 then
		tbl[index]=tonumber(format("%.1f",self));
	end
	
	if ex then
		levelex = levelex or 0;
		local menux = ex.ExternalMenu:GetParent()
		local levelx = menux:GetLevel()
		
		local hh = menux:GetHandleEx();
		hh:Refresh(levelx - levelex);
		
	end
		
	DropDownMenu:Refresh(level);
	
end
local function SetKey(v)
	
	if not amzd() then
		ST.ISSETKEY=true;
	
	end
	
		if not v.Key then
					v.Key={};
					v.Key.KeySelect="auto"				
				end
				
				if	v.Key.Checked then  
					
					if v.Key.Value and v.Key.Value~="" then
					
						local name =v.Mark;
						local ButtonFrame;
						
						if not amzd() then
						
							if not v.Key.ButtonFrame or (v.Key.ButtonFrame and not v.Key.ButtonFrame.SetAttribute) then
							
								ButtonFrame =  CreateFrame("Button", name,UIParent, "SecureActionButtonTemplate");
								
							
							elseif v.Key.ButtonFrame and v.Key.ButtonFrame.SetAttribute then
								
								ButtonFrame = v.Key.ButtonFrame;
								
							end
						
						end
						
						local macrotext;
						
						if v.Key.KeySelect == "auto" then
							macrotext='/run stEP("' .. v.Mark .. '",2,0)';				
						elseif v.Key.KeySelect == "ok" then
							macrotext='/run stEP("' .. v.Mark .. '",1,0)';	
						elseif v.Key.KeySelect == "no" then
							macrotext='/run stEP("' .. v.Mark .. '",0,0)';	
						elseif v.Key.KeySelect == "run" then
							macrotext='/run stEP("' .. v.Mark .. '",3)';
						elseif v.Key.KeySelect == "auto1" then
							macrotext='/run stEP("' .. v.Mark .. '",2,1)';				
						elseif v.Key.KeySelect == "ok1" then
							macrotext='/run stEP("' .. v.Mark .. '",1,1)';	
						elseif v.Key.KeySelect == "no1" then
							macrotext='/run stEP("' .. v.Mark .. '",0,1)';	
						
						end
						
						if not amzd() then
						
							ButtonFrame:SetAttribute("type", "macro") ;
							ButtonFrame:SetAttribute("macrotext",macrotext) ;
							SetOverrideBindingClick(ButtonFrame, true,v.Key.Value , ButtonFrame:GetName())
							
							v.Key.ButtonFrame=ButtonFrame;
							
						end
							
					end
				else
					
					if not amzd() then
						if v.Key.ButtonFrame and v.Key.ButtonFrame.SetAttribute then
							ClearOverrideBindings(v.Key.ButtonFrame);
							
						elseif v.Key.ButtonFrame and not v.Key.ButtonFrame.SetAttribute then
							v.Key.ButtonFrame=nil;
						end
						
					end
					
				end
end

function addon:SuperTreatmentDBF_ClearAllData(vi) -- 清除数据
	SuperTreatmentAllDBF = nil
	SuperTreatmentDBF = nil
	ReloadUI()
end

function addon:SuperTreatmentDBF_up(vi) -- 升级设定
	
	if not SuperTreatmentAllDBF.SetSounds then
	
		SuperTreatmentAllDBF.SetSounds={};
	end
	
	if not SuperTreatmentDBF["AddOnMemory"] then
		
		SuperTreatmentDBF["AddOnMemory"]={};
		SuperTreatmentDBF["AddOnMemory"]["max"]=60;
		SuperTreatmentDBF["AddOnMemory"]["on"]=false;
		SuperTreatmentDBF["AddOnMemory"]["Leftfighting"]=false;
	end
	
	if not SuperTreatmentDBF["AddOnMemory"]["Leftfighting"] then
		
		SuperTreatmentDBF["AddOnMemory"]["Leftfighting"]=false;
	end
	
	if not SuperTreatmentDBF["AddOnMemory"]["inf"] then
		
		SuperTreatmentDBF["AddOnMemory"]["inf"]=false;
	end
	
	
	if not SuperTreatmentDBF["name"] then
		SuperTreatmentDBF["name"]="[无名]";
		SuperTreatmentDBF["Remark"]="";
		SuperTreatmentDBF["index"]=1;
		SuperTreatmentAllDBF={};
		SuperTreatmentAllDBF["Programs"]={};
	end
	
	if not SuperTreatmentDBF["Remark"] then
		
		SuperTreatmentDBF["Remark"]="";
	end
	
	local tbl = SuperTreatmentDBF["Spells"]["List"];
	
		
	for i, data in pairs(tbl) do
		
		local d = data["spell"]
		
		if not data["ApiDbf"] then
			data["ApiDbf"]={};
		end
		
		if not data["ExcludeTarget"] then
			data["ExcludeTarget"]={};
		end
		
		if not data["ExcludedGroup"] then
			data["ExcludedGroup"]={};
		end
		
		
		for k, t in pairs(d) do
			
			if SuperTreatmentDBF["Import"] == nil or SuperTreatmentDBF["Import"] ==false then
			
				local Link ;
				
				if t["Type"]=="item" then
					_,Link = GetItemInfo(t["spellId"]);
					t["itemLink"]=Link;
					
				
				elseif t["Type"]=="spell" then
					Link=GetSpellLink(t["spellId"]);
					t["itemLink"]=Link;
				end
			end
			
			
			if not d[k]["Targets"] then
				d[k]["Targets"]={};
				d[k]["Targets"][1]={};
				d[k]["Targets"][1]["Conditions"]={};
				d[k]["Targets"][1]["name"]=t["Target"];
				d[k]["Targets"][1]["Remark"]="";
				d[k]["Targets"][1]["checked"]=false;
				
				local TBL = {};
	
				TBL["name"] = t["Target"];
				TBL["Remark"] = "";
				TBL["checked"]=false;
				TBL["unit"]=t["unit"];
			
				table.insert(d[k]["Targets"][1]["Conditions"],TBL);
				
			
			end
			
			
		end
		
	end
	
	SuperTreatmentDBF["Import"]=true;
	
	
	if not SuperTreatmentDBF["CollectionInf"] then
		
		SuperTreatmentDBF["CollectionInf"]={};
		SuperTreatmentDBF["CollectionInf"]["Buff_Spell"]={};
		SuperTreatmentDBF["CollectionInf"]["Buff_Spell"]["checked"]=false;
	end
	
	if not SuperTreatmentDBF["Macro"] then
		SuperTreatmentDBF["Macro"]={};
	end
	
	
	
	if not SuperTreatmentDBF["Spells"]["NoStopCastingSpells"] then
		SuperTreatmentDBF["Spells"]["NoStopCastingSpells"] ={};
	end
	
	if not CollectionInf["Buff_Spell"]["level"] then
		CollectionInf["Buff_Spell"]["level"]=0;
	end
	
	local tb = SuperTreatmentDBF["Unit"]["RaidList"];
			
	for i, data in pairs(tb) do
		if data["AmminimumFast"] and data["AmminimumFast"]["thread"] then
			data["AmminimumFast"]["thread"]=nil;
			data["AmminimumFast"]["frame"]=nil;
			data["AmminimumFast"]["counter"]=nil;
			data["AmminimumFast"]["func"]=nil;
			
		end
		
		if data["AmminimumFast"]  and (not data["AmminimumFast"]["MultitaskingTime"] or data["AmminimumFast"]["MultitaskingTime"]<50) then
			data["AmminimumFast"]["MultitaskingTime"]=50;
		end
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
	
	local UnitDB =SuperTreatmentDBF["Unit"];
	
	if not UnitDB["MTList"] then
	
		UnitDB["MTList"]={};
		UnitDB["MTList"]["Default"]={};
		UnitDB["MTList"]["Custom"]={};
	end
	
	if not UnitDB["MTList"]["Default"] then
		UnitDB["MTList"]["Default"]={};
	end
	
	if not UnitDB["MTList"]["Custom"] then
		UnitDB["MTList"]["Custom"]={};
	end
	
	UnitDB["MTList"]["TypeChecked"] = UnitDB["MTList"]["TypeChecked"] or 1;
	
	if #UnitDB["MTList"]["Custom"]~=8 then
		
		UnitDB["MTList"]["Custom"]={};
		for i=1, 8 do

			table.insert(UnitDB["MTList"]["Custom"],"MT" .. i);
			
		end
	end
	
	--SuperTreatmentDBF["Unit"]["RaidList"]["test"]["subgroup"]
	
	if not SuperTreatmentDBF["updata"] then
		SuperTreatmentDBF["updata"]={};
	end
	
	local updataOK=true;
	if (SuperTreatmentDBF.Version or 0)<stVersion() and not SuperTreatmentDBF["updata"]["2012.03.20 0940"] then
		
		local tbls={};
		local isok=false;
		local err={};
		for CustomName, data in pairs(SuperTreatmentDBF["Unit"]["RaidList"]) do
		
			if data["subgroup"] == -2 then
				
				if not data["AmminimumFast"]["buff"] then
					
					data["AmminimumFast"]["buff"]={};
					
				end
				
				local NewTblA =nil;
				
				for x, u in pairs(data["AmminimumFast"]["buff"]) do
					
					if type(u) == "table" and u["index"] then
						
						NewTblA = th_table_dup(data["AmminimumFast"]["buff"]);
						
						break;
					end
					
					
				end
				
				if NewTblA then
				
					
					
					
					
					
					
					for k, v in pairs(NewTblA,AmminimumFast_SortBuff) do
					
						
						
						if v.SpellId and tonumber(v.SpellId) then
							
							
							
							local name = GetSpellInfo(v.SpellId);
							if name == k then
							
							
							else
								
								if k and k~="" then
								
									local spellid,_,_,Texture = amfindSpellItemInf(k);
									if spellid then
									
										
									else
										
										table.insert(err,CustomName .. " > 设定Buff条件 > [" .. k .."] 错误" );
										--isok=true;
										--break;
										
									end
									
								else
									
									table.insert(err,CustomName .. " > 设定Buff条件 > [" .. k .."] 错误" );
									--isok=true;
									--break;
									
								end
								
							end
							
						elseif k and k~="" then
							
							local spellid,_,_,Texture = amfindSpellItemInf(k);
								if spellid then
								
									
								
								else
									
									table.insert(err,CustomName .. " > 设定Buff条件 > [" .. k .."] 错误" );
									--isok=true;
									--break;
									
								end
						
						
						else
							
							table.insert(err,CustomName .. " > 设定Buff条件 > [" .. k .."] 错误" );
							--isok=true;
							--break;
									
						end
						
						
					end
				
				end
				
				NewTblA = nil;
				
				for x, u in pairs(data["AmminimumFast"]["Nobuff"] or{}) do
					
					if type(u) == "table" and u["index"] then
						
						NewTblA = th_table_dup(data["AmminimumFast"]["Nobuff"]);
						
						break;
					end
					
					
				end
				
				if NewTblA then
				
				
					
					for k, v in pairs(NewTblA,AmminimumFast_SortBuff) do
					
						
						
						if v.SpellId and tonumber(v.SpellId) then
							
							
							
							local name = GetSpellInfo(v.SpellId);
							if name == k then
							
							
							else
								
								if k and k~="" then
								
									local spellid,_,_,Texture = amfindSpellItemInf(k);
									if spellid then
									
										
									else
										
										table.insert(err,CustomName .. " > 排除的Buff > [" .. k .."] 错误" );
										--isok=true;
										--break;
										
									end
									
								else
									
									table.insert(err,CustomName .. " > 排除的Buff > [" .. k .."] 错误" );
									--isok=true;
									--break;
									
								end
								
							end
							
						elseif k and k~="" then
							
							local spellid,_,_,Texture = amfindSpellItemInf(k);
								if spellid then
								
									
								
								else
									
									table.insert(err,CustomName .. " > 排除的Buff > [" .. k .."] 错误" );
									--isok=true;
									--break;
									
								end
						
						
						else
							
							table.insert(err,CustomName .. " > 排除的Buff > [" .. k .."] 错误" );
							--isok=true;
							--break;
									
						end
						
						
					end
				
				end
				
			
			end
			
		
		end
		
		
		
		--SuperTreatmentDBF["Spells"]["List"][1]["spell"][1]["Targets"][1]["Conditions"][1]["Buff"]["Time"]
		
		--for Name, data in pairs(SuperTreatmentDBF["Spells"]["List"]) do
		
		
		--end
		
		--SuperTreatmentDBF["Unit"]["RaidList"]["全团队加盾"]["AmminimumFast"]["Nobuff"]
		
		if #err >0 then
			print("\n");
			print("|cffff0000方案升级失败:|r" .. SuperTreatmentDBF["name"]);
			for k, v in pairs(err) do
				print("|cffff0000" ..k ..".|r 自定义目标 > " .. v);
			end
			print("\n");
			
			updataOK=false;
		end
		
		
		
		if (vi ==1 and #err >0) or #err ==0 then
		
			
			for i, data in pairs(SuperTreatmentDBF["Unit"]["RaidList"]) do
		
				if data["subgroup"] == -2 then
					
					if not data["AmminimumFast"]["buff"] then
						
						data["AmminimumFast"]["buff"]={};
						
					end
					
					local NewTblA =nil;
					
					
					for k, v in pairs(data["AmminimumFast"]["buff"]) do
						
						if type(v) == "table" and v["index"] then
							
							NewTblA = th_table_dup(data["AmminimumFast"]["buff"]);
							break;
						end
						
						
					end
					
					if NewTblA then
					
						
						
						data["AmminimumFast"]["buff"]={};
						
						
						
						for k, v in pairs(NewTblA,AmminimumFast_SortBuff) do
						
							if v.SpellId and tonumber(v.SpellId) then
								
								
								
								local name = GetSpellInfo(v.SpellId);
								if name == k then
								
									local tbl={};
									tbl.SpellId = v.SpellId;
									
									table.insert(data["AmminimumFast"]["buff"],tbl)
								
								else
									
									if k and k~="" then
									
										local spellid,_,_,Texture = amfindSpellItemInf(k);
										
										if spellid then
											local tbl={};
											tbl.SpellId = spellid;
											
											table.insert(data["AmminimumFast"]["buff"],tbl);
										end
																			
										
									end
									
								end
								
							elseif k and k~="" then
								
								local spellid,_,_,Texture = amfindSpellItemInf(k);
									
								if spellid then
									local tbl={};
									tbl.SpellId = spellid;
									
									table.insert(data["AmminimumFast"]["buff"],tbl);
								end
									
							
										
							end
							
							
						end
					
					end
					
					NewTblA = nil;
					
					for k, v in pairs(data["AmminimumFast"]["Nobuff"] or {}) do
						
						if type(v) == "table" and v["index"] then
							
							NewTblA = th_table_dup(data["AmminimumFast"]["Nobuff"]);
							break;
						end
						
						
					end
					
					if NewTblA then
					
						
						
						data["AmminimumFast"]["Nobuff"]={};
						
						
						
						for k, v in pairs(NewTblA,AmminimumFast_SortBuff) do
						
							if v.SpellId and tonumber(v.SpellId) then
								
								
								
								local name = GetSpellInfo(v.SpellId);
								if name == k then
								
									local tbl={};
									tbl.SpellId = v.SpellId;
									
									table.insert(data["AmminimumFast"]["Nobuff"],tbl)
								
								else
									
									if k and k~="" then
									
										local spellid,_,_,Texture = amfindSpellItemInf(k);
										
										if spellid then
											local tbl={};
											tbl.SpellId = spellid;
											
											table.insert(data["AmminimumFast"]["Nobuff"],tbl);
										end
																			
										
									end
									
								end
								
							elseif k and k~="" then
								
								local spellid,_,_,Texture = amfindSpellItemInf(k);
									
								if spellid then
									local tbl={};
									tbl.SpellId = spellid;
									
									table.insert(data["AmminimumFast"]["Nobuff"],tbl);
								end
									
							
										
							end
							
							
						end
					
					end
					
					NewTblA = nil;
				
				end
			
			end
		
		
			
			stprint("|cff00ff00"..SuperTreatmentDBF["name"].." 方案升级成功！")
			
			updataOK =true;
		end
	
		
	end
	-------------updata 4.3.38-----------------------------
	
	
	---if updataOK and (SuperTreatmentDBF.Version or 0)<stVersion() then
	if updataOK and (SuperTreatmentDBF.Version or 0)<500002 then
		
		if not SuperTreatmentDBF.Mark then
		
			local Mark =amrandom();
			SuperTreatmentDBF.Mark=Mark;
			local temp = th_table_dup(SuperTreatmentDBF);
			table.insert(SuperTreatmentAllDBF["Programs"], temp);
		end
		
		local tbl = SuperTreatmentDBF["Unit"]["RaidList"];
	
		for i, data in pairs(tbl) do
		
			if data["subgroup"] == -2 then
				
				local v =data["AmminimumFast"];
				v["NewBuff"]={};
				v["NewBuff"]["IsOrAnd"]="Or";
				v["NewBuff"]["buffs"]={};
				
				
				local t = th_table_dup(data["AmminimumFast"]["buff"]) or {};
				
				for ii, w in pairs(t) do
					
					local s ={};
					s["Cd"]={};
					s["Cd"]["<"]={};
					s["Cd"]["<"]["Value"]=0;
					s["Cd"]["<"]["Checked"]=false;
					s["Cd"][">"]={};
					s["Cd"][">"]["Value"]=0;
					s["Cd"][">"]["Checked"]=false;
					
					s["IsCd"]="Presence";
					
					s["IsCount"]=false;
					s["Count"]={};
					s["Count"]["<"]={};
					s["Count"]["<"]["Value"]=0;
					s["Count"]["<"]["Checked"]=false;
					s["Count"][">"]={};
					s["Count"][">"]["Value"]=0;
					s["Count"][">"]["Checked"]=false;
					
					
					
					s["IsSpellIdTexture"] = "IsName";
					s["IsType"] = "Auto";
					s["IsPlayer"] = "All";
					s["IsCanceLable"] = "No";
					s["IsRaid"] = "No";
					
					
					
					--判断Buff是否存在
					if v["RemoveBuff"] then
						s["IsCd"] = "Presence";
					end
					
					--BUFF流逝的时间
					if v["ValueBuffchecked"] then
						s["IsCd"] = "Start"
						
						s["Cd"][">"]["Checked"] = true;
					end
					s["Cd"][">"]["Value"] = v["ValueBuff"] or 0;
					
					
					--判断Buff是否不存在
					if v["AddBuff"] then
						s["IsCd"] = "NotPresence";
					end
					
					--Buff的剩余时间
					if v["BuffCdChecked"] or v["BuffCdMaxChecked"] then
						
						s["IsCd"] = "End";
						
						if v["BuffCdChecked"] then
							
							s["Cd"]["<"]["Checked"] = true;
						end
						
						if v["BuffCdMaxChecked"] then
							
							s["Cd"][">"]["Checked"] = true;
						end
						
						
					end
					
					s["Cd"]["<"]["Value"] = v["BuffCd"] or 0;
					s["Cd"][">"]["Value"] = v["BuffCdMax"] or 0;
					
					
					--判断Buff是否属于自己。
					if v["BuffOwnChecked"] then
						s["IsPlayer"] = "PLAYER";
					end
					
					
					
					--判断Buff是否选择
					if not v["RemoveBuff"] and not v["ValueBuffchecked"] and not v["AddBuff"] and not v["BuffCdChecked"] and not v["BuffCdMaxChecked"] then
						s["IsCd"] = "No"
					end
					
					if w["IsTexture"] then
						s.IsSpellIdTexture="IsTexture";
					elseif w["IsSpellId"] then
						s.IsSpellIdTexture="IsSpellId";
					end
					
					
					
					if GetSpellInfo(w.SpellId) then
						s.SpellId=w.SpellId;
					else
						
						s.SpellId=w.SpellId;
						if w.Name and w.Name~="" then
							s.Name=w.Name;
						end
					
					end
					
					s["Class"]={};
					
					for iii, y in pairs(w.Class or {}) do
						
						if y then
							s["Class"][iii]=true;
							if not s["IsClass"] then s["IsClass"]=true; end;
						end
					end
					
					
					table.insert(v["NewBuff"]["buffs"],s);
					
				end
				
				
				v["NewNobuff"]={};
				v["NewNobuff"]["IsOrAnd"]="Or";
				v["NewNobuff"]["buffs"]={};
				
				local t = th_table_dup(data["AmminimumFast"]["Nobuff"]) or {};
				
				for ii, w in pairs(t) do
					
					local s ={};
					s["Cd"]={};
					s["Cd"]["<"]={};
					s["Cd"]["<"]["Value"]=0;
					s["Cd"]["<"]["Checked"]=false;
					s["Cd"][">"]={};
					s["Cd"][">"]["Value"]=0;
					s["Cd"][">"]["Checked"]=false;
					
					s["IsCd"]="Presence";
					
					s["IsCount"]=false;
					s["Count"]={};
					s["Count"]["<"]={};
					s["Count"]["<"]["Value"]=0;
					s["Count"]["<"]["Checked"]=false;
					s["Count"][">"]={};
					s["Count"][">"]["Value"]=0;
					s["Count"][">"]["Checked"]=false;
					
					
					
					s["IsSpellIdTexture"] = "IsName";
					s["IsType"] = "Auto";
					s["IsPlayer"] = "All";
					s["IsCanceLable"] = "No";
					s["IsRaid"] = "No";
					
					
					
					--判断Buff是否存在
					
					s["IsCd"] = "Presence";
					
					
					
					--判断Buff是否属于自己。
					if v["NobuffOwnChecked"] then
						s["IsPlayer"] = "PLAYER";
					end
					
					
					
					if w["IsTexture"] then
						s.IsSpellIdTexture="IsTexture";
					elseif w["IsSpellId"] then
						s.IsSpellIdTexture="IsSpellId";
					end
					
					
					
					if GetSpellInfo(w.SpellId) then
						s.SpellId=w.SpellId;
					else
						
						s.SpellId=w.SpellId;
						if w.Name and w.Name~="" then
							s.Name=w.Name;
						end
					
					end
					
					s["Class"]={};
					
					
					
					
					table.insert(v["NewNobuff"]["buffs"],s);
					
				end
				
	---------------------------------------------------------------------
				
				v["NewSpell"]={};
				v["NewSpell"]["Spell"]={};
				
				v["NewSpell"]["Cd"]={};
				v["NewSpell"]["Cd"]["Start"]={};
				v["NewSpell"]["Cd"]["Start"]["Value"]=0;
				v["NewSpell"]["Cd"]["Start"]["Checked"]=false;
				v["NewSpell"]["Cd"]["End"]={};
				v["NewSpell"]["Cd"]["End"]["Value"]=0;
				v["NewSpell"]["Cd"]["End"]["Checked"]=false;
				
				v["NewSpell"]["AllSpell"]=v["AllSpell"] or false;
				
				if v["AllSpell"] then
				
					v["NewSpell"]["Cd"]["End"]["Value"] = v["SpellValuePoorvalue"] or 0;
					v["NewSpell"]["Cd"]["End"]["Checked"] = v["SpellValuePoorChecked"] or false;
					
					v["NewSpell"]["Cd"]["Start"]["Value"] = v["SpellValue"] or 0;
					v["NewSpell"]["Cd"]["Start"]["Checked"] = v["SpellValueChecked"] or false;
					
					
					
				end
								
				local t = th_table_dup(data["AmminimumFast"]["spell"]) or {};
				
				for ii, w in pairs(t) do
					
					local SpellId,_,_,Texture = amfindSpellItemInf(ii);
					
					if SpellId then
						
						local s ={};
						s["Cd"]={};
						s["Cd"]["End"]={};
						s["Cd"]["End"]["Value"]=0;
						s["Cd"]["End"]["Checked"]=false;
						s["Cd"]["Start"]={};
						s["Cd"]["Start"]["Value"]=0;
						s["Cd"]["Start"]["Checked"]=false;
						
						s["Checked"]=true;
						
						s["Cd"]["End"]["Value"] = v["SpellValuePoorvalue"] or 0;
						s["Cd"]["End"]["Checked"] = v["SpellValuePoorChecked"] or false;
						
						s["Cd"]["Start"]["Value"] = v["SpellValue"] or 0;
						s["Cd"]["Start"]["Checked"] = v["SpellValueChecked"] or false;
						
						if v["SpellValuePoorChecked"] or v["SpellValueChecked"] then 
							s["Checked"] = true ;
						end
						
						s["SpellId"]=SpellId;
						
						
						table.insert(v["NewSpell"]["Spell"],s);
					
					end
					
					
				end
	
	---------------------------------------------------------
	
	
				if not data.types then
			
					if data["unitchecked"] then
						
						data.types="unit";
						
					elseif data["functionchecked"] then
					
						data.types="function";
						
					elseif data["AmminimumFastchecked"] then
					
						data.types="AmminimumFast";
					
					else
						data.types = "AmminimumFast";
					end
				
				end
				
				
	------------------------------------------------------------------
			
				if v["Minimum"]["MinimumBlood"] then
					v["Minimum"]["isRadio"]="MinimumBlood";
				end
				
				if v["Minimum"]["MinimumBloodPercentage"] then
					v["Minimum"]["isRadio"]="MinimumBloodPercentage";
					
				end
				
				
				if v["Minimum"]["MinimumEnergy"] then
					v["Minimum"]["isRadio"]="MinimumEnergy";
				end
				
				
				if v["Minimum"]["MinimumEnergyPercentage"] then
					v["Minimum"]["isRadio"]="MinimumEnergyPercentage";
				end
				
				if v["Minimum"]["MinimumDistance"] then
					v["Minimum"]["isRadio"]="MinimumDistance";
				end
				
				if v["Minimum"]["MinimumLayerBuffChecked"] then
					v["Minimum"]["isRadio"]="MinimumLayerBuffChecked";
				end
				
				if v["Minimum"]["CodeChecked"] then
					v["Minimum"]["isRadio"]="CodeChecked";
				end
				
				
				
				if v["Maximum"]["MaximumBlood"] then
					v["Maximum"]["isRadio"]="MaximumBlood";
				end
				
				if v["Maximum"]["MaximumBloodPercentage"] then
					v["Maximum"]["isRadio"]="MaximumBloodPercentage";
					
				end
				
				
				if v["Maximum"]["MaximumEnergy"] then
					v["Maximum"]["isRadio"]="MaximumEnergy";
				end
				
				
				if v["Maximum"]["MaximumEnergyPercentage"] then
					v["Maximum"]["isRadio"]="MaximumEnergyPercentage";
				end
				
				if v["Maximum"]["MaximumLayerBuffChecked"] then
					v["Maximum"]["isRadio"]="MaximumLayerBuffChecked";
				end
				
				if v["Maximum"]["MinimumLayerBuffChecked"] then
					v["Maximum"]["isRadio"]="MinimumLayerBuffChecked";
				end
				
				if v["Maximum"]["CodeChecked"] then
					v["Maximum"]["isRadio"]="CodeChecked";
				end
			
			
			
				
			
			end
		
		end
		
		
		if SuperTreatmentDBF["Spells"] then
		
			local tbl = SuperTreatmentDBF["Spells"]["List"];
			local Mark ;
			
			for i, v in pairs(tbl) do
				
				Mark =amrandom(i);
				
				if not v.Mark then
					v.Mark=Mark;
				end
				
				--SetKey(v);
				
				
				if v["spell"] then
					
					local Mark1  ;
					for ii, vv in pairs(v["spell"]) do
						
						Mark1 = amrandom(ii);
				
						if not vv.Mark then
							vv.Mark=Mark1;
						end
						
						--SetKey(vv);
						
						if vv["Targets"] then
					
							local Mark2  ;
							for iii, vvv in pairs(vv["Targets"]) do
								
								Mark2 = amrandom(iii);
						
								if not vvv.Mark then
									vvv.Mark=Mark2;
								end
								
								--SetKey(vvv);
								
								if vvv["Conditions"] then
					
									local Mark3  ;
									for iiii, vvvv in pairs(vvv["Conditions"]) do
										
										Mark3 = amrandom(iiii);
								
										if not vvvv.Mark then
											vvvv.Mark=Mark3;
										end
										
										--SetKey(vvvv);
										
										stUpData_CastSpellTbl(vvvv);
										stUpData_BuffTbl(vvvv);
									end
								
								end
								
						
							end
						
						end
				
					end
				
				end
				
			end
		end
		
		SuperTreatmentDBF.Version =stVersion();
	
	end
	
	
	
	
	
	
	
	
	
	
	------------------------------------------------
	if SuperTreatmentDBF["Spells"] then
		
			local tbl = SuperTreatmentDBF["Spells"]["List"];
			
			for i, v in pairs(tbl or {}) do
				
				SetKey(v);
				
				
				if v["spell"] then
					
					
					for ii, vv in pairs(v["spell"] or {}) do
						
						SetKey(vv);
						
						if vv["Targets"] then
					
							
							for iii, vvv in pairs(vv["Targets"] or {}) do
								
								SetKey(vvv);
																
								if vvv["Conditions"] then
					
									
									for iiii, TBL in pairs(vvv["Conditions"]) do
										
										SetKey(TBL);
										
										if TBL.NewSpell then
										
											local v =TBL.NewSpell;
		
											if v["NotInterrupt"] == true then
												v["NotInterrupt"]= "No";
											end
											
											if v["NotInterrupt"] == false then
												v["NotInterrupt"]= "Yes";
											end
											
											if v["NotInterrupt"] == nil then
												v["NotInterrupt"]= "All";
											end
											
											for ii, w in pairs(v.Spell or {}) do
										
											
												if w["NotInterrupt"] == true then
													w["NotInterrupt"]= "No";
												end
												
												if w["NotInterrupt"] == false then
													w["NotInterrupt"]= "Yes";
												end
												
												if w["NotInterrupt"] == nil then
													w["NotInterrupt"]= "All";
												end
										
										
											end
										
										end
										
									
									end
								
								end
								
						
							end
						
						end
				
					end
				
				end
				
			end
	end
		
	---------------------------------------------------------
	
	
	for i, data in pairs(SuperTreatmentDBF["Unit"]["RaidList"]) do
	
		if data["subgroup"] == -2 then
			
			if data["AmminimumFast"]["NewSpell"] then
			
				local v =data["AmminimumFast"]["NewSpell"] ;
	
				if v["NotInterrupt"] == true then
					v["NotInterrupt"]= "No";
				end
				
				if v["NotInterrupt"] == false then
					v["NotInterrupt"]= "Yes";
				end
				
				if v["NotInterrupt"] == nil then
					v["NotInterrupt"]= "All";
				end
				
				if v.Spell then
					for ii, w in pairs(v.Spell) do
					
						
						if w["NotInterrupt"] == true then
							w["NotInterrupt"]= "No";
						end
						
						if w["NotInterrupt"] == false then
							w["NotInterrupt"]= "Yes";
						end
						
						if w["NotInterrupt"] == nil then
							w["NotInterrupt"]= "All";
						end
					
					
					end
				else
					v.Spell={};
				end
				
			else
				data["AmminimumFast"]["NewSpell"]={};
			end							
			
		
		end
	
	end
	
	------------------------------------
	
	
	
	if not SuperTreatmentDBF.Locale then
	
		SuperTreatmentDBF.Locale = GetLocale();
	end
	
	
	
	amRaidList();
	
end

function stUpData_BuffTbl(TBL)

	
	if not TBL["NewBuff"] then
		TBL["NewBuff"]={};
		TBL["NewBuff"]["IsOrAnd"]="Or";
		TBL["NewBuff"]["buffs"]={};
	end
	
	if not TBL["Buff"] then
		return;
	end
	
	TBL["NewBuff"]["checked"]=TBL["Buff"]["checked"];
	TBL["NewBuff"]["not"]=TBL["Buff"]["not"];
	
	local bufftbl={};
	local istype=0;
	
	if TBL["Buff"] and TBL["Buff"]["Time"] and TBL["Buff"]["Time"]["checked"] then
	
		bufftbl=TBL["Buff"]["Time"]["BuffName"];
		istype=1;
		stUpData_BuffTbl_1(TBL,bufftbl,istype);
		
	elseif TBL["Buff"] and TBL["Buff"]["IsBuff"] and TBL["Buff"]["IsBuff"]["checked"] then
	
		bufftbl=TBL["Buff"]["IsBuff"]["BuffName"];
		istype=3;
		stUpData_BuffTbl_1(TBL,bufftbl,istype);
	end
	
	if TBL["Buff"] and TBL["Buff"]["Layer"] and TBL["Buff"]["Layer"]["checked"] then
	
		bufftbl=TBL["Buff"]["Layer"]["BuffName"];
		istype=2;
		stUpData_BuffTbl_1(TBL,bufftbl,istype);
	end
	
end	

function stUpData_BuffTbl_1(TBL,bufftbl,istype)
	
	
	local v=TBL["Buff"];
	
	for ii, w in pairs(bufftbl) do
					
		local s ={};
		s["Cd"]={};
		s["Cd"]["<"]={};
		s["Cd"]["<"]["Value"]=0;
		s["Cd"]["<"]["Checked"]=false;
		s["Cd"][">"]={};
		s["Cd"][">"]["Value"]=0;
		s["Cd"][">"]["Checked"]=false;
		
		s["IsCd"]="Presence";
		
		s["IsCount"]=false;
		s["Count"]={};
		s["Count"]["<"]={};
		s["Count"]["<"]["Value"]=0;
		s["Count"]["<"]["Checked"]=false;
		s["Count"][">"]={};
		s["Count"][">"]["Value"]=0;
		s["Count"][">"]["Checked"]=false;
		
		
		
		s["IsSpellIdTexture"] = "IsName";
		s["IsType"] = "Auto";
		s["IsPlayer"] = "All";
		s["IsCanceLable"] = "No";
		s["IsRaid"] = "No";
		
		if istype==1 then
			
			--BUFF流逝的时间
			if v.Time.Start.checked or v.Time.Start.Maxchecked then
			
				s["IsCd"] = "Start"
			
				s["Cd"][">"]["Checked"] = v.Time.Start.checked;
				
				s["Cd"][">"]["Value"] = v.Time.Start.Value or 0;
				
				s["Cd"]["<"]["Checked"] = v.Time.Start.Maxchecked;
				
				s["Cd"]["<"]["Value"] = v.Time.Start.MaxValue or 0;
				
			end
			
			--Buff的剩余时间
			if v.Time.Remaining.checked or v.Time.Remaining.Maxchecked then
			
				s["IsCd"] = "End"
			
				s["Cd"][">"]["Checked"] = v.Time.Remaining.Maxchecked;
				
				s["Cd"][">"]["Value"] = v.Time.Remaining.MaxValue or 0;
				
				s["Cd"]["<"]["Checked"] = v.Time.Remaining.checked;
				
				s["Cd"]["<"]["Value"] = v.Time.Remaining.Value or 0;
				
			end
			
					
			
		elseif istype==2 then
		
		
			s["IsCount"]=true;
			
			
			s["Count"]["<"]["Value"]=v["Layer"]["<"]["Value"];
			s["Count"]["<"]["Checked"]=v["Layer"]["<"]["checked"];
			
			s["Count"][">"]["Value"]=v["Layer"][">"]["Value"];
			s["Count"][">"]["Checked"]=v["Layer"][">"]["checked"];
		
		elseif istype==3 then
			--判断Buff是否存在
			if not v.IsBuff.NoBuffChecked then
				s["IsCd"] = "Presence";
			end
			
			--判断Buff是否不存在
			if  v.IsBuff.NoBuffChecked then
				s["IsCd"] = "NotPresence";
			end
			
		end
		
		
		
		--判断Buff是否属于自己。
		if v["OwnChecked"] then
			s["IsPlayer"] = "PLAYER";
		end
		
		
		
		--判断Buff是否选择
		if istype==0 then
			s["IsCd"] = "No"
		end
		
		if w["IsTexture"] then
			s.IsSpellIdTexture="IsTexture";
		elseif w["IsSpellId"] then
			s.IsSpellIdTexture="IsSpellId";
		end
		
		--s.SpellId=w.SpellId;
		
		if GetSpellInfo(w.SpellId) then
			s.SpellId=w.SpellId;
		else
			
			s.SpellId=w.SpellId;
			if w.Name and w.Name~="" then
				s.Name=w.Name;
			end
		
		end
		
		s["Class"]={};
		
			
		
		table.insert(TBL["NewBuff"]["buffs"],s);
		
	end
				
end	



function stUpData_CastSpellTbl(TBL)
	
	if not TBL["NewSpell"] then
	
		TBL["NewSpell"]={};
		TBL["NewSpell"]["Spell"]={};
		
		TBL["NewSpell"]["Cd"]={};
		TBL["NewSpell"]["Cd"]["Start"]={};
		TBL["NewSpell"]["Cd"]["Start"]["Value"]=0;
		TBL["NewSpell"]["Cd"]["Start"]["Checked"]=false;
		TBL["NewSpell"]["Cd"]["End"]={};
		TBL["NewSpell"]["Cd"]["End"]["Value"]=0;
		TBL["NewSpell"]["Cd"]["End"]["Checked"]=false;
	
	end
	
	
	
	if not TBL.CastSpell then
		return;
	end
	
	TBL["NewSpell"]["not"]=TBL["CastSpell"]["not"];
	TBL["NewSpell"]["checked"]=TBL["CastSpell"]["checked"];
	
	
	
	
	local v =TBL.CastSpell;
	
	TBL["NewSpell"]["AllSpell"]=v["AllInterruptChecked"] or false;
	
	if not v["InterruptChecked"] then
		TBL["NewSpell"]["NotInterrupt"]= "All";
	else
		TBL["NewSpell"]["NotInterrupt"]= "Yes";
	end
	
	
	if v["AllInterruptChecked"] then
	
		TBL["NewSpell"]["Cd"]["End"]["Value"] =  v["Remaining"]["Value"] or 0;
		TBL["NewSpell"]["Cd"]["End"]["Checked"] = v["Remaining"]["checked"] or false;
		
		TBL["NewSpell"]["Cd"]["Start"]["Value"] = v["Start"]["Value"] or 0;
		TBL["NewSpell"]["Cd"]["Start"]["Checked"] = v["Start"]["checked"] or false;
		
		
		
	end
	
	--local v = th_table_dup(TBL.CastSpell) or {};
	
	
	
	for ii, w in pairs(v.Spells) do
		
		
		local name = GetSpellInfo(w.SpellId or 0);
		
		if name then
			
			local s ={};
			s["Cd"]={};
			s["Cd"]["End"]={};
			s["Cd"]["End"]["Value"]=0;
			s["Cd"]["End"]["Checked"]=false;
			s["Cd"]["Start"]={};
			s["Cd"]["Start"]["Value"]=0;
			s["Cd"]["Start"]["Checked"]=false;
			
			s["Checked"]=true;
			
			s["Cd"]["End"]["Value"] = v["Remaining"]["Value"] or 0;
			s["Cd"]["End"]["Checked"] = v["Remaining"]["checked"] or false;
			
			s["Cd"]["Start"]["Value"] = v["Start"]["Value"] or 0;
			s["Cd"]["Start"]["Checked"] = v["Start"]["checked"] or false;
			
			if v["Remaining"]["checked"] or v["Start"]["checked"] then 
				s["Checked"] = true ;
			end
			
			
			
			if GetSpellInfo(w.SpellId) then
				s.SpellId=w.SpellId;
			else
				
				s.SpellId=w.SpellId;
				if w.Name and w.Name~="" then
					s.Name=w.Name;
				end
			
			end
			
			if not v["InterruptChecked"] then
				s["NotInterrupt"]= "All";
			else
				s["NotInterrupt"]= "Yes";
			end
			
			table.insert(TBL["NewSpell"]["Spell"],s);
		
		end
		
		
	end


end
				


function stRefreshMark(stTbl) 

    if (type(stTbl) ~= "table") then
        return nil;
    end
	
	   
    for i,v in pairs(stTbl) do
	
        local vtyp = type(v);
		
        if (vtyp == "table") then
			
             stRefreshMark(v);
			 
        elseif (vtyp == "string") then
            
			if i == "Mark" then
				stTbl[i] =amrandom();
				
			end
			
         
        end
    end
    
end




function stCancelKey(stTbl,index) 

    if (type(stTbl) ~= "table") then
        return nil;
    end
	
	   
    for i,v in pairs(stTbl) do
	
        local vtyp = type(v);
		
        if (vtyp == "table") then
			
			if i == "Key" and (stTbl[i].Value or stTbl[i].KeySelect) then
				
				local Key =stTbl[i];
				if Key.ButtonFrame and Key.ButtonFrame.SetAttribute then
					ClearOverrideBindings(Key.ButtonFrame);
					
				elseif Key.ButtonFrame and not Key.ButtonFrame.SetAttribute then
					Key.ButtonFrame=nil;
				end
				
				if index and index==1 then
					Key.KeySelect = "auto";
					Key.Value =nil;
					Key.Checked =nil;
					Key.lock =nil;
				end
				
			else
			
				stCancelKey(v,index);
				
			end
		
        end
    end
    
end



function addon:SetAllBuffDefault(value)

	for k,v in pairs(value) do
			
		local id = v.SpellId;
		
		value[k]={};
		value[k].SpellId=id;
		
	end
	
	DropDownMenu:Refresh(3)
end


function addon:SetAllBuffHELPFUL(value)

	for k,v in pairs(value) do
			
		value[k].IsType="HELPFUL";
		
	end
	
	DropDownMenu:Refresh(3)
end

function addon:SetAllBuffHARMFUL(value)

	for k,v in pairs(value) do
		
		value[k].IsType="HARMFUL";
		
	end
	
	DropDownMenu:Refresh(3)
end


local st_PLAYER_REGEN_Mark="";

local function EVENT_PLAYER_REGEN(self,event,arg1)
	
		
	if event == "PLAYER_REGEN_DISABLED" then
		
		st_PLAYER_REGEN_Mark = SuperTreatmentDBF.Mark;
	
	elseif event == "PLAYER_REGEN_ENABLED" then
		
		if (st_PLAYER_REGEN_Mark ~= SuperTreatmentDBF.Mark) or not ST.ISSETKEY then
			
			if SuperTreatmentDBF["Spells"] then
		
				local tbl = SuperTreatmentDBF["Spells"]["List"];
				
				for i, v in pairs(tbl or {}) do
				
				SetKey(v);
				
				
				if v["spell"] then
					
					
					for ii, vv in pairs(v["spell"] or {}) do
						
						SetKey(vv);
						
						if vv["Targets"] then
					
							
							for iii, vvv in pairs(vv["Targets"] or {}) do
								
								SetKey(vvv);
																
								if vvv["Conditions"] then
					
									
									for iiii, TBL in pairs(vvv["Conditions"]) do
										
										SetKey(TBL);
									
									end
								
								end
								
						
							end
						
						end
				
					end
				
				end
				
			end
			end
		end
		
	end
	
end

function addon:stExport(tbl)

	SuperTreatmentExport_Mark= time();--math.random(8888, GetTime()*1000);
	SuperTreatmentExport_Dbf=tbl;
	Wowam_Runsp_old(SuperTreatmentExport_Mark,"9")
	ReloadUI();
	
end

local st_PLAYER_REGEN= CreateFrame("Frame", nil ,UIParent);

st_PLAYER_REGEN:SetScript("OnEvent", EVENT_PLAYER_REGEN);

st_PLAYER_REGEN:RegisterEvent("PLAYER_REGEN_DISABLED");
st_PLAYER_REGEN:RegisterEvent("PLAYER_REGEN_ENABLED");


function addon:SetThreadSpeed(value)
	SuperTreatmentAllDBF.SetThreadSpeed=value;
	
	DropDownMenu:Refresh(2);

end

function addon:UnlockerSpeed(value)
	SuperTreatmentAllDBF.UnlockerSpeed=value;
	
	DropDownMenu:Refresh(2);

end

function addon:showThreadSpeedTime()
	
	DropDownMenu:Refresh(2);

end

