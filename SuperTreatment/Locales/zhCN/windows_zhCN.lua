
if (GetLocale() ~= 	"zhCN") then return; end;

local L=WowStLocale;
local Lib={};
local ST = SuperTreatmentInf;
local WowStMenu;

function Lib.WowStHelperFrame()

	local frame= WowStFrame.CreateMain("WowStHelperFrame",UIParent,"超级助手简单模式");
	frame:SetWidth(200);
	frame:SetHeight(350);
	frame:SetMinResize(200,150);
	frame:SetMaxResize(280,500);
	--frame:SetClampedToScreen(1);
	
	frame.ProjectTitle=CreateFrame("Frame","$parent_ProjectTitle",frame);
	frame.ProjectTitle:SetPoint("TOPLEFT", frame,"TOPLEFT",3,-30);
	frame.ProjectTitle:SetPoint("TOPRIGHT", frame, "TOPRIGHT");
	frame.ProjectTitle:SetHeight(25);
	
	

	frame.ProjectTitle.Label=frame.ProjectTitle:CreateFontString("$parent_Label");
	frame.ProjectTitle.Label:SetFontObject("GameFontRedSmall");
	frame.ProjectTitle.Label:SetText("方案");
	frame.ProjectTitle.Label:SetPoint("TOPLEFT",frame.ProjectTitle,"TOPLEFT",2,0);
	frame.ProjectTitle.Label:SetJustifyV("MIDDLE");
	
	frame.ProjectTitle.Delete=CreateFrame("Button","$parent_SchemeDelete",frame.ProjectTitle);
	frame.ProjectTitle.Delete:SetWidth(32);
	frame.ProjectTitle.Delete:SetHeight(32);
	frame.ProjectTitle.Delete:SetNormalTexture("Interface\\BUTTONS\\CancelButton-Up");
	frame.ProjectTitle.Delete:SetPushedTexture("Interface\\BUTTONS\\CancelButton-Down");
	frame.ProjectTitle.Delete:SetHighlightTexture("Interface\\BUTTONS\\CancelButton-Highlight");
	frame.ProjectTitle.Delete:SetPoint("TOPRIGHT",frame.ProjectTitle,"TOPRIGHT",21,8);
	frame.ProjectTitle.Delete:Hide();
	
	frame.Scheme= WowStFrame.CreateDropDownSearch("$parent_DDS",frame,"",{})
	frame.Scheme:ClearAllPoints();
	frame.Scheme:SetPoint("LEFT",frame.ProjectTitle.Label,"RIGHT",0,0);
	frame.Scheme:SetPoint("RIGHT",frame.ProjectTitle.Delete,"LEFT",5,0);
	
	frame.List=CreateFrame("ScrollFrame", "$parent_List", frame, "UIPanelScrollFrameTemplate");
	frame.List:EnableMouse(1);
	frame.List:SetPoint("TOPLEFT", frame.ProjectTitle, "BOTTOMLEFT", 1, 0);
	frame.List:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -32, 50);

	frame.List.Background = CreateFrame("Frame", "$parent_ListBackground", frame);
	frame.List.Background:SetPoint("TOPLEFT", frame.List, "TOPLEFT", 1, 5);
	frame.List.Background:SetPoint("BOTTOMRIGHT", frame.List, "BOTTOMRIGHT", 27, -5);
	frame.List.Background:SetBackdrop({
		bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = true, tileSize = 16, edgeSize = 16,
		insets = { left = 3, right = 3, top = 3, bottom = 3 }
	});
	frame.List.Background:SetBackdropColor(0, 0, 0,0.8);
	frame.List.Background:SetBackdropBorderColor(0.4, 0.4, 0.4);
	
	frame.List:EnableMouseWheel(1);
	frame.List.ScrollChild=CreateFrame("Frame","$parent_List_Child",frame.List);
	frame.List:SetScrollChild(frame.List.ScrollChild);
	frame.List:HookScript("OnSizeChanged" , function(self)
			local left, bottom, width, height = self:GetBoundsRect();							
			self.ScrollChild:SetWidth(width);
			self.ScrollChild:SetHeight(height);
	end);	
	frame.List.RightClickMenu=CreateFrame("Frame", "$parent_RightClickMenu", UIParent, "UIDropDownMenuTemplate");
	--[[
	frame.Input=CreateFrame("Button","$parent_Input",frame,"GameMenuButtonTemplate");
	frame.Input:SetWidth(45);
	frame.Input:SetPoint("TOPLEFT",frame.List,"BOTTOMLEFT",3,-5);
	frame.Input:SetText(L["SCHEMECONTROL_INPUT_BUTTON"]);
	--frame.Input:Disable();
	frame.Output=CreateFrame("Button","$parent_Output",frame,"GameMenuButtonTemplate");
	frame.Output:SetWidth(45);
	frame.Output:SetPoint("LEFT",frame.Input,"RIGHT",3,0);
	frame.Output:SetText(L["SCHEMECONTROL_OUTPUT_BUTTON"]);
	--frame.Output:Disable();
	--]]
	
	frame.StartStop=CreateFrame("Button","$parent_StartStop",frame,"GameMenuButtonTemplate");
	frame.StartStop:SetWidth(65);
	frame.StartStop:SetPoint("TOPLEFT",frame.List,"BOTTOMRIGHT",-39,-5);
	frame.StartStop.HoverTexture=frame.StartStop:CreateTexture();
	frame.StartStop.HoverTexture:SetTexture("Interface\\OPTIONSFRAME\\VoiceChat-Play");
	frame.StartStop.HoverTexture:SetGradient("Horizontal", 0,1,0,0,1,0);
	frame.StartStop.HoverTexture:SetPoint("LEFT",10,0);
	frame.StartStop.HoverTexture:SetWidth(12);
	frame.StartStop.HoverTexture:SetHeight(12);
	frame.StartStop.HoverTexture:SetDrawLayer("OVERLAY");
	frame.StartStop.Label=frame.StartStop:GetFontString();
	frame.StartStop.Label:SetPoint("LEFT",frame.StartStop.HoverTexture,"RIGHT",3,0);
	
	frame.ProjectTitle.Labe2=frame.ProjectTitle:CreateFontString("$parent_Label");
	frame.ProjectTitle.Labe2:SetFontObject("GameFontNormal");

	frame.ProjectTitle.Labe2:SetPoint("TOPLEFT",frame.List,"BOTTOMLEFT",2,-10);
	frame.ProjectTitle.Labe2:SetJustifyH("LEFT");
	frame.ProjectTitle.Labe2:SetWidth(200);
	frame.ProjectTitle.Labe2:SetHeight(32);
	--frame.ProjectTitle.Labe2:SetText("asdsadasd")
	
	return frame;
