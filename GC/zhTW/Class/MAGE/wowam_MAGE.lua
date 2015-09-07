if GetLocale() ~= "zhTW" then return; end
local SpellErrList={};
local playerClass, englishClass = UnitClass("player");

if englishClass ~= "MAGE" then

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


BuffName["法術連擊"]=GetSpellInfo(48108);


SpellIds["射擊"]=5019;
SpellIds["自動攻擊"]=6603;
SpellIds["寒冰箭"]=116;
SpellIds["冰霜新星"]=122;
SpellIds["冰錐術"]=120;
SpellIds["冰槍術"]=30455;
SpellIds["寒冰屏障"]=45438;
SpellIds["暴風雪"]=10;
SpellIds["霜甲術"]=7302;
SpellIds["冰霜之環"]=82676;
SpellIds["奧術飛彈"]=5143;
SpellIds["法術反制"]=2139;
SpellIds["喚醒"]=12051;
SpellIds["變形術"]=118;
SpellIds["閃現術"]=1953;
SpellIds["奧術沖擊"]=30451;
SpellIds["魔爆術"]=1449;
SpellIds["解除詛咒"]=475;
SpellIds["緩落術"]=130;
SpellIds["法師結界"]=543;
SpellIds["造餐術"]=42955;
SpellIds["法力護盾"]=1463;
SpellIds["制造法力寶石"]=759;
SpellIds["鏡像"]=55342;
SpellIds["奧術光輝"]=1459;
SpellIds["法師護甲"]=6117;
SpellIds["法術吸取"]=30449;
SpellIds["召喚餐桌"]=43987;
SpellIds["隱形術"]=66;
SpellIds["時間扭曲"]=80353;
SpellIds["火球術"]=133;
SpellIds["火焰沖擊"]=2136;
SpellIds["灼燒"]=2948;
SpellIds["熔岩護甲"]=30482;
SpellIds["烈焰風暴"]=2120;
SpellIds["霜火之箭"]=44614;
SpellIds["烈焰寶珠"]=82731

SpellIds["減速"]=31589;  
SpellIds["奧術彈幕"]=44425;  
SpellIds["氣定神閑"]=12043;  
SpellIds["傳送門：埃索達"]=32266;  
SpellIds["傳送門：塞拉摩"]=49360;  
SpellIds["傳送門：暴風城"]=10059;  
SpellIds["傳送門：達納蘇斯"]=11419;  
SpellIds["傳送門：鐵爐堡"]=11416;  
SpellIds["傳送：埃索達"]=32271;  
SpellIds["傳送：塞拉摩"]=49359;  
SpellIds["傳送：暴風城"]=3561;  
SpellIds["傳送：達納蘇斯"]=3565;  
SpellIds["傳送：鐵爐堡"]=3562;  
SpellIds["生命之血(等級1)"]=81708;


SpellIds["冰冷血脈"]=12472; 
SpellIds["召喚水元素"]=31687;  
SpellIds["寒冰護體"]=11426;  
SpellIds["急速冷卻"]=11958;  
SpellIds["深度凍結"]=44572;  
SpellIds["上古寒冰箭"]=11;  
SpellIds["變形術(龜)"]=28271;  
SpellIds["變形術(兔子)"]=61721;  
SpellIds["達拉然光輝"]=61316;  
SpellIds["傳送門：奧格瑞瑪"]=11417;  
SpellIds["傳送門：幽暗城"]=11418;  
SpellIds["傳送門：托爾巴拉德"]=88345;  
SpellIds["傳送門：斯通納德"]=49361;  
SpellIds["傳送門：沙塔斯"]=33691;  
SpellIds["傳送門：達拉然"]=53142;  
SpellIds["傳送門：銀月城"]=32267;  
SpellIds["傳送門：雷霆崖"]=11420;  
SpellIds["傳送：奧格瑞瑪"]=3567;  
SpellIds["傳送：幽暗城"]=3563;  
SpellIds["傳送：斯通納德"]=49358;  
SpellIds["傳送：沙塔斯"]=33690;  
SpellIds["傳送：達拉然"]=53140;  
SpellIds["傳送：銀月城"]=32272;  
SpellIds["傳送：雷霆崖"]=3566; 

SpellIds["專注魔法"]=54646;  
SpellIds["奧術強化"]=12042;

SpellIds["Hot Foot (TEST)"]=12;  
SpellIds["沖擊波"]=11113; 
 
SpellIds["活動炸彈"]=44457;
  
