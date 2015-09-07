if (GetLocale() ~= 	"zhCN") then return; end;


local RDB,UnitDB,Spells,ST;

		
SuperTreatment["Menu"]["CustomizeTarget"] = amMenu("CustomizeTarget");
local DropDownMenu = SuperTreatment["Menu"]["CustomizeTarget"];
local addon = {}
DropDownMenu:SetMenuRequestFunc(addon, "OnMenuRequest");

local function NOT(v,text) 
	if v["not"] then
		return text .. "|cffff0000 [Not]|r";
	else
		return text;
	end
end

local NOTT= "\n|cffff0000条件取反: |cffffffffAlt + 鼠标左键";

local TYPEINF={};
	TYPEINF["String"]="字符";
	TYPEINF["Boolean"]="布尔值";
	TYPEINF["Number"]="数值";
	TYPEINF["unit"]="目标";
	TYPEINF[""]="空字符";
	
	
local ClassName=AM_CLASS_NAME;


local E={};

E.KEY_BUFF="|cff00ff00指定该Buff是否自己的:\n\n|cffff0000启用: |cffffffffShift + 鼠标左键\n\n|cff00ff00当有同名出现时通过启用对比图标来判断:\n\n|cffff0000启用: |cffffffffCtrl + 鼠标左键\n\n|cff00ff00当有同名出现时通过启用对比Id来判断:\n\n|cffff0000启用: |cffffffffAlt + 鼠标左键\n\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键|r";


E.IsTexture="|cff00ffff图|r";
E.IsSpellId="|cff00ffffId|r";
E.IsPlayer_Player="|cff00ffff我|r";
E.IsPlayer_NoPlayer="|cff00ffff否|r";
E.IsPlayer_All="";
E.IsCd_Start="|cff00ffff出|r";


function addon:SetSlider(v,v1)
	
	local tbl = v[1];
	local name = v[2]
	local level = v[3]
	
	
	tbl[name]=v1
	DropDownMenu:Refresh(level);

end
	
function addon:SetTbl(v,self)
	
	local tbl,index,value,level,argv,ex,levelex,ArrowHide = v[1],v[2],v[3],v[4],v[5],v[6],v[7],v[8];
	
	if ArrowHide then
		DropDownMenu:ArrowHide(self,level)
	
	end
	
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


function addon:SetSliderMG(v,v1)
	
	local tbl = v[1];
	local name = v[2];
	local level = v[3];
	local mg = v[4];
	
	tbl[name]=v1
	
	addon:Minimum_Generation(mg);
	
	DropDownMenu:Refresh(level);

end

function addon:SetSliderMaxMG(v,v1)
	
	local tbl = v[1];
	local name = v[2];
	local level = v[3];
	local mg = v[4];
	
	tbl[name]=v1
	
	addon:Maximum_Generation(mg);
	
	DropDownMenu:Refresh(level);

end


function addon:SetTblMG(v,self)
	
	local tbl,index,value,level,mg = v[1],v[2],v[3],v[4],v[5];
	
	
	tbl[index]=value;
	
	
	addon:Minimum_Generation(mg);
			
	DropDownMenu:Refresh(level or 1);
	
end

function addon:SetTblMaxMG(v,self)
	
	local tbl,index,value,level,mg = v[1],v[2],v[3],v[4],v[5];
	
	
	tbl[index]=value;
	
	
	addon:Maximum_Generation(mg);
			
	DropDownMenu:Refresh(level or 1);
	
end

function addon:Maximum_Generation(p)
	
	
	
	p["Code"]=nil;
	p["CodeFunction"]=nil;
	
	if p["isRadio"]=="HealthMax" then
		
		p["Code"]="aml(unit,false,0)>=" .. p["HealthMaxValue"] .. ',aml(unit,false,0)';
		
	
	elseif p["isRadio"]=="HealthMaxPercentage" then
		
		p["Code"]='aml(unit,"%",0)>=' .. p["HealthMaxPercentageValue"] .. ',aml(unit,"%",0)';
		
	
	elseif p["isRadio"]=="MaximumBlood" then
		
		p["Code"]="aml(unit,false,1)>=" .. p["MaximumBloodValue"] .. ',aml(unit,false,1)';
		
	
	elseif p["isRadio"]=="MaximumBloodPercentage" then
		
		p["Code"]='aml(unit,"%",1)>=' .. p["MaximumBloodPercentageValue"] .. ',aml(unit,"%",1)';
		
	
	elseif p["isRadio"]=="MaximumEnergy" then
	
		p["Code"]='amr(unit,false,1)>=' .. p["MaximumEnergyValue"] .. ',amr(unit,false,1)';
	
	
	elseif p["isRadio"]=="MaximumEnergyPercentage" then
	
		p["Code"]='amr(unit,"%",1)>=' .. p["MaximumEnergyPercentageValue"] .. ',amr(unit,"%",1)';
	
	
		
	
	elseif p["isRadio"]=="MaximumLayerBuffChecked" then
	
		--local TempBuffName = p["LayerBuffName"]
		--local TempBuffValue = p["MaximumLayerBuff"]
		
		local id = p["NewLayerBuffId"] or 0;
		local TempBuffName = "GetSpellInfo("..id ..")";
		local TempBuffValue = p["MaximumLayerBuff"];
		
		p["Code"]='ambn(' .. TempBuffName .. ',unit,2,0) >='.. TempBuffValue .. ',ambn(' .. TempBuffName .. ',unit,2,0)';		
		--p["Code"]='ambn("' .. TempBuffName .. '",unit,2,0) >='.. TempBuffValue .. ',ambn("' .. TempBuffName .. '",unit,2,0)';
				
		
	
	elseif p["isRadio"]=="CodeChecked" then
	
		p["Code"]= p["MaximumCode"] ;
	
	end
	
		
	

end

function addon:Minimum_Generation(p)
	
	--local p = v["AmminimumFast"]["Minimum"];
	p["CodeFunction"]=nil;
	
	p["Code"]=nil;
	
	if p["isRadio"]=="MinimumBlood" then
		
		p["Code"]="aml(unit)<=" .. p["MinimumBloodValue"] .. ',aml(unit)';
		
	elseif p["isRadio"]=="MinimumBloodPercentage" then
		
		p["Code"]='aml(unit,"%")<=' .. p["MinimumBloodPercentageValue"] .. ',aml(unit,"%")';
		
	elseif p["isRadio"]=="MinimumEnergy" then
	
		p["Code"]='amr(unit)<=' .. p["MinimumEnergyValue"] .. ',amr(unit)';
	
	elseif p["isRadio"]=="MinimumEnergyPercentage" then
	
		p["Code"]='amr(unit,"%")<=' .. p["MinimumEnergyPercentageValue"] .. ',amr(unit,"%")';
	
	elseif p["isRadio"]=="MinimumDistance" then
	
		p["Code"]='amjl(unit)<=' .. p["MinimumDistanceValue"] .. ',amjl(unit)';
		
	elseif p["isRadio"]=="MinimumLayerBuffChecked" then
	
		--local TempBuffName = p["LayerBuffName"]
		local id = p["NewLayerBuffId"] or 0;
		local TempBuffName = "GetSpellInfo("..id ..")";
		local TempBuffValue = p["MinimumLayerBuff"];
				
		p["Code"]='ambn(' .. TempBuffName .. ',unit,2,0) <='.. TempBuffValue .. ',ambn(' .. TempBuffName .. ',unit,2,0)';
				
		
	elseif p["isRadio"]=="CodeChecked" then
	
		p["Code"]= p["MinimumCode"] ;
	
	end
	
	
	
end



function addon:FormatTooltipText(text)
	if not text then
		return;
	end
	
	return "|cff00ff00" .. text .. "|r";
end

function addon:err(text)
	text = "|cffff0000注意：|r" .. text;
	print(text);
end

function addon:AddCustomizeTarget(text)
	
	if not text or text == "" then return; end;
	
	local name = "|cffCD96CD"..text;
	
	if RDB[name] then
		addon:err(name .. "|r名称已经被使用！")
		return false;
	end
	

	
	if not RDB[name] then
		RDB[name]={};
	end	
	
	if not UnitDB["CustomizeIndex"] then
		UnitDB["CustomizeIndex"]=1;
	else
		UnitDB["CustomizeIndex"] = UnitDB["CustomizeIndex"]+1;
	end
	
	local tbl = RDB[name];
	
	tbl["raidn"]=(100 + UnitDB["CustomizeIndex"] ) * -1;
	
	tbl["unit"]="";
	tbl["subgroup"]=-2;
	tbl["class"]="";
	tbl["englishClass"]="";
	
	tbl["Remarks"]="";
	tbl["function"]="";
	tbl["Script"]="";
	tbl["ScriptName"]="";
	tbl["ScriptNameText"]="";
	
	
	tbl.types = "AmminimumFast";
	tbl["AmminimumFast"]={};
	tbl=tbl["AmminimumFast"];	
	
	tbl["group"]="partyraid";
	tbl["Distancevalue"]=30;
	tbl["SpellDistanceChecked"]=true;
	tbl["GhostChecked"] = true;
	tbl["ExcludedTarget"]={};
	
	tbl["Minimum"]={};
	tbl["Minimum"]["MinimumLayerBuff"]=0;
	tbl["Minimum"]["LayerBuffName"]="";
	tbl["Minimum"]["LayerBuffIcon"]="";
	
	tbl["Maximum"]={};
	
	-----------------------------------
	
	tbl["NewNobuff"]={};
	tbl["NewNobuff"]["IsOrAnd"]="Or";
	tbl["NewNobuff"]["buffs"]={};
	
	tbl["NewBuff"]={};
	tbl["NewBuff"]["IsOrAnd"]="Or";
	tbl["NewBuff"]["buffs"]={};
	DropDownMenu:Refresh(1);
	
end


function addon:CustomizeTargetList_GetTarget_EditUnit(i,newtext)
	
	RDB[i]["unit"] = newtext;
	DropDownMenu:Refresh(1);	
end

function addon:CustomizeTargetList_GetTarget_EditFunction(i,newtext)

	RDB[i]["function"] = newtext;
	DropDownMenu:Refresh(1);		
end

function addon:AmminimumFastAddTargetLayer(value)
	
	local v = value[1];
	
	if IsControlKeyDown() then
		
		v["TargetLayer"] = (v["TargetLayer"] or 0) +1;
		DropDownMenu:Refresh(value[2]);
		
	elseif IsAltKeyDown() then
		
		v["TargetLayer"] = (v["TargetLayer"] or 0) -1;
		
		if v["TargetLayer"] < 0 then
			v["TargetLayer"]=0;
		end
		DropDownMenu:Refresh(value[2]);
	end
	
	
	
	
end


function addon:CustomizeTargetListGetTargetAmminimumFastSetGroupMultitasking_Time_Value(tbl,v)

	tbl["MultitaskingTime"]=v;
	DropDownMenu:Refresh(4)	;
end


