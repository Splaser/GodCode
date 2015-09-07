--if GetLocale() ~= "zhCN" then return; end
local SpellErrList={};
local playerClass, englishClass = UnitClass("player");

if englishClass ~= "DRUID" then

	return;
end






local spellinf = wowam.spell.Info;	--技能信息

local BuffName = {};				--BUFF名称
local RaidSpell={};					--施放目标类型（团/队/个人）的技能 团=3,队=2,个人=1
local SpellIds={};					-- 技能ID
local NoSpellTarget={}; 		--无目标标志



--SpellIds["强化野性冲锋(等级 1)"]=81017;

SpellIds["迅捷治愈"] = 18562;
SpellIds["愈合"] = 8936;
SpellIds["回春术"] = 774;


SpellIds["化身：生命之树(天赋，变形)"] = 	33891;
SpellIds["星辰坠落(月光)"] =      48505;
SpellIds["枭兽形态"] =    24858;
SpellIds["树皮术"] =   22812;
--SpellIds["台风"] =        50516;
--SpellIds["自然之握"] =       16689;
--SpellIds["激怒"] =        5229;
SpellIds["狂暴回复"] =        22842;
--SpellIds["挑战咆哮"] =        5209;
SpellIds["夺魂咆哮"] =   99;
SpellIds["旅行形态(变形)"] =        783;
SpellIds["水栖形态(变形)"] =        1066;
SpellIds["熊形态(变形)"] =   5487;
SpellIds["猎豹形态(变形)"] =      768;
SpellIds["潜行"] =     5215;
SpellIds["猛虎之怒"] =      5217;
SpellIds["急奔"] =      1850;
SpellIds["飞行形态(变形)"] = 33943;
SpellIds["野蛮咆哮"] =       52610;  --(无需目标但需要连击点数)
--SpellIds["狂暴"] =       50334;
SpellIds["狂暴"] =       106952;
SpellIds["生存本能"] =    61336;
--SpellIds["自然迅捷"] =  17116; 
 

--SpellIds["横扫"] = 	779;
--SpellIds["横扫"] = 	62078;
SpellIds["横扫"] = 	106785;
--SpellIds["野性冲锋"] = 	49376;
--SpellIds["野性冲锋"] = 	16979;
--SpellIds["野性冲锋"] = 	106952;
SpellIds["野性冲锋"] = 	102401;
--SpellIds["痛击"] = 	77758;
SpellIds["痛击"] = 	106832;
SpellIds["狂奔怒吼"] = 	106898;
--SpellIds["狂奔怒吼"] = 	77761;

SpellIds["野性蘑菇"] =  88747;
--SpellIds["野性蘑菇：引爆"] =  88751;

SpellIds["野性成长"] = 	48438;
--SpellIds["自然迅捷"] = 	17116;
SpellIds["宁静"] = 	740;
SpellIds["迅捷飞行形态(变形)"] = 	40120;
SpellIds["飓风(日光)"] = 	16914;
SpellIds["日光术"] = 	78675;
SpellIds["自然之力(平衡，天赋)"] = 	33831;

--SpellIds["毁灭"] = 6785;

--SpellIds["裂伤"]=33876;  
--SpellIds["裂伤"]=33878;  
SpellIds["裂伤"]=33917; 

-------------CTM-------

SpellIds["自动攻击"]=6603;
SpellIds["愤怒(日光)"]=5176;
SpellIds["月火术(月光)"]=8921;
--SpellIds["荆棘术"]=467;
SpellIds["纠缠根须"]=339;
SpellIds["星火术(月光)"]=2912;
SpellIds["传送：月光林地"]=18960;
--SpellIds["虫群"]=5570;
SpellIds["精灵之火"]=770;
SpellIds["安抚"]=2908;
--SpellIds["激活"]=29166;
--SpellIds["休眠"]=2637;
SpellIds["旋风"]=33786;
--SpellIds["滋养"]=50464;
SpellIds["起死回生"]=50769;
SpellIds["复生"]=20484;
SpellIds["净化腐蚀"]=2782;
SpellIds["野性印记"]=1126;
SpellIds["生命绽放"]=33763;
SpellIds["治疗之触"]=5185;
SpellIds["凶猛撕咬"]=22568;
SpellIds["斜掠"]=1822;
--SpellIds["爪击"]=1082;
SpellIds["低吼"]=6795;
SpellIds["重殴"]=6807;
SpellIds["迎头痛击"]=106839;
--SpellIds["迎头痛击"]=80965;
--SpellIds["精灵之火（野性）(野性)"]=16857;
--SpellIds["畏缩"]=8998;
SpellIds["蛮力猛击"]=5211;
--SpellIds["突袭"]=9005;
SpellIds["撕碎"]=5221;
SpellIds["割裂"]=1079;
SpellIds["割碎"]=22570;
SpellIds["割伤"]=33745;
--SpellIds["粉碎"]=80313;