end

function Lib.WowStScriptBoxFrame()
	local frame= WowStFrame.CreateMain("WowStScriptBoxFrame",UIParent);
	frame:SetWidth(300);
	frame:SetHeight(300);
	frame:SetMinResize(200,200);
	frame:SetClampedToScreen(1);
	
    frame.Code = WowStFrame.CreateEditer("$parent_CodeFrame", frame);
	frame.Code:SetPoint("TOPLEFT", frame, "TOPLEFT", 5, -30);
	frame.Code:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -5, 5);
	frame.Edit=frame.Code.Edit;
	frame.Insert=function(self,text)
		self.Edit:ClearFocus(0);
		self.Edit:SetCursorPosition(0);
		self.Edit:Insert(text) end
	frame:SetScript("OnHide", function(self) self.Edit:SetText("")  end);
	return frame;
end

function Lib.WowStVarFrame(parent)
	local frame = WowStFrame.CreateMain("WowStVarFrame",UIParent);

	frame:SetWidth(400);
	frame:SetHeight(300);
	frame:SetMinResize(200,150);
	frame:SetMaxResize(680,500);
	--frame:SetResizable(nil);
	frame:SetClampedToScreen(1);

	frame.List=CreateFrame("ScrollFrame", "$parent_List", frame, "UIPanelScrollFrameTemplate");
	frame.List:EnableMouse(1);
	frame.List:SetPoint("TOPLEFT", frame, "TOPLEFT", 3, -30);
	frame.List:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -32, 10);

	frame.List.Background = CreateFrame("Frame", "$parent_ListBackground", frame);
	frame.List.Background:SetPoint("TOPLEFT", frame.List, "TOPLEFT", 1, 5);
	frame.List.Background:SetPoint("BOTTOMRIGHT", frame.List, "BOTTOMRIGHT", 27, -5);
	frame.List.Background:SetBackdrop({
		bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = true, tileSize = 16, edgeSize = 16,
		insets = { left = 3, right = 3, top = 3, bottom = 3 }
	});
	frame.List.Background:SetBackdropColor(0, 0, 0,0.8);
	frame.List.Background:SetBackdropBorderColor(0.4, 0.4, 0.4);
	
	frame.List:EnableMouseWheel(1);
	frame.List.ScrollChild=CreateFrame("Frame","$parent_List_Child",frame.List);
	frame.List:SetScrollChild(frame.List.ScrollChild);
	frame.List:HookScript("OnSizeChanged" , function(self)
			local left, bottom, width, height = self:GetBoundsRect();							
			self.ScrollChild:SetWidth(width);
			self.ScrollChild:SetHeight(height);
	end);
	frame.List.RightClickMenu=CreateFrame("Frame", "$parent_RightClickMenu", UIParent, "UIDropDownMenuTemplate");
	
	
	frame.Edit=WowStFrame.CreateMain("WowStAddVarFrame",UIParent);
	frame.Edit:SetResizable(nil);
	frame.Edit:SetWidth(350);
	frame.Edit:SetHeight(235);
	frame.Edit.MaxSize=200;
	frame.Edit.MinSize=20;
	
	frame.Edit.Background = CreateFrame("Frame", "$parent_ListBackground", frame.Edit);
	frame.Edit.Background:SetPoint("TOPLEFT", frame.Edit, "TOPLEFT", 5, -25);
	frame.Edit.Background:SetPoint("BOTTOMRIGHT", frame.Edit, "BOTTOMRIGHT", -5, 35);
	frame.Edit.Background:SetBackdrop({
		bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = true, tileSize = 16, edgeSize = 16,
		insets = { left = 3, right = 3, top = 3, bottom = 3 }
	});
	frame.Edit.Background:SetBackdropColor(0, 0, 0,0.8);
	frame.Edit.Background:SetBackdropBorderColor(0.4, 0.4, 0.4);
	
	frame.Edit.NameLabel=frame.Edit.Background:CreateFontString("$parent_NameLabel");
	frame.Edit.NameLabel:SetFontObject("GameFontNormal");
	frame.Edit.NameLabel:SetText("常量名称:");
	frame.Edit.NameLabel:SetPoint("TOPLEFT",frame.Edit.Background,"TOPLEFT",5,-10);
	frame.Edit.NameLabel:SetJustifyV("MIDDLE");
	
	frame.Edit.Name=CreateFrame("EditBox","$parent_NameEdit",frame.Edit.Background,"InputBoxTemplate");
	frame.Edit.Name:SetAutoFocus(false);
	frame.Edit.Name:SetHeight(16);
	frame.Edit.Name:SetWidth(200);
	frame.Edit.Name:SetPoint("LEFT",frame.Edit.NameLabel,"RIGHT",10,0);
	--main.List.Edit2:SetNumeric(true)
	frame.Edit.Name:SetFontObject("GameFontHighlightSmall");
	
	frame.Edit.DescriptionLabel=frame.Edit.Background:CreateFontString("$parent_DescribeLabel");
	frame.Edit.DescriptionLabel:SetFontObject("GameFontNormal");
	frame.Edit.DescriptionLabel:SetText("常量描述:");
	frame.Edit.DescriptionLabel:SetPoint("TOPLEFT",frame.Edit.NameLabel,"BOTTOMLEFT",0,-10);
	frame.Edit.DescriptionLabel:SetJustifyV("MIDDLE");
	
	frame.Edit.Description=CreateFrame("EditBox","$parent_DescribeEdit",frame.Edit.Background,"InputBoxTemplate");
	frame.Edit.Description:SetAutoFocus(false);
	frame.Edit.Description:SetHeight(16);
	frame.Edit.Description:SetWidth(200);
	frame.Edit.Description:SetPoint("LEFT",frame.Edit.DescriptionLabel,"RIGHT",10,0);
	--main.List.Edit2:SetNumeric(true)
	frame.Edit.Description:SetFontObject("GameFontHighlightSmall");
	
	frame.Edit.TypeLabel=frame.Edit.Background:CreateFontString("$parent_TypeLabel");
	frame.Edit.TypeLabel:SetFontObject("GameFontNormal");
	frame.Edit.TypeLabel:SetText("常量类型:");
	frame.Edit.TypeLabel:SetPoint("TOPLEFT",frame.Edit.DescriptionLabel,"BOTTOMLEFT",0,-10);
	frame.Edit.TypeLabel:SetJustifyV("MIDDLE");
	
	frame.Edit.TypeRadio1=CreateFrame("CheckButton", "$parent_TypeRadio1", frame.Edit,"SendMailRadioButtonTemplate")
	frame.Edit.TypeRadio1:SetPoint("LEFT",frame.Edit.TypeLabel,"RIGHT",10,0);
	
	frame.Edit.TypeRadio1Label=frame.Edit.Background:CreateFontString("$parent_TypeRadio1Label");
	frame.Edit.TypeRadio1Label:SetFontObject("GameFontNormal");
	frame.Edit.TypeRadio1Label:SetText("无值");
	frame.Edit.TypeRadio1Label:SetPoint("LEFT",frame.Edit.TypeRadio1,"RIGHT",0,0);

	frame.Edit.TypeRadio2=CreateFrame("CheckButton", "$parent_TypeRadio2",  frame.Edit,"SendMailRadioButtonTemplate")
	frame.Edit.TypeRadio2:SetPoint("LEFT",frame.Edit.TypeRadio1Label,"RIGHT",10,0);
	frame.Edit.TypeRadio2Label= frame.Edit.Background:CreateFontString("$parent_TypeRadio2Label");
	frame.Edit.TypeRadio2Label:SetFontObject("GameFontNormal");
	frame.Edit.TypeRadio2Label:SetText("单值");
	frame.Edit.TypeRadio2Label:SetPoint("LEFT",frame.Edit.TypeRadio2,"RIGHT",0,0);
	
	frame.Edit.TypeRadio3=CreateFrame("CheckButton", "$parent_TypeRadio3",  frame.Edit,"SendMailRadioButtonTemplate")
	frame.Edit.TypeRadio3:SetPoint("LEFT",frame.Edit.TypeRadio2Label,"RIGHT",10,0);
	frame.Edit.TypeRadio3Label= frame.Edit.Background:CreateFontString("$parent_TypeRadio3Label");
	frame.Edit.TypeRadio3Label:SetFontObject("GameFontNormal");
	frame.Edit.TypeRadio3Label:SetText("双值");
	frame.Edit.TypeRadio3Label:SetPoint("LEFT",frame.Edit.TypeRadio3,"RIGHT",0,0);
	
	frame.Edit.Join=CreateFrame("EditBox","$parent_JoinEdit", frame.Edit.Background,"InputBoxTemplate");
	frame.Edit.Join:SetAutoFocus(false);
	frame.Edit.Join:SetHeight(16);
	frame.Edit.Join:SetWidth(20);
	frame.Edit.Join:SetPoint("LEFT",frame.Edit.TypeRadio3Label,"RIGHT",10,0);
	--main.List.Edit2:SetNumeric(true)
	frame.Edit.Join:SetFontObject("GameFontHighlightSmall");
	
	frame.Edit.SizeLabel= frame.Edit.Background:CreateFontString("$parent_SizeLabel");
	frame.Edit.SizeLabel:SetFontObject("GameFontNormal");
	frame.Edit.SizeLabel:SetText("编辑框宽度:");
	frame.Edit.SizeLabel:SetPoint("TOPLEFT",frame.Edit.TypeLabel,"BOTTOMLEFT",0,-10);
	frame.Edit.SizeLabel:SetJustifyV("MIDDLE");

	frame.Edit.Size=CreateFrame("EditBox","$parent_SizeEdit", frame.Edit.Background,"InputBoxTemplate");
	frame.Edit.Size:SetAutoFocus(false);
	frame.Edit.Size:SetHeight(16);
	frame.Edit.Size:SetWidth(50);
	frame.Edit.Size:SetPoint("LEFT",frame.Edit.SizeLabel,"RIGHT",10,0);
	frame.Edit.Size:SetNumeric(true)
	frame.Edit.Size:SetFontObject("GameFontHighlightSmall");
	
	frame.Edit.SizeTLabel= frame.Edit.Background:CreateFontString("$parent_SizeTLabel");
	frame.Edit.SizeTLabel:SetFontObject("GameFontNormal");
	frame.Edit.SizeTLabel:SetText(string.format("范围: %s-%s 之间",frame.Edit.MinSize,frame.Edit.MaxSize));
	frame.Edit.SizeTLabel:SetPoint("LEFT",frame.Edit.Size,"RIGHT",10,0);
	frame.Edit.SizeTLabel:SetJustifyV("MIDDLE");
	
	frame.Edit.EditLabel= frame.Edit.Background:CreateFontString("$parent_EditLabel");
	frame.Edit.EditLabel:SetFontObject("GameFontNormal");
	frame.Edit.EditLabel:SetText("编辑框类型:");
	frame.Edit.EditLabel:SetPoint("TOPLEFT",frame.Edit.SizeLabel,"BOTTOMLEFT",0,-10);
	frame.Edit.EditLabel:SetJustifyV("MIDDLE");
	
	frame.Edit.EditRadio1=CreateFrame("CheckButton", "$parent_EditRadio1", frame.Edit,"SendMailRadioButtonTemplate")
	frame.Edit.EditRadio1:SetPoint("LEFT",frame.Edit.EditLabel,"RIGHT",10,0);
	frame.Edit.EditRadio1Label=frame.Edit.Background:CreateFontString("$parent_EditRadio1Label");
	frame.Edit.EditRadio1Label:SetFontObject("GameFontNormal");
	frame.Edit.EditRadio1Label:SetText("数字型");
	frame.Edit.EditRadio1Label:SetPoint("LEFT",frame.Edit.EditRadio1,"RIGHT",0,0);

	frame.Edit.EditRadio2=CreateFrame("CheckButton", "$parent_EditRadio2",  frame.Edit,"SendMailRadioButtonTemplate")
	frame.Edit.EditRadio2:SetPoint("LEFT",frame.Edit.EditRadio1Label,"RIGHT",10,0);
	frame.Edit.EditRadio2Label= frame.Edit.Background:CreateFontString("$parent_EditRadio2Label");
	frame.Edit.EditRadio2Label:SetFontObject("GameFontNormal");
	frame.Edit.EditRadio2Label:SetText("字符型");
	frame.Edit.EditRadio2Label:SetPoint("LEFT",frame.Edit.EditRadio2,"RIGHT",0,0);
	
	frame.Edit.EditRadio3=CreateFrame("CheckButton", "$parent_EditRadio3",  frame.Edit,"SendMailRadioButtonTemplate")
	frame.Edit.EditRadio3:SetPoint("LEFT",frame.Edit.EditRadio2Label,"RIGHT",10,0);
	frame.Edit.EditRadio3Label= frame.Edit.Background:CreateFontString("$parent_EditRadio2Label");
	frame.Edit.EditRadio3Label:SetFontObject("GameFontNormal");
	frame.Edit.EditRadio3Label:SetText("代码型");
	frame.Edit.EditRadio3Label:SetPoint("LEFT",frame.Edit.EditRadio3,"RIGHT",0,0);
	
	frame.Edit.ValueLabel= frame.Edit.Background:CreateFontString("$parent_ValueLabel");
	frame.Edit.ValueLabel:SetFontObject("GameFontNormal");
	frame.Edit.ValueLabel:SetText("常量初始值:");
	frame.Edit.ValueLabel:SetPoint("TOPLEFT",frame.Edit.EditLabel,"BOTTOMLEFT",0,-10);
	frame.Edit.ValueLabel:SetJustifyV("MIDDLE");
	
	frame.Edit.Value=CreateFrame("EditBox","$parent_ValueEdit", frame.Edit.Background,"InputBoxTemplate");
	frame.Edit.Value:SetAutoFocus(false);
	frame.Edit.Value:SetHeight(16);
	frame.Edit.Value:SetWidth(50);
	frame.Edit.Value:SetPoint("LEFT",frame.Edit.ValueLabel,"RIGHT",10,0);
	--main.List.Edit2:SetNumeric(true)
	frame.Edit.Value:SetFontObject("GameFontHighlightSmall");
	
	frame.Edit.JoinLabel= frame.Edit.Background:CreateFontString("$parent_JoinLabel");
	frame.Edit.JoinLabel:SetFontObject("GameFontNormal");
	frame.Edit.JoinLabel:SetText("-");
	frame.Edit.JoinLabel:SetPoint("LEFT",frame.Edit.Value,"RIGHT",5,0);
	frame.Edit.JoinLabel:SetJustifyV("MIDDLE");
	frame.Edit.JoinLabel:Hide();
	
	frame.Edit.Vice=CreateFrame("EditBox","$parent_ViceEdit", frame.Edit.Background,"InputBoxTemplate");
	frame.Edit.Vice:SetAutoFocus(false);
	frame.Edit.Vice:SetHeight(16);
	frame.Edit.Vice:SetWidth(50);
	frame.Edit.Vice:SetPoint("LEFT",frame.Edit.JoinLabel,"RIGHT",10,0);
	--main.List.Edit2:SetNumeric(true)
	frame.Edit.Vice:SetFontObject("GameFontHighlightSmall");
	frame.Edit.Vice:Hide();
	
	--frame.Edit:Show();
	frame.Edit.Save=CreateFrame("Button","$parent_Save", frame.Edit,"GameMenuButtonTemplate");
	frame.Edit.Save:SetWidth(85);
	frame.Edit.Save:SetPoint("TOP",frame.Edit.Background,"BOTTOM",3,-5);
	frame.Edit.Save:SetPoint("CENTER",frame.Edit.Background,"CENTER",0,0);
	frame.Edit.Save:SetText("保存设置");
	frame.Edit.Save:Disable();
	
	frame.Edit.Size:SetScript("OnLeave",function(self)
		frame.Edit:SetSize();
	end);
	
	frame.Edit.Join:SetScript("OnLeave",function(self)
		frame.Edit.JoinLabel:SetText(self:GetText());
	end);
	
	frame.Edit.SetSize=function(self)
		if(self.Size:GetText()=="")then
			self.Size:SetText(self.MinSize);
		elseif(tonumber(self.Size:GetText())>self.MaxSize)then
			self.Size:SetText(self.MaxSize);
		elseif(tonumber(self.Size:GetText())<self.MinSize)then
			self.Size:SetText(self.MinSize);
		end
			self.Value:SetWidth(tonumber(self.Size:GetText()));
			self.Vice:SetWidth(tonumber(self.Size:GetText()));
	end
	
	frame.Edit.SetTypeRadio=function(self)
		if(self.Type==1)then
			self.TypeRadio1:SetChecked(1);
			self.TypeRadio2:SetChecked(0);
			self.TypeRadio3:SetChecked(0);
			self.ValueLabel:Hide();
			self.JoinLabel:Hide();
			self.Value:Hide();
			self.Vice:Hide();
			self.Size:Hide();
			self.SizeLabel:Hide();
			self.SizeTLabel:Hide();
			self.Join:Hide();
			self.EditLabel:Hide();
			self.EditRadio1:Hide();
			self.EditRadio2:Hide();
			self.EditRadio3:Hide();
			self.EditRadio1Label:Hide();
			self.EditRadio2Label:Hide();
			self.EditRadio3Label:Hide();
		elseif(self.Type==3)then
			self.TypeRadio1:SetChecked(0);
			self.TypeRadio2:SetChecked(0);
			self.TypeRadio3:SetChecked(1);
			self.ValueLabel:Show();
			self.JoinLabel:Show();
			self.Value:Show();
			self.Vice:Show();
			self.Size:Show();
			self.SizeLabel:Show();
			self.SizeTLabel:Show();
			self.Join:Show();
			self.EditLabel:Show();
			self.EditRadio1:Show();
			self.EditRadio2:Show();
			self.EditRadio3:Show();
			self.EditRadio1Label:Show();
			self.EditRadio2Label:Show();
			self.EditRadio3Label:Show();
			self.MaxSize=80;
			self.MinSize=20;
			self:SetSize();
			self.SizeTLabel:SetText(string.format("范围: %s-%s 之间",self.MinSize,self.MaxSize));
		else
			self.TypeRadio1:SetChecked(0);
			self.TypeRadio2:SetChecked(1);
			self.TypeRadio3:SetChecked(0);
			self.ValueLabel:Show();
			self.JoinLabel:Hide();
			self.Value:Show();
			self.Vice:Hide();
			self.Size:Show();
			self.SizeLabel:Show();
			self.SizeTLabel:Show();
			self.Join:Hide();
			self.EditLabel:Show();
			self.EditRadio1:Show();
			self.EditRadio2:Show();
			self.EditRadio3:Show();
			self.EditRadio1Label:Show();
			self.EditRadio2Label:Show();
			self.EditRadio3Label:Show();
			
			self.MaxSize=200;
			self.MinSize=20;
			self:SetSize();
			self.SizeTLabel:SetText(string.format("范围: %s-%s 之间",self.MinSize,self.MaxSize));
		end
	end
	frame.Edit.SetEditRadio=function(self)
		if(self.ValueType==1)then
			self.EditRadio1:SetChecked(1);
			self.EditRadio2:SetChecked(0);
			self.EditRadio3:SetChecked(0);
			self.Value:SetNumeric(1);
			self.Vice:SetNumeric(1);
			if(tonumber(self.Value:GetText())==nil)then
				self.Value:SetText("");
			end
			if(tonumber(self.Vice:GetText())==nil)then
				self.Vice:SetText("");
			end
		elseif(self.ValueType==2)then
			self.EditRadio1:SetChecked(0);
			self.EditRadio2:SetChecked(1);
			self.EditRadio3:SetChecked(0);
			self.Value:SetNumeric(0);
			self.Vice:SetNumeric(0);
		elseif(self.ValueType==3)then
			self.EditRadio1:SetChecked(0);
			self.EditRadio2:SetChecked(0);
			self.EditRadio3:SetChecked(1);
			self.Value:SetNumeric(0);
			self.Vice:SetNumeric(0);
		end
	end
	
	
	frame.Edit.TypeRadio1:SetScript("OnClick",function(self)
		frame.Edit.Type=1;
		frame.Edit:SetTypeRadio();
	end);
	
	frame.Edit.TypeRadio2:SetScript("OnClick",function(self)
		frame.Edit.Type=2;
		frame.Edit:SetTypeRadio();
	end);
	
	frame.Edit.TypeRadio3:SetScript("OnClick",function(self)
		frame.Edit.Type=3;
		frame.Edit:SetTypeRadio();
	end);
	
	frame.Edit.EditRadio1:SetScript("OnClick",function(self)
		frame.Edit.ValueType=1;
		frame.Edit:SetEditRadio();
	end);
	
	frame.Edit.EditRadio2:SetScript("OnClick",function(self)
		frame.Edit.ValueType=2;
		frame.Edit:SetEditRadio();
	end);
	
	frame.Edit.EditRadio3:SetScript("OnClick",function(self)
		frame.Edit.ValueType=3;
		frame.Edit:SetEditRadio();
	end);
	
	frame.Edit:HookScript("OnShow" ,function(self)
		local v=self.Data or {};
		
		self.Name:SetText(v.Name or "");
		self.Description:SetText(v.Description or "");
		self.Join:SetText(v.Join or "-");
		self.Value:SetText(v.Value or "");
		self.Vice:SetText(v.ViceValue or "");
		self.Size:SetText(v.Size or 50);
		self.Type=v.Type or 2;
		self.ValueType=v.ValueType or 2;
		self:SetTypeRadio();
		self:SetEditRadio();
	end);

	frame.Edit.Name:SetScript("OnTextChanged",function(self)
		if(frame.Edit.Name:GetText()~="")then
			frame.Edit.Save:Enable();
		else
			frame.Edit.Save:Disable();
		end
	end);
	
	return frame;
