--if GetLocale() ~= "zhCN" then return; end
local SpellErrList={};
local playerClass, englishClass = UnitClass("player");

if englishClass ~= "SHAMAN" then

	return;
end


--[[
local BuffName = {};				--BUFF名称
local RaidSpell={};					--施放目标类型（团/队/个人）的技能 团=3,队=2,个人=1
local SpellIds={};					-- 技能ID
local NoSpellTarget={}; 		--无目标标志
--]]

amSpellInf[englishClass]={};
amSpellInf[englishClass]["BuffName"]={};
amSpellInf[englishClass]["RaidSpell"]={};
amSpellInf[englishClass]["SpellIds"]={};
amSpellInf[englishClass]["NoSpellTarget"]={};

local BuffName = amSpellInf[englishClass]["BuffName"];			
local RaidSpell=amSpellInf[englishClass]["RaidSpell"];					
local SpellIds=amSpellInf[englishClass]["SpellIds"];					
local NoSpellTarget=amSpellInf[englishClass]["NoSpellTarget"];

SpellIds["元素的召唤"] =  108285;
SpellIds["先祖的召唤"] =  66843;
SpellIds["火焰新星"] =  1535;
SpellIds["地缚图腾(大地图腾)"] =  2484;
SpellIds["灼热图腾(火焰图腾)"] =  3599;
SpellIds["火元素图腾(火焰图腾)"] =  2894;
SpellIds["熔岩图腾(火焰图腾)"] =  8190;
--SpellIds["石爪图腾"] =  5730;
SpellIds["灵魂的召唤"] =  66844;
--SpellIds["元素抗性图腾"] =  8184;
SpellIds["根基图腾(空气图腾)"] =  8177;
SpellIds["土元素图腾(大地图腾)"] =  2062;
--SpellIds["火舌图腾"] =  8227;
--SpellIds["大地之力图腾"] =  8075;
--SpellIds["石肤图腾"] =  8071;
--SpellIds["空气之怒图腾"] =  3738;
SpellIds["英勇"] =  32182;
SpellIds["幽魂之狼"] =  2645;
SpellIds["闪电之盾"] =  324;
--SpellIds["风怒图腾"] =  8512;
SpellIds["图腾召回"] =  36936;
SpellIds["战栗图腾(大地图腾)"] =  8143;
SpellIds["水之护盾"] =  52127;
SpellIds["治疗之泉图腾(水之图腾)"] =  5394;
--SpellIds["宁静心智图腾"] =  87718;
--SpellIds["自然迅捷"] =  16188;
--SpellIds["法力之潮图腾"] =  16190;
--SpellIds["法力之泉图腾"] =  5675;
--SpellIds["大地生命武器"] =  51730;
--SpellIds["石化武器"] =  8017;
--SpellIds["火舌武器"] =  8024;
--SpellIds["冰封武器"] =  8033;
SpellIds["雷霆风暴"] =  51490;
SpellIds["元素掌握"] =  16166;
SpellIds["野性狼魂"] =  51533;
SpellIds["萨满之怒"] =  30823; 

------------------CTM---------


SpellIds["自动攻击"]=6603;
SpellIds["闪电箭"]=403;
SpellIds["大地震击"]=8042;
SpellIds["净化术"]=370;
SpellIds["烈焰震击"]=8050;
SpellIds["风剪"]=57994;
SpellIds["冰霜震击"]=8056;
SpellIds["闪电链"]=421;
SpellIds["熔岩爆裂"]=51505;
--SpellIds["束缚元素"]=76780;
SpellIds["妖术"]=51514;
SpellIds["灵魂行者的恩赐"]=79206;
SpellIds["根源打击"]=73899;
SpellIds["水上行走"]=546;
SpellIds["星界传送"]=556;
SpellIds["风怒武器(武器灌魔)"]=8232;
SpellIds["视界术"]=6196;
--SpellIds["水下呼吸"]=131;
SpellIds["元素释放"]=73680;
--SpellIds["治疗波"]=331;
SpellIds["先祖之魂"]=2008;
SpellIds["净化灵魂"]=51886;
SpellIds["治疗之涌"]=8004;
SpellIds["治疗链"]=1064;
SpellIds["治疗波"]=77472;
SpellIds["治疗之雨"]=73920

