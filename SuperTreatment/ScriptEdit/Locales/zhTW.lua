local l=GetLocale()~="zhCN" 
if not l then 
	return;
end 

WowStScriptEditLocale={};
local L=WowStScriptEditLocale;
L["GUI_BOXFRAME_TITLE"]="錯誤代碼";
L["EDITER_TITLE"]="超級助手編輯:|cffff0000%s";
L["EDITER_MENU_SAVE_TITLE"]="保存";
L["EDITER_MENU_DEBUG_TITLE"]="調試";
L["EDITER_LINE_TITLE"]="Line %s";
L["EDITER_EXIT_SAVE_CONFIRM"]="在退出前您還未保存當前代碼，是否保存？";
L["EDITER_SAVE_FINISH"]="“%s”的腳本已保存！";
L["EDITER_DEBUG_FINISH"]="“%s”調試完成！";