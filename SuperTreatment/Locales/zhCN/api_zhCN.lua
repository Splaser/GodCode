
if (GetLocale() ~= 	"zhCN") then return; end;

local RED = "|cffff0000";
local GREEN = "|cff00ff00";
local BLUE = "|cff0000ff";
local MAGENTA = "|cffff00ff";
local YELLOW = "|cffffff00";
local CYAN = "|cff00ffff";
local WHITE = "|cffffffff";

local PlayerColors =  "|cffFFA54F";
local SpecialColors = "|cff2DF562";
local SpellRemindColors =  "|cffF08080";



SuperTreatment={};

SuperTreatment["Api"]={};
SuperTreatment["Menu"]={};
SuperTreatment["ApiIndex"]={};

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


local api = SuperTreatment["Api"];
local apiIndex = SuperTreatment["ApiIndex"];

local function NewTbl(name) 
	api[name]={};
	table.insert(apiIndex,name);
	return api[name];
end

SuperTreatment["ApiDbf"]={};

local index=0;
local function SetIndex(name)
	--index = index +1;
	--apiIndex[name]["index"]=index;
end


local name,rs;


------------------play 开始 ---------------------
rs = NewTbl("amIsTellMeWhenIconShown");

rs["inf"]= "|cffFDD562获得指定TMW图标是否显示";
rs["Remarks"]="获得指定TMW图标是否显示(布尔値)";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=2;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="分组编号";
rs["Arguments"][2]={}; 
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="图标编号";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="返回图标是否显示,失败为假";

rs = NewTbl("amDBMBarTimeRemain");

rs["inf"]= "|cffFDD562获得指定DBM计时条的剩余时间";
rs["Remarks"]="获得指定DBM计时条的剩余时间(秒)";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="计时条名称";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="成功返囘时间(秒),反之爲 -1";

rs = NewTbl("amCalcExp");
rs["inf"]="|cff2DF562计算逻辑表达式";
rs["Remarks"]='计算一个逻辑表达式\n注意引号前面需要加反斜杠\n\"     >     \\\"\n\n|r例:\nUnitHealth(\\\"player\\\")>20000 and UnitHealth(\\\"target\\\")<200000';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="表达式";
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="返回表达式真假";

rs = NewTbl("amRandomBoolean");
rs["inf"]="|cff2DF562随机条件";
rs["Remarks"]='根据输入概率返回真假\n\n|r例:\n输入20就是百分之20的几率为真';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="概率百分数";
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="随机返回真假";
---------------test
rs = NewTbl("amGetTemporaryPetInf");
rs["inf"]=PlayerColors .."获得自己临时宠物信息";
rs["Remarks"]='获得自己临时宠物信息,包括消失时间（秒）,名称。\n\n|r包括祭司宠物、法师的水元素、以及各种与任务相关的宠物。\n\n死亡骑士的宠物不包含在内,要判断请用死亡骑士专用的宠物判断函数。';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=2;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="成功返囘:数値宠物消失时间（秒）,失败返囘 -1";
rs["Returns"][2]={};
rs["Returns"][2]["type"]="String";
rs["Returns"][2]["Failure"]="";
rs["Returns"][2]["inf"]="成功返囘:宠物名称,失败爲空字符串";



rs = NewTbl("amGetSpellBaseCooldown");

rs["inf"]=PlayerColors .."获得自己技能的基本冷却时间";
rs["Remarks"]="获得自己技能的基本冷却时间(秒),这冷却时间不会被其他因素影响包括施放技能后也不会改变";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="技能名称";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="成功返囘时间(秒),反之爲 -1";




rs = NewTbl("OffhandHasWeapon");

rs["inf"]=PlayerColors .."判断自己副手是否武器";
rs["Remarks"]="判断副手是否武器(盾这些不属于武器)是返囘眞,反之爲假。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="副手是否武器返囘眞,反之爲假";


rs = NewTbl("amGetSpellInfo");
rs["inf"]=PlayerColors .."自己技能信息";
rs["Remarks"]='自己技能的详细信息';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=2;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="技能名称,输入Id名称无效";
rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="技能Id,输入Id名称无效";

rs["Returns"]={};
rs["Returns"]["Counts"]=8;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="String";
rs["Returns"][1]["Failure"]="";
rs["Returns"][1]["inf"]="技能名称,失败空字符串";


rs["Returns"][2]={};
rs["Returns"][2]["type"]="String";
rs["Returns"][2]["Failure"]="";
rs["Returns"][2]["inf"]="技能等级或者说明,失败空字符串";

rs["Returns"][3]={};
rs["Returns"][3]["type"]="String";
rs["Returns"][3]["Failure"]="";
rs["Returns"][3]["inf"]="图标名称包含路径,失败空字符串";

rs["Returns"][4]={};
rs["Returns"][4]["type"]="Number";
rs["Returns"][4]["Failure"]=-1;
rs["Returns"][4]["inf"]="施放需要的能量値(法力、怒气等等),失败爲-1";

rs["Returns"][5]={};
rs["Returns"][5]["type"]="Boolean";
rs["Returns"][5]["Failure"]=false;
rs["Returns"][5]["inf"]="True for spells with health funneling effects (like Health Funnel)(boolean)";

rs["Returns"][6]={};
rs["Returns"][6]["type"]="Number";
rs["Returns"][6]["Failure"]=-9;
rs["Returns"][6]["inf"]="能量类型代码:-2=健康;0=法力;怒气=1;2=集中;能量=3;快乐=4;符文=5;符能=6,失败返囘-9";

rs["Returns"][7]={};
rs["Returns"][7]["type"]="Number";
rs["Returns"][7]["Failure"]=-1;
rs["Returns"][7]["inf"]="施放时间(毫秒),失败返囘-1";

rs["Returns"][8]={};
rs["Returns"][8]["type"]="Number";
rs["Returns"][8]["Failure"]=-1;
rs["Returns"][8]["inf"]="施放范围最小値,失败返囘-1";

rs["Returns"][9]={};
rs["Returns"][9]["type"]="Number";
rs["Returns"][9]["Failure"]=-1;
rs["Returns"][9]["inf"]="施放范围最大値,失败返囘-1";



rs = NewTbl("amInternalCD");
rs["inf"]=PlayerColors .."自己技能的内置冷却时间";
rs["Remarks"]='自己技能的内置冷却时间,如：强化断筋\n\n|r目前只能判断以下技能:\n强化断筋';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="技能名称";
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘冷却时间（秒）";


rs = NewTbl("amGetDkPetCd");
rs["inf"]=PlayerColors .."获得死亡骑士宠物消失时间";
rs["Remarks"]='获得死亡骑士宠物消失时间（秒）';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="返囘：数値宠物消失时间（秒）";



rs = NewTbl("amGetDkInfectionTargetInf");

rs["inf"]=PlayerColors .."判断DK传染施放条件";
rs["Remarks"]="返囘攻击你的(包括中你疫病)的目标数量、中疫病数量、没疫病数量。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;


rs["Returns"]={};
rs["Returns"]["Counts"]=7;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘攻击你的(包括中你疫病)的目标数量。";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=100;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;


rs["Returns"][2]={};
rs["Returns"][2]["type"]="Number";
rs["Returns"][2]["Failure"]=-1;
rs["Returns"][2]["inf"]="返囘中疫病的目标数量。";
rs["Returns"][2]["Minimum"]=-1;
rs["Returns"][2]["Maximum"]=100;
rs["Returns"][2]["Value"]=0;
rs["Returns"][2]["Step"]=1;
rs["Returns"][2]["Percent"]=false;
rs["Returns"][2]["Decimals"]=0;


rs["Returns"][3]={};
rs["Returns"][3]["type"]="Number";
rs["Returns"][3]["Failure"]=-1;
rs["Returns"][3]["inf"]="返囘没疫病的目标数量。";
rs["Returns"][3]["Minimum"]=-1;
rs["Returns"][3]["Maximum"]=100;
rs["Returns"][3]["Value"]=0;
rs["Returns"][3]["Step"]=1;
rs["Returns"][3]["Percent"]=false;
rs["Returns"][3]["Decimals"]=0;


rs["Returns"][4]={};
rs["Returns"][4]["type"]="Number";
rs["Returns"][4]["Failure"]=-1;
rs["Returns"][4]["inf"]="返囘攻击(白字伤害)你的目标数量。";
rs["Returns"][4]["Minimum"]=-1;
rs["Returns"][4]["Maximum"]=100;
rs["Returns"][4]["Value"]=0;
rs["Returns"][4]["Step"]=1;
rs["Returns"][4]["Percent"]=false;
rs["Returns"][4]["Decimals"]=0;


rs["Returns"][5]={};
rs["Returns"][5]["type"]="Number";
rs["Returns"][5]["Failure"]=-1;
rs["Returns"][5]["inf"]="返囘攻击(白字伤害)你且中疫病的目标数量。";
rs["Returns"][5]["Minimum"]=-1;
rs["Returns"][5]["Maximum"]=100;
rs["Returns"][5]["Value"]=0;
rs["Returns"][5]["Step"]=1;
rs["Returns"][5]["Percent"]=false;
rs["Returns"][5]["Decimals"]=0;


rs["Returns"][6]={};
rs["Returns"][6]["type"]="Number";
rs["Returns"][6]["Failure"]=-1;
rs["Returns"][6]["inf"]="返囘攻击(白字伤害)你且没疫病的目标数量。";
rs["Returns"][6]["Minimum"]=-1;
rs["Returns"][6]["Maximum"]=100;
rs["Returns"][6]["Value"]=0;
rs["Returns"][6]["Step"]=1;
rs["Returns"][6]["Percent"]=false;
rs["Returns"][6]["Decimals"]=0;

rs["Returns"][7]={};
rs["Returns"][7]["type"]="Number";
rs["Returns"][7]["Failure"]=-1;
rs["Returns"][7]["inf"]="返囘BUFF的消失时间(秒)。只返囘最小値的目标。";
rs["Returns"][7]["Minimum"]=-1;
rs["Returns"][7]["Maximum"]=100;
rs["Returns"][7]["Value"]=0;
rs["Returns"][7]["Step"]=1;
rs["Returns"][7]["Percent"]=false;
rs["Returns"][7]["Decimals"]=0;


rs = NewTbl("amGetRuneCooldown");
rs["inf"]=PlayerColors .."获得指定位置的符文冷却时间";
rs["Remarks"]='获得指定位置(1-6整数値)的符文冷却时间（秒）';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][1]="符文1(鲜血)"
rs["Arguments"][1]["Select"][2]="符文2(鲜血)"
rs["Arguments"][1]["Select"][3]="符文3(冰霜)"
rs["Arguments"][1]["Select"][4]="符文4(冰霜)"
rs["Arguments"][1]["Select"][5]="符文5(邪恶)"
rs["Arguments"][1]["Select"][6]="符文6(邪恶)"

rs["Arguments"][1]["inf"]="符文位置(1-6整数値)";
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="返囘：数値符文冷却时间（秒）";


rs = NewTbl("amrs");
rs["inf"]=PlayerColors .. "获得我的特殊能量値";
rs["Remarks"]="自动判断当前职业获得该职业的特殊能量値如：骑士的神圣能量、枭兽形态德鲁伊的日/月能量、术士的恶魔之怒能量";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["Minimum"]=-9999;
rs["Returns"][1]["Maximum"]=9999;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;
rs["Returns"][1]["inf"]="能量値";


rs = NewTbl("amTalentName");
rs["inf"]=PlayerColors .."我的专精名称";
rs["Remarks"]="WOW5.0叫专精不是天赋了";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="String";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="专精名称";



rs = NewTbl("IsCurrentSpell");
rs["inf"]=PlayerColors .."技能动作执行情况";
rs["Remarks"]='IsCurrentSpell(「英勇打击")';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="技能名称";
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="执行时返囘true";


rs = NewTbl("amat");
rs["inf"]=PlayerColors .."我的近战武器攻击计时时间";
rs["Remarks"]="需要安装AttackTimer插件";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["Minimum"]=0;
rs["Returns"][1]["Maximum"]=9;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=0.1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=1;
rs["Returns"][1]["inf"]="攻击剩余时间(秒)";

rs["Returns"][2]={};
rs["Returns"][2]["type"]="Number";
rs["Returns"][2]["Failure"]=-1;
rs["Returns"][2]["Minimum"]=0;
rs["Returns"][2]["Maximum"]=9;
rs["Returns"][2]["Value"]=0;
rs["Returns"][2]["Step"]=0.1;
rs["Returns"][2]["Percent"]=false;
rs["Returns"][2]["Decimals"]=1;
rs["Returns"][2]["inf"]="攻击间隔时间(秒)";


rs = NewTbl("IsEquippedItem");
rs["inf"]=PlayerColors .."判断物品是否佩戴";
rs["Remarks"]="";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="物品名称";
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="佩戴返囘true";



rs = NewTbl("IsEquippableItem");
rs["inf"]=PlayerColors .."判断能佩戴的物品是否存在";
rs["Remarks"]="判断能佩戴的物品(佩戴的和包里的)是否存在";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="物品名称";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="佩戴返囘true";


