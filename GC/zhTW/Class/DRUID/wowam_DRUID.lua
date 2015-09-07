if GetLocale() ~= "zhTW" then return; end
local SpellErrList={};
local playerClass, englishClass = UnitClass("player");

if englishClass ~= "DRUID" then

	return;
end



local Shapeshift={}; --姿態名稱ID對照
local spellSubNameErrText={}; -- 錯誤技能信息
local ShapeshiftName = nil; --姿態本地名稱
local ShapeshiftAllName={}; --詳細姿態名稱


	
	Shapeshift[1]="枭獸形態";
	Shapeshift[2]="熊形態";
	Shapeshift[3]="旅行形態";
	
	Shapeshift[4]="水棲形態";
	Shapeshift[5]="獵豹形態";
	Shapeshift[6]="飛行形態";
	Shapeshift[7]="生命之樹";
	
	ShapeshiftAllName["獵豹或熊形態"]="獵豹形態,熊形態";
	
	
	spellSubNameErrText["等級"]="形態";
	ShapeshiftName = "形態";




local spellinf = wowam.spell.Info;	--技能信息

local BuffName = {};				--BUFF名稱
local RaidSpell={};					--施放目標類型（團/隊/個人）的技能 團=3,隊=2,個人=1
local SpellIds={};					-- 技能ID
local NoSpellTarget={}; 		--無目標標志



SpellIds["強化野性沖鋒(等級 1)"]=81017;

SpellIds["迅捷治愈"] = 18562;
SpellIds["愈合"] = 8936;
SpellIds["回春術"] = 774;


SpellIds["生命之樹(變形)"] = 	33891;
SpellIds["星辰墜落"] =      48505;
SpellIds["枭獸形態(變形)"] =    24858;
SpellIds["樹皮術"] =   22812;
SpellIds["台風"] =        50516;
SpellIds["自然之握"] =       16689;
SpellIds["激怒(熊形態)"] =        5229;
SpellIds["狂暴回複(熊形態)"] =        22842;
SpellIds["挑戰咆哮(熊形態)"] =        5209;
SpellIds["挫志咆哮(熊形態)"] =   99;
SpellIds["旅行形態(變形)"] =        783;
SpellIds["水棲形態(變形)"] =        1066;
SpellIds["熊形態(變形)"] =   5487;
SpellIds["獵豹形態(變形)"] =      768;
SpellIds["潛行(獵豹形態)"] =     5215;
SpellIds["猛虎之怒(獵豹形態)"] =      5217;
SpellIds["急奔(獵豹形態)"] =      1850;
SpellIds["飛行形態(變形)"] = 33943;
SpellIds["野蠻咆哮(獵豹形態)"] =       52610;  --(無需目標但需要連擊點數)
SpellIds["狂暴(獵豹或熊形態)"] =       50334;
SpellIds["生存本能(獵豹或熊形態)"] =    61336;
SpellIds["自然迅捷"] =  17116; 
 

SpellIds["橫掃(熊形態)"] = 	779;
SpellIds["橫掃(獵豹形態)"] = 	62078;
SpellIds["野性沖鋒(獵豹形態)"] = 	49376;
SpellIds["野性沖鋒(熊形態)"] = 	16979;

SpellIds["痛擊(熊形態)"] = 	77758;
SpellIds["狂奔怒吼(獵豹形態)"] = 	77764;
SpellIds["狂奔怒吼(熊形態)"] = 	77761;

SpellIds["野性毒菇"] =  88747;
SpellIds["野性毒菇：引爆"] =  88751;

SpellIds["野性成長"] = 	48438;
SpellIds["自然迅捷"] = 	17116;
SpellIds["甯靜"] = 	740;
SpellIds["迅捷飛行形態(變形)"] = 	40120;
SpellIds["飓風"] = 	16914;
SpellIds["日光術"] = 	78675;
SpellIds["自然之力"] = 	33831;

SpellIds["毀滅(獵豹形態)"] = 6785;

SpellIds["裂傷(獵豹形態)"]=33876;  
SpellIds["裂傷(熊形態)"]=33878;  

-------------CTM-------

SpellIds["自動攻擊"]=6603;
SpellIds["憤怒"]=5176;
SpellIds["月火術"]=8921;
SpellIds["荊棘術"]=467;
SpellIds["糾纏根須"]=339;
SpellIds["星火術"]=2912;
SpellIds["傳送：月光林地"]=18960;
SpellIds["蟲群"]=5570;
SpellIds["精靈之火"]=770;
SpellIds["安撫"]=2908;
SpellIds["激活"]=29166;
SpellIds["休眠"]=2637;
SpellIds["旋風"]=33786;
SpellIds["滋養"]=50464;
SpellIds["起死回生"]=50769;
SpellIds["複生"]=20484;
SpellIds["淨化腐蝕"]=2782;
SpellIds["野性印記"]=1126;
SpellIds["生命綻放"]=33763;
SpellIds["治療之觸"]=5185;
SpellIds["凶猛撕咬(獵豹形態)"]=22568;
SpellIds["斜掠(獵豹形態)"]=1822;
SpellIds["爪擊(獵豹形態)"]=1082;
SpellIds["低吼(熊形態)"]=6795;
SpellIds["重毆(熊形態)"]=6807;
SpellIds["迎頭痛擊(熊形態)"]=80964;
SpellIds["迎頭痛擊(獵豹形態)"]=80965;
SpellIds["精靈之火（野性）(野性)"]=16857;
SpellIds["畏縮(獵豹形態)"]=8998;
SpellIds["猛擊(熊形態)"]=5211;
SpellIds["突襲(獵豹形態)"]=9005;
SpellIds["撕碎(獵豹形態)"]=5221;
SpellIds["割裂(獵豹形態)"]=1079;
SpellIds["割碎(獵豹形態)"]=22570;
SpellIds["割傷(熊形態)"]=33745;
SpellIds["粉碎(熊形態)"]=80313;
-----------