end

function Lib.WowStScriptEditerFrame(parent)
	local frame= WowStFrame.CreateMain("WowStScriptEditerFrame",UIParent);
	frame:SetWidth(460);
	frame:SetHeight(500);
	frame:SetMinResize(360,200);
	frame:SetClampedToScreen(1);
	
	-- CodeFrame
    frame.Code = WowStFrame.CreateEditer("$parent_CodeFrame", frame, parent);
	frame.Code:SetPoint("TOPLEFT", frame, "TOPLEFT", 5, -25);
	frame.Code:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -5, 25);
	frame.Exit=frame.Close;
	frame.Edit=frame.Code.Edit;
	frame.Menu=frame.Code.Menu;
	frame.Menu:Show();
	return frame;
end

function Lib.Init()
	local main=Lib.WowStHelperFrame();
	local box=Lib.WowStScriptBoxFrame();
	main.Var=Lib.WowStVarFrame(main);
	main.Editer=Lib.WowStScriptEditerFrame(main);
	
	local zone = WowStFrame.CreateZoneText("WowStZoneText", UIParent);
	local minimap = WowStFrame.CreateMinimapButton("WowStMinimapButton", "Interface\\Addons\\SuperTreatment\\SuperTreatment.tga")
	minimap:RegisterDB("WowBeeIcon")
	--minimap:AddTooltipLine("超级助手")
	minimap:AddTooltipLine("超级助手核心插件  " .. GetAddOnMetadata("SuperTreatment", "Version"), 0, 1, 0, 1)
	minimap:SetDesaturated(true)
	minimap:RegisterForClicks("LeftButtonUp", "RightButtonUp")
	--WowStMenu = DropDownMenu_GetHandle()
	 WowStMenu = amMenu("Abc000")