rs = NewTbl("amwbuff");
rs["inf"]=PlayerColors .."我的武器附魔时间";
rs["Remarks"]="获得主手\副手武器\投掷武器附魔效果冷却时间 time=amwbuff(n)";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][1]="主手武器";
rs["Arguments"][1]["Select"][2]="副手武器";
rs["Arguments"][1]["Select"][3]="投掷武器";
rs["Arguments"][1]["inf"]="1 = 主手武器, 2 = 副手武器, 3 = 投掷武器";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["Minimum"]=0;
rs["Returns"][1]["Maximum"]=1000;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;
rs["Returns"][1]["inf"]="武器附魔效果冷却时间(秒)";


rs = NewTbl("IsIndoors");
rs["inf"] = PlayerColors .."判断我在室内";
rs["Remarks"] = "布尔値 - 是否在室内,返囘true爲在室内";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=0; 
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="在室内返囘true";


rs = NewTbl("IsOutdoors");
rs["inf"] = PlayerColors .."判断我在室外";
rs["Remarks"] = "布尔値 - 是否在室外,返囘true爲在室外";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=0; rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="在室外返囘true";



rs = NewTbl("IsMounted");
rs["inf"] = PlayerColors .."判断我坐骑状态";
rs["Remarks"] = "布尔値 - 坐骑返囘true";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=0; 
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="坐骑状态返囘true";


rs = NewTbl("amIsAttack");
rs["inf"] = PlayerColors .."我是否攻击姿态";
rs["Remarks"] = "布尔値 - 攻击姿态返囘true";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=0; 
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="攻击姿态返囘true";



rs = NewTbl("amuca");
rs["inf"] = PlayerColors .."我是否可以攻击";
rs["Remarks"] = "布尔値 - 可以攻击返囘true";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="可以攻击返囘true";


rs = NewTbl("amzt");
rs["inf"]=PlayerColors .."我是否在指定的姿态";
rs["Remarks"]="按技能排序来编号,如:|r\n战士:1=战斗、2=防御、3=狂暴\n德鲁伊:1=熊、2=海豹、3=猫、4=旅行、5=枭兽/树\n骑士:1=眞理圣印、2=正义圣印、3=洞察圣印";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="姿态编号(按技能位置左边起)";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][1]=select(2,GetShapeshiftFormInfo(1)) or "左1";
rs["Arguments"][1]["Select"][2]=select(2,GetShapeshiftFormInfo(2)) or "左2";
rs["Arguments"][1]["Select"][3]=select(2,GetShapeshiftFormInfo(3)) or "左3";
rs["Arguments"][1]["Select"][4]=select(2,GetShapeshiftFormInfo(4)) or "左4";
rs["Arguments"][1]["Select"][5]=select(2,GetShapeshiftFormInfo(5)) or "左5";
rs["Arguments"][1]["Select"][6]=select(2,GetShapeshiftFormInfo(6)) or "左6";
rs["Arguments"][1]["Select"][7]=select(2,GetShapeshiftFormInfo(7)) or "左7";
rs["Arguments"][1]["Select"][8]=select(2,GetShapeshiftFormInfo(8)) or "左8";
rs["Arguments"][1]["Select"][9]=select(2,GetShapeshiftFormInfo(9)) or "左9";
rs["Arguments"][1]["Select"][10]=select(2,GetShapeshiftFormInfo(10)) or "左10";

rs["Returns"]={}
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="是指定姿态返囘true";


rs = NewTbl("IsStealthed");
rs["inf"] = PlayerColors .."我是否潜行或影遁中";
rs["Remarks"] = "布尔値 - 如果爲潜行或影遁返囘1,否则爲nil";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=0; 

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="潜行或影遁返囘1(true)";


rs = NewTbl("amGetInventoryItemDurability");
rs["inf"]=PlayerColors .."我的装备耐久(%)";
rs["Remarks"]="获得装备耐久的百分比";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["Select"]={};

rs["Arguments"][1]["Select"][1] = "头";
rs["Arguments"][1]["Select"][2] = "颈";
rs["Arguments"][1]["Select"][3] = "肩";
rs["Arguments"][1]["Select"][4] = "衬衣";
rs["Arguments"][1]["Select"][5] = "胸";
rs["Arguments"][1]["Select"][6] = "腰带";
rs["Arguments"][1]["Select"][7] = "腿";
rs["Arguments"][1]["Select"][8] = "脚";
rs["Arguments"][1]["Select"][9] = "手腕";
rs["Arguments"][1]["Select"][10] = "手套";
rs["Arguments"][1]["Select"][11] = "手指1";
rs["Arguments"][1]["Select"][12] = "手指2";
rs["Arguments"][1]["Select"][13] = "饰品1";
rs["Arguments"][1]["Select"][14] = "饰品2";
rs["Arguments"][1]["Select"][15] = "背";
rs["Arguments"][1]["Select"][16] = "主手";
rs["Arguments"][1]["Select"][17] = "副手";
rs["Arguments"][1]["Select"][18] = "远程武器";

rs["Arguments"][1]["inf"]="装备位置编号(1 - 18)";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘装备耐久的百分比";
rs["Returns"][1]["Minimum"]=0;
rs["Returns"][1]["Maximum"]=100;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;


rs = NewTbl("amGetCastInf");
rs["inf"] = PlayerColors .."我正在施放的技能信息";
rs["Remarks"] = "返囘施放的技能名称、目标、过去时间(秒)";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=0; 

rs["Returns"]["Counts"]=3;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="String";
rs["Returns"][1]["Failure"]="";
rs["Returns"][1]["inf"]="返囘施放的技能名称,失败爲空字符串";

rs["Returns"][2]={};
rs["Returns"][2]["type"]="String";
rs["Returns"][2]["Failure"]=false;
rs["Returns"][2]["inf"]="返囘施放的目标名称,失败爲 false";

rs["Returns"][3]={};
rs["Returns"][3]["type"]="Number";
rs["Returns"][3]["Failure"]=false;
rs["Returns"][3]["inf"]="返囘从施放到现在的时间(秒),失败爲 false|r\n|cffffff00寄语小白:|r是【正在施放】哦...";


rs = NewTbl("amIsPlayerCastSpell");
rs["inf"] = PlayerColors .."我是否正在施放技能中";
rs["Remarks"] = "布尔値 - 如果施放技能中返囘true,否则爲false";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=0; 

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="施放技能中返囘true";



rs = NewTbl("stSearchInformation");

function stGetSearchInformation_Tbl()
	return SuperTreatmentDBF["Unit"]["IsInfListIndex"];
end

rs["inf"]=PlayerColors .."信息判断";
rs["Remarks"]="搜索各种频道的聊天、报警、插件、频道、战斗等文字信息,请先建立【信息判断】才可以调用该函数。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["SelectType"]={};
rs["Arguments"][1]["SelectType"]["Tbl"]="stGetSearchInformation_Tbl";
rs["Arguments"][1]["SelectType"]["TblValue"]="TblAutoIndex";
rs["Arguments"][1]["SelectType"]["Value"]="TblAutoIndex";

rs["Arguments"][1]["Select"]={};


rs["Arguments"][1]["inf"]="【信息判断】条件名称。";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘判断成功过去时间(秒),失败返囘 -1。";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=10000;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;



rs = NewTbl("amtotemtype");
rs["inf"]=PlayerColors .."判断自己图腾类型是否存在";
rs["Remarks"]="成功返囘:图腾名称,图腾效果剩余时间(秒)";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][1]="火焰";
rs["Arguments"][1]["Select"][2]="土";
rs["Arguments"][1]["Select"][3]="水";
rs["Arguments"][1]["Select"][4]="空气";
rs["Arguments"][1]["inf"]="1 = 火焰, 2 = 土, 3 = 水, 4 = 空气";

rs["Returns"]={};
rs["Returns"]["Counts"]=2;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="String";
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["inf"]="成功返囘:图腾名称,失败返囘 nil"

rs["Returns"][2]={};
rs["Returns"][2]["type"]="Number";
rs["Returns"][2]["Percent"]=false;
rs["Returns"][2]["inf"]="成功返囘:图腾效果剩余时间(秒),失败返囘 -1"



rs = NewTbl("amSpellActive");
rs["inf"] = PlayerColors .."判断我的技能是否被激活";
rs["Remarks"] = "激活返囘:true,没激活返囘:false,技能错误返囘:nil\n\n注意:\n请习惯用正确的技能唯一性名称如:\n\n压制(战斗姿态)\n雷霆一击(战斗,防御姿态)";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="技能名称(以激活提示名称爲准,如:【压制(战斗姿态)】要写爲【压制】)";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["inf"]="激活返囘:true,没激活返囘:false,技能错误返囘:nil"


rs = NewTbl("amUnitThreat");
rs["inf"] = PlayerColors .."获得我和目标的仇恨百分値";
rs["Remarks"] = "返囘:获得我和目标的仇恨百分値";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Percent"]=1;
rs["Returns"][1]["inf"]="返囘:获得我和目标的仇恨百分値"

rs = NewTbl("amGetFollowUnit");
rs["inf"]=PlayerColors .."获得跟随目标名称";
rs["Remarks"]="获得跟随目标名称";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="String";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="目标名称";


rs = NewTbl("amIsFollowUnit");
rs["inf"]=PlayerColors .."是否在跟随";
rs["Remarks"]="跟随时返囘true,否则返囘false。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="跟随时返囘true,否则返囘false";


rs = NewTbl("amjl");
rs["inf"]=PlayerColors ..'获得我和目标的距离';
rs["Remarks"]="距离是通过判断不同技能的施放距离来达到目的的,所以距离可能是 5、8、10、30、40 等这些\n\n|r运用时最好是判断范围来达到您的目的,等于距离慎用。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=100000000;
rs["Returns"][1]["inf"]="成功返囘:距离,失败返囘:100000000";


rs = NewTbl("amGetDruidMushrooms");
rs["inf"]=PlayerColors .."德鲁伊野性毒菇冷却时间";
rs["Remarks"]="获得指定的野性毒菇冷却时间";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][false]="最小的冷却时间"
rs["Arguments"][1]["Select"][1]="第1个"
rs["Arguments"][1]["Select"][2]="第2个"
rs["Arguments"][1]["Select"][3]="第3个"
rs["Arguments"][1]["Select"][4]="第4个"
rs["Arguments"][1]["inf"]="野性毒菇序号。\n\n最小的冷却时间:自动判断哪个时间最小。\n第n个:第n个野性毒菇";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘冷却时间,无效返囘-1";


rs = NewTbl("amSpellEmpowerment");
rs["inf"] = PlayerColors .."判断我的技能充能信息";
rs["Remarks"] = "返囘:充能冷却时间(秒)、当前可用次数、最大次数、充能时长(秒)";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="技能名称或技能Id";

rs["Returns"]={};
rs["Returns"]["Counts"]=4;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["inf"]="充能冷却时间(秒)"

rs["Returns"][2]={};
rs["Returns"][2]["type"]="Number";
rs["Returns"][2]["Percent"]=false;
rs["Returns"][2]["inf"]="当前技能可用次数";

rs["Returns"][3]={};
rs["Returns"][3]["type"]="Number";
rs["Returns"][3]["Percent"]=false;
rs["Returns"][3]["inf"]="技能最大次数";

rs["Returns"][4]={};
rs["Returns"][4]["type"]="Number";
rs["Returns"][4]["Percent"]=false;
rs["Returns"][4]["inf"]="技能充能时长(秒)";


rs = NewTbl("amcd");
rs["inf"] = PlayerColors .."获得自己技能/物品冷却时间";
rs["Remarks"] = "返囘:自己技能/物品冷却时间";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="技能/物品名称";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Percent"]=-1;
rs["Returns"][1]["inf"]="成功返囘技能/物品冷却时间,失败爲-1"



rs = NewTbl("amPlaySpellFindText");

rs["inf"]=PlayerColors .."搜索自己技能中的信息";
rs["Remarks"]="搜索自己技能是否有指定内容,成功返囘眞,反之爲假。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=3;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="技能名称/Id";
rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="指定获得技能信息中的第几个信息,一般第1是名称";
rs["Arguments"][3]={};
rs["Arguments"][3]["type"]="String";
rs["Arguments"][3]["inf"]="搜索的关键字";


rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘眞,反之爲假";


rs = NewTbl("amPlaySpellNumber");

rs["inf"]=PlayerColors .."获得自己技能信息中的数字";
rs["Remarks"]="获得自己技能信息中的数字\n如盾牌屏障中吸收的伤害値这些。\n|cffff0000注意：当判断失败(技能不存在)时返囘値都是-1。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=4;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="技能名称/Id";
rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="指定获得技能信息中的第几个信息,一般技能第1是名称";
rs["Arguments"][3]={};
rs["Arguments"][3]["type"]="String";
rs["Arguments"][3]["inf"]="清除的字符\n清除影响获得信息的字符如:数値[12,567]的千分号[,]需要清除不然无法正确获得[12567]。如果有多个字符需要清除请用[|]来分隔。";
rs["Arguments"][4]={};
rs["Arguments"][4]["type"]="String";
rs["Arguments"][4]["inf"]="格式化信息,默认(%d+)。";