NoSpellTarget[SpellIds["星辰墜落"]] =      true;
NoSpellTarget[SpellIds["枭獸形態(變形)"]] =    true;
NoSpellTarget[SpellIds["樹皮術"]] =   true;
NoSpellTarget[SpellIds["台風"]] =        true;
NoSpellTarget[SpellIds["自然之握"]] =       true;
NoSpellTarget[SpellIds["激怒(熊形態)"]] =        true;
NoSpellTarget[SpellIds["狂暴回複(熊形態)"]] =        true;
NoSpellTarget[SpellIds["挑戰咆哮(熊形態)"]] =        true;
NoSpellTarget[SpellIds["挫志咆哮(熊形態)"]] =   true;
NoSpellTarget[SpellIds["旅行形態(變形)"]] =        true;
NoSpellTarget[SpellIds["水棲形態(變形)"]] =        true;
NoSpellTarget[SpellIds["熊形態(變形)"]] =   true;
NoSpellTarget[SpellIds["獵豹形態(變形)"]] =      true;
NoSpellTarget[SpellIds["潛行(獵豹形態)"]] =     true;
NoSpellTarget[SpellIds["猛虎之怒(獵豹形態)"]] =      true;
NoSpellTarget[SpellIds["急奔(獵豹形態)"]] =      true;
NoSpellTarget[SpellIds["飛行形態(變形)"]] = true;
NoSpellTarget[SpellIds["野蠻咆哮(獵豹形態)"]] =       true;  --(無需目標但需要連擊點數)
NoSpellTarget[SpellIds["狂暴(獵豹或熊形態)"]] =       true;
NoSpellTarget[SpellIds["生存本能(獵豹或熊形態)"]] =    true;
NoSpellTarget[SpellIds["自然迅捷"]] =  true; 


NoSpellTarget[SpellIds["橫掃(獵豹形態)"]] =         true;
NoSpellTarget[SpellIds["橫掃(熊形態)"]] =         true;

NoSpellTarget[SpellIds["痛擊(熊形態)"]] =         true;
NoSpellTarget[SpellIds["狂奔怒吼(獵豹形態)"]] =         true;
NoSpellTarget[SpellIds["狂奔怒吼(熊形態)"]] =         true;

NoSpellTarget[SpellIds["野性毒菇"]] =  true;
NoSpellTarget[SpellIds["野性毒菇：引爆"]] =  true;
NoSpellTarget[SpellIds["生命之樹(變形)"]] =  true;


NoSpellTarget[SpellIds["野性成長"]] =  true;
NoSpellTarget[SpellIds["自然迅捷"]] =  true;
NoSpellTarget[SpellIds["甯靜"]] =  true;
NoSpellTarget[SpellIds["迅捷飛行形態(變形)"]] =  true;
NoSpellTarget[SpellIds["飓風"]] =  true;

NoSpellTarget[SpellIds["日光術"]] =  true;
NoSpellTarget[SpellIds["自然之力"]] =  true;

----------CTM---

NoSpellTarget[SpellIds["傳送：月光林地"]] =  true;


----------


BuffName["強化野性沖鋒(等級 1)"]=GetSpellInfo(SpellIds["強化野性沖鋒(等級 1)"]);

amAllClassInf(SpellIds,NoSpellTarget,BuffNames);

