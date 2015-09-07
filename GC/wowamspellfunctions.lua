local spellinf = wowam.spell.Info;
local Spell = {};
local Buff = {};

local IsSpell = {};  
local RaidSpell={};
local SpellId={};

--德魯伊特殊技能處理

Spell["迅捷治愈"] = 	GetSpellInfo(18562);
Spell["愈合"] = 	GetSpellInfo(8936);
Buff["愈合"] = 	GetSpellInfo(8936);
Spell["回春術"] = 	GetSpellInfo(774);
Buff["回春術"] = 	GetSpellInfo(774);

IsSpell[Spell["迅捷治愈"]]=1;
IsSpell[Spell["愈合"]]=1;
IsSpell[Spell["回春術"]]=1;
Spell["真言術：盾"] = 	GetSpellInfo(17);

SpellId["聖言術:譴"] = 88625;
SpellId["聖言術:望"] = 88682;
SpellId["聖言術:庇"] = 88685;
SpellId["聖言術:寧"] = 88684;

Spell["聖言術:譴"] = GetSpellInfo(88625);
Spell["聖言術:望"] = GetSpellInfo(88682);
Spell["聖言術:庇"] = GetSpellInfo(88685);
Spell["聖言術:寧"] = GetSpellInfo(88684);

Buff["脈輪運轉:恢復"] = GetSpellInfo(81207);
Buff["脈輪運轉:治療禱言"] = GetSpellInfo(81206);
Buff["脈輪運轉:治療術"] = GetSpellInfo(81208);

SpellId["復仇"] = 6572;
SpellId["壓制"] = 7384;




wowam.SpecialSpellIsTarge={};
--獵人特殊技能處理
wowam.SpecialSpellIsTarge[GetSpellInfo(34026)] = 1	;  --殺戮命令

--施放目标类型（团/队/个人）的技能 团=3,队=2,个人=1
RaidSpell[Spell["真言術：盾"]]=3;


--技能需要能量判断
IsPowerCost[Spell["真言术：盾"]]=true;





--技能需要能量判断
function amSpellIsPowerCost(spell)
	return IsPowerCost[spell];
end




function amSpellSpecial(name,unit,gcd)

	--name = GetSpellInfo(name);
	
	name = wowam.spell.Property[name]["spellname"] ;
	
	if not IsSpell[name] then
	
		return nil;
	end
	
	if name == Spell["迅捷治愈"] then
	

	
		return amQuickcure(name,unit,gcd);
	
	
	
	
	
	end
	


end

---迅捷治愈:技能處理

function amQuickcure(name,unit,gcd)



	if (amaura(Buff["回春術"],unit)>0 or amaura(Buff["愈合"],unit)>0) then
	
		--local _, _, _, powerCost = GetSpellInfo(name);
		powerCost = wowam.spell.Property[name]["powerCost"] ;
		
			if amr("player") >= powerCost  then
			  return name;
			 
			end
	
	end


end

function amIsRaidSpell(spell)
	return RaidSpell[spell];
end
