if (GetLocale() ~= 	"zhCN") then return; end;

local ClassName=AM_CLASS_NAME;

SuperTreatment["Menu"]["RangeCheckAngleMenu"] = amMenu("RangeCheckAngleMenu");
local DropDownMenu = SuperTreatment["Menu"]["RangeCheckAngleMenu"];
local addon = {}
DropDownMenu:SetMenuRequestFunc(addon, "OnMenuRequest");

function addon:AddTarget(v,v1)
	
	local tbl = v[1];
	local name = v[2];
	local level = v[3];
	local GlobalLevel = v[4];
	
	tbl[v1]=name;
	DropDownMenu:Refresh(level or 1);
end

function addon:SetSlider(v,v1)
	
	local tbl = v[1];
	local name = v[2];
	local level = v[3];
	local GlobalLevel = v[4];

	tbl[name]=v1
	
	if not GlobalLevel then
		DropDownMenu:Refresh(level or 1);
		
	else
				
		DropDownMenu:GlobaRefresh(GlobalLevel)
	end

end

function addon:SetTbl(v,self)
	
	local tbl,index,value,level,argv,ex,levelex = v[1],v[2],v[3],v[4],v[5],v[6],v[7];
	
	if not argv then
		tbl[index]=value;
	elseif argv == 1 then
		tbl[index]=tonumber(format("%.1f",self));
	end
	
	if ex or levelex then
	
		if ex then
			
			
			
			levelex = levelex or 0;
			local menux = ex.ExternalMenu:GetParent()
			local levelx = menux:GetLevel()
			
			local hh = menux:GetHandleEx();
			hh:Refresh(levelx - levelex);
			
		elseif levelex then
							
			DropDownMenu:GlobaRefresh(levelex)
				
			
		end
	
	else
	
		DropDownMenu:Refresh(level or 1);
	end
	
end


function addon:FormatTooltipText(text)
	if not text then
		return;
	end
	
	return "|cff00ff00" .. text .. "|r";
end

