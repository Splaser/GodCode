--if GetLocale() ~= "zhCN" then return; end

AM_CLASS_NAME["WARLOCK"] = "术士" ;	
AM_CLASS_NAME["WARRIOR"] = "战士" ;	
AM_CLASS_NAME["HUNTER"] = "猎人" ;	
AM_CLASS_NAME["MAGE"] = "法师" ;	
AM_CLASS_NAME["PRIEST"] = "牧师" ;	
AM_CLASS_NAME["DRUID"] = "德鲁伊" ;	
AM_CLASS_NAME["PALADIN"] = "圣骑士" ;	
AM_CLASS_NAME["SHAMAN"] = "萨满祭司" ;	
AM_CLASS_NAME["ROGUE"] = "盗贼" ;	
AM_CLASS_NAME["DEATHKNIGHT"] = "死亡骑士" ;	
AM_CLASS_NAME["MONK"] = "武僧" ;

local CLASS_ID={};
CLASS_ID["WARLOCK"] = 9 ;	
CLASS_ID["WARRIOR"] =1;	
CLASS_ID["HUNTER"] = 3 ;	
CLASS_ID["MAGE"] = 8 ;	
CLASS_ID["PRIEST"] = 5 ;	
CLASS_ID["DRUID"] = 11 ;	
CLASS_ID["PALADIN"] = 2 ;	
CLASS_ID["SHAMAN"] = 7;	
CLASS_ID["ROGUE"] = 4 ;	
CLASS_ID["DEATHKNIGHT"] = 6 ;	
CLASS_ID["MONK"] = 10 ;

function AMGETCLASSID()
	local _, englishClass = UnitClass("player")
	return CLASS_ID[englishClass];
end

amSpellInf={};