SpellIds["大地之盾"]=974;  
SpellIds["激流"]=61295;  
SpellIds["灵魂链接图腾(空气图腾)"]=98008;  

SpellIds["熔岩猛击"]=60103;  
SpellIds["风暴打击"]=17364;  

AM_GCD_SPELLID=SpellIds["闪电箭"];
------------------

NoSpellTarget[SpellIds["元素的召唤"]] =  true;
NoSpellTarget[SpellIds["先祖的召唤"]] =  true;
NoSpellTarget[SpellIds["火焰新星"]] =  true;
NoSpellTarget[SpellIds["地缚图腾(大地图腾)"]] =  true;
NoSpellTarget[SpellIds["灼热图腾(火焰图腾)"]] =  true;
NoSpellTarget[SpellIds["火元素图腾(火焰图腾)"]] =  true;
NoSpellTarget[SpellIds["熔岩图腾(火焰图腾)"]] =  true;
--NoSpellTarget[SpellIds["石爪图腾"]] =  true;
NoSpellTarget[SpellIds["灵魂的召唤"]] =  true;
--NoSpellTarget[SpellIds["元素抗性图腾"]] =  true;
NoSpellTarget[SpellIds["根基图腾(空气图腾)"]] =  true;
NoSpellTarget[SpellIds["土元素图腾(大地图腾)"]] =  true;
--NoSpellTarget[SpellIds["火舌图腾"]] =  true;
--NoSpellTarget[SpellIds["大地之力图腾"]] =  true;
--NoSpellTarget[SpellIds["石肤图腾"]] =  true;
--NoSpellTarget[SpellIds["空气之怒图腾"]] =  true;
NoSpellTarget[SpellIds["英勇"]] =  true;
NoSpellTarget[SpellIds["幽魂之狼"]] =  true;
NoSpellTarget[SpellIds["闪电之盾"]] =  true;
--NoSpellTarget[SpellIds["风怒图腾"]] =  true;
NoSpellTarget[SpellIds["图腾召回"]] =  true;
NoSpellTarget[SpellIds["战栗图腾(大地图腾)"]] =  true;
NoSpellTarget[SpellIds["水之护盾"]] =  true;
NoSpellTarget[SpellIds["治疗之泉图腾(水之图腾)"]] =  true;
--NoSpellTarget[SpellIds["宁静心智图腾"]] =  true;
--NoSpellTarget[SpellIds["自然迅捷"]] =  true;
--NoSpellTarget[SpellIds["法力之潮图腾"]] =  true;
--NoSpellTarget[SpellIds["法力之泉图腾"]] =  true;
--NoSpellTarget[SpellIds["大地生命武器"]] =  true;
--NoSpellTarget[SpellIds["石化武器"]] =  true;
--NoSpellTarget[SpellIds["火舌武器"]] =  true;
--NoSpellTarget[SpellIds["冰封武器"]] =  true;
NoSpellTarget[SpellIds["雷霆风暴"]] =  true;
NoSpellTarget[SpellIds["元素掌握"]] =  true;
NoSpellTarget[SpellIds["野性狼魂"]] =  true;
NoSpellTarget[SpellIds["萨满之怒"]] =  true; 


----------CTM----

NoSpellTarget[SpellIds["灵魂行者的恩赐"]] =  true; 
NoSpellTarget[SpellIds["星界传送"]] =  true; 
NoSpellTarget[SpellIds["风怒武器(武器灌魔)"]] =  true; 
NoSpellTarget[SpellIds["视界术"]] =  true; 
NoSpellTarget[SpellIds["治疗之雨"]] =  true; 

NoSpellTarget[SpellIds["灵魂链接图腾(空气图腾)"]] =  true; 



BuffName["灵魂行者的恩赐"]=GetSpellInfo(SpellIds["灵魂行者的恩赐"]);
BuffName["水之护盾"]=GetSpellInfo(SpellIds["水之护盾"]);

------
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

local N_71155 = GetSpellInfo(101052); --脱缰雷霆
function amIsMoveSpell(Id,unit,name) --处理移动中能施放的技能
	return true;	
end



function amIsNoSpellTarget(SpellId) --技能是否是有无目标标志

	return NoSpellTarget[SpellId] and true;
end



function amIsRaidSpell(spellId)
	
	return RaidSpell[spellId] and true;
	
end
