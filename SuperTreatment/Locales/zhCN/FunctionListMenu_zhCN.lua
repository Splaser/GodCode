if (GetLocale() ~= 	"zhCN") then return; end;

local GetSpellInfo = GetSpellInfo;

local TYPEINF={};
	TYPEINF["String"]="字符";
	TYPEINF["Boolean"]="布尔值";
	TYPEINF["Number"]="数值";
	TYPEINF["unit"]="目标";
	TYPEINF[""]="空字符";
	
local powerType={};
powerType[-2]="健康";
powerType[0]="法力";
powerType[1]="怒气";
powerType[2]="集中";
powerType[3]="能量";
powerType[4]="快乐";
powerType[5]="符文";
powerType[6]="符能";
powerType[7]="灵魂碎片";
powerType[8]="日/月食";
powerType[9]="神圣";

local ClassName=AM_CLASS_NAME;



SuperTreatment["Menu"]["FunctionListMenu"] = amMenu("FunctionListMenu");
local DropDownMenu = SuperTreatment["Menu"]["FunctionListMenu"];
local addon = {}
DropDownMenu:SetMenuRequestFunc(addon, "OnMenuRequest");

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



function addon:FormatTooltipText(text)
	if not text then
		return;
	end
	
	return "|cff00ff00" .. text .. "|r";
end



function addon:OnMenuRequest(level, value, menu, MenuEx)
	
	
		
	
	if level == 1 then -- 1级菜单内容
	
		--local tbl = MenuEx.ExternalData[1];
		
		menu:AddLine("text","函数列表|cffff0000(|cff00ff00滚动鼠标看更多|cffff0000)|r","isTitle",1,"notCheckable",1,"justifyH","CENTER");
		
		menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			local api = SuperTreatment["Api"];
			local apiIndex = SuperTreatment["ApiIndex"];
			local i =1;
			
			for k1, data1 in pairs(apiIndex) do
				
				local k = data1;
				local data = api[k];
				
				if SuperTreatment["type"]==data["type"] then
				
					local str = addon:FormatTooltipText("\n" .. data["inf"] .. "\n\n|cffffff00" .. data["Remarks"]);
					local ArgumentsTexts="";
					local Arguments = data["Arguments"];
				
					local Counts = data["Arguments"]["Counts"];
					if Counts==0 then
					
						ArgumentsTexts = "\n|cffff0000参数:|r 无\n"
					else
					
						for n=1,Counts do
							
							
							ArgumentsTexts = ArgumentsTexts .."\n|cffff0000参数".. n .. "(|r" .. TYPEINF[Arguments[n]["type"]] .."|cffff0000):|r\n"  .. Arguments[n]["inf"] .. "\n";
							
						end
						
					end
					
					local ReturnsTexts="";
					local Returns = data["Returns"];
					
					local Counts = data["Returns"]["Counts"];
					if Counts==0 then
					
						ReturnsTexts = "\n|cffff0000返回值:|r 无\n"
					else
					
						for n=1,Counts do
							
							ReturnsTexts = ReturnsTexts .."\n|cffff0000返回值".. n .. "(|r" .. TYPEINF[Returns[n]["type"]] .."|cffff0000):|r\n"  .. Returns[n]["inf"] .. "\n";
							if Returns[n]["Failure"] ~= nil then
								ReturnsTexts = ReturnsTexts .."|cff969696本插件为假时返回: |cffffff00" .. (TYPEINF[tostring(Returns[n]["Failure"])] or tostring(Returns[n]["Failure"])) .. "|r\n";
							end
						end
						
					end
					
					ArgumentsTexts = data["inf"] .. "\n" .. ArgumentsTexts .. ReturnsTexts .. "\n|cff00ff00" .. data["Remarks"] .. "|r";
					
					
					menu:AddLine("text","|cff104E8B" .. i .. ". |cffffffff" .. data["inf"],
					"tooltipText",ArgumentsTexts,"tooltipTitle",k,"notCheckable",1,
					"func", "SuperTreatmentApiListAdd", "arg1", self, "arg2", {k,MenuEx},"notCheckable",1
					);
					
					menu:AddLine("line",1);
					
					i=i+1;
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