function addon:AmminimumFastSetGroupExcludedTarget_ADD_EditUnit(v,v1)
	
	
	RDB[v]["AmminimumFast"]["ExcludedTarget"][v1]=true;
	DropDownMenu:Refresh(4);
	
end	


function addon:CustomizeTargetListGetTargetAmminimumFastSetGroup_SpellDistancechecked(i)
	
	local AMF = RDB[i]["AmminimumFast"];
	
	AMF["SpellDistanceChecked"] = true;
	AMF["DistanceChecked"] = false;
	AMF["NoDistanceChecked"] = false;
	
	DropDownMenu:Refresh(3);
	
end	

function addon:CustomizeTargetListGetTargetAmminimumFastSetGroup_Distancechecked(i)
	
	local AMF = RDB[i]["AmminimumFast"];
	
	AMF["SpellDistanceChecked"] = false;
	AMF["DistanceChecked"] = true;
	AMF["NoDistanceChecked"] = false;
	
	DropDownMenu:Refresh(3);
	
end	

function addon:CustomizeTargetListGetTargetAmminimumFastSetGroup_NoDistancechecked(i)
	
	local AMF = RDB[i]["AmminimumFast"];
	
	AMF["SpellDistanceChecked"] = false;
	AMF["DistanceChecked"] = false;
	AMF["NoDistanceChecked"] = true;
	
	
	DropDownMenu:Refresh(3);
	
end

function addon:Default_AddBuff(Value,Text)
	
	--print(Value,Text)
	local Default_AddBuff = SuperTreatment["Menu"]["Main"]["DropDownMenu"].menuRequestObject.Default_AddBuff;
	
	Default_AddBuff(self,Value,Text);
	DropDownMenu:Refresh(3);
	
end


function addon:LayerBuff_AddBuff(Value,Text)
	
	
	local Default_AddBuff = SuperTreatment["Menu"]["Main"]["DropDownMenu"].menuRequestObject.Default_AddBuff;
	
	local id = Default_AddBuff(self,{},Text);
	
	if id then
		Value[1][Value[2]]=id;
	end
	
	addon:Minimum_Generation(Value[4]);
	
	DropDownMenu:Refresh(Value[3]);
	
end

function addon:LayerBuff_Max_AddBuff(Value,Text)
	
	
	local Default_AddBuff = SuperTreatment["Menu"]["Main"]["DropDownMenu"].menuRequestObject.Default_AddBuff;
	
	local id = Default_AddBuff(self,{},Text);
	
	if id then
		Value[1][Value[2]]=id;
	end
	
	addon:Maximum_Generation(Value[4]);
	
	DropDownMenu:Refresh(Value[3]);
	
end



function addon:CustomizeTargetListGetTargetAmminimumFastMinimumFireHasBeenSetValue(v,v1)

	RDB[v]["AmminimumFast"]["FireHasBeenSetValue"]=v1;
	DropDownMenu:Refresh(2);
	

end

function addon:AmminimumFastSetGroupSelectedTarget(v)

	local valueB = v[1];
	local name = v[2];
	local color = v[3];
	local englishClass = v[4];
	
	if RDB[valueB]["AmminimumFast"]["Group_SelectedTarget"]["name"] == name then
		RDB[valueB]["AmminimumFast"]["Group_SelectedTarget"]["name"]=nil;
		DropDownMenu:Refresh(2);
		return;
	end
	
	if not RDB[valueB]["AmminimumFast"]["Group_SelectedTarget"] then
		RDB[valueB]["AmminimumFast"]["Group_SelectedTarget"]={};
	end
	
	local T = RDB[valueB]["AmminimumFast"]["Group_SelectedTarget"];
	T["name"]= name;
	T["color"]= color;
	T["englishClass"]= englishClass;
	
	DropDownMenu:Refresh(2);
	

end




function addon:Del_Tbl_Index(v1,v2)
	
	table.remove(v1[1], v1[2]) 
	--DropDownMenu:Refresh(v1[3] or 1);
	local Level = DropDownMenu:GetGlobalLevel(v1[3]);
	DropDownMenu:GlobaRefresh(Level)
	DropDownMenu:GlobaClose(false,v1[3],1);
end

function addon:CustomizeTargetListGetTargetAmminimumFastSetGroup_Distancevalue(v,v1)
	
	local AMF = RDB[v]["AmminimumFast"];
	
	AMF["Distancevalue"] = v1;
	
	
	DropDownMenu:Refresh(3);
	
end


function addon:AmminimumFastMinimum_LayerBuffName_Edit(Value,Text)
	
	local id,v,v1;
	if not Text then
		
		v1=Value[1]["name"];
		v=Value[3][1];
		id=Value[2];
	
	else
		v=Value;
		v1=Text;
	end
	
	RDB[v]["AmminimumFast"]["Minimum"]["LayerBuffName"] = v1;
	
	local Texture="";
	local spellid ;
	
	
	if id then
		spellid = id
		_,_,Texture=GetSpellInfo(spellid)
	else
		spellid,_,_,Texture = amfindSpellItemInf(v1);
	end
		
	
	RDB[v]["AmminimumFast"]["Minimum"]["LayerBuffIcon"] = Texture;
	RDB[v]["AmminimumFast"]["Minimum"]["LayerBuffIconId"] = spellid;		
	
	DropDownMenu:Refresh(5);
	
end	


--------------------------------------------------------------------

