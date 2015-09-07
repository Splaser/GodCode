if (GetLocale() ~= 	"zhCN") then return; end;

local ClassName=AM_CLASS_NAME;


SuperTreatment["Menu"]["SetIsSpellMenu"] = amMenu("SetIsSpellMenu");
local DropDownMenu = SuperTreatment["Menu"]["SetIsSpellMenu"];
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
		
	DropDownMenu:Refresh(level);
	
end


function addon:OnMenuRequest(level, value, menu, MenuEx,GlobalLevel)
	
	
	if level == 1 then -- 1级菜单内容	
		
		menu:AddLine("text", "读条技能","isTitle",1);
		menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
		
		local tbl = MenuEx.ExternalData[1];
		if not tbl["NewSpell"] then
			tbl["NewSpell"]={};
		end
		
		if not tbl["NewSpell"]["Spell"] then
			tbl["NewSpell"]["Spell"]={};
		end
		
		local dbf = tbl["NewSpell"];
		
		local SpellTbl = tbl["NewSpell"]["Spell"];
		local disabled = dbf["AllSpell"];
		
		local str = addon:FormatTooltipText("比如你需要打断所有技能而不是指定那个时，那么你把该选项打勾。");
			menu:AddLine("text", "|cffffff00忽略列表,判断任何技能","checked",dbf["AllSpell"],"func", "SetTbl","arg1", self,"arg2",
			{dbf,"AllSpell",not dbf.AllSpell,level},
			"tooltipText",str,"tooltipTitle","说明"
			);
		
		menu:AddLine("line",1);
		
		
		if dbf["NotInterrupt"]==nil then
			dbf["NotInterrupt"] ="All";
		end
		
		local str = addon:FormatTooltipText("不判断技能是否可以打断");
			menu:AddLine("text", "无","isRadio",1,"checked",
			dbf["NotInterrupt"] =="All","func", "SetTbl","arg1", self,"arg2",{dbf,"NotInterrupt","All",level},
			"disabled",not disabled,
			"text_X",20,"checked_X",20,
			"tooltipText",str,"tooltipTitle","信息");
			
			
		local str = addon:FormatTooltipText("判断可以打断的技能");
			menu:AddLine("text", "可以打断的技能","isRadio",1,"checked",
			dbf["NotInterrupt"] =="Yes","func", "SetTbl","arg1", self,"arg2",{dbf,"NotInterrupt","Yes",level},
			"disabled",not disabled,
			"text_X",20,"checked_X",20,
			"tooltipText",str,"tooltipTitle","信息");
		
		
		local str = addon:FormatTooltipText("判断不能打断的技能");
			menu:AddLine("text", "不能打断的技能","isRadio",1,"checked",
			dbf["NotInterrupt"] =="No","func", "SetTbl","arg1", self,"arg2",{dbf,"NotInterrupt","No",level},
			"disabled",not disabled,
			"text_X",20,"checked_X",20,
			"tooltipText",str,"tooltipTitle","信息");
				
			
		menu:AddLine("line",1,"LineHeight",10);	
			
			if not dbf["Cd"] then
				dbf["Cd"]={};
				dbf["Cd"]["Start"]={};
				dbf["Cd"]["Start"]["Value"]=0;
				dbf["Cd"]["Start"]["Checked"]=false;
				dbf["Cd"]["End"]={};
				dbf["Cd"]["End"]["Value"]=0;
				dbf["Cd"]["End"]["Checked"]=false;
			end
			
			local MaxValue =999 ;
			local Va = dbf["Cd"]["Start"]["Value"] or 0;
			local checked = dbf["Cd"]["Start"]["Checked"]
			local text;
			if not disabled then
				text = "开始(>=" .. Va   ..")秒后"
				
			else
				text = "|cffffffff开始(|cffff0000>=" .. Va   .."|cffffffff)秒后"
			end
			
			local str = addon:FormatTooltipText("技能开始施放的读条时间。\n\n|r如：对方法师变形术施放N秒后，对其反制。");
			menu:AddLine("text", text,
			"disabled", not disabled,
			"checked",checked,"func", "SetTbl","arg1", self,"arg2", {dbf["Cd"]["Start"],"Checked",not checked,level},
			"hasSlider", 1,"sliderDecimals",1, "sliderValue", Va ,
			"sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 0.1, "sliderFunc",
			"SetTbl", "sliderArg1", self,"sliderArg2", {dbf["Cd"]["Start"],"Value",nil,level,1},
			"text_X",20,"checked_X",20,
			"tooltipText",str,"tooltipTitle","信息"
			);
			
			
			local MaxValue =999 ;
			local Va = dbf["Cd"]["End"]["Value"] or 0;
			local checked = dbf["Cd"]["End"]["Checked"]
			local text;
			if not disabled then
				text = "还差(<=" .. Va   ..")秒时"
				
			else
				text = "|cffffffff还差(|cffff0000<=" .. Va   .."|cffffffff)秒时"
			end
			
			local str = addon:FormatTooltipText("技能读条的剩余时间。\n\n|r如：对方法师变形术还差N秒完成时，对其反制。");
			menu:AddLine("text", text,
			"disabled",not disabled,
			"checked",checked,"func", "SetTbl","arg1", self,"arg2", {dbf["Cd"]["End"],"Checked",not checked,level},
			"hasSlider", 1,"sliderDecimals",1, "sliderValue", Va ,
			"sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 0.1, "sliderFunc",
			"SetTbl", "sliderArg1", self,"sliderArg2", {dbf["Cd"]["End"],"Value",nil,level,1},
			"text_X",20,"checked_X",20,
			"tooltipText",str,"tooltipTitle","信息"
			);
		
		
		
		menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
		
		
		
		
		local text ;
		if disabled then
			text = "输入添加技能";
		else
			text = "|cffffff00输入添加技能";
		end
					
		local str = addon:FormatTooltipText("请确认新名称不在列表中，同名即|cffffffff 替换。");
		
		menu:AddLine("text", text,"hasEditBox", 1, "editBoxText", self.text, "editBoxFunc",
		"Default_AddBuff", "editBoxArg1", self,"editBoxArg2",
		SpellTbl,"tooltipText",str,"tooltipTitle","说明",
		"disabled",disabled,
		"text_X",-22
		);
		
		menu:AddLine("line",1);
		
		if disabled then
			text = "选择添加技能";
		else
			text = "|cffffff00选择添加技能";
		end
		
		CollectionInf["Buff_Spell"]["Ex"]=SuperTreatmentDBF["CollectionInf"];
		menu:AddLine("text", text,"hasArrow", 1, 
		"OpenMenu",SuperTreatment["Menu"]["UnitBuffListMenu"],
		"OpenMenuValue",{CollectionInf["Buff_Spell"],{SpellTbl,-1},function() DropDownMenu:Refresh(level); end},
		"disabled",disabled,
		"text_X",-22
		);
		
		
		
		
		menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
		
		
		
		
		local GetSpellInfo=GetSpellInfo;
		
		for k,v in pairs(SpellTbl) do
			
			if v["NotInterrupt"] == nil then
				v["NotInterrupt"]= "All";
			end			
			
			if not v["Cd"] then
				v["Cd"]={};
				v["Cd"]["Start"]={};
				v["Cd"]["Start"]["Value"]=0;
				v["Cd"]["Start"]["Checked"]=false;
				v["Cd"]["End"]={};
				v["Cd"]["End"]["Value"]=0;
				v["Cd"]["End"]["Checked"]=false;
				v["Checked"]=true;
			end
			
			if not v["Cd"]["Start"]["Random"] then
				
				v["Cd"]["Start"]["Random"]={};
				v["Cd"]["Start"]["Random"][">"]={};
				v["Cd"]["Start"]["Random"]["<"]={};
				v["Cd"]["Start"]["Random"][">"]["Value"]=0;
				v["Cd"]["Start"]["Random"]["<"]["Value"]=0;
			end
			
			if not v["Cd"]["End"]["Random"] then
				
				v["Cd"]["End"]["Random"]={};
				v["Cd"]["End"]["Random"][">"]={};
				v["Cd"]["End"]["Random"]["<"]={};
				v["Cd"]["End"]["Random"][">"]["Value"]=0;
				v["Cd"]["End"]["Random"]["<"]["Value"]=0;
				
			end
			
			
			
			
			local Name,_,Texture=GetSpellInfo(v.SpellId);
			Name = Name or v.SpellId;
			Texture = Texture or "";
							
			local text,text1,text2,RightText ;
			if disabled then
				text = k .. ". " .. Name;
				if v["Cd"]["Start"]["Checked"] then
					
					if v.Random then
						text1 = ">=" ..v["Cd"]["Start"]["Random"][">"]["Value"] .. "-" ..v["Cd"]["Start"]["Random"]["<"]["Value"];
					else
						text1 = ">=" ..v["Cd"]["Start"]["Value"];
					end
				end
				
				if v["Cd"]["End"]["Checked"] then
					
					if v.Random then
						text2 = "<=" ..v["Cd"]["End"]["Random"][">"]["Value"] .. "-" ..v["Cd"]["End"]["Random"]["<"]["Value"];
					else
						text2 = "<=" ..v["Cd"]["End"]["Value"];
					end
				end
				
				if text1 and text2 then
				
					text = text .. "(" .. text1 .. "," ..text2 ..")";
					
				elseif text1 and not text2 then
				
					text = text .. "(" .. text1 ..")";
					
				elseif not text1 and text2 then
				
					text = text .. "(" .. text2 ..")";
					
				end
			else
				if not v["Checked"] then
					
					text = "|cff104E8B" .. k .. ". |cffff0000" .. Name;
				
				else
					text = "|cff104E8B" .. k .. ". |cffffffff" .. Name;
				end
				
				if v["Cd"]["Start"]["Checked"] then
					if v.Random then
						text1 = "|cffff0000>=" ..v["Cd"]["Start"]["Random"][">"]["Value"] .. "-" ..v["Cd"]["Start"]["Random"]["<"]["Value"];
					else
						text1 = "|cffff0000>=" ..v["Cd"]["Start"]["Value"];
					end
				end
				
				if v["Cd"]["End"]["Checked"] then
					
					if v.Random then
						text2 = "|cffff0000<=" ..v["Cd"]["End"]["Random"][">"]["Value"] .. "-" ..v["Cd"]["End"]["Random"]["<"]["Value"];
					else
						text2 = "|cffff0000<=" ..v["Cd"]["End"]["Value"];
					end
					
				end
				--[[
				if text1 and text2 then
				
					text = text .. "|cffffffff(" .. text1 .. "|r," ..text2 .."|r)";
					
				elseif text1 and not text2 then
				
					text = text .. "|cffffffff(" .. text1 .."|r)";
					
				elseif not text1 and text2 then
				
					text = text .. "|cffffffff(" .. text2 .."|r)";
					
				end
				
				--]]
				
				if text1 and text2 then
				
					RightText = "|cffffffff(" .. text1 .. "|r," ..text2 .."|r)";
					
				elseif text1 and not text2 then
				
					RightText = "|cffffffff(" .. text1 .."|r)";
					
				elseif not text1 and text2 then
				
					RightText =  "|cffffffff(" .. text2 .."|r)";
					
				end
				
			end
			
			
				
			
			
			local str = addon:FormatTooltipText("\nId: |r" ..(v["SpellId"] or "") .. "\n\n" .. "提示：鼠标右键可以在当前位置插入Buff/技能")
			
			
			menu:AddLine("text1", text,"text2", "xx",
			"icon",Texture,"disabled",disabled,
			"tooltipText",str,"tooltipTitle",Name,
			"CloseButtonFunc","Del_Tbl_Index","CloseButtonArg1",self,
			"CloseButtonArg2",{SpellTbl,k,level},
			"OpenRightMenu",SuperTreatment["Menu"]["UnitBuffListMenu"],
			"OpenRightMenuValue",
			{CollectionInf["Buff_Spell"],{SpellTbl,k},function() DropDownMenu:Refresh(level); end},
			"hasArrow", 1,"value", {"SetSpell",v,MenuEx},
			"Spell",v.SpellId,
			"RightText",RightText
			);
		
			
		end
		
	
	
	
		
	elseif level == 2 then -- 2级菜单内容
		
		if value[1] == "SetSpell" then
		
			local Spell = value[2];
			local MenuEx = value[3];
			
			local str = addon:FormatTooltipText("启用对该技能的判断");
			menu:AddLine("text", "启用","checked",
			Spell["Checked"],"func", "SetTbl","arg1", self,"arg2",{Spell,"Checked",not Spell["Checked"],level-1},
			"tooltipText",str,"tooltipTitle","信息");
			
			menu:AddLine("line",1,"LineHeight",10);	
			
					
			
			local str = addon:FormatTooltipText("不判断技能是否可以打断");
			menu:AddLine("text", "无","isRadio",1,"checked",
			Spell["NotInterrupt"] =="All","func", "SetTbl","arg1", self,"arg2",{Spell,"NotInterrupt","All",level-1},
			
			"tooltipText",str,"tooltipTitle","信息");
			
			local str = addon:FormatTooltipText("判断可以打断的技能");
			menu:AddLine("text", "可以打断的技能","isRadio",1,"checked",
			Spell["NotInterrupt"] =="Yes","func", "SetTbl","arg1", self,"arg2",{Spell,"NotInterrupt","Yes",level-1},
			
			"tooltipText",str,"tooltipTitle","信息");
			
			local str = addon:FormatTooltipText("判断不能打断的技能");
			menu:AddLine("text", "不能打断的技能","isRadio",1,"checked",
			Spell["NotInterrupt"] =="No","func", "SetTbl","arg1", self,"arg2",{Spell,"NotInterrupt","No",level-1},
			
			"tooltipText",str,"tooltipTitle","信息");
		
		
			menu:AddLine("line",1,"LineHeight",10);	
			
			if not Spell["Cd"] then
				Spell["Cd"]={};
				Spell["Cd"]["Start"]={};
				Spell["Cd"]["Start"]["Value"]=0;
				Spell["Cd"]["Start"]["Checked"]=false;
				Spell["Cd"]["End"]={};
				Spell["Cd"]["End"]["Value"]=0;
				Spell["Cd"]["End"]["Checked"]=false;
			end
			
		
			
			menu:AddLine("text", "随机",
			"checked",Spell.Random,"func", "SetTbl","arg1", self,"arg2",
			{Spell,"Random",not Spell.Random,level-1},
			"tooltipText",str,"tooltipTitle","信息"
			);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			if Spell.Random then
				
				if not Spell["Cd"]["Start"]["Random"] then
				
					Spell["Cd"]["Start"]["Random"]={};
					Spell["Cd"]["Start"]["Random"][">"]={};
					Spell["Cd"]["Start"]["Random"]["<"]={};
					Spell["Cd"]["Start"]["Random"][">"]["Value"]=0;
					Spell["Cd"]["Start"]["Random"]["<"]["Value"]=0;
				end
				
				if not Spell["Cd"]["End"]["Random"] then
				
					Spell["Cd"]["End"]["Random"]={};
					Spell["Cd"]["End"]["Random"][">"]={};
					Spell["Cd"]["End"]["Random"]["<"]={};
					Spell["Cd"]["End"]["Random"][">"]["Value"]=0;
					Spell["Cd"]["End"]["Random"]["<"]["Value"]=0;
					
				end
			
			end
			
			if Spell.Random then
			
				local MaxValue =999 ;
				
				local checked = Spell["Cd"]["Start"]["Checked"]
				
				local str = addon:FormatTooltipText("技能开始施放的读条时间。\n\n|r如：对方法师变形术施放N秒后，对其反制。");
				menu:AddLine("text", "开始",
				"checked",checked,"func", "SetTbl","arg1", self,"arg2", {Spell["Cd"]["Start"],"Checked",not checked,level-1},
				"text_X",20,"checked_X",20
				);
				
				local Va = Spell["Cd"]["Start"]["Random"][">"]["Value"] or 0;
				local text = "|cffffffff时间(|cffff0000>=" .. Va   .."|cffffffff)秒"
				local str = addon:FormatTooltipText("随机最小值。。");
				menu:AddLine("text", text,
				"hasSlider", 1,"sliderDecimals",1, "sliderValue", Va ,
				"sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 0.1, "sliderFunc",
				"SetTbl", "sliderArg1", self,"sliderArg2", {Spell["Cd"]["Start"]["Random"][">"],"Value",nil,level-1,1},
				"tooltipText",str,"tooltipTitle","信息",
				"text_X",20
				);
				
				local Va = Spell["Cd"]["Start"]["Random"]["<"]["Value"] or 0;
				local text = "|cffffffff时间(|cffff0000<=" .. Va   .."|cffffffff)秒"
				local str = addon:FormatTooltipText("随机最大值。");
				menu:AddLine("text", text,
				"hasSlider", 1,"sliderDecimals",1, "sliderValue", Va ,
				"sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 0.1, "sliderFunc",
				"SetTbl", "sliderArg1", self,"sliderArg2", {Spell["Cd"]["Start"]["Random"]["<"],"Value",nil,level-1,1},
				"tooltipText",str,"tooltipTitle","信息",
				"text_X",20
				);
				
				menu:AddLine("line",1);	
				
				local MaxValue =999 ;
				
				local checked = Spell["Cd"]["End"]["Checked"]
				
				local str = addon:FormatTooltipText("技能开始施放的读条时间。\n\n|r如：对方法师变形术施放N秒后，对其反制。");
				menu:AddLine("text", "还差",
				"checked",checked,"func", "SetTbl","arg1", self,"arg2", {Spell["Cd"]["End"],"Checked",not checked,level-1},
				"text_X",20,"checked_X",20
				);
				
				local Va = Spell["Cd"]["End"]["Random"][">"]["Value"] or 0;
				local text = "|cffffffff时间(|cffff0000>=" .. Va   .."|cffffffff)秒"
				local str = addon:FormatTooltipText("随机最小值。。");
				menu:AddLine("text", text,
				"hasSlider", 1,"sliderDecimals",1, "sliderValue", Va ,
				"sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 0.1, "sliderFunc",
				"SetTbl", "sliderArg1", self,"sliderArg2", {Spell["Cd"]["End"]["Random"][">"],"Value",nil,level-1,1},
				"tooltipText",str,"tooltipTitle","信息",
				"text_X",20
				);
				
				local Va = Spell["Cd"]["End"]["Random"]["<"]["Value"] or 0;
				local text = "|cffffffff时间(|cffff0000<=" .. Va   .."|cffffffff)秒"
				local str = addon:FormatTooltipText("随机最大值。");
				menu:AddLine("text", text,
				"hasSlider", 1,"sliderDecimals",1, "sliderValue", Va ,
				"sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 0.1, "sliderFunc",
				"SetTbl", "sliderArg1", self,"sliderArg2", {Spell["Cd"]["End"]["Random"]["<"],"Value",nil,level-1,1},
				"tooltipText",str,"tooltipTitle","信息",
				"text_X",20
				);
			
			else
			
				local MaxValue =999 ;
				local Va = Spell["Cd"]["Start"]["Value"] or 0;
				local checked = Spell["Cd"]["Start"]["Checked"]
				local text;
				text = "|cffffffff开始(|cffff0000>=" .. Va   .."|cffffffff)秒"
				
				
				local str = addon:FormatTooltipText("技能开始施放的读条时间。\n\n|r如：对方法师变形术施放N秒后，对其反制。");
				menu:AddLine("text", text,
				
				"checked",checked,"func", "SetTbl","arg1", self,"arg2", {Spell["Cd"]["Start"],"Checked",not checked,level-1},
				"hasSlider", 1,"sliderDecimals",1, "sliderValue", Va ,
				"sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 0.1, "sliderFunc",
				"SetTbl", "sliderArg1", self,"sliderArg2", {Spell["Cd"]["Start"],"Value",nil,level-1,1},
				"tooltipText",str,"tooltipTitle","信息",
				"text_X",20,"checked_X",20
				);
			
			
				local MaxValue =999 ;
				local Va = Spell["Cd"]["End"]["Value"] or 0;
				local checked = Spell["Cd"]["End"]["Checked"]
				local text;
				
					text = "|cffffffff还差(|cffff0000<=" .. Va   .."|cffffffff)秒"
				
				
				local str = addon:FormatTooltipText("技能读条的剩余时间。\n\n|r如：对方法师变形术还差N秒完成时，对其反制。");
				menu:AddLine("text", text,
				
				"checked",checked,"func", "SetTbl","arg1", self,"arg2", {Spell["Cd"]["End"],"Checked",not checked,level-1},
				"hasSlider", 1,"sliderDecimals",1, "sliderValue", Va ,
				"sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 0.1, "sliderFunc",
				"SetTbl", "sliderArg1", self,"sliderArg2", {Spell["Cd"]["End"],"Value",nil,level-1,1},
				"tooltipText",str,"tooltipTitle","信息",
				"text_X",20,"checked_X",20
				);
		
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

function addon:Default_AddBuff(Value,Text)
	
	
	local Default_AddBuff = SuperTreatment["Menu"]["Main"]["DropDownMenu"].menuRequestObject.Default_AddBuff;
	
	Default_AddBuff(self,Value,Text);
	DropDownMenu:Refresh(1);
	
end

function addon:Del_Tbl_Index(v1,v2)
	
	table.remove(v1[1], v1[2]) 
	
	local Level = DropDownMenu:GetGlobalLevel(v1[3]);
	DropDownMenu:GlobaRefresh(Level)
	DropDownMenu:GlobaClose(false,v1[3],1);
end