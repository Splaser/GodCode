
local addon = CreateFrame("Frame")
addon.title = "上帝指令"
addon.version = GetAddOnMetadata("GC", "Version");
addon.db = {}

addon:RegisterEvent("VARIABLES_LOADED")
addon:SetScript("OnEvent", function(self, event, ...)
	local func = self[event]
	if type(func) == "function" then
		func(self, ...)
	end

end)

local scanTip = CreateFrame("GameTooltip", "WowAmScanTooltip", WorldFrame, "GameTooltipTemplate")
scanTip:SetOwner(WorldFrame, "ANCHOR_NONE")

--amMenu("Abc001")
--local DropDownMenu = DropDownMenu_GetHandle()

local DropDownMenu = amMenu("Abc001")


DropDownMenu:SetMenuRequestFunc(addon, "OnMenuRequest")

local minimapButton = UICreateMinimapButton("WowAmMinimapButton", "Interface\\Addons\\GC\\Icon.tga")
minimapButton:RegisterDB("wowam_config_icon")
minimapButton:AddTooltipLine(addon.title)
minimapButton:AddTooltipLine("上帝指令插件包  " .. addon.version, 0, 1, 0, 1)
minimapButton:SetDesaturated(true)
minimapButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
minimapButton:SetScript("OnClick", function(self, button)
	if button  then
		DropDownMenu:Toggle(self)
		GameTooltip:Hide()
	elseif wowam_config_icon.on then
		addon:AnnounceData(IsShiftKeyDown())
	end
end)




function addon:Print(msg, ...)
	DEFAULT_CHAT_FRAME:AddMessage("|cffffff78"..tostring(msg), ...)
end

function addon:VARIABLES_LOADED()
	if type(wowam_config_icon) ~= "table" then
		wowam_config_icon = {}
	end

	

	--self:Print("|cffffff00"..self.title.." "..self.version.." by Abin Loaded.|r")
end