local function CreateTbl(TBL)
	
	if TBL["PlayerRangeCheckAngle"] and not TBL["PlayerRangeCheckAngle"]["ExcludedTarget"] then
		
		 TBL["PlayerRangeCheckAngle"]["ExcludedTarget"]={};
		 TBL["PlayerRangeCheckAngle"]["ExcludedTarget"]["checked"]=false;
		 
		 TBL["PlayerRangeCheckAngle"]["ExcludedTarget"]["Target"]={};
		 TBL["PlayerRangeCheckAngle"]["ExcludedTarget"]["Group"]={};
	end
	
	if TBL["PlayerRangeCheckAngle"] and TBL["PlayerRangeCheckAngle"]["Min_Max"] then
	
		return;
	end
	
	TBL["PlayerRangeCheckAngle"]={};
	TBL["PlayerRangeCheckAngle"]["checked"]=false;
	TBL["PlayerRangeCheckAngle"]["Count"]={};
	
	TBL["PlayerRangeCheckAngle"]["Count"]["<"]={};
	TBL["PlayerRangeCheckAngle"]["Count"]["<"]["Value"]=0;
	TBL["PlayerRangeCheckAngle"]["Count"]["<"]["checked"]=true;
	TBL["PlayerRangeCheckAngle"]["Count"][">"]={};
	TBL["PlayerRangeCheckAngle"]["Count"][">"]["Value"]=0;
	TBL["PlayerRangeCheckAngle"]["Count"][">"]["checked"]=true;

	TBL["PlayerRangeCheckAngle"]["Range"]={};
	
	TBL["PlayerRangeCheckAngle"]["Range"]["<"]={};
	TBL["PlayerRangeCheckAngle"]["Range"]["<"]["Value"]=0;
	TBL["PlayerRangeCheckAngle"]["Range"]["<"]["checked"]=true;
	TBL["PlayerRangeCheckAngle"]["Range"][">"]={};
	TBL["PlayerRangeCheckAngle"]["Range"][">"]["Value"]=0;
	TBL["PlayerRangeCheckAngle"]["Range"][">"]["checked"]=true;
	
	TBL["PlayerRangeCheckAngle"]["Health"]={};

	TBL["PlayerRangeCheckAngle"]["Health"]["<"]={};
	TBL["PlayerRangeCheckAngle"]["Health"]["<"]["Value"]=0;
	TBL["PlayerRangeCheckAngle"]["Health"]["<"]["checked"]=false;
	TBL["PlayerRangeCheckAngle"]["Health"][">"]={};
	TBL["PlayerRangeCheckAngle"]["Health"][">"]["Value"]=0;
	TBL["PlayerRangeCheckAngle"]["Health"][">"]["checked"]=false;
	TBL["PlayerRangeCheckAngle"]["LackHealthChecked"]=false;
	TBL["PlayerRangeCheckAngle"]["HealthPercentageChecked"]=false;
	--[[
	TBL["PlayerRangeCheckAngle"]["Buff"]={};
	TBL["PlayerRangeCheckAngle"]["Buff"]["checked"]=false;
	TBL["PlayerRangeCheckAngle"]["Buff"]["name"]={};
	TBL["PlayerRangeCheckAngle"]["Buff"]["<"]={};
	TBL["PlayerRangeCheckAngle"]["Buff"]["<"]["Value"]=0;
	TBL["PlayerRangeCheckAngle"]["Buff"]["<"]["checked"]=false;
	TBL["PlayerRangeCheckAngle"]["Buff"][">"]={};
	TBL["PlayerRangeCheckAngle"]["Buff"][">"]["Value"]=0;
	TBL["PlayerRangeCheckAngle"]["Buff"][">"]["checked"]=false;
	--]]
	
	TBL["PlayerRangeCheckAngle"]["NewBuff"]={};
	TBL["PlayerRangeCheckAngle"]["NewBuff"]["checked"]=false;
	TBL["PlayerRangeCheckAngle"]["NewBuff"]["buffs"]={};
	
	TBL["PlayerRangeCheckAngle"]["AngleValue"]=90;
	TBL["PlayerRangeCheckAngle"]["AngleChecked"]=false;
	TBL["PlayerRangeCheckAngle"]["TargetChecked"]=false;
	TBL["PlayerRangeCheckAngle"]["ContainChecked"]=false;
	
	TBL["PlayerRangeCheckAngle"]["ExcludedTarget"]={};
	TBL["PlayerRangeCheckAngle"]["ExcludedTarget"]["checked"]=false;
	TBL["PlayerRangeCheckAngle"]["ExcludedTarget"]["Target"]={};
	TBL["PlayerRangeCheckAngle"]["ExcludedTarget"]["Group"]={};
		 
	TBL["PlayerRangeCheckAngle"]["ExcludedClass"]={};
	TBL["PlayerRangeCheckAngle"]["ExcludedClass"]["checked"]=false;
	TBL["PlayerRangeCheckAngle"]["ExcludedClass"]["Class"]={};
	
	TBL["PlayerRangeCheckAngle"]["Min_Max"]={};
	TBL["PlayerRangeCheckAngle"]["Min_Max"]["Type"]="Minimum_Blood_Percentage";
	
	TBL["PlayerRangeCheckAngle"]["Min_Max"][">"]={};
	TBL["PlayerRangeCheckAngle"]["Min_Max"]["<"]={};
	
	TBL["PlayerRangeCheckAngle"]["Min_Max"]["<"]["Value"]=0;
	TBL["PlayerRangeCheckAngle"]["Min_Max"][">"]["Value"]=0;
	
	TBL["PlayerRangeCheckAngle"]["Min_Max"]["<"]["checked"]=true;
	TBL["PlayerRangeCheckAngle"]["Min_Max"][">"]["checked"]=true;
	
	TBL["PlayerRangeCheckAngle"]["UnitType"]="partyraid";
	
end

