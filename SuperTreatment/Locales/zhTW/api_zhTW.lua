
if (GetLocale() == 	"zhCN") then return; end;

local RED = "|cffff0000";
local GREEN = "|cff00ff00";
local BLUE = "|cff0000ff";
local MAGENTA = "|cffff00ff";
local YELLOW = "|cffffff00";
local CYAN = "|cff00ffff";
local WHITE = "|cffffffff";

local PlayerColors =  "|cffFFA54F";
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
powerType[1]="怒氣";
powerType[2]="集中";
powerType[3]="能量";
powerType[4]="快樂";
powerType[5]="符文";
powerType[6]="符能";
powerType[7]="靈魂碎片";
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


------------------play 開始 ---------------------

rs = NewTbl("amGetTemporaryPetInf");
rs["inf"]=PlayerColors .."獲得自己臨時寵物信息";
rs["Remarks"]='獲得自己臨時寵物信息,包括消失時間（秒）,名稱。\n\n|r包括祭司寵物、法師的水元素、以及各種與任務相關的寵物。\n\n死亡騎士的寵物不包含在內,要判斷請用死亡騎士專用的寵物判斷函數。';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=2;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="成功返囘:數値寵物消失時間（秒）,失敗返囘 -1";
rs["Returns"][2]={};
rs["Returns"][2]["type"]="String";
rs["Returns"][2]["Failure"]="";
rs["Returns"][2]["inf"]="成功返囘:寵物名稱,失敗爲空字符串";



rs = NewTbl("amGetSpellBaseCooldown");

rs["inf"]=PlayerColors .."獲得自己技能的基本冷卻時間";
rs["Remarks"]="獲得自己技能的基本冷卻時間(秒),這冷卻時間不會被其他因素影響包括施放技能后也不會改變";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="技能名稱";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="成功返囘時間(秒),反之爲 -1";




rs = NewTbl("OffhandHasWeapon");

rs["inf"]=PlayerColors .."判斷自己副手是否武器";
rs["Remarks"]="判斷副手是否武器(盾這些不屬于武器)是返囘眞,反之爲假。";
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
rs["Remarks"]='自己技能的詳細信息';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=2;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="技能名稱,輸入Id名稱無效";
rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="技能Id,輸入Id名稱無效";

rs["Returns"]={};
rs["Returns"]["Counts"]=8;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="String";
rs["Returns"][1]["Failure"]="";
rs["Returns"][1]["inf"]="技能名稱,失敗空字符串";


rs["Returns"][2]={};
rs["Returns"][2]["type"]="String";
rs["Returns"][2]["Failure"]="";
rs["Returns"][2]["inf"]="技能等級或者說明,失敗空字符串";

rs["Returns"][3]={};
rs["Returns"][3]["type"]="String";
rs["Returns"][3]["Failure"]="";
rs["Returns"][3]["inf"]="圖標名稱包含路徑,失敗空字符串";

rs["Returns"][4]={};
rs["Returns"][4]["type"]="Number";
rs["Returns"][4]["Failure"]=-1;
rs["Returns"][4]["inf"]="施放需要的能量値(法力、怒氣等等),失敗爲-1";

rs["Returns"][5]={};
rs["Returns"][5]["type"]="Boolean";
rs["Returns"][5]["Failure"]=false;
rs["Returns"][5]["inf"]="True for spells with health funneling effects (like Health Funnel)(boolean)";

rs["Returns"][6]={};
rs["Returns"][6]["type"]="Number";
rs["Returns"][6]["Failure"]=-9;
rs["Returns"][6]["inf"]="能量類型代碼:-2=健康;0=法力;怒氣=1;2=集中;能量=3;快樂=4;符文=5;符能=6,失敗返囘-9";

rs["Returns"][7]={};
rs["Returns"][7]["type"]="Number";
rs["Returns"][7]["Failure"]=-1;
rs["Returns"][7]["inf"]="施放時間(毫秒),失敗返囘-1";

rs["Returns"][8]={};
rs["Returns"][8]["type"]="Number";
rs["Returns"][8]["Failure"]=-1;
rs["Returns"][8]["inf"]="施放范圍最小値,失敗返囘-1";

rs["Returns"][9]={};
rs["Returns"][9]["type"]="Number";
rs["Returns"][9]["Failure"]=-1;
rs["Returns"][9]["inf"]="施放范圍最大値,失敗返囘-1";



rs = NewTbl("amInternalCD");
rs["inf"]=PlayerColors .."自己技能的內置冷卻時間";
rs["Remarks"]='自己技能的內置冷卻時間,如：強化斷筋\n\n|r目前只能判斷以下技能:\n強化斷筋';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="技能名稱";
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘冷卻時間（秒）";


rs = NewTbl("amGetDkPetCd");
rs["inf"]=PlayerColors .."獲得死亡騎士寵物消失時間";
rs["Remarks"]='獲得死亡騎士寵物消失時間（秒）';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="返囘：數値寵物消失時間（秒）";



rs = NewTbl("amGetDkInfectionTargetInf");

rs["inf"]=PlayerColors .."判斷DK傳染施放條件";
rs["Remarks"]="返囘攻擊你的(包括中你疫病)的目標數量、中疫病數量、沒疫病數量。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;


rs["Returns"]={};
rs["Returns"]["Counts"]=7;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘攻擊你的(包括中你疫病)的目標數量。";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=100;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;


rs["Returns"][2]={};
rs["Returns"][2]["type"]="Number";
rs["Returns"][2]["Failure"]=-1;
rs["Returns"][2]["inf"]="返囘中疫病的目標數量。";
rs["Returns"][2]["Minimum"]=-1;
rs["Returns"][2]["Maximum"]=100;
rs["Returns"][2]["Value"]=0;
rs["Returns"][2]["Step"]=1;
rs["Returns"][2]["Percent"]=false;
rs["Returns"][2]["Decimals"]=0;


rs["Returns"][3]={};
rs["Returns"][3]["type"]="Number";
rs["Returns"][3]["Failure"]=-1;
rs["Returns"][3]["inf"]="返囘沒疫病的目標數量。";
rs["Returns"][3]["Minimum"]=-1;
rs["Returns"][3]["Maximum"]=100;
rs["Returns"][3]["Value"]=0;
rs["Returns"][3]["Step"]=1;
rs["Returns"][3]["Percent"]=false;
rs["Returns"][3]["Decimals"]=0;


rs["Returns"][4]={};
rs["Returns"][4]["type"]="Number";
rs["Returns"][4]["Failure"]=-1;
rs["Returns"][4]["inf"]="返囘攻擊(白字傷害)你的目標數量。";
rs["Returns"][4]["Minimum"]=-1;
rs["Returns"][4]["Maximum"]=100;
rs["Returns"][4]["Value"]=0;
rs["Returns"][4]["Step"]=1;
rs["Returns"][4]["Percent"]=false;
rs["Returns"][4]["Decimals"]=0;


rs["Returns"][5]={};
rs["Returns"][5]["type"]="Number";
rs["Returns"][5]["Failure"]=-1;
rs["Returns"][5]["inf"]="返囘攻擊(白字傷害)你且中疫病的目標數量。";
rs["Returns"][5]["Minimum"]=-1;
rs["Returns"][5]["Maximum"]=100;
rs["Returns"][5]["Value"]=0;
rs["Returns"][5]["Step"]=1;
rs["Returns"][5]["Percent"]=false;
rs["Returns"][5]["Decimals"]=0;


rs["Returns"][6]={};
rs["Returns"][6]["type"]="Number";
rs["Returns"][6]["Failure"]=-1;
rs["Returns"][6]["inf"]="返囘攻擊(白字傷害)你且沒疫病的目標數量。";
rs["Returns"][6]["Minimum"]=-1;
rs["Returns"][6]["Maximum"]=100;
rs["Returns"][6]["Value"]=0;
rs["Returns"][6]["Step"]=1;
rs["Returns"][6]["Percent"]=false;
rs["Returns"][6]["Decimals"]=0;

rs["Returns"][7]={};
rs["Returns"][7]["type"]="Number";
rs["Returns"][7]["Failure"]=-1;
rs["Returns"][7]["inf"]="返囘BUFF的消失時間(秒)。只返囘最小値的目標。";
rs["Returns"][7]["Minimum"]=-1;
rs["Returns"][7]["Maximum"]=100;
rs["Returns"][7]["Value"]=0;
rs["Returns"][7]["Step"]=1;
rs["Returns"][7]["Percent"]=false;
rs["Returns"][7]["Decimals"]=0;


rs = NewTbl("amGetRuneCooldown");
rs["inf"]=PlayerColors .."獲得指定位置的符文冷卻時間";
rs["Remarks"]='獲得指定位置(1-6整數値)的符文冷卻時間（秒）';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][1]="符文1(鮮血)"
rs["Arguments"][1]["Select"][2]="符文2(鮮血)"
rs["Arguments"][1]["Select"][3]="符文3(冰霜)"
rs["Arguments"][1]["Select"][4]="符文4(冰霜)"
rs["Arguments"][1]["Select"][5]="符文5(邪惡)"
rs["Arguments"][1]["Select"][6]="符文6(邪惡)"

rs["Arguments"][1]["inf"]="符文位置(1-6整數値)";
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="返囘：數値符文冷卻時間（秒）";


rs = NewTbl("amrs");
rs["inf"]=PlayerColors .. "獲得我的特殊能量値";
rs["Remarks"]="自動判斷當前職業獲得該職業的特殊能量値如：騎士的神圣能量、梟獸形態德魯伊的日/月能量、術士的惡魔之怒能量";
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
rs["inf"]=PlayerColors .."我的專精名稱";
rs["Remarks"]="WOW5.0叫專精不是天賦了";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="String";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="專精名稱";



rs = NewTbl("IsCurrentSpell");
rs["inf"]=PlayerColors .."技能動作執行情況";
rs["Remarks"]='IsCurrentSpell(「英勇打擊")';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="技能名稱";
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="執行時返囘true";


rs = NewTbl("amat");
rs["inf"]=PlayerColors .."我的近戰武器攻擊計時時間";
rs["Remarks"]="需要安裝AttackTimer插件";
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
rs["Returns"][1]["inf"]="攻擊剩余時間(秒)";

rs["Returns"][2]={};
rs["Returns"][2]["type"]="Number";
rs["Returns"][2]["Failure"]=-1;
rs["Returns"][2]["Minimum"]=0;
rs["Returns"][2]["Maximum"]=9;
rs["Returns"][2]["Value"]=0;
rs["Returns"][2]["Step"]=0.1;
rs["Returns"][2]["Percent"]=false;
rs["Returns"][2]["Decimals"]=1;
rs["Returns"][2]["inf"]="攻擊間隔時間(秒)";


rs = NewTbl("IsEquippedItem");
rs["inf"]=PlayerColors .."判斷物品是否佩戴";
rs["Remarks"]="";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="物品名稱";
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="佩戴返囘true";



rs = NewTbl("IsEquippableItem");
rs["inf"]=PlayerColors .."判斷能佩戴的物品是否存在";
rs["Remarks"]="判斷能佩戴的物品(佩戴的和包里的)是否存在";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="物品名稱";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="佩戴返囘true";