end


Lib.Init();




local addon={};
addon.choose=0;
--local DropDownMenu = DropDownMenu_GetHandle();
local DropDownMenu = amMenu("Abc001")
DropDownMenu:SetMenuRequestFunc(addon, "OnMenuRequest")

function addon:FormatTooltipText(text)
	if not text then
		return;
	end
	
	return "|cff00ff00" .. text .. "|r";
end

local function NOT(v,text) 
	if v["not"] then
		return text .. "|cffff0000 [Not]|r";
	else
		return text;
	end
end

-- 定义菜单内容充填函数 "OnMenuRequest"
function addon:OnMenuRequest(level, value, menu)

	

	if level == 1 then -- 1级菜单内容
		
		if addon.choose ==1 then
		
			for i,v in pairs(SuperTreatmentAllDBF["Programs"]) do
				
				local str = addon:FormatTooltipText(v["Remark"]);
				str = str .. "\n点击加载方案";
				menu:AddLine("text", "|cff00ff00" .. i .. ". |r".. v["name"] ,
				"func", "SysProgramsDefault_List_Edit","arg1", self,"arg2",v["name"],
				"tooltipText",str,"tooltipTitle","加载方案","notCheckable",1);
				
				
				
			end
		
		elseif addon.choose == 2 then
			local valueB = addon.Selection;
				
				if SuperTreatmentDBF["Spells"]["List"][valueB] then
					
					Spells = SuperTreatmentDBF["Spells"]["List"][valueB]["spell"];
					local TBL = SuperTreatmentDBF["Spells"]["List"][valueB]
					
					
					SuperTreatment["type"]="Run"
					
					
					
					
					
					--menu:AddLine("text",SuperTreatmentDBF["Spells"]["List"][valueB]["name"],"isTitle",1)
					--menu:AddLine();
				
					for i, data in pairs(Spells) do
						
						local spellId = data["spellId"];
						local spellType = data["Type"];
						local checked;
						
						
						
						if spellType=="item" then
							
													
							local rank =Spells[i]["Rank"] or "" ;
							local itemLink = Spells[i]["itemLink"];
							
							if not itemLink then
								_,itemLink=GetItemInfo(spellId);
								Spells[i]["itemLink"] = itemLink;
							end
							
							
							
							
							local Texture = Spells[i]["Texture"];
							
						
							menu:AddLine(						
							"text", "|cff00ff00" .. i ..
							".|r " .. itemLink,
							"checked", data["checked"],
							"icon",Texture,
							
							
							"func","SpellsList", "arg1", self, "arg2", i
							
							)
							
						elseif spellType=="spell" then
						
							local spellLink = Spells[i]["itemLink"];
							
							if not spellLink then
								spellLink,_=GetSpellLink(spellId);
								Spells[i]["itemLink"] = spellLink;
							end
							
							
							local Texture = Spells[i]["Texture"];
							local rank =Spells[i]["Rank"];
													
						
							
							menu:AddLine(						
							"text", "|cff00ff00" .. i ..
							".|r " .. spellLink,
							"checked", data["checked"],
							"icon",Texture,
							
							
							"func","SpellsList", "arg1", self, "arg2", i
							
							)
							
							
						elseif spellType=="macro" or spellType=="script" then
						
							
							
							local MacroName = Spells[i]["MacroName"];
							local Texture = "";
							
							if Spells[i]["Texture"] then
								Texture =Spells[i]["Texture"];
							end
							
							local itemLink="";
							if Spells[i]["itemLink"] and Spells[i]["itemLink"] ~="" then
								itemLink =Spells[i]["itemLink"];
							else
								itemLink = MacroName;
							end
							
							if not rank then rank="";end
							local str=Spells[i]["Macro"].. "\n"..Spells[i]["Remarks"] ;
							
						
							
							menu:AddLine(						
							"text", "|cff00ff00" .. i ..
							".|r " .. itemLink,
							"checked", data["checked"],
							"icon",Texture,
							
							"tooltipText",str,
							"func","SpellsList", "arg1", self, "arg2", i,
							"tooltipTitle",MacroName
							)
						
						elseif spellType=="Run"   then
							
							
							SuperTreatment["ApiDbf"]=data["ApiDbf"];
							SuperTreatment["ApiDbfRun"]=data["ApiDbf"];
					
							local k = data["ApiDbf"][1]["id"];
							local rs =data["ApiDbf"][1];
																			
							local Apidata =SuperTreatment["Api"][k];
							
							
							local str=Spells[i]["itemLink"].. "\n"..Spells[i]["Remarks"] ;
							
							
							menu:AddLine(						
							"text",NOT(rs,"|cff00ff00" .. i .. ". |cffffffff" .. Apidata["inf"]),
							"checked", data["checked"],
							
							
							"tooltipText",str,
							"func","SpellsList", "arg1", self, "arg2", i,
							"tooltipTitle",Apidata["inf"]
							)
							
							
					

										
						end
						
						
						
					
						
					
					end
					
					
					
				end
		
		end
		
	end
	
