--if GetLocale() ~= "zhCN" then return; end
local SpellErrList={};
local playerClass, englishClass = UnitClass("player");

if englishClass ~= "PRIEST" then

	return;
end




local BuffNames = {};				--BUFF名称
local RaidSpell={};					--施放目标类型（团/队/个人）的技能 团=3,队=2,个人=1
local SpellIds={};					-- 技能ID
local NoSpellTarget={}; 		--无目标标志


--SpellIds["心灵之火"] = 588;
SpellIds["真言术：韧"] = 21562;
SpellIds["光明之泉"] = 126135;
--SpellIds["脉轮"] = 14751;
SpellIds["心灵尖啸"] = 8122;
SpellIds["心灵视界"] = 2096;
--SpellIds["暗影防护"] = 27683;
SpellIds["渐隐术"] = 586;
SpellIds["群体驱散"] = 32375;
--SpellIds["心灵意志"]=73413;
--SpellIds["神圣新星"] = 15237;
SpellIds["神圣新星"] = 132157;
--SpellIds["希望圣歌"] = 64901; 
SpellIds["神圣赞美诗"] = 64843;
SpellIds["暗影形态"] = 15473;

SpellIds["圣言术：罚"] = 88625;
SpellIds["圣言术：佑"] = 88685;
SpellIds["圣言术：静"] = 88684;

SpellIds["真言术：盾"] = 17;

SpellIds["吸血鬼的拥抱"]=15286;





------已验证-------------

SpellIds["射击"]=5019;
SpellIds["自动攻击"]=6603;
SpellIds["束缚亡灵"]=9484;
SpellIds["法力燃烧"]=8129;
SpellIds["漂浮术"]=1706;
SpellIds["防护恐惧结界"]=6346;
SpellIds["纯净术"]=527;
SpellIds["吸血鬼之触"]=34914;
SpellIds["噬灵疫病"]=2944;
--SpellIds["安抚心灵"]=453;
SpellIds["心灵震爆"]=8092;
SpellIds["暗影魔"]=34433;
SpellIds["暗言术：灭"]=32379;
SpellIds["暗言术：痛"]=589;
SpellIds["消散"]=47585;
SpellIds["统御意志"]=605;
SpellIds["精神灼烧"]=48045;
SpellIds["精神鞭笞"]=15407;
SpellIds["心灵尖刺"]=73510;
SpellIds["复活术"]=2006;
SpellIds["治疗术"]=2060;
SpellIds["快速治疗"]=2061;
SpellIds["恢复"]=139;
SpellIds["惩击"]=585;
SpellIds["愈合祷言"]=33076;
--SpellIds["治疗术"]=2050;
SpellIds["治疗祷言"]=596;
SpellIds["驱散魔法"]=528;
SpellIds["神圣之火"]=14914;
SpellIds["联结治疗"]=32546;
SpellIds["信仰飞跃"]=73325;


--SpellIds["心灵专注"]=89485;  
SpellIds["痛苦压制"]=33206;  
SpellIds["真言术：障"]=62618;  
SpellIds["能量灌注"]=10060;  
SpellIds["苦修"]=47540;

SpellIds["守护之魂"]=47788;  
SpellIds["治疗之环"]=34861;  
SpellIds["绝望祷言"]=19236
--SpellIds["天使长"]=87151;
----------------



--NoSpellTarget[SpellIds["心灵之火"]] = true;
--NoSpellTarget[SpellIds["真言术：韧"]] = true;
NoSpellTarget[SpellIds["光明之泉"]] = true;
--NoSpellTarget[SpellIds["脉轮"]] = true;
NoSpellTarget[SpellIds["心灵尖啸"]] = true;
NoSpellTarget[SpellIds["心灵视界"]] = true;
--NoSpellTarget[SpellIds["暗影防护"]] = true;
NoSpellTarget[SpellIds["渐隐术"]] = true;
NoSpellTarget[SpellIds["群体驱散"]] = true;
--NoSpellTarget[SpellIds["心灵意志"]] = true;
NoSpellTarget[SpellIds["神圣新星"]] = true;
--NoSpellTarget[SpellIds["希望圣歌"]] = true; 
NoSpellTarget[SpellIds["神圣赞美诗"]] = true;
NoSpellTarget[SpellIds["暗影形态"]] = true;
NoSpellTarget[SpellIds["吸血鬼的拥抱"]] = true;

-------CTM------------------



NoSpellTarget[SpellIds["消散"]] = true;
--NoSpellTarget[SpellIds["心灵专注"]] = true;
NoSpellTarget[SpellIds["真言术：障"]] = true;
NoSpellTarget[SpellIds["绝望祷言"]] = true;

--NoSpellTarget[SpellIds["天使长"]] = true;

---------


--BuffNames["脉轮：佑"] = GetSpellInfo(81207);
BuffNames["脉轮：佑"] = GetSpellInfo(81206);
BuffNames["脉轮：静"] = GetSpellInfo(81208);
BuffNames["脉轮：罚"] = GetSpellInfo(81209);

BuffNames["虚弱灵魂"] = GetSpellInfo(6788);


AM_GCD_SPELLID=SpellIds["恢复"];

amAllClassInf(SpellIds,NoSpellTarget,BuffNames);


--施放目标类型（团/队/个人）的技能 团=3,队=2,个人=1
--RaidSpell[SpellIds["真言术：盾"]]=3;

--技能需要能量判断
local IsPowerCost={};

IsPowerCost[GetSpellInfo(SpellIds["真言术：盾"])]=true;


--技能需要能量判断
function amSpellIsPowerCost(spell)
	return IsPowerCost[spell];
end



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


function amIsMoveSpell(Id,unit,name) --处理移动中能施放的技能
	return true;	
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


