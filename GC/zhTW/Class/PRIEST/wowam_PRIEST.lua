if GetLocale() ~= "zhTW" then return; end
local SpellErrList={};
local playerClass, englishClass = UnitClass("player");

if englishClass ~= "PRIEST" then

	return;
end



local Shapeshift={}; --姿態名稱ID對照
local spellSubNameErrText={}; -- 錯誤技能信息
local ShapeshiftName = nil; --姿態本地名稱




local spellinf = wowam.spell.Info;	--技能信息

local BuffNames = {};				--BUFF名稱
local RaidSpell={};					--施放目標類型（團/隊/個人）的技能 團=3,隊=2,個人=1
local SpellIds={};					-- 技能ID
local NoSpellTarget={}; 		--無目標標志


SpellIds["心靈之火"] = 588;
SpellIds["真言術:韌,"] = 21562;
SpellIds["光束泉"] = 724;
SpellIds["脈輪運轉"] = 14751;
SpellIds["心靈尖嘯"] = 8122;
SpellIds["心靈幻象"] = 2096;
SpellIds["暗影防護"] = 27683;
SpellIds["漸隱術"] = 586;
SpellIds["群體驅魔"] = 32375;
SpellIds["心靈意志"]=73413;
SpellIds["神聖新星"] = 15237;
SpellIds["希望禮頌"] = 64901; 
SpellIds["神聖禮頌"] = 64843;
SpellIds["暗影形態"] = 15473;

SpellIds["聖言術:譴"] = 88625;
SpellIds["聖言術:庇"] = 88685;
SpellIds["聖言術:寧"] = 88684;

SpellIds["真言術:盾"] = 17;

SpellIds["吸血鬼的擁抱"]=15286;





------已驗證-------------

SpellIds["射擊"]=5019;
SpellIds["自動攻擊"]=6603;
SpellIds["束縛不死生物"]=9484;
SpellIds["法力燃燒"]=8129;
SpellIds["漂浮術"]=1706;
SpellIds["防護恐懼結界"]=6346;
SpellIds["驅散魔法"]=527;
SpellIds["吸血之觸"]=34914;
SpellIds["噬靈瘟疫"]=2944;
SpellIds["安撫心靈"]=453;
SpellIds["心靈震爆"]=8092;
SpellIds["暗影惡魔"]=34433;
SpellIds["暗言術:死"]=32379;
SpellIds["暗言術:痛"]=589;
SpellIds["影散"]=47585;
SpellIds["精神控制"]=605;
SpellIds["心靈烙印"]=48045;
SpellIds["精神鞭笞"]=15407;
SpellIds["心靈鑽刺"]=73510;
SpellIds["復活術"]=2006;
SpellIds["強效治療術"]=2060;
SpellIds["快速治療"]=2061;
SpellIds["恢復"]=139;
SpellIds["懲擊"]=585;
SpellIds["癒合禱言"]=33076;
SpellIds["治療術"]=2050;
SpellIds["治療禱言"]=596;
SpellIds["祛病術"]=528;
SpellIds["神聖之火"]=14914;
SpellIds["束縛治療"]=32546;
SpellIds["虔信之躍"]=73325;


SpellIds["心靈專注"]=89485;  
SpellIds["痛苦鎮壓"]=33206;  
SpellIds["真言術:壁"]=62618;  
SpellIds["注入能量"]=10060;  
SpellIds["懺悟"]=47540;

SpellIds["守護聖靈"]=47788;  
SpellIds["治療之環"]=34861;  
SpellIds["絕望禱言"]=19236
SpellIds["大天使"]=87151;
----------------



NoSpellTarget[SpellIds["心靈之火"]] = true;
NoSpellTarget[SpellIds["真言術:韌,"]] = true;
NoSpellTarget[SpellIds["光束泉"]] = true;
NoSpellTarget[SpellIds["脈輪運轉"]] = true;
NoSpellTarget[SpellIds["心靈尖嘯"]] = true;
NoSpellTarget[SpellIds["心靈幻象"]] = true;
NoSpellTarget[SpellIds["暗影防護"]] = true;
NoSpellTarget[SpellIds["漸隱術"]] = true;
NoSpellTarget[SpellIds["群體驅魔"]] = true;
NoSpellTarget[SpellIds["心靈意志"]] = true;
NoSpellTarget[SpellIds["神聖新星"]] = true;
NoSpellTarget[SpellIds["希望禮頌"]] = true; 
NoSpellTarget[SpellIds["神聖禮頌"]] = true;
NoSpellTarget[SpellIds["暗影形態"]] = true;
NoSpellTarget[SpellIds["吸血鬼的擁抱"]] = true;

-------CTM------------------



NoSpellTarget[SpellIds["影散"]] = true;
NoSpellTarget[SpellIds["心靈專注"]] = true;
NoSpellTarget[SpellIds["真言術:壁"]] = true;
NoSpellTarget[SpellIds["絕望禱言"]] = true;

NoSpellTarget[SpellIds["大天使"]] = true;

---------