rs["Returns"]={};
rs["Returns"]["Counts"]=8;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘数値。";
rs["Returns"][1]["Decimals"]=0;


rs["Returns"][2]={};
rs["Returns"][2]["type"]="Number";
rs["Returns"][2]["Failure"]=-1;
rs["Returns"][2]["inf"]="返囘数値。";
rs["Returns"][2]["Decimals"]=0;


rs["Returns"][3]={};
rs["Returns"][3]["type"]="Number";
rs["Returns"][3]["Failure"]=-1;
rs["Returns"][3]["inf"]="返囘数値。";
rs["Returns"][3]["Decimals"]=0;


rs["Returns"][4]={};
rs["Returns"][4]["type"]="Number";
rs["Returns"][4]["Failure"]=-1;
rs["Returns"][4]["inf"]="返囘数値。";
rs["Returns"][4]["Decimals"]=0;


rs["Returns"][5]={};
rs["Returns"][5]["type"]="Number";
rs["Returns"][5]["Failure"]=-1;
rs["Returns"][5]["inf"]="返囘数値。";
rs["Returns"][5]["Decimals"]=0;


rs["Returns"][6]={};
rs["Returns"][6]["type"]="Number";
rs["Returns"][6]["Failure"]=-1;
rs["Returns"][6]["inf"]="返囘数値。";
rs["Returns"][6]["Decimals"]=0;

rs["Returns"][7]={};
rs["Returns"][7]["type"]="Number";
rs["Returns"][7]["Failure"]=-1;
rs["Returns"][7]["inf"]="返囘数値。";
rs["Returns"][7]["Decimals"]=0;

rs["Returns"][8]={};
rs["Returns"][8]["type"]="Number";
rs["Returns"][8]["Failure"]=-1;
rs["Returns"][8]["inf"]="返囘数値。";
rs["Returns"][8]["Decimals"]=0;



rs = NewTbl("amTalentInfo");

rs["inf"]=PlayerColors .."判断自己天赋是否啓用";
rs["Remarks"]="判断自己天赋是否啓用,啓用返囘眞,反之爲假。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="天赋名称";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="天赋啓用返囘眞,反之爲假";



rs = NewTbl("amStatusInfo");
rs["inf"]=PlayerColors .."人物属性监视(StatusInfo)插件";
rs["Remarks"]="人物属性监视(StatusInfo)插件。\n\n从上到下依次返囘插件显示的値\n\n|r测试宏命令:/run print(amStatusInfo())";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=5;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘第1列数値。";
rs["Returns"][1]["Decimals"]=0;


rs["Returns"][2]={};
rs["Returns"][2]["type"]="Number";
rs["Returns"][2]["Failure"]=-1;
rs["Returns"][2]["inf"]="返囘第2列数値。";
rs["Returns"][2]["Decimals"]=0;


rs["Returns"][3]={};
rs["Returns"][3]["type"]="Number";
rs["Returns"][3]["Failure"]=-1;
rs["Returns"][3]["inf"]="返囘第3列数値。";
rs["Returns"][3]["Decimals"]=0;


rs["Returns"][4]={};
rs["Returns"][4]["type"]="Number";
rs["Returns"][4]["Failure"]=-1;
rs["Returns"][4]["inf"]="返囘第4列数値。";
rs["Returns"][4]["Decimals"]=0;


rs["Returns"][5]={};
rs["Returns"][5]["type"]="Number";
rs["Returns"][5]["Failure"]=-1;
rs["Returns"][5]["inf"]="返囘第5列数値。";
rs["Returns"][5]["Decimals"]=0;

rs = NewTbl("amExtraActionBarCooldown");
rs["inf"] = PlayerColors .."获得额外按钮冷却时间";
rs["Remarks"] = "返囘:额外按钮冷却时间\n\n如:技能[梦境]";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=0; 

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Percent"]=-1;
rs["Returns"][1]["inf"]="成功返囘冷却时间,失败爲-1";



rs = NewTbl("amPetPlayerDistance");
rs["inf"]=SpecialColors .."(FH)我到宠物的距离(无级髙精度)";
rs["Remarks"]="返囘距离。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘:距离";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=100;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;


rs = NewTbl("amPlayerToEnemyRangeCount");
rs["inf"]=SpecialColors .."(FH)获得我附近敌对目标数量";
rs["Remarks"]="获得我附近敌对目标数量";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][2]="2码内"
rs["Arguments"][1]["Select"][5]="5码内"
rs["Arguments"][1]["Select"][8]="8码内"
rs["Arguments"][1]["Select"][10]="10码内"
rs["Arguments"][1]["Select"][12]="12码内"
rs["Arguments"][1]["Select"][15]="15码内"
rs["Arguments"][1]["Select"][20]="20码内"
rs["Arguments"][1]["Select"][30]="30码内"
rs["Arguments"][1]["Select"][35]="35码内"
rs["Arguments"][1]["Select"][40]="40码内"
rs["Arguments"][1]["inf"]="返囘:目标数量。";
rs["Returns"]={};
rs["Returns"][1]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘:目标数量。";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=100;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;


rs = NewTbl("amPlayerToFriendlyRangeCount");
rs["inf"]=PlayerColors .."获得我附近友好目标数量";
rs["Remarks"]="获得我附近友好目标数量";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][2]="2码内"
rs["Arguments"][1]["Select"][5]="5码内"
rs["Arguments"][1]["Select"][8]="8码内"
rs["Arguments"][1]["Select"][10]="10码内"
rs["Arguments"][1]["Select"][12]="12码内"
rs["Arguments"][1]["Select"][15]="15码内"
rs["Arguments"][1]["Select"][20]="20码内"
rs["Arguments"][1]["Select"][30]="30码内"
rs["Arguments"][1]["Select"][35]="35码内"
rs["Arguments"][1]["Select"][40]="40码内"
rs["Arguments"][1]["inf"]="选择范围。";
rs["Returns"]={};
rs["Returns"][1]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘:目标数量。";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=1000;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;


rs = NewTbl("amPlayerRangeRadianEnemyCount");
rs["inf"]=SpecialColors .."(FH)获得我附近前方90°敌对目标数量";
rs["Remarks"]="获得我附近前方90°敌对目标数量";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][2]="2码内"
rs["Arguments"][1]["Select"][5]="5码内"
rs["Arguments"][1]["Select"][8]="8码内"
rs["Arguments"][1]["Select"][10]="10码内"
rs["Arguments"][1]["Select"][12]="12码内"
rs["Arguments"][1]["Select"][15]="15码内"
rs["Arguments"][1]["Select"][20]="20码内"
rs["Arguments"][1]["Select"][30]="30码内"
rs["Arguments"][1]["Select"][35]="35码内"
rs["Arguments"][1]["Select"][40]="40码内"
rs["Arguments"][1]["inf"]="选择范围。";
rs["Returns"]={};
rs["Returns"][1]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘:目标数量。";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=1000;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;


rs = NewTbl("amPlayerRangeRadianFriendlyCount");
rs["inf"]=SpecialColors .."(FH)获得我附近前方90°友好目标数量";
rs["Remarks"]="获得我附近前方90°友好目标数量";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][2]="2码内"
rs["Arguments"][1]["Select"][5]="5码内"
rs["Arguments"][1]["Select"][8]="8码内"
rs["Arguments"][1]["Select"][10]="10码内"
rs["Arguments"][1]["Select"][12]="12码内"
rs["Arguments"][1]["Select"][15]="15码内"
rs["Arguments"][1]["Select"][20]="20码内"
rs["Arguments"][1]["Select"][30]="30码内"
rs["Arguments"][1]["Select"][35]="35码内"
rs["Arguments"][1]["Select"][40]="40码内"
rs["Arguments"][1]["inf"]="选择范围。";
rs["Returns"]={};
rs["Returns"][1]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘:目标数量。";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=1000;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;


rs = NewTbl("amIsEclipseDirection");
rs["inf"] = PlayerColors .."获得德鲁伊日食方向";
rs["Remarks"] = "是太阳返回真(True),反之月亮为假(False)";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=0; 

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["inf"]="是太阳返回真(True),反之月亮为假(False)";


rs = NewTbl("amExtraActionBarPower");
rs["inf"] = PlayerColors .."获得额外能量条数值";
rs["Remarks"] = "获得额外能量条数值，屏幕中间那个一般Boss战的时候会出现。";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=0; 

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Percent"]=-1;
rs["Returns"][1]["inf"]="成功返囘能量值,失败爲-1";


rs = NewTbl("amExtraActionBarSpellName");
rs["inf"] = PlayerColors .."获得额外按钮的技能名称";
rs["Remarks"] = "获得额外按钮的技能名称，屏幕中间那个按钮一般Boss战的时候会出现。";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=0; 

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="String";
rs["Returns"][1]["Percent"]="";
rs["Returns"][1]["inf"]="成功返囘技能名称,失败爲空字符。";



rs = NewTbl("amTargetTargetNotMe");
rs["inf"] = PlayerColors .."当前目标的目标不是我";
rs["Remarks"] = "当前目标的目标不是我。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][0]="当前目标的目标(忽略当前目标是否有目标)不是我"
rs["Arguments"][1]["Select"][1]="当前目标的目标(肯定)不是我"
rs["Arguments"][1]["inf"]="当前目标的目标不是我。";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["inf"]="成功返囘真，失败为假。";


rs = NewTbl("amTargetTargetToMe");
rs["inf"] = PlayerColors .."当前目标的目标是我";
rs["Remarks"] = "当前目标的目标是我";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["inf"]="目标是我返囘真(True)，反之为假(False)。";

rs = NewTbl("amIsFaceTarget");
rs["inf"]=SpecialColors .."(FH)检测面对当前目标";
rs["Remarks"]="返囘値：面对面=1,面对目标背后=0,目标对我背=2,和目标背对背=3,没目标/关闭=-1。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"][1]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘値：面对面=1,面对目标背后=0,目标对我背=2,和目标背对背=3,没目标=-1。";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=10;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;



rs = NewTbl("amIsFaceFocus");
rs["inf"]=SpecialColors .."(FH)检测面对焦点";
rs["Remarks"]="返囘値：面对面=1,面对焦点背后=0,焦点对我背=2,和焦点背对背=3,没目标/关闭=-1。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘値：面对面=1,面对焦点背后=0,焦点对我背=2,和焦点背对背=3,没目标/关闭=-1。";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=10;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;




------------------play end -------------------------------------------------




rs = NewTbl("amisr");

rs["inf"]="|cff00ffff判断技能是否可以对目标施放";
rs["Remarks"]="可以施放返囘眞,反之爲假。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=2;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="技能名称";
rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="unit";
rs["Arguments"][2]["inf"]="目标名称,如:小白、focus、player、target 等等这些都可以使用";



rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="目标名称相同返囘眞,反之爲假";

rs = NewTbl("amComparisonUnit");

rs["inf"]="判断2个目标名称是否相同";
rs["Remarks"]="判断2个目标名称是否相同,成功返囘眞,反之爲假。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=3;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";
rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="String";
rs["Arguments"][2]["inf"]="目标的目标名称。该参数是第1参数的扩展。如：第1参数目标名称爲|cff00ffff焦点|r,当前参数爲|cff00ffff当前目标|r,那麽我们要判断的目标就是:|cff00fffffocus-target|r(焦点目标的目标)其实还可以判断更复杂,请参考论坛|cff00ffff UnitId|r 说明书。";
rs["Arguments"][3]={};
rs["Arguments"][3]["type"]="String";
rs["Arguments"][3]["inf"]="目标名称";


rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="目标名称相同返囘眞,反之爲假";



rs = NewTbl("amUnitAuraFindText");

rs["inf"]="搜索目标的Buff中的信息";
rs["Remarks"]="搜索BUFF中是否有指定内容,成功返囘眞,反之爲假。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=5;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";
rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="String";
rs["Arguments"][2]["inf"]="Buff名称";
rs["Arguments"][3]={};
rs["Arguments"][3]["type"]="Number";
rs["Arguments"][3]["inf"]="指定获得Buff信息中的第几个信息,一般Buff第1是名称,第2是说明,第3是时间";
rs["Arguments"][4]={};
rs["Arguments"][4]["type"]="String";
rs["Arguments"][4]["inf"]="搜索的关键字";
rs["Arguments"][5]={};
rs["Arguments"][5]["type"]="String";
rs["Arguments"][5]["inf"]="指定目标buff类型";
rs["Arguments"][5]["Select"]={};
rs["Arguments"][5]["Select"]["buff"]="有益Buff(buff)"
rs["Arguments"][5]["Select"]["debuff"]="无益Buff(debuff)"
rs["Arguments"][5]["Select"][false]="全部Buff(不指定buff会影响速度)"

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘眞,反之爲假";





rs = NewTbl("amUnitAuraNumber");