function amAllClassInf(SpellIds,NoSpellTarget,BuffNames)

	SpellIds["急救"]=45542;
	SpellIds["炼金术"]=80731;
	SpellIds["药水大师"]=28675;
	SpellIds["烹饪"]=2550;
	SpellIds["烹饪用火"]=818;
	SpellIds["裁缝"]=75156;
	--SpellIds["钓鱼"]=7620
	SpellIds["珠宝加工"]=28894;  
	SpellIds["选矿"]=31252;  
	SpellIds["锻造"]=51300;
	SpellIds["附魔"]=7411;
	SpellIds["分解"]=13262;
	SpellIds["地精工程师"]=20222;  
	SpellIds["工程学"]=51306
	SpellIds["侏儒工程学"]=20219; 
	SpellIds["剥皮"]=74522; 
	SpellIds["转化大师"]=28672
	SpellIds["考古学"]=88961;  
	SpellIds["勘测"]=80451;
	
	SpellIds["转化大师"]=28672;  
	--SpellIds["生命之血(等级8)"]=74497;  
	SpellIds["采集草药"]=74519;

	SpellIds["制皮"]=51302;
	SpellIds["药剂大师"]=28677;
	SpellIds["移动银行(公会福利)"]=83958;
	SpellIds["熔炼"]=2656;
	
	
	--无目标(种族特殊技能内码对应表)
	SpellIds["石像形态(种族特长)"] = 20594;
	SpellIds["狂暴(种族特长)"] = 26297;
	SpellIds["奥术洪流(种族特长)"] = 28730;
	SpellIds["影遁(种族特长)"]=58984;
	SpellIds["纳鲁的赐福(种族特长)"] = 59545;
	SpellIds["血性狂怒(种族特长)"] = 	20572;
	SpellIds["自利(种族特长)"]=59752;
	SpellIds["战争践踏(种族特长)"]=20549;  
	
	SpellIds["双形态(种族特长)"]=68996;  
	SpellIds["狂野奔跑(种族特长)"]=87840;  
	SpellIds["疾步夜行(种族特长)"]=68992;
	
	SpellIds["呼叫大胖(种族特长)"]=69046;  
	SpellIds["火箭弹幕(种族特长)"]=69041;  
	SpellIds["火箭跳(种族特长)"]=69070;
	SpellIds["被遗忘者的意志(种族特长)"]=7744;
	SpellIds["食尸(种族特长)"]=20577; 
	--SpellIds["组团出发"]=83967;
	SpellIds["群体复活(公会福利)"]=83968;
	
	--SpellIds["生命之血(等级 5)"]=55501;
	
	--NoSpellTarget[SpellIds["生命之血(等级 5)"]] =  true;
	NoSpellTarget[SpellIds["食尸(种族特长)"]] =  true;
	NoSpellTarget[SpellIds["被遗忘者的意志(种族特长)"]] =  true;
	NoSpellTarget[SpellIds["石像形态(种族特长)"]] =  true;
	NoSpellTarget[SpellIds["狂暴(种族特长)"]] =  true;
	NoSpellTarget[SpellIds["奥术洪流(种族特长)"]] =  true;
	NoSpellTarget[SpellIds["影遁(种族特长)"]]= true;
	NoSpellTarget[SpellIds["纳鲁的赐福(种族特长)"]] =  true;
	NoSpellTarget[SpellIds["血性狂怒(种族特长)"]] =  true;
	NoSpellTarget[SpellIds["自利(种族特长)"]] =  true;
	NoSpellTarget[SpellIds["战争践踏(种族特长)"]] =  true;
	NoSpellTarget[SpellIds["双形态(种族特长)"]] =  true;
	NoSpellTarget[SpellIds["狂野奔跑(种族特长)"]] =  true;
	NoSpellTarget[SpellIds["疾步夜行(种族特长)"]] =  true;
	NoSpellTarget[SpellIds["呼叫大胖(种族特长)"]] =  true;
	NoSpellTarget[SpellIds["火箭弹幕(种族特长)"]] =  true;
	NoSpellTarget[SpellIds["火箭跳(种族特长)"]] =  true;
	
	
	NoSpellTarget[SpellIds["急救"]] = true;
	NoSpellTarget[SpellIds["炼金术"]] = true;
	NoSpellTarget[SpellIds["药水大师"]] = true;
	NoSpellTarget[SpellIds["烹饪"]] = true;
	NoSpellTarget[SpellIds["烹饪用火"]] = true;
	NoSpellTarget[SpellIds["裁缝"]] = true;
	--NoSpellTarget[SpellIds["钓鱼"]] = true;
	NoSpellTarget[SpellIds["附魔"]] = true;
	NoSpellTarget[SpellIds["分解"]] = true;
	
	NoSpellTarget[SpellIds["地精工程师"]] = true;
	NoSpellTarget[SpellIds["工程学"]] = true;
	NoSpellTarget[SpellIds["侏儒工程学"]] = true;
	
	NoSpellTarget[SpellIds["剥皮"]] = true;
	NoSpellTarget[SpellIds["转化大师"]] = true;
	
	NoSpellTarget[SpellIds["考古学"]] = true;
	NoSpellTarget[SpellIds["勘测"]] = true;
	
	NoSpellTarget[SpellIds["转化大师"]] = true;
	--NoSpellTarget[SpellIds["生命之血(等级8)"]] = true;
	NoSpellTarget[SpellIds["采集草药"]] = true;
	NoSpellTarget[SpellIds["制皮"]] = true;
	
	NoSpellTarget[SpellIds["药剂大师"]] = true;
	NoSpellTarget[SpellIds["移动银行(公会福利)"]] = true;
	NoSpellTarget[SpellIds["熔炼"]] = true;
	--NoSpellTarget[SpellIds["组团出发"]] = true;
	NoSpellTarget[SpellIds["群体复活(公会福利)"]] = true;
	
	amSpellIds,amNoSpellTarget,amBuffNames = SpellIds,NoSpellTarget,BuffNames;
		
end


