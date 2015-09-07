if GetLocale() ~= "zhTW" then return; end
function amAllClassInf(SpellIds,NoSpellTarget,BuffNames)

	SpellIds["急救"]=45542;
	SpellIds["鍊金術"]=80731;
	SpellIds["藥水專精"]=28675;
	SpellIds["烹飪"]=2550;
	SpellIds["烹飪用火"]=818;
	SpellIds["裁縫"]=75156;
	SpellIds["釣魚"]=7620
	SpellIds["珠寶設計"]=28894;  
	SpellIds["勘探"]=31252;  
	SpellIds["鍛造"]=51300;
	SpellIds["附魔"]=7411;
	SpellIds["分解"]=13262;
	SpellIds["哥布林工程師"]=20222;  
	SpellIds["工程學"]=51306
	SpellIds["地精工程師"]=20219; 
	SpellIds["剝皮"]=74522; 
	SpellIds["轉化專精"]=28672
	SpellIds["考古學"]=88961;  
	SpellIds["勘查"]=80451;
	
	
	SpellIds["生命之血(等級 8)"]=74497;  
	SpellIds["採集草藥"]=74519;

	SpellIds["製皮"]=51302;
	SpellIds["藥劑專精"]=28677;
	SpellIds["行動銀行"]=83958;
	SpellIds["熔煉"]=2656;
	
	--無目標(種族特殊技能內碼對應表)
	SpellIds["石像形態(種族特長)"] = 20594;
	SpellIds["狂暴(種族特長)"] = 26297;
	SpellIds["奧流之術(種族特長)"] = 28730;
	SpellIds["影遁(種族特長)"]=58984;
	SpellIds["那魯的祝福(種族特長)"] = 59545;
	SpellIds["血之烈怒(種族特長))"] = 	20572;
	SpellIds["人人為己(種族特長)"]=59752;
	SpellIds["戰爭踐踏(種族特長)"]=20549;  
	
	SpellIds["雙重形態(種族特長)"]=68996;  
	SpellIds["野性奔跑(種族特長)"]=87840;  
	SpellIds["疾步夜行(種族特長)"]=68992;
	
	SpellIds["攜帶大哥布林(種族特長)"]=69046;  
	SpellIds["火箭彈(種族特長)"]=69041;  
	SpellIds["火箭跳躍(種族特長)"]=69070;
	SpellIds["亡靈意志(種族特長)"]=7744;
	SpellIds["食屍(種族特長)"]=20577; 
	SpellIds["隊伍好了，該上路了"]=83967;
	SpellIds["群體復活"]=83968;
	
	NoSpellTarget[SpellIds["食屍(種族特長)"]] =  true;
	NoSpellTarget[SpellIds["亡靈意志(種族特長)"]] =  true;
	NoSpellTarget[SpellIds["石像形態(種族特長)"]] =  true;
	NoSpellTarget[SpellIds["狂暴(種族特長)"]] =  true;
	NoSpellTarget[SpellIds["奧流之術(種族特長)"]] =  true;
	NoSpellTarget[SpellIds["影遁(種族特長)"]]= true;
	NoSpellTarget[SpellIds["那魯的祝福(種族特長)"]] =  true;
	NoSpellTarget[SpellIds["血之烈怒(種族特長))"]] =  true;
	NoSpellTarget[SpellIds["人人為己(種族特長)"]] =  true;
	NoSpellTarget[SpellIds["戰爭踐踏(種族特長)"]] =  true;
	NoSpellTarget[SpellIds["雙重形態(種族特長)"]] =  true;
	NoSpellTarget[SpellIds["野性奔跑(種族特長)"]] =  true;
	NoSpellTarget[SpellIds["疾步夜行(種族特長)"]] =  true;
	NoSpellTarget[SpellIds["攜帶大哥布林(種族特長)"]] =  true;
	NoSpellTarget[SpellIds["火箭彈(種族特長)"]] =  true;
	NoSpellTarget[SpellIds["火箭跳躍(種族特長)"]] =  true;
	
	
	NoSpellTarget[SpellIds["急救"]] = true;
	NoSpellTarget[SpellIds["鍊金術"]] = true;
	NoSpellTarget[SpellIds["藥水專精"]] = true;
	NoSpellTarget[SpellIds["烹飪"]] = true;
	NoSpellTarget[SpellIds["烹飪用火"]] = true;
	NoSpellTarget[SpellIds["裁縫"]] = true;
	NoSpellTarget[SpellIds["釣魚"]] = true;
	NoSpellTarget[SpellIds["附魔"]] = true;
	NoSpellTarget[SpellIds["分解"]] = true;
	
	NoSpellTarget[SpellIds["地精工程師"]] = true;
	NoSpellTarget[SpellIds["工程學"]] = true;
	NoSpellTarget[SpellIds["地精工程師"]] = true;
	
	NoSpellTarget[SpellIds["剝皮"]] = true;
	NoSpellTarget[SpellIds["轉化專精"]] = true;
	
	NoSpellTarget[SpellIds["考古學"]] = true;
	NoSpellTarget[SpellIds["勘查"]] = true;
	
	
	NoSpellTarget[SpellIds["生命之血(等級 8)"]] = true;
	NoSpellTarget[SpellIds["採集草藥"]] = true;
	NoSpellTarget[SpellIds["製皮"]] = true;
	
	NoSpellTarget[SpellIds["藥劑專精"]] = true;
	NoSpellTarget[SpellIds["行動銀行"]] = true;
	NoSpellTarget[SpellIds["熔煉"]] = true;
	NoSpellTarget[SpellIds["隊伍好了，該上路了"]] = true;
	NoSpellTarget[SpellIds["群體復活"]] = true;
	
	
		