rs["inf"]="获得目标的Buff信息中的数字";
rs["Remarks"]="获得目标的Buff信息中的数字\n如坐骑Buff的地面、飞行速度 100%、310%这些。\n|cffff0000注意：当判断失败(buff、目标不存在)时返囘値都是-1。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=5;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";
rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="String";
rs["Arguments"][2]["inf"]="Buff名称";
rs["Arguments"][3]={};
rs["Arguments"][3]["type"]="Number";
rs["Arguments"][3]["inf"]="指定获得Buff信息中的第几个信息,一般Buff第1是名称,第2是说明,第3是时间";
rs["Arguments"][4]={};
rs["Arguments"][4]["type"]="String";
rs["Arguments"][4]["inf"]="格式化信息,默认(%d+)。";
rs["Arguments"][5]={};
rs["Arguments"][5]["type"]="String";
rs["Arguments"][5]["inf"]="指定目标buff类型";
rs["Arguments"][5]["Select"]={};
rs["Arguments"][5]["Select"]["buff"]="有益Buff(buff)"
rs["Arguments"][5]["Select"]["debuff"]="无益Buff(debuff)"
rs["Arguments"][5]["Select"][false]="全部Buff(不指定buff会影响速度)"

rs["Returns"]={};
rs["Returns"]["Counts"]=8;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘数値。";
rs["Returns"][1]["Decimals"]=0;


rs["Returns"][2]={};
rs["Returns"][2]["type"]="Number";
rs["Returns"][2]["Failure"]=-1;
rs["Returns"][2]["inf"]="返囘数値。";
rs["Returns"][2]["Decimals"]=0;


rs["Returns"][3]={};
rs["Returns"][3]["type"]="Number";
rs["Returns"][3]["Failure"]=-1;
rs["Returns"][3]["inf"]="返囘数値。";
rs["Returns"][3]["Decimals"]=0;


rs["Returns"][4]={};
rs["Returns"][4]["type"]="Number";
rs["Returns"][4]["Failure"]=-1;
rs["Returns"][4]["inf"]="返囘数値。";
rs["Returns"][4]["Decimals"]=0;


rs["Returns"][5]={};
rs["Returns"][5]["type"]="Number";
rs["Returns"][5]["Failure"]=-1;
rs["Returns"][5]["inf"]="返囘数値。";
rs["Returns"][5]["Decimals"]=0;


rs["Returns"][6]={};
rs["Returns"][6]["type"]="Number";
rs["Returns"][6]["Failure"]=-1;
rs["Returns"][6]["inf"]="返囘数値。";
rs["Returns"][6]["Decimals"]=0;

rs["Returns"][7]={};
rs["Returns"][7]["type"]="Number";
rs["Returns"][7]["Failure"]=-1;
rs["Returns"][7]["inf"]="返囘数値。";
rs["Returns"][7]["Decimals"]=0;

rs["Returns"][8]={};
rs["Returns"][8]["type"]="Number";
rs["Returns"][8]["Failure"]=-1;
rs["Returns"][8]["inf"]="返囘数値。";
rs["Returns"][8]["Decimals"]=0;







rs = NewTbl("amnewspelltime");
rs["inf"]="目标技能冷却参考时间";
rs["Remarks"]='获得目标技能冷却参考时间 time = amnewspelltime(Unit,Spell)|r\nlocal Time = amnewspelltime("target","英雄徽章"),返囘的是过去的时间,就是你施放技能后到现在经历了多长时间。这时间仅提供惨考,因为很多技能和天赋都影响技能的冷却状态。';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=2;
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";
rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="String";
rs["Arguments"][2]["inf"]="技能、物品、饰品 名称";


rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["Minimum"]=0.00;
rs["Returns"][1]["Maximum"]=1000.00;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=0.01;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0.00;
rs["Returns"][1]["inf"]="过去的时间(秒)";


--------------------------------------------

rs = NewTbl("UnitAffectingCombat");
rs["inf"] = "目标是否在战斗状态";
rs["Remarks"] = "布尔値 - 若指定的单位处于战斗中则返囘true,否则返囘false。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="战斗中返囘true";

rs = NewTbl("UnitInParty");
rs["inf"] = "目标是否在队伍中";
rs["Remarks"] = "布尔値 - 如果指定目标位于你的队伍里,则返囘true,否则返囘false。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="队伍中返囘true";



rs = NewTbl("UnitInRaid");
rs["inf"] = "目标是否在团队中";
rs["Remarks"] = "布尔値 - 如果指定目标位于你的团队里,则返囘true,否则返囘false。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="团队中返囘true";



rs = NewTbl("UnitIsCharmed");
rs["inf"] = "目标是否被精神控制";
rs["Remarks"] = "布尔値 - 如果目标被精神控制（卽：被魅惑）,那麽値爲true,否则値爲false。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="被精神控制返囘true";



rs = NewTbl("UnitIsCivilian");
rs["inf"] = "目标是否平民";
rs["Remarks"] = "布尔値 - 如果目标属于平民,则値爲true,否则値爲false。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="属于平民返囘true";



rs = NewTbl("UnitIsConnected");
rs["inf"] = "目标是否在綫";
rs["Remarks"] = "布尔値 - 对于正常连綫的玩家以及NPC来说,値爲true,对于掉綫或者不存在的目标来说,値爲false。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="在綫返囘true";



rs = NewTbl("UnitIsCorpse");
rs["inf"] = "目标是否屍体";
rs["Remarks"] = "布尔値 - 如果指定的目标是一具屍体,则値爲true,否则爲false。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="是屍体返囘true";



rs = NewTbl("UnitIsDead");
rs["inf"] = "目标是否死亡";
rs["Remarks"] = "布尔値 - 如果目标已经死亡,那麽値爲true,否则値爲false。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="已经死亡返囘true";



rs = NewTbl("UnitIsDeadOrGhost");
rs["inf"] = "目标是否死亡或灵魂状态";
rs["Remarks"] = "布尔値 - 如果目标已经死亡或者是幽灵状态,那麽値爲true,否则値爲false。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="已经死亡/幽灵返囘true";



rs = NewTbl("UnitIsGhost");
rs["inf"] = "目标是否灵魂状态";
rs["Remarks"] = "布尔値 - 如果目标是幽灵状态,那麽値爲true,否则値爲false。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="幽灵状态返囘true";


rs = NewTbl("UnitIsPVP");
rs["inf"] = "目标是否PVP状态";
rs["Remarks"] = "布尔値 - 如果目标处于PvP状态,则値爲true,否则爲false。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";


rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="PvP状态返囘true";



rs = NewTbl("UnitIsPVPFreeForAll");
rs["inf"] = "目标是否自由PVP状态";
rs["Remarks"] = "布尔値 - 如果目标处于自由PvP状态,则値爲true,否则爲false。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="自由PvP状态返囘true";



rs = NewTbl("UnitIsPartyLeader");
rs["inf"] = "目标是否队长";
rs["Remarks"] = "布尔値 - 如果指定的目标是当前队伍的队长,値爲true,否则爲false。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="是队长返囘true";



rs = NewTbl("UnitIsPlayer");
rs["inf"] = "目标是否玩家";
rs["Remarks"] = "布尔値 - 如果指定的目标是名由玩家控制的角色,値爲true,否则爲false。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="是玩家返囘true";



rs = NewTbl("UnitIsPlusMob");
rs["inf"] = "目标是否比普通怪厉害";
rs["Remarks"] = "布尔値 - 如果指定目标是精英怪物,则値爲true,否则false。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="是精英怪物返囘true";


rs = NewTbl("UnitIsTapped");
rs["inf"] = "目标NPC是否已被攻击";
rs["Remarks"] = "布尔値 - 如果指定目标已经被攻击了,则値爲true,否则false。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="被攻击返囘true";



rs = NewTbl("UnitIsTappedByPlayer");
rs["inf"] = "目标NPC已被其他玩家攻击";
rs["Remarks"] = "布尔値 - 如果指定目标已经被当前玩家攻击了,则値爲true,否则false。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="被攻击返囘true";



rs = NewTbl("UnitIsTrivial");
rs["inf"] = "目标是否无价値";
rs["Remarks"] = "布尔値 - 如果指定目标已没有挑战性,卽击杀后没有经验或者荣誉値,则値爲true,否则false。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="被攻击返囘true";



rs = NewTbl("UnitIsVisible");
rs["inf"] = "目标是否能被正常判断";
rs["Remarks"] = "布尔値 - 如果目标对于游戏客户端是[可见]的,则値爲true,否则爲false。\n\n|r游戏的机制：当某个物件进入到以当前玩家爲中心100码范围内时,则由服务器通知客户端载入这件物品,此时对于该物件,该函数返囘true。该函数跟玩家视綫范围没有关系,只是指示对于所指定的目标,客户端是否已经掌握了更详细的数据。很多以Unit开头的函数,在有效范围外和有效范围内返囘的结果是不同的,使用前最好用UnitIsVisible函数确认当前状态。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="可见返囘true";


rs = NewTbl("UnitOnTaxi");
rs["inf"] = "目标是否骑乘状态";
rs["Remarks"] = "布尔値 - 如果指定的目标在乘坐自动飞行路綫坐骑,则値爲true,否则値爲false。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="乘坐返囘true";



rs = NewTbl("UnitPlayerControlled");
rs["inf"] = "目标是否被玩家控制中";
rs["Remarks"] = "布尔値 - 如果指定的目标是名由玩家控制的角色,値爲true,否则爲false。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="玩家控制的返囘true";


rs = NewTbl("UnitPlayerOrPetInParty");
rs["inf"] = "目标是否同一队伍";
rs["Remarks"] = "布尔値 - 如果指定目标位于你的队伍里(包括宠物),则返囘true,否则返囘false。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="队伍里返囘true";


rs = NewTbl("UnitPlayerOrPetInRaid");
rs["inf"] = "目标是否同一团队";
rs["Remarks"] = "布尔値 - 如果指定目标位于你的团队里(包括宠物),则返囘true,否则返囘false。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="团队里返囘true";



rs = NewTbl("amaura");
rs["inf"] = "目标Buff剩余时间";
rs["Remarks"] = "返囘: time, rank, count, buffType";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=4; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="Buff名称";

rs["Arguments"][2]={}; 
rs["Arguments"][2]["type"]="unit";
rs["Arguments"][2]["inf"]="目标名称";

rs["Arguments"][3]={}; 
rs["Arguments"][3]["type"]="Number";
rs["Arguments"][3]["Select"]={};
rs["Arguments"][3]["Select"][0]="自己"
rs["Arguments"][3]["Select"][1]="不是自己"
rs["Arguments"][3]["Select"][2]="任何人"
rs["Arguments"][3]["inf"]="指定Buff是谁施放的";

rs["Arguments"][4]={}; 
rs["Arguments"][4]["type"]="Number";
rs["Arguments"][4]["Select"]={};
rs["Arguments"][4]["Select"][0]="所有的Buff"
rs["Arguments"][4]["Select"][1]="有益的Buff"
rs["Arguments"][4]["Select"][2]="有害的Buff"
rs["Arguments"][4]["Select"][3]="有益的Buff可驱散/施放的"
rs["Arguments"][4]["Select"][4]="有害的Buff可驱散/施放的"
rs["Arguments"][4]["inf"]="指定Buff的类型";


rs["Returns"]["Counts"]=4;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="剩余时间(time):失败返囘 -1";



rs["Returns"][2]={};
rs["Returns"][2]["type"]="Number";
rs["Returns"][2]["Failure"]=false;
rs["Returns"][2]["inf"]="等级(rank):失败返囘 nil";
rs["Returns"][2]["Minimum"]=0;
rs["Returns"][2]["Maximum"]=1000;
rs["Returns"][2]["Value"]=0;
rs["Returns"][2]["Step"]=1;
rs["Returns"][2]["Percent"]=false;
rs["Returns"][2]["Decimals"]=0;

rs["Returns"][3]={};
rs["Returns"][3]["type"]="Number";
rs["Returns"][3]["Failure"]=false;
rs["Returns"][3]["inf"]="叠加层数(count):失败返囘 nil";
rs["Returns"][3]["Minimum"]=0;
rs["Returns"][3]["Maximum"]=1000;
rs["Returns"][3]["Value"]=0;
rs["Returns"][3]["Step"]=1;
rs["Returns"][3]["Percent"]=false;
rs["Returns"][3]["Decimals"]=0;

rs["Returns"][4]={};
rs["Returns"][4]["type"]="String";
rs["Returns"][4]["Failure"]=false;
rs["Returns"][4]["inf"]="Buff类型:魔法\\诅咒\\疾病\\中毒(Magic\\Curse\\Disease\\Poison)失败返囘 nil";


rs = NewTbl("amauraex");
rs["inf"] = "目标Buff剩余时间(超级助手适用)";
rs["Remarks"] = "返囘: time, rank, count, buffType";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=4; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="Buff名称";

rs["Arguments"][2]={}; 
rs["Arguments"][2]["type"]="unit";
rs["Arguments"][2]["inf"]="目标名称";

rs["Arguments"][3]={}; 
rs["Arguments"][3]["type"]="Number";
rs["Arguments"][3]["Select"]={};
rs["Arguments"][3]["Select"][0]="自己"
rs["Arguments"][3]["Select"][1]="不是自己"
rs["Arguments"][3]["Select"][2]="任何人"
rs["Arguments"][3]["inf"]="指定Buff是谁施放的";