rs = NewTbl("amwbuff");
rs["inf"]=PlayerColors .."我的武器附魔時間";
rs["Remarks"]="獲得主手\副手武器\投擲武器附魔效果冷卻時間 time=amwbuff(n)";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][1]="主手武器";
rs["Arguments"][1]["Select"][2]="副手武器";
rs["Arguments"][1]["Select"][3]="投擲武器";
rs["Arguments"][1]["inf"]="1 = 主手武器, 2 = 副手武器, 3 = 投擲武器";

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
rs["Returns"][1]["inf"]="武器附魔效果冷卻時間(秒)";


rs = NewTbl("IsIndoors");
rs["inf"] = PlayerColors .."判斷我在室內";
rs["Remarks"] = "布爾値 - 是否在室內,返囘true爲在室內";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=0; 
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="在室內返囘true";


rs = NewTbl("IsOutdoors");
rs["inf"] = PlayerColors .."判斷我在室外";
rs["Remarks"] = "布爾値 - 是否在室外,返囘true爲在室外";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=0; rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="在室外返囘true";



rs = NewTbl("IsMounted");
rs["inf"] = PlayerColors .."判斷我坐騎狀態";
rs["Remarks"] = "布爾値 - 坐騎返囘true";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=0; rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="坐騎狀態返囘true";


rs = NewTbl("amIsAttack");
rs["inf"] = PlayerColors .."我是否攻擊姿態";
rs["Remarks"] = "布爾値 - 攻擊姿態返囘true";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=0; rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="攻擊姿態返囘true";



rs = NewTbl("amuca");
rs["inf"] = PlayerColors .."我是否可以攻擊";
rs["Remarks"] = "布爾値 - 可以攻擊返囘true";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="可以攻擊返囘true";


rs = NewTbl("amzt");
rs["inf"]=PlayerColors .."我是否在指定的姿態";
rs["Remarks"]="按技能排序來編號,如:|r\n戰士:1=戰斗、2=防御、3=狂暴\n德魯伊:1=熊、2=海豹、3=貓、4=旅行、5=梟獸/樹\n騎士:1=眞理圣印、2=正義圣印、3=洞察圣印";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="姿態編號(按技能位置左邊起)";
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
rs["Returns"][1]["inf"]="是指定姿態返囘true";


rs = NewTbl("IsStealthed");
rs["inf"] = PlayerColors .."我是否潛行或影遁中";
rs["Remarks"] = "布爾値 - 如果爲潛行或影遁返囘1,否則爲nil";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=0; 

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="潛行或影遁返囘1(true)";


rs = NewTbl("amGetInventoryItemDurability");
rs["inf"]=PlayerColors .."我的裝備耐久(%)";
rs["Remarks"]="獲得裝備耐久的百分比";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["Select"]={};

rs["Arguments"][1]["Select"][1] = "頭";
rs["Arguments"][1]["Select"][2] = "頸";
rs["Arguments"][1]["Select"][3] = "肩";
rs["Arguments"][1]["Select"][4] = "襯衣";
rs["Arguments"][1]["Select"][5] = "胸";
rs["Arguments"][1]["Select"][6] = "腰帶";
rs["Arguments"][1]["Select"][7] = "腿";
rs["Arguments"][1]["Select"][8] = "腳";
rs["Arguments"][1]["Select"][9] = "手腕";
rs["Arguments"][1]["Select"][10] = "手套";
rs["Arguments"][1]["Select"][11] = "手指1";
rs["Arguments"][1]["Select"][12] = "手指2";
rs["Arguments"][1]["Select"][13] = "飾品1";
rs["Arguments"][1]["Select"][14] = "飾品2";
rs["Arguments"][1]["Select"][15] = "背";
rs["Arguments"][1]["Select"][16] = "主手";
rs["Arguments"][1]["Select"][17] = "副手";
rs["Arguments"][1]["Select"][18] = "遠程武器";

rs["Arguments"][1]["inf"]="裝備位置編號(1 - 18)";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘裝備耐久的百分比";
rs["Returns"][1]["Minimum"]=0;
rs["Returns"][1]["Maximum"]=100;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;


rs = NewTbl("amGetCastInf");
rs["inf"] = PlayerColors .."我正在施放的技能信息";
rs["Remarks"] = "返囘施放的技能名稱、目標、過去時間(秒)";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=0; 

rs["Returns"]["Counts"]=3;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="String";
rs["Returns"][1]["Failure"]="";
rs["Returns"][1]["inf"]="返囘施放的技能名稱,失敗爲空字符串";

rs["Returns"][2]={};
rs["Returns"][2]["type"]="String";
rs["Returns"][2]["Failure"]=false;
rs["Returns"][2]["inf"]="返囘施放的目標名稱,失敗爲 false";

rs["Returns"][3]={};
rs["Returns"][3]["type"]="Number";
rs["Returns"][3]["Failure"]=false;
rs["Returns"][3]["inf"]="返囘從施放到現在的時間(秒),失敗爲 false|r\n|cffffff00寄語小白:|r是【正在施放】哦...";


rs = NewTbl("amIsPlayerCastSpell");
rs["inf"] = PlayerColors .."我是否正在施放技能中";
rs["Remarks"] = "布爾値 - 如果施放技能中返囘true,否則爲false";
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

rs["inf"]=PlayerColors .."信息判斷";
rs["Remarks"]="搜索各種頻道的聊天、報警、插件、頻道、戰斗等文字信息,請先建立【信息判斷】才可以調用該函數。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["SelectType"]={};
rs["Arguments"][1]["SelectType"]["Tbl"]="stGetSearchInformation_Tbl";
rs["Arguments"][1]["SelectType"]["TblValue"]="TblAutoIndex";
rs["Arguments"][1]["SelectType"]["Value"]="TblAutoIndex";

rs["Arguments"][1]["Select"]={};


rs["Arguments"][1]["inf"]="【信息判斷】條件名稱。";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘判斷成功過去時間(秒),失敗返囘 -1。";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=10000;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;



rs = NewTbl("amtotemtype");
rs["inf"]=PlayerColors .."判斷自己圖騰類型是否存在";
rs["Remarks"]="成功返囘:圖騰名稱,圖騰效果剩余時間(秒)";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][1]="火焰";
rs["Arguments"][1]["Select"][2]="土";
rs["Arguments"][1]["Select"][3]="水";
rs["Arguments"][1]["Select"][4]="空氣";
rs["Arguments"][1]["inf"]="1 = 火焰, 2 = 土, 3 = 水, 4 = 空氣";

rs["Returns"]={};
rs["Returns"]["Counts"]=2;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="String";
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["inf"]="成功返囘:圖騰名稱,失敗返囘 nil"

rs["Returns"][2]={};
rs["Returns"][2]["type"]="Number";
rs["Returns"][2]["Percent"]=false;
rs["Returns"][2]["inf"]="成功返囘:圖騰效果剩余時間(秒),失敗返囘 -1"



rs = NewTbl("amSpellActive");
rs["inf"] = PlayerColors .."判斷我的技能是否被激活";
rs["Remarks"] = "激活返囘:true,沒激活返囘:false,技能錯誤返囘:nil\n\n注意:\n請習慣用正確的技能唯一性名稱如:\n\n壓制(戰斗姿態)\n雷霆一擊(戰斗,防御姿態)";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="技能名稱(以激活提示名稱爲準,如:【壓制(戰斗姿態)】要寫爲【壓制】)";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["inf"]="激活返囘:true,沒激活返囘:false,技能錯誤返囘:nil"


rs = NewTbl("amUnitThreat");
rs["inf"] = PlayerColors .."獲得我和目標的仇恨百分値";
rs["Remarks"] = "返囘:獲得我和目標的仇恨百分値";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Percent"]=1;
rs["Returns"][1]["inf"]="返囘:獲得我和目標的仇恨百分値"

rs = NewTbl("amGetFollowUnit");
rs["inf"]=PlayerColors .."獲得跟隨目標名稱";
rs["Remarks"]="獲得跟隨目標名稱";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="String";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="目標名稱";


rs = NewTbl("amIsFollowUnit");
rs["inf"]=PlayerColors .."是否在跟隨";
rs["Remarks"]="跟隨時返囘true,否則返囘false。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="跟隨時返囘true,否則返囘false";


rs = NewTbl("amjl");
rs["inf"]=PlayerColors ..'獲得我和目標的距離';
rs["Remarks"]="距離是通過判斷不同技能的施放距離來達到目的的,所以距離可能是 5、8、10、30、40 等這些\n\n|r運用時最好是判斷范圍來達到您的目的,等于距離慎用。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=100000000;
rs["Returns"][1]["inf"]="成功返囘:距離,失敗返囘:100000000";


rs = NewTbl("amGetDruidMushrooms");
rs["inf"]=PlayerColors .."德魯伊野性毒菇冷卻時間";
rs["Remarks"]="獲得指定的野性毒菇冷卻時間";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][false]="最小的冷卻時間"
rs["Arguments"][1]["Select"][1]="第1個"
rs["Arguments"][1]["Select"][2]="第2個"
rs["Arguments"][1]["Select"][3]="第3個"
rs["Arguments"][1]["Select"][4]="第4個"
rs["Arguments"][1]["inf"]="野性毒菇序號。\n\n最小的冷卻時間:自動判斷哪個時間最小。\n第n個:第n個野性毒菇";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘冷卻時間,無效返囘-1";


rs = NewTbl("amSpellEmpowerment");
rs["inf"] = PlayerColors .."判斷我的技能充能信息";
rs["Remarks"] = "返囘:充能冷卻時間(秒)、當前可用次數、最大次數、充能時長(秒)";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="技能名稱或技能Id";

rs["Returns"]={};
rs["Returns"]["Counts"]=4;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["inf"]="充能冷卻時間(秒)"

rs["Returns"][2]={};
rs["Returns"][2]["type"]="Number";
rs["Returns"][2]["Percent"]=false;
rs["Returns"][2]["inf"]="當前技能可用次數";

rs["Returns"][3]={};
rs["Returns"][3]["type"]="Number";
rs["Returns"][3]["Percent"]=false;
rs["Returns"][3]["inf"]="技能最大次數";

rs["Returns"][4]={};
rs["Returns"][4]["type"]="Number";
rs["Returns"][4]["Percent"]=false;
rs["Returns"][4]["inf"]="技能充能時長(秒)";


rs = NewTbl("amcd");
rs["inf"] = PlayerColors .."獲得自己技能/物品冷卻時間";
rs["Remarks"] = "返囘:自己技能/物品冷卻時間";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="技能/物品名稱";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Percent"]=-1;
rs["Returns"][1]["inf"]="成功返囘技能/物品冷卻時間,失敗爲-1"



rs = NewTbl("amPlaySpellFindText");

rs["inf"]=PlayerColors .."搜索自己技能中的信息";
rs["Remarks"]="搜索自己技能是否有指定內容,成功返囘眞,反之爲假。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=3;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="技能名稱/Id";
rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="指定獲得技能信息中的第幾個信息,一般第1是名稱";
rs["Arguments"][3]={};
rs["Arguments"][3]["type"]="String";
rs["Arguments"][3]["inf"]="搜索的關鍵字";


rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘眞,反之爲假";


rs = NewTbl("amPlaySpellNumber");

rs["inf"]=PlayerColors .."獲得自己技能信息中的數字";
rs["Remarks"]="獲得自己技能信息中的數字\n如盾牌屏障中吸收的傷害値這些。\n|cffff0000注意：當判斷失敗(技能不存在)時返囘値都是-1。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=4;

rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="技能名稱/Id";
rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="指定獲得技能信息中的第幾個信息,一般技能第1是名稱";
rs["Arguments"][3]={};
rs["Arguments"][3]["type"]="String";
rs["Arguments"][3]["inf"]="清除的字符\n清除影響獲得信息的字符如:數値[12,567]的千分號[,]需要清除不然無法正確獲得[12567]。如果有多個字符需要清除請用[|]來分隔。";
rs["Arguments"][4]={};
rs["Arguments"][4]["type"]="String";
rs["Arguments"][4]["inf"]="格式化信息,默認(%d+)。";


rs["Returns"]={};
rs["Returns"]["Counts"]=8;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘數値。";
rs["Returns"][1]["Decimals"]=0;


rs["Returns"][2]={};
rs["Returns"][2]["type"]="Number";
rs["Returns"][2]["Failure"]=-1;
rs["Returns"][2]["inf"]="返囘數値。";
rs["Returns"][2]["Decimals"]=0;


rs["Returns"][3]={};
rs["Returns"][3]["type"]="Number";
rs["Returns"][3]["Failure"]=-1;
rs["Returns"][3]["inf"]="返囘數値。";
rs["Returns"][3]["Decimals"]=0;


rs["Returns"][4]={};
rs["Returns"][4]["type"]="Number";
rs["Returns"][4]["Failure"]=-1;
rs["Returns"][4]["inf"]="返囘數値。";
rs["Returns"][4]["Decimals"]=0;


rs["Returns"][5]={};
rs["Returns"][5]["type"]="Number";
rs["Returns"][5]["Failure"]=-1;
rs["Returns"][5]["inf"]="返囘數値。";
rs["Returns"][5]["Decimals"]=0;


rs["Returns"][6]={};
rs["Returns"][6]["type"]="Number";
rs["Returns"][6]["Failure"]=-1;
rs["Returns"][6]["inf"]="返囘數値。";
rs["Returns"][6]["Decimals"]=0;

rs["Returns"][7]={};
rs["Returns"][7]["type"]="Number";
rs["Returns"][7]["Failure"]=-1;
rs["Returns"][7]["inf"]="返囘數値。";
rs["Returns"][7]["Decimals"]=0;

rs["Returns"][8]={};
rs["Returns"][8]["type"]="Number";
rs["Returns"][8]["Failure"]=-1;
rs["Returns"][8]["inf"]="返囘數値。";
rs["Returns"][8]["Decimals"]=0;



rs = NewTbl("amTalentInfo");

rs["inf"]=PlayerColors .."判斷自己天賦是否啓用";
rs["Remarks"]="判斷自己天賦是否啓用,啓用返囘眞,反之爲假。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="天賦名稱";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="天賦啓用返囘眞,反之爲假";



rs = NewTbl("amStatusInfo");
rs["inf"]=PlayerColors .."人物屬性監視(StatusInfo)插件";
rs["Remarks"]="人物屬性監視(StatusInfo)插件。\n\n從上到下依次返囘插件顯示的値\n\n|r測試宏命令:/run print(amStatusInfo())";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;

rs["Returns"]={};
rs["Returns"]["Counts"]=5;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘第1列數値。";
rs["Returns"][1]["Decimals"]=0;


rs["Returns"][2]={};
rs["Returns"][2]["type"]="Number";
rs["Returns"][2]["Failure"]=-1;
rs["Returns"][2]["inf"]="返囘第2列數値。";
rs["Returns"][2]["Decimals"]=0;


rs["Returns"][3]={};
rs["Returns"][3]["type"]="Number";
rs["Returns"][3]["Failure"]=-1;
rs["Returns"][3]["inf"]="返囘第3列數値。";
rs["Returns"][3]["Decimals"]=0;


rs["Returns"][4]={};
rs["Returns"][4]["type"]="Number";
rs["Returns"][4]["Failure"]=-1;
rs["Returns"][4]["inf"]="返囘第4列數値。";
rs["Returns"][4]["Decimals"]=0;


rs["Returns"][5]={};
rs["Returns"][5]["type"]="Number";
rs["Returns"][5]["Failure"]=-1;
rs["Returns"][5]["inf"]="返囘第5列數値。";
rs["Returns"][5]["Decimals"]=0;

rs = NewTbl("amExtraActionBarCooldown");
rs["inf"] = PlayerColors .."獲得額外按鈕冷卻時間";
rs["Remarks"] = "返囘:額外按鈕冷卻時間\n\n如:技能[夢境]";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=0; 

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Percent"]=-1;
rs["Returns"][1]["inf"]="成功返囘冷卻時間,失敗爲-1";


rs = NewTbl("amIsFaceTarget");
rs["inf"]=PlayerColors .."面對當前目標";
rs["Remarks"]="返囘値：面對面=1,面對目標背后=0,目標對我背=2,和目標背對背=3,沒目標/關閉=-1。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="開/關線程:1為開0為關。";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][0]="關閉";
rs["Arguments"][1]["Select"][1]="開啟";

rs["Returns"]={};
rs["Returns"][1]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘値：面對面=1,面對目標背后=0,目標對我背=2,和目標背對背=3,沒目標/關閉=-1。";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=10;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;



rs = NewTbl("amIsFaceFocus");
rs["inf"]=PlayerColors .."面對焦點";
rs["Remarks"]="返囘値：面對面=1,面對焦點背后=0,焦點對我背=2,和焦點背對背=3,沒目標/關閉=-1。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="開/關線程:1為開0為關。";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][0]="關閉";
rs["Arguments"][1]["Select"][1]="開啟";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘値：面對面=1,面對焦點背后=0,焦點對我背=2,和焦點背對背=3,沒目標/關閉=-1。";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=10;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;


rs = NewTbl("amPlayerTargetDistance");
rs["inf"]=PlayerColors .."我到當前目標的距離(無級髙精度)";
rs["Remarks"]="返囘距離。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="開/關線程:1為開0為關。";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][0]="關閉";
rs["Arguments"][1]["Select"][1]="開啟";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘:距離";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=100;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;


rs = NewTbl("amPetPlayerDistance");
rs["inf"]=PlayerColors .."我到寵物的距離(無級髙精度)";
rs["Remarks"]="返囘距離。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="開/關線程:1為開0為關。";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][0]="關閉";
rs["Arguments"][1]["Select"][1]="開啟";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘:距離";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=100;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;


rs = NewTbl("amPlayerToEnemyRangeCount");
rs["inf"]=PlayerColors .."獲得我附近敵對目標數量";
rs["Remarks"]="獲得我附近敵對目標數量";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][2]="2碼內"
rs["Arguments"][1]["Select"][5]="5碼內"
rs["Arguments"][1]["Select"][8]="8碼內"
rs["Arguments"][1]["Select"][10]="10碼內"
rs["Arguments"][1]["Select"][12]="12碼內"
rs["Arguments"][1]["Select"][15]="15碼內"
rs["Arguments"][1]["Select"][20]="20碼內"
rs["Arguments"][1]["Select"][30]="30碼內"
rs["Arguments"][1]["Select"][35]="35碼內"
rs["Arguments"][1]["Select"][40]="40碼內"
rs["Arguments"][1]["inf"]="返囘:目標數量。";
rs["Returns"]={};
rs["Returns"][1]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘:目標數量。";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=100;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;


rs = NewTbl("amPlayerToFriendlyRangeCount");
rs["inf"]=PlayerColors .."獲得我附近友好目標數量";
rs["Remarks"]="獲得我附近友好目標數量";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][2]="2碼內"
rs["Arguments"][1]["Select"][5]="5碼內"
rs["Arguments"][1]["Select"][8]="8碼內"
rs["Arguments"][1]["Select"][10]="10碼內"
rs["Arguments"][1]["Select"][12]="12碼內"
rs["Arguments"][1]["Select"][15]="15碼內"
rs["Arguments"][1]["Select"][20]="20碼內"
rs["Arguments"][1]["Select"][30]="30碼內"
rs["Arguments"][1]["Select"][35]="35碼內"
rs["Arguments"][1]["Select"][40]="40碼內"
rs["Arguments"][1]["inf"]="選擇范圍。";
rs["Returns"]={};
rs["Returns"][1]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘:目標數量。";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=1000;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;


rs = NewTbl("amPlayerRangeRadianEnemyCount");
rs["inf"]=PlayerColors .."獲得我附近前方90°敵對目標數量";
rs["Remarks"]="獲得我附近前方90°敵對目標數量";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"]["10_90"]="10碼內"
rs["Arguments"][1]["Select"]["30_90"]="30碼內"
rs["Arguments"][1]["Select"]["40_90"]="40碼內"
rs["Arguments"][1]["inf"]="選擇范圍。";
rs["Returns"]={};
rs["Returns"][1]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘:目標數量。";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=1000;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;


rs = NewTbl("amPlayerRangeRadianFriendlyCount");
rs["inf"]=PlayerColors .."獲得我附近前方90°友好目標數量";
rs["Remarks"]="獲得我附近前方90°友好目標數量";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"]["10_90"]="10碼內"
rs["Arguments"][1]["Select"]["30_90"]="30碼內"
rs["Arguments"][1]["Select"]["40_90"]="40碼內"
rs["Arguments"][1]["inf"]="選擇范圍。";
rs["Returns"]={};
rs["Returns"][1]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘:目標數量。";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=1000;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;


rs = NewTbl("amIsEclipseDirection");
rs["inf"] = PlayerColors .."獲得德魯伊日食方向";
rs["Remarks"] = "是太陽返回真(True),反之月亮為假(False)";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=0; 

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["inf"]="是太陽返回真(True),反之月亮為假(False)";


rs = NewTbl("amExtraActionBarPower");
rs["inf"] = PlayerColors .."獲得額外能量條數值";
rs["Remarks"] = "獲得額外能量條數值，屏幕中間那個一般Boss戰的時候會出現。";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=0; 

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Percent"]=-1;
rs["Returns"][1]["inf"]="成功返囘能量值,失敗爲-1";


rs = NewTbl("amExtraActionBarSpellName");
rs["inf"] = PlayerColors .."獲得額外按鈕的技能名稱";
rs["Remarks"] = "獲得額外按鈕的技能名稱，屏幕中間那個按鈕一般Boss戰的時候會出現。";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=0; 

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="String";
rs["Returns"][1]["Percent"]="";
rs["Returns"][1]["inf"]="成功返囘技能名稱,失敗爲空字符。";



