if GetLocale() ~= "zhTW" then return; end
local SpellErrList={};
local playerClass, englishClass = UnitClass("player");

if englishClass ~= "SHAMAN" then

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



SpellIds["元素的召喚"] =  66842;
SpellIds["先祖的召喚"] =  66843;
SpellIds["火焰新星"] =  1535;
SpellIds["地縛圖騰"] =  2484;
SpellIds["灼熱圖騰"] =  3599;
SpellIds["火元素圖騰"] =  2894;
SpellIds["熔岩圖騰"] =  8190;
SpellIds["石爪圖騰"] =  5730;
SpellIds["靈魂的召喚"] =  66844;
SpellIds["元素抗性圖騰"] =  8184;
SpellIds["根基圖騰"] =  8177;
SpellIds["土元素圖騰"] =  2062;
SpellIds["火舌圖騰"] =  8227;
SpellIds["大地之力圖騰"] =  8075;
SpellIds["石膚圖騰"] =  8071;
SpellIds["空氣之怒圖騰"] =  3738;
SpellIds["英勇"] =  32182;
SpellIds["幽魂之狼"] =  2645;
SpellIds["閃電之盾"] =  324;
SpellIds["風怒圖騰"] =  8512;
SpellIds["圖騰召回"] =  36936;
SpellIds["戰栗圖騰"] =  8143;
SpellIds["水之護盾"] =  52127;
SpellIds["治療之泉圖騰"] =  5394;
SpellIds["甯靜心智圖騰"] =  87718;
SpellIds["自然迅捷"] =  16188;
SpellIds["法力之潮圖騰"] =  16190;
SpellIds["法力之泉圖騰"] =  5675;
SpellIds["大地生命武器"] =  51730;
SpellIds["石化武器"] =  8017;
SpellIds["火舌武器"] =  8024;
SpellIds["冰封武器"] =  8033;
SpellIds["雷霆風暴"] =  51490;
SpellIds["元素掌握"] =  16166;
SpellIds["野性狼魂"] =  51533;
SpellIds["薩滿之怒"] =  30823; 

------------------CTM---------


SpellIds["自動攻擊"]=6603;
SpellIds["閃電箭"]=403;
SpellIds["大地震擊"]=8042;
SpellIds["淨化術"]=370;
SpellIds["烈焰震擊"]=8050;
SpellIds["風剪"]=57994;
SpellIds["冰霜震擊"]=8056;
SpellIds["閃電鏈"]=421;
SpellIds["熔岩爆裂"]=51505;
SpellIds["束縛元素"]=76780;
SpellIds["妖術"]=51514;
SpellIds["靈魂行者的恩賜"]=79206;
SpellIds["根源打擊"]=73899;
SpellIds["水上行走"]=546;
SpellIds["星界傳送"]=556;
SpellIds["風怒武器"]=8232;
SpellIds["視界術"]=6196;
SpellIds["水下呼吸"]=131;
SpellIds["元素釋放"]=73680;
SpellIds["治療波"]=331;
SpellIds["先祖之魂"]=2008;
SpellIds["淨化靈魂"]=51886;
SpellIds["治療之湧"]=8004;
SpellIds["治療鏈"]=1064;
SpellIds["強效治療波"]=77472;
SpellIds["治療之雨"]=73920

SpellIds["大地之盾"]=974;  
SpellIds["激流"]=61295;  
SpellIds["靈魂鏈接圖騰"]=98008;  

SpellIds["熔岩猛擊"]=60103;  
SpellIds["風暴打擊"]=17364;  


------------------

NoSpellTarget[SpellIds["元素的召喚"]] =  true;
NoSpellTarget[SpellIds["先祖的召喚"]] =  true;
NoSpellTarget[SpellIds["火焰新星"]] =  true;
NoSpellTarget[SpellIds["地縛圖騰"]] =  true;
NoSpellTarget[SpellIds["灼熱圖騰"]] =  true;
NoSpellTarget[SpellIds["火元素圖騰"]] =  true;
NoSpellTarget[SpellIds["熔岩圖騰"]] =  true;
NoSpellTarget[SpellIds["石爪圖騰"]] =  true;
NoSpellTarget[SpellIds["靈魂的召喚"]] =  true;
NoSpellTarget[SpellIds["元素抗性圖騰"]] =  true;
NoSpellTarget[SpellIds["根基圖騰"]] =  true;
NoSpellTarget[SpellIds["土元素圖騰"]] =  true;
NoSpellTarget[SpellIds["火舌圖騰"]] =  true;
NoSpellTarget[SpellIds["大地之力圖騰"]] =  true;
NoSpellTarget[SpellIds["石膚圖騰"]] =  true;
NoSpellTarget[SpellIds["空氣之怒圖騰"]] =  true;
NoSpellTarget[SpellIds["英勇"]] =  true;
NoSpellTarget[SpellIds["幽魂之狼"]] =  true;
NoSpellTarget[SpellIds["閃電之盾"]] =  true;
NoSpellTarget[SpellIds["風怒圖騰"]] =  true;
NoSpellTarget[SpellIds["圖騰召回"]] =  true;
NoSpellTarget[SpellIds["戰栗圖騰"]] =  true;
NoSpellTarget[SpellIds["水之護盾"]] =  true;
NoSpellTarget[SpellIds["治療之泉圖騰"]] =  true;
NoSpellTarget[SpellIds["甯靜心智圖騰"]] =  true;
NoSpellTarget[SpellIds["自然迅捷"]] =  true;
NoSpellTarget[SpellIds["法力之潮圖騰"]] =  true;
NoSpellTarget[SpellIds["法力之泉圖騰"]] =  true;
NoSpellTarget[SpellIds["大地生命武器"]] =  true;
NoSpellTarget[SpellIds["石化武器"]] =  true;
NoSpellTarget[SpellIds["火舌武器"]] =  true;
NoSpellTarget[SpellIds["冰封武器"]] =  true;
NoSpellTarget[SpellIds["雷霆風暴"]] =  true;
NoSpellTarget[SpellIds["元素掌握"]] =  true;
NoSpellTarget[SpellIds["野性狼魂"]] =  true;
NoSpellTarget[SpellIds["薩滿之怒"]] =  true; 


----------CTM----

NoSpellTarget[SpellIds["靈魂行者的恩賜"]] =  true; 
NoSpellTarget[SpellIds["星界傳送"]] =  true; 
NoSpellTarget[SpellIds["風怒武器"]] =  true; 
NoSpellTarget[SpellIds["視界術"]] =  true; 
NoSpellTarget[SpellIds["治療之雨"]] =  true; 

NoSpellTarget[SpellIds["靈魂鏈接圖騰"]] =  true; 



BuffName["靈魂行者的恩賜"]=GetSpellInfo(SpellIds["靈魂行者的恩賜"]);

------
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

local N_71155 = GetSpellInfo(101052); --脫缰雷霆
function amIsMoveSpell(Id,unit,name) --處理移動中能施放的技能


	if UnitAura("player", BuffName["靈魂行者的恩賜"]) then 
		
		return true;
		
	elseif amIsGlyphSocketInfo(N_71155) and SpellIds["閃電箭"] == Id then
	
		
		return true;

	end
	
end


function amIsNoSpellTarget(SpellId) --技能是否是有無目標標志

	return NoSpellTarget[SpellId] and true;
end



function amIsRaidSpell(spellId)
	
	return RaidSpell[spellId] and true;
	
end
