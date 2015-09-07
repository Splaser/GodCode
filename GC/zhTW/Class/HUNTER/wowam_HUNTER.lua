if GetLocale() ~= "zhTW" then return; end
local SpellErrList={};
local playerClass, englishClass = UnitClass("player");

if englishClass ~= "HUNTER" then

	return;
end



local Shapeshift={}; --姿態名稱ID對照
local spellSubNameErrText={}; -- 錯誤技能信息
local ShapeshiftName = nil; --姿態本地名稱




local spellinf = wowam.spell.Info;	--技能信息

local BuffName = {};				--BUFF名稱
local RaidSpell={};					--施放目標類型（團/隊/個人）的技能 團=3,隊=2,個人=1
local SpellIds={};					-- 技能ID
local NoSpellTarget={}; 		--無目標標志

SpellIds["准備就緒"] = 	 23989;

SpellIds["集中火力"] = 	 82692;
SpellIds["熱情"] = 	 82726;
SpellIds["狂野怒火"] = 	 19574;

SpellIds["陷阱發射器"] = 	 77769;
SpellIds["僞裝"] = 	 51753;
SpellIds["靈狐守護"] = 	 82661;


SpellIds["照明彈"] = 	1543;
SpellIds["假死"] = 	5384;
SpellIds["冰凍陷阱(冰霜)"] = 	1499;
SpellIds["威懾"] = 	19263;
SpellIds["冰霜陷阱(冰霜)"] = 	13809;
SpellIds["毒蛇陷阱(自然)"] = 	34600;
SpellIds["爆炸陷阱(火焰)"] = 	13813;
SpellIds["獻祭陷阱(火焰)"] = 	13795;
SpellIds["逃脫"] = 	781;
SpellIds["主人的召喚"] = 	53271;
SpellIds["複活寵物"] = 	982;
SpellIds["殺戮命令"] = 	34026;
SpellIds["治療寵物"] = 	136;
SpellIds["獵豹守護"] = 	5118;
SpellIds["解散寵物"] = 	2641;
SpellIds["豹群守護"] = 	13159;
SpellIds["野性守護"] = 	20043;
SpellIds["野獸知識"] = 	1462;
SpellIds["雄鷹守護"] = 	13165;
SpellIds["喂養寵物"] = 	6991;
SpellIds["鷹眼術"] = 	6197;  

SpellIds["眼鏡蛇射擊"] = 	77767;  
SpellIds["穩固射擊"] = 	56641;  

----CTM---------------

SpellIds["自動攻擊"]=6603;
SpellIds["奧術射擊"]=3044;
SpellIds["自動射擊"]=75;
SpellIds["震蕩射擊"]=5116;
SpellIds["獵人印記"]=1130;
SpellIds["多重射擊"]=2643;
SpellIds["甯神射擊"]=19801;
SpellIds["殺戮射擊"]=53351;
SpellIds["擾亂射擊"]=20736;
SpellIds["急速射擊"]=3045;
SpellIds["猛禽壹擊"]=2973;
SpellIds["毒蛇釘刺"]=1978;
SpellIds["摔絆"]=2974;
SpellIds["驅散射擊"]=19503;
SpellIds["誤導"]=34477;
SpellIds["馴服野獸"]=1515;
SpellIds["召喚寵物 2"]=83242;
SpellIds["恐嚇野獸"]=1513;
SpellIds["蜘蛛毒刺"]=82654;
SpellIds["召喚寵物 3"]=83243;
SpellIds["召喚寵物 4"]=83244;
SpellIds["召喚寵物 5"]=83245;
SpellIds["召喚寵物 1"]=883
SpellIds["奇美拉射擊"]=53209;  
SpellIds["沈默射擊"]=34490;  
SpellIds["瞄准射擊"]=19434;

-------


BuffName["靈狐守護"]=GetSpellInfo(SpellIds["靈狐守護"]);

BuffName["開火！"]=GetSpellInfo(82926);



NoSpellTarget[SpellIds["准備就緒"]] =  true; --	 23989;

NoSpellTarget[SpellIds["集中火力"]] =  true; --	 32300;
NoSpellTarget[SpellIds["熱情"]] =  true; --	 805;
NoSpellTarget[SpellIds["狂野怒火"]] =  true; --	 19574;

NoSpellTarget[SpellIds["陷阱發射器"]] =  true; --	 56871;
NoSpellTarget[SpellIds["僞裝"]] =  true; --	 51753;
NoSpellTarget[SpellIds["靈狐守護"]] =  true; --	 82661;