local IgnoreSpellIds = {};
IgnoreSpellIds["急救"]=45542;
IgnoreSpellIds["炼金术"]=80731;
IgnoreSpellIds["药水大师"]=28675;
IgnoreSpellIds["烹饪"]=2550;
IgnoreSpellIds["烹饪用火"]=818;
IgnoreSpellIds["裁缝"]=75156;
--IgnoreSpellIds["钓鱼"]=7620
IgnoreSpellIds["珠宝加工"]=28894;  
IgnoreSpellIds["选矿"]=31252;  
IgnoreSpellIds["锻造"]=51300;
IgnoreSpellIds["附魔"]=7411;
IgnoreSpellIds["分解"]=13262;

IgnoreSpellIds["地精工程师"]=20222;  
IgnoreSpellIds["工程学"]=51306
IgnoreSpellIds["侏儒工程学"]=20219; 

IgnoreSpellIds["石像形态(种族特长)"] = 20594;
IgnoreSpellIds["狂暴(种族特长)"] = 26297;
IgnoreSpellIds["奥术洪流(种族特长)"] = 28730;
IgnoreSpellIds["影遁(种族特长)"]=58984;
IgnoreSpellIds["纳鲁的赐福(种族特长)"] = 59545;
IgnoreSpellIds["血性狂怒(种族特长)"] = 	20572;
IgnoreSpellIds["自利(种族特长)"]=59752;
IgnoreSpellIds["战争践踏(种族特长)"]=20549;  

IgnoreSpellIds["双形态(种族特长)"]=68996;  
IgnoreSpellIds["狂野奔跑(种族特长)"]=87840;  
IgnoreSpellIds["疾步夜行(种族特长)"]=68992;
	
IgnoreSpellIds["剥皮"]=74522;  
IgnoreSpellIds["转化大师"]=28672

IgnoreSpellIds["呼叫大胖(种族特长)"]=69046;  
IgnoreSpellIds["火箭弹幕(种族特长)"]=69041;  
IgnoreSpellIds["火箭跳(种族特长)"]=69070; 
  
IgnoreSpellIds["考古学"]=88961;  
IgnoreSpellIds["勘测"]=80451;

IgnoreSpellIds["转化大师"]=28672;  
--IgnoreSpellIds["生命之血(等级8)"]=74497;  
IgnoreSpellIds["采集草药"]=74519;
IgnoreSpellIds["制皮"]=51302;

IgnoreSpellIds["药剂大师"]=28677;
IgnoreSpellIds["移动银行(公会福利)"]=83958;
IgnoreSpellIds["熔炼"]=2656;
--IgnoreSpellIds["组团出发"]=83967;
IgnoreSpellIds["群体复活(公会福利)"]=83968;




function amAllClassIgnoreInf(name,inf)
	
	
	
	if IgnoreSpellIds[name] and inf == "ID错误"  or IgnoreSpellIds[name] and not inf then
	
		return false;
	else
	
		return true;
	end
		

end

function amTestSpellBook(SpellIds)
	
	local i = 1;
	local tbl={};
	
	while true do
	
		--skillType, spellId = GetSpellBookItemInfo(i, "player")
		
		local func = assert(loadstring("GetSpellBookItemInfo(" .. i ..", 'player')"));
		skillType, spellId= func();
		
		--print(skillType, spellId,i)
		

		if not spellId or not skillType then
		  do break end
		end
		
		local spellName, spellSubName =GetSpellInfo(spellId);
		
		if spellName then
		
			if not spellSubName then
				spellSubName="";
			end
			
			local s ;
			
			if spellSubName == "" then
				s=spellName;
			else
				s = spellName .. "(" .. spellSubName ..")";
			end
			
			
			if not IsPassiveSpell(i,BOOKTYPE_SPELL) and not SpellIds[s] then
				
				if amAllClassIgnoreInf(spellName) then
				
					table.insert(tbl, spellId);
				end
			end
		end
		
		i = i + 1
   end
   
   return tbl;

end



local N_97128 = GetSpellInfo(97128); --熔火之羽
local N_172106 = GetSpellInfo(172106); --灵狐守护
function amIsMoveSpellAll(Id,unit,name) --处理移动中能施放的技能


	if (UnitAura("player", N_97128) or UnitAura("player", N_172106)) then 
		
		return true;
		
	
	end
	
end