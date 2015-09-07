if (GetLocale() == 	"zhCN") then return; end;

local GetSpellInfo = GetSpellInfo;

local TYPEINF={};
	TYPEINF["String"]="字符";
	TYPEINF["Boolean"]="布爾值";
	TYPEINF["Number"]="數值";
	TYPEINF["unit"]="目標";
	TYPEINF[""]="空字符";
	



SuperTreatment["Menu"]["SetApiParameterMenu"] = amMenu("SetApiParameterMenu");
local DropDownMenu = SuperTreatment["Menu"]["SetApiParameterMenu"];
local addon = {}
DropDownMenu:SetMenuRequestFunc(addon, "OnMenuRequest");

function addon:SetTbl(v,self)
	
	if type(v) == "function" then
	
		return v(self);
	
	end
	
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

function addon:SetSlider(v,v1)
	
	if type(v) == "function" then
	
		return v(v1);
	
	end
	
	
	local tbl = v[1];
	local name = v[2]
	local level = v[3]
	local globalevel = v[4]
	
	
	tbl[name]=v1
	
	if globalevel then
		DropDownMenu:GlobaRefresh(globalevel)
	end
	
	if level or (not level and not globalevel) then
		DropDownMenu:Refresh(level or 1);
	end
	
	
end

function addon:FormatTooltipText(text)
	if not text then
		return;
	end
	
	return "|cff00ff00" .. text .. "|r";
end