SpellIds["化身"]=106731;
SpellIds["化身：丛林之王(天赋，变形)"]=102543;

-----------
AM_GCD_SPELLID=SpellIds["愤怒(日光)"];

NoSpellTarget[SpellIds["星辰坠落(月光)"]] =      true;
NoSpellTarget[SpellIds["枭兽形态"]] =    true;
NoSpellTarget[SpellIds["树皮术"]] =   true;
--NoSpellTarget[SpellIds["台风"]] =        true;
--NoSpellTarget[SpellIds["自然之握"]] =       true;
--NoSpellTarget[SpellIds["激怒"]] =        true;
NoSpellTarget[SpellIds["狂暴回复"]] =        true;
--NoSpellTarget[SpellIds["挑战咆哮"]] =        true;
NoSpellTarget[SpellIds["夺魂咆哮"]] =   true;
NoSpellTarget[SpellIds["旅行形态(变形)"]] =        true;
NoSpellTarget[SpellIds["水栖形态(变形)"]] =        true;
NoSpellTarget[SpellIds["熊形态(变形)"]] =   true;
NoSpellTarget[SpellIds["猎豹形态(变形)"]] =      true;
NoSpellTarget[SpellIds["潜行"]] =     true;
NoSpellTarget[SpellIds["猛虎之怒"]] =      true;
NoSpellTarget[SpellIds["急奔"]] =      true;
NoSpellTarget[SpellIds["飞行形态(变形)"]] = true;
NoSpellTarget[SpellIds["野蛮咆哮"]] =       true;  --(无需目标但需要连击点数)
NoSpellTarget[SpellIds["狂暴"]] =       true;
NoSpellTarget[SpellIds["生存本能"]] =    true;
--NoSpellTarget[SpellIds["自然迅捷"]] =  true; 


NoSpellTarget[SpellIds["横扫"]] =         true;
NoSpellTarget[SpellIds["横扫"]] =         true;

NoSpellTarget[SpellIds["痛击"]] =         true;
--NoSpellTarget[SpellIds["狂奔怒吼"]] =         true;
--NoSpellTarget[SpellIds["狂奔怒吼"]] =         true;

NoSpellTarget[SpellIds["野性蘑菇"]] =  true;
--NoSpellTarget[SpellIds["野性蘑菇：引爆"]] =  true;
NoSpellTarget[SpellIds["化身：生命之树(天赋，变形)"]] =  true;
NoSpellTarget[SpellIds["化身"]] =      true;

NoSpellTarget[SpellIds["野性成长"]] =  true;
--NoSpellTarget[SpellIds["自然迅捷"]] =  true;
NoSpellTarget[SpellIds["宁静"]] =  true;
NoSpellTarget[SpellIds["迅捷飞行形态(变形)"]] =  true;
NoSpellTarget[SpellIds["飓风(日光)"]] =  true;

NoSpellTarget[SpellIds["日光术"]] =  true;
NoSpellTarget[SpellIds["自然之力(平衡，天赋)"]] =  true;

----------CTM---

NoSpellTarget[SpellIds["传送：月光林地"]] =  true;


NoSpellTarget[SpellIds["化身：丛林之王(天赋，变形)"]] =  true;
NoSpellTarget[SpellIds["化身"]] =  true;
----------


--BuffName["强化野性冲锋(等级 1)"]=GetSpellInfo(SpellIds["强化野性冲锋(等级 1)"]);

amAllClassInf(SpellIds,NoSpellTarget,BuffNames);

local function TsetSpellIdAddLineList(menu,A,B,C,D,E,str,err)
-- 表格内容行
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
			if tostring(B) ~= tostring(D) then
				table.insert(SpellErrList, errtext);
			end
		table.insert(SpellErrList, errtext);
		
	end
end