rs["Arguments"][4]={}; 
rs["Arguments"][4]["type"]="Number";
rs["Arguments"][4]["Select"]={};
rs["Arguments"][4]["Select"][0]="所有的Buff"
rs["Arguments"][4]["Select"][1]="有益的Buff"
rs["Arguments"][4]["Select"][2]="有害的Buff"
rs["Arguments"][4]["Select"][3]="有益的Buff可驱散/施放的"
rs["Arguments"][4]["Select"][4]="有害的Buff可驱散/施放的"
rs["Arguments"][4]["inf"]="指定Buff的类型";


rs["Returns"]["Counts"]=4;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="剩余时间(time):失败返囘 -1";



rs["Returns"][2]={};
rs["Returns"][2]["type"]="Number";
rs["Returns"][2]["Failure"]=false;
rs["Returns"][2]["inf"]="等级(rank):失败返囘 -1";
rs["Returns"][2]["Minimum"]=0;
rs["Returns"][2]["Maximum"]=1000;
rs["Returns"][2]["Value"]=0;
rs["Returns"][2]["Step"]=1;
rs["Returns"][2]["Percent"]=-1;
rs["Returns"][2]["Decimals"]=0;

rs["Returns"][3]={};
rs["Returns"][3]["type"]="Number";
rs["Returns"][3]["Failure"]=false;
rs["Returns"][3]["inf"]="叠加层数(count):失败返囘 -1";
rs["Returns"][3]["Minimum"]=0;
rs["Returns"][3]["Maximum"]=1000;
rs["Returns"][3]["Value"]=0;
rs["Returns"][3]["Step"]=1;
rs["Returns"][3]["Percent"]=false;
rs["Returns"][3]["Decimals"]=0;

rs["Returns"][4]={};
rs["Returns"][4]["type"]="String";
rs["Returns"][4]["Failure"]="";
rs["Returns"][4]["inf"]="Buff类型:魔法\\诅咒\\疾病\\中毒(Magic\\Curse\\Disease\\Poison)失败返囘 空字符";




rs = NewTbl("UnitLevel");
rs["inf"] = "目标的当前等级";
rs["Remarks"] = "返囘: 目标的当前等级整数値";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";


rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=0;
rs["Returns"][1]["inf"]="整数値 - 指定的目标的等级";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=200;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;


rs = NewTbl("amUnitClassification");
rs["inf"] = "判断目标的分类类别";
rs["Remarks"] = '目标的分类类别:|r\n"trivial" - 细小\n"normal" - 普通\n"rare" - 稀有\n"elite" - 精英\n"rareelite" - 稀有精英\n"worldboss" - 首领';
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=2; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Arguments"][2]={}; 
rs["Arguments"][2]["type"]="String";
rs["Arguments"][2]["Select"]={};
rs["Arguments"][2]["Select"]["normal"]="普通"
rs["Arguments"][2]["Select"]["trivial"]="细小"
rs["Arguments"][2]["Select"]["rare"]="精英"
rs["Arguments"][2]["Select"]["elite"]="稀有"
rs["Arguments"][2]["Select"]["rareelite"]="稀有精英"
rs["Arguments"][2]["Select"]["worldboss"]="首领"
rs["Arguments"][2]["inf"]='目标的分类类别';

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";




rs = NewTbl("ambuffcount");
rs["inf"] = "获得指定目标Buff分类数量及信息";
rs["Remarks"] = "返囘: Buff分类数量和用逗号【,】分开的 buff 字符串列表";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=4; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Arguments"][2]={}; 
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["Select"]={};
rs["Arguments"][2]["Select"][0]="自己"
rs["Arguments"][2]["Select"][1]="不是自己"
rs["Arguments"][2]["Select"][2]="任何人"
rs["Arguments"][2]["inf"]="指定Buff是谁施放的";

rs["Arguments"][3]={}; 
rs["Arguments"][3]["type"]="String";
rs["Arguments"][3]["Select"]={};
rs["Arguments"][3]["Select"]["Magic"]="魔法"
rs["Arguments"][3]["Select"]["Curse"]="诅咒"
rs["Arguments"][3]["Select"]["Disease"]="疾病"
rs["Arguments"][3]["Select"]["Poison"]="中毒"
rs["Arguments"][3]["Select"]["Magic,Curse"]="魔法/诅咒"
rs["Arguments"][3]["Select"]["Disease,Poison"]="疾病/中毒"
rs["Arguments"][3]["Select"]["Magic,Curse,Disease,Poison"]="全部"
rs["Arguments"][3]["inf"]="判断是否有这些Buff的类型";

rs["Arguments"][4]={}; 
rs["Arguments"][4]["type"]="Number";
rs["Arguments"][4]["Select"]={};
rs["Arguments"][4]["Select"][0]="有害的Buff"
rs["Arguments"][4]["Select"][1]="有益的Buff"
rs["Arguments"][4]["Select"][2]="有害的Buff可驱散/施放的"
rs["Arguments"][4]["Select"][3]="有益的Buff可驱散/施放的"
rs["Arguments"][4]["inf"]="指定Buff的类型";



rs["Returns"]["Counts"]=2;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="整数値 - Buff分类数量。失败返囘错误参数序号的负値（如：-1）,无Buff返囘0 ";
rs["Returns"][1]["Minimum"]=0;
rs["Returns"][1]["Maximum"]=1000;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;

rs["Returns"][2]={};
rs["Returns"][2]["type"]="String";
rs["Returns"][2]["Failure"]=false;
rs["Returns"][2]["inf"]="字符串 - 返囘用逗号【,】分开的buff列表";


--UnitCreatureFamily

rs = NewTbl("UnitCreatureFamily");
rs["inf"]='目标的生物种类';
rs["Remarks"]='指定目标的生物种类,例如:"螃蟹","狼",在中文客户端中返囘値爲中文,如果目标没有生物种类,则返囘nil';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Returns"]={}
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="String";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]='返囘目标的生物种类,例如:"螃蟹","狼",在中文客户端中返囘値爲中文,如果目标没有生物种类,则返囘nil';



--UnitCreatureType

rs = NewTbl("UnitCreatureType");
rs["inf"]='目标的生物类型';
rs["Remarks"]='目标的生物类型,例如:"人形生物","恶魔"或者"野兽"等,在中文客户端中返囘値爲中文,如果目标没有生物类型(游戏界面显示爲"未指定"),则返囘nil';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Returns"]={}
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="String";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]='返囘目标的生物类型,例如:"人形生物","恶魔"或者"野兽"等,在中文客户端中返囘値爲中文,如果目标没有生物类型(游戏界面显示爲"未指定"),则返囘nil';


--UnitHealthMax

rs = NewTbl("UnitHealthMax");
rs["inf"]='目标的最大生命値';
rs["Remarks"]='如果指定的单位是团队/小队中的友好单位(玩家/宠物),则返囘精确的生命値最大値；反之可能返囘百分比';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=0;
rs["Returns"][1]["inf"]="返囘生命値最大値";


rs = NewTbl("aml");
rs["inf"]='目标的生命値或百分比';
rs["Remarks"]='如果指定的单位是团队/小队中的友好单位(玩家/宠物),则返囘精确的生命値最大値；反之返囘100%';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=3;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Arguments"][2]={}; 
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["Select"]={};
rs["Arguments"][2]["Select"][0]="获得血量"
rs["Arguments"][2]["Select"][1]="获得血量百分比"

rs["Arguments"][2]["inf"]="指定要获取的表示方式";

rs["Arguments"][3]={}; 
rs["Arguments"][3]["type"]="Number";
rs["Arguments"][3]["Select"]={};
rs["Arguments"][3]["Select"][0]="当前血量"
rs["Arguments"][3]["Select"][1]="为缺血量（血量最髙値减去当前値）"
rs["Arguments"][3]["inf"]="指定要获取数据的类型";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘生命値";



rs = NewTbl("GetUnitSpeed");
rs["inf"]='目标的移动速度';
rs["Remarks"]='返囘数値,目标的移动速度(码/秒),不动爲0';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=0;
rs["Returns"][1]["inf"]="返囘移动速度(码/秒)値";







rs = NewTbl("amsubgroup");
rs["inf"] = "判断团队小队编号";
rs["Remarks"] = "整数値 - 如果在小队返囘编号数字,否则返囘 0";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘小队编号,失败返囘 0";
rs["Returns"][1]["Minimum"]=0;
rs["Returns"][1]["Maximum"]=8;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;



rs = NewTbl("amUnitGetIncomingHeals");
rs["inf"]='目标的治疗预测量';
rs["Remarks"]='你要明白开始施放治疗技能后才有预测量,所以这数値在施放后才获得。是否在施放技能由服务器来决定那麽说这个値和你施放技能是不同步的（服务器及网络都有延时）。\n|cffff0000注意:|r一些持续性的治疗技能也会引起治疗预测,如：牧师的恢复直到这Buff效果消失。';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";
rs["Returns"]={};
rs["Returns"]["Counts"]=3;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘所有的预测治疗量";

rs["Returns"][2]={};
rs["Returns"][2]["type"]="Number";
rs["Returns"][2]["Failure"]=-1;
rs["Returns"][2]["inf"]="返囘预测治疗过量値";

rs["Returns"][3]={};
rs["Returns"][3]["type"]="Number";
rs["Returns"][3]["Failure"]=-1;
rs["Returns"][3]["inf"]="返囘我对该目标的预测治疗量";



rs = NewTbl("amGetUnitName");
rs["inf"]='获得目标名称';
rs["Remarks"]="获得目标名称(含服务器名称)";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="String";
rs["Returns"][1]["Failure"]="";
rs["Returns"][1]["inf"]="成功返囘:目标名称,失败返囘:nil";


rs = NewTbl("GetNumSubgroupMembers");
rs["inf"]='获得小队队员数量';
rs["Remarks"]='获得小队队员数量,不包含自己哦';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=0;
rs["Returns"][1]["inf"]="返囘整数字:队员数量,没小队返囘0";

rs = NewTbl("GetRealNumPartyMembers");
rs["inf"]='获得小队队员数量';
rs["Remarks"]='获得小队队员数量,不包含自己哦。\n\n跟 GetNumSubgroupMembers 有什麽不同没发现';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=0;
rs["Returns"][1]["inf"]="返囘整数字:队员数量,没小队返囘0";



rs = NewTbl("GetNumGroupMembers");
rs["inf"]='获得团队团员数量';
rs["Remarks"]='获得团队团员数量。';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=0;
rs["Returns"][1]["inf"]="返囘整数字:团队团员数量,没团队返囘0";



rs = NewTbl("amCombustionHelper");
rs["inf"]='获得"'..SpellRemindColors..'火法天赋燃烧助手插件|r"报警提示';
rs["Remarks"]='CombustionHelper火法天赋燃烧助手,监视火法的各个主要DOT（活动炸弹、炎爆术、点燃）的计时和造成的伤害,帮助法师更好的掌握施放"燃烧"的时机。\n\n|r注意:\n调用本函数时【音频警告】及【阈値】选项都无条件自动开啓。\n\n如果不需要发出声音请插件设定里【图形化选项】>【阀値警告】> None。\n\n下载:\nhttp://wowui.w.163.com/ui/classes/CombustionHelper.html';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="提示报警时返囘:true,否则返囘false";


rs = NewTbl("amGetCombustionHelperInf");
rs["inf"]='获得"'..SpellRemindColors..'火法天赋燃烧助手插件|r"数字信息';
rs["Remarks"]='CombustionHelper火法天赋燃烧助手,监视火法的各个主要DOT（活动炸弹、炎爆术、点燃）的计时和造成的伤害,帮助法师更好的掌握施放"燃烧"的时机。\n\n下载:\nhttp://wowui.w.163.com/ui/classes/CombustionHelper.html';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;
rs["Returns"]={};
rs["Returns"]["Counts"]=7;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=0;
rs["Returns"][1]["inf"]="返囘活动炸弹伤害数値。";
rs["Returns"][1]["Decimals"]=0;
rs["Returns"][1]["Minimum"]=0;
rs["Returns"][1]["Maximum"]=999999;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;

rs["Returns"][2]={};
rs["Returns"][2]["type"]="Number";
rs["Returns"][2]["Failure"]=0;
rs["Returns"][2]["inf"]="返囘活动炸弹时间数値。";
rs["Returns"][2]["Decimals"]=1;
rs["Returns"][2]["Minimum"]=0;
rs["Returns"][2]["Maximum"]=100;
rs["Returns"][2]["Value"]=0;
rs["Returns"][2]["Step"]=0.1;

rs["Returns"][3]={};
rs["Returns"][3]["type"]="Number";
rs["Returns"][3]["Failure"]=0;
rs["Returns"][3]["inf"]="返囘点燃伤害数値。";
rs["Returns"][3]["Decimals"]=0;
rs["Returns"][3]["Minimum"]=0;
rs["Returns"][3]["Maximum"]=999999;
rs["Returns"][3]["Value"]=0;
rs["Returns"][3]["Step"]=1;