end

function WowStHelper_ListUpdate(self)
	local i,name,v,s;
	s=0;
	self.Items=self.Items or {};
	self.Selected=-1;
	self.SchemeInfo={};
	
	self.SchemeInfo=SuperTreatmentDBF["Spells"]
	
	for i=1,table.getn(SuperTreatmentDBF["Spells"]["List"]) do
	
		if(table.getn(self.Items)<i)then
		--print(i,self.SchemeInfo.List[i].name)
			if not self.Items[i] then
				self.Items[i] = WowStFrame.CreateCheckBox("Check"..i, self.ScrollChild,self,self:GetParent());
			end	
			
			if i==1 then
				self.Items[i]:SetPoint("TOPLEFT",self.ScrollChild,"TOPLEFT",5,0);
				self.Items[i]:SetPoint("TOPRIGHT",self.ScrollChild,"TOPRIGHT",-20,0);
			else
				self.Items[i]:SetPoint("TOPLEFT",self.Items[i-1],"BOTTOMLEFT",0,3);
				self.Items[i]:SetPoint("TOPRIGHT",self.Items[i-1],"BOTTOMRIGHT",0,3);
			end
			
		end
		
			self.Items[i].Number:SetText(tostring(i));
			self.Items[i].Number:SetWidth((string.len(i)-1)*11+15)
			self.Items[i].Check:SetChecked(self.SchemeInfo.List[i].checked)
			if self.SchemeInfo.List[i].checked then
				self.Items[i].Name:SetText("|cffff0000" .. self.SchemeInfo.List[i].name);
			else
				self.Items[i].Name:SetText("|cffffff00" .. self.SchemeInfo.List[i].name);
			end
			if self.SchemeInfo.List[i]["spell"][1] and self.SchemeInfo.List[i]["spell"][1]["Texture"] then
				self.Items[i].Icon:SetTexture(self.SchemeInfo.List[i]["spell"][1]["Texture"]);
			end
			
			self.Items[i].Check:SetScript("OnClick" , function(c)
			
				self.SchemeInfo.List[i].checked=c:GetChecked();
				if c:GetChecked() then
				
					self.Items[i].Name:SetText("|cffff0000" .. self.SchemeInfo.List[i].name);
					--WowBeeHelper_SetStatus(string.format(L["LISTITEM_CHECK_STATUS_ENABLED"],self.SchemeInfo.Items[i].Name));
				else
					self.Items[i].Name:SetText("|cffffff00" .. self.SchemeInfo.List[i].name);
					--WowBeeHelper_SetStatus(string.format(L["LISTITEM_CHECK_STATUS_DISABLED"],self.SchemeInfo.Items[i].Name));
				end
				
				--[[if(c:GetChecked())then
					c:SetNormalTexture()
				else
					c:SetNormalTexture(self.SchemeInfo.Items[i].Icon)
				end]]
			end);
			
			self.Items[i]:Show();
			
			self.Items[i]:SetScript("OnMouseDown",function(c,btn)
				--if(WowBee.AutoHelper.RunList)then
				--	return
				--end;
				--print(btn)
				if btn=="LeftButton" and IsControlKeyDown() then
					if(table.getn(self.SchemeInfo.List)>1)then
						self.Cursor=i
						self.TCursor=true;
						SetCursor(self.SchemeInfo.List[i]["spell"][1]["Texture"])
						return;
					end
				end
			end);
			
			self.Items[i]:SetScript("OnMouseUp",function(c,btn)
				--if(WowBee.AutoHelper.RunList)then
				--	return
				--end;
				if btn=="LeftButton" then
					CloseDropDownMenus(1);
					if(self.TCursor)then
						--self:AddItemOnCursor(self.Cursor,i);
						self.TCursor=nil;
						self.Selection=self.Cursor;
					else
						--self:AddItemOnCursor(i);
						if self.Selection==i then
							self.Selection=-1;
						else
							self.Selection=i;
						end
					end
					ResetCursor();
					self.TCursor=nil;
					return;
				elseif btn=="RightButton" then
					self.Selection=i;
					CloseDropDownMenus(1);
					ToggleDropDownMenu(1,nil,self.Items[i].ItemsMenu,"cursor",0,0);
					addon.Selection=i;
					addon.choose=2;
					DropDownMenu:Toggle("TOPLEFT", self.Items[i], "BOTTOMLEFT",20,0)
				end
			end);
			
			self.Items[i]:SetScript("OnUpdate",function()
				if(self.Items[i]:IsVisible())then
				
					if self.Selection==i and (not self.Items[i].Mask_MouseDown:IsVisible()) then
						self.Items[i].Mask_MouseOver:Hide();
						self.Items[i].Mask_MouseDown:Show();
					end
					if self.Selection~=i and self.Items[i].Mask_MouseDown:IsVisible() then
					
						self.Items[i].Mask_MouseDown:Hide();
					end
				end
				
			end);
			
		
		s=i;
		
	end
	
		local k = table.getn(self.Items);
		
			for h =s+1 , k do
			  self.Items[h]:Hide();
			end
		
		
		
		WowStHelperFrame.Scheme.DDEdit:SetText(SuperTreatmentDBF["name"])
		