rs = NewTbl("amTargetTargetNotMe");
rs["inf"] = PlayerColors .."當前目標的目標不是我";
rs["Remarks"] = "當前目標的目標不是我。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][0]="當前目標的目標(忽略當前目標是否有目標)不是我"
rs["Arguments"][1]["Select"][1]="當前目標的目標(肯定)不是我"
rs["Arguments"][1]["inf"]="當前目標的目標不是我。";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["inf"]="成功返囘真，失敗為假。";


rs = NewTbl("amTargetTargetToMe");
rs["inf"] = PlayerColors .."當前目標的目標是我";
rs["Remarks"] = "當前目標的目標是我";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["inf"]="目標是我返囘真(True)，反之為假(False)。";

rs = NewTbl("amIsFaceTargetSimple");
rs["inf"]=PlayerColors .."面對當前目標(簡單)";
rs["Remarks"]="符合設定返回真(True),反之不符合設定/沒目標/關閉 為假(False)。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=2;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="開/關線程:1為開0為關。";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][0]="關閉";
rs["Arguments"][1]["Select"][1]="開啟";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="方位設定(參數值見括號內數值)。";
rs["Arguments"][2]["Select"]={};
rs["Arguments"][2]["Select"][0]="(0)面對目標背后";
rs["Arguments"][2]["Select"][1]="(1)面對面";
rs["Arguments"][2]["Select"][2]="(2)目標對我背";
rs["Arguments"][2]["Select"][3]="(3)和目標背對背";
rs["Arguments"][2]["Select"][4]="(4)面對目標(目標在我前方)";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["inf"]="符合設定返回真(True),反之不符合設定/沒目標/關閉 為假(False)。";


rs = NewTbl("amIsFaceFocusSimple");
rs["inf"]=PlayerColors .."面對焦點目標(簡單)";
rs["Remarks"]="符合設定返回真(True),反之不符合設定/沒目標/關閉 為假(False)。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=2;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="開/關線程:1為開0為關。";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][0]="關閉";
rs["Arguments"][1]["Select"][1]="開啟";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="方位設定(參數值見括號內數值)。";
rs["Arguments"][2]["Select"]={};
rs["Arguments"][2]["Select"][0]="(0)面對焦點背后";
rs["Arguments"][2]["Select"][1]="(1)面對面";
rs["Arguments"][2]["Select"][2]="(2)焦點對我背";
rs["Arguments"][2]["Select"][3]="(3)和焦點背對背";
rs["Arguments"][2]["Select"][4]="(4)面對焦點(焦點在我前方)";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["inf"]="符合設定返回真(True),反之不符合設定/沒目標/關閉 為假(False)。";
------------------play end -------------------------------------------------




rs = NewTbl("amisr");

rs["inf"]="|cff00ffff判斷技能是否可以對目標施放";
rs["Remarks"]="可以施放返囘眞,反之爲假。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=2;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="技能名稱";
rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="unit";
rs["Arguments"][2]["inf"]="目標名稱,如:小白、focus、player、target 等等這些都可以使用";



rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="目標名稱相同返囘眞,反之爲假";

rs = NewTbl("amComparisonUnit");

rs["inf"]="判斷2個目標名稱是否相同";
rs["Remarks"]="判斷2個目標名稱是否相同,成功返囘眞,反之爲假。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=3;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";
rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="String";
rs["Arguments"][2]["inf"]="目標的目標名稱。該參數是第1參數的擴展。如：第1參數目標名稱爲|cff00ffff焦點|r,當前參數爲|cff00ffff當前目標|r,那麼我們要判斷的目標就是:|cff00fffffocus-target|r(焦點目標的目標)其實還可以判斷更復雜,請參考論壇|cff00ffff UnitId|r 說明書。";
rs["Arguments"][3]={};
rs["Arguments"][3]["type"]="String";
rs["Arguments"][3]["inf"]="目標名稱";


rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="目標名稱相同返囘眞,反之爲假";



rs = NewTbl("amUnitAuraFindText");

rs["inf"]="搜索目標的Buff中的信息";
rs["Remarks"]="搜索BUFF中是否有指定內容,成功返囘眞,反之爲假。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=5;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";
rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="String";
rs["Arguments"][2]["inf"]="Buff名稱";
rs["Arguments"][3]={};
rs["Arguments"][3]["type"]="Number";
rs["Arguments"][3]["inf"]="指定獲得Buff信息中的第幾個信息,一般Buff第1是名稱,第2是說明,第3是時間";
rs["Arguments"][4]={};
rs["Arguments"][4]["type"]="String";
rs["Arguments"][4]["inf"]="搜索的關鍵字";
rs["Arguments"][5]={};
rs["Arguments"][5]["type"]="String";
rs["Arguments"][5]["inf"]="指定目標buff類型";
rs["Arguments"][5]["Select"]={};
rs["Arguments"][5]["Select"]["buff"]="有益Buff(buff)"
rs["Arguments"][5]["Select"]["debuff"]="無益Buff(debuff)"
rs["Arguments"][5]["Select"][false]="全部Buff(不指定buff會影響速度)"

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘眞,反之爲假";





rs = NewTbl("amUnitAuraNumber");

rs["inf"]="獲得目標的Buff信息中的數字";
rs["Remarks"]="獲得目標的Buff信息中的數字\n如坐騎Buff的地面、飛行速度 100%、310%這些。\n|cffff0000注意：當判斷失敗(buff、目標不存在)時返囘値都是-1。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=5;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";
rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="String";
rs["Arguments"][2]["inf"]="Buff名稱";
rs["Arguments"][3]={};
rs["Arguments"][3]["type"]="Number";
rs["Arguments"][3]["inf"]="指定獲得Buff信息中的第幾個信息,一般Buff第1是名稱,第2是說明,第3是時間";
rs["Arguments"][4]={};
rs["Arguments"][4]["type"]="String";
rs["Arguments"][4]["inf"]="格式化信息,默認(%d+)。";
rs["Arguments"][5]={};
rs["Arguments"][5]["type"]="String";
rs["Arguments"][5]["inf"]="指定目標buff類型";
rs["Arguments"][5]["Select"]={};
rs["Arguments"][5]["Select"]["buff"]="有益Buff(buff)"
rs["Arguments"][5]["Select"]["debuff"]="無益Buff(debuff)"
rs["Arguments"][5]["Select"][false]="全部Buff(不指定buff會影響速度)"

rs["Returns"]={};
rs["Returns"]["Counts"]=8;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘數値。";
rs["Returns"][1]["Decimals"]=0;


rs["Returns"][2]={};
rs["Returns"][2]["type"]="Number";
rs["Returns"][2]["Failure"]=-1;
rs["Returns"][2]["inf"]="返囘數値。";
rs["Returns"][2]["Decimals"]=0;


rs["Returns"][3]={};
rs["Returns"][3]["type"]="Number";
rs["Returns"][3]["Failure"]=-1;
rs["Returns"][3]["inf"]="返囘數値。";
rs["Returns"][3]["Decimals"]=0;


rs["Returns"][4]={};
rs["Returns"][4]["type"]="Number";
rs["Returns"][4]["Failure"]=-1;
rs["Returns"][4]["inf"]="返囘數値。";
rs["Returns"][4]["Decimals"]=0;


rs["Returns"][5]={};
rs["Returns"][5]["type"]="Number";
rs["Returns"][5]["Failure"]=-1;
rs["Returns"][5]["inf"]="返囘數値。";
rs["Returns"][5]["Decimals"]=0;


rs["Returns"][6]={};
rs["Returns"][6]["type"]="Number";
rs["Returns"][6]["Failure"]=-1;
rs["Returns"][6]["inf"]="返囘數値。";
rs["Returns"][6]["Decimals"]=0;

rs["Returns"][7]={};
rs["Returns"][7]["type"]="Number";
rs["Returns"][7]["Failure"]=-1;
rs["Returns"][7]["inf"]="返囘數値。";
rs["Returns"][7]["Decimals"]=0;

rs["Returns"][8]={};
rs["Returns"][8]["type"]="Number";
rs["Returns"][8]["Failure"]=-1;
rs["Returns"][8]["inf"]="返囘數値。";
rs["Returns"][8]["Decimals"]=0;







rs = NewTbl("amnewspelltime");
rs["inf"]="目標技能冷卻參考時間";
rs["Remarks"]='獲得目標技能冷卻參考時間 time = amnewspelltime(Unit,Spell)|r\nlocal Time = amnewspelltime("target","英雄徽章"),返囘的是過去的時間,就是你施放技能后到現在經歷了多長時間。這時間僅提供慘考,因為很多技能和天賦都影響技能的冷卻狀態。';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=2;
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";
rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="String";
rs["Arguments"][2]["inf"]="技能、物品、飾品 名稱";


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
rs["Returns"][1]["inf"]="過去的時間(秒)";


--------------------------------------------

rs = NewTbl("UnitAffectingCombat");
rs["inf"] = "目標是否在戰斗狀態";
rs["Remarks"] = "布爾値 - 若指定的單位處于戰斗中則返囘true,否則返囘false。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="戰斗中返囘true";

rs = NewTbl("UnitInParty");
rs["inf"] = "目標是否在隊伍中";
rs["Remarks"] = "布爾値 - 如果指定目標位于你的隊伍里,則返囘true,否則返囘false。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="隊伍中返囘true";



rs = NewTbl("UnitInRaid");
rs["inf"] = "目標是否在團隊中";
rs["Remarks"] = "布爾値 - 如果指定目標位于你的團隊里,則返囘true,否則返囘false。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="團隊中返囘true";



rs = NewTbl("UnitIsCharmed");
rs["inf"] = "目標是否被精神控制";
rs["Remarks"] = "布爾値 - 如果目標被精神控制（卽：被魅惑）,那麼値爲true,否則値爲false。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="被精神控制返囘true";



rs = NewTbl("UnitIsCivilian");
rs["inf"] = "目標是否平民";
rs["Remarks"] = "布爾値 - 如果目標屬于平民,則値爲true,否則値爲false。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="屬于平民返囘true";



rs = NewTbl("UnitIsConnected");
rs["inf"] = "目標是否在綫";
rs["Remarks"] = "布爾値 - 對于正常連綫的玩家以及NPC來說,値爲true,對于掉綫或者不存在的目標來說,値爲false。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="在綫返囘true";



rs = NewTbl("UnitIsCorpse");
rs["inf"] = "目標是否屍體";
rs["Remarks"] = "布爾値 - 如果指定的目標是一具屍體,則値爲true,否則爲false。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="是屍體返囘true";



rs = NewTbl("UnitIsDead");
rs["inf"] = "目標是否死亡";
rs["Remarks"] = "布爾値 - 如果目標已經死亡,那麼値爲true,否則値爲false。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="已經死亡返囘true";



rs = NewTbl("UnitIsDeadOrGhost");
rs["inf"] = "目標是否死亡或靈魂狀態";
rs["Remarks"] = "布爾値 - 如果目標已經死亡或者是幽靈狀態,那麼値爲true,否則値爲false。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="已經死亡/幽靈返囘true";