local function TsetSpellId(TBL,menu)
	
	local str;
	local err = "";
	
	for i,v in pairs(TBL) do
		
		local name = amGetSpellName(v);
		
		if not name then
			--print(wowam.Colors.MAGENTA  .. "技能ID错误1:" .. i )
			str = "ID无效"
			err =i .. "," .. v .. "," .. v .. "," .. "".."," .. str
			TsetSpellIdAddLineList(menu,i,v,v,"","ID无效",str,err);
		else
			if name ~= i then
				
				--print(wowam.Colors.MAGENTA  .. "名称错误:" )
				--print(wowam.Colors.CYAN  .. "错误:|r" .. i  )
				--print(wowam.Colors.CYAN  .. "正确:|r" .. name  )
				str = "ID对照不了原来的名称"
				err =i .. "," .. v .. "," .. i .. "," .. name.."," .. str
				TsetSpellIdAddLineList(menu,i,v,i,name,"名称错误",str,err);
				
			else
				
				local ID =amPlayerSpellId(i);
			
				if ID and ID ~= v then
					
					--local spellLink=GetSpellLink(v);
					--print(wowam.Colors.MAGENTA  .. "ID错误:" .. i )
					--print(wowam.Colors.CYAN  .. "错误|r:" .. v  )
					--print(wowam.Colors.CYAN  .. "正确|r:" .. ID  )
					str = "通过原来的名称获得ID，但和原来设定不一样。"
					err =i .. "," .. v .. "," .. v .. "," .. ID.."," .. str
					TsetSpellIdAddLineList(menu,i,v,v,ID,"ID错误",str,err);
									
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
			print("|cffff0000技能对照错误:|cffffff00请和管理员联繫解决\n");
		
			for i,v in pairs(SpellErrList) do
				print(i..".",v);
			end
			
			print("\n|cffffff00共(" .. #SpellErrList .. ")错误，请在【技能错误信息】菜单哪里提取信息发给我。");
		
		end
	
	end
	
	local tbl = amTestSpellBook(SpellIds);
	
	
	
	if #tbl>0 then
		print("|cffff0000技能信息缺乏:|cffffff00请和管理员联繫解决\n");
	
		for i,v in pairs(tbl) do
			
			local SpellLink = GetSpellLink(v);
			
			local spellName =amGetSpellName(v);
			
			print(i..".",SpellLink);
			
			if menu then
				TsetSpellIdAddLineList(menu,spellName,v,"","","缺乏技能说明","",'SpellIds["' ..spellName .. '"]=' .. v )
			end
			
			
			
		end
		
		print("\n|cffffff00共(" .. #tbl .. ")错误，请在【技能错误信息】菜单哪里提取信息发给我。");
	
	end

	
end



function amIsActivation(Id,unit,name) --处理被激活技能

	if Id == SpellIds["迅捷治愈"] then 
		
		return amIsActivation_18562(Id,unit,name);
	
	elseif Id == SpellIds["野蛮咆哮"] then
	
		
		return amIsActivation_52610(Id,unit,name);
	
	--elseif Id == SpellIds["毁灭"] then	

		--return amIsActivation_81017(Id,unit,name);
	
	else
		return true;
	end

end

--[[
---毁灭之奔窜:技能处理
function amIsActivation_81017(Id,unit,name)

	if UnitAura("player", BuffName["强化野性冲锋(等级 1)"]) then
		
		
		return true,true,false;
		
		
	else
		return false,"",true; -- 第3返回标记判断继续
	end

end
--]]

---野蛮咆哮:技能处理

function amIsActivation_52610(Id,unit,name)
	
	--if amIsSpellShapeshift(Id) then
	
		
			
			local isUsable, notEnoughMana = IsUsableSpell(Id);
			
				
			if isUsable  then
				return true,true;
			elseif notEnoughMana then
				return false,"能量不足";
			end
		
	--end

end


---迅捷治愈:技能处理

function amIsActivation_18562(Id,unit,name)


	if (amaura(amGetSpellName(SpellIds["回春术"]),unit)>0 or amaura(amGetSpellName(SpellIds["愈合"]),unit)>0) then
	
		
		local powerCost = wowam.spell.Property[name]["powerCost"] ;
		
			if amr("player") >= powerCost  then
			  return name,true,false;
			 
			end
	
	end

	return false;
end


function amSpellConversion(spell) 
		
		
		if spell == GetSpellInfo(SpellIds["化身：丛林之王(天赋，变形)"]) then
			GetSpellInfo(SpellIds["化身：丛林之王(天赋，变形)"])
			return SpellIds["化身"],amGetSpellName(SpellIds["化身"]);
		end
			
		
end

function amIsNoSpellTarget(SpellId) --技能是否是有无目标标志

	return NoSpellTarget[SpellId] and true
end


function amIsMoveSpell(Id,unit,name) --处理移动中能施放的技能
	return true;	
end

function amIsRaidSpell(spellId)
	
	return RaidSpell[spellId];
	
end



