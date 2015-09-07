if (GetLocale() ~= 	"zhCN") then return; end;


 
SuperTreatment["Menu"]["OpenRightMenu"] = amMenu("OpenRightMenu");
local DropDownMenu = SuperTreatment["Menu"]["OpenRightMenu"];
local addon = {}
DropDownMenu:SetMenuRequestFunc(addon, "OnMenuRequest");

local MenuTbl;

function addon:GetKeyText(tbl,v,keyOrButton)
		
		
		local keyPressed = keyOrButton;

        if ( keyPressed == "UNKNOWN" ) then
            return;
        end

        -- Convert the mouse button names
        if ( keyPressed == "LeftButton" ) then
            keyPressed = "BUTTON1";
        elseif ( keyPressed == "RightButton" ) then
            keyPressed = "BUTTON2";
        elseif ( keyPressed == "MiddleButton" ) then
            keyPressed = "BUTTON3";
        elseif ( keyPressed == "Button4" ) then
            keyPressed = "BUTTON4"
        elseif ( keyOrButton == "Button5" ) then
            keyPressed = "BUTTON5"
        elseif ( keyPressed == "Button6" ) then
            keyPressed = "BUTTON6"
        elseif ( keyOrButton == "Button7" ) then
            keyPressed = "BUTTON7"
        elseif ( keyPressed == "Button8" ) then
            keyPressed = "BUTTON8"
        elseif ( keyOrButton == "Button9" ) then
            keyPressed = "BUTTON9"
        elseif ( keyPressed == "Button10" ) then
            keyPressed = "BUTTON10"
        elseif ( keyOrButton == "Button11" ) then
            keyPressed = "BUTTON11"
        elseif ( keyPressed == "Button12" ) then
            keyPressed = "BUTTON12"
        elseif ( keyOrButton == "Button13" ) then
            keyPressed = "BUTTON13"
        elseif ( keyPressed == "Button14" ) then
            keyPressed = "BUTTON14"
        elseif ( keyOrButton == "Button15" ) then
            keyPressed = "BUTTON15"
        elseif ( keyPressed == "Button16" ) then
            keyPressed = "BUTTON16"
        elseif ( keyOrButton == "Button17" ) then
            keyPressed = "BUTTON17"
        elseif ( keyPressed == "Button18" ) then
            keyPressed = "BUTTON18"
        elseif ( keyOrButton == "Button19" ) then
            keyPressed = "BUTTON19"
        elseif ( keyPressed == "Button20" ) then
            keyPressed = "BUTTON20"
        elseif ( keyOrButton == "Button21" ) then
            keyPressed = "BUTTON21"
        elseif ( keyPressed == "Button22" ) then
            keyPressed = "BUTTON22"
        elseif ( keyOrButton == "Button23" ) then
            keyPressed = "BUTTON23"
        elseif ( keyPressed == "Button24" ) then
            keyPressed = "BUTTON24"
        elseif ( keyOrButton == "Button25" ) then
            keyPressed = "BUTTON25"
        elseif ( keyPressed == "Button26" ) then
            keyPressed = "BUTTON26"
        elseif ( keyOrButton == "Button27" ) then
            keyPressed = "BUTTON27"
        elseif ( keyPressed == "Button28" ) then
            keyPressed = "BUTTON28"
        elseif ( keyOrButton == "Button29" ) then
            keyPressed = "BUTTON29"
        elseif ( keyPressed == "Button30" ) then
            keyPressed = "BUTTON30"
        elseif ( keyOrButton == "Button31" ) then
            keyPressed = "BUTTON31"
        end
        if ( keyPressed == "BUTTON1" or keyPressed == "BUTTON2" ) then
            return;
        end

        if ( keyPressed == "LSHIFT" or
             keyPressed == "RSHIFT" or
             keyPressed == "LCTRL" or
             keyPressed == "RCTRL" or
             keyPressed == "LALT" or
             keyPressed == "RALT" ) then
            return;
        end
        if ( IsShiftKeyDown() ) then
            keyPressed = "SHIFT-"..keyPressed;
        end
        if ( IsControlKeyDown() ) then
            keyPressed = "CTRL-"..keyPressed;
        end
        if ( IsAltKeyDown() ) then
            keyPressed = "ALT-"..keyPressed;
        end
		
		tbl[1][tbl[2]]=keyPressed;
		tbl[1]["lock"]=false;
		DropDownMenu:GlobaRefresh(tbl[3]);
				
