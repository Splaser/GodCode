if (GetLocale() == 	"zhCN") then return; end;

local ClassName=AM_CLASS_NAME;


SuperTreatment["Menu"]["SetBuffMenu"] = amMenu("SetBuffMenu");
local DropDownMenu = SuperTreatment["Menu"]["SetBuffMenu"];
local addon = {};
DropDownMenu:SetMenuRequestFunc(addon, "OnMenuRequest");

function addon:FormatTooltipText(text)
	if not text then
		return;
	end
	
	return "|cff00ff00" .. text .. "|r";
end


function addon:SetTbl(v,self)
	
	local tbl,index,value,level,argv,ex,levelex = v[1],v[2],v[3],v[4],v[5],v[6],v[7];
	
	if not argv then
		tbl[index]=value;
	elseif argv == 1 then
		tbl[index]=tonumber(format("%.1f",self));
	end
	
	if ex then
		levelex = levelex or 0;
		local menux = ex.ExternalMenu:GetParent()
		
		local levelx = menux:GetLevel()
		
		local hh = menux:GetHandleEx();
		hh:Refresh(levelx - levelex);
		
	end
		
	DropDownMenu:Refresh(level or 1);
	
end


function addon:OnMenuRequest(level, value, menu, MenuEx,GlobalLevel)
	
	
		
	
	if level == 1 then -- 1級菜單內容
		
			
			
		local Buff = MenuEx.ExternalData[1];
		local dbf = MenuEx.ExternalData[3];
		local buffindex = MenuEx.ExternalData[2];
		local IsNotBuff = dbf["IsNobuff"];
		
		if not dbf.buffindex then
			dbf.buffindex = buffindex;
		end
		
		if dbf.buffindex ~= buffindex then
			Buff.AdvancedSettings=nil;
			dbf.buffindex = buffindex;
		end
		
		
		--local Name,_,Texture=GetSpellInfo(Buff.SpellId);
		
		--menu:AddLine("text",Name,"isTitle",1,"icon",Texture)
		
		--menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
		
		
		
		if IsNotBuff and Buff["IsCd"] ~= "No" and Buff["IsCd"] ~= "Presence" then
			Buff["IsCd"] = "Presence";
		else
			Buff["IsCd"] = Buff["IsCd"] or "Presence";
		end
		
		local str = addon:FormatTooltipText("不判斷")
		
		menu:AddLine("text", "無","isRadio",1,"checked",
		Buff["IsCd"] == "No","func", "SetTbl","arg1", self,"arg2",{Buff,"IsCd","No",level,nil,MenuEx},
		"tooltipText",str,"tooltipTitle","信息");
		
		local str = addon:FormatTooltipText("目標沒這Buff。\n\n|r如：判斷敵方目標身上沒[變形術]那么我就變變變！")
		
		menu:AddLine("text", "不存在","isRadio",1,"checked",
		Buff["IsCd"] == "NotPresence","func", "SetTbl","arg1", self,"arg2",{Buff,"IsCd","NotPresence",level,nil,MenuEx},
		"disabled",IsNotBuff,
		"tooltipText",str,"tooltipTitle","信息");
		
		local str = addon:FormatTooltipText("目標有此Buff。\n\n|r如：判斷隊友目標身上已經有了[變形術]那么我就驅散。")
		menu:AddLine("text", "Buff存在","isRadio",1,"checked",
		Buff["IsCd"] == "Presence","func", "SetTbl","arg1", self,"arg2",{Buff,"IsCd","Presence",level,nil,MenuEx},
		
		"tooltipText",str,"tooltipTitle","信息");
		
		local str = addon:FormatTooltipText("Buff的剩余時間。\n\n|r如：我的[變形術]還有幾秒就要消失了，我趕緊補個[變形術]。\n\n不要通過時間來判斷Buff是否存在那樣影響系統效率，朋友時間就是金錢！")
		menu:AddLine("text", "冷卻時間","isRadio",1,"checked",
		Buff["IsCd"] == "End","func", "SetTbl","arg1", self,"arg2",{Buff,"IsCd","End",level,nil,MenuEx},
		"disabled",IsNotBuff,
		"tooltipText",str,"tooltipTitle","信息");
		
		local str = addon:FormatTooltipText("Buff出現的時間跟剩余時間相反。\n\n|r如：我的目標給我[恐懼]了好幾秒了，我趕緊補個[恐懼]。適合有遞減的技能判斷。\n\n不要通過時間來判斷Buff是否存在那樣影響系統效率，朋友時間就是金錢！")
		menu:AddLine("text", "出現時間","isRadio",1,"checked",
		Buff["IsCd"] == "Start","func", "SetTbl","arg1", self,"arg2",{Buff,"IsCd","Start",level,nil,MenuEx},
		"disabled",IsNotBuff,
		"tooltipText",str,"tooltipTitle","信息");
		
		
	
		
		
			
		
			local disabled = Buff["IsCd"] == "No" or Buff["IsCd"] == "Presence" or Buff["IsCd"] == "NotPresence";
			
			if not Buff["Cd"] then
				Buff["Cd"]={};
				Buff["Cd"][">"]={};
				Buff["Cd"]["<"]={};
			end
			
						
			local MaxValue =999 ;
			local Va = Buff["Cd"][">"]["Value"] or 0;
			local checked = Buff["Cd"][">"]["Checked"]
			local text;
			if disabled then
				text = "時間(>=" .. Va   ..")秒"
			else
				text = "|cffffffff時間(|cffff0000>=" .. Va   .."|cffffffff)秒"
			end
		
		if Buff["IsCd"] == "End" or Buff["IsCd"] == "Start" then
		
			menu:AddLine("line",1,"LineHeight",8);
			
			menu:AddLine("text", text,
			"disabled",disabled,
			"checked",checked,"func", "SetTbl","arg1", self,"arg2", {Buff["Cd"][">"],"Checked",not checked,level},
			"hasSlider", 1,"sliderDecimals",1, "sliderValue", Va ,
			"sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 0.1, "sliderFunc",
			"SetTbl", "sliderArg1", self,"sliderArg2", {Buff["Cd"][">"],"Value",nil,level,1});
			
			--menu:AddLine("line",1,"LineHeight",8);
			
			local MaxValue =999 ;
			local Va = Buff["Cd"]["<"]["Value"] or 0;
			local checked = Buff["Cd"]["<"]["Checked"]
			local text;
			if disabled then
				text = "時間(<=" .. Va   ..")秒"
			else
				text = "|cffffffff時間(|cffff0000<=" .. Va   .."|cffffffff)秒"
			end
			
			menu:AddLine("text", text,
			"disabled",disabled,
			"checked",checked,"func", "SetTbl","arg1", self,"arg2", {Buff["Cd"]["<"],"Checked",not checked,level},
			"hasSlider", 1,"sliderDecimals",1, "sliderValue", Va ,
			"sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 0.1, "sliderFunc",
			"SetTbl", "sliderArg1", self,"sliderArg2", {Buff["Cd"]["<"],"Value",nil,level,1});
			
			
		end
		
		menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
		
		Buff["IsCount"] = Buff["IsCount"] or false;
		
		local str = addon:FormatTooltipText("你懂的...");
		menu:AddLine("text", "無","isRadio",1,"checked",
		not Buff["IsCount"],"func", "SetTbl","arg1", self,"arg2",{Buff,"IsCount",false,level},
		"disabled",Buff["IsCd"] == "No",
		"tooltipText",str,"tooltipTitle","信息");
		
		local str = addon:FormatTooltipText("目標有幾層Buff。\n\n|r如：操！我[深度腐蝕]4層了別治療，再搞就爆了！");
		menu:AddLine("text", "判斷層數","isRadio",1,"checked",
		Buff["IsCount"],"func", "SetTbl","arg1", self,"arg2",{Buff,"IsCount",true,level},
		"disabled",Buff["IsCd"] == "No",
		"tooltipText",str,"tooltipTitle","信息");
		
		
		
		if not Buff["Count"] then
			Buff["Count"]={};
			Buff["Count"][">"]={};
			Buff["Count"]["<"]={};
		end
		
		local disabled = not Buff["IsCount"] or Buff["IsCd"] == "No";
		
		if Buff["IsCount"] then
		
			menu:AddLine("line",1,"LineHeight",8);
			
			local MaxValue =999 ;
			local Va = Buff["Count"][">"]["Value"] or 0;
			local checked = Buff["Count"][">"]["Checked"]
			local text;
			
			if disabled then
				text = "層數(>=" .. Va   ..")"
			else
				text = "|cffffffff層數(|cffff0000>=" .. Va   .."|cffffffff)"
			end
			
			
			menu:AddLine("text", text,
			"checked",checked,"func", "SetTbl","arg1", self,"arg2", {Buff["Count"][">"],"Checked",not checked,level},
			"disabled",disabled,
			"hasSlider", 1,"sliderDecimals",1, "sliderValue", Va ,
			"sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 0.1, "sliderFunc",
			"SetTbl", "sliderArg1", self,"sliderArg2", {Buff["Count"][">"],"Value",nil,level,1});
			
			--menu:AddLine("line",1,"LineHeight",8);
			
			local MaxValue =999 ;
			local Va = Buff["Count"]["<"]["Value"] or 0;
			local checked = Buff["Count"]["<"]["Checked"]
			
			if disabled then
				text = "層數(<=" .. Va   ..")"
			else
				text = "|cffffffff層數(|cffff0000<=" .. Va   .."|cffffffff)"
			end
		
			menu:AddLine("text", text,
			"checked",checked,"func", "SetTbl","arg1", self,"arg2", {Buff["Count"]["<"],"Checked",not checked,level},
			"disabled",disabled,
			"hasSlider", 1,"sliderDecimals",1, "sliderValue", Va ,
			"sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 0.1, "sliderFunc",
			"SetTbl", "sliderArg1", self,"sliderArg2", {Buff["Count"]["<"],"Value",nil,level,1});
		
		end
		
		menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
		
		menu:AddLine("text", "排除的職業" ,"hasArrow", 1,
		"value", {"CustomizeTargetListGetTargetAmminimumFastSetClass" ,Buff,MenuEx},
		"checked",Buff.IsClass,
		"func", "SetTbl","arg1", self,"arg2",
		{Buff,"IsClass",not Buff.IsClass,level,nil,MenuEx}
		);
			
		
		menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
		
		local isAdvancedSettings = Buff.AdvancedSettings or Buff.AdvancedSettings==nil 
		and (Buff["IsSpellIdTexture"]~="IsName" 
		or Buff["IsType"]~= "Auto" 
		or Buff["IsPlayer"]~= "All" 
		or Buff["IsCanceLable"]~= "No"  
		or Buff["IsRaid"]~= "No");
			
		menu:AddLine("text", "高級設定","isTitle",1,
					"ToggleButton",1,"ToggleButtonFun",function()
					Buff.AdvancedSettings=not Buff.AdvancedSettings;
					DropDownMenu:Refresh(level);
					
					end,
					"ToggleState",not isAdvancedSettings
					);
					
		menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
		
				
		
		--print(Buff.AdvancedSettings , isAdvancedSettings)
		
		if isAdvancedSettings then
			
			local disabled = Buff["IsCd"] == "No";
		
			Buff["IsSpellIdTexture"] = Buff["IsSpellIdTexture"] or "IsName";
			local _,Rank = GetSpellInfo(Buff["SpellId"]);
			Rank =  Rank or "";
			
			local str = addon:FormatTooltipText("通過Buff名稱來判斷。\n\n|r注意：這種判斷方式是最快的，如果沒必要千萬不要用其它方法。當你有多個Buff時全部啟動該項速度會非常快，但只要有一個不是那么會慢許多。\n\n朋友時間就是金錢！")
			menu:AddLine("text", "判斷名稱","isRadio",1,"checked",
			Buff["IsSpellIdTexture"]=="IsName","func", "SetTbl","arg1", self,"arg2",
			{Buff,"IsSpellIdTexture","IsName",nil,nil,MenuEx},
			"disabled",disabled,
			"tooltipText",str,"tooltipTitle","信息");
			
			local str = addon:FormatTooltipText("通過Buff名稱來判斷。\n\n|r注意：這種判斷方式是最快的，如果沒必要千萬不要用其它方法。當你有多個Buff時全部啟動該項速度會非常快，但只要有一個不是那么會慢許多。\n\n朋友時間就是金錢！")
			menu:AddLine("text", "判斷名稱+等級(|cffff0000" .. (Buff.Rank or Rank) .. "|r)","isRadio",1,"checked",
			Buff["IsSpellIdTexture"]=="IsNameRank","func", "SetTbl","arg1", self,"arg2",
			{Buff,"IsSpellIdTexture","IsNameRank",nil,nil,MenuEx},
			"disabled",disabled,
			"hasEditBox", 1, "editBoxText", Buff.Rank or Rank ,
			"editBoxFunc", "SetSlider", "editBoxArg1", self,"editBoxArg2",{Buff,"Rank",level},
			"tooltipText",str,"tooltipTitle","信息");
			
			
			
			
			local str = addon:FormatTooltipText("當有同名出現時通過對比Id來判斷。\n\n|r注意：該方法是最沒效率的請慎用。\n\n朋友時間就是金錢！")
			menu:AddLine("text", "判斷Id","isRadio",1,"checked",
			Buff["IsSpellIdTexture"]=="IsSpellId","func", "SetTbl","arg1", self,"arg2",
			{Buff,"IsSpellIdTexture","IsSpellId",nil,nil,MenuEx},
			"disabled",disabled,
			"tooltipText",str,"tooltipTitle","信息");
			
			local str = addon:FormatTooltipText("當有同名出現時通過對比圖標來判斷。\n\n|r注意：該方法是最沒效率的請慎用。\n\n朋友時間就是金錢！")
			menu:AddLine("text", "判斷圖標","isRadio",1,"checked",
			Buff["IsSpellIdTexture"]=="IsTexture","func", "SetTbl","arg1", self,"arg2",
			{Buff,"IsSpellIdTexture","IsTexture",nil,nil,MenuEx},
			"disabled",disabled,
			"tooltipText",str,"tooltipTitle","信息");
			
			
			
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			
			Buff["IsType"] = Buff["IsType"] or "Auto";
			
			local str = addon:FormatTooltipText("自動判斷，搜索完有益的Buff再搜索無益的DeBuff比較浪費時間。\n\n|r注意：如果卡的朋友不要選這項分類是最好的選擇。\n\n朋友時間就是金錢！")
			menu:AddLine("text", "自動判斷","isRadio",1,"checked",
			Buff["IsType"]== "Auto","func", "SetTbl","arg1", self,"arg2",
			{Buff,"IsType","Auto",nil,nil,MenuEx},
			"disabled",disabled,
			"tooltipText",str,"tooltipTitle","信息");
			
			
			local str = addon:FormatTooltipText("只搜索有益的Buff，速度很快。")
			menu:AddLine("text", "有益的Buff","isRadio",1,"checked",
			Buff["IsType"]== "HELPFUL","func", "SetTbl","arg1", self,"arg2",
			{Buff,"IsType","HELPFUL",nil,nil,MenuEx},
			"disabled",disabled,
			"tooltipText",str,"tooltipTitle","信息");
			
			local str = addon:FormatTooltipText("只搜索無益的DeBuff，速度很快。")
			menu:AddLine("text", "無益的DeBuff","isRadio",1,"checked",
			Buff["IsType"]== "HARMFUL","func", "SetTbl","arg1", self,"arg2",
			{Buff,"IsType","HARMFUL",nil,nil,MenuEx},
			"disabled",disabled,
			"tooltipText",str,"tooltipTitle","信息");
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			
			Buff["IsPlayer"] = Buff["IsPlayer"] or "All";
			
			local str = addon:FormatTooltipText("不判斷")
			menu:AddLine("text", "無","isRadio",1,"checked",
			Buff["IsPlayer"]== "All","func", "SetTbl","arg1", self,"arg2",
			{Buff,"IsPlayer","All",nil,nil,MenuEx},
			"disabled",disabled,
			"tooltipText",str,"tooltipTitle","信息");
			
			
			local str = addon:FormatTooltipText("判斷Buff是否屬于自己。\n\n|r注意：不判斷是最好的最快的，沒必要盡量避免使用。\n\n朋友時間就是金錢！")
			menu:AddLine("text", "我的Buff","isRadio",1,"checked",
			Buff["IsPlayer"]== "PLAYER","func", "SetTbl","arg1", self,"arg2",
			{Buff,"IsPlayer","PLAYER",nil,nil,MenuEx},
			"disabled",disabled,
			"tooltipText",str,"tooltipTitle","信息");
			
			local str = addon:FormatTooltipText("判斷Buff是否不屬于自己。\n\n|r注意：不判斷是最好的最快的，沒必要盡量避免使用。\n\n朋友時間就是金錢！")
			menu:AddLine("text", "不是我的Buff","isRadio",1,"checked",
			Buff["IsPlayer"]== "NoPlayer","func", "SetTbl","arg1", self,"arg2",
			{Buff,"IsPlayer","NoPlayer",nil,nil,MenuEx},
			"disabled",disabled,
			"tooltipText",str,"tooltipTitle","信息");
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			Buff["IsCanceLable"] = Buff["IsCanceLable"] or "No";
			
			local str = addon:FormatTooltipText("不判斷")
			menu:AddLine("text", "無","isRadio",1,"checked",
			Buff["IsCanceLable"]== "No","func", "SetTbl","arg1", self,"arg2",
			{Buff,"IsCanceLable","No",nil,nil,MenuEx},
			"disabled",disabled,
			"tooltipText",str,"tooltipTitle","信息");
			
			local str = addon:FormatTooltipText("能正確知道Buff類型可以加快判斷速度。\n\n|r朋友時間就是金錢！")
			menu:AddLine("text", "可以取消的Buff","isRadio",1,"checked",
			Buff["IsCanceLable"]== "CANCELABLE","func", "SetTbl","arg1", self,"arg2",
			{Buff,"IsCanceLable","CANCELABLE",nil,nil,MenuEx},
			"disabled",disabled,
			"tooltipText",str,"tooltipTitle","信息");
			
			local str = addon:FormatTooltipText("能正確知道Buff類型可以加快判斷速度。\n\n|r朋友時間就是金錢！")
			menu:AddLine("text", "不可以取消的Buff","isRadio",1,"checked",
			Buff["IsCanceLable"]== "NOT_CANCELABLE","func", "SetTbl","arg1", self,"arg2",
			{Buff,"IsCanceLable","NOT_CANCELABLE",nil,nil,MenuEx},
			"disabled",disabled,
			"tooltipText",str,"tooltipTitle","信息");
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			
			Buff["IsRaid"] = Buff["IsRaid"] or "No";
			
			local str = addon:FormatTooltipText("不判斷")
			menu:AddLine("text", "無","isRadio",1,"checked",
			Buff["IsRaid"]== "No","func", "SetTbl","arg1", self,"arg2",
			{Buff,"IsRaid","No",nil,nil,MenuEx},
			"disabled",disabled,
			"tooltipText",str,"tooltipTitle","信息");
			
			local str = addon:FormatTooltipText("能正確知道Buff類型可以加快判斷速度。\n\n|r朋友時間就是金錢！")
			menu:AddLine("text", "團隊Buff","isRadio",1,"checked",
			Buff["IsRaid"]== "RAID","func", "SetTbl","arg1", self,"arg2",
			{Buff,"IsRaid","RAID",nil,nil,MenuEx},
			"disabled",disabled,
			"tooltipText",str,"tooltipTitle","信息");
			
			
			
			
			--local isAdvancedSettings = Buff["IsSpellIdTexture"]~="IsName" or Buff["IsType"]~= "Auto" or Buff["IsPlayer"]~= "All" or
			--Buff["IsCanceLable"]~= "No" or Buff["IsRaid"]~= "No";
			--if not isAdvancedSettings then 
			
			--	Buff.AdvancedSettings=false;
			--else
			--	Buff.AdvancedSettings=true;
			--end
			
			
			Buff.AdvancedSettings=true;
			
			
		end
		
	elseif level == 2 then -- 2級菜單內容
		
		if value[1] == "CustomizeTargetListGetTargetAmminimumFastSetClass" then
		
			local Buff = value[2];
			--local MenuEx = value[3];
			
			if not Buff["Class"] then
				Buff["Class"]={};
			end
			
			local Class = Buff["Class"];
			
			--print(MenuEx.ExternalMenu)
			for k, name in pairs(ClassName) do
			
				local color = RAID_CLASS_COLORS[k]
				
				menu:AddLine("text",stGetClassicon(k,13)..name,
				"textR", color.r, "textG", color.g, "textB", color.b,
				"checked",Class[k],
				"func", "SetTbl","arg1", self,"arg2",
				{Class,k,not Class[k],level,nil,value[3]}
				);
				
				menu:AddLine("line",1);
				
			end
			
		end
	end	
	
end


function addon:SetSlider(v,v1)
	
	local tbl = v[1];
	local name = v[2]
	local level = v[3]
	
	
	tbl[name]=v1
	DropDownMenu:Refresh(level);

end