rs = NewTbl("UnitIsGhost");
rs["inf"] = "目標是否靈魂狀態";
rs["Remarks"] = "布爾値 - 如果目標是幽靈狀態,那麼値爲true,否則値爲false。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="幽靈狀態返囘true";


rs = NewTbl("UnitIsPVP");
rs["inf"] = "目標是否PVP狀態";
rs["Remarks"] = "布爾値 - 如果目標處于PvP狀態,則値爲true,否則爲false。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";


rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="PvP狀態返囘true";



rs = NewTbl("UnitIsPVPFreeForAll");
rs["inf"] = "目標是否自由PVP狀態";
rs["Remarks"] = "布爾値 - 如果目標處于自由PvP狀態,則値爲true,否則爲false。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="自由PvP狀態返囘true";



rs = NewTbl("UnitIsPartyLeader");
rs["inf"] = "目標是否隊長";
rs["Remarks"] = "布爾値 - 如果指定的目標是當前隊伍的隊長,値爲true,否則爲false。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="是隊長返囘true";



rs = NewTbl("UnitIsPlayer");
rs["inf"] = "目標是否玩家";
rs["Remarks"] = "布爾値 - 如果指定的目標是名由玩家控制的角色,値爲true,否則爲false。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="是玩家返囘true";



rs = NewTbl("UnitIsPlusMob");
rs["inf"] = "目標是否比普通怪厲害";
rs["Remarks"] = "布爾値 - 如果指定目標是精英怪物,則値爲true,否則false。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="是精英怪物返囘true";


rs = NewTbl("UnitIsTapped");
rs["inf"] = "目標NPC是否已被攻擊";
rs["Remarks"] = "布爾値 - 如果指定目標已經被攻擊了,則値爲true,否則false。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="被攻擊返囘true";



rs = NewTbl("UnitIsTappedByPlayer");
rs["inf"] = "目標NPC已被其他玩家攻擊";
rs["Remarks"] = "布爾値 - 如果指定目標已經被當前玩家攻擊了,則値爲true,否則false。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="被攻擊返囘true";



rs = NewTbl("UnitIsTrivial");
rs["inf"] = "目標是否無價値";
rs["Remarks"] = "布爾値 - 如果指定目標已沒有挑戰性,卽擊殺后沒有經驗或者榮譽値,則値爲true,否則false。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="被攻擊返囘true";



rs = NewTbl("UnitIsVisible");
rs["inf"] = "目標是否能被正常判斷";
rs["Remarks"] = "布爾値 - 如果目標對于游戲客戶端是[可見]的,則値爲true,否則爲false。\n\n|r游戲的機制：當某個物件進入到以當前玩家爲中心100碼范圍內時,則由服務器通知客戶端載入這件物品,此時對于該物件,該函數返囘true。該函數跟玩家視綫范圍沒有關系,只是指示對于所指定的目標,客戶端是否已經掌握了更詳細的數據。很多以Unit開頭的函數,在有效范圍外和有效范圍內返囘的結果是不同的,使用前最好用UnitIsVisible函數確認當前狀態。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="可見返囘true";


rs = NewTbl("UnitOnTaxi");
rs["inf"] = "目標是否騎乘狀態";
rs["Remarks"] = "布爾値 - 如果指定的目標在乘坐自動飛行路綫坐騎,則値爲true,否則値爲false。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="乘坐返囘true";



rs = NewTbl("UnitPlayerControlled");
rs["inf"] = "目標是否被玩家控制中";
rs["Remarks"] = "布爾値 - 如果指定的目標是名由玩家控制的角色,値爲true,否則爲false。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="玩家控制的返囘true";


rs = NewTbl("UnitPlayerOrPetInParty");
rs["inf"] = "目標是否同一隊伍";
rs["Remarks"] = "布爾値 - 如果指定目標位于你的隊伍里(包括寵物),則返囘true,否則返囘false。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="隊伍里返囘true";


rs = NewTbl("UnitPlayerOrPetInRaid");
rs["inf"] = "目標是否同一團隊";
rs["Remarks"] = "布爾値 - 如果指定目標位于你的團隊里(包括寵物),則返囘true,否則返囘false。";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="團隊里返囘true";



rs = NewTbl("amaura");
rs["inf"] = "目標Buff剩余時間";
rs["Remarks"] = "返囘: time, rank, count, buffType";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=4; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="Buff名稱";

rs["Arguments"][2]={}; 
rs["Arguments"][2]["type"]="unit";
rs["Arguments"][2]["inf"]="目標名稱";

rs["Arguments"][3]={}; 
rs["Arguments"][3]["type"]="Number";
rs["Arguments"][3]["Select"]={};
rs["Arguments"][3]["Select"][0]="自己"
rs["Arguments"][3]["Select"][1]="不是自己"
rs["Arguments"][3]["Select"][2]="任何人"
rs["Arguments"][3]["inf"]="指定Buff是誰施放的";

rs["Arguments"][4]={}; 
rs["Arguments"][4]["type"]="Number";
rs["Arguments"][4]["Select"]={};
rs["Arguments"][4]["Select"][0]="所有的Buff"
rs["Arguments"][4]["Select"][1]="有益的Buff"
rs["Arguments"][4]["Select"][2]="有害的Buff"
rs["Arguments"][4]["Select"][3]="有益的Buff可驅散/施放的"
rs["Arguments"][4]["Select"][4]="有害的Buff可驅散/施放的"
rs["Arguments"][4]["inf"]="指定Buff的類型";


rs["Returns"]["Counts"]=4;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="剩余時間(time):失敗返囘 -1";



rs["Returns"][2]={};
rs["Returns"][2]["type"]="Number";
rs["Returns"][2]["Failure"]=false;
rs["Returns"][2]["inf"]="等級(rank):失敗返囘 nil";
rs["Returns"][2]["Minimum"]=0;
rs["Returns"][2]["Maximum"]=1000;
rs["Returns"][2]["Value"]=0;
rs["Returns"][2]["Step"]=1;
rs["Returns"][2]["Percent"]=false;
rs["Returns"][2]["Decimals"]=0;

rs["Returns"][3]={};
rs["Returns"][3]["type"]="Number";
rs["Returns"][3]["Failure"]=false;
rs["Returns"][3]["inf"]="疊加層數(count):失敗返囘 nil";
rs["Returns"][3]["Minimum"]=0;
rs["Returns"][3]["Maximum"]=1000;
rs["Returns"][3]["Value"]=0;
rs["Returns"][3]["Step"]=1;
rs["Returns"][3]["Percent"]=false;
rs["Returns"][3]["Decimals"]=0;

rs["Returns"][4]={};
rs["Returns"][4]["type"]="String";
rs["Returns"][4]["Failure"]=false;
rs["Returns"][4]["inf"]="Buff類型:魔法\\詛咒\\疾病\\中毒(Magic\\Curse\\Disease\\Poison)失敗返囘 nil";


rs = NewTbl("amauraex");
rs["inf"] = "目標Buff剩余時間(超級助手適用)";
rs["Remarks"] = "返囘: time, rank, count, buffType";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=4; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="Buff名稱";

rs["Arguments"][2]={}; 
rs["Arguments"][2]["type"]="unit";
rs["Arguments"][2]["inf"]="目標名稱";

rs["Arguments"][3]={}; 
rs["Arguments"][3]["type"]="Number";
rs["Arguments"][3]["Select"]={};
rs["Arguments"][3]["Select"][0]="自己"
rs["Arguments"][3]["Select"][1]="不是自己"
rs["Arguments"][3]["Select"][2]="任何人"
rs["Arguments"][3]["inf"]="指定Buff是誰施放的";

rs["Arguments"][4]={}; 
rs["Arguments"][4]["type"]="Number";
rs["Arguments"][4]["Select"]={};
rs["Arguments"][4]["Select"][0]="所有的Buff"
rs["Arguments"][4]["Select"][1]="有益的Buff"
rs["Arguments"][4]["Select"][2]="有害的Buff"
rs["Arguments"][4]["Select"][3]="有益的Buff可驅散/施放的"
rs["Arguments"][4]["Select"][4]="有害的Buff可驅散/施放的"
rs["Arguments"][4]["inf"]="指定Buff的類型";


rs["Returns"]["Counts"]=4;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="剩余時間(time):失敗返囘 -1";



rs["Returns"][2]={};
rs["Returns"][2]["type"]="Number";
rs["Returns"][2]["Failure"]=false;
rs["Returns"][2]["inf"]="等級(rank):失敗返囘 -1";
rs["Returns"][2]["Minimum"]=0;
rs["Returns"][2]["Maximum"]=1000;
rs["Returns"][2]["Value"]=0;
rs["Returns"][2]["Step"]=1;
rs["Returns"][2]["Percent"]=-1;
rs["Returns"][2]["Decimals"]=0;

rs["Returns"][3]={};
rs["Returns"][3]["type"]="Number";
rs["Returns"][3]["Failure"]=false;
rs["Returns"][3]["inf"]="疊加層數(count):失敗返囘 -1";
rs["Returns"][3]["Minimum"]=0;
rs["Returns"][3]["Maximum"]=1000;
rs["Returns"][3]["Value"]=0;
rs["Returns"][3]["Step"]=1;
rs["Returns"][3]["Percent"]=false;
rs["Returns"][3]["Decimals"]=0;

rs["Returns"][4]={};
rs["Returns"][4]["type"]="String";
rs["Returns"][4]["Failure"]="";
rs["Returns"][4]["inf"]="Buff類型:魔法\\詛咒\\疾病\\中毒(Magic\\Curse\\Disease\\Poison)失敗返囘 空字符";




rs = NewTbl("UnitLevel");
rs["inf"] = "目標的當前等級";
rs["Remarks"] = "返囘: 目標的當前等級整數値";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";


rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=0;
rs["Returns"][1]["inf"]="整數値 - 指定的目標的等級";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=200;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;


rs = NewTbl("amUnitClassification");
rs["inf"] = "判斷目標的分類類別";
rs["Remarks"] = '目標的分類類別:|r\n"trivial" - 細小\n"normal" - 普通\n"rare" - 稀有\n"elite" - 精英\n"rareelite" - 稀有精英\n"worldboss" - 首領';
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=2; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Arguments"][2]={}; 
rs["Arguments"][2]["type"]="String";
rs["Arguments"][2]["Select"]={};
rs["Arguments"][2]["Select"]["normal"]="普通"
rs["Arguments"][2]["Select"]["trivial"]="細小"
rs["Arguments"][2]["Select"]["rare"]="精英"
rs["Arguments"][2]["Select"]["elite"]="稀有"
rs["Arguments"][2]["Select"]["rareelite"]="稀有精英"
rs["Arguments"][2]["Select"]["worldboss"]="首領"
rs["Arguments"][2]["inf"]='目標的分類類別';

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘true";




rs = NewTbl("ambuffcount");
rs["inf"] = "獲得指定目標Buff分類數量及信息";
rs["Remarks"] = "返囘: Buff分類數量和用逗號【,】分開的 buff 字符串列表";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=4; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Arguments"][2]={}; 
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["Select"]={};
rs["Arguments"][2]["Select"][0]="自己"
rs["Arguments"][2]["Select"][1]="不是自己"
rs["Arguments"][2]["Select"][2]="任何人"
rs["Arguments"][2]["inf"]="指定Buff是誰施放的";