--BuffNames["脈輪：佑"] = GetSpellInfo(81207);
BuffNames["脈輪：佑"] = GetSpellInfo(81206);
BuffNames["脈輪：靜"] = GetSpellInfo(81208);
BuffNames["脈輪：罰"] = GetSpellInfo(81209);

BuffNames["虛弱靈魂"] = GetSpellInfo(6788);


amAllClassInf(SpellIds,NoSpellTarget,BuffNames);


--施放目標類型（團/隊/個人）的技能 團=3,隊=2,個人=1
--RaidSpell[SpellIds["真言術:盾"]]=3;

--技能需要能量判斷
local IsPowerCost={};

IsPowerCost[GetSpellInfo(SpellIds["真言術:盾"])]=true;


--技能需要能量判斷
function amSpellIsPowerCost(spell)
	return IsPowerCost[spell];
end



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




function amIsActivation(Id,unit) --處理被激活技能

	if GetSpellInfo(SpellIds["真言術:盾"]) == GetSpellInfo(Id) and amaura(BuffNames["虛弱靈魂"],unit,2,0)>0 then
	
		return false,false,false,true;
	
	end

	return true;
end



function amIsNoSpellTarget(SpellIds) --技能是否是有無目標標志

	return NoSpellTarget[SpellIds] and true
end




function amIsRaidSpell(spellId)
	
	return RaidSpell[spellId];
	
end

--技能轉換

function amSpellConversion(spell) -- 聖言術:譴

		if amGetSpellName(SpellIds["聖言術:譴"]) ~= spell then
			return false;
		end
		
		local spellId = false;
		
				
		if ampb(BuffNames["脈輪：罰"])>0 then
		
			spellId=SpellIds["聖言術:譴"];
		
		elseif ampb(BuffNames["脈輪：佑"])>0 then
		
			spellId=SpellIds["聖言術:庇"];
			
		elseif ampb(BuffNames["脈輪：靜"])>0 then
		
			spellId=SpellIds["聖言術:寧"];
			
		end
		
		if spellId then
			return spellId,amGetSpellName(spellId);
		else
			return false;
		end
		
		
end



function amSetSpellinf_Ex(spell)

	if amGetSpellName(SpellIds["聖言術:庇"])==spell or amGetSpellName(SpellIds["聖言術:譴"])==spell or amGetSpellName(SpellIds["聖言術:寧"])==spell then
	
		return amSetSpellinf_Ex_88625(spell);
	
	end
	
end


function amSetSpellinf_Ex_88625(spell) -- 聖言術:譴

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
		
		if spellId==SpellIds["聖言術:譴"] then
			wowam.spell.Property[spell]["HasRange"]=1;
		elseif spellId==SpellIds["聖言術:庇"] then
			wowam.spell.Property[spell]["HasRange"]=false;
		elseif spellId==SpellIds["聖言術:寧"] then
			wowam.spell.Property[spell]["HasRange"]=1;
		end
		
		return 	true,1,spell;
end
		
function amisspell_SpellConversion(name,tunit,gcd,Special,isname,typenumber,SpellLevel,temp_UnitGUID,unitguid)

	
	if not(amGetSpellName(SpellIds["聖言術:庇"])==name or amGetSpellName(SpellIds["聖言術:譴"])==name or amGetSpellName(SpellIds["聖言術:寧"])==name) then
	
		return false,-100;
	
	end

		if wowam_config.SetGCD and not gcd then
		
			if amGCD()> wowam_config.SetGCD_Time then
				
				return false,typenumber,"公共CD沒好",Cooldown;
			end
		
		end
		
		
	local spellId = wowam.spell.Property[name]["spellId"];
	local slotID = wowam.spell.Property[name]["slotID"];
		
		
		
		local T_temp1 = GetUnitSpeed("player");
		local T_temp2 = wowam.spell.Property[name]["castTime"] ;
			
		if T_temp2 >0 and T_temp1>0 then
			
			return false,typenumber,"妳移動中",Cooldown;
		end
		
		local UnitCan_a;
		
		
		
		if  wowam.spell.Property[name]["HasRange"] and tunit ~= "nogoal" then
		
			UnitCan_a = UnitCanAssist("player", tunit);
			
			if  not UnitCan_a then
				
				return false,typenumber,"技能對目標無效",Cooldown;
			end
			
			if amjl(tunit)>40 then
			
				return false,typenumber,"技能距離太遠",Cooldown;
			end
			
			

		end
		
		
		
		local start, duration, enabled  = GetSpellCooldown(spellId)
		
		Cooldown = start + duration - GetTime();
		
		if Cooldown < 0 then
			Cooldown = 0;
		end
		
		if Cooldown >0 then
		
			return false,typenumber,"技能冷卻中",Cooldown;
		end
		
		if amr("player") < wowam.spell.Property[name]["powerCost"]  then
				
			  return false,typenumber,"能量不足",Cooldown;
			
		end	
		
		
		
		
		
		
		
				
		return 	true,1,name;
		
		
		
end


