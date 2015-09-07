local L=WowStScriptEditLocale;

WowStScriptEditerFrame.Edit:SetScript("OnEscapePressed",  function(self)
	WowStScriptEditerFrame.Close:Click();
end);
WowStScriptEditerFrame.Edit:SetScript("OnCursorChanged", function(self)
	if(not self.Debug)then
		local _, line = string.gsub(string.sub(self:GetText(1), 1, self:GetCursorPosition()), "\n", "\n")
		WowStScriptEditerFrame:SetMessage(string.format(L["EDITER_LINE_TITLE"],line+1))
	else
		self.Debug=nil;
	end
end);
WowStScriptEditerFrame.Exit:SetScript("OnClick",function(self, button)
	if(WowStScriptEditerFrame.Value.Macro~=WowStScriptEditerFrame.Edit:GetText())then
		StaticPopupDialogs["Show_MessageBox_Save"] = {
			text = string.format(L["EDITER_EXIT_SAVE_CONFIRM"]),
			button1 = OKAY,
			button2 = CANCEL,
			button3 = NO,
			OnAccept = function()
				local k;
				local scriptlist;
				local errlist={};
				local code;
				
				
				
				code=WowStScriptEditerFrame.Edit:GetText();
				
				--print(code)
				scriptlist=string.format("%s%s",scriptlist or "",code);
				local _, line = string.gsub(code, "\n", "\n")
				
				for k=1, line+1 do
					table.insert(errlist,{Scheme=WowStScriptEditerFrame.Scheme.Name,Name=WowStScriptEditerFrame.Title,Line=k});
				end

				if(WowStHelper_OnScript(scriptlist,errlist))then
					WowStScriptEditerFrame.Value.Macro=WowStScriptEditerFrame.Edit:GetText();
					WowStScriptEditerFrame.Value.time=GetTime();
					WowStScriptEditerFrame.Value.Title=nil;
					WowStScriptEditerFrame:Hide();
					--lib.List:Update()
					WowStHelper_SetStatus(string.format(L["EDITER_SAVE_FINISH"],WowStScriptEditerFrame.Title))
				end
			end,
			OnAlt = function()
				WowStScriptEditerFrame:Hide();
			end,
			timeout = 0,
			whileDead = true,
			hideOnEscape = true,
		};
		StaticPopup_Show("Show_MessageBox_Save");
	else
		WowStScriptEditerFrame:Hide();
	end
end);
WowStScriptEditerFrame.Menu:AddItem("item1",L["EDITER_MENU_SAVE_TITLE"],function(self,edit)
	edit.Debug=true;
	edit:SetFocus();
	edit:ClearFocus();
	local k;
	local scriptlist;
	local errlist={};
	local code =edit:GetText();
	
	
	WowStScriptEditerFrame.Value.Macro=code;
	WowStScriptEditerFrame.Value.time=GetTime();
	
end);

WowStScriptEditerFrame.Menu:AddItem("item2",L["EDITER_MENU_DEBUG_TITLE"],function(self,edit)
	edit.Debug=true;
	edit:SetFocus();
	edit:ClearFocus();
	
	local k;
	local scriptlist;
	local errlist={};
	local code;
	
	
	
	code=edit:GetText();
	--print(code)
	scriptlist=string.format("%s%s",scriptlist or "",code);
	local _, line = string.gsub(code, "\n", "\n")
	
	for k=1, line+1 do
		table.insert(errlist,{Scheme=WowStScriptEditerFrame.Scheme.Name,Name=WowStScriptEditerFrame.Title,Line=k});
	end

	if(WowStHelper_OnScript(scriptlist,errlist))then
		WowStScriptBoxFrame:Hide();
		WowStScriptEditerFrame:SetMessage(string.format(L["EDITER_DEBUG_FINISH"],WowStScriptEditerFrame.Title))
	end
end);

WowStScriptEditerFrame.Bind=function(self,scheme,arg1)
	WowStScriptEditerFrame.Value=arg1;
	WowStScriptEditerFrame.Scheme=scheme;
	WowStScriptEditerFrame.Title=arg1.name;
	
		
	WowStScriptEditerFrame:SetTitle(string.format(L["EDITER_TITLE"],arg1.name))
	WowStScriptEditerFrame.Edit:SetText(arg1.Macro or "")
	WowStScriptEditerFrame:Show();
end



function WowStHelper_OnScript(script,errlist,stop)

	if WowStScriptEditerFrame.Value.type=="macro" then
		return true;
	end
	--print(script)
	local func, err, status, msg;
	if(script)then
		func, err = loadstring(script)
		if func then
			func, err = loadstring(script.." return;")
			if func then
				status, err = pcall(func)
				if not status then
					msg=err;
				end
			else
				msg=err;
			end
		else
			msg=err;
		end
	end	
	if(msg)then
		if(not WowStScriptBoxFrame:IsShown()) then
			WowStScriptBoxFrame:ClearAllPoints();
			WowStScriptBoxFrame:SetPoint("TOPLEFT", WowStScriptEditerFrame, "TOPRIGHT");
			WowStScriptBoxFrame:SetTitle(L["GUI_BOXFRAME_TITLE"]);
		end
		if(errlist)then
			local a,b,line= string.find(msg,"[^:]:(%d+):");
			line=tonumber(line);
			if(line and errlist[line])then
			--print(errlist[line].Scheme)
				--local strs= string.format("['%s'-'%s']:%s%s",errlist[line].Scheme,errlist[line].Name,errlist[line].Line,string.sub(msg, b))
				--msg=strs;
			end
			--if(stop and WowBee.AutoHelper.Start)then
			--	WowBeeHelper_SetAutoScript(nil);
			--end
		end
		
		WowStScriptBoxFrame:Insert(msg.."\n"..string.rep("=", 20).."\n"..date().."\n"..string.rep("=", 20).."\n\n");
		WowStScriptBoxFrame:Show();
		return false;
	else
		--WowStScriptBoxFrame:Hide();
		return true;
	end
end

function WowStHelper_SetStatus(text)
	WowStScriptEditerFrame:SetMessage(text);
end

