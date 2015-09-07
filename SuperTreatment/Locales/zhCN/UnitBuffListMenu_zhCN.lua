if (GetLocale() ~= 	"zhCN") then return; end;

local GetSpellInfo = GetSpellInfo;

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


SuperTreatment["Menu"]["UnitBuffListMenu"] = amMenu("UnitBuffListMenu");
local DropDownMenu = SuperTreatment["Menu"]["UnitBuffListMenu"];
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

function addon:BuffListAllDel(v)
	
	v["Buff"]={};
	v["Spell"]={};
end

function addon:FormatTooltipText(text)
	if not text then
		return;
	end
	
	return "|cff00ff00" .. text .. "|r";
end

function addon:SpellBuffInformationFiltering(v)
	
	addon.SpellBuffInformationFiltering_value=v;
	
	DropDownMenu:Refresh(3);
	
end

function addon:OnMenuRequest(level, value, menu, MenuEx)
	
	
		
	
	if level == 1 then -- 1级菜单内容
	
		local tbl = MenuEx.ExternalData[1].Ex.Buff_Spell;
		
		menu:AddLine("text", "|cffffff00启用信息收集","checked",tbl["checked"],"func", "SetTbl","arg1", self,
		"arg2",{tbl,"checked",not tbl["checked"],level}
		);
		
		menu:AddLine("text", "|cffffff00删除全部信息", "func", "BuffListAllDel", "arg1", self,"arg2",MenuEx.ExternalData[1],
		"hasConfirm", 1, "confirmText", "是否删除删除全部信息?"
		);
		
		menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
		
		
		menu:AddLine("text", "|cffffff00技能|r", "hasArrow", 1, "value", 
		{"BuffList1",MenuEx.ExternalData,"spell"}
		);
		
		menu:AddLine("text", "|cffffff00Buff|r", "hasArrow", 1, "value",
		{"BuffList1",MenuEx.ExternalData,"buff"}
		);
		
		menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
		
		local str = addon:FormatTooltipText("过滤采用模糊模式包含关键字显示，多个关键字用英文逗号分开。\n\n|cffff0000如:|r\n\n治疗,恢复\n\n那么强效治疗术、快速治疗、恢复\n这些就会显示出来。");
		
		menu:AddLine("text", "|cffffff00过滤关键字","hasEditBox", 1, "editBoxText", addon.SpellBuffInformationFiltering_value, "editBoxFunc", "SpellBuffInformationFiltering", "editBoxArg1", self,"tooltipText",str,"tooltipTitle","信息");
		
		
		
		tbl["type"] = tbl["type"] or -1000;
		
		menu:AddLine("text", "|cffffff00显示自己","isRadio", 0,"checked",tbl["type"] == -999,
		"func", "SetTbl","arg1", self,"arg2",{tbl,"type",-999,level})
		menu:AddLine("text", "|cffffff00显示全部","isRadio", 0,"checked",tbl["type"] == -1000,
		"func", "SetTbl","arg1", self,"arg2",{tbl,"type",-1000,level}
		);
		
		menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
		
		
		for i, data in pairs(powerType) do
			
			menu:AddLine("text", data,"isRadio", 0,"checked",tbl["type"] == i,
			"func", "SetTbl","arg1", self,"arg2",{tbl,"type",i,level}
			);
		
		end
		
		menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
		
		for i, data in pairs(ClassName) do
			
			local color,tc;
			color = RAID_CLASS_COLORS[i]
			
			
			local str = addon:FormatTooltipText("只能显示队友、团友、竞技场敌方信息");
			menu:AddLine(
			
			"textR", color.r, "textG", color.g, "textB", color.b,
			"text", data,"isRadio", 0,"checked",tbl["type"] == i,
			"func", "SetTbl","arg1", self,"arg2",{tbl,"type",i,level},
			"tooltipText",str,"tooltipTitle","说明"
			);
		
		end
		
	elseif level == 2 then -- 2级菜单内容	
		
		if value[1] == "BuffList1" then	
			
			--local func  = value[2]["function"];
			--local funcValue  = value[2]["value"];
			
			local tbl ;
			if value[3] == "spell" then
				tbl = value[2][1]["Spell"];
				menu:AddLine("text","技能列表","isTitle",1);
			else
				tbl = value[2][1]["Buff"];
				menu:AddLine("text","Buff列表","isTitle",1);
			end
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			local strtbl = { strsplit(",",addon.SpellBuffInformationFiltering_value or "") }
			
			local guid = UnitGUID("player");
			
				for k,v in pairs(tbl) do
					
					local Type = SuperTreatmentDBF["CollectionInf"]["Buff_Spell"]["type"];
					local isType = true;
					
					if  type(Type) == "string" then
					
						
						isType = v["englishClass"] ==Type;
					else
					
						if Type == -1000 then
							
							
						elseif Type == -999 then	
							isType = v["UnitGUID"] ==guid;
						
						else
							isType = v["powerType"] ==Type;
						end
					
					
					end
					
					isType = isType and amfind(v["name"],strtbl,-1);
						
					
					if isType then
						if not v["powerType"] then
							v["powerType"]="";
						end
						
						local icon="";
						
						if not v["icon"] then
							v["icon"]="";
						else
							icon={strsplit("\\",v["icon"])};
						end
						
						if not v["rank"] then
							v["rank"]="";
						end
						
						local class;
						if ClassName[v["englishClass"]] then
							class = ClassName[v["englishClass"]];
							
						else
							class="";
						end
						
						
						local G = "|cff00ffff";
						local str = "\n"..G .. "    Id: |r" .. k.. G .. "\n等级: |r" .. v["rank"] .. G .. "\n能量: |r" .. (powerType[v["powerType"]] or "") .. G .. "\n职业: |r" ..  class  .. G .. "\n图标: |r" .. icon[3] ;
						str = str .. "\n\n|cffff0000打印图标: |cffffffffCtrl + 鼠标左键\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键";
						
						menu:AddLine("text", v["name"],"icon",v["icon"],
						"tooltipText",str,"tooltipTitle",v["name"],
						"func","SetMenu","arg1", self,"arg2",
						{value,k,level},
						"Spell",k
						--{func,valueB,{v,k,funcValue}}
						);
					
					end
					
				end
		
		
		
			
		end
		
	
	
	end
	
	