end

function addon:SetTbl(v,self)
	
	local tbl,index,value,level,argv,ex,levelex = v[1],v[2],v[3],v[4],v[5],v[6],v[7];
	
	if not argv then
	
		if value == "editBoxText" then
			tbl[index]=self;
		else
			tbl[index]=value;
		end
		
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


function addon:CopyCastProgram(tbl)
		
	
		tbl.copy.fun(self,tbl.copy.arg1);
		DropDownMenu:Refresh(tbl.level or 1);
end

function addon:PasteCastProgram(tbl)
		
	
		tbl.Paste.fun(self,tbl.Paste.arg1);
		DropDownMenu:Refresh(tbl.level or 1);
end

function addon:DelCastProgram(tbl)
		
	
		tbl.Del.fun();
		DropDownMenu:Refresh(tbl.level or 1);
end

function addon:UpCastProgram(tbl)
		
	
		tbl.Up.fun();
		DropDownMenu:Refresh(tbl.level or 1);
end

function addon:DownCastProgram(tbl)
		
	
		tbl.Down.fun();
		DropDownMenu:Refresh(tbl.level or 1);
end



function addon:IsCustomizeTarget(v)

		
	local TBL = SuperTreatmentDBF["Spells"]["List"]
	for i, data in pairs(TBL) do
		
		for k, t in pairs(data["spell"]) do
		
			if t["TargetSubgroup"]==-2 and t["unit"]==v then
				return true;
			end
			
			if t["Targets"] then
			
				for k1, t1 in pairs(t["Targets"]) do
					if t1["Conditions"] then
						for k2, t2 in pairs(t1["Conditions"]) do
							if t2["TargetSubgroup"] == -2 and t2["unit"] == v then
								
								return true;
							end
						end
					end
				end
				
			end
			
		end
		
	end


	return false;


end

function addon:CustomizeTargetList_Del(v)

	v.arg1[v.text] = nil;
	v.fun();
	DropDownMenu:Close(1)
end


function addon:CustomizeTargetListRemarksEditName(i,newtext)

	SuperTreatmentDBF["Unit"]["RaidList"][i]["Remarks"] = newtext;
	MenuTbl.CustomizeTarget.fun();
	DropDownMenu:Refresh(1);
	
end