function addon:OnMenuRequest(level, value, menu, MenuEx,GlobalLevel)
	
	
	
	if level == 1 then -- 1级菜单内容
	
		local Type = MenuEx.ExternalData[1] or false;
		local SpellTbl = MenuEx.ExternalData[2];
		local SpellIndex = MenuEx.ExternalData[3];
		local FuncName = MenuEx.ExternalData[4] or false;
		
		ST = SuperTreatmentInf;
		RDB = SuperTreatmentDBF["Unit"]["RaidList"];
		UnitDB =SuperTreatmentDBF["Unit"];
		
		if Type=="Select" or Type=="Edit" then
		
			local str = "|cff00ff00请确认新名称不在列表中。"
			menu:AddLine("text", "|cff00ffff新建目标","hasEditBox", 1, "editBoxText", self.text,
			"editBoxFunc", "AddCustomizeTarget", "editBoxArg1", self,"tooltipText",str,"tooltipTitle",
			"新建目标","icon","INTERFACE\\ICONS\\Ability_Hunter_SniperShot")
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
		
		end
		
		local i = 1;
		
		
		for k,v in sortedpairs(RDB, function(a,b) return RDB[a]["raidn"] > RDB[b]["raidn"];end) do
		
			if v["subgroup"] == -2 then
			
				local tbl={};
				tbl.CustomizeTarget={};
				local ex = tbl.CustomizeTarget;
				ex.fun = function() 
				DropDownMenu:Refresh(level);				
				end; 
				
				ex.arg1 = RDB;
				ex.text =k;
				
				local name = v["name"] or k;
				
				
				
				local index = k;
			--**--
				if not RDB[index].types then
			
					if RDB[index]["unitchecked"] then
						
						RDB[index].types="unit";
						
					elseif RDB[index]["functionchecked"] then
					
						RDB[index].types="function";
						
					elseif RDB[index]["AmminimumFastchecked"] then
					
						RDB[index].types="AmminimumFast";
					
					else
						RDB[index].types = "AmminimumFast";
					end
				
				end
				
				local text ="\n\n|r注意：通过鼠标右键改变属性。"
				
				if Type=="Select" then
					

					local dbf = SpellTbl[SpellIndex] ;
					
					if RDB[index].types=="unit" then
					
						local str = addon:FormatTooltipText("如：player,target,focus,小可爱");
						str = str .. text;
						
						menu:AddLine("text", "|TINTERFACE\\ICONS\\Ability_Hunter_MarkedForDeath:13|t|cff104E8B " .. i .. ". |cffffffff" .. name,
						"hasEditBox", 1, "editBoxText", RDB[index]["unit"], "editBoxFunc", "CustomizeTargetList_GetTarget_EditUnit", "editBoxArg1", self,"editBoxArg2", index,
						"tooltipText",str,"tooltipTitle","目标名称",
						"OpenRightMenu",SuperTreatment["Menu"]["OpenRightMenu"],
						"OpenRightMenuValue",tbl,
						"func",FuncName,"arg1", self,"arg2",{v,k},
						"isRadio",nil,"checked",dbf.unit == k
						);
					
					elseif RDB[index].types=="function" then
					
						local str = addon:FormatTooltipText("把函数返回值（字符串）设为目标");
						str = str .. text;
						
						menu:AddLine("text", "|TINTERFACE\\ICONS\\Ability_Hunter_MasterMarksman:13|t|cff104E8B " .. i .. ". |cffffffff" .. name,
						"hasEditBox", 1, "editBoxText", RDB[index]["function"], "editBoxFunc", "CustomizeTargetList_GetTarget_EditFunction",
						"editBoxArg1", self,"editBoxArg2", index,
						"tooltipTitle","函数设定目标","tooltipText",str,
						"OpenRightMenu",SuperTreatment["Menu"]["OpenRightMenu"],
						"OpenRightMenuValue",tbl,
						
						"func",FuncName,"arg1", self,"arg2",{v,k},
						"isRadio",nil,"checked",dbf.unit == k
						);
					
					elseif RDB[index].types=="AmminimumFast" then
					
						local str = addon:FormatTooltipText("通过模板的设定获得目标,非常简单的从一堆目标里找出你需要的目标");
						str = str .. text;
						
						menu:AddLine("text", "|TINTERFACE\\ICONS\\Ability_Hunter_Pathfinding:13|t|cff104E8B " .. i .. ". |cffffffff" .. name ,"hasArrow", 1, "value", {"CustomizeTargetListGetTargetAmminimumFast",index},
						"tooltipTitle","模板设定目标","tooltipText",str,
						"OpenRightMenu",SuperTreatment["Menu"]["OpenRightMenu"],
						"OpenRightMenuValue",tbl,
						
						"func",FuncName,"arg1", self,"arg2",{v,k},
						"isRadio",nil,"checked",dbf.unit == k
						);
						
					elseif RDB[index].types=="RangeCheckAngle" then
					
						local str = addon:FormatTooltipText("通过模板的设定获得目标,非常简单的从一堆目标里找出你需要的目标");
						str = str .. text;
						
						menu:AddLine("text", "|TINTERFACE\\ICONS\\SPELL_WARLOCK_DEMONSOUL:13|t|cff104E8B" .. i .. ". |cffffffff" .. name ,"hasArrow", 1, "value", {"CustomizeTargetListGetTargetAmminimumFast",index},
						"tooltipTitle","模板设定目标","tooltipText",str,
						"OpenMenu",SuperTreatment["Menu"]["RangeCheckAngleMenu"],
						"OpenMenuValue",{RDB[index],nil,"Target"},
						--"icon","INTERFACE\\ICONS\\SPELL_WARLOCK_DEMONSOUL",
						"OpenRightMenu",SuperTreatment["Menu"]["OpenRightMenu"],
						"OpenRightMenuValue",tbl,
						"func",FuncName,"arg1", self,"arg2",{v,k},
						"isRadio",nil,"checked",dbf.unit == k
						
						);
						
					end
					menu:AddLine("line",1,"LineHeight",5);
				
				elseif (Type=="Target" and SpellTbl == k) or Type=="Edit" then 
					
					if RDB[index].types=="unit" then
					
						local str = addon:FormatTooltipText("如：player,target,focus,小可爱");
						str = str .. text;
						
						menu:AddLine("text", "|cff104E8B" .. i .. ". |cffffffff" .. name,
						"hasEditBox", 1, "editBoxText", RDB[index]["unit"], "editBoxFunc", "CustomizeTargetList_GetTarget_EditUnit", "editBoxArg1", self,"editBoxArg2", index,
						"tooltipText",str,"tooltipTitle","目标名称",
						"OpenRightMenu",SuperTreatment["Menu"]["OpenRightMenu"],
						"OpenRightMenuValue",tbl,
						"icon","INTERFACE\\ICONS\\Ability_Hunter_MarkedForDeath"
						);
					
					elseif RDB[index].types=="function" then
					
						local str = addon:FormatTooltipText("把函数返回值（字符串）设为目标");
						str = str .. text;
						
						menu:AddLine("text", "|cff104E8B" .. i .. ". |cffffffff" .. name,
						"hasEditBox", 1, "editBoxText", RDB[index]["function"], "editBoxFunc", "CustomizeTargetList_GetTarget_EditFunction",
						"editBoxArg1", self,"editBoxArg2", index,
						"tooltipTitle","函数设定目标","tooltipText",str,
						"OpenRightMenu",SuperTreatment["Menu"]["OpenRightMenu"],
						"OpenRightMenuValue",tbl,
						"icon","INTERFACE\\ICONS\\Ability_Hunter_MasterMarksman"
						);
					
					elseif RDB[index].types=="AmminimumFast" then
					
						local str = addon:FormatTooltipText("通过模板的设定获得目标,非常简单的从一堆目标里找出你需要的目标");
						str = str .. text;
						
						menu:AddLine("text", "|cff104E8B" .. i .. ". |cffffffff" .. name ,"hasArrow", 1, "value", {"CustomizeTargetListGetTargetAmminimumFast",index},
						"tooltipTitle","模板设定目标","tooltipText",str,
						"OpenRightMenu",SuperTreatment["Menu"]["OpenRightMenu"],
						"OpenRightMenuValue",tbl,
						"icon","INTERFACE\\ICONS\\Ability_Hunter_Pathfinding",
						"func",FuncName,"arg1", self,"arg2",{v,k}
						);
					
					elseif RDB[index].types=="RangeCheckAngle" then
					
						local str = addon:FormatTooltipText("通过模板的设定获得目标,非常简单的从一堆目标里找出你需要的目标");
						str = str .. text;
						
						menu:AddLine("text", "|cff104E8B" .. i .. ". |cffffffff" .. name ,"hasArrow", 1, "value", {"CustomizeTargetListGetTargetAmminimumFast",index},
						"tooltipTitle","模板设定目标","tooltipText",str,
						"OpenMenu",SuperTreatment["Menu"]["RangeCheckAngleMenu"],
						"OpenMenuValue",{RDB[index],nil,"Target"},
						"icon","INTERFACE\\ICONS\\SPELL_WARLOCK_DEMONSOUL",
						"OpenRightMenu",SuperTreatment["Menu"]["OpenRightMenu"],
						"OpenRightMenuValue",tbl,
						"func",FuncName,"arg1", self,"arg2",{v,k}
						
						);
						
						
					end
					
					menu:AddLine("line",1,"LineHeight",5);
				end
				
				i=i+1;
				
			end
		end
		
	elseif level == 2 then -- 2级菜单内容
		
		if value[1] == "CustomizeTargetListGetTargetAmminimumFast" then
			
			local index = value[2];
			if not RDB[index]["AmminimumFast"] then
				RDB[index]["AmminimumFast"]={};
				
			end
			
			local tbl = RDB[index]["AmminimumFast"];
			
			tbl.NewNobuff.buffindex=nil;
			tbl.NewBuff.buffindex=nil;
			
			local str = addon:FormatTooltipText("影响当前层及所有子菜单的判断目标。")
			
			menu:AddLine("text", "|cffffff00设定目标范围" ,"hasArrow", 1, "value",
			{"CustomizeTargetListGetTargetAmminimumFastSetGroup" , index},
			"tooltipText",str,"tooltipTitle","信息"
			);
			
			menu:AddLine("line",1,"LineHeight",8);
			
			local group = tbl["group"];
			local groupname = stGetTargetContrast(group) or "";
			
			local TargetLayer = tbl["TargetLayer"] or 0;
			local TargetLayerText="";
			
			for n=1,TargetLayer do
				TargetLayerText = TargetLayerText .. "|cffff0000-|r目标"
			end
			
			local str = "|r增减目标:\n\n"
			str = str .. "|cffff0000增加目标: |cffffffffCtrl + 鼠标左键";
			str = str .. "\n|cffff0000减小目标: |cffffffffAlt  + 鼠标左键";
		
	
			menu:AddLine("text", "|cffff0000>|cff00ff00" .. groupname.. TargetLayerText .. "|cffff0000<","justifyH","RIGHT",
			"func", "AmminimumFastAddTargetLayer", "arg1", self, "arg2", {tbl,level},
			"tooltipText",str,"tooltipTitle","信息");
			
			
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
			
			local str = addon:FormatTooltipText("设定需要满足条件的Buff。\n\n|r如:需要补的Buff。")
			
			menu:AddLine("text", "|cffffff00设定Buff条件" ,"hasArrow", 1, "value", 
			{"CustomizeTargetListGetTargetAmminimumFastSetBuff",index},
			"checked",tbl["buffchecked"],"func", "SetTbl","arg1", self,
			"arg2", {tbl,"buffchecked",not tbl.buffchecked},
			"tooltipText",str,"tooltipTitle","信息"
			);
			
			menu:AddLine("line",1,"LineHeight",8);
			
			local str = addon:FormatTooltipText("设定需要排除的Buff。\n\n|r如:有无敌的时候我不攻击。")
			
			menu:AddLine("text", "|cffffff00排除的Buff" ,"hasArrow", 1, "value", {"CustomizeTargetListGetTargetAmminimumFastSetNoBuff",index},
			"checked",tbl["Nobuffchecked"],"func", "SetTbl","arg1", self,
			"arg2", {tbl,"Nobuffchecked",not tbl.Nobuffchecked},
			"tooltipText",str,"tooltipTitle","信息"
			);
			
			menu:AddLine("line",1,"LineHeight",8);
			
			
			menu:AddLine("text", "|cffffff00读条技能" ,"hasArrow", 1,
			"OpenMenu",SuperTreatment["Menu"]["SetIsSpellMenu"] ,"OpenMenuValue",{tbl},
			"checked",tbl["spellchecked"],"func", "SetTbl",
			"arg1", self,"arg2", {tbl,"spellchecked",not tbl.spellchecked}
			);
			
			--[[
			menu:AddLine("text", "|cffffff00读条技能" ,"hasArrow", 1, "value", 
			{"CustomizeTargetListGetTargetAmminimumFastSetSpell",index},
			"checked",tbl["spellchecked"],"func", "SetTbl",
			"arg1", self,"arg2", {tbl,"spellchecked",not tbl.spellchecked}
			);
			--]]
			menu:AddLine("line",1,"LineHeight",8);
			
			menu:AddLine("text", "|cffffff00排除的职业" ,"hasArrow", 1, "value", 
			{"CustomizeTargetListGetTargetAmminimumFastClass" ,index},
			"checked",tbl["Classchecked"],
			"func", "SetTbl","arg1", self,"arg2",
			{tbl,"Classchecked",not tbl.Classchecked}
			);
			
			menu:AddLine("line",1,"LineHeight",8);
			
			menu:AddLine("text", "|cffffff00获得最小的" ,"hasArrow", 1, "value",
			{"CustomizeTargetListGetTargetAmminimumFastMinimum", index},
			"checked",tbl["Minimumchecked"],
			"func", "SetTbl","arg1", self,"arg2",
			{tbl,"Minimumchecked",not tbl.Minimumchecked}
			);
			
			menu:AddLine("line",1,"LineHeight",8);

			menu:AddLine("text", "|cffffff00获得最大的" ,"hasArrow", 1, "value",
			{"CustomizeTargetListGetTargetAmminimumFastMaximum",index},
			"checked",tbl["Maximumchecked"],"func", "SetTbl","arg1", self,"arg2",
			{tbl,"Maximumchecked",not tbl.Maximumchecked}
			);
			
			menu:AddLine("line",1,"LineHeight",8);

			menu:AddLine("text", "|cffffff00获得符合条件数量" ,"hasArrow", 1, "value", 
			{"CustomizeTargetListGetTargetAmminimumFastCount" ,index},
			"checked",tbl["Countchecked"],"func", "SetTbl","arg1", self,"arg2", 
			{tbl,"Countchecked",not tbl.Countchecked}
			);
			
			
			menu:AddLine("line",1,"LineHeight",8);
			
			local str = addon:FormatTooltipText("从代码返回表达式结果作为条件。\n内部变量 unit 是目标的ID。");
				menu:AddLine("text", "|cffffff00从代码获得|r","hasEditBox", 1, "editBoxText", tbl["Code"], "editBoxFunc", "SetSlider", "editBoxArg1", self,"editBoxArg2", 
				{tbl,"Code",level},
				"tooltipText",str,"checked",tbl["CodeChecked"],"func", "SetTbl","arg1", self,"arg2", 
				{tbl,"CodeChecked",not tbl.CodeChecked},
				"tooltipTitle","从代码获得"
				);
						
			
			--menu:AddLine("line",1,"LineHeight",8);
			
			local TBL = tbl;
			if not TBL["ApiDbf"] then
				TBL["ApiDbf"]={};
			end
			SuperTreatment["type"]="NoRun"
			addon:Menu_SuperTreatmentApiList(level, value, menu,TBL,GlobalLevel);
		
			
			
		
		end
		
	elseif level == 3 then -- 2级菜单内容
		
		
		if value[1] == "CustomizeTargetListGetTargetAmminimumFastCount" then
			
			local index = value[2];
			local TBL = RDB[index]["AmminimumFast"];
			
			menu:AddLine("text", "条件数量","isTitle",1);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			
			str = addon:FormatTooltipText("如判断所有队友其中是否有癒合祷言,当没这BUFF时，条件為假没目标返回。\n|r现在我们需要当所有人都没这BUFF时就补上，这时我们就需要判断条件為假的统计数量，当数量為0时我们就补上这BUFF。\n\n这个时候就要选择该项了。");
			menu:AddLine("text", "计算其它判断為假的数量" , 
			"checked",TBL["CountFalseChecked"],
			"func", "SetTbl","arg1", self,"arg2", 
			{TBL,"CountFalseChecked",not TBL.CountFalseChecked},
			"tooltipTitle","计算其它判断為假的数量","tooltipText",str
				);
				
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			if not TBL["Count"] then
			
				TBL["Count"]={};
				TBL["Count"]["<"]={};
				TBL["Count"][">"]={};
			end
			
						
			local tbl =TBL["Count"];
			local MaxValue=50;
			
			if not tbl["<"]["Value"] then
				tbl["<"]["Value"]=0;
			end
			
			if not tbl[">"]["Value"] then
				tbl[">"]["Value"]=0;
			end
			
			
			
			menu:AddLine("text", "|cffffffff数量(|cffff0000<=" .. tbl["<"]["Value"]  .."|cffffffff)" , 
			"checked",tbl["<"]["checked"],"func", "SetTbl","arg1", self,"arg2",
			{tbl["<"],"checked",not tbl["<"].checked,level},
			"hasSlider", 1, "sliderValue",  tbl["<"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			"SetSlider", "sliderArg1",self,"sliderArg2",
			{tbl["<"],"Value",level}
			);
			
			menu:AddLine("line",1);
						
			menu:AddLine("text", "|cffffffff数量(|cffff0000>=" .. tbl[">"]["Value"]  .."|cffffffff)",
			"checked",tbl[">"]["checked"],"func","SetTbl","arg1", self,"arg2",
			{tbl[">"],"checked",not tbl[">"].checked,level},
			"hasSlider", 1, "sliderValue",tbl[">"]["Value"], "sliderMin", 0, "sliderMax", MaxValue, "sliderStep", 1, "sliderFunc",
			"SetSlider" , "sliderArg1", self,"sliderArg2",
			{tbl[">"],"Value",level}
			);
		
			
			
			
		
		elseif value[1] == "CustomizeTargetListGetTargetAmminimumFastMaximum" then
			
			menu:AddLine("text", "获得最大的","isTitle",1);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			
			local index = value[2];
			local tbl = RDB[index]["AmminimumFast"];
			
			if not tbl["Maximum"] then

				tbl["Maximum"]={};
			end

			local checked = tbl["Maximum"];

			local value = tbl["Maximum"];

			if not value["MaximumBloodValue"] then
				value["MaximumBloodValue"]=1000000/2;
			end

			if not value["MaximumBloodPercentageValue"] then
				value["MaximumBloodPercentageValue"]=50;
			end

			if not value["MaximumEnergyValue"] then
				value["MaximumEnergyValue"]=1000000/2;
			end

			if not value["MaximumEnergyPercentageValue"] then
				value["MaximumEnergyPercentageValue"]=50;
			end

			if not value["HealthMaxValue"] then
				value["HealthMaxValue"]=0;
			end
			
			if not value["HealthMaxPercentageValue"] then
				value["HealthMaxPercentageValue"]=0;
			end
			

			menu:AddLine("text", "|cffffffff最大血量(|cffff0000>=" .. value["HealthMaxValue"]  .."|cffffffff)","isRadio", 1,"checked",
			checked["isRadio"]=="HealthMax",
			"func", "SetTblMaxMG","arg1", self,"arg2", 
			{checked,"isRadio","HealthMax",level,value},
			"hasSlider", 1, "sliderValue", value["HealthMaxValue"], "sliderMin", 0, "sliderMax", 100000000, "sliderStep", 1, "sliderFunc", "SetSliderMaxMG", "sliderArg1", self,"sliderArg2", 
			{value,"HealthMaxValue",level,value}
			);
			
			menu:AddLine("text", "|cffffffff最大血量(|cffff0000>=" .. value["HealthMaxPercentageValue"]  .."%|cffffffff)","isRadio", 1,"checked",
			checked["isRadio"]=="HealthMaxPercentage",
			"func", "SetTblMaxMG","arg1", self,"arg2", 
			{checked,"isRadio","HealthMaxPercentage",level,value},
			"hasSlider", 1, "sliderValue", value["HealthMaxPercentageValue"], "sliderMin", 0, "sliderMax", 100, "sliderStep", 1, "sliderFunc", "SetSliderMaxMG", "sliderArg1", self,"sliderArg2", 
			{value,"HealthMaxPercentageValue",level,value}
			);


			menu:AddLine("text", "|cffffffff最大缺血量(|cffff0000>=" .. value["MaximumBloodValue"]  .."|cffffffff)","isRadio", 1,"checked",
			checked["isRadio"]=="MaximumBlood",
			"func", "SetTblMaxMG","arg1", self,"arg2", 
			{checked,"isRadio","MaximumBlood",level,value},
			"hasSlider", 1, "sliderValue", value["MaximumBloodValue"], "sliderMin", 0, "sliderMax", 1000000, "sliderStep", 1, "sliderFunc", "SetSliderMaxMG", "sliderArg1", self,"sliderArg2", 
			{value,"MaximumBloodValue",level,value}
			);

			menu:AddLine("text", "|cffffffff最大缺血量(|cffff0000>=" .. value["MaximumBloodPercentageValue"]  .."%|cffffffff)","isRadio", 1,"checked",
			checked["isRadio"]=="MaximumBloodPercentage",
			"func", "SetTblMaxMG","arg1", self,"arg2", 
			{checked,"isRadio","MaximumBloodPercentage",level,value},
			"hasSlider", 1, "sliderValue", value["MaximumBloodPercentageValue"], "sliderMin", 0, "sliderMax", 100, "sliderStep", 1, "sliderFunc", "SetSliderMaxMG", "sliderArg1", self,"sliderArg2", 
			{value,"MaximumBloodPercentageValue",level,value}
			);


			menu:AddLine("text", "|cffffffff最大缺能量(|cffff0000>=" .. value["MaximumEnergyValue"]  .."|cffffffff)","isRadio", 1,"checked",
			checked["isRadio"]=="MaximumEnergy",
			"func", "SetTblMaxMG","arg1", self,"arg2", 
			{checked,"isRadio","MaximumEnergy",level,value},
			"hasSlider", 1, "sliderValue", value["MaximumEnergyValue"], "sliderMin", 0, "sliderMax", 1000000, "sliderStep", 1, "sliderFunc", "SetSliderMaxMG", "sliderArg1", self,"sliderArg2",
			{value,"MaximumEnergyValue",level,value}
			);


			menu:AddLine("text", "|cffffffff最大缺能量(|cffff0000>=" .. value["MaximumEnergyPercentageValue"]  .."%|cffffffff)","isRadio", 1,"checked",
			checked["isRadio"]=="MaximumEnergyPercentage",
			"func", "SetTblMaxMG","arg1", self,"arg2", 
			{checked,"isRadio","MaximumEnergyPercentage",level,value},
			"hasSlider", 1, "sliderValue", value["MaximumEnergyPercentageValue"], "sliderMin", 0, "sliderMax", 100, "sliderStep", 1, "sliderFunc", "SetSliderMaxMG", "sliderArg1", self,"sliderArg2", 
			{value,"MaximumEnergyPercentageValue",level,value}
			);


			

			if not value["MaximumLayerBuff"] then

				value["MaximumLayerBuff"]=0;
			end

			menu:AddLine("text", "|cffffffff最大Buff层数(|cffff0000>=" .. value["MaximumLayerBuff"]  .."|cffffffff)", "hasArrow", 1, "value",
			{"CustomizeTargetListGetTargetAmminimumFastMaximumLayerBuff",index},
			"isRadio", 1,"checked",
			checked["isRadio"]=="MaximumLayerBuffChecked",
			"func", 
			"SetTblMaxMG","arg1", self,"arg2",
			{checked,"isRadio","MaximumLayerBuffChecked",level,value}
			);





			str = addon:FormatTooltipText("从代码返回表达式（字符串）结果作为条件，需要返回2个值。\n第1个是条件表达式的结果。\n第2个是表达式的结果为数值作为判断最小值的依据。\n内部变量 unit 是目标的ID。");
				menu:AddLine("text", "|cffffffff从代码获得|r","isRadio", 1,"hasEditBox", 1, "editBoxText", value["MaximumCode"], "editBoxFunc", "SetSliderMaxMG", "editBoxArg1", self,"editBoxArg2",
				{value,"MaximumCode",level,value},
				"tooltipText",str,"checked",
				checked["isRadio"]=="CodeChecked",
				"func", "SetTblMaxMG","arg1", self,"arg2", 
				{checked,"isRadio","CodeChecked",level,value},
				"tooltipTitle","从代码获得");
		
		
		elseif value[1] == "CustomizeTargetListGetTargetAmminimumFastMinimum" then
		
			menu:AddLine("text", "获得最小的","isTitle",1);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			
			local index = value[2];
			local tbl = RDB[index]["AmminimumFast"];
			
			if not tbl["Minimum"] then

				tbl["Minimum"]={};
			end

			local checked = tbl["Minimum"];

			local value = tbl["Minimum"];

			if not value["MinimumBloodValue"] then
				value["MinimumBloodValue"]=1000000/2;
			end

			if not value["MinimumBloodPercentageValue"] then
				value["MinimumBloodPercentageValue"]=50;
			end

			if not value["MinimumEnergyValue"] then
				value["MinimumEnergyValue"]=1000000/2;
			end

			if not value["MinimumEnergyPercentageValue"] then
				value["MinimumEnergyPercentageValue"]=50;
			end

			if not value["MinimumDistanceValue"] then
				value["MinimumDistanceValue"]=25;
			end




			menu:AddLine("text", "|cffffffff最小血量(|cffff0000<=" .. value["MinimumBloodValue"]  .."|cffffffff)","isRadio", 1,"checked",
			checked["isRadio"]=="MinimumBlood",
			"func", "SetTblMG","arg1", self,"arg2", 
			{checked,"isRadio","MinimumBlood",level,value},
			"hasSlider", 1, "sliderValue", value["MinimumBloodValue"], "sliderMin", 0, "sliderMax", 1000000, "sliderStep", 1, "sliderFunc", "SetSliderMG", "sliderArg1", self,"sliderArg2", 
			{value,"MinimumBloodValue",level,value}
			);
			
			menu:AddLine("text", "|cffffffff最小血量(|cffff0000<=" .. value["MinimumBloodPercentageValue"]  .."%|cffffffff)","isRadio", 1,"checked",
			checked["isRadio"]=="MinimumBloodPercentage",
			"func", "SetTblMG","arg1", self,"arg2", 
			{checked,"isRadio","MinimumBloodPercentage",level,value},
			"hasSlider", 1, "sliderValue", value["MinimumBloodPercentageValue"], "sliderMin", 0, "sliderMax", 100, "sliderStep", 1, "sliderFunc", "SetSliderMG", "sliderArg1", self,"sliderArg2", 
			{value,"MinimumBloodPercentageValue",level,value}
			);


			menu:AddLine("text", "|cffffffff最小能量(|cffff0000<=" .. value["MinimumEnergyValue"]  .."|cffffffff)","isRadio", 1,"checked",
			checked["isRadio"]=="MinimumEnergy",
			"func", "SetTblMG","arg1", self,"arg2", 
			{checked,"isRadio","MinimumEnergy",level,value},
			"hasSlider", 1, "sliderValue", value["MinimumEnergyValue"], "sliderMin", 0, "sliderMax", 1000000, "sliderStep", 1, "sliderFunc", "SetSliderMG", "sliderArg1", self,"sliderArg2",
			{value,"MinimumEnergyValue",level,value}
			);


			menu:AddLine("text", "|cffffffff最小能量(|cffff0000<=" .. value["MinimumEnergyPercentageValue"]  .."%|cffffffff)","isRadio", 1,"checked",
			checked["isRadio"]=="MinimumEnergyPercentage",
			"func", "SetTblMG","arg1", self,"arg2", 
			{checked,"isRadio","MinimumEnergyPercentage",level,value},
			"hasSlider", 1, "sliderValue", value["MinimumEnergyPercentageValue"], "sliderMin", 0, "sliderMax", 100, "sliderStep", 1, "sliderFunc", "SetSliderMG", "sliderArg1", self,"sliderArg2", 
			{value,"MinimumEnergyPercentageValue",level,value}
			);


			menu:AddLine("text", "|cffffffff最小距离内(|cffff0000<=" .. value["MinimumDistanceValue"]  .."|cffffffff)","isRadio", 1,"checked",
			checked["isRadio"]=="MinimumDistance",
			"func", "SetTblMG","arg1", self,"arg2", 
			{checked,"isRadio","MinimumDistance",level,value},
			"hasSlider", 1, "sliderValue", value["MinimumDistanceValue"], "sliderMin", 5, "sliderMax", 50, "sliderStep", 1, "sliderFunc", "SetSliderMG", "sliderArg1", self,"sliderArg2", 
			{value,"MinimumDistanceValue",level,value}
			);


			if not value["MinimumLayerBuff"] then

				value["MinimumLayerBuff"]=0;
			end

			menu:AddLine("text", "|cffffffff最小Buff层数(|cffff0000<=" .. value["MinimumLayerBuff"]  .."|cffffffff)", "hasArrow", 1, "value",
			{"CustomizeTargetListGetTargetAmminimumFastMinimumLayerBuff",index},
			"isRadio", 1,"checked",
			checked["isRadio"]=="MinimumLayerBuffChecked",
			"func", 
			"SetTblMG","arg1", self,"arg2",
			{checked,"isRadio","MinimumLayerBuffChecked",level,value}
			);





			str = addon:FormatTooltipText("从代码返回表达式（字符串）结果作为条件，需要返回2个值。\n第1个是条件表达式的结果。\n第2个是表达式的结果为数值作为判断最小值的依据。\n内部变量 unit 是目标的ID。");
				menu:AddLine("text", "|cffffffff从代码获得|r","isRadio", 1,"hasEditBox", 1, "editBoxText", value["MinimumCode"], "editBoxFunc", "SetSliderMG", "editBoxArg1", self,"editBoxArg2",
				{value,"MinimumCode",level,value},
				"tooltipText",str,"checked",
				checked["isRadio"]=="CodeChecked",
				"func", "SetTblMG","arg1", self,"arg2", 
				{checked,"isRadio","CodeChecked",level,value},
				"tooltipTitle","从代码获得");

		
		elseif value[1] == "CustomizeTargetListGetTargetAmminimumFastClass" then
			
			local index =value[2] ;
			local tbl = RDB[index]["AmminimumFast"];
			
			menu:AddLine("text", "排除的职业","isTitle",1);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			if not tbl["Class"] then
					
				tbl["Class"]={};
			end
			--[[
			for k, name in pairs(ClassName) do
				
				
				
				
				if not tbl["Class"][k] then
				
					tbl["Class"][k]=false;
				end
				
				
			
				local color,tc;
					
				
				color = RAID_CLASS_COLORS[k]
				tc = CLASS_BUTTONS[k]
							
				menu:AddLine(
				"icon", "Interface\\WorldStateFrame\\Icons-Classes",
				"tCoordLeft", tc[1],
				"tCoordRight", tc[2],
				"tCoordTop", tc[3],
				"tCoordBottom", tc[4],
				
				"text", name, "textR", color.r, "textG", color.g, "textB", color.b, "checked",tbl["Class"][k],"func", "SetTbl","arg1", self,
				"arg2", {tbl["Class"],k,not tbl["Class"][k]}
				);
				
				
			end
		
			--]]
			for k, name in pairs(ClassName) do
			
				local color = RAID_CLASS_COLORS[k]
				
				menu:AddLine("text",stGetClassicon(k,13)..name,
				"textR", color.r, "textG", color.g, "textB", color.b,
				"checked",tbl["Class"][k],
				"func", "SetTbl","arg1", self,"arg2",
				{tbl["Class"],k,not tbl["Class"][k]}
				
				);
				
				menu:AddLine("line",1);
				
			end
			
		
		elseif value[1] == "CustomizeTargetListGetTargetAmminimumFastSetSpell" then
		
			
			menu:AddLine("text", "读条技能","isTitle",1);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			local index =value[2] ;
			local tbl = RDB[index]["AmminimumFast"];
			
			
			if not tbl["NewSpell"] then
				tbl["NewSpell"]={};
			end
			
			
			local SpellValuePoorvalue = tbl["SpellValuePoorvalue"];
			local SpellValuePoorChecked = tbl["SpellValuePoorChecked"];
			if not SpellValuePoorvalue then
				SpellValuePoorvalue=0;
			end
			
			
			local str = addon:FormatTooltipText("技能读条的剩余时间。\n\n|r如：对方法师变形术还差N秒完成时，对其反制。");
			menu:AddLine("text", "|cffffffff剩余(|cffff0000<=" .. SpellValuePoorvalue  .."|cffffffff)秒时",
			"checked",SpellValuePoorChecked ,"func", "SetTbl","arg1", self,"arg2",
			{tbl,"SpellValuePoorChecked",not tbl.SpellValuePoorChecked,level},
			"hasSlider", 1,"sliderDecimals",1, "sliderValue", SpellValuePoorvalue, "sliderMin", 0, "sliderMax", 999, "sliderStep", 0.1, "sliderFunc", "SetSlider", "sliderArg1", self,"sliderArg2",
			{tbl,"SpellValuePoorvalue",level},
			"tooltipText",str,"tooltipTitle","说明"
			);
			
			menu:AddLine("line",1);
		
			local value =tbl["SpellValue"] or 0;
			local checked = tbl["SpellValueChecked"];
			
			local str = addon:FormatTooltipText("技能开始施放的读条时间。\n\n|r如：对方法师变形术施放N秒后，对其反制。");
			menu:AddLine("text", "|cffffffff施放(|cffff0000>=" .. value  .."|cffffffff)秒后", "checked",checked,"func", "SetTbl","arg1", self,"arg2", 
			{tbl,"SpellValueChecked",not tbl.SpellValueChecked,level},
			"hasSlider", 1,"sliderDecimals",1, "sliderValue", value, "sliderMin", 0, "sliderMax", 999, "sliderStep", 0.1, "sliderFunc", "SetSlider", "sliderArg1", self,"sliderArg2",
			{tbl,"SpellValue",level},
			"tooltipText",str,"tooltipTitle","说明")
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			local str = addon:FormatTooltipText("判断可以打断的技能那么你把该选项打勾。\n\n|r注意：当有列表时对其过滤，当选 [|cff00ffff忽略列表,判断任何技能|r] 时对任何技能过滤。");
			menu:AddLine("text", "|cffffff00可打断的技能","checked",tbl["InterruptChecked"],
			"func", "SetTbl","arg1", self,"arg2",
			{tbl,"InterruptChecked",not tbl.InterruptChecked,level},
			"tooltipText",str,"tooltipTitle","说明"
			);
			
			
			menu:AddLine("line",1);
			
			local str = addon:FormatTooltipText("比如你需要打断所有技能那么你把该选项打勾。");
			menu:AddLine("text", "|cffffff00忽略列表,判断任何技能","checked",tbl["AllSpell"],"func", "SetTbl","arg1", self,"arg2",
			{tbl,"AllSpell",not tbl.AllSpell,level},
			"tooltipText",str,"tooltipTitle","说明"
			);
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			
			local disabled = tbl["AllSpell"];
			
			
						
			local Solution = tbl["NewSpell"];
			
			local text ;
			if disabled then
				text = "输入添加技能";
			else
				text = "|cffffff00输入添加技能";
			end
						
			local str = addon:FormatTooltipText("请确认新名称不在列表中，同名即|cffffffff 替换。");
			
			menu:AddLine("text", text,"hasEditBox", 1, "editBoxText", self.text, "editBoxFunc",
			"Default_AddBuff", "editBoxArg1", self,"editBoxArg2",
			Solution,"tooltipText",str,"tooltipTitle","说明",
			"disabled",disabled
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
			"OpenMenuValue",{CollectionInf["Buff_Spell"],{Solution,-1},function() DropDownMenu:Refresh(level); end},
			"disabled",disabled
			);
			
			
			
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			
			
			
			local GetSpellInfo=GetSpellInfo;
			
			for k,v in pairs(Solution) do
				
				local Name,_,Texture=GetSpellInfo(v.SpellId);
				
				Texture = Texture or "";
								
				local text ;
				if disabled then
					text = k .. ". " .. Name;
				else
					text = "|cff104E8B" .. k .. ". |r" .. Name;
				end
				
				local str = addon:FormatTooltipText("\nId: |r" ..(v["SpellId"] or "") .. "\n\n" .. "提示：鼠标右键可以在当前位置插入Buff/技能")
								
				menu:AddLine("text", text,
				"icon",Texture,"disabled",disabled,
				"tooltipText",str,"tooltipTitle",Name,
				"CloseButtonFunc","Del_Tbl_Index","CloseButtonArg1",self,
				"CloseButtonArg2",{Solution,k,level},
				"OpenRightMenu",SuperTreatment["Menu"]["UnitBuffListMenu"],
				"OpenRightMenuValue",
				{CollectionInf["Buff_Spell"],{Solution,k},function() DropDownMenu:Refresh(level); end}
				);
			
				
			end
		
		
			
			
		elseif value[1] == "CustomizeTargetListGetTargetAmminimumFastSetNoBuff" or  value[1] =="CustomizeTargetListGetTargetAmminimumFastSetBuff" then
		
			local index =value[2] ;
			local tbl;
			local Solution;
			
			
			if value[1] == "CustomizeTargetListGetTargetAmminimumFastSetNoBuff" then
			
				menu:AddLine("text", "排除Buff","isTitle",1);
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
				
				
				
				local temp = RDB[index]["AmminimumFast"];
				
				
				
				tbl=RDB[index]["AmminimumFast"]["NewNobuff"];
				Solution = tbl["buffs"];
				tbl["IsNobuff"]= true;
				
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
			
			else
				
				menu:AddLine("text", "设定Buff","isTitle",1);
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
			
				
				
				tbl=RDB[index]["AmminimumFast"]["NewBuff"]
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
			
			end
			
			
			
		
			
			
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
				
				Name =  Name or "无效";
				
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
				
				
				--[[
				if  v["IsSpellIdTexture"]=="IsTexture" then
					text = text .. E.IsTexture;
					NoBuffNameCount = NoBuffNameCount +1;
					
				elseif  v["IsSpellIdTexture"]=="IsSpellId" then
					text = text .. E.IsSpellId;
					NoBuffNameCount = NoBuffNameCount +1;
				end
				
				if  v["IsPlayer"] == "PLAYER" then
					text = text .. E.IsPlayer_Player;
					NoBuffNameCount = NoBuffNameCount +1;
					
				elseif  v["IsPlayer"] == "NoPlayer" then
					text = text .. E.IsPlayer_NoPlayer;
					NoBuffNameCount = NoBuffNameCount +1;
					
				else
					text = text .. E.IsPlayer_All;
				end
				
				
				
				if v["IsCd"]=="Start" then
					text = text .. E.IsCd_Start;
				end
				--]]
				
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
			
		elseif value[1] == "CustomizeTargetListGetTargetAmminimumFastSetGroup" then
			
			
			local index = value[2];
			
			menu:AddLine("text", "目标范围","isTitle",1);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
			
			local AMF = RDB[index]["AmminimumFast"];
			if not AMF["Distancevalue"] then
				AMF["Distancevalue"]=30;
			end
			local group = AMF["group"];
			
			if not group then
				group ="party";
			end
			local disabled =  group == "party" or group == "partypet" or 
			group == "raid" or group == "raidpet" or group == "arena" or 
			group == "partyraid" or group == "partyraidpet";
			
			if not disabled then
				text = "启用多任务处理";
			else
				text = "|cffffff00启用多任务处理";
			end
			
			local str = addon:FormatTooltipText("多任务处理");
			menu:AddLine("text", text, "checked",AMF["MultitaskingChecked"] ,"func",
			"SetTbl","arg1", self,"arg2", {AMF,"MultitaskingChecked",not AMF.MultitaskingChecked,level},
			"tooltipText",str,"hasArrow", 1, "value",
			{"CustomizeTargetListGetTargetAmminimumFastSetGroupMultitasking" , index},
			"tooltipTitle","多任务处理","disabled",not disabled
			);
			
			
			
			
			
			local text = "|cffffff00排除死亡、幽灵、不在线的";
			local str = addon:FormatTooltipText("排除死亡、幽灵、不在线的。");
			menu:AddLine("text", text, "checked",AMF["GhostChecked"] ,"func", "SetTbl","arg1", self,"arg2",
			{AMF,"GhostChecked",not AMF.GhostChecked,level},
			"tooltipText",str,"tooltipTitle","说明"
			);
			
			
			local text ;
			
			
			if not disabled then
				text = "排除小队/目标";
			else
				text = "|cffffff00排除小队/目标";
			end
			
			
			local str = addon:FormatTooltipText("排除小队/目标");
			menu:AddLine("text", text, "checked",AMF["ExcludedTargetChecked"] ,"func",
			"SetTbl","arg1", self,"arg2",
			{AMF,"ExcludedTargetChecked",not AMF.ExcludedTargetChecked,level},
			"tooltipText",str,"hasArrow", 1, "value", 
			{"CustomizeTargetListGetTargetAmminimumFastSetGroupExcludedTarget",index},
			"tooltipTitle","说明","disabled",not disabled);
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
			
			
			local text = "|cffffffff距离由方案里的技能来决定";
			local str = addon:FormatTooltipText("注意该选项是通过判断技能是否可以对目标施放来判断的。");
			menu:AddLine("text", text,"isRadio", 1, "checked",AMF["SpellDistanceChecked"] ,"func", "CustomizeTargetListGetTargetAmminimumFastSetGroup_SpellDistancechecked","arg1", self,"arg2", index,"tooltipText",str,"tooltipTitle","说明")
			
			
			local text = "|cffffffff距离(|cffff0000<=" .. AMF["Distancevalue"]  .."|cffffffff)的目标";
			local str = addon:FormatTooltipText("过滤目标和你之间的距离");
			menu:AddLine("text", text,"isRadio", 1, "checked",AMF["DistanceChecked"] ,"func", "CustomizeTargetListGetTargetAmminimumFastSetGroup_Distancechecked","arg1", self,"arg2", index,"hasSlider", 1,"sliderDecimals",0, "sliderValue", AMF["Distancevalue"], "sliderMin", 5, "sliderMax", 50, "sliderStep", 1, "sliderFunc", "CustomizeTargetListGetTargetAmminimumFastSetGroup_Distancevalue", "sliderArg1", self,"sliderArg2", index,"tooltipText",str,"tooltipTitle","说明")
			
			
			local text = "|cffffffff不判断距离";
			local str = addon:FormatTooltipText("选择此项要么不需要判断，要么和距离相关的函数里获得该效果。");
			menu:AddLine("text", text,"isRadio", 1, "checked",AMF["NoDistanceChecked"] ,"func", "CustomizeTargetListGetTargetAmminimumFastSetGroup_NoDistancechecked","arg1", self,"arg2", index,
			"tooltipText",str,"tooltipTitle","说明");
			
			
			--menu:AddLine("text","","disabled",1);
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10)
			
			menu:AddLine("text", "常用目标","isTitle",1,
			"ToggleButton",1,"ToggleButtonFun",function()
			ST.Hide_old_version_of_the_target=not ST.Hide_old_version_of_the_target;
			DropDownMenu:Refresh(level);
			
			end,
			"ToggleState", ST.Hide_old_version_of_the_target,"ToggleX",-5
			
			);
			
			
			
			local Colors = "|cffffffff";
			local func = "SetTbl";
			
			if not ST.Hide_old_version_of_the_target then
			
				local str = addon:FormatTooltipText("上帝指令里设定的MT列表。\n\n|r提示：菜单[全局快速设定] >> [MT设定]");
				
				menu:AddLine("text", Colors .. "所有MT","isRadio", 1,"checked",group=="maintank","func", func,"arg1", self,"arg2", {AMF,"group","maintank",level -1},
				"tooltipText",str,"tooltipTitle","说明"
				);
				
				menu:AddLine("text", Colors .. "小队","isRadio", 1,"checked",group=="party","func", func,"arg1", self,"arg2", {AMF,"group","party",level -1});
				
				menu:AddLine("text", Colors .."小队宠物","isRadio", 1,"checked",group=="partypet","func", func,"arg1", self,"arg2", {AMF,"group","partypet",level -1});
				
				menu:AddLine("text", Colors .."团队","isRadio", 1,"checked",group=="raid","func", func,"arg1", self,"arg2", {AMF,"group","raid",level -1});
				
				menu:AddLine("text", Colors .."团队宠物","isRadio", 1,"checked",group=="raidpet","func", func,"arg1", self,"arg2", {AMF,"group","raidpet",level -1});
				
				menu:AddLine("text", Colors .. "小队/团队","isRadio", 1,"checked",group=="partyraid","func", func,"arg1", self,"arg2", {AMF,"group","partyraid",level -1});
				
				menu:AddLine("text", Colors .. "小队/团队(宠物)","isRadio", 1,"checked",group=="partyraidpet","func", func,"arg1", self,"arg2", {AMF,"group","partyraidpet",level -1});
				
				
				menu:AddLine("text", Colors .."竞技场敌方小队","isRadio", 1,"checked",group=="arena","func", func,"arg1", self,"arg2", {AMF,"group","arena",level -1});

				menu:AddLine("text", Colors .."(FH)敌对列表","isRadio", 1,"checked",group=="FHenemies","func", func,"arg1", self,"arg2", {AMF,"group","FHenemies",level -1});

				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
			end		
					--menu:AddLine("text", "隐藏了旧版本的一些目标","isTitle",1);
					local str = addon:FormatTooltipText("目标调用少于1次的强力建议不要使用，这些目标完全可以用施法方案里的条件目标代替。|r\n\n但如果多次调用那么强烈建议使用，因为更有效率。");
					
					
						menu:AddLine("text", "更多目标","isTitle",1,
						"ToggleButton",1,"ToggleButtonFun",function()
						ST.Hide_old_version_of_the_target=not ST.Hide_old_version_of_the_target;
						DropDownMenu:Refresh(level);
						
						end,
						"ToggleState",not ST.Hide_old_version_of_the_target,"ToggleX",-5
						);
						
						menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
						
			
				
			
				
				
			--if group=="player" or group=="target" or group=="targettarget" or group=="focus" or 
			--group=="focustarget" or group=="mouseover" or group=="mouseovertarget" or group=="FireHasBeenSet" 
			--or group == "SelectedTarget" or ST.Hide_old_version_of_the_target then
			
			if ST.Hide_old_version_of_the_target then
				
				menu:AddLine("text", Colors .."自己","isRadio", 1,"checked",group=="player","func", func,"arg1", self,"arg2", {AMF,"group","player",level -1})
				
				menu:AddLine("text", Colors .."宠物","isRadio", 1,"checked",group=="pet","func", func,"arg1", self,"arg2", {AMF,"group","pet",level -1})
				
				
				menu:AddLine("text", Colors .."当前目标","isRadio", 1,"checked",group=="target","func", func,"arg1", self,"arg2", {AMF,"group","target",level -1})
				
				menu:AddLine("text", Colors .."当前目标的目标","isRadio", 1,"checked",group=="targettarget","func", func,"arg1", self,"arg2", {AMF,"group","targettarget",level -1})
				
				menu:AddLine("text", Colors .."焦点目标","isRadio", 1,"checked",group=="focus","func", func,"arg1", self,"arg2", {AMF,"group","focus",level -1})
				
				menu:AddLine("text", Colors .."焦点目标的目标","isRadio", 1,"checked",group=="focustarget","func", func,"arg1", self,"arg2", {AMF,"group","focustarget",level -1})
				
				menu:AddLine("text", Colors .."鼠标目标","isRadio", 1,"checked",group=="mouseover","func", func,"arg1", self,"arg2", {AMF,"group","mouseover",level -1})
				
				menu:AddLine("text", Colors .."鼠标目标的目标","isRadio", 1,"checked",group=="mouseovertarget","func", func,"arg1", self,"arg2", {AMF,"group","mouseovertarget",level -1})
			
				menu:AddLine("text", Colors .."你控制的车辆","isRadio", 1,"checked",group=="vehicle","func", func,"arg1", self,"arg2", {AMF,"group","vehicle",level -1})
				
				menu:AddLine("text", Colors .."MT1","isRadio", 1,"checked",group=="maintank1","func", func,"arg1", self,"arg2", {AMF,"group","maintank1",level -1})
				
				menu:AddLine("text", Colors .."MT2","isRadio", 1,"checked",group=="maintank2","func", func,"arg1", self,"arg2", {AMF,"group","maintank2",level -1})
				
				menu:AddLine("text", Colors .."MT3","isRadio", 1,"checked",group=="maintank3","func", func,"arg1", self,"arg2", {AMF,"group","maintank3",level -1})
				
				menu:AddLine("text", Colors .."MT4","isRadio", 1,"checked",group=="maintank4","func", func,"arg1", self,"arg2", {AMF,"group","maintank4",level -1})
				
				menu:AddLine("text", Colors .."MT5","isRadio", 1,"checked",group=="maintank5","func", func,"arg1", self,"arg2", {AMF,"group","maintank5",level -1})
				
				menu:AddLine("text", Colors .."MT6","isRadio", 1,"checked",group=="maintank6","func", func,"arg1", self,"arg2", {AMF,"group","maintank6",level -1})
				
				menu:AddLine("text", Colors .."MT7","isRadio", 1,"checked",group=="maintank7","func", func,"arg1", self,"arg2", {AMF,"group","maintank7",level -1})
				
				menu:AddLine("text", Colors .."MT8","isRadio", 1,"checked",group=="maintank8","func", func,"arg1", self,"arg2", {AMF,"group","maintank8",level -1})
				
				
				
				menu:AddLine("text", Colors .."Boss1","isRadio", 1,"checked",group=="boss1","func", func,"arg1", self,"arg2", {AMF,"group","boss1",level -1})
				
				menu:AddLine("text", Colors .."Boss2","isRadio", 1,"checked",group=="boss2","func", func,"arg1", self,"arg2", {AMF,"group","boss2",level -1})
				
				menu:AddLine("text", Colors .."Boss3","isRadio", 1,"checked",group=="boss3","func", func,"arg1", self,"arg2", {AMF,"group","boss3",level -1})
				
				menu:AddLine("text", Colors .."Boss4","isRadio", 1,"checked",group=="boss4","func", func,"arg1", self,"arg2", {AMF,"group","boss4",level -1})
				
				
				local FireHasBeenSetValue = RDB[index]["AmminimumFast"]["FireHasBeenSetValue"];
				if not FireHasBeenSetValue then
					FireHasBeenSetValue =0;
				end
				local str = addon:FormatTooltipText("当你的队友被 >=" .. FireHasBeenSetValue .." 个竞技场敌人设为当前目标时，可以认为被集火了。");
				menu:AddLine("text",Colors .."竞技场被集火的队员|cffff0000(>=" .. FireHasBeenSetValue .. ")",
				"isRadio", 1,"checked", group=="FireHasBeenSet","func",func,
				"arg1", self, "arg2", {AMF,"group","FireHasBeenSet",level -1},
				"hasSlider", 1, "sliderValue", FireHasBeenSetValue,
				"sliderMin", 0, "sliderMax", 5, "sliderStep", 1, "sliderFunc",
				"CustomizeTargetListGetTargetAmminimumFastMinimumFireHasBeenSetValue",
				"sliderArg1", self,"sliderArg2",index,"tooltipText",str,"tooltipTitle","被集火"
				);
				

				
				local text;
				
				
				if not AMF["Group_SelectedTarget"] then
					AMF["Group_SelectedTarget"]={};
				end
				
				local T = AMF["Group_SelectedTarget"];
				
				if not T["name"] then
					text = "";
					menu:AddLine("text", "|cffffff00团/队:|r" .. text,"isRadio", 1, "checked",group == "SelectedTarget" ,"func",
					func,"arg1", self,"arg2",{AMF,"group","SelectedTarget",level -1},
					"hasArrow", 1, "value", {"CustomizeTargetListGetTargetAmminimumFastSetGroupSelectedTarget" , index});
				else
					
					local color = T["color"];
					
					menu:AddLine("text", T["name"],"isRadio", 1, "checked",group == "SelectedTarget" ,"func",
					func,"arg1", self,"arg2", {AMF,"group","SelectedTarget",level-1},
					"hasArrow", 1, "value", {"CustomizeTargetListGetTargetAmminimumFastSetGroupSelectedTarget" , index},
					"textR", color.r, "textG", color.g, "textB", color.b
					);
				
				end
				
			
				
			end
			
		end
	
	elseif level == 4 then -- 4级菜单内容
		
		if value[1] ==  "CustomizeTargetListGetTargetAmminimumFastMaximumLayerBuff" then
			
			local index =value[2] ;
			local tbl = RDB[index]["AmminimumFast"];
			
			
			menu:AddLine("text", "设定Buff层数","isTitle",1);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			local checked = tbl["Maximum"];
			
			local value = tbl["Maximum"];
			
						
			menu:AddLine("text", "|cffffff00最大Buff层数(|cffff0000>=" .. value["MaximumLayerBuff"]  .."|cffffff00)","hasSlider", 1, "sliderValue", value["MaximumLayerBuff"], "sliderMin", 0, "sliderMax", 1000, "sliderStep", 1, "sliderFunc", "SetSliderMaxMG", "sliderArg1", self,"sliderArg2", 
			{value,"MaximumLayerBuff",level-1,value}
			);
			
			menu:AddLine("line",1);
			
			local Name,_,Texture=GetSpellInfo(value["NewLayerBuffId"] or 0)
			
			menu:AddLine("text", "|cffffff00输入Buff名称","colorCode","|cffffff00","hasEditBox", 1, "editBoxText",Name or "" , "editBoxFunc", "LayerBuff_Max_AddBuff", "editBoxArg1", self,"editBoxArg2",
			{value,"NewLayerBuffId",level,value}
			);
			
			menu:AddLine("line",1);
			
			CollectionInf["Buff_Spell"]["Ex"]=SuperTreatmentDBF["CollectionInf"];
			menu:AddLine("text", "|cffffff00选择Buff名称","colorCode","|cffffff00",
			"hasArrow", 1,
			"OpenMenu",SuperTreatment["Menu"]["UnitBuffListMenu"],
			"OpenMenuValue",{CollectionInf["Buff_Spell"],{value,"NewLayerBuffId"},function() 
			
			addon:Maximum_Generation(value);
			DropDownMenu:Refresh(level); end}
			);
			
			menu:AddLine("line",1);
			
						
			if Name then
				menu:AddLine("text", Name or "","icon",Texture,
				"CloseButtonFunc","SetTbl","CloseButtonArg1",self,
				"CloseButtonArg2",{value,"NewLayerBuffId",nil,level}
				);
			end
		
		
		
		elseif value[1] ==  "CustomizeTargetListGetTargetAmminimumFastMinimumLayerBuff" then	
			
			local index =value[2] ;
			local tbl = RDB[index]["AmminimumFast"];
			
			
			menu:AddLine("text", "设定Buff层数","isTitle",1);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			local checked = tbl["Minimum"];
			
			local value = tbl["Minimum"];
			
						
			menu:AddLine("text", "|cffffff00最小Buff层数(|cffff0000<=" .. value["MinimumLayerBuff"]  .."|cffffff00)","hasSlider", 1, "sliderValue", value["MinimumLayerBuff"], "sliderMin", 0, "sliderMax", 1000, "sliderStep", 1, "sliderFunc", "SetSliderMG", "sliderArg1", self,"sliderArg2", 
			{value,"MinimumLayerBuff",level-1,value}
			);
			
			menu:AddLine("line",1);
			
			local Name,_,Texture=GetSpellInfo(value["NewLayerBuffId"] or 0)
			
			menu:AddLine("text", "|cffffff00输入Buff名称","colorCode","|cffffff00","hasEditBox", 1, "editBoxText",Name or "" , "editBoxFunc", "LayerBuff_AddBuff", "editBoxArg1", self,"editBoxArg2",
			{value,"NewLayerBuffId",level,value}
			);
			
			menu:AddLine("line",1);
			
			CollectionInf["Buff_Spell"]["Ex"]=SuperTreatmentDBF["CollectionInf"];
			menu:AddLine("text", "|cffffff00选择Buff名称","colorCode","|cffffff00",
			"hasArrow", 1,
			"OpenMenu",SuperTreatment["Menu"]["UnitBuffListMenu"],
			"OpenMenuValue",{CollectionInf["Buff_Spell"],{value,"NewLayerBuffId"},function() 
			
			addon:Minimum_Generation(value);
			DropDownMenu:Refresh(level); end}
			);
			
			menu:AddLine("line",1);
			
						
			if Name then
				menu:AddLine("text", Name or "","icon",Texture,
				"CloseButtonFunc","SetTbl","CloseButtonArg1",self,
				"CloseButtonArg2",{value,"NewLayerBuffId",nil,level}
				);
			end
		
		
		elseif value[1] ==  "CustomizeTargetListGetTargetAmminimumFastSetGroupSelectedTarget" then	
		
			local index = value[2];
			-- 菜单表格标题
				menu:AddColumnHeader("角色名", "LEFT")
				menu:AddColumnHeader("种族", "CENTER")
				menu:AddColumnHeader("小队", "CENTER")
				menu:AddColumnHeader("选中", "CENTER")
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
				
				for i, data in pairs(RDB) do
					local unit =data["unit"];
				
					if data["subgroup"]>=0 then
					
						local color,tc,levelColor,subgroup,checked,Class;
						local name = amGetUnitName(unit,true);
						
						
						
						
						local unit =data["unit"];
						local playerClass, englishClass = UnitClass(unit)
						color = RAID_CLASS_COLORS[englishClass]
						tc = CLASS_BUTTONS[englishClass]
						
						
						
							if data["subgroup"] ==0 then
								subgroup= "";
							else
								subgroup= data["subgroup"];
							end
							
							
							
							
							
							if RDB[index]["AmminimumFast"]["Group_SelectedTarget"]["name"] == name then
								checked="|cffffff00√|r";
							else
								checked="";
							end
							
							


							-- 表格内容行
							menu:AddLine(
								-- 职业图标
								"icon", "Interface\\WorldStateFrame\\Icons-Classes",
								"tCoordLeft", tc[1],
								"tCoordRight", tc[2],
								"tCoordTop", tc[3],
								"tCoordBottom", tc[4],
								
								"text1", name, "text1R", color.r, "text1G", color.g, "text1B", color.b,
								"text2", UnitRace(unit),
								"text3", subgroup,
								"text4", checked,
								"func", "AmminimumFastSetGroupSelectedTarget", "arg1", self, "arg2", {index,name,color,englishClass}
							)
						
						
						
						
						
						
					end
				end
			
		
		elseif value[1] == "CustomizeTargetListGetTargetAmminimumFastSetGroupMultitasking" then
			
			local ST = SuperTreatmentInf;
			local index = value[2];
			
			local tbl = RDB[index]["AmminimumFast"];
			
			local t = tbl["MultitaskingTime"];
			
			if not t then t =1 ;end;
			
			--local str = addon:FormatTooltipText("");
			menu:AddLine("text","刷新时间(毫秒):|cffff0000" .. t ,
			"hasSlider", 1, "sliderValue", t,
			"sliderMin", 50, "sliderMax", 9999, "sliderStep", 1, "sliderFunc",
			value[1] .. "_Time_Value",
			"sliderArg1", self,"sliderArg2",tbl
			--,"tooltipText",str,"tooltipTitle","MultitaskingTime"
			);
		
		
		
		elseif value[1] == "CustomizeTargetListGetTargetAmminimumFastSetGroupExcludedTarget" then
		
			local index = value[2];
			
			menu:AddLine("text", "设定排除目标:","isTitle",1);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			
			
			if not RDB[index]["AmminimumFast"]["ExcludedTarget"] then
				RDB[index]["AmminimumFast"]["ExcludedTarget"]={};
			end
			
			local tbl = RDB[index]["AmminimumFast"]["ExcludedTarget"];
			
			
			local str = addon:FormatTooltipText("这个玩家名字,必须是完整的名字,而且该玩家必须是你的团友或队友或宠物, 否则你将不能使用玩家名字作为目标。");
				
			menu:AddLine("text", "|cffffff00手动添加排除目标","hasEditBox", 1, "editBoxText", "", "editBoxFunc", "AmminimumFastSetGroupExcludedTarget_ADD_EditUnit", "editBoxArg1", self,"editBoxArg2", index,"tooltipText",str,"tooltipTitle","目标名字"
			);
			
			
			
			menu:AddLine("text","|cffffff00选择添加排除目标","hasArrow", 1, "value",
			{"CustomizeTargetListGetTargetAmminimumFastSetGroupSelectExcludedTarget" , index}
			);
			
			menu:AddLine("line",1)
			
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
					"func", "SetTbl", "arg1", self, "arg2",
					{tbl,name,nil,level,nil,nil,nil,level}
				);
					menu:AddLine("line",1);				
				end
			end
			
			
			
			for name, data in pairs(tbl) do
				
				if not amGetUnitName(name,true) then
				
					local str = addon:FormatTooltipText("这个玩家名字,必须是完整的名字,而且该玩家必须是你的团友或队友或宠物, 否则你将不能使用玩家名字作为目标。");
					menu:AddLine("text","|c00696969"  .. name, 
					"func", "SetTbl", "arg1", self, "arg2",
					{tbl,name,nil,level,nil,nil,nil,level},
					"tooltipText",str,"tooltipTitle","目标不可用"
				);
					menu:AddLine("line",1);			
					
				end				
				
			end
			
			
			
			
			
			menu:AddLine("text");
			
			menu:AddLine("text", "设定排除小队:","isTitle",1);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			if not RDB[index]["AmminimumFast"]["ExcludedGroup"] then
				RDB[index]["AmminimumFast"]["ExcludedGroup"]={};
			end
			
			local tbl = RDB[index]["AmminimumFast"]["ExcludedGroup"];
			
			for i=1, 8 do
				
				
				menu:AddLine("text", i .. "小队" ,"checked",tbl[i] ,
				"func", "SetTbl",
				"arg1", self,"arg2", {tbl,i,not tbl[i],level}
				);
				
			end
			
		
		
		
		
		end
	


	elseif level == 5 then -- 5级菜单内容

		if value[1] == "CustomizeTargetListGetTargetAmminimumFastSetGroupSelectExcludedTarget" then
			
			local index = value[2];
			local tbl =RDB[index]["AmminimumFast"]["ExcludedTarget"];
			
			-- 菜单表格标题
				menu:AddColumnHeader("角色名", "LEFT")
				menu:AddColumnHeader("种族", "CENTER")
				menu:AddColumnHeader("小队", "CENTER")
				menu:AddColumnHeader("选中", "CENTER")
				menu:AddLine("line",1,"LineBrightness",1,"LineHeight",10);
				
				for i, data in pairs(RDB) do
					local unit =data["unit"];
				
					if data["subgroup"]>=0 then
					
						local color,tc,levelColor,subgroup,checked,Class;
						local name = amGetUnitName(unit,true);
						
						
						
						
						local unit =data["unit"];
						local playerClass, englishClass = UnitClass(unit)
						color = RAID_CLASS_COLORS[englishClass]
						tc = CLASS_BUTTONS[englishClass]
						
							
						subgroup = data["subgroup"] ~=0 and data["subgroup"] or "无"
							
						if tbl[name] then
							checked="|cffffff00√|r";
						else
							checked="";
						end	


							--[[
							-- 表格内容行
							menu:AddLine(
								-- 职业图标
																
								"text1", stGetClassicon(englishClass,13)..name,
								"text1R", color.r, "text1G", color.g, "text1B", color.b,
								"text2", UnitRace(unit),
								"text3", subgroup,
								
								"func", "SetTbl", "arg1", self, "arg2", 
								{tbl,name,not tbl[name] or nil,level-1},
								"checked",tbl[name]
							)
							--]]
						
							menu:AddLine(
								-- 职业图标
								"icon", "Interface\\WorldStateFrame\\Icons-Classes",
								"tCoordLeft", tc[1],
								"tCoordRight", tc[2],
								"tCoordTop", tc[3],
								"tCoordBottom", tc[4],
								
								"text1", name, "text1R", color.r, "text1G", color.g, "text1B", color.b,
								"text2", UnitRace(unit),
								"text3", subgroup,
								"text4", checked,
								"func", "SetTbl", "arg1", self, "arg2", 
								{tbl,name,not tbl[name] or nil,level-1}
							)
						
						
						
						
						
					end
				end
			
			
			
		end




	
	end
	
	
	