end



function addon:SetMenu(Value)
	
	local v = Value[1];
	local index = Value[2];
	local level = Value[3];
	
	local Ex = v[2][2];
	local SetTbl=v[2][3];
	local tbl;
	
	if v[3] == "spell" then
		tbl = v[2][1]["Spell"];
	else
		tbl = v[2][1]["Buff"];
	end
	
	--print(index,IsControlKeyDown(), IsAltKeyDown())
	
	
	if IsControlKeyDown() and IsAltKeyDown() then
	
		tbl[index]=nil;
		DropDownMenu:Refresh(level);
		return;
		
	elseif IsControlKeyDown()  and not IsAltKeyDown() then
	
		print("|cffff0000图标:|r " .. tbl[index]["icon"]);
		return;
		
	end
	
	if Ex then
		
		if type(Ex[2])=="number" then
			
			local tbl ={};
			tbl["SpellId"]=index;
			
			if Ex[2]>=1 then
				
				table.insert(Ex[1],Ex[2],tbl);
			
			else
			
				table.insert(Ex[1],tbl);
							
			end
			
		elseif type(Ex[2])=="function" then
			
			
			Ex[2](self,SetTbl,index);
			
		elseif type(Ex[2])=="table" then
			
		elseif type(Ex[2])=="string" then
			Ex[1][Ex[2]]=index;
		end
		
	
	end
	
	local ExR = v[2][3];
	
	if ExR then
	
		ExR();
	end
	
	
	
end