local l=GetLocale()=="zhCN"
if not l then 
	return;
end

WowStScriptEditLocale={};
local L=WowStScriptEditLocale;
L["GUI_BOXFRAME_TITLE"]="错误代码";
L["EDITER_TITLE"]="上帝指令编辑:|cffff0000%s";
L["EDITER_MENU_SAVE_TITLE"]="保存";
L["EDITER_MENU_DEBUG_TITLE"]="调试";
L["EDITER_LINE_TITLE"]="Line %s";
L["EDITER_EXIT_SAVE_CONFIRM"]="在退出前您还未保存当前代码，是否保存？";
L["EDITER_SAVE_FINISH"]="“%s”的脚本已保存！";
L["EDITER_DEBUG_FINISH"]="“%s”调试完成！";