rs["Returns"][4]={};
rs["Returns"][4]["type"]="Number";
rs["Returns"][4]["Failure"]=0;
rs["Returns"][4]["inf"]="返囘点燃时间数値。";
rs["Returns"][4]["Decimals"]=1;
rs["Returns"][4]["Minimum"]=0;
rs["Returns"][4]["Maximum"]=100;
rs["Returns"][4]["Value"]=0;
rs["Returns"][4]["Step"]=0.1;


rs["Returns"][5]={};
rs["Returns"][5]["type"]="Number";
rs["Returns"][5]["Failure"]=0;
rs["Returns"][5]["inf"]="返囘炎爆术伤害数値。";
rs["Returns"][5]["Decimals"]=0;
rs["Returns"][5]["Minimum"]=0;
rs["Returns"][5]["Maximum"]=999999;
rs["Returns"][5]["Value"]=0;
rs["Returns"][5]["Step"]=1;

rs["Returns"][6]={};
rs["Returns"][6]["type"]="Number";
rs["Returns"][6]["Failure"]=0;
rs["Returns"][6]["inf"]="返囘炎爆术时间数値。";
rs["Returns"][6]["Decimals"]=1;
rs["Returns"][6]["Minimum"]=0;
rs["Returns"][6]["Maximum"]=100;
rs["Returns"][6]["Value"]=0;
rs["Returns"][6]["Step"]=0.1;

rs["Returns"][7]={};
rs["Returns"][7]["type"]="Number";
rs["Returns"][7]["Failure"]=0;
rs["Returns"][7]["inf"]="返囘临界炽焰时间数値。";
rs["Returns"][7]["Decimals"]=1;
rs["Returns"][7]["Minimum"]=0;
rs["Returns"][7]["Maximum"]=100;
rs["Returns"][7]["Value"]=0;
rs["Returns"][7]["Step"]=0.1;


rs = NewTbl("amArenaTalent");
rs["inf"]='获得竞技场敌方天赋';
rs["Remarks"]='获得竞技场敌方天赋(需要安装Gladius插件)。';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="String";
rs["Returns"][1]["Failure"]="";
rs["Returns"][1]["inf"]="成功返囘:天赋名称,否则空字符";


rs = NewTbl("amAffDots");
rs["inf"]='获得AffDots插件信息';
rs["Remarks"]='获得AffDots插件信息。\n鼠标移到插件技能图标上时,鼠标会提示返囘値和技能的对应序号。|r\n\n支持AffDots(1.15版本)';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="目标ID,当前目标=0,焦点目标=1";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][0]="当前目标"
rs["Arguments"][1]["Select"][1]="焦点目标"

rs["Returns"]={};
rs["Returns"]["Counts"]=6;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="成功返囘第1个数字,否则爲-1";
rs["Returns"][2]={};
rs["Returns"][2]["type"]="Number";
rs["Returns"][2]["Failure"]=-1;
rs["Returns"][2]["inf"]="成功返囘第2个数字,否则爲-1";
rs["Returns"][3]={};
rs["Returns"][3]["type"]="Number";
rs["Returns"][3]["Failure"]=-1;
rs["Returns"][3]["inf"]="成功返囘第3个数字,否则爲-1";

rs["Returns"][4]={};
rs["Returns"][4]["type"]="Number";
rs["Returns"][4]["Failure"]=-1;
rs["Returns"][4]["inf"]="成功返囘第4个数字,否则爲-1";

rs["Returns"][5]={};
rs["Returns"][5]["type"]="Number";
rs["Returns"][5]["Failure"]=-1;
rs["Returns"][5]["inf"]="成功返囘第5个数字,否则爲-1";

rs["Returns"][6]={};
rs["Returns"][6]["type"]="Number";
rs["Returns"][6]["Failure"]=-1;
rs["Returns"][6]["inf"]="成功返囘第6个数字,否则爲-1";


rs = NewTbl("amAffDotsVer120");
rs["inf"]='获得AffDots(Ver1.20)插件信息';
rs["Remarks"]='设定目标和技能,获得AffDots插件信息。|r\n\n不支持1.20前版本';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=2;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="目标ID,当前目标=0,焦点目标=1";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][0]="当前目标"
rs["Arguments"][1]["Select"][1]="焦点目标"

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="String";
rs["Arguments"][2]["inf"]="技能名称或者Id";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="成功返囘数値,否则爲-1";



rs = NewTbl("amPetTargetDistance");
rs["inf"]=SpecialColors.."(FH)宠物到当前目标的距离";
rs["Remarks"]="返囘距离。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘数值";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=100;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;

rs = NewTbl("amPetFocusDistance");
rs["inf"]=SpecialColors.."(FH)宠物到焦点的距离";
rs["Remarks"]="返囘距离。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘数值";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=100;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;

rs = NewTbl("amTargetFocusDistance");
rs["inf"]=SpecialColors.."(FH)当前目标到焦点的距离";
rs["Remarks"]="返囘距离。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘数值";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=100;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;

rs = NewTbl("amPetPetTargetDistance");
rs["inf"]=SpecialColors.."(FH)宠物到宠物当前目标的距离";
rs["Remarks"]="返囘距离。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘数值";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=100;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;

-------test------
rs = NewTbl("amGetDruidHealMushrooms");
rs["inf"]="德鲁伊治疗蘑菇持续时间";
rs["Remarks"]="指定治疗毒菇的释放延时时间";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="延时时间。\n\n";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘距离指定延时时间还剩多少秒,无效返囘-1";

rs = NewTbl("FHObjectDistance");
rs["inf"]=SpecialColors.."(FH)返回两个单位间的距离";
rs["Remarks"]="返囘距离。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=2;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="第一个单位名称。如:小白、focus、player、target、pet等等这些都可以使用";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="String";
rs["Arguments"][2]["inf"]="第二个单位名称,如:小白、focus、player、target、pet等等这些都可以使用";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘:距离";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=100;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;

rs = NewTbl("amBuffShield");
rs["inf"]='获得目标身上某技能的数值信息';
rs["Remarks"]='设定目标和技能,获得技能的数值信息。|r\n\n测试测试';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=3;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="String";
rs["Arguments"][2]["inf"]="技能名称，如真言术：盾，坚毅，恢复";

rs["Arguments"][3]={}; 
rs["Arguments"][3]["type"]="Number";
rs["Arguments"][3]["inf"]="是否检测释放者为自己:1为检测,0为不检测。";
rs["Arguments"][3]["Select"]={};
rs["Arguments"][3]["Select"][1]="检测施法者为自己";
rs["Arguments"][3]["Select"][0]="不检测施法者为自己";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=0;
rs["Returns"][1]["inf"]="成功返囘数値,否则爲0";

rs = NewTbl("amCountLowPlayers");
rs["inf"]='获得目标半径范围内少于设定血量比的团队成员数量';
rs["Remarks"]='设定目标、血量比和半径,取得符合要求的团队成员数。|r\n\n此函数不解锁也可用。测试测试';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=3;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="血量百分比上限";

rs["Arguments"][3]={};
rs["Arguments"][3]["type"]="Number";
rs["Arguments"][3]["inf"]="计算半径，一般为技能最大覆盖范围";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=0;
rs["Returns"][1]["inf"]="成功返囘数値,否则爲0";

rs = NewTbl("amMistCounts");
rs["inf"]='获得团队内特定buff少于设定血量比的成员数量';
rs["Remarks"]='设定目标、判断开关和buff名称,取得符合要求的团队成员数。|r\n\n此函数不解锁也可用。测试测试';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=3;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="血量百分比上限";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="判断开关，不检测即为全体血量判断，检测即检测特定buff，适用于镇魂引和源生等技能。";
rs["Arguments"][2]["Default"]={};
rs["Arguments"][2]["Default"]["value"]=0;
rs["Arguments"][2]["Select"]={};
rs["Arguments"][2]["Select"][0]="不检测"
rs["Arguments"][2]["Select"][1]="检测"

rs["Arguments"][3]={};
rs["Arguments"][3]["type"]="String";
rs["Arguments"][3]["inf"]="技能名称（要检测的技能名称 如：回春术、复苏之雾）";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=0;
rs["Returns"][1]["inf"]="成功返囘数値,否则爲0";

rs = NewTbl("FHgetFacing");
rs["inf"] = SpecialColors.."(FH)判定目标是否在玩家的一定角度视角内";
rs["Remarks"] = "需要FireHack解锁,布尔値 - 在视野内返囘true,不在返回false\n\nFH高级函数，测试测试。by龙套";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=2;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称（获取目标进行参考判定，位置参考目标）";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="判定的视野角度，此处角度为玩家视野中线左右各多少度，默认为视野左右各90度";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="位于u1视野范围内返回true";

rs = NewTbl("FHINSight");
rs["inf"] = SpecialColors.."(FH)判定目标单位与玩家之间是否不存在屏障";
rs["Remarks"] = "需要FireHack解锁,布尔値 - 没有屏障返囘true,否则false\n\nFH高级函数，测试测试。";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=1;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标单位名称（获取目标进行参考判定）";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="位于u1视野范围内返回true";

rs = NewTbl("FHGetRangeEnemyCount");
rs["inf"] = SpecialColors.."(FH)统计指定目标半径范围内敌对目标数量";
rs["Remarks"] = "需要FireHack解锁,布尔値 - 成功返囘true,失败返回false\n\nFH高级函数。By暗影流沙";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=2; 

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="指定目标。";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="搜索范围半径码数,比如100";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘找到的个数";



rs = NewTbl("amGetStagger");
rs["inf"]='获得武僧Tank身上醉拳吸收的伤害值总量';
rs["Remarks"]='获得醉拳吸收伤害值信息。|r\n\n测试测试';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=0;
rs["Returns"][1]["inf"]="成功返囘数値,否则爲0";

rs = NewTbl("IsLeftShiftKeyDown");
rs["inf"] = "|cff63B8FF判断左侧SHIFT键是否按下";
rs["Remarks"] = "按下为真,反之为假";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="按下为真,反之为假";

rs = NewTbl("IsLeftControlKeyDown");
rs["inf"] = "|cff63B8FF判断左侧CONTROL键是否按下";
rs["Remarks"] = "按下为真,反之为假";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="按下为真,反之为假";

rs = NewTbl("IsLeftAltKeyDown");
rs["inf"] = "|cff63B8FF判断左侧ALT键是否按下";
rs["Remarks"] = "按下为真,反之为假";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="按下为真,反之为假";

rs = NewTbl("IsRightShiftKeyDown");
rs["inf"] = "|cffFFBBFF判断右侧SHIFT键是否按下";
rs["Remarks"] = "按下为真,反之为假";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="按下为真,反之为假";

rs = NewTbl("IsRightControlKeyDown");
rs["inf"] = "|cffFFBBFF判断右侧CONTROL键是否按下";
rs["Remarks"] = "按下为真,反之为假";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="按下为真,反之为假";

rs = NewTbl("IsRightAltKeyDown");
rs["inf"] = "|cffFFBBFF判断右侧ALT键是否按下";
rs["Remarks"] = "按下为真,反之为假";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="按下为真,反之为假";

rs = NewTbl("amPlayerTargetDistance");
rs["inf"]=PlayerColors .."(FH)我到当前目标的距离";
rs["Remarks"]="返囘距离。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘:距离";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=100;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;

rs = NewTbl("FHGetRangeRadianUnitCount");
rs["inf"] = SpecialColors.."(FH)统计指定角度、半径范围内的存活怪物数量";
rs["Remarks"] = "以自己为中心，需要FireHack解锁,布尔値 - 成功返囘true,失败返回false\n\nFH高级函数。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=2; 

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="搜索范围半径码数,比如100";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="玩家面对的角度设置，默认90度";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=0;
rs["Returns"][1]["inf"]="成功返囘找到的单位数量";

rs = NewTbl("FHINFly");
rs["inf"] = SpecialColors.."(FH)判定目标单位是否飞在空中";
rs["Remarks"] = "需要FireHack解锁,布尔値 - 飞在空中返囘true,否则false\n\nFH高级函数，测试测试。";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=1;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标单位名称（获取目标进行参考判定）";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="飞在空中返回true";

rs = NewTbl("CheckGlyph");
rs["inf"] = "判定指定雕文是否启用";
rs["Remarks"] = "指定雕文名称，返回布尔値 - 已装备返囘true,否则false\n\n注意雕文名称必须是全称，如：终结怒火雕文。";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=1;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="雕文全称（如：终结怒火雕文）";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="已装备返回true，否则false";


rs = NewTbl("FHTotemDistance");
rs["inf"] = SpecialColors.."(FH)判定单位和图腾、泉水、雕像之间的距离";
rs["Remarks"] = "指定单位，返回数值\n\n";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=1;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="检测单位";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=1000;
rs["Returns"][1]["inf"]="存在图腾返回距离数值，不存在返回1000";

rs = NewTbl("amTotemExist");
rs["inf"] = "判定存不存在自己释放的图腾、泉水、雕像";
rs["Remarks"] = "判断存在与否，返回布尔值，存在返回true，否则false\n\n";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="存在图腾返回true，不存在返回false";

rs = NewTbl("amPowerRegen");
rs["inf"] = "返回能量的回复系数";
rs["Remarks"] = "返回能量的回复系数\n\n";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=1;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="检测单位";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["inf"]="返回能量回复系数";