end

local WowStHelperFrame_v_OnUpdate_v=true;
local WowStHelperFrame_v = CreateFrame("Frame", nil ,UIParent) 
local StartTime=GetTime();

local function WowStHelperFrame_v_OnUpdate()
	
	if GetTime() - StartTime>0.1 then
	
		if SuperTreatmentSet["stop"] then
			SuperTreatmentFrame_stop:SetText("运行");
			WowStHelperFrame.StartStop.HoverTexture:SetTexture("Interface\\OPTIONSFRAME\\VoiceChat-Play");
			WowStHelperFrame.StartStop.HoverTexture:SetGradient("Horizontal", 0,1,0,0,1,0);
			WowStHelperFrame.StartStop:SetText("运行");
		else
			SuperTreatmentFrame_stop:SetText("停止");
			WowStHelperFrame.StartStop:SetText("停止");
			WowStHelperFrame.StartStop.HoverTexture:SetTexture("Interface\\OPTIONSFRAME\\VoiceChat-Record");
			WowStHelperFrame.StartStop.HoverTexture:SetGradient("Horizontal", 1,0,0,1,0,0);
			
		end
		
		StartTime=GetTime();
		
	end
	
	
	if WowStHelperFrame_v_OnUpdate_v then
		
		WowStHelperFrame_v_OnUpdate_v=false;
		WowStHelper_ListUpdate(WowStHelperFrame.List);
		WowStHelperFrame:Hide();
		wowam.Addons={};
		wowam.Addons["SHelper"]={};
		wowam.Addons["SHelper"]["AddonsName"]="超级助手简单模式";
		wowam.Addons["SHelper"]["name"]="超级助手简单模式";
		wowam.Addons["SHelper"]["run"]="WowStHelperFrame_Show()";
		wowam.Addons["SHelper"]["inf"]="超级助手简单模式";
		wowam.Addons["SHelper"]["is"]=WowStHelperFrame;
		wowam.Addons["SHelper"]["icon"]="Interface\\Addons\\SuperTreatment\\SuperTreatment.tga"
		wowam.Addons["SuperTreatment"]={};
		wowam.Addons["SuperTreatment"]["AddonsName"]="超级助手正常模式";
		wowam.Addons["SuperTreatment"]["name"]="超级助手正常模式";
		wowam.Addons["SuperTreatment"]["run"]="SuperTreatment_Show()";
		wowam.Addons["SuperTreatment"]["inf"]="超级助手正常模式";
		wowam.Addons["SuperTreatment"]["is"]=WowStHelperFrame;
		wowam.Addons["SuperTreatment"]["icon"]="Interface\\Addons\\SuperTreatment\\SuperTreatment.tga"
	end
	