end


local IgnoreSpellIds = {};
IgnoreSpellIds["急救"]=45542;
IgnoreSpellIds["鍊金術"]=80731;
IgnoreSpellIds["藥水專精"]=28675;
IgnoreSpellIds["烹飪"]=2550;
IgnoreSpellIds["烹飪用火"]=818;
IgnoreSpellIds["裁縫"]=75156;
IgnoreSpellIds["釣魚"]=7620
IgnoreSpellIds["珠寶設計"]=28894;  
IgnoreSpellIds["勘探"]=31252;  
IgnoreSpellIds["鍛造"]=51300;
IgnoreSpellIds["附魔"]=7411;
IgnoreSpellIds["分解"]=13262;

IgnoreSpellIds["地精工程師"]=20222;  
IgnoreSpellIds["工程學"]=51306
IgnoreSpellIds["地精工程師"]=20219; 

IgnoreSpellIds["石像形態(種族特長)"] = 20594;
IgnoreSpellIds["狂暴(種族特長)"] = 26297;
IgnoreSpellIds["奧流之術(種族特長)"] = 28730;
IgnoreSpellIds["影遁(種族特長)"]=58984;
IgnoreSpellIds["那魯的祝福(種族特長)"] = 59545;
IgnoreSpellIds["血之烈怒(種族特長))"] = 	20572;
IgnoreSpellIds["人人為己(種族特長)"]=59752;
IgnoreSpellIds["戰爭踐踏(種族特長)"]=20549;  

IgnoreSpellIds["雙重形態(種族特長)"]=68996;  
IgnoreSpellIds["野性奔跑(種族特長)"]=87840;  
IgnoreSpellIds["疾步夜行(種族特長)"]=68992;
	
IgnoreSpellIds["剝皮"]=74522;  


IgnoreSpellIds["攜帶大哥布林(種族特長)"]=69046;  
IgnoreSpellIds["火箭彈(種族特長)"]=69041;  
IgnoreSpellIds["火箭跳躍(種族特長)"]=69070; 
  
IgnoreSpellIds["考古學"]=88961;  
IgnoreSpellIds["勘查"]=80451;

IgnoreSpellIds["轉化專精"]=28672;  
IgnoreSpellIds["生命之血(等級 8)"]=74497;  
IgnoreSpellIds["採集草藥"]=74519;
IgnoreSpellIds["製皮"]=51302;

IgnoreSpellIds["藥劑專精"]=28677;
IgnoreSpellIds["行動銀行"]=83958;
IgnoreSpellIds["熔煉"]=2656;
IgnoreSpellIds["隊伍好了，該上路了"]=83967;
IgnoreSpellIds["群體復活"]=83968;




function amAllClassIgnoreInf(name,inf)
	
	
	
	if IgnoreSpellIds[name] and inf == "ID錯誤"  or IgnoreSpellIds[name] and not inf then
	
		return false;
	else
	
		return true;
	end
		

end

function amTestSpellBook(SpellIds)
	
	local i = 1;
	local tbl={};
	
	while true do
	
		skillType, spellId = GetSpellBookItemInfo(i, "player")
		
		

		if not spellId then
		  do break end
		end
		
		local spellName, spellSubName =GetSpellInfo(spellId);
		
		if spellName then
		
			if not spellSubName then
				spellSubName="";
			end
			
			local s ;
			
			if spellSubName == "" then
				s=spellName;
			else
				s = spellName .. "(" .. spellSubName ..")";
			end
			
			
			if not IsPassiveSpell(i,BOOKTYPE_SPELL) and not SpellIds[s] then
				
				if amAllClassIgnoreInf(spellName) then
				
					table.insert(tbl, spellId);
				end
			end
		end
		
		i = i + 1
   end
   
   return tbl;

end



local N_97128 = GetSpellInfo(97128); --熔火之羽
function amIsMoveSpellAll(Id,unit,name) --處理移動中能施放的技能


	if UnitAura("player", N_97128) then 
		
		return true;
		
	
	end
	
end