rs = NewTbl("amTimeToMax");
rs["inf"] = "返回能量回复到最大值所需时间";
rs["Remarks"] = "返回能量回复到最大值所需时间\n\n";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=1;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="检测单位";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["inf"]="返回回复最大值所需时间";

rs = NewTbl("IsSpellInRange");
rs["inf"] = "判断目标是否在指定技能释放范围内";
rs["Remarks"] = "在内为真,反之为假";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=2;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="技能名称";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="unit";
rs["Arguments"][2]["inf"]="检测单位";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="在内为真,反之为假";

rs = NewTbl("amLongTimeCCed");
rs["inf"] = "检测单位是否处于长时间控制技能下";
rs["Remarks"] = "符合条件为真,反之为假";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="检测单位";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="符合条件为真,反之为假";

rs = NewTbl("amisBoss");
rs["inf"] = "检测单位是否是Boss";
rs["Remarks"] = "符合条件为真,反之为假";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="检测单位";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="符合条件为真,反之为假";

rs = NewTbl("amStealthedUnit");
rs["inf"] = "检测单位是否处于隐身状态";
rs["Remarks"] = "符合条件为真,反之为假";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="检测单位";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="符合条件为真,反之为假";

rs = NewTbl("amHealthItemCanBeUsed");
rs["inf"] = "检测治疗石是否处于可使用状态。BY:鬼谷子";
rs["Remarks"] = "符合条件为真,反之为假";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="符合条件为真,反之为假";

rs = NewTbl("TierScan");
rs["inf"] = "检测T17套装装备数量。BY：鬼谷子";
rs["Remarks"] = "符合条件为真,反之为假";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="检测套装名称，如：T17";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["inf"]="返回统计数量";

rs = NewTbl("amCheckRace");
rs["inf"] = "检测单位的种族是否是指定种族";
rs["Remarks"] = "符合条件为真,反之为假";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=2;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="检测单位";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="String";
rs["Arguments"][2]["inf"]="指定种族，如：德莱尼";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="符合条件为真,反之为假";

rs = NewTbl("FHCountGos");
rs["inf"] = SpecialColors.."(FH)返回场上有多少个疗伤珠";
rs["Remarks"] = "返回数量\n\n";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["inf"]="返回数量";

rs = NewTbl("amCheckSpec");
rs["inf"] = "检测目标是否是指定的职务";
rs["Remarks"] = "检测是否坦克、治疗和dps，符合条件为真,反之为假";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=2;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="检测单位";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="检测单位";
rs["Arguments"][2]["Select"]={};
rs["Arguments"][2]["Select"][0]="坦克"
rs["Arguments"][2]["Select"][1]="治疗";
rs["Arguments"][2]["Select"][2]="DPS";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["inf"]="符合条件为真,反之为假";

rs = NewTbl("amCheckBuffStealable");
rs["inf"] = "检测目标是否有buff可被偷取或驱散";
rs["Remarks"] = "符合条件为真,反之为假";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="检测单位";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["inf"]="符合条件为真,反之为假";

rs = NewTbl("amCheckMelee");
rs["inf"] = "目标是否是近战DPS。BY：gengxxx";
rs["Remarks"]="符合条件目标，布尔値 - 成功返囘true。\n\n";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="单位";


rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["inf"]="符合条件为真,反之为假";

rs = NewTbl("amBloodLust");
rs["inf"] = "目标是否在嗜血（英勇）状态。";
rs["Remarks"]="符合条件目标，布尔値 - 成功返囘true。\n\n";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="单位";


rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["inf"]="符合条件为真,反之为假";

rs = NewTbl("am_GetMaxGCD");
rs["inf"] = "返回自己常态gcd时间。BY:htt0528";
rs["Remarks"]="返回符合条件目标值。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["inf"]="返回数量";

rs = NewTbl("am_GetNowGCD");
rs["inf"] = "返回自己即时GCD时间。BY:htt0528";
rs["Remarks"]="返回符合条件目标值。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["inf"]="返回数量";

rs = NewTbl("am_GetBaseGCD");
rs["inf"] = "返回自己裸态GCD时间。BY:htt0528";
rs["Remarks"]="返回符合条件目标值。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["inf"]="返回数量";

rs = NewTbl("amHasPet");
rs["inf"] = "自己有没有宝宝";
rs["Remarks"]="有返回true，无返回false。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["inf"]="有宝宝为真,反之为假";

rs = NewTbl("amGetSpellCharges");
rs["inf"] = "返回充能型技能已充能数量。";
rs["Remarks"]="返回充能型技能已充能数量。\n\n";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="技能名称。";


rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["inf"]="返回数量";

rs = NewTbl("amSpaMoveCount");
rs["inf"] = "返回移动的暗影幻灵数量（暗牧吉兆适用）。";
rs["Remarks"]="返回场上自己的暗影幻灵数量。\n\n";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["inf"]="返回数量";

rs = NewTbl("amorbTotal");
rs["inf"] = "返回场上自己的疗伤珠数量。";
rs["Remarks"]="返回场上自己的疗伤珠数量。\n\n";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["inf"]="返回数量";

rs = NewTbl("msGetSpellNumber");
rs["inf"] = "返回技能的伤害或治疗技能实时数值。By：Leckie";
rs["Remarks"]="返回技能的伤害或治疗技能实时数值。\n\n";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=2;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="技能名称";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="返回技能描述中伤害或治疗数值的第几个值。";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["inf"]="返回数量";

for e, rs in pairs(api) do
	rs["type"]="NoRun";
end
--------------------------------------------
rs = NewTbl("stEndProgram");
rs["type"]="Run";
rs["end"]="EndProgram";
rs["unit"]="nogoal";
rs["inf"] = "|cffff0000结束当前施法方案";
rs["Remarks"] = "当判断条件返囘true时,结束当前【施法方案】运行|r\n设计这函数初衷是能吧治疗施法方案分类,对不同血量,不同职业这些用不同的方案。当然其他应用更多不能一一列出。\n|cffff0000注意要理解的关键词:|cff00ffff当前【施法方案】|r\n|cffffff00寄语小白:|r函数是跳过本方案,后面有方案的话还可以继续下去哦...";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=0; 
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;


rs = NewTbl("ammpy");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = "灭破法师的变形术";
rs["Remarks"] = "布尔値 - 成功返囘true";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="敌方施放变形术剩余时间秒,精确到0.0001秒.";
rs["Arguments"][1]["Default"]={};
rs["Arguments"][1]["Default"]["value"]=0.5;

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;




rs = NewTbl("amDecursive");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = "一键驱散Decursive";
rs["Remarks"] = "需要安装Decursive插件,布尔値 - 成功返囘true";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="Boolean";
rs["Arguments"][1]["inf"]="是否立刻打断技能施放驱散,为「眞」时立刻打断。默认「假」";
rs["Arguments"][1]["Default"]={};
rs["Arguments"][1]["Default"]["value"]=false;



rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;





rs = NewTbl("amIsCurrentMouse");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = "技能正在执行时按下鼠标左键";
rs["Remarks"] = "主要用于判断AOE技能点亮时按下鼠标左键施放技能,只能用于加强版本客户端。布尔値 - 成功返囘true";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="技能名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;


rs = NewTbl("amSdmRun");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = "执行脚本";
rs["Remarks"] = "需要超级宏插件,脚本需要明确返囘値的眞假否则不能正确判断是否施放下个技能。布尔値 - 成功返囘true";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=2; 
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="超级宏插件脚本名称";
rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="unit";
rs["Arguments"][2]["inf"]="目标名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;


rs = NewTbl("amStopCasting");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = "打断自己";
rs["Remarks"] = "打断自己正在进行的法术或动作,请设定条件限制函数的使用,不然会卡在此函数上。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=0; 

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="永远返囘true,没有失败返囘";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;


rs = NewTbl("ammouse");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = "移动并按下鼠标";
rs["Remarks"] = "当 x和y都是0的时候鼠标不会移动,只会按下指定的按键。返囘true";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=3; 
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="鼠标水平坐标";
rs["Arguments"][1]["Default"]={};
rs["Arguments"][1]["Default"]["value"]=0;

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="鼠标垂直坐标";
rs["Arguments"][2]["Default"]={};
rs["Arguments"][2]["Default"]["value"]=0;

rs["Arguments"][3]={};
rs["Arguments"][3]["type"]="Number";
rs["Arguments"][3]["inf"]="鼠标按键";
rs["Arguments"][3]["Default"]={};
rs["Arguments"][3]["Default"]["value"]=0;
rs["Arguments"][3]["Select"]={};
rs["Arguments"][3]["Select"][0]="无按键动作"
rs["Arguments"][3]["Select"][1]="鼠标左键"
rs["Arguments"][3]["Select"][2]="鼠标中键"
rs["Arguments"][3]["Select"][3]="鼠标右键"

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;

rs = NewTbl("amCancelUnitBuff");
rs["type"]="Run";
rs["unit"]="player";
rs["inf"] = "取消指定的BUFF";
rs["Remarks"] = "返囘true";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=2; 
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="String";
rs["Arguments"][2]["inf"]="Buff名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;



rs = NewTbl("amArrangeBattle");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = "自动进出战场";
rs["Remarks"] = "战场列表第1个的战场的索引号码爲1。返囘true";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=2; 
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="战场的名称";
rs["Arguments"][1]["Default"]={};
rs["Arguments"][1]["Default"]["value"]=0;

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="战场的索引号码";
rs["Arguments"][2]["Default"]={};
rs["Arguments"][2]["Default"]["value"]=0;


rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;




rs = NewTbl("amSetRaidTarget");
rs["type"]="Run";
rs["unit"]="target";
rs["inf"] = "给目标上标记";
rs["Remarks"] = "注意:你要有队长、团长、助理权限。才可以标记目标,竞技场、战场是不能标记敌方目标。成功返囘true";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=2; 
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="标记代码";
rs["Arguments"][2]["Default"]={};
rs["Arguments"][2]["Default"]["value"]=0;
rs["Arguments"][2]["Select"]={};
rs["Arguments"][2]["Select"][0]="取消标记"
rs["Arguments"][2]["Select"][1]="星星";
rs["Arguments"][2]["Select"][2]="太阳";
rs["Arguments"][2]["Select"][3]="菱形";
rs["Arguments"][2]["Select"][4]="三角";
rs["Arguments"][2]["Select"][5]="月亮";
rs["Arguments"][2]["Select"][6]="方块";
rs["Arguments"][2]["Select"][7]="红叉";
rs["Arguments"][2]["Select"][8]="骷髅";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;



rs = NewTbl("amequip");
rs["type"]="Run";
rs["unit"]="target";
rs["inf"] = "换上指定的武器";
rs["Remarks"] = "注意:此函数不能在战斗中换武器和装备,要战斗中换武器请先连接好客户端。成功返囘true";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=2; 
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="主手武器名称";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="String";
rs["Arguments"][2]["inf"]="副手武器名称";

rs["Arguments"][3]={};
rs["Arguments"][3]["type"]="String";
rs["Arguments"][3]["inf"]="远程武器名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=false;
rs["Returns"][1]["Default"]["checked"]=true;

rs = NewTbl("amSetFocus");
rs["type"]="Run";
rs["unit"]="mouseover";
rs["inf"] = "把目标设定爲焦点目标";
rs["Remarks"] = "返囘true";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";


rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;





rs = NewTbl("amAutoResume");
rs["type"]="Run";
rs["unit"]="player";
rs["inf"] = "自动恢复能量或者生命";
rs["Remarks"] = "自动恢复能量或者生命,当能量或者蓝少于设定値时使用技能/物品/食物等,可以设定战斗或者非战斗时使用。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=5; 
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="设定判断能量/生命/全部";
rs["Arguments"][1]["Default"]={};
rs["Arguments"][1]["Default"]["value"]=1;
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][0]="生命"
rs["Arguments"][1]["Select"][1]="能量(蓝,怒气,能量,符能等)"
rs["Arguments"][1]["Select"][2]="能量和生命"

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="当能量/生命/全部 少于%x时";
rs["Arguments"][2]["Default"]={};
rs["Arguments"][2]["Default"]["value"]=90;
rs["Arguments"][2]["Minimum"]=-100;
rs["Arguments"][2]["Maximum"]=100;
rs["Arguments"][2]["Value"]=0;
rs["Arguments"][2]["Step"]=1;
rs["Arguments"][2]["Percent"]=false;
rs["Arguments"][2]["Decimals"]=0;

rs["Arguments"][3]={};
rs["Arguments"][3]["type"]="String";
rs["Arguments"][3]["inf"]="Buff名称,当无这个Buff时条件成立";
rs["Arguments"][3]["Default"]={};
rs["Arguments"][3]["Default"]["value"]="饮水";

rs["Arguments"][4]={};
rs["Arguments"][4]["type"]="String";
rs["Arguments"][4]["inf"]="技能名称（要施放的技能名称 如：甜果酒）";
rs["Arguments"][4]["Default"]={};
rs["Arguments"][4]["Default"]["value"]="甜果酒";