function addon:OnMenuRequest(level, value, menu, MenuEx,GlobalLevel)
	
	--print(">>",MenuEx:GetGlobalLevel())
	
	--print("<<",GlobalLevel,self.Handle:GetGlobalLevel())
	
	if level == 1 then -- 1级菜单内容
		
		MenuTbl =MenuEx.ExternalData;
		local ex = MenuEx.ExternalData;
		
		
		if ex.CastProgramAdd then
			
			local tbl = ex.CastProgramAdd ;
			
			local str = addon:FormatTooltipText("把其它方案粘贴到这裡来，前提你已经复製了方案。");
			
			if tbl.Paste.checked() then
				
					
				menu:AddLine("text", "|cffffff00粘贴",
				"icon","INTERFACE\\ICONS\\INV_Letter_16",
				"func", "PasteCastProgram","arg1", self,"arg2", tbl,
				"tooltipText",str,"tooltipTitle","粘贴",
				"closeWhenClicked",1
				);
				
			else
				
				menu:AddLine("text", "粘贴",
				"icon","INTERFACE\\ICONS\\INV_Letter_16",
				"disabled",1,"tooltipText",str,"tooltipTitle","粘贴",
				"closeWhenClicked",1
				);
				
			
			end
		
		elseif ex.CastProgram then
			
			local tbl = ex.CastProgram ;
			tbl.level=level;
			
			local str = addon:FormatTooltipText("把当前方案上移");
					
			menu:AddLine("text", "|cffffff00上移",
			"icon","INTERFACE\\BUTTONS\\Arrow-Up-UP",
			"func", "UpCastProgram","arg1", self,"arg2", tbl,"tooltipText",str,"tooltipTitle","上移","closeWhenClicked",1)
			
			menu:AddLine("line",1);
			
			local str = addon:FormatTooltipText("把当前方案下移");
					
			menu:AddLine("text", "|cffffff00下移",
			"icon","INTERFACE\\BUTTONS\\Arrow-DOWN-UP",
			"func", "DownCastProgram","arg1", self,"arg2", tbl,"tooltipText",str,"tooltipTitle","下移","closeWhenClicked",1)
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			
			local str = addon:FormatTooltipText("复制当前方案到粘贴板");
					
			menu:AddLine("text", "|cffffff00复制",
			"icon","INTERFACE\\ICONS\\INV_Letter_04",
			"func", "CopyCastProgram","arg1", self,"arg2", tbl,"tooltipText",str,"tooltipTitle","复制","closeWhenClicked",1)
			
			menu:AddLine("line",1);
			
			local str = addon:FormatTooltipText("把其它方案粘贴到这裡来，前提你已经复製了方案。");
			
			if tbl.Paste.checked() then
				
					
				menu:AddLine("text", "|cffffff00粘贴",
				"icon","INTERFACE\\ICONS\\INV_Letter_16",
				"func", "PasteCastProgram","arg1", self,"arg2", tbl,
				"tooltipText",str,"tooltipTitle","粘贴",
				"closeWhenClicked",1
				);
				
			else
				
				menu:AddLine("text", "粘贴",
				"icon","INTERFACE\\ICONS\\INV_Letter_16",
				"disabled",1,"tooltipText",str,"tooltipTitle","粘贴",
				"closeWhenClicked",1
				);
				
			
			end
			
			menu:AddLine("line",1);
			
			local str = addon:FormatTooltipText("删除当前方案");
			
			local text = string.gsub(tbl.text, "%%", "％");
			menu:AddLine("text", "|cffff0000删除",
			"icon","INTERFACE\\ICONS\\ABILITY_DUALWIELD",
			"func", "DelCastProgram","arg1", self,"arg2", tbl,"tooltipText",str,"tooltipTitle","删除","closeWhenClicked",1,
			"hasConfirm", 1, "confirmText", "|cffff0000是否删除 " .. "|cffffff00" .. text .."|cffff0000 ？"
			);
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			local v = tbl.tbl[tbl.index];
			
			if tbl.Renamed then
				
				
				menu:AddLine("text", "改名","hasEditBox", 1,
				"editBoxText",v.name,"editBoxFunc","SetSlider", "editBoxArg1", self,"editBoxArg2",{v,"name",nil;GlobalLevel-1}
				--"icon","INTERFACE\\ICONS\\INV_SCROLL_11"
				);
				menu:AddLine("line",1);
			end
			
			
			
			
			menu:AddLine("text", "获得Id","hasEditBox", 1,
			"editBoxText",v.Mark);
			
			menu:AddLine("line",1);
			menu:AddLine("text", "宏命令" ,"hasArrow", 1, "value", {"MacroCommand",MenuEx});
			
				
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			
			
			if not v.Key then
				v.Key={};
				v.Key.KeySelect="auto"				
			end
			
			if	v.Key.Checked then  
				
				if v.Key.Value and v.Key.Value~="" then
					
					if v.Key.ButtonFrame and v.Key.ButtonFrame.SetAttribute then
						
						ClearOverrideBindings(v.Key.ButtonFrame);
					end
					
					local name = v.Mark;
					local ButtonFrame;
					
					if not amzd() then
					
						if not v.Key.ButtonFrame or (v.Key.ButtonFrame and not v.Key.ButtonFrame.SetAttribute) then
						
							ButtonFrame =  CreateFrame("Button", name,UIParent, "SecureActionButtonTemplate");
							
						
						elseif v.Key.ButtonFrame and v.Key.ButtonFrame.SetAttribute then
							
							ButtonFrame = v.Key.ButtonFrame;
							
						end
					
					end
					
					
					local macrotext;
					
					if v.Key.KeySelect == "auto" then
						macrotext='/run stEP("' .. v.Mark .. '",2,0)';				
					elseif v.Key.KeySelect == "ok" then
						macrotext='/run stEP("' .. v.Mark .. '",1,0)';	
					elseif v.Key.KeySelect == "no" then
						macrotext='/run stEP("' .. v.Mark .. '",0,0)';	
					elseif v.Key.KeySelect == "run" then
						macrotext='/run stEP("' .. v.Mark .. '",3)';
					elseif v.Key.KeySelect == "auto1" then
						macrotext='/run stEP("' .. v.Mark .. '",2,1)';				
					elseif v.Key.KeySelect == "ok1" then
						macrotext='/run stEP("' .. v.Mark .. '",1,1)';	
					elseif v.Key.KeySelect == "no1" then
						macrotext='/run stEP("' .. v.Mark .. '",0,1)';	
					
					end
					
					if not amzd() then
					
						ButtonFrame:SetAttribute("type", "macro") ;
						ButtonFrame:SetAttribute("macrotext",macrotext) ;
						SetOverrideBindingClick(ButtonFrame, true,v.Key.Value , ButtonFrame:GetName())
						
						v.Key.ButtonFrame=ButtonFrame;
					
					
					end
					
					
				end
			else
				
				
				if v.Key.ButtonFrame and v.Key.ButtonFrame.SetAttribute then
					ClearOverrideBindings(v.Key.ButtonFrame);
				end
					
				
				
			end
			
			v.Key.lock=false;
			if amzd() then
				
				menu:AddLine("text", "快捷键(战斗中...)",
				"disabled",1,"tooltipText","不能在战斗中设定快捷键","tooltipTitle","信息"
				);
			
			else
				menu:AddLine("text", "快捷键" ,"hasArrow", 1, "value", {"setkey",MenuEx},
				"checked",v.Key.Checked,
				"func", "SetTbl","arg1", self,"arg2", {v.Key,"Checked",not v.Key.Checked,level,nil,nil,GlobalLevel-1},
				"tooltipText","不能在战斗中设定快捷键","tooltipTitle","信息"
				);
			end
			
			menu:AddLine("text", "|cffffffff备注|r","hasEditBox", 1, "editBoxText",
			v.Remarks or "", "editBoxFunc", "CustomizeTargetListRemarksEditName", "editBoxArg1", self,"editBoxArg2", tbl.text,
			
			"editBoxFunc", "SetTbl","editBoxArg1", self,"editBoxArg2", {v,"Remarks","editBoxText",level,nil,nil,GlobalLevel-1},
			
			"icon","INTERFACE\\ICONS\\INV_Scroll_03",
			"closeWhenClicked",false
			);
			
			
		elseif ex.CustomizeTarget then	
			
			local tbl = ex.CustomizeTarget ;
			local name = tbl.text;
			local RDB = tbl.arg1;
			local index = tbl.text;
			
			
						
			
			
			local str = addon:FormatTooltipText("如：player,target,focus,小可爱");
				
			menu:AddLine("text", "|cffffffff目标名称|r","isRadio", 1,"closeWhenClicked",false,
			"tooltipText",str,"checked",RDB[index].types=="unit",
			"func", "SetTbl","arg1", self,"arg2",
			{RDB[index],"types","unit",nil,nil,nil,GlobalLevel-2},
			"tooltipTitle","目标名称"
			);
			
			str = addon:FormatTooltipText("把函数返回值（字符串）设为目标");
			menu:AddLine("text", "|cffffffff从函数获得目标|r","isRadio", 1,
			"tooltipText",str,"checked",RDB[index].types=="function",
			"func", "SetTbl","arg1", self,"arg2", 
			{RDB[index],"types","function",nil,nil,nil,GlobalLevel-2},
			"tooltipTitle","目标名称","closeWhenClicked",false
			);
			
			menu:AddLine("text", "|cffffffff从模板获得目标" ,"isRadio", 1,
			"checked",RDB[index].types=="AmminimumFast",
			"func", "SetTbl","arg1", self,"arg2", 
			{RDB[index],"types","AmminimumFast",nil,nil,nil,GlobalLevel-2},
			"closeWhenClicked",false
			);
			
			menu:AddLine("text", "|cffffffff从范围内队友信息里获得目标" ,"isRadio", 1,
			"checked",RDB[index].types=="RangeCheckAngle",
			"func", "SetTbl","arg1", self,"arg2", 
			{RDB[index],"types","RangeCheckAngle",nil,nil,nil,GlobalLevel-2},
			"closeWhenClicked",false
			);
			
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			
			menu:AddLine("text", "|cffffffff备注|r","hasEditBox", 1, "editBoxText",
			tbl.arg1[tbl.text]["Remarks"], "editBoxFunc", "CustomizeTargetListRemarksEditName", "editBoxArg1", self,"editBoxArg2", tbl.text,
			"icon","INTERFACE\\ICONS\\INV_Scroll_03",
			"closeWhenClicked",false
			);
			
			menu:AddLine("line",1,"LineHeight",8);
			
			if not addon:IsCustomizeTarget(name) then
				
				local text = string.gsub(name, "%%", "％");
			
			
				menu:AddLine("text", "|cffff0000删除|r", "func", "CustomizeTargetList_Del", "arg1", self, "arg2", tbl, "hasConfirm", 1, "confirmText", "是否删除 " .. text .." ？",
				"icon","INTERFACE\\ICONS\\ABILITY_DUALWIELD",
				"closeWhenClicked",false
				)
			
			else
				menu:AddLine("text", "正在使用无法删除","disabled",1)
			
			end
		


		elseif ex.AddApi then
			
			local tbl = ex.AddApi ;
			tbl.level=level;
			
			local str = addon:FormatTooltipText("把当前函数上移");
					
			menu:AddLine("text", "|cffffff00上移",
			"icon","INTERFACE\\BUTTONS\\Arrow-Up-UP",
			"func", "UpCastProgram","arg1", self,"arg2", tbl,"tooltipText",str,"tooltipTitle","上移","closeWhenClicked",1)
			
			menu:AddLine("line",1,"LineHeight",8);
			
			local str = addon:FormatTooltipText("把当前函数下移");
					
			menu:AddLine("text", "|cffffff00下移",
			"icon","INTERFACE\\BUTTONS\\Arrow-DOWN-UP",
			"func", "DownCastProgram","arg1", self,"arg2", tbl,"tooltipText",str,"tooltipTitle","下移","closeWhenClicked",1)
			
			
			menu:AddLine("line",1,"LineHeight",8);
			
			local str = addon:FormatTooltipText("删除当前函数");
			
			local text = string.gsub(tbl.text, "%%", "％");	
			menu:AddLine("text", "|cffff0000删除",
			"icon","INTERFACE\\ICONS\\ABILITY_DUALWIELD",
			"func", "DelCastProgram","arg1", self,"arg2", tbl,"tooltipText",str,"tooltipTitle","删除","closeWhenClicked",1,
			"hasConfirm", 1, "confirmText", "是否删除 " .. text .." ？"
			);
			
			menu:AddLine("line",1,"LineHeight",8);
			
			local str = addon:FormatTooltipText("把当前函数结果取反");
			local _,_,icon = GetSpellInfo(13712);		
			menu:AddLine("text", "|cffffff00取反",
			"icon",icon,
			"func", tbl.Not.fun,"arg1", self,"tooltipText",str,"tooltipTitle","取反","closeWhenClicked",1)
			
			
			
		end
	
	elseif level == 2 then -- 1级菜单内容
			
			
		if value[1] == "MacroCommand" then
			
			local tbl = value[2].ExternalData.CastProgram;
			
			local v = tbl.tbl[tbl.index];
			
			local str="只会对你选择的目标起作用。";
			
			local MacroCommand;
			
			menu:AddLine("text","只对目标","isTitle",1,"notCheckable",1,
			"tooltipText",str,"tooltipTitle","信息"
			);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			MacroCommand ='/run stEP("' .. v.Mark .. '",2,0)';
			menu:AddLine("text", "选择/放弃","hasEditBox", 1,
			"editBoxText",MacroCommand,
			"notCheckable",1,
			"tooltipText",MacroCommand,"tooltipTitle","信息"
			);
			
			
			menu:AddLine("line",1);
			MacroCommand ='/run stEP("' .. v.Mark .. '",1,0)';
			menu:AddLine("text", "选择","hasEditBox", 1,
			"editBoxText",MacroCommand,
			"notCheckable",1,
			"tooltipText",MacroCommand,"tooltipTitle","信息"
			);
			
			menu:AddLine("line",1);
			MacroCommand ='/run stEP("' .. v.Mark .. '",0,0)';
			menu:AddLine("text", "放弃","hasEditBox", 1,
			"editBoxText",MacroCommand,
			"notCheckable",1,
			"tooltipText",MacroCommand,"tooltipTitle","信息"
			);
			
			menu:AddLine("line",1);
			MacroCommand ='/run stEP("' .. v.Mark .. '",3)';
			menu:AddLine("text", "执行","hasEditBox", 1,
			"editBoxText",MacroCommand,
			"notCheckable",1,
			"tooltipText",MacroCommand,"tooltipTitle","信息"
			);
			
			menu:AddLine();
			
			local str="对你选择的目标全部路径起作用。\n\n注意:比如你想启用第3层的菜单，那么相关的1,2层菜单都会被启用。";
			
			menu:AddLine("text","全部目标路径","isTitle",1,
			"tooltipText",str,"tooltipTitle","信息","notCheckable",1
			);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			MacroCommand ='/run stEP("' .. v.Mark .. '",2,1)';
			menu:AddLine("text", "选择/放弃","hasEditBox", 1,
			"editBoxText",MacroCommand,
			"notCheckable",1,
			"tooltipText",MacroCommand,"tooltipTitle","信息"
			);
			
			
			menu:AddLine("line",1);
			MacroCommand ='/run stEP("' .. v.Mark .. '",1,1)';
			menu:AddLine("text", "选择","hasEditBox", 1,
			"editBoxText",MacroCommand,
			"notCheckable",1,
			"tooltipText",MacroCommand,"tooltipTitle","信息"
			);
			
			menu:AddLine("line",1);
			MacroCommand ='/run stEP("' .. v.Mark .. '",0,1)';
			menu:AddLine("text", "放弃","hasEditBox", 1,
			"editBoxText",MacroCommand,
			"notCheckable",1,
			"tooltipText",MacroCommand,"tooltipTitle","信息"
			);
			
			
			
			
		elseif value[1] == "setkey" then
			
			local tbl = value[2].ExternalData.CastProgram;
			
			local v = tbl.tbl[tbl.index];
			
			local text;
			
			
			
			if v.Key.Value and v.Key.Value~="" then
				text=v.Key.Value;
			else
				text="鼠标移到我这看提示";
			end
					
			local str="菜单打勾后就进入按键设定状态，请直接按下快捷键就可以设定了。\n\n设定完毕请关闭本菜单，因为设定期间会影响聊天战斗什么的。\n\n注意：不能在战斗中设定快捷键！";
			
			menu:AddLine("line",1,"LineBrightness",1);
			
			if v.Key.lock then
				menu:AddLine("text", text,--"justifyH","CENTER",
				"Key",1,"KeyFunc","GetKeyText","KeyArg1",self,"KeyArg2",{v.Key,"Value",GlobalLevel-2},
				"MenuWidthMin",210,
				"tooltipText",str,"tooltipTitle","快捷键设定",
				"checked",v.Key.lock,
				"func", "SetTbl","arg1", self,"arg2", {v.Key,"lock",not v.Key.lock,level,nil,nil,GlobalLevel-1},
				"CloseButtonFunc","Del_key","CloseButtonArg1",self,
				"CloseButtonArg2",{v.Key,"Value",nil,GlobalLevel-2}
				);
				
			else
				
				menu:AddLine("text", text,--"justifyH","CENTER",
				
				"MenuWidthMin",210,
				"tooltipText",str,"tooltipTitle","快捷键设定",
				"checked",v.Key.lock,
				"func", "SetTbl","arg1", self,"arg2", {v.Key,"lock",not v.Key.lock,level},
				"CloseButtonFunc","Del_key","CloseButtonArg1",self,
				"CloseButtonArg2",{v.Key,"Value",nil,GlobalLevel-2}
				);
			
			end
			
			menu:AddLine("line",1,"LineBrightness",1);
			menu:AddLine();
			
			local str="只会对你选择的目标起作用。";
			
			
			menu:AddLine("text","只对目标","isTitle",1,"notCheckable",1,
			"tooltipText",str,"tooltipTitle","信息"
			);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			
			local str= "按一下【选择】再按【放弃】，在【选择/放弃】间切换。";
			menu:AddLine("text", "选择/放弃","isRadio",1,
			"checked",v.Key.KeySelect=="auto",
			"func", "SetTbl","arg1", self,"arg2", {v.Key,"KeySelect","auto",nil,nil,nil,GlobalLevel-2},
			"tooltipText",str,"tooltipTitle","说明"
			);
			
			local str= "选择施法方案。";
			menu:AddLine("text", "选择","isRadio",1,
			"checked",v.Key.KeySelect=="ok",
			"func", "SetTbl","arg1", self,"arg2", {v.Key,"KeySelect","ok",nil,nil,nil,GlobalLevel-2},
			"tooltipText",str,"tooltipTitle","说明"
			);
			
			local str= "放弃施法方案。";
			menu:AddLine("text", "放弃","isRadio",1,
			"checked",v.Key.KeySelect=="no",
			"func", "SetTbl","arg1", self,"arg2", {v.Key,"KeySelect","no",nil,nil,nil,GlobalLevel-2},
			"tooltipText",str,"tooltipTitle","说明"
			);
			
			local str= "执行施法方案,按1次就执行1次。\n\n不管你有没选择方案都会执行。";
			menu:AddLine("text", "执行","isRadio",1,
			"checked",v.Key.KeySelect=="run",
			"func", "SetTbl","arg1", self,"arg2", {v.Key,"KeySelect","run",nil,nil,nil,GlobalLevel-2},
			"tooltipText",str,"tooltipTitle","说明"
			);
			
			
			-------------------------------------
			menu:AddLine();
			
			local str="对你选择的目标全部路径起作用。\n\n注意:比如你想启用第3层的菜单，那么相关的1,2层菜单都会被启用。";
			
			menu:AddLine("text","全部目标路径","isTitle",1,
			"tooltipText",str,"tooltipTitle","信息","notCheckable",1
			);
			menu:AddLine("line",1,"LineBrightness",1,"LineHeight",8);
			
			local str= "按一下【选择】再按【放弃】，在【选择/放弃】间切换。";
			menu:AddLine("text", "选择/放弃","isRadio",1,
			"checked",v.Key.KeySelect=="auto1",
			"func", "SetTbl","arg1", self,"arg2", {v.Key,"KeySelect","auto1",nil,nil,nil,GlobalLevel-2},
			"tooltipText",str,"tooltipTitle","说明"
			);
			
			local str= "选择施法方案。";
			menu:AddLine("text", "选择","isRadio",1,
			"checked",v.Key.KeySelect=="ok1",
			"func", "SetTbl","arg1", self,"arg2", {v.Key,"KeySelect","ok1",nil,nil,nil,GlobalLevel-2},
			"tooltipText",str,"tooltipTitle","说明"
			);
			
			local str= "放弃施法方案。";
			menu:AddLine("text", "放弃","isRadio",1,
			"checked",v.Key.KeySelect=="no1",
			"func", "SetTbl","arg1", self,"arg2", {v.Key,"KeySelect","no1",nil,nil,nil,GlobalLevel-2},
			"tooltipText",str,"tooltipTitle","说明"
			);
			
			
			
		end
		
	end
	
	
	
end

function addon:Del_key(v,v1)
	
	v[1][v[2]]=v[3];
	ClearOverrideBindings(v[1].ButtonFrame);
	DropDownMenu:GlobaRefresh(v[4])
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