-- 定義菜單內容充填函數 "OnMenuRequest"
function addon:OnMenuRequest(level, value, menu)

	if level == 1 then -- 1級菜單內容

		--menu:AddLine("text", self.title, "isTitle", 1) -- 標題行
		if (GetLocale() == 	"zhCN") then
			menu:AddLine("text", "技能信息", "hasEditBox", 1, "editBoxText", wowam.spell.text)
			
			if amTsetSpellId then
				menu:AddLine() -- 分割行
				menu:AddLine("text", "技能錯誤信息",  "hasArrow", 1, "value", "ErrorList")
			end
			
					
			menu:AddLine() -- 分割行
			
		end
		
		local str
		
		if wowam_config.new_version then
			str =wowam.Colors.MAGENTA;
		else
			str =wowam.Colors.GREEN;
		end
		menu:AddLine("text", str .."啟用舊版上帝指令插件庫","checked", wowam_config.new_version,"func", "new_version","arg1", self)
		
				
		menu:AddLine() -- 分割行
		local str = "|cffffff00amisr(),amrun()函數將受到該設定影響"
		
		
		menu:AddLine("text", "|cffffff00啟用判斷GCD提前(" .. wowam_config.SetGCD_Time .. "秒)結束判斷","checked", wowam_config.SetGCD,"func", "SetGCD_Time_ON","arg1", self,"hasArrow", 1, "value", "GroupGCD","tooltipText",str)
		
		
		menu:AddLine() -- 分割行
		
		menu:AddLine("text", "|cffffff00設定技能提前施放時間|r", "hasArrow", 1, "value", "SetSpellAttackTime")
		
		menu:AddLine() -- 分割行
		menu:AddLine("text", "|cffffff00饰品无需目标可以施放","checked", not wowam_config.TRINKET_TARGET,"func", "TRINKET_TARGET","arg1", self)
		
		menu:AddLine() -- 分割行
		
				
		menu:AddLine("text", "|cffffff00上帝指令調試信息顯示設定/開啟/關閉","checked", wowam_config.Amisr["顯示調試信息"],"func", "SetDebugInformation","arg1", self,"hasArrow", 1, "value", "SetDebugInformation","tooltipText",str)
		
		
		menu:AddLine() -- 分割行
		
		menu:AddLine("text", "|cffffff00當技能無效時的處理設定", "hasArrow", 1, "value", "SetSPELL_FAILED")
		
		
		menu:AddLine() -- 分割行
		menu:AddLine("text", "|cffffff00自動加入隨機副本(臺服)","checked", wowam_config.Proposal,"func", "setProposal","arg1", self)
		
		menu:AddLine() -- 分割行
		menu:AddLine("text", "|cffffff00自動回復密語設定/開啟/關閉","checked", wowam_config.Passphrase,"func", "Set_Passphrase_ON","arg1", self,"hasArrow", 1, "value", "Set_Passphrase","tooltipText",str)
		
		menu:AddLine() -- 分割行
		
		local str = "|cff00ff00該設定是爲了在競技場低調而設定的。當你沒設定時，打斷是秒斷這樣會被玩家投訴從而被封號的可能。所以需要設定個時間延時打斷。|r\n\n当设定值大于 0 时 amac 在（|cffff0000技能施放时间 > 设定值|r）时判断为真。如果函数参数已经设定了时间那么以该值为准。\n\n|cffff0000注意:|r\n|cff00ffff(1)|r進入競技場會自動啟用該設定，其他地方關閉。\n|cff00ffff(2)|r該設定對|cffffff00超級助手|r插件無效。\n\n|cffffff00選用請打鉤"
			
			
			menu:AddLine("text", "|cffff0000竞技场 - |cffffff00低調打断设定 amac 函数(" .. wowam_config.amac_time .."秒)|r",
			"hasEditBox", 1,"checked", wowam_config.amac_arena,"func", "amac_arena_ON","arg1", self,
			"editBoxText", wowam_config.amac_time, "editBoxFunc", "SetamacTime", "editBoxArg1", self,
			"tooltipText",str,"tooltipTitle","說明")
		
		
		for i,v in pairs(wowam.addons) do
			if v["is"] then
				menu:AddLine("text", v["name"], "checked",nil,"func","MagicCastON", "arg1", self, "arg2", v["run"],"icon",v["icon"])
			else
				menu:AddLine("text", v["name"], "hasConfirm", 1, "confirmText", v["AddonsName"] .. " 沒安裝或者沒啟用！","confirmButton1",_G["OKAY"],"icon",v["icon"])
				
			end
		end
		
		
		
		
		menu:AddLine() -- 分割行
		
				
		menu:AddLine("text", "|cffffff00" .. CLOSE, "closeWhenClicked", 1)

	elseif level == 2 then -- 2級菜單內容
	
		if value == "ErrorList" then
		
			-- 菜单表格标题
			menu:AddColumnHeader("名稱", "CENTER")
			menu:AddColumnHeader("ID", "CENTER")
			menu:AddColumnHeader("錯誤", "CENTER")
			menu:AddColumnHeader("正確", "CENTER")
			menu:AddColumnHeader("說明", "CENTER")
			amTsetSpellId(menu);
			
			menu:AddLine() -- 分割行
			--wowam.spell.ErrorText="";
			menu:AddLine("text", "錯誤信息提取", "hasEditBox", 1, "editBoxText", wowam.spell.ErrorText)
		
		
		
		elseif value == "GroupGCD" then
		
			
			local str = "|cffffff00設定為0那就是系統GCD時間。設定為0.01那就是amisr(),amrun()函數比GCD提前0.01秒結束判斷"
			
			menu:AddLine("text", "輸入時間(秒)", "hasEditBox", 1, "editBoxText", wowam_config.SetGCD_Time, "editBoxFunc", "SetGCD_Time", "editBoxArg1", self,"tooltipText",str)
		

		elseif value == "SetSpellAttackTime" then
		
			local str = "|cffffff00默認為0，沒任何提前。\n\n如：設定為0.01那麼當前技能（施放或者冷卻）還差0.01秒結束時，可以施放下個技能。"
			
			menu:AddLine("text", "設定"..wowam.Colors.RED .. "非" .. wowam.Colors.WHITE .."瞬發技能提前(" .. wowam_config.SpellAttackTime .. "秒)施放", "hasEditBox", 1, "editBoxText", wowam_config.SpellAttackTime, "editBoxFunc", "SpellAttackTime", "editBoxArg1", self,"tooltipText",str)
		
			local str = "|cffffff00默認為0，沒任何提前。\n\n如：設定為0.01那麼當前技能（施放或者冷卻）還差0.01秒結束時，可以施放下個技能。"
			
			menu:AddLine("text", "設定瞬發技能提前(" .. wowam_config.PromptSpellAttackTime .. "秒)施放", "hasEditBox", 1, "editBoxText", wowam_config.PromptSpellAttackTime, "editBoxFunc", "PromptSpellAttackTime", "editBoxArg1", self,"tooltipText",str)
		
		elseif value == "SetDebugInformation" then
			
			menu:AddLine("text", "|cffffff00顯示/關閉 顯示成功的調試信息","checked", wowam_config.Amisr["顯示成功的調試信息"],"func", "SetDebugInformationOK","arg1", self)
			menu:AddLine("text", "|cffffff00顯示/關閉 顯示失敗的調試信息","checked", wowam_config.Amisr["顯示失敗的調試信息"],"func", "SetDebugInformationERR","arg1", self)
			menu:AddLine() -- 分割行
			
			menu:AddLine("text", "|cffffff00顯示/關閉 過濾調試信息","checked", wowam_config.Amisr["過濾調試信息"],"func", "SetDebugInformation_Filter_ON","arg1", self,"hasArrow", 1, "value", "SetDebugInformation_Filter","tooltipText",str)
		
		elseif value == "SetSPELL_FAILED" then
		
			menu:AddLine("text", wowam.Colors.RED .. "▼" .. wowam.Colors.GREEN .. "當出現下列情況時禁用該技能/目標(" .. wowam_config.SPELL_STOP_TIME .. "秒)", "hasEditBox", 1, "editBoxText", wowam_config.SPELL_STOP_TIME, "editBoxFunc", "SPELL_STOP_TIME", "editBoxArg1", self,"tooltipText",str)
			menu:AddLine() -- 分割行
			
			menu:AddLine("text", "|cffffff00" .. SPELL_FAILED_OUT_OF_RANGE ,"checked", wowam_config.FAILED_TEXT[SPELL_FAILED_OUT_OF_RANGE],"func", "SPELL_FAILED_OUT_OF_RANGE","arg1", self)
			
			menu:AddLine("text", "|cffffff00" .. SPELL_FAILED_NOPATH ,"checked", wowam_config.FAILED_TEXT[SPELL_FAILED_NOPATH],"func", "SPELL_FAILED_NOPATH","arg1", self)
			
			menu:AddLine("text", "|cffffff00" .. SPELL_FAILED_BAD_IMPLICIT_TARGETS ,"checked", wowam_config.FAILED_TEXT[SPELL_FAILED_BAD_IMPLICIT_TARGETS],"func", "SPELL_FAILED_BAD_IMPLICIT_TARGETS","arg1", self)
			menu:AddLine("text", "|cffffff00" .. SPELL_FAILED_LINE_OF_SIGHT ,"checked", wowam_config.FAILED_TEXT[SPELL_FAILED_LINE_OF_SIGHT],"func", "SPELL_FAILED_LINE_OF_SIGHT","arg1", self)
			menu:AddLine("text", "|cffffff00" .. SPELL_FAILED_TOO_CLOSE ,"checked", wowam_config.FAILED_TEXT[SPELL_FAILED_TOO_CLOSE],"func", "SPELL_FAILED_TOO_CLOSE","arg1", self)
			menu:AddLine("text", "|cffffff00" .. SPELL_FAILED_TARGETS_DEAD ,"checked", wowam_config.FAILED_TEXT[SPELL_FAILED_TARGETS_DEAD],"func", "SPELL_FAILED_TARGETS_DEAD","arg1", self)
			menu:AddLine("text", "|cffffff00" .. SPELL_FAILED_UNIT_NOT_INFRONT ,"checked", wowam_config.FAILED_TEXT[SPELL_FAILED_UNIT_NOT_INFRONT],"func", "SPELL_FAILED_UNIT_NOT_INFRONT","arg1", self)
			menu:AddLine("text", "|cffffff00" .. SPELL_FAILED_NOT_BEHIND ,"checked", wowam_config.FAILED_TEXT[SPELL_FAILED_NOT_BEHIND],"func", "SPELL_FAILED_NOT_BEHIND","arg1", self)
			menu:AddLine("text", "|cffffff00" .. SPELL_FAILED_ONLY_STEALTHED ,"checked", wowam_config.FAILED_TEXT[SPELL_FAILED_ONLY_STEALTHED],"func", "SPELL_FAILED_ONLY_STEALTHED","arg1", self)
			menu:AddLine("text", "|cffffff00" .. SPELL_FAILED_BAD_TARGETS ,"checked", wowam_config.FAILED_TEXT[SPELL_FAILED_BAD_TARGETS],"func", "SPELL_FAILED_BAD_TARGETS","arg1", self)
			menu:AddLine("text", "|cffffff00" .. SPELL_FAILED_AURA_BOUNCED ,"checked", wowam_config.FAILED_TEXT[SPELL_FAILED_AURA_BOUNCED],"func", "SPELL_FAILED_AURA_BOUNCED","arg1", self)
			menu:AddLine("text", "|cffffff00" .. SPELL_FAILED_NO_COMBO_POINTS ,"checked", wowam_config.FAILED_TEXT[SPELL_FAILED_NO_COMBO_POINTS],"func", "SPELL_FAILED_NO_COMBO_POINTS","arg1", self)
			
			
			menu:AddLine("text", "|cffffff00" .. SPELL_FAILED_ONLY_OUTDOORS ,"checked", wowam_config.FAILED_TEXT[SPELL_FAILED_ONLY_OUTDOORS],"func", "SPELL_FAILED_ONLY_OUTDOORS","arg1", self)
			
		elseif value == "Set_Passphrase" then

			menu:AddLine("text", "輸入要回復密語內容", "hasEditBox", 1, "editBoxText", wowam_config.Passphrase_text, "editBoxFunc", "Passphrase_text", "editBoxArg1", self,"tooltipText",str)
		
			 
		end
		
	elseif level == 3 then -- 2級菜單內容	
	
			if value == "SetDebugInformation_Filter" then
			
				local str = "|cffffff00輸入過濾關鍵字,多個關鍵字用逗號分隔開"
				
				menu:AddLine("text", "輸入過濾關鍵字", "hasEditBox", 1, "editBoxText", wowam_config.Formats["過濾調試信息"], "editBoxFunc", "SetDebugInformation_Filter_EDIT", "editBoxArg1", self,"tooltipText",str)
		
			end
			
		
	
	
	end