SpellIds["炎爆術"]=11366;  
SpellIds["燃燒"]=11129;  
SpellIds["龍息術"]=31661;

 
NoSpellTarget[SpellIds["冰霜新星"]] =  true; 
NoSpellTarget[SpellIds["冰錐術"]] =  true; 
NoSpellTarget[SpellIds["寒冰屏障"]] =  true; 
NoSpellTarget[SpellIds["暴風雪"]] =  true; 
NoSpellTarget[SpellIds["冰霜之環"]] =  true; 
NoSpellTarget[SpellIds["喚醒"]] =  true; 
NoSpellTarget[SpellIds["閃現術"]] =  true; 
NoSpellTarget[SpellIds["魔爆術"]] =  true; 
NoSpellTarget[SpellIds["法師結界"]] =  true; 
NoSpellTarget[SpellIds["造餐術"]] =  true; 
NoSpellTarget[SpellIds["法力護盾"]] =  true; 
NoSpellTarget[SpellIds["制造法力寶石"]] =  true; 
NoSpellTarget[SpellIds["鏡像"]] =  true; 
NoSpellTarget[SpellIds["奧術光輝"]] =  true; 

NoSpellTarget[SpellIds["法師護甲"]] =  true; 
NoSpellTarget[SpellIds["召喚餐桌"]] =  true; 
NoSpellTarget[SpellIds["隱形術"]] =  true; 
NoSpellTarget[SpellIds["時間扭曲"]] =  true; 
NoSpellTarget[SpellIds["熔岩護甲"]] =  true; 
NoSpellTarget[SpellIds["烈焰風暴"]] =  true; 

NoSpellTarget[SpellIds["烈焰寶珠"]] =  true;

NoSpellTarget[SpellIds["傳送門：埃索達"]] =  true; 
NoSpellTarget[SpellIds["傳送門：塞拉摩"]] =  true; 
NoSpellTarget[SpellIds["傳送門：暴風城"]] =  true;
NoSpellTarget[SpellIds["傳送門：達納蘇斯"]] =  true;  
NoSpellTarget[SpellIds["傳送門：鐵爐堡"]] =  true;
NoSpellTarget[SpellIds["傳送：埃索達"]] =  true;
NoSpellTarget[SpellIds["傳送：塞拉摩"]] =  true;
NoSpellTarget[SpellIds["傳送：暴風城"]] =  true;
NoSpellTarget[SpellIds["傳送：達納蘇斯"]] =  true;
NoSpellTarget[SpellIds["傳送：鐵爐堡"]] =  true;
NoSpellTarget[SpellIds["生命之血(等級1)"]] =  true;

NoSpellTarget[SpellIds["冰冷血脈"]] =  true;
NoSpellTarget[SpellIds["召喚水元素"]] =  true; 
NoSpellTarget[SpellIds["寒冰護體"]] =  true;
NoSpellTarget[SpellIds["急速冷卻"]] =  true; 

NoSpellTarget[SpellIds["達拉然光輝"]] =  true; 
NoSpellTarget[SpellIds["傳送門：奧格瑞瑪"]] =  true; 
NoSpellTarget[SpellIds["傳送門：幽暗城"]] =  true; 
NoSpellTarget[SpellIds["傳送門：托爾巴拉德"]] =  true;
NoSpellTarget[SpellIds["傳送門：斯通納德"]] =  true;  
NoSpellTarget[SpellIds["傳送門：沙塔斯"]] =  true; 
NoSpellTarget[SpellIds["傳送門：達拉然"]] =  true; 
NoSpellTarget[SpellIds["傳送門：銀月城"]] =  true;  
NoSpellTarget[SpellIds["傳送門：雷霆崖"]] =  true; 
NoSpellTarget[SpellIds["傳送：奧格瑞瑪"]] =  true;  
NoSpellTarget[SpellIds["傳送：幽暗城"]] =  true; 
NoSpellTarget[SpellIds["傳送：斯通納德"]] =  true; 
NoSpellTarget[SpellIds["傳送：沙塔斯"]] =  true;
NoSpellTarget[SpellIds["傳送：達拉然"]] =  true; 
NoSpellTarget[SpellIds["傳送：銀月城"]] =  true;  
NoSpellTarget[SpellIds["傳送：雷霆崖"]] =  true;  
NoSpellTarget[SpellIds["奧術強化"]] =  true; 

NoSpellTarget[SpellIds["沖擊波"]] =  true;  
NoSpellTarget[SpellIds["龍息術"]] =  true;



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



--function amIsActivation(Id,unit,name) --處理被激活技能

	--if Id == SpellIds["憤怒之錘"] then 
		
		
	

	--end

--end



function amIsNoSpellTarget(SpellId) --技能是否是有無目標標志

	return NoSpellTarget[SpellId] and true;
end



function amIsRaidSpell(spellId)
	
	return RaidSpell[spellId] and true;
	
end



local N_86914 = GetSpellInfo(86914); --壹觸即燃
function amIsMoveSpell(Id,unit,name) --處理移動中能施放的技能


	if UnitAura("player", BuffName["法術連擊"])  and SpellIds["炎爆術"] == Id then 
		
		return true;
		
	elseif amTalentInfo(N_86914) and SpellIds["灼燒"] == Id then
	
		
		return true;

	end
	
end