end
WowStHelperFrame_v:SetScript("OnUpdate",WowStHelperFrame_v_OnUpdate);
	
--WowStHelper_ListUpdate(WowStHelperFrame.List)

function addon:SpellsList(i,v)
	--print(i,v)
	
	local t = SuperTreatmentDBF["Spells"]["List"][addon.Selection]["spell"][i]
	
	t["checked"]= not t["checked"];
	--Spells[i]["checked"] = not Spells[i]["checked"];
	
	DropDownMenu:Refresh(1)	
	
	
						
end

function WowStHelperFrame_Show()
	
	WowStHelper_ListUpdate(WowStHelperFrame.List);
	WowStHelperFrame:Show();
	SuperTreatmentFrame:Hide();
	
end

function WowStHelperFrame_Hide()
	
	WowStHelperFrame:Hide();
	
end

WowStHelperFrame.Scheme.DDButton:SetScript("OnClick",function()

		addon.choose=1;
		DropDownMenu:Toggle("TOPLEFT", WowStHelperFrame.Scheme, "BOTTOMLEFT",0,0)
	
	end);
	
	
function addon:SysProgramsDefault_List_Edit(i,v)
	
	SuperTreatment_Program_load(i)
	
	DropDownMenu:Close(1)
	WowStHelper_ListUpdate(WowStHelperFrame.List);	
	
	
						
