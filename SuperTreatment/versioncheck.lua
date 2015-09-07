--GC version check 0.01
local versionType, buildType, version, internalVersion = GetBuildInfo();

StaticPopupDialogs["AM_VERSION_EXPIRED"] = {
	text = "您的wow客户端已更新\n请同步更新GC以确保安全使用\n网址:bbs.luacn.net",
	button1 = "明白",
	OnAccept = function(self, data) end,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = nil
};
--If the version has expired, show a popup to the user.
--如果版本过期则显示一个对话框
if tonumber(buildType)>20444 then 
	StaticPopup_Show("AM_VERSION_EXPIRED", "GC")
	SuperTreatmentFrame:Hide()
end