function addon:OnMenuRequest(level, value, menu, MenuEx,GlobalLevel)
	
	
	
	if level == 1 then -- 1级菜单内容
		
		
		local ex = MenuEx.ExternalData;
		local TBL = ex[1];
		local Target = ex[2];
		local Mtype = ex[3]; --Conditions
		
		CreateTbl(TBL);
		local dbf = TBL["PlayerRangeCheckAngle"];
		
		if TBL["unit"]~= "player" then
			dbf["AngleChecked"]=false;
		end
		if Mtype == "Conditions" then
			menu:AddLine("text","判断范围/视野角度内队友信息","isTitle",1);
		else
			menu:AddLine("text","范围内(团/队)友信息","isTitle",1);
		end
		
		menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
		
		if Mtype ~= "Conditions" then	
			local str;
			
			str =addon:FormatTooltipText("判断本小队队员。");
			dbf.UnitType = dbf.UnitType or "partyraid";
			
			menu:AddLine("text", "小队" ,"isRadio", 1,
			"checked",dbf.UnitType=="party",
			"func", "SetTbl","arg1", self,"arg2", 
			{dbf,"UnitType","party",level},
			"tooltipText",str,"tooltipTitle","信息"
			);
			
			str =addon:FormatTooltipText("判断本团队队员。");
			menu:AddLine("text", "团队" ,"isRadio", 1,
			"checked",dbf.UnitType=="raid",
			"func", "SetTbl","arg1", self,"arg2", 
			{dbf,"UnitType","raid",level},
			"tooltipText",str,"tooltipTitle","信息"
			);
			
			str =addon:FormatTooltipText("如果在团队那么判断团队队员，否则判断小队队员。");
			menu:AddLine("text", "小队/团队" ,"isRadio", 1,
			"checked",dbf.UnitType=="partyraid",
			"func", "SetTbl","arg1", self,"arg2", 
			{dbf,"UnitType","partyraid",level},
			"tooltipText",str,"tooltipTitle","信息"
			);
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
		end	
		
		if Mtype ~= "Conditions" then
		
			
			
			local tbl = dbf["Min_Max"];
			
			
			
			menu:AddLine("text", "最小血量(百分比)" ,"isRadio",1,
			"checked",tbl["Type"]=="Minimum_Blood_Percentage","func", "SetTbl","arg1", self,"arg2", 
			{tbl,"Type","Minimum_Blood_Percentage" ,level}
			);
				--[[
			menu:AddLine("text", "最小血量" ,"isRadio",1,
			"checked",tbl["Type"]=="Minimum_Blood","func", "SetTbl","arg1", self,"arg2", 
			{tbl,"Type","Minimum_Blood" ,level}
			);
		
			menu:AddLine("text", "最小缺血量(百分比)" ,"isRadio",1,
			"checked",tbl["Type"]=="Minimum_LackBlood_Percentage","func", "SetTbl","arg1", self,"arg2", 
			{tbl,"Type","Minimum_LackBlood_Percentage" ,level}
			);
			
			menu:AddLine("text", "最小缺血量" ,"isRadio",1,
			"checked",tbl["Type"]=="Minimum_LackBlood","func", "SetTbl","arg1", self,"arg2", 
			{tbl,"Type","Minimum_LackBlood" ,level}
			);
			--]]
			
			--menu:AddLine("line",1,"LineHeight",8);
			--[[
			menu:AddLine("text", "最大血量(百分比)" ,"isRadio",1,
			"checked",tbl["Type"]=="Maximum_Blood_Percentage","func", "SetTbl","arg1", self,"arg2", 
			{tbl,"Type","Maximum_Blood_Percentage" ,level}
			);
			
			menu:AddLine("text", "最大血量" ,"isRadio",1,
			"checked",tbl["Type"]=="Maximum_Blood","func", "SetTbl","arg1", self,"arg2", 
			{tbl,"Type","Maximum_Blood" ,level}
			);
			
			menu:AddLine("text", "最大缺血量(百分比)" ,"isRadio",1,
			"checked",tbl["Type"]=="Maximum_LackBlood_Percentage","func", "SetTbl","arg1", self,"arg2", 
			{tbl,"Type","Maximum_LackBlood_Percentage" ,level}
			);
			--]]
			menu:AddLine("text", "最大缺血量" ,"isRadio",1,
			"checked",tbl["Type"]=="Maximum_LackBlood","func", "SetTbl","arg1", self,"arg2", 
			{tbl,"Type","Maximum_LackBlood" ,level}
			);
			
			
			local MaxValue;
			
			if tbl["Type"]=="Minimum_Blood_Percentage" or
			tbl["Type"]=="Minimum_LackBlood_Percentage" or
			tbl["Type"]=="Maximum_Blood_Percentage" or
			tbl["Type"]=="Maximum_LackBlood_Percentage" then
			
				MaxValue=100;
				
				if tbl["<"]["Value"] >100 then
					tbl["<"]["Value"]=100;
				end
				
				if tbl[">"]["Value"] >100 then
					tbl[">"]["Value"]=100;
				end
				
			else
				
				MaxValue=10000000;
			
			end
			
			menu:AddLine("line",1,"LineHeight",8);
			
			menu:AddLine("text", "血量(|cffff0000<=" .. tbl["<"]["Value"]  .."|cffffffff)" , 
			"checked",tbl["<"]["checked"],"func", "SetTbl","arg1", self,"arg2", {tbl["<"],"checked",not tbl["<"]["checked"] or not tbl[">"]["checked"],level},
			"hasSlider", 1, "sliderValue",  tbl["<"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			"SetTbl", "sliderArg1", self,"sliderArg2", {tbl["<"],"Value",nil,level,1}
			);
			
			
			menu:AddLine("text", "血量(|cffff0000>=" .. tbl[">"]["Value"]  .."|cffffffff)" ,
			"checked",tbl[">"]["checked"],"func", "SetTbl","arg1", self,"arg2", {tbl[">"],"checked",not tbl[">"]["checked"] or not tbl["<"]["checked"],level},
			"hasSlider", 1, "sliderValue",  tbl[">"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			"SetTbl", "sliderArg1", self,"sliderArg2", {tbl[">"],"Value",nil,level,1}
			);
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
		
		end
		
			
		if Mtype == "Conditions" then
		
			local Color;
			if TBL["TargetSubgroup"] == -2 then
				Color = "|cff00ff00";
			else
				Color = "|cff00ffff";
			end
					
			local text,disabled;
			
			if not dbf["AngleChecked"] then
				text = "把(" .. Color .. Target .. "|r)包括在判断之内"
				disabled = false;
			else
				text = "把(" .. Target .. "|r)包括在判断之内"
				disabled = true;
			end
			
			local str =addon:FormatTooltipText("把参考目标也包含在各种统计判断之内。|r\n\n当选择“视野角度”时参考目标不包含在各种统计判断之内。");
			menu:AddLine("text", text,
			"checked",dbf.ContainChecked,
			"func", "SetTbl","arg1", self,"arg2", {dbf,"ContainChecked",not dbf.ContainChecked,level},
			"tooltipText",str,"tooltipTitle","信息","disabled",disabled
			);
			
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
		
		end
		
		local tbl =dbf["Range"];
		local MaxValue=100;
		
		menu:AddLine("text", "|cffffffff距离(|cffff0000<=" .. tbl ["<"]["Value"]  .."|cffffffff)" , 
		"checked",tbl ["<"]["checked"],
		"func", "SetTbl","arg1", self,"arg2", {tbl ["<"],"checked",not tbl ["<"]["checked"] or not tbl[">"]["checked"],level},
		
		"hasSlider", 1, "sliderValue",  tbl ["<"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
		"SetTbl", "sliderArg1", self,"sliderArg2", {tbl ["<"],"Value",nil,level,1}
		);
		
		
		menu:AddLine("text", "|cffffffff距离(|cffff0000>=" .. tbl [">"]["Value"]  .."|cffffffff)" ,
		"checked",tbl [">"]["checked"],
		"func", "SetTbl","arg1", self,"arg2", {tbl [">"],"checked",not tbl[">"]["checked"] or not tbl["<"]["checked"],level},
		"hasSlider", 1, "sliderValue",  tbl [">"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
		"SetTbl", "sliderArg1", self,"sliderArg2", {tbl [">"],"Value",nil,level,1}
		);
		
		
		menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
		
		if Mtype == "Conditions" then
		
		local tbl = dbf;
				
		local MaxValue=360;
		local str = addon:FormatTooltipText("只能判断“自己”的视野角度，所以请把目标设定为“自己”。|r\n\n在该模式下会把“自己”排除在各种判断之外。");
		
		if TBL["unit"]== "player" and not tbl["ContainChecked"] then
		
			menu:AddLine("text", "视野角度(|cffff0000>=" .. tbl["AngleValue"]  .."°|cffffffff)" ,
			"checked",tbl["AngleChecked"],"func", "SetTbl","arg1", self,"arg2", {tbl,"AngleChecked",not tbl["AngleChecked"],level},
			"hasSlider", 1, "sliderValue",tbl["AngleValue"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			"SetTbl", "sliderArg1", self,"sliderArg2", {tbl,"AngleValue",nil,level,1},
			"tooltipText",str,"tooltipTitle","信息"
			);
			
							
		else
			
			menu:AddLine("text", "视野角度(>=" .. tbl["AngleValue"]  .."°)","disabled",1,
			"tooltipText",str,"tooltipTitle","信息","checked",nil
			);
		
		end
		
		
		
		
		menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
		end
		
		dbf["ExcludedTarget"]["TargetCount"] =0;
		
		for i, data in pairs(dbf["ExcludedTarget"]["Target"]) do
			dbf["ExcludedTarget"]["TargetCount"] = dbf["ExcludedTarget"]["TargetCount"]+1
		end
		
		dbf["ExcludedTarget"]["GroupCount"] =0;
		
		for i, data in pairs(dbf["ExcludedTarget"]["Group"]) do
			dbf["ExcludedTarget"]["GroupCount"] = dbf["ExcludedTarget"]["GroupCount"]+1
		end
		
		dbf["ExcludedClass"]["ClassCount"] =0;
		
		for i, data in pairs(dbf["ExcludedClass"]["Class"]) do
			dbf["ExcludedClass"]["ClassCount"] = dbf["ExcludedClass"]["ClassCount"]+1
		end
		
		
		menu:AddLine("text", "排除自己",
		
		"checked",dbf.ExcludedPlayerChecked,
		"func", "SetTbl","arg1", self,"arg2",{dbf,"ExcludedPlayerChecked",not dbf.ExcludedPlayerChecked,level}
		);
		
		menu:AddLine("text", "排除目标",
		
		"checked",dbf.ExcludedTarget.checked,
		"func", "SetTbl","arg1", self,"arg2",{dbf.ExcludedTarget,"checked",not dbf.ExcludedTarget.checked,level},
		"hasArrow", 1, "value",{"ExcludedTarget",dbf}
		);
		--menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
		
				
		menu:AddLine("text", "排除职业",
		
		"checked",dbf.ExcludedClass.checked,
		"func", "SetTbl","arg1", self,"arg2",{dbf.ExcludedClass,"checked",not dbf.ExcludedClass.checked,level},
		"hasArrow", 1, "value",{"ExcludedClass",dbf}
		);
		
		--
		
		
		if Mtype == "Conditions" then
		menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
		menu:AddLine("text", "缺血量判断",
		"checked",tbl["LackHealthChecked"],"func", "SetTbl","arg1", self,"arg2", {tbl,"LackHealthChecked",not tbl["LackHealthChecked"],level}
		);
		
		
		menu:AddLine("text", "血量(|cffff0000%|cffffffff)显示",
		
		"checked",tbl["HealthPercentageChecked"],"func", "SetTbl","arg1", self,"arg2", {tbl,"HealthPercentageChecked",not tbl["HealthPercentageChecked"],level}
		);
		menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
		
		
		
		
		
		local MaxValue;
		
		if tbl["HealthPercentageChecked"] then
			MaxValue=100;
		else
			MaxValue=90000000;
		end
		
		
		local tbl = dbf["Health"];
		
		
		menu:AddLine("text", "|cffffffff血量(|cffff0000<=" .. tbl["<"]["Value"]  .."|cffffffff)" , "hasArrow", 1, "value", TC,
	
		"checked",tbl["<"]["checked"],"func", "SetTbl","arg1", self,"arg2", {tbl["<"],"checked",not tbl["<"]["checked"],level},
		
		"hasSlider", 1, "sliderValue",  tbl["<"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
		"SetTbl" , "sliderArg1", self,"sliderArg2", {tbl ["<"],"Value",nil,level,1}
		);
		
		
		
		--local TC = V[1] .. "BloodH_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
		menu:AddLine("text", "|cffffffff血量(|cffff0000>=" .. tbl[">"]["Value"]  .."|cffffffff)" , "hasArrow", 1, "value", TC,
		"checked",tbl[">"]["checked"],"func", "SetTbl","arg1", self,"arg2", {tbl [">"],"checked",not tbl [">"]["checked"],level},
		"hasSlider", 1, "sliderValue",tbl[">"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
		"SetTbl" , "sliderArg1", self,"sliderArg2", {tbl[">"],"Value",nil,level,1}
		);
		
		menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
		
		end
		
		--local TC = V[1] .. "PlayerRangeCheckAngleBuff_" .. V[2] .. "_" ..V[3] .. "_" ..V[4];
		menu:AddLine("text", "判断Buff",
		
		"checked",dbf.NewBuff.checked,
		"func", "SetTbl","arg1", self,"arg2",{dbf.NewBuff,"checked",not dbf.NewBuff.checked,level},
		"hasArrow", 1, "value",{"PlayerRangeCheckAngleBuff",dbf}
		);
		
		
		menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
		--menu:AddLine("text","|cff00ff006. |r目标:","isTitle",1)
		
		
		
		local tbl = dbf["Count"];
		
		
		local MaxValue=100;
		
		menu:AddLine("text", "目标数量(|cffff0000<=" .. tbl["<"]["Value"]  .."|cffffffff)" , 
		"checked",tbl["<"]["checked"],"func", "SetTbl","arg1", self,"arg2", {tbl["<"],"checked",not tbl["<"]["checked"] or not tbl[">"]["checked"],level},
		"hasSlider", 1, "sliderValue",  tbl["<"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
		"SetTbl", "sliderArg1", self,"sliderArg2", {tbl["<"],"Value",nil,level,1}
		);
		
		
		menu:AddLine("text", "目标数量(|cffff0000>=" .. tbl[">"]["Value"]  .."|cffffffff)" ,
		"checked",tbl[">"]["checked"],"func", "SetTbl","arg1", self,"arg2", {tbl[">"],"checked",not tbl[">"]["checked"] or not tbl["<"]["checked"],level},
		"hasSlider", 1, "sliderValue",  tbl[">"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
		"SetTbl", "sliderArg1", self,"sliderArg2", {tbl[">"],"Value",nil,level,1}
		);
		
		menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
		
		
		
		
		
		
		local str = addon:FormatTooltipText("1、判断从前面按顺序依次判断。\n\n2、视野角度:如果设定90°。那么就是面前方左边45°右边45°形成的夹角。\n注意:只能判断自己的视野。\n\n3、数量放到最后那么就是说统计前面符合条件的数量。");
			
		menu:AddLine("text", "|cff00ff00帮助","tooltipText",str,"tooltipTitle","帮助","icon","Interface\\Icons\\INV_Misc_QuestionMark");
		
	
	elseif level == 2 then -- 2级菜单内容
		
		if value[1] == "ExcludedClass" then	
			
			local dbf = value[2];
			
			menu:AddLine("text","职业设定","isTitle",1)
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			local Class = dbf["ExcludedClass"]["Class"];
			for k, name in pairs(ClassName) do
						
				local color;
				color = RAID_CLASS_COLORS[k]
							
				menu:AddLine("text", stGetClassicon(k,13)..name, 
				"textR", color.r, "textG", color.g, "textB", color.b, "checked",Class[k],
				"func", "SetTbl","arg1", self,"arg2", {Class,k,not Class[k],level}
				);
			end
			
			
		elseif value[1] == "ExcludedTarget" then
			
			local dbf = value[2];			
			
			
			menu:AddLine("text", "设定排除目标:","isTitle",1);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
						
			local tbl = dbf["ExcludedTarget"]["Target"];
				
			for name, data in pairs(tbl) do
				
				if amGetUnitName(name,true) then
				
				
				
					local color,tc,levelColor,subgroup,checked,Class;
					local playerClass, englishClass = UnitClass(name);
					color = RAID_CLASS_COLORS[englishClass];
					tc = CLASS_BUTTONS[englishClass];
					
					menu:AddLine(
					-- 职业图标
					"icon", "Interface\\WorldStateFrame\\Icons-Classes",
					"tCoordLeft", tc[1],
					"tCoordRight", tc[2],
					"tCoordTop", tc[3],
					"tCoordBottom", tc[4],
					
					"text", name, "textR", color.r, "textG", color.g, "textB", color.b,
					"func", "SetTbl","arg1", self,"arg2", {tbl,name,nil,level}
				)
								
				end
			end
			
			
			for name, data in pairs(tbl) do
				
				if not amGetUnitName(name,true) then
				
					local str = addon:FormatTooltipText("这个玩家名字,必须是完整的名字,而且该玩家必须是你的团友或队友或宠物, 否则你将不能使用玩家名字作为目标。");
					menu:AddLine("text","|c00696969"  .. name, 
									"func", "SetTbl","arg1", self,"arg2", {tbl,name,nil,level},
									"tooltipText",str,"tooltipTitle","目标不可用"
								);
					
				end				
				
			end
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			local str = addon:FormatTooltipText("这个玩家名字,必须是完整的名字,而且该玩家必须是你的团友或队友或宠物, 否则你将不能使用玩家名字作为目标。");
				
				menu:AddLine("text", "|cffffff00手动添加排除目标","hasEditBox", 1, "editBoxText", "", "editBoxFunc",
				"AddTarget","editBoxArg1", self,"editBoxArg2",{tbl,true,level},
				"tooltipText",str,"tooltipTitle","目标名字")
			
			
			
			menu:AddLine("text","|cffffff00选择添加排除目标","hasArrow", 1, "value", {"AddTarget",tbl})
			
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
		
			
			menu:AddLine("text", "设定排除小队:","isTitle",1);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
						
			local tbl = dbf["ExcludedTarget"]["Group"];
			
			for i=1, 8 do
				
				
				menu:AddLine("text", i .. "小队" ,"checked",tbl[i] ,
				"func", "SetTbl","arg1", self,"arg2",{tbl,i,not tbl[i],level}				
				);
				
			end
			
			
			
		
		elseif value[1] == "PlayerRangeCheckAngleBuff" then
		
			local dbf = value[2];
			local E={};
			E.IsTexture="|cff00ffff图|r";
			E.IsSpellId="|cff00ffffId|r";
			E.IsPlayer_Player="|cff00ffff我|r";
			E.IsPlayer_NoPlayer="|cff00ffff否|r";
			E.IsPlayer_All="";
			E.IsCd_Start="|cff00ffff出|r";
			
			menu:AddLine("text", "设定Buff","isTitle",1);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
		
			
			
			local tbl=dbf["NewBuff"]
			Solution = tbl["buffs"];
			
			
			tbl["IsOrAnd"] = tbl["IsOrAnd"] or "Or";
			
			local str = addon:FormatTooltipText("只要下列的Buff其中1个满足条件。")
			menu:AddLine("text", "|cffffffff或者","isRadio",1,"checked",
			tbl["IsOrAnd"]== "Or","func", "SetTbl","arg1", self,"arg2",
			{tbl,"IsOrAnd","Or",level},
			"tooltipText",str,"tooltipTitle","信息");
			
			local str = addon:FormatTooltipText("需要下列的Buff都满足条件。")
			menu:AddLine("text", "|cffffffff并且","isRadio",1,"checked",
			tbl["IsOrAnd"]== "And","func", "SetTbl","arg1", self,"arg2",
			{tbl,"IsOrAnd","And",level},
			"tooltipText",str,"tooltipTitle","信息");
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			local HELPFUL,HARMFUL,DEFAULT =0,0,0;
			
			for k,v in pairs(Solution) do
				
				if v["IsType"]== "HELPFUL" then
					DEFAULT=DEFAULT+1;
					HELPFUL=HELPFUL+1;
					
				elseif v["IsType"]== "HARMFUL" then
					DEFAULT=DEFAULT+1;
					HARMFUL=HARMFUL+1;
					
				end
				
			end
			
			local str = addon:FormatTooltipText("全部Buff设为默认值。")
			menu:AddLine("text", "|cffffffff全部设为默认 |r("..#Solution - DEFAULT.."|cffff0000/|r"..#Solution..")",
			"func", "SetAllBuffDefault","arg1", self,"arg2",Solution,
			"text_X",-22,
			"tooltipText",str,"tooltipTitle","信息");
			
			local str = addon:FormatTooltipText("全部Buff设为有益Buff。")
			menu:AddLine("text", "|cff7FFF00全部设为有益 |r(|cff7FFF00"..HELPFUL.."|cffff0000/|r"..#Solution..")",
			"func", "SetAllBuffHELPFUL","arg1", self,"arg2",Solution,
			"text_X",-22,
			"tooltipText",str,"tooltipTitle","信息");
			
			local str = addon:FormatTooltipText("全部Buff设为无益DeBuff。")
			menu:AddLine("text", "|cff8B008B全部设为无益 |r(|cff8B008B"..HARMFUL.."|cffff0000/|r"..#Solution..")",
			"func", "SetAllBuffHARMFUL","arg1", self,"arg2",Solution,
			"text_X",-22,
			"tooltipText",str,"tooltipTitle","信息");
			
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
		
			
			local str = addon:FormatTooltipText("可以输入Buff名称/Buff Id");
			
			menu:AddLine("text", "添加Buff到列表","colorCode","|cffffff00","hasEditBox", 1, "editBoxText", self.text, "editBoxFunc",
			"Default_AddBuff", "editBoxArg1", self,"editBoxArg2",
			Solution,"tooltipText",str,"tooltipTitle","说明",
			"text_X",-22
			);
			
			menu:AddLine("line",1);
			
			
			
			CollectionInf["Buff_Spell"]["Ex"]=SuperTreatmentDBF["CollectionInf"];
			menu:AddLine("text", "选择Buff到列表","colorCode","|cffffff00","hasArrow", 1, 
			"OpenMenu",SuperTreatment["Menu"]["UnitBuffListMenu"],
			"OpenMenuValue",{CollectionInf["Buff_Spell"],{Solution,-1},function() DropDownMenu:Refresh(level); end},
			"text_X",-22
			);
			
			
			
			
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			CollectionInf["Buff_Spell"]["Ex"]=SuperTreatmentDBF["CollectionInf"];
			AmminimumFast_SortBuff_index=index;
			
			local NoBuffNameCount=0;
			
			for k,v in pairs(Solution) do
				
				if not v["Cd"] then
				
					v["Cd"]={};
					v["Cd"][">"]={};
					v["Cd"]["<"]={};
					v["Cd"]["<"]["Value"]=0;
					v["Cd"][">"]["Value"]=0;
					
					v["Count"]={};
					v["Count"][">"]={};
					v["Count"]["<"]={};
					v["Count"]["<"]["Value"]=0;
					v["Count"][">"]["Value"]=0;
					
					v["Class"]={};
					
				end
				
				v["IsSpellIdTexture"] = v["IsSpellIdTexture"] or "IsName";
				v["IsType"] = v["IsType"] or "Auto";
				v["IsPlayer"] = v["IsPlayer"] or "All";
				v["IsCanceLable"] = v["IsCanceLable"] or "No";
				v["IsRaid"] = v["IsRaid"] or "No";
				
				
				local RightText;
				local Name,_,Texture=GetSpellInfo(v.SpellId);
				Texture = Texture or "";
				
				
				local text="";
				if v["IsCd"] == "No" then
					text = "|cffff0000" .. k .. ". " .. Name;
				elseif v["IsType"]== "HELPFUL" then
					text = "|cff00ff00" .. k .. ". |cff7FFF00" .. Name;
				elseif v["IsType"]== "HARMFUL" then
					text = "|cff00ff00" .. k .. ". |cff8B008B" .. Name;
				else
					text = "|cff00ff00" .. k .. ". |cffffffff" .. Name;
				end
					
			
			
				if  v["IsSpellIdTexture"]=="IsTexture" then
					if RightText then
						RightText = RightText ..",".. E.IsTexture;
					else
						RightText =  E.IsTexture;
					end
					
					NoBuffNameCount = NoBuffNameCount +1;
					
				elseif  v["IsSpellIdTexture"]=="IsSpellId" then
					
					if RightText then
						RightText = RightText ..",".. E.IsSpellId;
					else
						RightText =  E.IsSpellId;
					end
					NoBuffNameCount = NoBuffNameCount +1;
				end
				
				if  v["IsPlayer"] == "PLAYER" then
					
					if RightText then
						RightText = RightText ..",".. E.IsPlayer_Player;
					else
						RightText =  E.IsPlayer_Player;
					end
					NoBuffNameCount = NoBuffNameCount +1;
					
				elseif  v["IsPlayer"] == "NoPlayer" then
					
					if RightText then
						RightText = RightText ..",".. E.IsPlayer_NoPlayer;
					else
						RightText =  E.IsPlayer_NoPlayer;
					end
					NoBuffNameCount = NoBuffNameCount +1;
					
				else
					
					
					--RightText =  E.IsPlayer_All;
					
				end
				
				
				
				if v["IsCd"]=="Start" then
					
					if RightText then
						RightText = RightText ..",".. E.IsCd_Start;
					else
						RightText =  E.IsCd_Start;
					end
				end
				--local Macro_Spell = strsub(n,1,1) ;
				--RightText = gsub(RightText,",","",1);
				if RightText then
					RightText = "|cffff0000[" .. RightText .. "|cffff0000]";
				end
				
				
				local str = addon:FormatTooltipText("\nId: |r" ..(v["SpellId"] or "") .. "\n\n" .. "提示：鼠标右键可以在当前位置插入Buff/技能")
				menu:AddLine("text", text,"icon",Texture,
				
				"tooltipText",str,"tooltipTitle",Name,
				"CloseButtonFunc","Del_Tbl_Index","CloseButtonArg1",self,"CloseButtonArg2",{Solution,k,level},
				"hasArrow", 1, 
				"OpenMenu",SuperTreatment["Menu"]["SetBuffMenu"] ,"OpenMenuValue",{v,k,tbl},
				"OpenRightMenu",SuperTreatment["Menu"]["UnitBuffListMenu"],
				"OpenRightMenuValue",
				{CollectionInf["Buff_Spell"],{Solution,k},function() DropDownMenu:Refresh(level); end},
				"Spell",v.SpellId,
				"RightText",RightText
				);
				
			end
			
			tbl["NoBuffNameCount"]=NoBuffNameCount;
		
		
		end
	
	elseif level == 3 then -- 2级菜单内容
		
		
		if value[1] == "AddTarget" then
			
			local tbl = value[2];
			-- 菜单表格标题
				menu:AddColumnHeader("角色名", "LEFT")
				menu:AddColumnHeader("种族", "CENTER")
				menu:AddColumnHeader("小队", "CENTER")
				
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
				
				for i, data in pairs(SuperTreatmentDBF["Unit"]["RaidList"]) do
					local unit =data["unit"];
				
					if data["subgroup"]>=0 then
					
						local color,tc,levelColor,subgroup,checked,Class;
						local name = amGetUnitName(unit,true);
						
						
						
						
						local unit =data["unit"];
						local playerClass, englishClass = UnitClass(unit)
						color = RAID_CLASS_COLORS[englishClass]
						tc = CLASS_BUTTONS[englishClass]
						
						
						
							if data["subgroup"] ==0 then
								subgroup= "无";
							else
								subgroup= data["subgroup"];
							end
							
							
							
							


							-- 表格内容行
							menu:AddLine(
								-- 职业图标
								"checked",tbl[name],
								"text1", stGetClassicon(englishClass,13)..name,
								"text1R", color.r, "text1G", color.g, "text1B", color.b,
								"text2", UnitRace(unit),
								"text3", subgroup,
								"func", "SetTbl","arg1", self,"arg2", {tbl,name,true,level-1}
							)
						
						
						
						
						
						
					end
				end
		
		
		end
		
		
	end
	
end




function addon:Default_AddBuff(Value,Text)
	
	
	local id,v,T,ToSpellId;
	if not Text then
		
		T=Value[1]["name"];
		v=Value[3][1];
		id=Value[2];
	
	else
		v=Value;
		T=Text;
	end
	
	
	local Buff = v;
	
	if tonumber(T) then
		
		local tbl ={};
		local Name,_,Texture=GetSpellInfo(tonumber(T));
		
		if Name then
			tbl["SpellId"]=tonumber(T);
			--tbl["Texture"]=Texture;
			--tbl["Name"]=Name;
			table.insert(Buff,tbl);
			ToSpellId=tonumber(T);
		end
			
	else
	
	
		local TV = { strsplit(",",T) }
		for i,h in pairs(TV) do
		
			
			local Texture="";
			local tbl ={};
			local spellid ;
			
			if id then
				spellid = id
				_,_,Texture=GetSpellInfo(spellid)
			else
				spellid,_,_,Texture = amfindSpellItemInf(h);
			end
			
			if spellid then
				
				tbl["SpellId"]=spellid;
				table.insert(Buff,tbl)
				ToSpellId=spellid;
			end
			
		
			--tbl["Texture"]=Texture;
			--tbl["Name"]=h;
			
			
			
		end
	
	end
	
	DropDownMenu:Refresh(2);
	
	return ToSpellId;

end

function addon:Del_Tbl_Index(v1,v2)
	
	table.remove(v1[1], v1[2]) 
	DropDownMenu:Refresh(v1[3] or 1);
	
end


function addon:SetAllBuffDefault(value)

	for k,v in pairs(value) do
			
		local id = v.SpellId;
		
		value[k]={};
		value[k].SpellId=id;
		
	end
	
	DropDownMenu:Refresh(2)
end


function addon:SetAllBuffHELPFUL(value)

	for k,v in pairs(value) do
			
		value[k].IsType="HELPFUL";
		
	end
	
	DropDownMenu:Refresh(2)
end

function addon:SetAllBuffHARMFUL(value)

	for k,v in pairs(value) do
		
		value[k].IsType="HARMFUL";
		
	end
	
	DropDownMenu:Refresh(2)
end