end

WowStHelperFrame.StartStop:SetScript("OnClick",function(self)
	SuperTreatment_Start();
end);


WowStMinimapButton:SetScript("OnClick",function(self, button)

	local addon={};
	function addon:WowBeeMenu_OnClick(a)
		RunScript(a);
		WowStMenu:Close(1);
	end

	function addon:OnMenuRequest(level, value, menu)
		if level == 1 then 
			menu:AddLine()
			for i,v in pairs(wowam.Addons) do
				if v["is"] then
					menu:AddLine("text", v["name"], "checked",nil,"func","WowBeeMenu_OnClick", "arg1", self, "arg2", v["run"],"icon",v["icon"])
				else
					menu:AddLine("text", v["name"], "hasConfirm", 1, "confirmText", v["AddonsName"] .. " 没安装或者没启用！","confirmButton1",_G["OKAY"],"icon",v["icon"])
				end
			end
			menu:AddLine() 
			menu:AddLine("text", "|cffffff00" .. CLOSE, "closeWhenClicked", 1)
		end
	end

	function addon:WowBeeMenu_OnClick(a)
		RunScript(a);
		WowStMenu:Close(1);
	end

	WowStMenu:SetMenuRequestFunc(addon,"OnMenuRequest")

	if button  then
		WowStMenu:Toggle(self)
		GameTooltip:Hide()
	end
end);