local T6788={};

function amIsActivation(Id,unit) --处理被激活技能

	if GetSpellInfo(SpellIds["真言术：盾"]) == GetSpellInfo(Id) then
		
		local name, _, _, _, _, _, expirationTime  = UnitDebuff(unit,BuffNames["虚弱灵魂"])
		local id = UnitGUID(unit);
		
		if ((expirationTime or 0) - GetTime()) <=0 then
		
			
			if not T6788[id] then
				T6788[id]=GetTime();
			
			else
				
				if GetTime() - T6788[id]>0.1 then
					T6788={};
					return true;
				end
				
			end
			
			return false,false,false,true;
			
		else
			T6788[id]=GetTime();
			return false,false,false,true;
		end
		
		
	
	end

	return true;
end



function amIsNoSpellTarget(SpellIds) --技能是否是有无目标标志

	return NoSpellTarget[SpellIds] and true
end




function amIsRaidSpell(spellId)
	
	return RaidSpell[spellId];
	
end

--技能转换
--[[
function amSpellConversion(spell) -- 圣言术：罚

		if amGetSpellName(SpellIds["圣言术：罚"]) ~= spell then
			return false;
		end
		
		local spellId = false;
		
				
		if ampb(BuffNames["脉轮：罚"])>0 then
		
			spellId=SpellIds["圣言术：罚"];
		
		elseif ampb(BuffNames["脉轮：佑"])>0 then
		
			spellId=SpellIds["圣言术：佑"];
			
		elseif ampb(BuffNames["脉轮：静"])>0 then
		
			spellId=SpellIds["圣言术：静"];
			
		end
		
		if spellId then
			return spellId,amGetSpellName(spellId);
		else
			return false;
		end
		
		
end

-

function amSetSpellinf_Ex(spell)

	if amGetSpellName(SpellIds["圣言术：佑"])==spell or amGetSpellName(SpellIds["圣言术：罚"])==spell or amGetSpellName(SpellIds["圣言术：静"])==spell then
	
		return amSetSpellinf_Ex_88625(spell);
	
	end
	
end


function amSetSpellinf_Ex_88625(spell) -- 圣言术：罚

		local spellId,slotID,typenumber,Cooldown;
		local spellname,level,powerCost,castTime , minRange, maxRange;
		
		
		spellId = SpellIds[spell];
		
		
		typenumber=1;
		spellname,level, _, powerCost,_,_,castTime, minRange, maxRange = GetSpellInfo(spellId);
		
		
		
		wowam.spell.Property[spell]={};
		wowam.spell.Property[spell]["type"]=1;
		wowam.spell.Property[spell]["typename"]="spell";
		
		wowam.spell.Property[spell]["spellId"]=spellId;
		wowam.spell.Property[spell]["slotID"]=false;
		
		wowam.spell.Property[spell]["time"]= GetTime();
		
		wowam.spell.Property[spell]["powerCost"]= powerCost;
		wowam.spell.Property[spell]["castTime"]= castTime;
		wowam.spell.Property[spell]["spellname"]= spellname;
		wowam.spell.Property[spell]["level"]= level;
		
		wowam.spell.Property[spell]["Spell"]= spell;
		wowam.spell.Property[spell]["RaidSpell"]= false;
		
		if spellId==SpellIds["圣言术：罚"] then
			wowam.spell.Property[spell]["HasRange"]=1;
		elseif spellId==SpellIds["圣言术：佑"] then
			wowam.spell.Property[spell]["HasRange"]=false;
		elseif spellId==SpellIds["圣言术：静"] then
			wowam.spell.Property[spell]["HasRange"]=1;
		end
		
		return 	true,1,spell;
end
		
function amisspell_SpellConversion(name,tunit,gcd,Special,isname,typenumber,SpellLevel,temp_UnitGUID,unitguid)

	
	if not(amGetSpellName(SpellIds["圣言术：佑"])==name or amGetSpellName(SpellIds["圣言术：罚"])==name or amGetSpellName(SpellIds["圣言术：静"])==name) then
	
		return false,-100;
	
	end

		if wowam_config.SetGCD and not gcd then
		
			if amGCD()> wowam_config.SetGCD_Time then
				
				return false,typenumber,"公共CD没好",Cooldown;
			end
		
		end
		
		
	local spellId = wowam.spell.Property[name]["spellId"];
	local slotID = wowam.spell.Property[name]["slotID"];
		
		
		
		local T_temp1 = GetUnitSpeed("player");
		local T_temp2 = wowam.spell.Property[name]["castTime"] ;
			
		if T_temp2 >0 and T_temp1>0 then
			
			return false,typenumber,"你移动中",Cooldown;
		end
		
		local UnitCan_a;
		
		
		
		if  wowam.spell.Property[name]["HasRange"] and tunit ~= "nogoal" then
		
			UnitCan_a = UnitCanAssist("player", tunit);
			
			if  not UnitCan_a then
				
				return false,typenumber,"技能对目标无效",Cooldown;
			end
			
			if amjl(tunit)>40 then
			
				return false,typenumber,"技能距离太远",Cooldown;
			end
			
			

		end
		
		
		
		local start, duration, enabled  = GetSpellCooldown(spellId)
		
		Cooldown = start + duration - GetTime();
		
		if Cooldown < 0 then
			Cooldown = 0;
		end
		
		if Cooldown >0 then
		
			return false,typenumber,"技能冷却中",Cooldown;
		end
		
		if amr("player") < wowam.spell.Property[name]["powerCost"]  then
				
			  return false,typenumber,"能量不足",Cooldown;
			
		end	
		
		
		
		
		
		
		
				
		return 	true,1,name;
		
		
		
end

-]]