rs["Arguments"][3]={}; 
rs["Arguments"][3]["type"]="String";
rs["Arguments"][3]["Select"]={};
rs["Arguments"][3]["Select"]["Magic"]="魔法"
rs["Arguments"][3]["Select"]["Curse"]="詛咒"
rs["Arguments"][3]["Select"]["Disease"]="疾病"
rs["Arguments"][3]["Select"]["Poison"]="中毒"
rs["Arguments"][3]["Select"]["Magic,Curse"]="魔法/詛咒"
rs["Arguments"][3]["Select"]["Disease,Poison"]="疾病/中毒"
rs["Arguments"][3]["Select"]["Magic,Curse,Disease,Poison"]="全部"
rs["Arguments"][3]["inf"]="判斷是否有這些Buff的類型";

rs["Arguments"][4]={}; 
rs["Arguments"][4]["type"]="Number";
rs["Arguments"][4]["Select"]={};
rs["Arguments"][4]["Select"][0]="有害的Buff"
rs["Arguments"][4]["Select"][1]="有益的Buff"
rs["Arguments"][4]["Select"][2]="有害的Buff可驅散/施放的"
rs["Arguments"][4]["Select"][3]="有益的Buff可驅散/施放的"
rs["Arguments"][4]["inf"]="指定Buff的類型";



rs["Returns"]["Counts"]=2;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="整數値 - Buff分類數量。失敗返囘錯誤參數序號的負値（如：-1）,無Buff返囘0 ";
rs["Returns"][1]["Minimum"]=0;
rs["Returns"][1]["Maximum"]=1000;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;

rs["Returns"][2]={};
rs["Returns"][2]["type"]="String";
rs["Returns"][2]["Failure"]=false;
rs["Returns"][2]["inf"]="字符串 - 返囘用逗號【,】分開的buff列表";


--UnitCreatureFamily

rs = NewTbl("UnitCreatureFamily");
rs["inf"]='目標的生物種類';
rs["Remarks"]='指定目標的生物種類,例如:"螃蟹","狼",在中文客戶端中返囘値爲中文,如果目標沒有生物種類,則返囘nil';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Returns"]={}
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="String";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]='返囘目標的生物種類,例如:"螃蟹","狼",在中文客戶端中返囘値爲中文,如果目標沒有生物種類,則返囘nil';



--UnitCreatureType

rs = NewTbl("UnitCreatureType");
rs["inf"]='目標的生物類型';
rs["Remarks"]='目標的生物類型,例如:"人形生物","惡魔"或者"野獸"等,在中文客戶端中返囘値爲中文,如果目標沒有生物類型(游戲界面顯示爲"未指定"),則返囘nil';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Returns"]={}
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="String";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]='返囘目標的生物類型,例如:"人形生物","惡魔"或者"野獸"等,在中文客戶端中返囘値爲中文,如果目標沒有生物類型(游戲界面顯示爲"未指定"),則返囘nil';


--UnitHealthMax

rs = NewTbl("UnitHealthMax");
rs["inf"]='目標的最大生命値';
rs["Remarks"]='如果指定的單位是團隊/小隊中的友好單位(玩家/寵物),則返囘精確的生命値最大値；反之可能返囘百分比';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=0;
rs["Returns"][1]["inf"]="返囘生命値最大値";


rs = NewTbl("aml");
rs["inf"]='目標的生命値或百分比';
rs["Remarks"]='如果指定的單位是團隊/小隊中的友好單位(玩家/寵物),則返囘精確的生命値最大値；反之返囘100%';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=3;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Arguments"][2]={}; 
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["Select"]={};
rs["Arguments"][2]["Select"][0]="獲得血量"
rs["Arguments"][2]["Select"][1]="獲得血量百分比"

rs["Arguments"][2]["inf"]="指定要獲取的表示方式";

rs["Arguments"][3]={}; 
rs["Arguments"][3]["type"]="Number";
rs["Arguments"][3]["Select"]={};
rs["Arguments"][3]["Select"][0]="當前血量"
rs["Arguments"][3]["Select"][1]="為缺血量（血量最髙値減去當前値）"
rs["Arguments"][3]["inf"]="指定要獲取數據的類型";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘生命値";



rs = NewTbl("GetUnitSpeed");
rs["inf"]='目標的移動速度';
rs["Remarks"]='返囘數値,目標的移動速度(碼/秒),不動爲0';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=0;
rs["Returns"][1]["inf"]="返囘移動速度(碼/秒)値";







rs = NewTbl("amsubgroup");
rs["inf"] = "判斷團隊小隊編號";
rs["Remarks"] = "整數値 - 如果在小隊返囘編號數字,否則返囘 0";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘小隊編號,失敗返囘 0";
rs["Returns"][1]["Minimum"]=0;
rs["Returns"][1]["Maximum"]=8;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;



rs = NewTbl("amUnitGetIncomingHeals");
rs["inf"]='目標的治療預測量';
rs["Remarks"]='你要明白開始施放治療技能后才有預測量,所以這數値在施放后才獲得。是否在施放技能由服務器來決定那麼說這個値和你施放技能是不同步的（服務器及網絡都有延時）。\n|cffff0000注意:|r一些持續性的治療技能也會引起治療預測,如：牧師的恢復直到這Buff效果消失。';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";
rs["Returns"]={};
rs["Returns"]["Counts"]=3;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘所有的預測治療量";

rs["Returns"][2]={};
rs["Returns"][2]["type"]="Number";
rs["Returns"][2]["Failure"]=-1;
rs["Returns"][2]["inf"]="返囘預測治療過量値";

rs["Returns"][3]={};
rs["Returns"][3]["type"]="Number";
rs["Returns"][3]["Failure"]=-1;
rs["Returns"][3]["inf"]="返囘我對該目標的預測治療量";



rs = NewTbl("amGetUnitName");
rs["inf"]='獲得目標名稱';
rs["Remarks"]="獲得目標名稱(含服務器名稱)";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="String";
rs["Returns"][1]["Failure"]="";
rs["Returns"][1]["inf"]="成功返囘:目標名稱,失敗返囘:nil";


rs = NewTbl("GetNumSubgroupMembers");
rs["inf"]='獲得小隊隊員數量';
rs["Remarks"]='獲得小隊隊員數量,不包含自己哦';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=0;
rs["Returns"][1]["inf"]="返囘整數字:隊員數量,沒小隊返囘0";

rs = NewTbl("GetRealNumPartyMembers");
rs["inf"]='獲得小隊隊員數量';
rs["Remarks"]='獲得小隊隊員數量,不包含自己哦。\n\n跟 GetNumSubgroupMembers 有什麼不同沒發現';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=0;
rs["Returns"][1]["inf"]="返囘整數字:隊員數量,沒小隊返囘0";



rs = NewTbl("GetNumGroupMembers");
rs["inf"]='獲得團隊團員數量';
rs["Remarks"]='獲得團隊團員數量。';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=0;
rs["Returns"][1]["inf"]="返囘整數字:團隊團員數量,沒團隊返囘0";



rs = NewTbl("amCombustionHelper");
rs["inf"]='獲得"'..SpellRemindColors..'火法天賦燃燒助手插件|r"報警提示';
rs["Remarks"]='CombustionHelper火法天賦燃燒助手,監視火法的各個主要DOT（活動炸彈、炎爆術、點燃）的計時和造成的傷害,幫助法師更好的掌握施放"燃燒"的時機。\n\n|r注意:\n調用本函數時【音頻警告】及【閾値】選項都無條件自動開啓。\n\n如果不需要發出聲音請插件設定里【圖形化選項】>【閥値警告】> None。\n\n下載:\nhttp://wowui.w.163.com/ui/classes/CombustionHelper.html';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="提示報警時返囘:true,否則返囘false";


rs = NewTbl("amGetCombustionHelperInf");
rs["inf"]='獲得"'..SpellRemindColors..'火法天賦燃燒助手插件|r"數字信息';
rs["Remarks"]='CombustionHelper火法天賦燃燒助手,監視火法的各個主要DOT（活動炸彈、炎爆術、點燃）的計時和造成的傷害,幫助法師更好的掌握施放"燃燒"的時機。\n\n下載:\nhttp://wowui.w.163.com/ui/classes/CombustionHelper.html';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=0;
rs["Returns"]={};
rs["Returns"]["Counts"]=7;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=0;
rs["Returns"][1]["inf"]="返囘活動炸彈傷害數値。";
rs["Returns"][1]["Decimals"]=0;
rs["Returns"][1]["Minimum"]=0;
rs["Returns"][1]["Maximum"]=999999;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;

rs["Returns"][2]={};
rs["Returns"][2]["type"]="Number";
rs["Returns"][2]["Failure"]=0;
rs["Returns"][2]["inf"]="返囘活動炸彈時間數値。";
rs["Returns"][2]["Decimals"]=1;
rs["Returns"][2]["Minimum"]=0;
rs["Returns"][2]["Maximum"]=100;
rs["Returns"][2]["Value"]=0;
rs["Returns"][2]["Step"]=0.1;

rs["Returns"][3]={};
rs["Returns"][3]["type"]="Number";
rs["Returns"][3]["Failure"]=0;
rs["Returns"][3]["inf"]="返囘點燃傷害數値。";
rs["Returns"][3]["Decimals"]=0;
rs["Returns"][3]["Minimum"]=0;
rs["Returns"][3]["Maximum"]=999999;
rs["Returns"][3]["Value"]=0;
rs["Returns"][3]["Step"]=1;

rs["Returns"][4]={};
rs["Returns"][4]["type"]="Number";
rs["Returns"][4]["Failure"]=0;
rs["Returns"][4]["inf"]="返囘點燃時間數値。";
rs["Returns"][4]["Decimals"]=1;
rs["Returns"][4]["Minimum"]=0;
rs["Returns"][4]["Maximum"]=100;
rs["Returns"][4]["Value"]=0;
rs["Returns"][4]["Step"]=0.1;


rs["Returns"][5]={};
rs["Returns"][5]["type"]="Number";
rs["Returns"][5]["Failure"]=0;
rs["Returns"][5]["inf"]="返囘炎爆術傷害數値。";
rs["Returns"][5]["Decimals"]=0;
rs["Returns"][5]["Minimum"]=0;
rs["Returns"][5]["Maximum"]=999999;
rs["Returns"][5]["Value"]=0;
rs["Returns"][5]["Step"]=1;

rs["Returns"][6]={};
rs["Returns"][6]["type"]="Number";
rs["Returns"][6]["Failure"]=0;
rs["Returns"][6]["inf"]="返囘炎爆術時間數値。";
rs["Returns"][6]["Decimals"]=1;
rs["Returns"][6]["Minimum"]=0;
rs["Returns"][6]["Maximum"]=100;
rs["Returns"][6]["Value"]=0;
rs["Returns"][6]["Step"]=0.1;