end


-- 点击单选按钮时会调用这个函数



function addon:SetGCD_Time_ON()
	
	
		wowam_config.SetGCD = not wowam_config.SetGCD;
		DropDownMenu:Refresh(1)
	
end



function addon:setProposal()
	
	
		wowam_config.Proposal = not wowam_config.Proposal;
		DropDownMenu:Refresh(1)
	
end


function addon:new_version()
	
	
		wowam_config.new_version = not wowam_config.new_version;
		DropDownMenu:Refresh(1)
	
end



function addon:Set_Passphrase_ON()
	
	
		wowam_config.Passphrase = not wowam_config.Passphrase;
		DropDownMenu:Refresh(1)
	
end

-- 输入文本框时会调用这个函数
function addon:SetGCD_Time(text)
	if tonumber(text) then
		self.text = text
		wowam_config.SetGCD_Time=tonumber(text);
		DropDownMenu:Refresh(1)
	end
end



-- 输入文本框时会调用这个函数
function addon:Passphrase_text(text)
	
		self.text = text
		wowam_config.Passphrase_text=text;
		DropDownMenu:Refresh(2)
	
end


-- 输入文本框时会调用这个函数
function addon:PromptSpellAttackTime(text)
	if tonumber(text) then
		self.text = text
		wowam_config.PromptSpellAttackTime=tonumber(text);
		DropDownMenu:Refresh(2)
	end