function addon:OnMenuRequest(level, value, menu, MenuEx,GlobalLevel)
	
	
		
	
	if level == 1 then -- 1級菜單內容
	
		--local tbl = MenuEx.ExternalData[1];
		
		menu:AddLine("text","參數設定","isTitle",1)
		
		
		local index = MenuEx.ExternalData[2][2];
		local apiname = MenuEx.ExternalData[2][1];
		local hasArrowName = "ApiRoot"
		
		local data = SuperTreatment["Api"][apiname];
		local Arguments = data["Arguments"];
		local Counts = Arguments["Counts"];
		
		
		menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
		
		
		for n=1,Counts do
			
			
			local m = SuperTreatment["ApiDbf"][index]["Arguments"][n];
			
			local Type = Arguments[n]["type"];
			local Select = Arguments[n]["Select"];
			local tooltipText = "|cffff0000參數".. n .. "(|r" .. TYPEINF[Arguments[n]["type"]] .."|cffff0000):|r\n"  .. Arguments[n]["inf"] .. "\n";
			if  Select then
				--local TC = hasArrowName .. "Select_" .. apiname .. "_" .. n .. "_" .. index ;				
				menu:AddLine("text", "參數:" .. n, "hasArrow", 1, "value", {hasArrowName , "Select",apiname,n,index},
				"tooltipText",tooltipText,"tooltipTitle","參數")
			else
				
				if Type == "unit" then
				
					menu:AddLine("text","參數:" .. n .. "(內置)",
					"tooltipText",tooltipText,"tooltipTitle","參數");
					
				elseif Type == "String" then
					
					local temp=""
					
					if m["value"] and m["value"]=="" then
						m["value"]=nil;
					end
					
					if m["value"] then
						temp = m["value"];
					end
											
						menu:AddLine("text","參數:" .. n,
						"hasEditBox", 1, "editBoxText", temp, "editBoxFunc", 
						 "SetSlider", "editBoxArg1", self,"editBoxArg2",{m,"value",nil,GlobalLevel-1},
						"tooltipText",tooltipText,"tooltipTitle","參數");
					
				
				
				elseif Type == "Boolean" then
				
					--local TC = hasArrowName .. "Boolean_" .. apiname .. "_" .. n .. "_" .. index ;				
					menu:AddLine("text", "參數:" .. n, "hasArrow", 1, "value", {hasArrowName , "Boolean",apiname,n,index},
					"tooltipText",tooltipText,"tooltipTitle","參數")
				
				
				elseif Type == "Number" then
					
					local temp=""
					if m["value"] then
						temp = m["value"];
					end
					
					menu:AddLine("text","參數:" .. n,
					"hasEditBox", 1, "editBoxText",temp, "editBoxFunc", 
					"SetSlider", "editBoxArg1", self,"editBoxArg2",{m,"value",nil,GlobalLevel-2},
					"editBoxNumeric",1,
					"tooltipText",tooltipText,"tooltipTitle","參數");
					
				end
				
				
				
			end
			
			if n==Counts then
				
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
				
			else
				menu:AddLine("line",1,"LineHeight",8);
				
			end
		end
		
		
		menu:AddLine("text","返回值處理","isTitle",1)
		menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
		
		local Returns = data["Returns"];
		local Counts = Returns["Counts"];
		
		for n=1,Counts do
			
			
			local m = SuperTreatment["ApiDbf"][index]["Returns"][n];
			
			local Type = Returns[n]["type"];
			local Select = Returns[n]["Select"];
			local tooltipText = "|cffff0000返回值".. n .. "(|r" .. TYPEINF[Returns[n]["type"]] .."|cffff0000):|r\n"  .. Returns[n]["inf"] .. "\n";
			if Returns[n]["Failure"] ~= nil then
				tooltipText = tooltipText .."|cff969696本插件為假時返回: |cffffff00" .. (TYPEINF[tostring(Returns[n]["Failure"])] or tostring(Returns[n]["Failure"])) .. "|r\n";
			end
			
			if  Select then
				--local TC = hasArrowName .. "Select_" .. apiname .. "_" .. n .. "_" .. index ;				
				menu:AddLine("text", "返回值:" .. n,
				"checked",m["checked"],	"func", "SetTbl", "arg1", self, "arg2", 
				{m,"checked",not m.checked,level},
				"hasArrow", 1, "value", {hasArrowName , "Select",apiname,n,index},
				"tooltipText",tooltipText,"tooltipTitle","返回值")
			else
			
				if Type == "String" then

					--local TC = hasArrowName .. "Find_" .. apiname .. "_" .. n .. "_" .. index ;				
					menu:AddLine("text", "返回值:" .. n, "hasArrow", 1, "value", {hasArrowName , "Find",apiname,n,index},
					"checked",m["checked"],	"func", "SetTbl", "arg1", self, "arg2", 
					{m,"checked",not m.checked,level},
					"tooltipText",tooltipText,"tooltipTitle","返回值")

				elseif Type == "Boolean" then
				
					local temp=""
					if m["value"] then
						temp = m["value"];
					end
											
						--local TC = hasArrowName .. "ReturnsBoolean_" .. apiname .. "_" .. n .. "_" .. index ;				
						menu:AddLine("text", "返回值:" .. n, "hasArrow", 1, "value", {hasArrowName , "ReturnsBoolean",apiname,n,index},
						"checked",m["checked"],	"func", "SetTbl", "arg1", self, "arg2", 
						{m,"checked",not m.checked,level},
						"tooltipText",tooltipText,"tooltipTitle","返回值")
				
				
				elseif Type == "Number" then
					
					--local TC = hasArrowName .. "NumberOperation_" .. apiname .. "_" .. n .. "_" .. index ;				
					menu:AddLine("text", "返回值:" .. n,
					"checked",m["checked"],	"func", "SetTbl", "arg1", self, "arg2", 
					{m,"checked",not m.checked,level},
					"hasArrow", 1, "value", {hasArrowName , "NumberOperation",apiname,n,index},
					"tooltipText",tooltipText,"tooltipTitle","返回值"
					);
					
				end
				
				
			end
			
			if n~=Counts then
				menu:AddLine("line",1,"LineHeight",8);
			end
		
		end

			
	elseif level == 2 then	
	
		if value[1]=="ApiRoot" then
			--apiname 函數英文名稱
			--index 函數對應的序號
			--api_index 函數參數、返回值序號
		
			local hasArrowName1,hasArrowName2,apiname,api_index,index = value[1],value[2],value[3],value[4],value[5];
				

			if hasArrowName2 == "ReturnsBoolean" then
				
				menu:AddLine("text","返回值 " .. api_index .. " 設定","isTitle",1)
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
				
				
				local m = SuperTreatment["ApiDbf"][index]["Returns"][api_index];
						
				menu:AddLine("text", "|cffffffff返回值(|cffff0000=真|cffffffff)","isRadio",1,"checked", m["value"],
				"func", "SetTbl", "arg1", self, "arg2", {m,"value",true,level}
				);
				menu:AddLine("text", "|cffffffff返回值(|cffff0000=假|cffffffff)","isRadio",1,"checked", not m["value"],
				"func", "SetTbl", "arg1", self, "arg2", {m,"value",false,level}
				);
				
				
			elseif hasArrowName2 == "Boolean" then
				
				menu:AddLine("text","參數 " .. api_index .. " 設定","isTitle",1)
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
				
		
				
				local m = SuperTreatment["ApiDbf"][index]["Arguments"][api_index];
				
				menu:AddLine("text", "真","isRadio",1,"checked", m["value"],
				"func", "SetTbl", "arg1", self, "arg2", {m,"value",true,level}
				);
				menu:AddLine("text", "假","isRadio",1,"checked", not m["value"],
				"func", "SetTbl", "arg1", self, "arg2", {m,"value",false,level}
				);
				
				
			
			elseif hasArrowName2 == "NumberOperation" then
				
				menu:AddLine("text","返回值 " .. api_index .. " 設定","isTitle",1)
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
				
				
							
				local m = SuperTreatment["ApiDbf"][index]["Returns"][api_index];
				local f = SuperTreatment["Api"][apiname]["Returns"][api_index];
				
				if not m["<"] then
					m["<"]={};
					m[">"]={};
					m["="]={};
					
					m["<"]["Value"]=0;
					m[">"]["Value"]=0;
					m["="]["Value"]=0;
				end
				
				
				local MaxValue = f["Maximum"];
				local Minimum = f["Minimum"];
				local Step = f["Step"];
				local Percent = f["Percent"];
				local Decimals = f["Decimals"];
				if not Decimals then
					Decimals=0;
				end
				
				if MaxValue then
				
					menu:AddLine("text", "|cffffffff返回值(|cffff0000<=" .. m["<"]["Value"]  .."|cffffffff)" , 
					"checked",m["<"]["checked"],"func", "SetTbl","arg1", self,"arg2", 
					{m["<"],"checked",not m["<"]["checked"],level},
					"hasSlider", 1, "sliderValue",  m["<"]["Value"], "sliderMin", Minimum, "sliderMax", MaxValue,
					"sliderStep", Step,"sliderIsPercent",Percent,"sliderDecimals",Decimals, "sliderFunc",
					"SetSlider", "sliderArg1", self,"sliderArg2", 
					{m["<"],"Value",level}
					);
								
					
					menu:AddLine("text", "|cffffffff返回值(|cffff0000>=" .. m[">"]["Value"]  .."|cffffffff)" , 
					"checked",m[">"]["checked"],"func", "SetTbl","arg1", self,"arg2", 
					{m[">"],"checked",not m[">"]["checked"],level},
					"hasSlider", 1, "sliderValue",m[">"]["Value"], "sliderMin", Minimum, "sliderMax", MaxValue,
					"sliderStep", Step,"sliderIsPercent",Percent,"sliderDecimals",Decimals, "sliderFunc",
					"SetSlider", "sliderArg1", self,"sliderArg2",
					{m[">"],"Value",level}
					);
					
					menu:AddLine("text", "|cffffffff返回值(|cffff0000=" .. m["="]["Value"]  .."|cffffffff)" , 
					"checked",m["="]["checked"],"func", "SetTbl","arg1", self,"arg2", 
					{m["="],"checked",not m["="]["checked"],level},
					"hasSlider", 1, "sliderValue",m["="]["Value"], "sliderMin", Minimum, "sliderMax", MaxValue, 
					"sliderStep", Step,"sliderIsPercent",Percent,"sliderDecimals",Decimals, "sliderFunc",
					"SetSlider" , "sliderArg1", self,"sliderArg2", 
					{m["="],"Value",level}
					);
				else
				
				
					menu:AddLine("text", "|cffffffff返回值(|cffff0000<=" .. m["<"]["Value"]  .."|cffffffff)" , 
					"checked",m["<"]["checked"],"func", "SetTbl","arg1", self,"arg2", 
					{m["<"],"checked",not m["<"]["checked"],level},
					"hasEditBox", 1, "editBoxText", m["<"]["Value"], "editBoxFunc", "SetSlider",
					"editBoxArg1", self, "editBoxArg2", 
					{m["<"],"Value",level},
					"editBoxNumeric",1
					);
								
					
					menu:AddLine("text", "|cffffffff返回值(|cffff0000>=" .. m[">"]["Value"]  .."|cffffffff)" , 
					"checked",m[">"]["checked"],"func", "SetTbl","arg1", self,"arg2", 
					{m[">"],"checked",not m[">"]["checked"],level},
					"hasEditBox", 1, "editBoxText", m[">"]["Value"], "editBoxFunc", "SetSlider",
					"editBoxArg1", self, "editBoxArg2", 
					{m[">"],"Value",level},
					"editBoxNumeric",1
					);
					
					menu:AddLine("text", "|cffffffff返回值(|cffff0000=" .. m["="]["Value"]  .."|cffffffff)" , 
					"checked",m["="]["checked"],"func", "SetTbl","arg1", self,"arg2", 
					{m["="],"checked",not m["="]["checked"],level},
					"hasEditBox", 1, "editBoxText",  m["="]["Value"], "editBoxFunc", "SetSlider",
					"editBoxArg1", self, "editBoxArg2", 
					{m["="],"Value",level},
					"editBoxNumeric",1
					);
				
				
				
				end
					
				

			elseif hasArrowName2 == "Find" then
				
				menu:AddLine("text","返回值 " .. api_index .. " 設定","isTitle",1)
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
				
				
							
				local m = SuperTreatment["ApiDbf"][index]["Returns"][api_index];
				
				
				m["isRadio"] = m["isRadio"] or "Contains";
				
				
				
				menu:AddLine("text","包含","isRadio",1,"checked","Contains" == m["isRadio"],
					"func", "SetTbl", "arg1", self, "arg2", 
					{m,"isRadio","Contains",level}
					);
					
				menu:AddLine("text","不包含","isRadio",1,"checked","NoContains" == m["isRadio"],
					"func", "SetTbl", "arg1", self, "arg2",
					{m,"isRadio","NoContains",level}
					);
					
				menu:AddLine("text","模糊包含","isRadio",1,"checked","FuzzyContains" == m["isRadio"],
					"func", "SetTbl", "arg1", self, "arg2", 
					{m,"isRadio","FuzzyContains",level}
					);
					
					
				menu:AddLine("text","模糊不包含","isRadio",1,"checked","FuzzyNoContains" == m["isRadio"],
					"func", "SetTbl", "arg1", self, "arg2", 
					{m,"isRadio","FuzzyNoContains",level}
					);
					
				
				menu:AddLine();
				if not m["Select"] then
					m["Select"]={};
				end
				
				
				
				local str = addon:FormatTooltipText("請確認新名稱不在列表中，同名即|cffffffff 替換。");
				menu:AddLine("text","|cffffff00添加值|r",
				"hasEditBox", 1, "editBoxText", "", "editBoxFunc", "SetSlider",
				
				"editBoxArg1", self, "editBoxArg2", 
				
				function(v)
					local TV = { strsplit(",",v) };
					for i,h in pairs(TV) do
						table.insert(m["Select"],h);
					end
					DropDownMenu:GlobaRefresh(GlobalLevel-2);
				end,
				
				"tooltipText",str,"tooltipTitle","返回值");
				
				
				menu:AddLine("line",1,"LineHeight",10,"LineBrightness",1);
				
				for k, x in pairs(m["Select"]) do
				
				local func = function()
						
						if IsControlKeyDown() and IsAltKeyDown() then
							table.remove(m["Select"], k) ;
							DropDownMenu:GlobaRefresh(GlobalLevel-2);
							return;
						end
				end;
				
				local func1 = function()
						
						
							table.remove(m["Select"], k) ;
							DropDownMenu:GlobaRefresh(GlobalLevel-2);
							return;
						
				end;
					
					
					local str = addon:FormatTooltipText("\n|cffff0000刪除: |cffffffffCtrl + Alt + 鼠標左鍵")
					menu:AddLine("text","|cff00ff00" .. k .. ". |cffffffff" .. x,
					
					"tooltipText",str,"tooltipTitle","返回值",
					"CloseButtonFunc","SetTbl","CloseButtonArg1",self,"CloseButtonArg2",func1,
					"func","SetTbl","arg1", self, "arg2",func
					);
					
				end
				
				
			elseif hasArrowName2 == "Select" then
				
				
				
				
				local data = SuperTreatment["Api"][apiname];
				local v = data["Arguments"][api_index];
				local m = SuperTreatment["ApiDbf"][index]["Arguments"][api_index];
				
				if v["SelectType"] then
					
					v["Select"]={};
					
					local SelectTypeTbl = getglobal(v["SelectType"]["Tbl"]);
					SelectTypeTbl=SelectTypeTbl();
					
					for e, w in pairs(SelectTypeTbl) do
						
						local TblValue,Value;
						
						if v["SelectType"]["TblValue"]=="TblAutoIndex" then
							TblValue = e;
						end
						
						if v["SelectType"]["Value"]=="TblAutoIndex" then
							Value = e;
						end
						
						v["Select"][TblValue] = Value;
						
					end
					
				end
				
				if v["Select"] then
				
					for k, x in pairs(v["Select"]) do
						
						menu:AddLine("text", x ,"isRadio",1,"checked",k == m["value"],
						"func", "SetTbl", "arg1", self, "arg2", 
						
						{m,"value",k,level}
						);
					
					end
					
				end
			end
		
		

		end		
	
	end
	
	
end


function addon:SuperTreatmentApiListAdd(value)
	
	local v = value[1];
	local MenuEx = value[2];
	
	local api = SuperTreatment["Api"][v];
	
		
	local tbl={};
		tbl["id"]=v;
		tbl["Arguments"]={};
		tbl["Returns"]={};
		
	local Counts = api["Arguments"]["Counts"];
	for n=1,Counts do
		tbl["Arguments"][n]={};
		if api["Arguments"][n]["type"]=="unit" then
		
			tbl["Arguments"][n]["value"]="unit";
		else
			tbl["Arguments"][n]["value"]=nil;
		end
	end
	
	local Counts = api["Returns"]["Counts"];
	for n=1,Counts do
		tbl["Returns"][n]={};
		tbl["Returns"][n]["value"]=nil;
	end
	
		
	table.insert(SuperTreatment["ApiDbf"],tbl)
	MenuEx.ExternalData[3]();
	
end