local function TsetSpellIdAddLineList(menu,A,B,C,D,E,str,err)
-- 表格內容行
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
			--print(wowam.Colors.MAGENTA  .. "技能ID錯誤1:" .. i )
			str = "ID無效"
			err =i .. "," .. v .. "," .. v .. "," .. "".."," .. str
			TsetSpellIdAddLineList(menu,i,v,v,"","ID無效",str,err);
		else
			if name ~= i then
				
				--print(wowam.Colors.MAGENTA  .. "名稱錯誤:" )
				--print(wowam.Colors.CYAN  .. "錯誤:|r" .. i  )
				--print(wowam.Colors.CYAN  .. "正確:|r" .. name  )
				str = "ID對照不了原來的名稱"
				err =i .. "," .. v .. "," .. i .. "," .. name.."," .. str
				TsetSpellIdAddLineList(menu,i,v,i,name,"名稱錯誤",str,err);
				
			else
				
				local ID =amPlayerSpellId(i);
			
				if ID and ID ~= v then
					
					--local spellLink=GetSpellLink(v);
					--print(wowam.Colors.MAGENTA  .. "ID錯誤:" .. i )
					--print(wowam.Colors.CYAN  .. "錯誤|r:" .. v  )
					--print(wowam.Colors.CYAN  .. "正確|r:" .. ID  )
					str = "通過原來的名稱獲得ID，但和原來設定不壹樣。"
					err =i .. "," .. v .. "," .. v .. "," .. ID.."," .. str
					TsetSpellIdAddLineList(menu,i,v,v,ID,"ID錯誤",str,err);
									
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
			print("|cffff0000技能對照錯誤:|cffffff00請和管理員聯繫解決\n");
		
			for i,v in pairs(SpellErrList) do
				print(i..".",v);
			end
			
			print("\n|cffffff00共(" .. #SpellErrList .. ")錯誤，請在【技能錯誤信息】菜單哪裏提取信息發給我。");
		
		end
	
	end
	
	local tbl = amTestSpellBook(SpellIds);
	
	
	
	if #tbl>0 then
		print("|cffff0000技能信息缺乏:|cffffff00請和管理員聯繫解決\n");
	
		for i,v in pairs(tbl) do
			
			local SpellLink = GetSpellLink(v);
			
			local spellName =amGetSpellName(v);
			
			print(i..".",SpellLink);
			
			if menu then
				TsetSpellIdAddLineList(menu,spellName,v,"","","缺乏技能說明","",'SpellIds["' ..spellName .. '"]=' .. v )
			end
			
			
			
		end
		
		print("\n|cffffff00共(" .. #tbl .. ")錯誤，請在【技能錯誤信息】菜單哪裏提取信息發給我。");
	
	end

	
end



function amIsActivation(Id,unit,name) --處理被激活技能

	if Id == SpellIds["迅捷治愈"] then 
		
		return amIsActivation_18562(Id,unit,name);
	
	elseif Id == SpellIds["野蠻咆哮(獵豹形態)"] then
	
		
		return amIsActivation_52610(Id,unit,name);
	
elseif Id == SpellIds["毀滅(獵豹形態)"] then	

		return amIsActivation_81017(Id,unit,name);
	
	else
		return true;
	end

end


---毀滅(獵豹形態)之奔竄:技能處理
function amIsActivation_81017(Id,unit,name)

	if UnitAura("player", BuffName["強化野性沖鋒(等級 1)"]) then
		
		
		return true,true,false;
		
		
	else
		return false,"",true; -- 第3返回標記判斷繼續
	end

end

---野蠻咆哮(獵豹形態):技能處理

function amIsActivation_52610(Id,unit,name)
	
	--if amIsSpellShapeshift(Id) then
	
		
			
			local isUsable, notEnoughMana = IsUsableSpell(Id);
			
				
			if isUsable == 1  then
				return true,true;
			elseif notEnoughMana==1 then
				return false,"能量不足";
			end
		
	--end

end
--[[
function amIsActivation_52610(Id,unit,name)
	--print(amIsSpellShapeshift(Id))
	if amIsSpellShapeshift(Id) then
	
		local slot = amfindbutton(Id);
		
		if slot >0 then
			
			local isUsable, notEnoughMana = IsUsableAction(slot);
			
			--print("IsUsableAction:>>",isUsable, notEnoughMana)
			
			if isUsable == 1  then
				return true;
			end
		else
			print("系統提示：請把技能【野蠻咆哮(獵豹形態)】拖到技能動作條上。")
		end
	end

end

--]]

---迅捷治愈:技能處理

function amIsActivation_18562(Id,unit,name)


	if (amaura(amGetSpellName(SpellIds["回春術"]),unit)>0 or amaura(amGetSpellName(SpellIds["愈合"]),unit)>0) then
	
		
		local powerCost = wowam.spell.Property[name]["powerCost"] ;
		
			if amr("player") >= powerCost  then
			  return name,true,false;
			 
			end
	
	end

	return false;
end




function amIsNoSpellTarget(SpellId) --技能是否是有無目標標志

	return NoSpellTarget[SpellId] and true
end







function amIsSpellShapeshift(SpellId) -- 判斷技能是否姿態是否符合

	local spellName, spellSubName = GetSpellInfo(SpellId);
	
	
	
	if spellSubName == "" then
		return true;
	end
	
	if ShapeshiftAllName[spellSubName] then
		spellSubName= ShapeshiftAllName[spellSubName];
	end
	
	
	
	local t = false;
	
	for i,v in pairs(Shapeshift) do
	
		if strfind(spellSubName,v) then
			t = v;
			break;
		end
	
	end
	
	if not t then
		return true;
	end
	
	local _,Name = amGetShapeshiftId();
	
	if not Name then
		Name = "人形態";
	end
	
	if strfind(spellSubName,Name) then
	
		return true;
	else
		return false;
	end
	
		
end



function amIsRaidSpell(spellId)
	
	return RaidSpell[spellId];
	
end