rs["Returns"][7]={};
rs["Returns"][7]["type"]="Number";
rs["Returns"][7]["Failure"]=0;
rs["Returns"][7]["inf"]="返囘臨界熾焰時間數値。";
rs["Returns"][7]["Decimals"]=1;
rs["Returns"][7]["Minimum"]=0;
rs["Returns"][7]["Maximum"]=100;
rs["Returns"][7]["Value"]=0;
rs["Returns"][7]["Step"]=0.1;


rs = NewTbl("amArenaTalent");
rs["inf"]='獲得競技場敵方天賦';
rs["Remarks"]='獲得競技場敵方天賦(需要安裝Gladius插件)。';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="String";
rs["Returns"][1]["Failure"]="";
rs["Returns"][1]["inf"]="成功返囘:天賦名稱,否則空字符";


rs = NewTbl("amAffDots");
rs["inf"]='獲得AffDots插件信息';
rs["Remarks"]='獲得AffDots插件信息。\n鼠標移到插件技能圖標上時,鼠標會提示返囘値和技能的對應序號。|r\n\n支持AffDots(1.15版本)';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="目標ID,當前目標=0,焦點目標=1";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][0]="當前目標"
rs["Arguments"][1]["Select"][1]="焦點目標"

rs["Returns"]={};
rs["Returns"]["Counts"]=6;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="成功返囘第1個數字,否則爲-1";
rs["Returns"][2]={};
rs["Returns"][2]["type"]="Number";
rs["Returns"][2]["Failure"]=-1;
rs["Returns"][2]["inf"]="成功返囘第2個數字,否則爲-1";
rs["Returns"][3]={};
rs["Returns"][3]["type"]="Number";
rs["Returns"][3]["Failure"]=-1;
rs["Returns"][3]["inf"]="成功返囘第3個數字,否則爲-1";

rs["Returns"][4]={};
rs["Returns"][4]["type"]="Number";
rs["Returns"][4]["Failure"]=-1;
rs["Returns"][4]["inf"]="成功返囘第4個數字,否則爲-1";

rs["Returns"][5]={};
rs["Returns"][5]["type"]="Number";
rs["Returns"][5]["Failure"]=-1;
rs["Returns"][5]["inf"]="成功返囘第5個數字,否則爲-1";

rs["Returns"][6]={};
rs["Returns"][6]["type"]="Number";
rs["Returns"][6]["Failure"]=-1;
rs["Returns"][6]["inf"]="成功返囘第6個數字,否則爲-1";


rs = NewTbl("amAffDotsVer120");
rs["inf"]='獲得AffDots(Ver1.20)插件信息';
rs["Remarks"]='設定目標和技能,獲得AffDots插件信息。|r\n\n不支持1.20前版本';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=2;
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="目標ID,當前目標=0,焦點目標=1";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][0]="當前目標"
rs["Arguments"][1]["Select"][1]="焦點目標"

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="String";
rs["Arguments"][2]["inf"]="技能名稱或者Id";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="成功返囘數値,否則爲-1";



rs = NewTbl("amPetTargetDistance");
rs["inf"]="寵物到當前目標的距離(無級髙精度)";
rs["Remarks"]="返囘距離。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="開/關線程:1為開0為關。";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][0]="關閉";
rs["Arguments"][1]["Select"][1]="開啟";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘數值";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=100;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;

rs = NewTbl("amPetFocusDistance");
rs["inf"]="寵物到焦點的距離(無級髙精度)";
rs["Remarks"]="返囘距離。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="開/關線程:1為開0為關。";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][0]="關閉";
rs["Arguments"][1]["Select"][1]="開啟";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘數值";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=100;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;

rs = NewTbl("amTargetFocusDistance");
rs["inf"]="當前目標到焦點的距離(無級髙精度)";
rs["Remarks"]="返囘距離。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="開/關線程:1為開0為關。";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][0]="關閉";
rs["Arguments"][1]["Select"][1]="開啟";

rs["Returns"]={};
rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘數值";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=100;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;

rs = NewTbl("amPetPetTargetDistance");
rs["inf"]="寵物到寵物當前目標的距離(無級髙精度)";
rs["Remarks"]="返囘距離。";
rs["Arguments"]={};
rs["Arguments"]["Counts"]=1;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="開/關線程:1為開0為關。";
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][0]="關閉";
rs["Arguments"][1]["Select"][1]="開啟";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘數值";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=100;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;


rs = NewTbl("amGetRangeUnitCount");

rs["inf"]='距離范圍內符合血量要求的目標數量';
rs["Remarks"]='距離范圍內符合血量要求的目標數量。\n不管在哪里設定線程號相同那么其他參數也應該相同，否則返回值會錯亂。';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=9;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="線程號:1-20數值。\n不管在哪里設定線程號相同那么其他參數也應該相同，否則返回值會錯亂。";

rs["Arguments"][2]={}; 
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="開/關線程:1為開0為關。";
rs["Arguments"][2]["Select"]={};
rs["Arguments"][2]["Select"][0]="關閉";
rs["Arguments"][2]["Select"][1]="開啟";

rs["Arguments"][3]={}; 
rs["Arguments"][3]["type"]="unit";
rs["Arguments"][3]["inf"]="目標名稱。";

rs["Arguments"][4]={}; 
rs["Arguments"][4]["type"]="Number";
rs["Arguments"][4]["inf"]="距離。";

rs["Arguments"][5]={}; 
rs["Arguments"][5]["type"]="Number";
rs["Arguments"][5]["inf"]="陣營:1為友方,2為敵方。";
rs["Arguments"][5]["Select"]={};
rs["Arguments"][5]["Select"][1]="友方";
rs["Arguments"][5]["Select"][2]="敵方";

rs["Arguments"][6]={}; 
rs["Arguments"][6]["type"]="Number";
rs["Arguments"][6]["inf"]="血量下限,忽略血量判斷設定為-1。";

rs["Arguments"][7]={}; 
rs["Arguments"][7]["type"]="Number";
rs["Arguments"][7]["inf"]="血量上限。";

rs["Arguments"][8]={}; 
rs["Arguments"][8]["type"]="Number";
rs["Arguments"][8]["inf"]="百分比:1為百分比計算血量,0為非百分比。";
rs["Arguments"][8]["Select"]={};
rs["Arguments"][8]["Select"][0]="非百分比";
rs["Arguments"][8]["Select"][1]="百分比";

rs["Arguments"][9]={}; 
rs["Arguments"][9]["type"]="Number";
rs["Arguments"][9]["inf"]="缺血量:1為計算缺血量,0為正常血量。";
rs["Arguments"][9]["Select"]={};
rs["Arguments"][9]["Select"][1]="計算缺血量";
rs["Arguments"][9]["Select"][0]="正常血量";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘符合條件的目標數量。";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=100;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;


rs = NewTbl("amGetRangeRadianUnitCount");
rs["inf"]='角度距離范圍內符合血量要求的目標數量';
rs["Remarks"]='距離范圍內符合血量要求的目標數量。\n不管在哪里設定線程號相同那么其他參數也應該相同，否則返回值會錯亂。';
rs["Arguments"]={};
rs["Arguments"]["Counts"]=10;
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="線程號:1-20數值。\n不管在哪里設定線程號相同那么其他參數也應該相同，否則返回值會錯亂。";

rs["Arguments"][2]={}; 
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="開/關線程:1為開0為關。";
rs["Arguments"][2]["Select"]={};
rs["Arguments"][2]["Select"][0]="關閉";
rs["Arguments"][2]["Select"][1]="開啟";

rs["Arguments"][3]={}; 
rs["Arguments"][3]["type"]="unit";
rs["Arguments"][3]["inf"]="目標名稱。";

rs["Arguments"][4]={}; 
rs["Arguments"][4]["type"]="Number";
rs["Arguments"][4]["inf"]="距離。";

rs["Arguments"][5]={}; 
rs["Arguments"][5]["type"]="Number";
rs["Arguments"][5]["inf"]="角度:1-360。";

rs["Arguments"][6]={}; 
rs["Arguments"][6]["type"]="Number";
rs["Arguments"][6]["inf"]="陣營:1為友方,2為敵方。";
rs["Arguments"][6]["Select"]={};
rs["Arguments"][6]["Select"][1]="友方";
rs["Arguments"][6]["Select"][2]="敵方";

rs["Arguments"][7]={}; 
rs["Arguments"][7]["type"]="Number";
rs["Arguments"][7]["inf"]="血量下限,忽略血量判斷設定為-1。";

rs["Arguments"][8]={}; 
rs["Arguments"][8]["type"]="Number";
rs["Arguments"][8]["inf"]="血量上限。";

rs["Arguments"][9]={}; 
rs["Arguments"][9]["type"]="Number";
rs["Arguments"][9]["inf"]="百分比:1為百分比計算血量,0為非百分比。";
rs["Arguments"][9]["Select"]={};
rs["Arguments"][9]["Select"][0]="非百分比";
rs["Arguments"][9]["Select"][1]="百分比";

rs["Arguments"][10]={}; 
rs["Arguments"][10]["type"]="Number";
rs["Arguments"][10]["inf"]="缺血量:1為計算缺血量,0為正常血量。";
rs["Arguments"][10]["Select"]={};
rs["Arguments"][10]["Select"][1]="計算缺血量";
rs["Arguments"][10]["Select"][0]="正常血量";

rs["Returns"]={};
rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Number";
rs["Returns"][1]["Failure"]=-1;
rs["Returns"][1]["inf"]="返囘符合條件的目標數量。";
rs["Returns"][1]["Minimum"]=-1;
rs["Returns"][1]["Maximum"]=100;
rs["Returns"][1]["Value"]=0;
rs["Returns"][1]["Step"]=1;
rs["Returns"][1]["Percent"]=false;
rs["Returns"][1]["Decimals"]=0;

for e, rs in pairs(api) do
	rs["type"]="NoRun";
end
--------------------------------------------
rs = NewTbl("stEndProgram");
rs["type"]="Run";
rs["end"]="EndProgram";
rs["unit"]="nogoal";
rs["inf"] = "|cffff0000結束當前施法方案";
rs["Remarks"] = "當判斷條件返囘true時,結束當前【施法方案】運行|r\n設計這函數初衷是能吧治療施法方案分類,對不同血量,不同職業這些用不同的方案。當然其他應用更多不能一一列出。\n|cffff0000注意要理解的關鍵詞:|cff00ffff當前【施法方案】|r\n|cffffff00寄語小白:|r函數是跳過本方案,后面有方案的話還可以繼續下去哦...";
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