end



function addon:Menu_SuperTreatmentApiList(level, value, menu,TBL,GlobalLevel)
			
			SuperTreatment["ApiDbf"]=TBL["ApiDbf"]
			local api = SuperTreatment["ApiDbf"];
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);			
			menu:AddLine("text", "|cffffff00函数模板|cff00ff00(更多功能)", "hasArrow", 1, "value", "",
			"OpenMenu",SuperTreatment["Menu"]["FunctionListMenu"],
			"OpenMenuValue",{SuperTreatment,{api,-1},function() DropDownMenu:Refresh(level); end},
			"text_X",-22
			);
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			
			
			
		if SuperTreatment["type"]=="NoRun" then
			
			for e, rs in pairs(api) do
				local k = rs["id"];
				local data =SuperTreatment["Api"][k];
				
				local str = addon:FormatTooltipText("\n" .. data["inf"] .. "\n\n|cffffff00" .. data["Remarks"]);
				local ArgumentsTexts="";
				local Arguments = data["Arguments"];
				
				local Counts = data["Arguments"]["Counts"];
				if Counts==0 then
				
					ArgumentsTexts = "\n|cffff0000参数:|r 无\n"
				else
				
					for n=1,Counts do
						local m ="";
						if not rs["Arguments"][n] then
							rs["Arguments"][n]={};
						end
							if  rs["Arguments"][n]["value"] ~= nil then
								m = "|cffff00ff值: |cff00ffff" .. tostring(rs["Arguments"][n]["value"]).. "|r\n";
							end
						ArgumentsTexts = ArgumentsTexts .."\n|cffff0000参数".. n .. "(|r" .. TYPEINF[Arguments[n]["type"]] .."|cffff0000):|r\n"  .. Arguments[n]["inf"] .. "\n" .. m ;
						
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
				
				
				--------------------------------------
				
				local tbl={};
				tbl.AddApi={};
				local ex = tbl.AddApi;
								
				ex.Del ={}; 
				ex.Del.fun = function() 
				table.remove(api,e);
				DropDownMenu:Refresh(level);
				DropDownMenu:ArrowHide(self,level);
				end; 
				
				ex.Up ={}; 
				ex.Up.fun = function() 
					if e>1 then
						local NewTblA = th_table_dup(api[e]);
						local NewTblB = th_table_dup(api[e-1]);
						api[e-1]=NewTblA;
						api[e]=NewTblB;						
						DropDownMenu:Refresh(level);
					end
				end;
				
				ex.Down ={}; 
				ex.Down.fun = function() 
					local n = #(api);
					if e<n then
						local NewTblA = th_table_dup(api[e]);
						local NewTblB = th_table_dup(api[e+1]);
						api[e+1]=NewTblA;
						api[e]=NewTblB;
						DropDownMenu:Refresh(level);
					
					end
				end;
				
				ex.Not ={}; 
				ex.Not.fun = function() 
				api[e]["not"]= not api[e]["not"];
				DropDownMenu:Refresh(level);
				end; 
								
				ex.text = data["inf"];
				
				
				---------------------------------------
				
				ArgumentsTexts = data["inf"] .. "\n" .. ArgumentsTexts .. ReturnsTexts .. "\n|cff00ff00" .. data["Remarks"] .. "|r";
				
				local str = "\n\n|cffff0000删除: |cffffffffCtrl + Alt + 鼠标左键"
				ArgumentsTexts = ArgumentsTexts .. str .. NOTT;
				
				menu:AddLine("text",NOT(rs,"|cff00ff00" .. e .. ". |cffffffff" .. data["inf"]),
				"tooltipText",ArgumentsTexts,"tooltipTitle",k,
				"checked",rs["checked"],	"func", "SuperTreatmentApiListSet_checked", "arg1", self, "arg2", {e,level},
				"hasArrow", 1,
				
				"CloseButtonFunc","Del_Tbl_Index","CloseButtonArg1",self,
				"CloseButtonArg2",{api,e,level},"CloseButtonFront",GlobalLevel+1,
				
				"OpenRightMenu",SuperTreatment["Menu"]["OpenRightMenu"],
				"OpenRightMenuValue",tbl,
				
				"OpenMenu",SuperTreatment["Menu"]["SetApiParameterMenu"],
				"OpenMenuValue",{SuperTreatment,{k,e},function() DropDownMenu:Refresh(level); end}
				
				);
				
				if e ~= #api then
					menu:AddLine("line",1);
				end
			
			end
		
		end
		
end


function addon:SuperTreatmentApiListSet_checked(value)
	
	local level = value[2];
	local v = value[1];
	local api = SuperTreatment["ApiDbf"]
	
	if IsControlKeyDown() and IsAltKeyDown() then
		table.remove(api, v) 
		DropDownMenu:Refresh(level)
		return;
	
	elseif IsAltKeyDown() and not IsControlKeyDown() then
		api[v]["not"]= not api[v]["not"];
		DropDownMenu:Refresh(level)
		return;
		
	end
	
	api[v]["checked"] = not api[v]["checked"] ;
	DropDownMenu:Refresh(level)
end


function addon:SetAllBuffDefault(value)

	for k,v in pairs(value) do
			
		local id = v.SpellId;
		
		value[k]={};
		value[k].SpellId=id;
		
	end
	
	DropDownMenu:Refresh(3)
end


function addon:SetAllBuffHELPFUL(value)

	for k,v in pairs(value) do
			
		value[k].IsType="HELPFUL";
		
	end
	
	DropDownMenu:Refresh(3)
end

function addon:SetAllBuffHARMFUL(value)

	for k,v in pairs(value) do
		
		value[k].IsType="HARMFUL";
		
	end
	
	DropDownMenu:Refresh(3)
end