end



-- 输入文本框时会调用这个函数
function addon:SpellAttackTime(text)
	if tonumber(text) then
		self.text = text
		wowam_config.SpellAttackTime=tonumber(text);
		DropDownMenu:Refresh(2)
	end
end

-- 输入文本框时会调用这个函数
function addon:SPELL_STOP_TIME(text)
	if tonumber(text) then
		self.text = text
		wowam_config.SPELL_STOP_TIME=tonumber(text);
		DropDownMenu:Refresh(2)
	end
end



function addon:SetDebugInformation()
	
	
		wowam_config.Amisr["顯示調試信息"] = not wowam_config.Amisr["顯示調試信息"];
		DropDownMenu:Refresh(1)
	
end



function addon:SetDebugInformationOK()
	
	
		wowam_config.Amisr["顯示成功的調試信息"] = not wowam_config.Amisr["顯示成功的調試信息"];
		DropDownMenu:Refresh(2)
	
end

function addon:SetDebugInformationERR()
	
	
		wowam_config.Amisr["顯示失敗的調試信息"] = not wowam_config.Amisr["顯示失敗的調試信息"];
		DropDownMenu:Refresh(2)
	
end



-- 输入文本框时会调用这个函数
function addon:SetDebugInformation_Filter_EDIT(text)
	
		self.text = text
		wowam_config.Formats["過濾調試信息"]=text;
		DropDownMenu:Refresh(2)
	
end

function addon:SetDebugInformation_Filter_ON()
	
	
		wowam_config.Amisr["過濾調試信息"] = not wowam_config.Amisr["過濾調試信息"];
		DropDownMenu:Refresh(2)
	
end




function addon:SPELL_FAILED_OUT_OF_RANGE()
	wowam_config.FAILED_TEXT[SPELL_FAILED_OUT_OF_RANGE] = not wowam_config.FAILED_TEXT[SPELL_FAILED_OUT_OF_RANGE];
	DropDownMenu:Refresh(2)
