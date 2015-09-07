--if GetLocale() ~= "zhCN" then return; end
local SpellErrList={};
local playerClass, englishClass = UnitClass("player");

if englishClass ~= "ROGUE" then

	return;
end



local BuffName = {};				--BUFF名称
local RaidSpell={};					--施放目标类型（团/队/个人）的技能 团=3,队=2,个人=1
local SpellIds={};					-- 技能ID
local NoSpellTarget={}; 		--无目标标志


SpellIds["射击"]=3018;
--SpellIds["投掷"]=2764;
SpellIds["投掷"]=121733;
SpellIds["自动攻击"]=6603;
SpellIds["刺骨"]=2098;
SpellIds["伏击"]=8676;
SpellIds["切割"]=5171;
SpellIds["偷袭"]=1833;
SpellIds["肾击"]=408;
--SpellIds["破甲"]=8647;
--SpellIds["拆卸"]=51722;
SpellIds["锁喉"]=703;
SpellIds["割裂"]=1943;
SpellIds["毒伤"]=32645;
SpellIds["致命投掷(天赋)"]=26679;
SpellIds["影袭"]=1752;
SpellIds["闪避"]=5277;
SpellIds["复原"]=73651;
SpellIds["脚踢"]=1766;
SpellIds["凿击"]=1776;
SpellIds["疾跑"]=2983;
SpellIds["背刺"]=53;
SpellIds["佯攻"]=1966;
SpellIds["毒刃"]=5938;
SpellIds["刀扇"]=51723;
SpellIds["备战就绪"]=74001;
SpellIds["潜行"]=1784;
SpellIds["搜索"]=921;
SpellIds["闷棍"]=6770;
SpellIds["开锁"]=1804;
SpellIds["消失"]=1856;
SpellIds["扰乱"]=1725;
SpellIds["致盲"]=2094;
--SpellIds["解除陷阱"]=1842;
SpellIds["暗影斗篷"]=31224;
SpellIds["嫁祸诀窍"]=57934;
--SpellIds["转嫁"]=73981;
SpellIds["烟雾弹"]=76577

AM_GCD_SPELLID=SpellIds["影袭"];

NoSpellTarget[SpellIds["疾跑"]] =  true; 
NoSpellTarget[SpellIds["闪避"]] =  true; 
NoSpellTarget[SpellIds["复原"]] =  true; 
NoSpellTarget[SpellIds["刀扇"]] =  true;  --TT
NoSpellTarget[SpellIds["备战就绪"]] =  true; 
NoSpellTarget[SpellIds["潜行"]] =  true; 
NoSpellTarget[SpellIds["搜索"]] =  true; 
NoSpellTarget[SpellIds["消失"]] =  true; 

NoSpellTarget[SpellIds["暗影斗篷"]] =  true; 
NoSpellTarget[SpellIds["烟雾弹"]] =  true; 
NoSpellTarget[SpellIds["切割"]] =  true;

 

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


function amIsMoveSpell(Id,unit,name) --处理移动中能施放的技能
	return true;	
end



function amIsNoSpellTarget(SpellId) --技能是否是有无目标标志

	return NoSpellTarget[SpellId] and true;
end



function amIsRaidSpell(spellId)
	
	return RaidSpell[spellId] and true;
	
end