rs = NewTbl("ammpy");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = "滅破法師的變形術";
rs["Remarks"] = "布爾値 - 成功返囘true";
rs["Arguments"]={}; rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="敵方施放變形術剩余時間秒,精確到0.0001秒.";
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
rs["inf"] = "一鍵驅散Decursive";
rs["Remarks"] = "需要安裝Decursive插件,布爾値 - 成功返囘true";
rs["Arguments"]={}; 
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={}; 
rs["Arguments"][1]["type"]="Boolean";
rs["Arguments"][1]["inf"]="是否立刻打斷技能施放驅散,為「眞」時立刻打斷。默認「假」";
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
rs["inf"] = "技能正在執行時按下鼠標左鍵";
rs["Remarks"] = "主要用于判斷AOE技能點亮時按下鼠標左鍵施放技能,只能用于加強版本客戶端。布爾値 - 成功返囘true";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="技能名稱";

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
rs["inf"] = "執行腳本";
rs["Remarks"] = "需要超級宏插件,腳本需要明確返囘値的眞假否則不能正確判斷是否施放下個技能。布爾値 - 成功返囘true";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=2; 
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="超級宏插件腳本名稱";
rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="unit";
rs["Arguments"][2]["inf"]="目標名稱";

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
rs["inf"] = "打斷自己";
rs["Remarks"] = "打斷自己正在進行的法術或動作,請設定條件限制函數的使用,不然會卡在此函數上。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=0; 

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="永遠返囘true,沒有失敗返囘";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;


rs = NewTbl("ammouse");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = "移動并按下鼠標";
rs["Remarks"] = "當 x和y都是0的時候鼠標不會移動,只會按下指定的按鍵。返囘true";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=3; 
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="鼠標水平坐標";
rs["Arguments"][1]["Default"]={};
rs["Arguments"][1]["Default"]["value"]=0;

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="鼠標垂直坐標";
rs["Arguments"][2]["Default"]={};
rs["Arguments"][2]["Default"]["value"]=0;

rs["Arguments"][3]={};
rs["Arguments"][3]["type"]="Number";
rs["Arguments"][3]["inf"]="鼠標按鍵";
rs["Arguments"][3]["Default"]={};
rs["Arguments"][3]["Default"]["value"]=0;
rs["Arguments"][3]["Select"]={};
rs["Arguments"][3]["Select"][0]="無按鍵動作"
rs["Arguments"][3]["Select"][1]="鼠標左鍵"
rs["Arguments"][3]["Select"][2]="鼠標中鍵"
rs["Arguments"][3]["Select"][3]="鼠標右鍵"

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
rs["Arguments"][1]["inf"]="目標名稱";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="String";
rs["Arguments"][2]["inf"]="Buff名稱";

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
rs["inf"] = "自動進出戰場";
rs["Remarks"] = "戰場列表第1個的戰場的索引號碼爲1。返囘true";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=2; 
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="戰場的名稱";
rs["Arguments"][1]["Default"]={};
rs["Arguments"][1]["Default"]["value"]=0;

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="戰場的索引號碼";
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
rs["inf"] = "給目標上標記";
rs["Remarks"] = "注意:你要有隊長、團長、助理權限。才可以標記目標,競技場、戰場是不能標記敵方目標。成功返囘true";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=2; 
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="標記代碼";
rs["Arguments"][2]["Default"]={};
rs["Arguments"][2]["Default"]["value"]=0;
rs["Arguments"][2]["Select"]={};
rs["Arguments"][2]["Select"][0]="取消標記"
rs["Arguments"][2]["Select"][1]="星星";
rs["Arguments"][2]["Select"][2]="太陽";
rs["Arguments"][2]["Select"][3]="菱形";
rs["Arguments"][2]["Select"][4]="三角";
rs["Arguments"][2]["Select"][5]="月亮";
rs["Arguments"][2]["Select"][6]="方塊";
rs["Arguments"][2]["Select"][7]="紅叉";
rs["Arguments"][2]["Select"][8]="骷髏";

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
rs["inf"] = "換上指定的武器";
rs["Remarks"] = "注意:此函數不能在戰斗中換武器和裝備,要戰斗中換武器請先連接好客戶端。成功返囘true";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=2; 
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="主手武器名稱";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="String";
rs["Arguments"][2]["inf"]="副手武器名稱";

rs["Arguments"][3]={};
rs["Arguments"][3]["type"]="String";
rs["Arguments"][3]["inf"]="遠程武器名稱";

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
rs["inf"] = "把目標設定爲焦點目標";
rs["Remarks"] = "返囘true";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";


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
rs["inf"] = "自動恢復能量或者生命";
rs["Remarks"] = "自動恢復能量或者生命,當能量或者藍少于設定値時使用技能/物品/食物等,可以設定戰斗或者非戰斗時使用。";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=5; 
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="設定判斷能量/生命/全部";
rs["Arguments"][1]["Default"]={};
rs["Arguments"][1]["Default"]["value"]=1;
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][0]="生命"
rs["Arguments"][1]["Select"][1]="能量(藍,怒氣,能量,符能等)"
rs["Arguments"][1]["Select"][2]="能量和生命"

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="當能量/生命/全部 少于%x時";
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
rs["Arguments"][3]["inf"]="Buff名稱,當無這個Buff時條件成立";
rs["Arguments"][3]["Default"]={};
rs["Arguments"][3]["Default"]["value"]="飲水";

rs["Arguments"][4]={};
rs["Arguments"][4]["type"]="String";
rs["Arguments"][4]["inf"]="技能名稱（要施放的技能名稱 如：甜果酒）";
rs["Arguments"][4]["Default"]={};
rs["Arguments"][4]["Default"]["value"]="甜果酒";


rs["Arguments"][5]={}; 
rs["Arguments"][5]["type"]="Boolean";
rs["Arguments"][5]["inf"]="指定是否戰斗中施放,眞爲戰斗中,反之爲假";
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
rs["inf"] = "|cffff00ff攻擊最近的目標/停止攻擊";
rs["Remarks"] = "攻擊最近的目標";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=2; 
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="設定攻擊/停止攻擊. \n0 - 攻擊(默認値0)  \n1 - 停止攻擊";
rs["Arguments"][1]["Default"]={};
rs["Arguments"][1]["Default"]["value"]=0;
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][0]="攻擊"
rs["Arguments"][1]["Select"][1]="停止攻擊";

rs["Arguments"][2]={};
rs["Arguments"][2]["type"]="Number";
rs["Arguments"][2]["inf"]="設定自動尋找目標攻擊/禁止自動找目標攻擊。\n0 - 自動尋找目標攻擊(默認値0) \n1 - 禁止自動找目標攻擊";
rs["Arguments"][2]["Default"]={};
rs["Arguments"][2]["Default"]["value"]=0;
rs["Arguments"][2]["Select"]={};
rs["Arguments"][2]["Select"][0]="自動尋找目標攻擊"
rs["Arguments"][2]["Select"][1]="禁止自動找目標攻擊";


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
rs["inf"] = "跟隨指定目標";
rs["Remarks"] = "跟隨指定目標成功返囘true,反之返囘false";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="unit";
rs["Arguments"][1]["inf"]="目標名稱";


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
rs["inf"] = SpellRemindColors .."Hedd技能優先級提醒插件自動輸出。";
rs["Remarks"] = "需要Hedd插件,布爾値 - 成功返囘true\n\n|r下載:\n\nhttp://wowui.178.com/ui/772\n\n評價:想通過這插件提髙DPS完全不靠譜,建議懶人和對DPS無視的人士使用。";
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
rs["inf"] = SpellRemindColors .. "SkeenCore3技能循環提醒插件自動輸出。";
rs["Remarks"] = "需要SkeenCore3插件,布爾値 - 成功返囘true\n\n|r下載:\n\nhttp://wowui.w.163.com/ui/combat/SkeenCore3.html\n\n評價:想通過這插件提髙DPS完全不靠譜,建議懶人和對DPS無視的人士使用。";
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

rs = NewTbl("amOvale");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = SpellRemindColors .. "Ovale全職業輸出助手";
rs["Remarks"] = "需要安裝Ovale插件,布爾値 - 成功返囘true\n\n評價:想通過這插件提髙DPS完全不靠譜,建議懶人和對DPS無視的人士使用。";
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


rs = NewTbl("amShockAndAwe");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = SpellRemindColors .. "薩滿祭司一鍵輸出ShockAndAwe";
rs["Remarks"] = "需要ShockAndAwe插件,布爾値 - 成功返囘true\n\n評價:想通過這插件提髙DPS完全不靠譜,建議懶人和對DPS無視的人士使用。";
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
rs["inf"] = "薩滿祭司-圖騰召囘";
rs["Remarks"] = "跟施放 圖騰召囘 技能是一樣的,唯一不同的是它會判斷有圖騰才會召囘。";
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
rs["inf"] = "薩滿祭司-摧毀指定類型圖騰";
rs["Remarks"] = "摧毀指定類型圖騰。\n1 = 火焰\n2 = 土\n3 = 水\n4 = 空氣\n0 = 全部\n\n成功返囘眞(true),失敗返囘假(false)";
rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="Number";
rs["Arguments"][1]["inf"]="摧毀指定類型圖騰數値:\n1 = 火焰\n2 = 土\n3 = 水\n4 = 空氣\n0 = 全部";
rs["Arguments"][1]["Default"]={};
rs["Arguments"][1]["Default"]["value"]=0;
rs["Arguments"][1]["Select"]={};
rs["Arguments"][1]["Select"][0]="全部"
rs["Arguments"][1]["Select"][1]="火焰"
rs["Arguments"][1]["Select"][2]="土"
rs["Arguments"][1]["Select"][3]="水"
rs["Arguments"][1]["Select"][4]="空氣"

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="成功返囘:眞(true),失敗返囘假(false)";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;



rs = NewTbl("amKey");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = "模擬按下鍵盤按鍵";
rs["Remarks"] = "字符串 - 按鍵、組合按鍵。\n\n*組合按鍵用減號【-】分開,就像游戲按鍵設定里面顯示按鍵那樣的格式。\n\n如：Ctrl-A\n\n返囘値:無"

rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=1; 
rs["Arguments"][1]={};
rs["Arguments"][1]["type"]="String";
rs["Arguments"][1]["inf"]="字符串: 按鍵、組合按鍵";
rs["Arguments"][1]["Default"]={};
rs["Arguments"][1]["Default"]["value"]="";

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="返囘:無";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=false;
rs["Returns"][1]["Default"]["checked"]=true;


rs = NewTbl("amrunEmptyAction");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = "|cffff0000執行一個空的動作";
rs["Remarks"] = "執行一個空的動作,如：我不想我喝水的時候被別的技能打斷,那麼藍沒滿的時候一直執行這函數就可以了。"

rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=0; 

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="永遠返囘眞";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;


rs = NewTbl("amClickExtraActionButton1");
rs["type"]="Run";
rs["unit"]="nogoal";
rs["inf"] = "點擊額外按鈕";
rs["Remarks"] = "點擊額外按鈕。"

rs["Arguments"]={}; 
rs["Returns"]={};
rs["Arguments"]["Counts"]=0; 

rs["Returns"]["Counts"]=1;
rs["Returns"][1]={};
rs["Returns"][1]["type"]="Boolean";
rs["Returns"][1]["Failure"]=false;
rs["Returns"][1]["inf"]="永遠返囘眞";
rs["Returns"][1]["Default"]={};
rs["Returns"][1]["Default"]["value"]=true;
rs["Returns"][1]["Default"]["checked"]=true;



--table.sort(apiIndex,function (a,b)
 -- return (a.index or 0 > b.index or 0)
--end);


function stEndProgram()

	return true;

end