end

function addon:SPELL_FAILED_NOPATH()
	wowam_config.FAILED_TEXT[SPELL_FAILED_NOPATH] = not wowam_config.FAILED_TEXT[SPELL_FAILED_NOPATH];
	DropDownMenu:Refresh(2)
end

function addon:SPELL_FAILED_BAD_IMPLICIT_TARGETS()
	wowam_config.FAILED_TEXT[SPELL_FAILED_BAD_IMPLICIT_TARGETS] = not wowam_config.FAILED_TEXT[SPELL_FAILED_BAD_IMPLICIT_TARGETS];
	DropDownMenu:Refresh(2)
end

function addon:SPELL_FAILED_LINE_OF_SIGHT()
	wowam_config.FAILED_TEXT[SPELL_FAILED_LINE_OF_SIGHT] = not wowam_config.FAILED_TEXT[SPELL_FAILED_LINE_OF_SIGHT];
	DropDownMenu:Refresh(2)
end

function addon:SPELL_FAILED_TOO_CLOSE()
	wowam_config.FAILED_TEXT[SPELL_FAILED_TOO_CLOSE] = not wowam_config.FAILED_TEXT[SPELL_FAILED_TOO_CLOSE];
	DropDownMenu:Refresh(2)
end

function addon:SPELL_FAILED_TARGETS_DEAD()
	wowam_config.FAILED_TEXT[SPELL_FAILED_TARGETS_DEAD] = not wowam_config.FAILED_TEXT[SPELL_FAILED_TARGETS_DEAD];
	DropDownMenu:Refresh(2)
end

function addon:SPELL_FAILED_UNIT_NOT_INFRONT()
	wowam_config.FAILED_TEXT[SPELL_FAILED_UNIT_NOT_INFRONT] = not wowam_config.FAILED_TEXT[SPELL_FAILED_UNIT_NOT_INFRONT];
	DropDownMenu:Refresh(2)
end

function addon:SPELL_FAILED_NOT_BEHIND()
	wowam_config.FAILED_TEXT[SPELL_FAILED_NOT_BEHIND] = not wowam_config.FAILED_TEXT[SPELL_FAILED_NOT_BEHIND];
	DropDownMenu:Refresh(2)
end

function addon:SPELL_FAILED_ONLY_STEALTHED()
	wowam_config.FAILED_TEXT[SPELL_FAILED_ONLY_STEALTHED] = not wowam_config.FAILED_TEXT[SPELL_FAILED_ONLY_STEALTHED];
	DropDownMenu:Refresh(2)
end

function addon:SPELL_FAILED_BAD_TARGETS()
	wowam_config.FAILED_TEXT[SPELL_FAILED_BAD_TARGETS] = not wowam_config.FAILED_TEXT[SPELL_FAILED_BAD_TARGETS];
	DropDownMenu:Refresh(2)
end

function addon:SPELL_FAILED_AURA_BOUNCED()
	wowam_config.FAILED_TEXT[SPELL_FAILED_AURA_BOUNCED] = not wowam_config.FAILED_TEXT[SPELL_FAILED_AURA_BOUNCED];
	DropDownMenu:Refresh(2)
end

function addon:SPELL_FAILED_NO_COMBO_POINTS()
	wowam_config.FAILED_TEXT[SPELL_FAILED_NO_COMBO_POINTS] = not wowam_config.FAILED_TEXT[SPELL_FAILED_NO_COMBO_POINTS];
	DropDownMenu:Refresh(2)
end
function addon:SPELL_FAILED_ONLY_OUTDOORS()
	wowam_config.FAILED_TEXT[SPELL_FAILED_ONLY_OUTDOORS] = not wowam_config.FAILED_TEXT[SPELL_FAILED_ONLY_OUTDOORS];
	DropDownMenu:Refresh(2)
end


function addon:TRINKET_TARGET()
	
	wowam.spell.Property={};
	wowam_config.TRINKET_TARGET = not wowam_config.TRINKET_TARGET;
	DropDownMenu:Refresh(1)
end

function addon:MagicCastON(a)
	
	RunScript(a);
	DropDownMenu:Close(1);
end

function addon:amac_arena_ON()
	
	wowam_config.amac_arena = not wowam_config.amac_arena;
	DropDownMenu:Refresh(1);
end

function addon:SetamacTime(text)
	if tonumber(text) then
		self.text = text
		wowam_config.amac_time=tonumber(text);
		DropDownMenu:Refresh(1)
	end
end