rs["Arguments"][5]={}; 
rs["Arguments"][5]["type"]="Boolean";
rs["Arguments"][5]["inf"]="指定是否战斗中施放,眞爲战斗中,反之爲假";
rs["Arguments"][5]["Default"]={};
rs["Arguments"][5]["Default"]["value"]=false;


rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;


rs = NewTbl("amattack");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = "|cffff00ff攻击最近的目标/停止攻击";
rs["Remarks"] = "攻击最近的目标";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=2; 
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="设定攻击/停止攻击. \n0 - 攻击(默认値0)  \n1 - 停止攻击";
rs["Arguments"][1]["Default"]={};
rs["Arguments"][1]["Default"]["value"]=0;
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][0]="攻击"
rs["Arguments"][1]["Select"][1]="停止攻击";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="设定自动寻找目标攻击/禁止自动找目标攻击。\n0 - 自动寻找目标攻击(默认値0) \n1 - 禁止自动找目标攻击";
rs["Arguments"][2]["Default"]={};
rs["Arguments"][2]["Default"]["value"]=0;
rs["Arguments"][2]["Select"]={};
rs["Arguments"][2]["Select"][0]="自动寻找目标攻击"
rs["Arguments"][2]["Select"][1]="禁止自动找目标攻击";


rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;

rs = NewTbl("amFollowUnit");
rs["type"]="Run";
rs["unit"]="target";
rs["inf"] = "跟随指定目标";
rs["Remarks"] = "跟随指定目标成功返囘true,反之返囘false";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";


rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true,反之返囘false";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=false;
rs["Returns"][1]["Default"]["checked"]=true;


rs = NewTbl("amHedd");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = SpellRemindColors .."Hedd技能优先级提醒插件自动输出。";
rs["Remarks"] = "需要Hedd插件,布尔値 - 成功返囘true\n\n|r下载:\n\nhttp://wowui.178.com/ui/772\n\n评价:想通过这插件提髙DPS完全不靠谱,建议懒人和对DPS无视的人士使用。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=0; 
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;

rs = NewTbl("amSkeenCore3");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = SpellRemindColors .. "SkeenCore3技能循环提醒插件自动输出。";
rs["Remarks"] = "需要SkeenCore3插件,布尔値 - 成功返囘true\n\n|r下载:\n\nhttp://wowui.w.163.com/ui/combat/SkeenCore3.html\n\n评价:想通过这插件提髙DPS完全不靠谱,建议懒人和对DPS无视的人士使用。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=0; 
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;

rs = NewTbl("amOvale");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = SpellRemindColors .. "Ovale全职业输出助手";
rs["Remarks"] = "需要安装Ovale插件,布尔値 - 成功返囘true\n\n评价:想通过这插件提髙DPS完全不靠谱,建议懒人和对DPS无视的人士使用。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="Ovale技能框取值区，如：1、2、3、4。";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;


rs = NewTbl("amShockAndAwe");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = SpellRemindColors .. "萨满祭司一键输出ShockAndAwe";
rs["Remarks"] = "需要ShockAndAwe插件,布尔値 - 成功返囘true\n\n评价:想通过这插件提髙DPS完全不靠谱,建议懒人和对DPS无视的人士使用。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=0; 
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;


rs = NewTbl("amRecalledTotem");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = "萨满祭司-图腾召囘";
rs["Remarks"] = "跟施放 图腾召囘 技能是一样的,唯一不同的是它会判断有图腾才会召囘。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=0; 
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;


rs = NewTbl("amDestroyTotem");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = "萨满祭司-摧毁指定类型图腾";
rs["Remarks"] = "摧毁指定类型图腾。\n1 = 火焰\n2 = 土\n3 = 水\n4 = 空气\n0 = 全部\n\n成功返囘眞(true),失败返囘假(false)";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="摧毁指定类型图腾数値:\n1 = 火焰\n2 = 土\n3 = 水\n4 = 空气\n0 = 全部";
rs["Arguments"][1]["Default"]={};
rs["Arguments"][1]["Default"]["value"]=0;
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][0]="全部"
rs["Arguments"][1]["Select"][1]="火焰"
rs["Arguments"][1]["Select"][2]="土"
rs["Arguments"][1]["Select"][3]="水"
rs["Arguments"][1]["Select"][4]="空气"

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘:眞(true),失败返囘假(false)";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;



rs = NewTbl("amKey");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = "模拟按下键盘按键";
rs["Remarks"] = "字符串 - 按键、组合按键。\n\n*组合按键用减号【-】分开,就像游戏按键设定里面显示按键那样的格式。\n\n如：Ctrl-A\n\n返囘値:无"

rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="字符串: 按键、组合按键";
rs["Arguments"][1]["Default"]={};
rs["Arguments"][1]["Default"]["value"]="";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="返囘:无";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=false;
rs["Returns"][1]["Default"]["checked"]=true;


rs = NewTbl("amrunEmptyAction");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = "|cffff0000执行一个空的动作";
rs["Remarks"] = "执行一个空的动作,如：我不想我喝水的时候被别的技能打断,那麽蓝没满的时候一直执行这函数就可以了。"

rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=0; 

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="永远返囘眞";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;


rs = NewTbl("amClickExtraActionButton1");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = "点击额外按钮";
rs["Remarks"] = "点击额外按钮。"

rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=0; 

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="永远返囘眞";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;


-----------test
rs = NewTbl("FHCastAOE");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = SpecialColors.."(FH)指向性技能目标处释放";
rs["Remarks"] = "需要FireHack解锁,布尔値 - 成功返囘true,失败返回false\n\nFH高级函数，测试测试。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=2; 

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="String";
rs["Arguments"][2]["inf"]="技能名称（要施放的技能名称 如：亵渎）";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;


rs = NewTbl("FHCastAOECenter");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = SpecialColors.."(FH)指向性技能目标与玩家中点处释放";
rs["Remarks"] = "需要FireHack解锁,布尔値 - 成功返囘true,失败返回false\n\nFH高级函数，测试测试。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=2; 

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目标名称";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="String";
rs["Arguments"][2]["inf"]="技能名称（要施放的技能名称 如：亵渎）";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;

rs = NewTbl("FHOvale");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = SpecialColors.. "(FH)Ovale全职业输出助手";
rs["Remarks"] = "需要安装Ovale插件和FireHack解锁,布尔値 - 成功返囘true\n\nFH高级函数释放指向性技能，测试测试。";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=2;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="Ovale技能框取值区，如：1、2、3、4。";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="是否启用自动面对目标（注：启动有风险)。";
rs["Arguments"][2]["Select"]={};
rs["Arguments"][2]["Select"][0]="不使用"
rs["Arguments"][2]["Select"][1]="使用"

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;





rs = NewTbl("AutoFaceTarget");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = SpecialColors.."(FH)自动面对目标";
rs["Remarks"]="自动面对目标";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;

rs = NewTbl("AutoFaceFocus");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = SpecialColors.."(FH)自动面对焦点";
rs["Remarks"]="自动面对焦点";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;


rs = NewTbl("FHGetRangeRadianStealthedUnit");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = SpecialColors.."(FH)指定范围内搜索隐形目标并释放技能";
rs["Remarks"]="自动面对符合条件目标，布尔値 - 成功返囘true。\n\nFH高级函数，测试测试。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=3;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="搜索范围半径码数,比如100";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="玩家面对的角度设置，默认90度";

rs["Arguments"][3]={};
rs["Arguments"][3]["type"]="String";
rs["Arguments"][3]["inf"]="指向性技能名称（要施放的技能名称 如：亵渎）";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;

rs = NewTbl("FHGetRangeRadianOTUnit");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = SpecialColors.."(FH)指定范围内搜索OT的小怪并释放技能";
rs["Remarks"]="自动面对符合条件目标，布尔値 - 成功返囘true。\n\nFH高级函数，测试测试。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=3;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="搜索范围半径码数,比如100";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="玩家面对的角度设置，默认90度";

rs["Arguments"][3]={};
rs["Arguments"][3]["type"]="String";
rs["Arguments"][3]["inf"]="嘲讽技能名称（要施放的技能名称 如：嘲讽）";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;

rs = NewTbl("amAutoTaunt");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = "简单判断自动嘲讽boss1达到换T目的";
rs["Remarks"] = "符合条件为真,反之为假";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="嘲讽技能名称";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;

rs = NewTbl("FHGetRangeRadianAuraUnit");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = SpecialColors.."(FH)指定范围内搜索没有dot的目标并释放技能";
rs["Remarks"]="自动面对符合条件目标，布尔値 - 成功返囘true。\n\nFH高级函数，测试测试。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=5;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="搜索范围半径码数,比如100";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="玩家面对的角度设置，默认90度";

rs["Arguments"][3]={};
rs["Arguments"][3]["type"]="String";
rs["Arguments"][3]["inf"]="设定技能名称（要检测的技能名称 如：阳炎术）";

rs["Arguments"][4]={};
rs["Arguments"][4]["type"]="Number";
rs["Arguments"][4]["inf"]="设定敌对目标血量下限（单位：万）";

rs["Arguments"][5]={};
rs["Arguments"][5]["type"]="String";
rs["Arguments"][5]["inf"]="设定技能名称（要释放的技能名称 如：阳炎术）";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;


rs = NewTbl("FHGetRangeRadianHPUnit");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = SpecialColors.."(FH)指定范围内搜索血量低于设定的目标并释放技能";
rs["Remarks"]="自动面对符合条件目标，布尔値 - 成功返囘true。\n\nFH高级函数，测试测试。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=4;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="搜索范围半径码数,比如100";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="玩家面对的角度设置，默认90度";

rs["Arguments"][3]={};
rs["Arguments"][3]["type"]="Number";
rs["Arguments"][3]["inf"]="检测的血量比阀值，比如低于10%就写10";

rs["Arguments"][4]={};
rs["Arguments"][4]["type"]="String";
rs["Arguments"][4]["inf"]="设定技能名称（要施放的技能名称 如：斩杀）";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;

rs = NewTbl("FHKeepDistanceWithUnit");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = SpecialColors.."(FH)按设定值与目标保持一定距离";
rs["Remarks"]="自动面对符合条件目标，布尔値 - 成功返囘true。\n\nFH高级函数，测试测试。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=2;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="选择目标";


rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="保持距离码数,比如20";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;

rs = NewTbl("amIsCurrentMouse2");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = "技能正在执行时按下鼠标右键";
rs["Remarks"] = "主要用于判断AOE技能点亮时按下鼠标右键取消技能。布尔値 - 成功返囘true";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="技能名称";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;

rs = NewTbl("FHGetRangeRadianTotem");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = SpecialColors.."(FH)指定距离、角度范围内搜索图腾并释放设定技能";
rs["Remarks"]="自动面对符合条件目标，布尔値 - 成功返囘true。\n\nFH高级函数，测试测试。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=4;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="选择检测目标类型";


rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="搜索范围半径码数,比如100";

rs["Arguments"][3]={};
rs["Arguments"][3]["type"]="Number";
rs["Arguments"][3]["inf"]="玩家面对的角度设置，默认90度";

rs["Arguments"][4]={};
rs["Arguments"][4]["type"]="String";
rs["Arguments"][4]["inf"]="设定技能名称（要施放的技能名称 如：愤怒之锤）";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;

rs = NewTbl("FHGoFish");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = SpecialColors.."(FH)自动钓鱼";
rs["Remarks"]="自动钓鱼，布尔値 - 成功返囘true。\n\nFH高级函数，测试测试。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;

rs = NewTbl("FHAutoLoot");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = SpecialColors.."(FH)自动拾取";
rs["Remarks"]="自动拾取，布尔値 - 成功返囘true。\n\nFH高级函数，测试测试。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="是否使用工程拾取器";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][0]="不使用"
rs["Arguments"][1]["Select"][1]="使用"

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;

rs = NewTbl("FHGetRangeRadianCastingUnit");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = SpecialColors.."(FH)指定范围内搜索可打断施法目标";
rs["Remarks"]="符合条件目标，布尔値 - 成功返囘true。\n\nFH高级函数，测试测试。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=3;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="搜索范围半径码数,比如100";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="玩家面对的角度设置，默认90度";

rs["Arguments"][3]={};
rs["Arguments"][3]["type"]="String";
rs["Arguments"][3]["inf"]="设定技能名称（要施放的技能名称 如：愤怒之锤）";


rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;

rs = NewTbl("amDANCE");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = "跳舞BY：蔡骏";
rs["Remarks"]="来一段舞蹈吧，布尔値 - 成功返囘true。\n\n";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;

rs = NewTbl("FHmeleeautotarget");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = SpecialColors.."(FH)近战自动选择目标。BY:htt0528";
rs["Remarks"]="近战自动选择目标，布尔値 - 成功返囘true。\n\n";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="搜索范围半径码数,比如100";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;

rs = NewTbl("FHTargetAutoChoose");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = SpecialColors.."(FH)远程自动选择目标";
rs["Remarks"]="远程自动选择目标，布尔値 - 成功返囘true。\n\n";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=2;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="搜索范围半径码数,比如100";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="玩家面对的角度设置，默认90度";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;

--table.sort(apiIndex,function (a,b)
 -- return (a.index or 0 > b.index or 0)
--end);


function stEndProgram()

	return true;

end