NoSpellTarget[SpellIds["照明彈"]] =  true; --	1543;
NoSpellTarget[SpellIds["假死"]] =  true; --	5384;
NoSpellTarget[SpellIds["冰凍陷阱(冰霜)"]] =  true; --	1499;
NoSpellTarget[SpellIds["威懾"]] =  true; --	19263;
NoSpellTarget[SpellIds["冰霜陷阱(冰霜)"]] =  true; --	13809;
NoSpellTarget[SpellIds["毒蛇陷阱(自然)"]] =  true; --	34600;
NoSpellTarget[SpellIds["爆炸陷阱(火焰)"]] =  true; --	13813;
NoSpellTarget[SpellIds["獻祭陷阱(火焰)"]] =  true; --	13795;
NoSpellTarget[SpellIds["逃脫"]] =  true; --	781;
NoSpellTarget[SpellIds["主人的召喚"]] =  true; --	53271;
NoSpellTarget[SpellIds["複活寵物"]] =  true; --	982;
NoSpellTarget[SpellIds["殺戮命令"]] =  true; --	34026;
NoSpellTarget[SpellIds["治療寵物"]] =  true; --	136;
NoSpellTarget[SpellIds["獵豹守護"]] =  true; --	5118;
NoSpellTarget[SpellIds["解散寵物"]] =  true; --	2641;
NoSpellTarget[SpellIds["豹群守護"]] =  true; --	13159;
NoSpellTarget[SpellIds["野性守護"]] =  true; --	20043;
NoSpellTarget[SpellIds["野獸知識"]] =  true; --	1462;
NoSpellTarget[SpellIds["雄鷹守護"]] =  true; --	13165;
NoSpellTarget[SpellIds["喂養寵物"]] =  true; --	6991;
NoSpellTarget[SpellIds["鷹眼術"]] =  true; --	6197;  


-------CTM-----------

NoSpellTarget[SpellIds["召喚寵物 1"]] =  true; --	6197; 
NoSpellTarget[SpellIds["召喚寵物 2"]] =  true; --	6197; 
NoSpellTarget[SpellIds["召喚寵物 3"]] =  true; --	6197; 
NoSpellTarget[SpellIds["召喚寵物 4"]] =  true; --	6197; 
NoSpellTarget[SpellIds["召喚寵物 5"]] =  true; --	6197; 
 


------------------
 
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
					str = "通過原來的名稱獲得ID，但和原來設定不壹洋。"
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
			print("|cffff0000技能對照錯誤:|cffffff00請和管理員聯繫解抉\n");
		
			for i,v in pairs(SpellErrList) do
				print(i..".",v);
			end
			
			print("\n|cffffff00共(" .. #SpellErrList .. ")錯誤，請在【技能錯誤信息】菜單哪裏提取信息發給我。");
		
		end
	
	end
	
	local tbl = amTestSpellBook(SpellIds);
	
	
	
	if #tbl>0 then
		print("|cffff0000技能信息缺乏:|cffffff00請和管理員聯繫解抉\n");
	
		for i,v in pairs(tbl) do
			
			local SpellLink = GetSpellLink(v);
			
			if SpellLink then
				local spellName =amGetSpellName(v);
				
				print(i..".",SpellLink,v);
				
				if menu then
					TsetSpellIdAddLineList(menu,spellName,v,"","","缺乏技能說明","",'SpellIds["' ..spellName .. '"]=' .. v )
				end
			end
			
			
			
		end
		
		print("\n|cffffff00共(" .. #tbl .. ")錯誤，請在【技能錯誤信息】菜單哪裏提取信息發給我。");
	
	end

	
end






function amIsMoveSpell(Id,unit,name) --處理移動中能施放的技能


	if (Id == SpellIds["眼鏡蛇射擊"] or Id == SpellIds["穩固射擊"]) and UnitAura("player", BuffName["靈狐守護"]) then 
		
		return true;

	
	
	elseif SpellIds["瞄准射擊"] == Id then
		
		if UnitAura("player", BuffName["開火！"]) then 
				
			return true;
			
		end
		
	
	end
	
end

function amIsActivation(Id,unit,name) --處理被激活技能

	--if Id == SpellIds["憤怒之錘"] then 
		
		
	

	--end
	return true;
end



function amIsNoSpellTarget(SpellId) --技能是否是有無目標標志

	return NoSpellTarget[SpellId] and true;
end



function amIsRaidSpell(spellId)
	
	return RaidSpell[spellId] and true;
	
end


--技能能量判斷
function amSpellIsPowerNumber(spellId)

	if SpellIds["瞄准射擊"] == spellId then
		
		if UnitAura("player", BuffName["開火！"]) then 
				
			return 0;
			
		end
		
	
	end
	
end
