--if GetLocale() ~= "zhCN" then return; end
local SpellErrList={};
local playerClass, englishClass = UnitClass("player");

if englishClass ~= "MONK" then

	return;
end





local spellinf = wowam.spell.Info;	--技能信息

local BuffName = {};				--BUFF名称
local RaidSpell={};					--施放目标类型（团/队/个人）的技能 团=3,队=2,个人=1
local SpellIds={};					-- 技能ID
local NoSpellTarget={}; 		--无目标标志


SpellIds["召唤青龙雕像"]=115313;
SpellIds["壮胆酒"]=115203;
SpellIds["扫堂腿"]=119381;
SpellIds["振魂引"]=116670;
SpellIds["法力茶"]=115294;
SpellIds["灵龙式(织雾姿态)"]=115070;
SpellIds["猛虎式(姿态)"]=103985;
SpellIds["磐牛式(酒仙姿态)"]=115069;
SpellIds["真气酒"]=115399;
SpellIds["神鹤引项踢"]=101546;
SpellIds["禅悟冥想"]=115176;
SpellIds["躯不坏"]=122278;
SpellIds["还魂术"]=115310;
SpellIds["逍遥酒"]=137562;
SpellIds["雷光聚神茶"]=116680;
SpellIds["魂体双分"]=101643;
SpellIds["魂体双分：转移"]=119996;
SpellIds["召唤玄牛雕像"]=115315;
--SpellIds["慈悲庇护"]=115213;
SpellIds["火焰之息"]=115181;
SpellIds["滚地翻"]=109132;
SpellIds["活血酒"]=119582;
SpellIds["醉酿投"]=121253;
SpellIds["金钟罩"]=115295;
SpellIds["飘渺酒(激活减伤效果)"]=115308;
SpellIds["怒雷破"]=113656;
--SpellIds["旋火冲"]=115073;
SpellIds["翔龙在天"]=101545;
SpellIds["虎眼酒"]=116740;
SpellIds["豪能酒"]=115288;
SpellIds["蛮牛冲"]=119392;
SpellIds["散魔功"]=122783;
SpellIds["白虎下凡"]=123904;
SpellIds["碧玉疾风"]=116847;


NoSpellTarget[SpellIds["召唤青龙雕像"]] = true;
NoSpellTarget[SpellIds["壮胆酒"]] = true;
NoSpellTarget[SpellIds["扫堂腿"]] = true;
NoSpellTarget[SpellIds["振魂引"]] = true;
NoSpellTarget[SpellIds["法力茶"]] = true;
NoSpellTarget[SpellIds["灵龙式(织雾姿态)"]] = true;
NoSpellTarget[SpellIds["猛虎式(姿态)"]] = true;
NoSpellTarget[SpellIds["磐牛式(酒仙姿态)"]] = true;
NoSpellTarget[SpellIds["真气酒"]] = true;
NoSpellTarget[SpellIds["神鹤引项踢"]] = true;
NoSpellTarget[SpellIds["禅悟冥想"]] = true;
NoSpellTarget[SpellIds["躯不坏"]] = true;
NoSpellTarget[SpellIds["还魂术"]] = true;
NoSpellTarget[SpellIds["逍遥酒"]] = true;
NoSpellTarget[SpellIds["雷光聚神茶"]] = true;
NoSpellTarget[SpellIds["魂体双分"]] = true;
NoSpellTarget[SpellIds["魂体双分：转移"]] = true;
NoSpellTarget[SpellIds["召唤玄牛雕像"]] = true;
--NoSpellTarget[SpellIds["慈悲庇护"]] = true;
NoSpellTarget[SpellIds["火焰之息"]] = true;
NoSpellTarget[SpellIds["滚地翻"]] = true;
NoSpellTarget[SpellIds["活血酒"]] = true;
NoSpellTarget[SpellIds["醉酿投"]] = true;
NoSpellTarget[SpellIds["金钟罩"]] = true;
NoSpellTarget[SpellIds["飘渺酒(激活减伤效果)"]] = true;
NoSpellTarget[SpellIds["怒雷破"]] = true;
--NoSpellTarget[SpellIds["旋火冲"]] = true;
NoSpellTarget[SpellIds["翔龙在天"]] = true;
NoSpellTarget[SpellIds["虎眼酒"]] = true;
NoSpellTarget[SpellIds["豪能酒"]] = true;
NoSpellTarget[SpellIds["蛮牛冲"]] = true;
NoSpellTarget[SpellIds["散魔功"]] = true;
NoSpellTarget[SpellIds["白虎下凡"]] = true;
NoSpellTarget[SpellIds["碧玉疾风"]] = true;

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




function amIsMoveSpell(Id,unit,name) --处理移动中能施放的技能
	return true;	
end


function amIsActivation(Id,unit,name) --处理被激活技能

	
	return true;
	

end

--[[
function amIsActivation_24275(Id,unit,name)


	if aml(unit,"%")<=20 or (ampb(GetSpellInfo(SpellIds["复仇之怒"]))>0 and amTalentInfo(GetSpellInfo(SpellIds["圣洁怒火(等级 1)"]))) then
		return true;
	else
		return false;
	end
end
--]]

function amIsNoSpellTarget(SpellId) --技能是否是有无目标标志

	return NoSpellTarget[SpellId] and true;
end



function amIsRaidSpell(spellId)
	
	return RaidSpell[spellId] and true;
	
end
