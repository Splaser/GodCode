
SuperTreatmentExport_Mark_import = 1436015892
SuperTreatmentExport_Dbf_import = {
	["AddOnMemory"] = {
		["max"] = 60,
		["inf"] = false,
		["on"] = false,
		["Leftfighting"] = false,
	},
	["index"] = 1,
	["Import"] = true,
	["Macro"] = {
		{
			["type"] = "macro",
			["functime"] = 152774.585,
			["Macro"] = "/st select 暗怒",
			["runType"] = 2,
			["name"] = "暗怒",
			["Remarks"] = "",
			["id"] = "1400240423-281494.685",
			["time"] = 152774.585,
			["Texture"] = "",
		}, -- [1]
		{
			["type"] = "macro",
			["functime"] = 157562.312,
			["Macro"] = "/st select:off 火雨",
			["runType"] = 2,
			["name"] = "火雨",
			["Remarks"] = "",
			["id"] = "1400897316-155030.374",
			["time"] = 157562.312,
			["Texture"] = "",
		}, -- [2]
	},
	["Spells"] = {
		["List"] = {
			{
				["ExcludeTarget"] = {
				},
				["spell"] = {
					{
						["TargetSubgroup"] = -1,
						["spellId"] = 0,
						["CastingSpell"] = {
						},
						["Targets"] = {
						},
						["unit"] = "nogoal",
						["Key"] = {
							["lock"] = false,
							["KeySelect"] = "auto",
						},
						["Remarks"] = "",
						["itemLink"] = "技能正在执行时按下鼠标左键",
						["Texture"] = "",
						["Type"] = "Run",
						["subgroup"] = -4,
						["raidn"] = -4,
						["DelayValue"] = 0,
						["Target"] = "无目标",
						["name"] = "",
						["checked"] = true,
						["Mark"] = "172804-993163",
						["StopCastingChecked"] = false,
						["DelayChecked"] = false,
						["ApiDbf"] = {
							{
								["id"] = "amIsCurrentMouse",
								["Arguments"] = {
									{
										["value"] = "暗影之怒",
									}, -- [1]
								},
								["checked"] = true,
								["Returns"] = {
									{
										["value"] = true,
										["checked"] = true,
									}, -- [1]
								},
							}, -- [1]
						},
					}, -- [1]
					{
						["FireHasBeenSetValue"] = 2,
						["checked"] = true,
						["AOEChecked"] = false,
						["Targets"] = {
						},
						["unit"] = "nogoal",
						["Key"] = {
							["KeySelect"] = "auto",
							["lock"] = false,
						},
						["Target"] = "无目标",
						["itemLink"] = "|cff71d5ff|Hspell:30283|h[暗影之怒]|h|r",
						["Texture"] = "Interface\\Icons\\ability_warlock_shadowfurytga",
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
							},
							["End"] = {
							},
						},
						["Type"] = "spell",
						["DelayValue"] = 0,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 30283,
									["Texture"] = "Interface\\Icons\\ability_warlock_shadowfurytga",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:30283|h[暗影之怒]|h|r",
									["Rank"] = "",
								}, -- [1]
							},
						},
						["spellId"] = 30283,
						["TargetSubgroup"] = -1,
						["Mark"] = "630763-878525",
						["StopCastingChecked"] = true,
						["DelayChecked"] = false,
						["Rank"] = "",
					}, -- [2]
					{
						["TargetSubgroup"] = -1,
						["spellId"] = 0,
						["CastingSpell"] = {
						},
						["PropertiesSet_Continue_Checked"] = false,
						["Targets"] = {
						},
						["unit"] = "Target",
						["Key"] = {
							["KeySelect"] = "auto",
							["lock"] = false,
						},
						["Target"] = "当前目标",
						["Type"] = "macro",
						["subgroup"] = -3,
						["raidn"] = -3,
						["DelayValue"] = 0,
						["PropertiesSetChecked"] = 2,
						["name"] = "",
						["DelayChecked"] = false,
						["Mark"] = "457239-738709",
						["id"] = "1400240423-281494.685",
						["checked"] = true,
						["Remarks"] = "-关闭",
					}, -- [3]
					{
						["TargetSubgroup"] = -1,
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["Target"] = "当前目标",
						["Mark"] = "243238-544778",
						["Targets"] = {
							{
								["name"] = "当前目标",
								["checked"] = false,
								["Conditions"] = {
									{
										["checked"] = false,
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["name"] = "当前目标",
										["Remark"] = "",
										["unit"] = "Target",
									}, -- [1]
								},
								["Remark"] = "",
								["Key"] = {
									["KeySelect"] = "auto",
								},
							}, -- [1]
						},
						["unit"] = "Target",
					}, -- [4]
				},
				["checked"] = false,
				["ApiDbf"] = {
				},
				["name"] = "暗怒",
				["Key"] = {
					["Checked"] = true,
					["lock"] = false,
					["Value"] = "F2",
					["KeySelect"] = "auto",
					["ButtonFrame"] = {
					},
				},
				["CastOffSchem"] = false,
				["Remarks"] = "F2",
				["Mark"] = "223304-771564",
				["CastOffSchemEnd"] = false,
				["ExcludedGroup"] = {
				},
			}, -- [1]
			{
				["ExcludeTarget"] = {
				},
				["spell"] = {
					{
						["TargetSubgroup"] = -1,
						["DelayChecked"] = false,
						["ApiDbf"] = {
							{
								["Arguments"] = {
									{
										["value"] = "unit",
									}, -- [1]
								},
								["checked"] = true,
								["id"] = "amSetFocus",
								["Returns"] = {
									{
										["value"] = true,
										["checked"] = true,
									}, -- [1]
								},
							}, -- [1]
						},
						["Targets"] = {
							{
								["name"] = "1",
								["Key"] = {
									["KeySelect"] = "auto",
								},
								["Mark"] = "661377-730337",
								["Conditions"] = {
									{
										["FireHasBeenSetValue"] = 2,
										["PlayerRangeCheckAngle"] = {
											["ContainChecked"] = false,
											["checked"] = false,
											["TargetChecked"] = false,
											["ExcludedTarget"] = {
												["checked"] = false,
												["Group"] = {
												},
												["GroupCount"] = 0,
												["Target"] = {
												},
												["TargetCount"] = 0,
											},
											["AngleValue"] = 90,
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["HealthPercentageChecked"] = false,
											["Health"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Min_Max"] = {
												["Type"] = "Minimum_Blood_Percentage",
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["ExcludedClass"] = {
												["Class"] = {
												},
												["checked"] = false,
												["ClassCount"] = 0,
											},
											["AngleChecked"] = false,
											["LackHealthChecked"] = false,
											["UnitType"] = "partyraid",
											["NewBuff"] = {
												["checked"] = false,
												["buffs"] = {
												},
											},
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["NoBuffChecked"] = false,
												["checked"] = false,
												["BuffName"] = {
												},
											},
										},
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "Boss2",
										["RangeCheck"] = {
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = false,
										["TargetSubgroup"] = -1,
										["Mark"] = "638054-306276",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Blood"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["Distance"] = {
											["<"] = {
												["checked"] = true,
												["Value"] = 40,
											},
											["checked"] = true,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
											["IsOrAnd"] = "Or",
											["buffs"] = {
											},
											["NoBuffNameCount"] = 0,
										},
										["NewSpell"] = {
											["Spell"] = {
											},
											["Cd"] = {
												["Start"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
												["End"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
											},
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
											{
												["Arguments"] = {
													{
														["value"] = "unit",
													}, -- [1]
												},
												["checked"] = true,
												["id"] = "UnitIsDead",
												["Returns"] = {
													{
														["checked"] = true,
													}, -- [1]
												},
											}, -- [1]
										},
										["name"] = "1",
										["unit"] = "boss2",
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
									}, -- [1]
								},
								["Remark"] = "",
								["checked"] = true,
							}, -- [1]
						},
						["unit"] = "boss2",
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["Remarks"] = "",
						["itemLink"] = "把目标设定爲焦点目标",
						["Texture"] = "",
						["Type"] = "Run",
						["subgroup"] = -4,
						["raidn"] = -4,
						["DelayValue"] = 0,
						["spellId"] = 0,
						["name"] = "",
						["Target"] = "Boss2",
						["Mark"] = "433396-380731",
						["checked"] = true,
						["CastingSpell"] = {
						},
						["FireHasBeenSetValue"] = 2,
					}, -- [1]
				},
				["checked"] = true,
				["ApiDbf"] = {
				},
				["name"] = "焦点",
				["Mark"] = "114018-626982",
				["ExcludedGroup"] = {
				},
				["Key"] = {
					["KeySelect"] = "auto",
				},
				["Remarks"] = "",
			}, -- [2]
			{
				["ExcludedGroup"] = {
				},
				["spell"] = {
					{
						["FireHasBeenSetValue"] = 2,
						["spellId"] = 119905,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 119905,
									["Texture"] = "INTERFACE\\ICONS\\inv_misc_volatilefire",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:119905|h[灼疗主人]|h|r",
									["Rank"] = "特殊技能",
								}, -- [1]
							},
						},
						["Targets"] = {
							{
								["name"] = "失血",
								["checked"] = true,
								["Mark"] = "798485-696654",
								["Conditions"] = {
									{
										["FireHasBeenSetValue"] = 2,
										["PlayerRangeCheckAngle"] = {
											["ContainChecked"] = false,
											["checked"] = false,
											["HealthPercentageChecked"] = false,
											["ExcludedTarget"] = {
												["TargetCount"] = 0,
												["Group"] = {
												},
												["GroupCount"] = 0,
												["checked"] = false,
												["Target"] = {
												},
											},
											["AngleValue"] = 90,
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["NewBuff"] = {
												["checked"] = false,
												["buffs"] = {
												},
											},
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Min_Max"] = {
												["Type"] = "Minimum_Blood_Percentage",
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["UnitType"] = "partyraid",
											["ExcludedClass"] = {
												["Class"] = {
												},
												["checked"] = false,
												["ClassCount"] = 0,
											},
											["AngleChecked"] = false,
											["LackHealthChecked"] = false,
											["Health"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["TargetChecked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["Layer"] = {
												["checked"] = false,
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["BuffName"] = {
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["checked"] = false,
											["IsBuff"] = {
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
												["checked"] = false,
											},
										},
										["wbuff"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["MainChecked"] = false,
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["Energy"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["and/or"] = false,
										["Cooldown"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = {
											},
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Totem"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = "",
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["unit"] = "player",
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
											["IsOrAnd"] = "Or",
											["buffs"] = {
											},
											["NoBuffNameCount"] = 0,
										},
										["NewSpell"] = {
											["Spell"] = {
											},
											["Cd"] = {
												["Start"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
												["End"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
											},
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "1",
										["Blood"] = {
											["checked"] = true,
											["Percentage"] = true,
											["Lack"] = false,
											["<"] = {
												["checked"] = true,
												["Value"] = 80,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Mark"] = "965455-473234",
										["TargetSubgroup"] = -1,
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["RangeCheck"] = {
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
										},
									}, -- [1]
								},
								["Remark"] = "",
								["Key"] = {
									["lock"] = false,
									["KeySelect"] = "auto",
								},
							}, -- [1]
						},
						["unit"] = "nogoal",
						["Key"] = {
							["KeySelect"] = "auto",
							["lock"] = false,
						},
						["Target"] = "无目标",
						["itemLink"] = "|cff71d5ff|Hspell:119905|h[灼疗主人]|h|r",
						["Texture"] = "INTERFACE\\ICONS\\inv_misc_volatilefire",
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
								["SetVariables"] = {
								},
								["spell"] = {
								},
								["script"] = "",
								["Chat"] = {
									["text"] = "",
									["isRadio"] = "SAY",
									["channel"] = 1,
								},
							},
							["End"] = {
								["script"] = "",
								["Chat"] = {
									["text"] = "",
									["isRadio"] = "SAY",
									["channel"] = 1,
								},
							},
						},
						["Type"] = "spell",
						["DelayValue"] = 0,
						["Remarks"] = "-统御小鬼",
						["DelayChecked"] = false,
						["Mark"] = "348394-721323",
						["TargetSubgroup"] = -1,
						["checked"] = true,
						["Rank"] = "特殊技能",
					}, -- [1]
					{
						["FireHasBeenSetValue"] = 2,
						["DelayChecked"] = false,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 6789,
									["Rank"] = "",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:6789|h[死亡缠绕]|h|r",
									["Texture"] = "Interface\\Icons\\ability_warlock_mortalcoil",
								}, -- [1]
							},
						},
						["Targets"] = {
							{
								["name"] = "1",
								["Key"] = {
									["KeySelect"] = "auto",
								},
								["Mark"] = "752048-356709",
								["Conditions"] = {
									{
										["FireHasBeenSetValue"] = 2,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["checked"] = false,
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
											},
										},
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["RangeCheck"] = {
											["checked"] = false,
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = false,
										["TargetSubgroup"] = -1,
										["Mark"] = "537822-427981",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Blood"] = {
											["checked"] = true,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = true,
												["Value"] = 70,
											},
											["Percentage"] = true,
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
										},
										["NewSpell"] = {
											["Spell"] = {
											},
											["Cd"] = {
												["Start"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
												["End"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
											},
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "1",
										["unit"] = "player",
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
									}, -- [1]
								},
								["Remark"] = "",
								["checked"] = true,
							}, -- [1]
						},
						["unit"] = "target",
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["Target"] = "当前目标",
						["itemLink"] = "|cff71d5ff|Hspell:6789|h[死亡缠绕]|h|r",
						["Texture"] = "Interface\\Icons\\ability_warlock_mortalcoil",
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
								["script"] = "",
								["spell"] = {
								},
								["SetVariables"] = {
								},
								["Chat"] = {
									["text"] = "",
									["channel"] = 1,
									["isRadio"] = "SAY",
								},
							},
							["End"] = {
								["script"] = "",
								["Chat"] = {
									["text"] = "",
									["channel"] = 1,
									["isRadio"] = "SAY",
								},
							},
						},
						["Type"] = "spell",
						["DelayValue"] = 0,
						["checked"] = true,
						["Mark"] = "828551-233410",
						["spellId"] = 6789,
						["TargetSubgroup"] = -1,
						["Rank"] = "",
					}, -- [2]
					{
						["FireHasBeenSetValue"] = 2,
						["spellId"] = 108359,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 108359,
									["Rank"] = "",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:108359|h[黑暗再生]|h|r",
									["Texture"] = "Interface\\Icons\\spell_warlock_darkregeneration",
								}, -- [1]
							},
						},
						["Targets"] = {
							{
								["name"] = "1",
								["checked"] = true,
								["Mark"] = "889469-585823",
								["Conditions"] = {
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["Layer"] = {
												["checked"] = false,
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["BuffName"] = {
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["checked"] = false,
											["IsBuff"] = {
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
												["checked"] = false,
											},
										},
										["RangeCheck"] = {
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["and/or"] = false,
										["Cooldown"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = {
											},
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Totem"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = "",
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["unit"] = "player",
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["Blood"] = {
											["checked"] = true,
											["Percentage"] = true,
											["Lack"] = false,
											["<"] = {
												["checked"] = true,
												["Value"] = 50,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["NewSpell"] = {
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "1",
										["NewBuff"] = {
										},
										["Mark"] = "418963-733578",
										["FireHasBeenSetValue"] = 2,
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["wbuff"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["MainChecked"] = false,
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
									}, -- [1]
								},
								["Remark"] = "",
								["Key"] = {
									["KeySelect"] = "auto",
								},
							}, -- [1]
							{
								["name"] = "启用天赋",
								["checked"] = true,
								["Mark"] = "468885-498956",
								["Conditions"] = {
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["Layer"] = {
												["checked"] = false,
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["BuffName"] = {
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["checked"] = false,
											["IsBuff"] = {
												["NoBuffChecked"] = false,
												["checked"] = false,
												["BuffName"] = {
												},
											},
										},
										["RangeCheck"] = {
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["unit"] = "player",
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["and/or"] = false,
										["Cooldown"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = {
											},
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Totem"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = "",
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["wbuff"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["MainChecked"] = false,
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["Blood"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["NewSpell"] = {
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
											{
												["Arguments"] = {
													{
													}, -- [1]
												},
												["checked"] = true,
												["id"] = "amTalentInfo",
												["Returns"] = {
													{
														["value"] = true,
														["checked"] = true,
													}, -- [1]
												},
											}, -- [1]
										},
										["name"] = "2",
										["NewBuff"] = {
										},
										["Mark"] = "920435-348092",
										["FireHasBeenSetValue"] = 2,
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
									}, -- [1]
								},
								["Remark"] = "",
								["Key"] = {
									["KeySelect"] = "auto",
									["lock"] = false,
								},
							}, -- [2]
						},
						["unit"] = "nogoal",
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["Target"] = "无目标",
						["itemLink"] = "|cff71d5ff|Hspell:108359|h[黑暗再生]|h|r",
						["Texture"] = "Interface\\Icons\\spell_warlock_darkregeneration",
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
							},
							["End"] = {
							},
						},
						["Type"] = "spell",
						["DelayValue"] = 0,
						["DelayChecked"] = false,
						["Mark"] = "782020-543888",
						["checked"] = true,
						["TargetSubgroup"] = -1,
						["Rank"] = "",
					}, -- [3]
					{
						["FireHasBeenSetValue"] = 2,
						["DelayChecked"] = false,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 132413,
									["Texture"] = "Interface\\Icons\\Spell_Shadow_AntiShadow",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:132413|h[暗影壁垒]|h|r",
									["Rank"] = "特殊技能",
								}, -- [1]
							},
						},
						["Targets"] = {
							{
								["name"] = "1",
								["Key"] = {
									["KeySelect"] = "auto",
								},
								["Mark"] = "237607-598721",
								["Conditions"] = {
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
												["checked"] = false,
											},
										},
										["RangeCheck"] = {
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["unit"] = "player",
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = false,
										["FireHasBeenSetValue"] = 2,
										["Mark"] = "941279-381691",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Blood"] = {
											["checked"] = true,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = true,
												["Value"] = 40,
											},
											["Percentage"] = true,
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
										},
										["NewSpell"] = {
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "1",
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
									}, -- [1]
								},
								["Remark"] = "",
								["checked"] = true,
							}, -- [1]
						},
						["unit"] = "nogoal",
						["Key"] = {
							["KeySelect"] = "auto",
							["lock"] = false,
						},
						["Target"] = "无目标",
						["itemLink"] = "|cff71d5ff|Hspell:132413|h[暗影壁垒]|h|r",
						["Texture"] = "Interface\\Icons\\Spell_Shadow_AntiShadow",
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
							},
							["End"] = {
							},
						},
						["Type"] = "spell",
						["DelayValue"] = 0,
						["Remarks"] = "-牺牲胖子",
						["spellId"] = 132413,
						["Mark"] = "957438-165591",
						["TargetSubgroup"] = -1,
						["checked"] = true,
						["Rank"] = "特殊技能",
					}, -- [4]
					{
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
								["script"] = "",
								["spell"] = {
								},
								["SetVariables"] = {
								},
								["Chat"] = {
									["text"] = "",
									["channel"] = 1,
									["isRadio"] = "SAY",
								},
							},
							["End"] = {
								["script"] = "",
								["Chat"] = {
									["text"] = "",
									["channel"] = 1,
									["isRadio"] = "SAY",
								},
							},
						},
						["Type"] = "item",
						["checked"] = true,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "item",
									["spellId"] = 5512,
									["Texture"] = "Interface\\Icons\\warlock_ healthstone",
									["disabled"] = true,
									["itemLink"] = "|cffffffff|Hitem:5512:0:0:0:0:0:0:0:83:0:0|h[治疗石]|h|r",
									["Rank"] = "其它",
								}, -- [1]
							},
						},
						["DelayValue"] = 0,
						["Targets"] = {
							{
								["name"] = "1",
								["Key"] = {
									["KeySelect"] = "auto",
								},
								["Mark"] = "331176-299451",
								["Conditions"] = {
									{
										["FireHasBeenSetValue"] = 2,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
												["checked"] = false,
											},
										},
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["RangeCheck"] = {
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = false,
										["TargetSubgroup"] = -1,
										["Mark"] = "465408-794463",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Blood"] = {
											["checked"] = true,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = true,
												["Value"] = 35,
											},
											["Percentage"] = true,
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
											["IsOrAnd"] = "Or",
											["buffs"] = {
											},
											["NoBuffNameCount"] = 0,
										},
										["NewSpell"] = {
											["Spell"] = {
											},
											["Cd"] = {
												["Start"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
												["End"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
											},
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
											{
												["Arguments"] = {
												},
												["checked"] = true,
												["id"] = "amHealthItemCanBeUsed",
												["Returns"] = {
													{
														["checked"] = true,
														["value"] = true,
													}, -- [1]
												},
											}, -- [1]
										},
										["name"] = "1",
										["unit"] = "player",
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
									}, -- [1]
								},
								["Remark"] = "",
								["checked"] = true,
							}, -- [1]
						},
						["unit"] = "nogoal",
						["Texture"] = "Interface\\ICONS\\Warlock_ Healthstone.blp",
						["spellId"] = 5512,
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["TargetSubgroup"] = -1,
						["Target"] = "无目标",
						["Mark"] = "653576-615116",
						["itemLink"] = "|cffffffff|Hitem:5512:0:0:0:0:0:0:0:100:267:0:0:0|h[治疗石]|h|r",
						["Rank"] = "其它",
					}, -- [5]
					{
						["TargetSubgroup"] = -1,
						["spellId"] = 104773,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 104773,
									["Rank"] = "",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:104773|h[不灭决心]|h|r",
									["Texture"] = "Interface\\Icons\\Spell_Shadow_DemonicTactics",
								}, -- [1]
							},
						},
						["Targets"] = {
							{
								["name"] = "1",
								["Key"] = {
									["lock"] = false,
									["KeySelect"] = "auto",
								},
								["Mark"] = "868405-921985",
								["Conditions"] = {
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["BuffName"] = {
												},
												["NoBuffChecked"] = false,
												["checked"] = false,
											},
										},
										["RangeCheck"] = {
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = false,
										["FireHasBeenSetValue"] = 2,
										["Mark"] = "819072-999089",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["NewBuff"] = {
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["Blood"] = {
											["checked"] = true,
											[">"] = {
												["checked"] = false,
												["Value"] = 40,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = true,
												["Value"] = 30,
											},
											["Percentage"] = true,
										},
										["NewSpell"] = {
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "1",
										["unit"] = "player",
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
									}, -- [1]
								},
								["Remark"] = "",
								["checked"] = true,
							}, -- [1]
						},
						["unit"] = "nogoal",
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["Target"] = "无目标",
						["itemLink"] = "|cff71d5ff|Hspell:104773|h[不灭决心]|h|r",
						["Texture"] = "Interface\\Icons\\Spell_Shadow_DemonicTactics",
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
								["script"] = "",
								["spell"] = {
								},
								["SetVariables"] = {
								},
								["Chat"] = {
									["text"] = "",
									["channel"] = 1,
									["isRadio"] = "SAY",
								},
							},
							["End"] = {
								["script"] = "",
								["Chat"] = {
									["text"] = "",
									["channel"] = 1,
									["isRadio"] = "SAY",
								},
							},
						},
						["Type"] = "spell",
						["DelayValue"] = 0,
						["checked"] = true,
						["Mark"] = "733281-339262",
						["DelayChecked"] = false,
						["FireHasBeenSetValue"] = 2,
						["Rank"] = "",
					}, -- [6]
					{
						["FireHasBeenSetValue"] = 2,
						["checked"] = true,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 114635,
									["Texture"] = "Interface\\Icons\\inv_ember",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:114635|h[灰烬转换]|h|r",
									["Rank"] = "",
								}, -- [1]
							},
						},
						["Targets"] = {
							{
								["name"] = "1",
								["checked"] = true,
								["Mark"] = "638115-210976",
								["Conditions"] = {
									{
										["FireHasBeenSetValue"] = 2,
										["PlayerRangeCheckAngle"] = {
											["ContainChecked"] = false,
											["checked"] = false,
											["NewBuff"] = {
												["checked"] = false,
												["buffs"] = {
												},
											},
											["ExcludedTarget"] = {
												["TargetCount"] = 0,
												["Group"] = {
												},
												["GroupCount"] = 0,
												["checked"] = false,
												["Target"] = {
												},
											},
											["AngleValue"] = 90,
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["HealthPercentageChecked"] = false,
											["Health"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["TargetChecked"] = false,
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["ExcludedClass"] = {
												["Class"] = {
												},
												["checked"] = false,
												["ClassCount"] = 0,
											},
											["AngleChecked"] = false,
											["LackHealthChecked"] = false,
											["UnitType"] = "partyraid",
											["Min_Max"] = {
												["Type"] = "Minimum_Blood_Percentage",
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["checked"] = true,
										["Buff"] = {
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["Layer"] = {
												["checked"] = false,
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["BuffName"] = {
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["checked"] = false,
											["IsBuff"] = {
												["checked"] = false,
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
											},
										},
										["wbuff"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["MainChecked"] = false,
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["and/or"] = false,
										["Cooldown"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = {
											},
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Totem"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = "",
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["unit"] = "player",
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["Blood"] = {
											["checked"] = true,
											["Percentage"] = true,
											["Lack"] = false,
											["<"] = {
												["checked"] = true,
												["Value"] = 25,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["NewSpell"] = {
											["Spell"] = {
											},
											["Cd"] = {
												["Start"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
												["End"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
											},
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "1",
										["NewBuff"] = {
											["IsOrAnd"] = "Or",
											["buffs"] = {
											},
											["NoBuffNameCount"] = 0,
										},
										["Mark"] = "986818-663383",
										["TargetSubgroup"] = -1,
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["RangeCheck"] = {
											["checked"] = false,
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
									}, -- [1]
								},
								["Remark"] = "",
								["Key"] = {
									["KeySelect"] = "auto",
								},
							}, -- [1]
						},
						["unit"] = "nogoal",
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["Target"] = "无目标",
						["itemLink"] = "|cff71d5ff|Hspell:114635|h[灰烬转换]|h|r",
						["Texture"] = "Interface\\Icons\\inv_ember",
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
								["SetVariables"] = {
								},
								["spell"] = {
								},
								["script"] = "",
								["Chat"] = {
									["text"] = "",
									["isRadio"] = "SAY",
									["channel"] = 1,
								},
							},
							["End"] = {
								["script"] = "",
								["Chat"] = {
									["text"] = "",
									["isRadio"] = "SAY",
									["channel"] = 1,
								},
							},
						},
						["Type"] = "spell",
						["DelayValue"] = 0,
						["DelayChecked"] = false,
						["Mark"] = "398316-327803",
						["spellId"] = 114635,
						["TargetSubgroup"] = -1,
						["Rank"] = "",
					}, -- [7]
					{
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
							},
							["End"] = {
							},
						},
						["Type"] = "spell",
						["checked"] = true,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 110913,
									["Texture"] = "Interface\\Icons\\ability_deathwing_bloodcorruption_death",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:110913|h[黑暗交易]|h|r",
									["Rank"] = "",
								}, -- [1]
							},
						},
						["DelayValue"] = 0,
						["Texture"] = "Interface\\Icons\\ability_deathwing_bloodcorruption_death",
						["Targets"] = {
							{
								["name"] = "1(21:09:03)",
								["Key"] = {
									["KeySelect"] = "auto",
								},
								["Mark"] = "156839-609198",
								["Conditions"] = {
									{
										["FireHasBeenSetValue"] = 2,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["BuffName"] = {
												},
												["NoBuffChecked"] = false,
												["checked"] = false,
											},
										},
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["RangeCheck"] = {
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = false,
										["TargetSubgroup"] = -1,
										["Mark"] = "853124-446689",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Blood"] = {
											["checked"] = true,
											[">"] = {
												["checked"] = false,
												["Value"] = 40,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = true,
												["Value"] = 20,
											},
											["Percentage"] = true,
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
										},
										["NewSpell"] = {
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "1",
										["unit"] = "player",
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
									}, -- [1]
								},
								["Remark"] = "",
								["checked"] = true,
							}, -- [1]
						},
						["unit"] = "Target",
						["spellId"] = 110913,
						["TargetSubgroup"] = -1,
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["Target"] = "当前目标",
						["Mark"] = "294157-115303",
						["DelayChecked"] = false,
						["itemLink"] = "|cff71d5ff|Hspell:110913|h[黑暗交易]|h|r",
						["Rank"] = "",
					}, -- [8]
				},
				["checked"] = true,
				["ApiDbf"] = {
				},
				["Key"] = {
					["KeySelect"] = "auto",
					["lock"] = false,
				},
				["Remarks"] = "",
				["Mark"] = "841411-227816",
				["ExcludeTarget"] = {
				},
				["name"] = "保命",
			}, -- [3]
			{
				["ExcludedGroup"] = {
				},
				["spell"] = {
					{
						["FireHasBeenSetValue"] = 2,
						["DelayChecked"] = false,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 111400,
									["Rank"] = "",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:111400|h[爆燃冲刺]|h|r",
									["Texture"] = "Interface\\Icons\\ability_deathwing_sealarmorbreachgreen",
								}, -- [1]
							},
						},
						["Targets"] = {
							{
								["name"] = "移动",
								["checked"] = true,
								["Mark"] = "807466-910678",
								["Conditions"] = {
									{
										["FireHasBeenSetValue"] = 2,
										["PlayerRangeCheckAngle"] = {
											["ContainChecked"] = false,
											["checked"] = false,
											["TargetChecked"] = false,
											["ExcludedTarget"] = {
												["TargetCount"] = 0,
												["Group"] = {
												},
												["GroupCount"] = 0,
												["Target"] = {
												},
												["checked"] = false,
											},
											["AngleValue"] = 90,
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["HealthPercentageChecked"] = false,
											["UnitType"] = "partyraid",
											["Min_Max"] = {
												["Type"] = "Minimum_Blood_Percentage",
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Health"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["ExcludedClass"] = {
												["Class"] = {
												},
												["checked"] = false,
												["ClassCount"] = 0,
											},
											["AngleChecked"] = false,
											["LackHealthChecked"] = false,
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["NewBuff"] = {
												["checked"] = false,
												["buffs"] = {
												},
											},
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["checked"] = false,
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
											},
										},
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["lock"] = false,
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["RangeCheck"] = {
											["checked"] = false,
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = false,
										["TargetSubgroup"] = -1,
										["Mark"] = "702899-616351",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Blood"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
											["IsOrAnd"] = "Or",
											["buffs"] = {
											},
											["NoBuffNameCount"] = 0,
										},
										["NewSpell"] = {
											["Spell"] = {
											},
											["Cd"] = {
												["Start"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
												["End"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
											},
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
											{
												["Arguments"] = {
													{
														["value"] = "unit",
													}, -- [1]
												},
												["checked"] = true,
												["id"] = "GetUnitSpeed",
												["Returns"] = {
													{
														["="] = {
															["Value"] = 0,
															["checked"] = false,
														},
														["<"] = {
															["Value"] = 0,
														},
														["checked"] = true,
														[">"] = {
															["Value"] = 1,
															["checked"] = true,
														},
													}, -- [1]
												},
											}, -- [1]
										},
										["name"] = "1(21:13:37)",
										["unit"] = "player",
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = true,
												["Value"] = 35,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = true,
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
									}, -- [1]
								},
								["Remark"] = "",
								["Key"] = {
									["KeySelect"] = "auto",
									["lock"] = false,
								},
							}, -- [1]
							{
								["name"] = "无buff",
								["checked"] = true,
								["Mark"] = "590851-229702",
								["Conditions"] = {
									{
										["FireHasBeenSetValue"] = 2,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["Layer"] = {
												["checked"] = false,
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["BuffName"] = {
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["checked"] = false,
											["IsBuff"] = {
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
												["checked"] = false,
											},
										},
										["wbuff"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["MainChecked"] = false,
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["Energy"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["and/or"] = false,
										["Cooldown"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = {
											},
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Totem"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = "",
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["unit"] = "player",
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
											["checked"] = true,
											["IsOrAnd"] = "Or",
											["buffs"] = {
												{
													["IsPlayer"] = "All",
													["SpellId"] = 111400,
													["Class"] = {
													},
													["IsCd"] = "NotPresence",
													["IsCount"] = false,
													["Cd"] = {
														[">"] = {
															["Value"] = 0,
														},
														["<"] = {
															["Value"] = 0,
														},
													},
													["IsType"] = "Auto",
													["IsSpellIdTexture"] = "IsName",
													["IsCanceLable"] = "No",
													["Count"] = {
														[">"] = {
															["Value"] = 0,
														},
														["<"] = {
															["Value"] = 0,
														},
													},
													["IsRaid"] = "No",
												}, -- [1]
											},
											["buffindex"] = 1,
											["NoBuffNameCount"] = 0,
										},
										["NewSpell"] = {
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "2",
										["Blood"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Mark"] = "483949-561122",
										["TargetSubgroup"] = -1,
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["RangeCheck"] = {
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
										},
									}, -- [1]
								},
								["Remark"] = "",
								["Key"] = {
									["KeySelect"] = "auto",
									["lock"] = false,
								},
							}, -- [2]
							{
								["name"] = "战斗中",
								["checked"] = true,
								["Mark"] = "353220-943708",
								["Conditions"] = {
									{
										["FireHasBeenSetValue"] = 2,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["Layer"] = {
												["checked"] = false,
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["BuffName"] = {
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["checked"] = false,
											["IsBuff"] = {
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
												["checked"] = false,
											},
										},
										["wbuff"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["MainChecked"] = false,
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
											["lock"] = false,
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["Energy"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["and/or"] = false,
										["Cooldown"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = {
											},
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Totem"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = "",
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["unit"] = "player",
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
										},
										["NewSpell"] = {
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
											{
												["Arguments"] = {
													{
														["value"] = "unit",
													}, -- [1]
												},
												["checked"] = true,
												["id"] = "UnitAffectingCombat",
												["Returns"] = {
													{
														["value"] = true,
														["checked"] = true,
													}, -- [1]
												},
											}, -- [1]
										},
										["name"] = "3",
										["Blood"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Mark"] = "344175-212810",
										["TargetSubgroup"] = -1,
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["RangeCheck"] = {
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
										},
									}, -- [1]
								},
								["Remark"] = "",
								["Key"] = {
									["KeySelect"] = "auto",
									["lock"] = false,
								},
							}, -- [3]
							{
								["name"] = "血量",
								["checked"] = true,
								["Mark"] = "542330-318823",
								["Conditions"] = {
									{
										["FireHasBeenSetValue"] = 2,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["Layer"] = {
												["checked"] = false,
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["BuffName"] = {
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["checked"] = false,
											["IsBuff"] = {
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
												["checked"] = false,
											},
										},
										["wbuff"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["MainChecked"] = false,
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
											["lock"] = false,
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["Energy"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["and/or"] = false,
										["Cooldown"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = {
											},
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Totem"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = "",
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["unit"] = "player",
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
										},
										["NewSpell"] = {
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "4",
										["Blood"] = {
											["checked"] = true,
											["Percentage"] = true,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = true,
												["Value"] = 80,
											},
										},
										["Mark"] = "397013-381228",
										["TargetSubgroup"] = -1,
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["RangeCheck"] = {
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
										},
									}, -- [1]
								},
								["Remark"] = "",
								["Key"] = {
									["KeySelect"] = "auto",
								},
							}, -- [4]
						},
						["unit"] = "nogoal",
						["Key"] = {
							["lock"] = false,
							["KeySelect"] = "auto",
						},
						["Target"] = "无目标",
						["itemLink"] = "|cff71d5ff|Hspell:111400|h[爆燃冲刺]|h|r",
						["Texture"] = "Interface\\Icons\\ability_deathwing_sealarmorbreachtga",
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
							},
							["End"] = {
							},
						},
						["Type"] = "spell",
						["DelayValue"] = 0,
						["Remarks"] = "-开",
						["spellId"] = 111400,
						["Mark"] = "567569-507664",
						["TargetSubgroup"] = -1,
						["checked"] = true,
						["Rank"] = "",
					}, -- [1]
					{
						["TargetSubgroup"] = -1,
						["DelayChecked"] = false,
						["CastingSpell"] = {
						},
						["Targets"] = {
							{
								["name"] = "血量",
								["Key"] = {
									["lock"] = false,
									["KeySelect"] = "auto",
								},
								["Mark"] = "442354-419573",
								["Conditions"] = {
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
												["checked"] = false,
											},
										},
										["RangeCheck"] = {
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["unit"] = "player",
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = false,
										["FireHasBeenSetValue"] = 2,
										["Mark"] = "373559-334448",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Blood"] = {
											["checked"] = true,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = true,
												["Value"] = 80,
											},
											["Percentage"] = true,
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
										},
										["NewSpell"] = {
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "1",
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
									}, -- [1]
								},
								["Remark"] = "",
								["checked"] = true,
							}, -- [1]
							{
								["name"] = "静止",
								["Key"] = {
									["KeySelect"] = "auto",
								},
								["Mark"] = "883564-901639",
								["Conditions"] = {
									{
										["FireHasBeenSetValue"] = 2,
										["PlayerRangeCheckAngle"] = {
											["ContainChecked"] = false,
											["checked"] = false,
											["NewBuff"] = {
												["checked"] = false,
												["buffs"] = {
												},
											},
											["ExcludedTarget"] = {
												["checked"] = false,
												["Group"] = {
												},
												["GroupCount"] = 0,
												["TargetCount"] = 0,
												["Target"] = {
												},
											},
											["AngleValue"] = 90,
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["HealthPercentageChecked"] = false,
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["TargetChecked"] = false,
											["UnitType"] = "partyraid",
											["ExcludedClass"] = {
												["Class"] = {
												},
												["checked"] = false,
												["ClassCount"] = 0,
											},
											["AngleChecked"] = false,
											["LackHealthChecked"] = false,
											["Health"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Min_Max"] = {
												["Type"] = "Minimum_Blood_Percentage",
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["checked"] = true,
										["Buff"] = {
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["Layer"] = {
												["checked"] = false,
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["BuffName"] = {
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["checked"] = false,
											["IsBuff"] = {
												["checked"] = false,
												["BuffName"] = {
												},
												["NoBuffChecked"] = false,
											},
										},
										["wbuff"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["MainChecked"] = false,
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
											["lock"] = false,
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											["Percentage"] = true,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = true,
												["Value"] = 35,
											},
										},
										["and/or"] = false,
										["Cooldown"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = {
											},
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Totem"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = "",
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["unit"] = "player",
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["Blood"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["NewSpell"] = {
											["Spell"] = {
											},
											["Cd"] = {
												["Start"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
												["End"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
											},
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
											{
												["Arguments"] = {
													{
														["value"] = "unit",
													}, -- [1]
												},
												["checked"] = true,
												["id"] = "GetUnitSpeed",
												["Returns"] = {
													{
														["="] = {
															["Value"] = 0,
															["checked"] = true,
														},
														["<"] = {
															["Value"] = 0,
															["checked"] = false,
														},
														["checked"] = true,
														[">"] = {
															["Value"] = 1,
															["checked"] = false,
														},
													}, -- [1]
												},
											}, -- [1]
										},
										["name"] = "1",
										["NewBuff"] = {
											["IsOrAnd"] = "Or",
											["buffs"] = {
											},
											["NoBuffNameCount"] = 0,
										},
										["Mark"] = "796902-720087",
										["TargetSubgroup"] = -1,
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["RangeCheck"] = {
											["checked"] = false,
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
									}, -- [1]
								},
								["Remark"] = "",
								["checked"] = true,
							}, -- [2]
						},
						["unit"] = "player",
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["Remarks"] = "",
						["itemLink"] = "取消指定的BUFF",
						["Texture"] = "",
						["and/or"] = true,
						["Type"] = "Run",
						["subgroup"] = -4,
						["raidn"] = -4,
						["DelayValue"] = 0,
						["name"] = "",
						["ApiDbf"] = {
							{
								["Arguments"] = {
									{
										["value"] = "unit",
									}, -- [1]
									{
										["value"] = "爆燃冲刺",
									}, -- [2]
								},
								["checked"] = true,
								["id"] = "amCancelUnitBuff",
								["Returns"] = {
									{
										["value"] = true,
										["checked"] = true,
									}, -- [1]
								},
							}, -- [1]
						},
						["Mark"] = "455324-208890",
						["checked"] = true,
						["Target"] = "自己",
						["spellId"] = 0,
					}, -- [2]
				},
				["checked"] = true,
				["ApiDbf"] = {
				},
				["Key"] = {
					["KeySelect"] = "auto",
				},
				["Mark"] = "867620-347662",
				["Remarks"] = "",
				["ExcludeTarget"] = {
				},
				["name"] = "爆燃冲刺",
			}, -- [4]
			{
				["ExcludedGroup"] = {
				},
				["spell"] = {
					{
						["FireHasBeenSetValue"] = 2,
						["DelayChecked"] = false,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 109773,
									["Rank"] = "",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:109773|h[黑暗意图]|h|r",
									["Texture"] = "INTERFACE\\ICONS\\spell_warlock_focusshadow",
								}, -- [1]
							},
						},
						["Targets"] = {
						},
						["unit"] = "|cffCD96CDBUFF",
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["Target"] = "|cffCD96CDBUFF",
						["itemLink"] = "|cff71d5ff|Hspell:109773|h[黑暗意图]|h|r",
						["Texture"] = "INTERFACE\\ICONS\\spell_warlock_focusshadow",
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
								["script"] = "",
								["spell"] = {
								},
								["SetVariables"] = {
								},
								["Chat"] = {
									["text"] = "",
									["channel"] = 1,
									["isRadio"] = "SAY",
								},
							},
							["End"] = {
								["script"] = "",
								["Chat"] = {
									["text"] = "",
									["channel"] = 1,
									["isRadio"] = "SAY",
								},
							},
						},
						["Type"] = "spell",
						["DelayValue"] = 0,
						["checked"] = true,
						["Mark"] = "803691-407902",
						["spellId"] = 109773,
						["TargetSubgroup"] = -2,
						["Rank"] = "",
					}, -- [1]
					{
						["TargetSubgroup"] = -1,
						["DelayChecked"] = false,
						["ApiDbf"] = {
							{
								["id"] = "stEndProgram",
								["Arguments"] = {
								},
								["Returns"] = {
									{
										["value"] = true,
										["checked"] = true,
									}, -- [1]
								},
							}, -- [1]
						},
						["Targets"] = {
							{
								["name"] = "未进入战斗",
								["checked"] = true,
								["Mark"] = "446571-691127",
								["Conditions"] = {
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["Layer"] = {
												["checked"] = false,
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["BuffName"] = {
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["checked"] = false,
											["IsBuff"] = {
												["BuffName"] = {
												},
												["NoBuffChecked"] = false,
												["checked"] = false,
											},
										},
										["RangeCheck"] = {
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["unit"] = "player",
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["Energy"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["and/or"] = false,
										["Cooldown"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = {
											},
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Totem"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = "",
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["wbuff"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["MainChecked"] = false,
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
										},
										["NewSpell"] = {
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
											{
												["Arguments"] = {
													{
														["value"] = "unit",
													}, -- [1]
												},
												["checked"] = true,
												["id"] = "UnitAffectingCombat",
												["Returns"] = {
													{
														["value"] = false,
														["checked"] = true,
													}, -- [1]
												},
											}, -- [1]
										},
										["name"] = "3",
										["Blood"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Mark"] = "939869-580572",
										["FireHasBeenSetValue"] = 2,
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
									}, -- [1]
								},
								["Remark"] = "",
								["Key"] = {
									["KeySelect"] = "auto",
								},
							}, -- [1]
						},
						["unit"] = "nogoal",
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["Remarks"] = "",
						["itemLink"] = "|cffff0000结束当前施法方案",
						["Texture"] = "",
						["Type"] = "Run",
						["subgroup"] = -4,
						["raidn"] = -4,
						["DelayValue"] = 0,
						["name"] = "",
						["spellId"] = 0,
						["Mark"] = "376514-168976",
						["Target"] = "无目标",
						["checked"] = true,
						["CastingSpell"] = {
						},
					}, -- [2]
					{
						["TargetSubgroup"] = -1,
						["checked"] = true,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 113858,
									["Texture"] = "INTERFACE\\ICONS\\spell_warlock_demonsoul",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:113858|h[黑暗灵魂：易爆]|h|r",
									["Rank"] = "",
								}, -- [1]
							},
						},
						["Targets"] = {
							{
								["name"] = "1",
								["Key"] = {
									["KeySelect"] = "auto",
								},
								["Mark"] = "935890-694781",
								["Conditions"] = {
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["ContainChecked"] = false,
											["checked"] = false,
											["Min_Max"] = {
												["Type"] = "Minimum_Blood_Percentage",
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["ExcludedTarget"] = {
												["TargetCount"] = 0,
												["Target"] = {
												},
												["GroupCount"] = 0,
												["Group"] = {
												},
												["checked"] = false,
											},
											["AngleValue"] = 90,
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["NewBuff"] = {
												["checked"] = false,
												["buffs"] = {
												},
											},
											["UnitType"] = "partyraid",
											["TargetChecked"] = false,
											["Health"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["ExcludedClass"] = {
												["Class"] = {
												},
												["checked"] = false,
												["ClassCount"] = 0,
											},
											["AngleChecked"] = false,
											["LackHealthChecked"] = false,
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["HealthPercentageChecked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["checked"] = false,
												["BuffName"] = {
												},
												["NoBuffChecked"] = false,
											},
										},
										["RangeCheck"] = {
											["checked"] = false,
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["unit"] = "target",
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "当前目标",
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = true,
										["FireHasBeenSetValue"] = 2,
										["Mark"] = "729671-998978",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["NewBuff"] = {
											["IsOrAnd"] = "Or",
											["buffs"] = {
											},
											["NoBuffNameCount"] = 0,
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["Blood"] = {
											["checked"] = true,
											[">"] = {
												["checked"] = true,
												["Value"] = 3000000,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["NewSpell"] = {
											["Spell"] = {
											},
											["Cd"] = {
												["Start"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
												["End"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
											},
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
											{
												["Arguments"] = {
													{
														["value"] = "unit",
													}, -- [1]
													{
														["value"] = "worldboss",
													}, -- [2]
												},
												["checked"] = true,
												["id"] = "amUnitClassification",
												["Returns"] = {
													{
														["value"] = true,
														["checked"] = true,
													}, -- [1]
												},
											}, -- [1]
										},
										["name"] = "2",
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
									}, -- [1]
								},
								["Remark"] = "",
								["checked"] = true,
							}, -- [1]
						},
						["unit"] = "nogoal",
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["Target"] = "无目标",
						["itemLink"] = "|cff71d5ff|Hspell:113858|h[黑暗灵魂：易爆]|h|r",
						["Texture"] = "INTERFACE\\ICONS\\spell_warlock_demonsoul",
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
								["SetVariables"] = {
								},
								["spell"] = {
								},
								["script"] = "",
								["Chat"] = {
									["text"] = "",
									["isRadio"] = "SAY",
									["channel"] = 1,
								},
							},
							["End"] = {
								["script"] = "",
								["Chat"] = {
									["text"] = "",
									["isRadio"] = "SAY",
									["channel"] = 1,
								},
							},
						},
						["Type"] = "spell",
						["DelayValue"] = 0,
						["spellId"] = 113858,
						["Mark"] = "278624-879492",
						["DelayChecked"] = false,
						["FireHasBeenSetValue"] = 2,
						["Rank"] = "",
					}, -- [3]
					{
						["FireHasBeenSetValue"] = 2,
						["checked"] = true,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 18540,
									["Texture"] = "Interface\\Icons\\warlock_summon_doomguard",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:18540|h[召唤末日守卫]|h|r",
									["Rank"] = "守卫",
								}, -- [1]
							},
						},
						["Targets"] = {
							{
								["name"] = "正在嗜血",
								["checked"] = false,
								["Mark"] = "814094-987634",
								["Conditions"] = {
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["ContainChecked"] = false,
											["checked"] = false,
											["NewBuff"] = {
												["checked"] = false,
												["buffs"] = {
												},
											},
											["ExcludedTarget"] = {
												["checked"] = false,
												["Target"] = {
												},
												["GroupCount"] = 0,
												["TargetCount"] = 0,
												["Group"] = {
												},
											},
											["AngleValue"] = 90,
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["HealthPercentageChecked"] = false,
											["Health"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["TargetChecked"] = false,
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["ExcludedClass"] = {
												["Class"] = {
												},
												["checked"] = false,
												["ClassCount"] = 0,
											},
											["AngleChecked"] = false,
											["LackHealthChecked"] = false,
											["UnitType"] = "partyraid",
											["Min_Max"] = {
												["Type"] = "Minimum_Blood_Percentage",
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["checked"] = true,
										["Buff"] = {
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["Layer"] = {
												["checked"] = false,
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["BuffName"] = {
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["checked"] = false,
											["IsBuff"] = {
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
												["checked"] = false,
											},
										},
										["RangeCheck"] = {
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["unit"] = "player",
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["and/or"] = true,
										["Cooldown"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = {
											},
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Totem"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = "",
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["wbuff"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["MainChecked"] = false,
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["Blood"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = true,
												["Value"] = 50000000,
											},
										},
										["NewSpell"] = {
											["Spell"] = {
											},
											["Cd"] = {
												["Start"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
												["End"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
											},
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
											{
												["id"] = "amUnitClassification",
												["Arguments"] = {
													{
														["value"] = "unit",
													}, -- [1]
													{
														["value"] = "worldboss",
													}, -- [2]
												},
												["checked"] = true,
												["Returns"] = {
													{
														["value"] = true,
														["checked"] = true,
													}, -- [1]
												},
											}, -- [1]
										},
										["name"] = "2",
										["NewBuff"] = {
											["checked"] = true,
											["IsOrAnd"] = "Or",
											["buffs"] = {
												{
													["IsPlayer"] = "All",
													["SpellId"] = 2825,
													["Class"] = {
													},
													["IsSpellIdTexture"] = "IsName",
													["Cd"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["Count"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsCanceLable"] = "No",
													["IsType"] = "Auto",
													["IsRaid"] = "No",
												}, -- [1]
												{
													["IsPlayer"] = "All",
													["SpellId"] = 80353,
													["Class"] = {
													},
													["IsSpellIdTexture"] = "IsName",
													["Cd"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["Count"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsCanceLable"] = "No",
													["IsType"] = "Auto",
													["IsRaid"] = "No",
												}, -- [2]
											},
											["buffindex"] = 2,
											["NoBuffNameCount"] = 0,
										},
										["Mark"] = "211793-934033",
										["FireHasBeenSetValue"] = 2,
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
									}, -- [1]
								},
								["Remark"] = "",
								["Key"] = {
									["KeySelect"] = "auto",
								},
							}, -- [1]
						},
						["unit"] = "nogoal",
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["Target"] = "无目标",
						["itemLink"] = "|cff71d5ff|Hspell:18540|h[召唤末日守卫]|h|r",
						["Texture"] = "Interface\\Icons\\warlock_summon_doomguard",
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
								["script"] = "",
								["spell"] = {
								},
								["SetVariables"] = {
								},
								["Chat"] = {
									["text"] = "",
									["channel"] = 1,
									["isRadio"] = "SAY",
								},
							},
							["End"] = {
								["script"] = "",
								["Chat"] = {
									["text"] = "",
									["channel"] = 1,
									["isRadio"] = "SAY",
								},
							},
						},
						["Type"] = "spell",
						["DelayValue"] = 0,
						["spellId"] = 18540,
						["TargetSubgroup"] = -1,
						["Mark"] = "274836-325712",
						["StopCastingChecked"] = true,
						["DelayChecked"] = false,
						["Rank"] = "守卫",
					}, -- [4]
				},
				["checked"] = true,
				["ApiDbf"] = {
				},
				["Key"] = {
					["KeySelect"] = "auto",
					["lock"] = false,
				},
				["Remarks"] = "",
				["name"] = "通用",
				["ExcludeTarget"] = {
				},
				["Mark"] = "392729-915230",
			}, -- [5]
			{
				["ExcludedGroup"] = {
				},
				["spell"] = {
					{
						["TargetSubgroup"] = -1,
						["DelayChecked"] = false,
						["ApiDbf"] = {
							{
								["id"] = "amIsCurrentMouse",
								["Arguments"] = {
									{
										["value"] = "暗影之怒",
									}, -- [1]
								},
								["checked"] = true,
								["Returns"] = {
									{
										["value"] = true,
										["checked"] = true,
									}, -- [1]
								},
							}, -- [1]
						},
						["Targets"] = {
						},
						["unit"] = "nogoal",
						["Key"] = {
							["KeySelect"] = "auto",
							["lock"] = false,
						},
						["Remarks"] = "",
						["itemLink"] = "技能正在执行时按下鼠标左键",
						["Texture"] = "",
						["Type"] = "Run",
						["subgroup"] = -4,
						["raidn"] = -4,
						["DelayValue"] = 0,
						["Target"] = "无目标",
						["name"] = "",
						["spellId"] = 0,
						["Mark"] = "761648-620110",
						["StopCastingChecked"] = false,
						["checked"] = true,
						["CastingSpell"] = {
						},
					}, -- [1]
					{
						["TargetSubgroup"] = -1,
						["DelayChecked"] = false,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 104232,
									["Texture"] = "Interface\\Icons\\Spell_Shadow_RainOfFire",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:104232|h[火焰之雨]|h|r",
									["Rank"] = "",
								}, -- [1]
							},
						},
						["Targets"] = {
							{
								["name"] = "1",
								["checked"] = true,
								["Mark"] = "205441-508681",
								["Conditions"] = {
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["ContainChecked"] = false,
											["checked"] = false,
											["HealthPercentageChecked"] = false,
											["ExcludedTarget"] = {
												["TargetCount"] = 0,
												["Target"] = {
												},
												["GroupCount"] = 0,
												["checked"] = false,
												["Group"] = {
												},
											},
											["AngleValue"] = 90,
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["NewBuff"] = {
												["checked"] = false,
												["buffs"] = {
												},
											},
											["UnitType"] = "partyraid",
											["Min_Max"] = {
												["Type"] = "Minimum_Blood_Percentage",
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Health"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["ExcludedClass"] = {
												["Class"] = {
												},
												["checked"] = false,
												["ClassCount"] = 0,
											},
											["AngleChecked"] = false,
											["LackHealthChecked"] = false,
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["TargetChecked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["Layer"] = {
												["checked"] = false,
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["BuffName"] = {
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["checked"] = false,
											["IsBuff"] = {
												["BuffName"] = {
												},
												["NoBuffChecked"] = false,
												["checked"] = false,
											},
										},
										["RangeCheck"] = {
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "当前目标",
										["Energy"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["and/or"] = false,
										["Cooldown"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = {
											},
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Totem"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = "",
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["unit"] = "target",
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
											["checked"] = true,
											["IsOrAnd"] = "Or",
											["buffs"] = {
												{
													["IsPlayer"] = "PLAYER",
													["SpellId"] = 104232,
													["Class"] = {
													},
													["Count"] = {
														[">"] = {
															["Value"] = 0,
														},
														["<"] = {
															["Value"] = 0,
														},
													},
													["IsCd"] = "NotPresence",
													["IsCount"] = false,
													["Cd"] = {
														[">"] = {
															["Value"] = 0,
														},
														["<"] = {
															["Value"] = 0,
														},
													},
													["IsType"] = "Auto",
													["IsCanceLable"] = "No",
													["AdvancedSettings"] = true,
													["IsSpellIdTexture"] = "IsName",
													["IsRaid"] = "No",
												}, -- [1]
											},
											["buffindex"] = 1,
											["NoBuffNameCount"] = 1,
										},
										["NewSpell"] = {
											["Spell"] = {
											},
											["Cd"] = {
												["Start"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
												["End"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
											},
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
											{
												["id"] = "amuca",
												["Arguments"] = {
													{
														["value"] = "unit",
													}, -- [1]
												},
												["checked"] = true,
												["Returns"] = {
													{
														["value"] = true,
														["checked"] = true,
													}, -- [1]
												},
											}, -- [1]
										},
										["name"] = "1",
										["Blood"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Mark"] = "120654-685309",
										["FireHasBeenSetValue"] = 2,
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["wbuff"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["MainChecked"] = false,
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
									}, -- [1]
								},
								["Remark"] = "",
								["Key"] = {
									["KeySelect"] = "auto",
								},
							}, -- [1]
							{
								["name"] = "2",
								["checked"] = true,
								["Mark"] = "855909-641948",
								["Conditions"] = {
									{
										["FireHasBeenSetValue"] = 2,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["Layer"] = {
												["checked"] = false,
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["BuffName"] = {
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["checked"] = false,
											["IsBuff"] = {
												["NoBuffChecked"] = false,
												["checked"] = false,
												["BuffName"] = {
												},
											},
										},
										["RangeCheck"] = {
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["Energy"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["and/or"] = false,
										["Cooldown"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = {
											},
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Totem"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = "",
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["wbuff"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["MainChecked"] = false,
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
											["checked"] = true,
											["IsOrAnd"] = "Or",
											["buffs"] = {
												{
													["IsPlayer"] = "PLAYER",
													["SpellId"] = 104232,
													["Class"] = {
													},
													["Cd"] = {
														[">"] = {
															["Value"] = 0,
														},
														["<"] = {
															["Value"] = 0,
														},
													},
													["IsCd"] = "NotPresence",
													["IsCount"] = false,
													["Count"] = {
														[">"] = {
															["Value"] = 0,
														},
														["<"] = {
															["Value"] = 0,
														},
													},
													["IsType"] = "Auto",
													["IsCanceLable"] = "No",
													["AdvancedSettings"] = true,
													["IsSpellIdTexture"] = "IsName",
													["IsRaid"] = "No",
												}, -- [1]
											},
											["buffindex"] = 1,
											["NoBuffNameCount"] = 1,
										},
										["NewSpell"] = {
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "2",
										["Blood"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Mark"] = "512030-328422",
										["TargetSubgroup"] = -1,
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["unit"] = "player",
									}, -- [1]
								},
								["Remark"] = "",
								["Key"] = {
									["KeySelect"] = "auto",
								},
							}, -- [2]
						},
						["unit"] = "nogoal",
						["Key"] = {
							["KeySelect"] = "auto",
							["lock"] = false,
						},
						["Target"] = "无目标",
						["itemLink"] = "|cff71d5ff|Hspell:104232|h[火焰之雨]|h|r",
						["Texture"] = "Interface\\Icons\\Spell_Shadow_RainOfFire",
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
								["SetVariables"] = {
								},
								["spell"] = {
								},
								["script"] = "",
								["Chat"] = {
									["text"] = "",
									["isRadio"] = "SAY",
									["channel"] = 1,
								},
							},
							["End"] = {
								["script"] = "",
								["Chat"] = {
									["text"] = "",
									["isRadio"] = "SAY",
									["channel"] = 1,
								},
							},
						},
						["Type"] = "spell",
						["DelayValue"] = 0,
						["AOEChecked"] = true,
						["checked"] = true,
						["Mark"] = "461261-587721",
						["FireHasBeenSetValue"] = 2,
						["spellId"] = 104232,
						["Rank"] = "",
					}, -- [2]
					{
						["TargetSubgroup"] = -1,
						["checked"] = true,
						["CastingSpell"] = {
						},
						["PropertiesSet_Continue_Checked"] = false,
						["Targets"] = {
							{
								["name"] = "1",
								["checked"] = true,
								["Mark"] = "691499-470867",
								["Conditions"] = {
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["Layer"] = {
												["checked"] = false,
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["BuffName"] = {
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["checked"] = false,
											["IsBuff"] = {
												["NoBuffChecked"] = false,
												["checked"] = false,
												["BuffName"] = {
												},
											},
										},
										["RangeCheck"] = {
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["and/or"] = false,
										["Cooldown"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = {
											},
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Totem"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = "",
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["unit"] = "player",
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["Blood"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["NewSpell"] = {
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "1",
										["NewBuff"] = {
											["checked"] = true,
											["IsOrAnd"] = "Or",
											["buffs"] = {
												{
													["IsPlayer"] = "All",
													["SpellId"] = 5740,
													["Class"] = {
													},
													["IsCd"] = "End",
													["IsCount"] = false,
													["Cd"] = {
														[">"] = {
															["Value"] = 2,
															["Checked"] = true,
														},
														["<"] = {
															["Value"] = 0,
														},
													},
													["Count"] = {
														[">"] = {
															["Value"] = 0,
														},
														["<"] = {
															["Value"] = 0,
														},
													},
													["IsType"] = "Auto",
													["IsCanceLable"] = "No",
													["IsSpellIdTexture"] = "IsName",
													["IsRaid"] = "No",
												}, -- [1]
											},
											["buffindex"] = 1,
											["NoBuffNameCount"] = 0,
										},
										["Mark"] = "818811-332317",
										["FireHasBeenSetValue"] = 2,
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["wbuff"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["MainChecked"] = false,
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
									}, -- [1]
								},
								["Remark"] = "",
								["Key"] = {
									["KeySelect"] = "auto",
								},
							}, -- [1]
						},
						["unit"] = "Target",
						["Key"] = {
							["KeySelect"] = "auto",
							["lock"] = false,
						},
						["Target"] = "当前目标",
						["Type"] = "macro",
						["subgroup"] = -3,
						["raidn"] = -3,
						["DelayValue"] = 0,
						["PropertiesSetChecked"] = 2,
						["name"] = "",
						["DelayChecked"] = false,
						["Mark"] = "967647-516974",
						["id"] = "1400897316-155030.374",
						["spellId"] = 0,
						["Remarks"] = "-关闭",
					}, -- [3]
				},
				["checked"] = false,
				["ApiDbf"] = {
				},
				["Mark"] = "487436-936016",
				["Key"] = {
					["Checked"] = true,
					["lock"] = false,
					["Value"] = "F3",
					["KeySelect"] = "auto",
					["ButtonFrame"] = {
					},
				},
				["Remarks"] = "F3",
				["CastOffSchem"] = false,
				["name"] = "火雨",
				["CastOffSchemEnd"] = false,
				["ExcludeTarget"] = {
				},
			}, -- [6]
			{
				["ExcludeTarget"] = {
				},
				["spell"] = {
					{
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
							},
							["End"] = {
							},
						},
						["Type"] = "spell",
						["checked"] = true,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 17877,
									["Texture"] = "Interface\\Icons\\Spell_Shadow_ScourgeBuild",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:17877|h[暗影灼烧]|h|r",
									["Rank"] = "",
								}, -- [1]
							},
						},
						["DelayValue"] = 0,
						["Texture"] = "Interface\\Icons\\Spell_Shadow_ScourgeBuild",
						["Targets"] = {
							{
								["name"] = "1",
								["Key"] = {
									["lock"] = false,
									["KeySelect"] = "auto",
								},
								["Mark"] = "121119-211348",
								["Conditions"] = {
									{
										["FireHasBeenSetValue"] = 2,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["checked"] = false,
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
											},
										},
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["RangeCheck"] = {
											["checked"] = false,
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = false,
										["TargetSubgroup"] = -1,
										["Mark"] = "481645-232366",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["NewBuff"] = {
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["Blood"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["NewSpell"] = {
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "",
										["unit"] = "player",
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
												{
													["SpellId"] = 17877,
													["Name"] = "暗影灼烧",
													["Texture"] = "Interface\\Icons\\Spell_Shadow_ScourgeBuild",
												}, -- [1]
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = true,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = true,
											[">"] = {
												["checked"] = true,
												["Value"] = 1,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
									}, -- [1]
									{
										["FireHasBeenSetValue"] = 2,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["checked"] = false,
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
											},
										},
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "当前目标",
										["RangeCheck"] = {
											["checked"] = false,
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = false,
										["TargetSubgroup"] = -1,
										["Mark"] = "165855-285244",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["NewBuff"] = {
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["Blood"] = {
											["checked"] = true,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = true,
												["Value"] = 20,
											},
											["Percentage"] = true,
										},
										["NewSpell"] = {
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "",
										["unit"] = "target",
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
									}, -- [2]
								},
								["Remark"] = "",
								["checked"] = true,
							}, -- [1]
						},
						["unit"] = "Target",
						["spellId"] = 17877,
						["TargetSubgroup"] = -1,
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["Target"] = "当前目标",
						["Mark"] = "635297-729920",
						["DelayChecked"] = false,
						["itemLink"] = "|cff71d5ff|Hspell:17877|h[暗影灼烧]|h|r",
						["Rank"] = "",
					}, -- [1]
					{
						["TargetSubgroup"] = -1,
						["spellId"] = 17962,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 17962,
									["Rank"] = "",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:17962|h[燃烧]|h|r",
									["Texture"] = "Interface\\Icons\\spell_fire_fireballgreen2",
								}, -- [1]
							},
						},
						["Targets"] = {
							{
								["name"] = "1",
								["Key"] = {
									["KeySelect"] = "auto",
									["lock"] = false,
								},
								["Mark"] = "342854-893721",
								["Conditions"] = {
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["checked"] = false,
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
											},
										},
										["RangeCheck"] = {
											["checked"] = false,
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = false,
										["FireHasBeenSetValue"] = 2,
										["Mark"] = "125075-120944",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Blood"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
											["buffindex"] = 3,
											["IsOrAnd"] = "And",
											["buffs"] = {
												{
													["IsType"] = "HELPFUL",
													["SpellId"] = 1022,
													["Class"] = {
													},
													["Count"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsCd"] = "NotPresence",
													["IsSpellIdTexture"] = "IsName",
													["Cd"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsCount"] = false,
													["AdvancedSettings"] = true,
													["IsCanceLable"] = "No",
													["IsPlayer"] = "All",
													["IsRaid"] = "No",
												}, -- [1]
												{
													["IsType"] = "HELPFUL",
													["SpellId"] = 104773,
													["Class"] = {
													},
													["Count"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsCd"] = "NotPresence",
													["IsSpellIdTexture"] = "IsName",
													["Cd"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsCount"] = false,
													["AdvancedSettings"] = true,
													["IsCanceLable"] = "No",
													["IsPlayer"] = "All",
													["IsRaid"] = "No",
												}, -- [2]
												{
													["IsType"] = "HELPFUL",
													["SpellId"] = 31821,
													["Class"] = {
													},
													["Count"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsCd"] = "NotPresence",
													["IsSpellIdTexture"] = "IsName",
													["Cd"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsCount"] = false,
													["AdvancedSettings"] = true,
													["IsCanceLable"] = "No",
													["IsPlayer"] = "All",
													["IsRaid"] = "No",
												}, -- [3]
											},
											["checked"] = true,
											["NoBuffNameCount"] = 0,
										},
										["NewSpell"] = {
											["Spell"] = {
											},
											["Cd"] = {
												["Start"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
												["End"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
											},
											["AllSpell"] = true,
											["checked"] = true,
											["NotInterrupt"] = "Yes",
										},
										["ApiDbf"] = {
										},
										["name"] = "",
										["unit"] = "player",
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
									}, -- [1]
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["checked"] = false,
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
											},
										},
										["RangeCheck"] = {
											["checked"] = false,
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "当前目标",
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = true,
										["FireHasBeenSetValue"] = 2,
										["Mark"] = "555728-946054",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Blood"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
											["IsOrAnd"] = "Or",
											["buffs"] = {
											},
											["NoBuffNameCount"] = 0,
										},
										["NewSpell"] = {
											["Cd"] = {
												["Start"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
												["End"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
											},
											["Spell"] = {
												{
													["Checked"] = true,
													["SpellId"] = 143343,
													["Cd"] = {
														["Start"] = {
															["Value"] = 0.1,
															["Checked"] = false,
															["Random"] = {
																["<"] = {
																	["Value"] = 0,
																},
																[">"] = {
																	["Value"] = 0,
																},
															},
														},
														["End"] = {
															["Value"] = 0.3,
															["Checked"] = false,
															["Random"] = {
																["<"] = {
																	["Value"] = 0,
																},
																[">"] = {
																	["Value"] = 0,
																},
															},
														},
													},
													["NotInterrupt"] = "All",
												}, -- [1]
											},
											["checked"] = true,
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "",
										["unit"] = "target",
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = true,
												["Value"] = 98,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = true,
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
									}, -- [2]
								},
								["Remark"] = "",
								["checked"] = true,
							}, -- [1]
							{
								["Key"] = {
									["lock"] = false,
									["KeySelect"] = "auto",
								},
								["checked"] = true,
								["Remarks"] = "",
								["Mark"] = "938368-582344",
								["Conditions"] = {
									{
										["FireHasBeenSetValue"] = 2,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["Layer"] = {
												["checked"] = false,
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["BuffName"] = {
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["checked"] = false,
											["IsBuff"] = {
												["checked"] = false,
												["BuffName"] = {
												},
												["NoBuffChecked"] = false,
											},
										},
										["wbuff"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["MainChecked"] = false,
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = true,
											[">"] = {
												["checked"] = true,
												["Value"] = 1,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["and/or"] = false,
										["Cooldown"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = {
											},
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Totem"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = "",
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["unit"] = "player",
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["Blood"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["NewSpell"] = {
											["Spell"] = {
											},
											["checked"] = true,
											["AllSpell"] = true,
											["Cd"] = {
												["Start"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
												["End"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
											},
											["NotInterrupt"] = "Yes",
										},
										["ApiDbf"] = {
										},
										["name"] = "",
										["NewBuff"] = {
											["checked"] = true,
											["IsOrAnd"] = "Or",
											["buffs"] = {
												{
													["IsType"] = "HELPFUL",
													["SpellId"] = 1022,
													["Class"] = {
													},
													["Count"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsCd"] = "Presence",
													["IsCount"] = false,
													["Cd"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsSpellIdTexture"] = "IsName",
													["AdvancedSettings"] = true,
													["IsCanceLable"] = "No",
													["IsPlayer"] = "All",
													["IsRaid"] = "No",
												}, -- [1]
												{
													["IsType"] = "HELPFUL",
													["SpellId"] = 104773,
													["Class"] = {
													},
													["Count"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsCd"] = "Presence",
													["IsCount"] = false,
													["Cd"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsSpellIdTexture"] = "IsName",
													["AdvancedSettings"] = true,
													["IsCanceLable"] = "No",
													["IsPlayer"] = "All",
													["IsRaid"] = "No",
												}, -- [2]
												{
													["IsType"] = "HELPFUL",
													["SpellId"] = 31821,
													["Class"] = {
													},
													["Count"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsCd"] = "Presence",
													["IsCount"] = false,
													["Cd"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsSpellIdTexture"] = "IsName",
													["AdvancedSettings"] = true,
													["IsCanceLable"] = "No",
													["IsPlayer"] = "All",
													["IsRaid"] = "No",
												}, -- [3]
											},
											["buffindex"] = 1,
											["NoBuffNameCount"] = 0,
										},
										["Mark"] = "623910-531902",
										["TargetSubgroup"] = -1,
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["RangeCheck"] = {
											["checked"] = false,
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
									}, -- [1]
								},
								["Remark"] = "",
								["name"] = "2",
							}, -- [2]
						},
						["unit"] = "Target",
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["Target"] = "当前目标",
						["itemLink"] = "|cff71d5ff|Hspell:17962|h[燃烧]|h|r",
						["Texture"] = "Interface\\Icons\\Spell_Fire_Fireball",
						["and/or"] = true,
						["Type"] = "spell",
						["DelayValue"] = 0,
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
							},
							["End"] = {
							},
						},
						["checked"] = true,
						["Mark"] = "950335-687126",
						["StopCastingChecked"] = true,
						["DelayChecked"] = false,
						["Rank"] = "",
					}, -- [2]
					{
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
							},
							["End"] = {
							},
						},
						["Type"] = "spell",
						["checked"] = true,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 116858,
									["Rank"] = "",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:116858|h[混乱之箭]|h|r",
									["Texture"] = "Interface\\Icons\\Ability_Warlock_ChaosBolt",
								}, -- [1]
							},
						},
						["DelayValue"] = 0,
						["Rank"] = "",
						["Targets"] = {
							{
								["name"] = "1",
								["Key"] = {
									["KeySelect"] = "auto",
									["lock"] = false,
								},
								["Mark"] = "278940-350221",
								["Conditions"] = {
									{
										["FireHasBeenSetValue"] = 2,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["checked"] = false,
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
											},
										},
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["RangeCheck"] = {
											["checked"] = false,
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = false,
										["TargetSubgroup"] = -1,
										["Mark"] = "995426-829275",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["NewBuff"] = {
											["buffindex"] = 1,
											["IsOrAnd"] = "And",
											["buffs"] = {
												{
													["IsPlayer"] = "All",
													["SpellId"] = 1022,
													["Class"] = {
													},
													["Count"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsCd"] = "NotPresence",
													["IsCount"] = false,
													["Cd"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsSpellIdTexture"] = "IsName",
													["AdvancedSettings"] = true,
													["IsCanceLable"] = "No",
													["IsType"] = "HELPFUL",
													["IsRaid"] = "No",
												}, -- [1]
												{
													["IsPlayer"] = "All",
													["SpellId"] = 104773,
													["Class"] = {
													},
													["Count"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsCd"] = "NotPresence",
													["IsCount"] = false,
													["Cd"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsSpellIdTexture"] = "IsName",
													["AdvancedSettings"] = true,
													["IsCanceLable"] = "No",
													["IsType"] = "HELPFUL",
													["IsRaid"] = "No",
												}, -- [2]
												{
													["IsPlayer"] = "All",
													["SpellId"] = 31821,
													["Class"] = {
													},
													["Count"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsCd"] = "NotPresence",
													["IsCount"] = false,
													["Cd"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsSpellIdTexture"] = "IsName",
													["AdvancedSettings"] = true,
													["IsCanceLable"] = "No",
													["IsType"] = "HELPFUL",
													["IsRaid"] = "No",
												}, -- [3]
											},
											["checked"] = true,
											["NoBuffNameCount"] = 0,
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["Blood"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["NewSpell"] = {
											["Spell"] = {
											},
											["Cd"] = {
												["Start"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
												["End"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
											},
											["AllSpell"] = true,
											["checked"] = true,
											["not"] = false,
											["NotInterrupt"] = "Yes",
										},
										["ApiDbf"] = {
										},
										["name"] = "",
										["unit"] = "player",
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
									}, -- [1]
									{
										["FireHasBeenSetValue"] = 2,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["checked"] = false,
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
											},
										},
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "当前目标",
										["RangeCheck"] = {
											["checked"] = false,
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = true,
										["TargetSubgroup"] = -1,
										["Mark"] = "522999-602351",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["NewBuff"] = {
											["IsOrAnd"] = "Or",
											["buffs"] = {
											},
											["NoBuffNameCount"] = 0,
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["Blood"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["NewSpell"] = {
											["Cd"] = {
												["Start"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
												["End"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
											},
											["Spell"] = {
												{
													["Checked"] = true,
													["SpellId"] = 143343,
													["Cd"] = {
														["Start"] = {
															["Value"] = 0.1,
															["Checked"] = false,
															["Random"] = {
																["<"] = {
																	["Value"] = 0,
																},
																[">"] = {
																	["Value"] = 0,
																},
															},
														},
														["End"] = {
															["Value"] = 0.3,
															["Checked"] = false,
															["Random"] = {
																["<"] = {
																	["Value"] = 0,
																},
																[">"] = {
																	["Value"] = 0,
																},
															},
														},
													},
													["NotInterrupt"] = "All",
												}, -- [1]
											},
											["checked"] = true,
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "",
										["unit"] = "target",
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = true,
												["Value"] = 98,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = true,
										},
									}, -- [2]
								},
								["Remark"] = "",
								["checked"] = true,
							}, -- [1]
						},
						["unit"] = "Target",
						["spellId"] = 116858,
						["DelayChecked"] = false,
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["Mark"] = "620163-823078",
						["Target"] = "当前目标",
						["TargetSubgroup"] = -1,
						["itemLink"] = "|cff71d5ff|Hspell:116858|h[混乱之箭]|h|r",
						["Texture"] = "Interface\\Icons\\Ability_Warlock_ChaosBolt",
					}, -- [3]
					{
						["TargetSubgroup"] = -1,
						["checked"] = true,
						["CastingSpell"] = {
						},
						["Targets"] = {
							{
								["name"] = "1",
								["Key"] = {
									["KeySelect"] = "auto",
									["lock"] = false,
								},
								["Mark"] = "303906-993770",
								["Conditions"] = {
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["checked"] = false,
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
											},
										},
										["RangeCheck"] = {
											["checked"] = false,
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = false,
										["FireHasBeenSetValue"] = 2,
										["Mark"] = "600085-591333",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Blood"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
											["buffindex"] = 1,
											["IsOrAnd"] = "And",
											["buffs"] = {
												{
													["IsType"] = "HELPFUL",
													["SpellId"] = 1022,
													["Class"] = {
													},
													["Count"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsCd"] = "NotPresence",
													["IsSpellIdTexture"] = "IsName",
													["Cd"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsCount"] = false,
													["AdvancedSettings"] = true,
													["IsCanceLable"] = "No",
													["IsPlayer"] = "All",
													["IsRaid"] = "No",
												}, -- [1]
												{
													["IsType"] = "HELPFUL",
													["SpellId"] = 104773,
													["Class"] = {
													},
													["Count"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsCd"] = "NotPresence",
													["IsSpellIdTexture"] = "IsName",
													["Cd"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsCount"] = false,
													["AdvancedSettings"] = true,
													["IsCanceLable"] = "No",
													["IsPlayer"] = "All",
													["IsRaid"] = "No",
												}, -- [2]
												{
													["IsType"] = "HELPFUL",
													["SpellId"] = 31821,
													["Class"] = {
													},
													["Count"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsCd"] = "NotPresence",
													["IsSpellIdTexture"] = "IsName",
													["Cd"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsCount"] = false,
													["AdvancedSettings"] = true,
													["IsCanceLable"] = "No",
													["IsPlayer"] = "All",
													["IsRaid"] = "No",
												}, -- [3]
											},
											["checked"] = true,
											["NoBuffNameCount"] = 0,
										},
										["NewSpell"] = {
											["Spell"] = {
											},
											["Cd"] = {
												["Start"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
												["End"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
											},
											["AllSpell"] = true,
											["checked"] = true,
											["not"] = false,
											["NotInterrupt"] = "Yes",
										},
										["ApiDbf"] = {
										},
										["name"] = "",
										["unit"] = "player",
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
									}, -- [1]
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["checked"] = false,
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
											},
										},
										["RangeCheck"] = {
											["checked"] = false,
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "当前目标",
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = true,
										["FireHasBeenSetValue"] = 2,
										["Mark"] = "244902-973193",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Blood"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
											["IsOrAnd"] = "Or",
											["buffs"] = {
											},
											["NoBuffNameCount"] = 0,
										},
										["NewSpell"] = {
											["Cd"] = {
												["Start"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
												["End"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
											},
											["Spell"] = {
												{
													["Checked"] = true,
													["SpellId"] = 143343,
													["Cd"] = {
														["Start"] = {
															["Value"] = 0.1,
															["Checked"] = false,
															["Random"] = {
																["<"] = {
																	["Value"] = 0,
																},
																[">"] = {
																	["Value"] = 0,
																},
															},
														},
														["End"] = {
															["Value"] = 0.3,
															["Checked"] = false,
															["Random"] = {
																["<"] = {
																	["Value"] = 0,
																},
																[">"] = {
																	["Value"] = 0,
																},
															},
														},
													},
													["NotInterrupt"] = "All",
												}, -- [1]
											},
											["checked"] = true,
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "",
										["unit"] = "target",
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = true,
												["Value"] = 98,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = true,
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
									}, -- [2]
								},
								["Remark"] = "",
								["checked"] = true,
							}, -- [1]
						},
						["unit"] = "nogoal",
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["Remarks"] = "",
						["itemLink"] = "打断自己",
						["Texture"] = "",
						["Type"] = "Run",
						["subgroup"] = -4,
						["raidn"] = -4,
						["DelayValue"] = 0,
						["ApiDbf"] = {
							{
								["id"] = "amStopCasting",
								["Arguments"] = {
								},
								["Returns"] = {
									{
										["value"] = true,
										["checked"] = true,
									}, -- [1]
								},
							}, -- [1]
						},
						["name"] = "",
						["spellId"] = 0,
						["Mark"] = "390093-654494",
						["StopCastingChecked"] = false,
						["DelayChecked"] = false,
						["Target"] = "无目标",
					}, -- [4]
				},
				["checked"] = false,
				["ApiDbf"] = {
				},
				["Key"] = {
					["KeySelect"] = "auto",
					["lock"] = false,
				},
				["Mark"] = "994910-609800",
				["Remarks"] = "",
				["ExcludedGroup"] = {
				},
				["name"] = "11号索克",
			}, -- [7]
			{
				["ExcludedGroup"] = {
				},
				["spell"] = {
					{
						["TargetSubgroup"] = -1,
						["spellId"] = 0,
						["CastingSpell"] = {
						},
						["Targets"] = {
							{
								["name"] = "未进入战斗",
								["checked"] = true,
								["Mark"] = "883491-344585",
								["Conditions"] = {
									{
										["FireHasBeenSetValue"] = 2,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["Layer"] = {
												["checked"] = false,
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["BuffName"] = {
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["checked"] = false,
											["IsBuff"] = {
												["NoBuffChecked"] = false,
												["checked"] = false,
												["BuffName"] = {
												},
											},
										},
										["RangeCheck"] = {
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["and/or"] = false,
										["Cooldown"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = {
											},
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Totem"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = "",
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["wbuff"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["MainChecked"] = false,
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["Blood"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["NewSpell"] = {
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
											{
												["Arguments"] = {
													{
														["value"] = "unit",
													}, -- [1]
												},
												["checked"] = true,
												["id"] = "UnitAffectingCombat",
												["Returns"] = {
													{
														["value"] = false,
														["checked"] = true,
													}, -- [1]
												},
											}, -- [1]
										},
										["name"] = "3",
										["NewBuff"] = {
										},
										["Mark"] = "175670-705107",
										["TargetSubgroup"] = -1,
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["unit"] = "player",
									}, -- [1]
								},
								["Remark"] = "",
								["Key"] = {
									["lock"] = false,
									["KeySelect"] = "auto",
								},
							}, -- [1]
							{
								["name"] = "单数",
								["Key"] = {
									["KeySelect"] = "auto",
								},
								["Mark"] = "522053-885001",
								["Conditions"] = {
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["checked"] = false,
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
											},
										},
										["RangeCheck"] = {
											["checked"] = false,
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["unit"] = "target",
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "当前目标",
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = false,
										["FireHasBeenSetValue"] = 2,
										["Mark"] = "914955-428223",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["NewBuff"] = {
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["Blood"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["NewSpell"] = {
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
											{
												["Arguments"] = {
													{
														["value"] = "unit",
													}, -- [1]
													{
														["value"] = 8,
													}, -- [2]
												},
												["checked"] = true,
												["id"] = "FHGetRangeEnemyCount",
												["Returns"] = {
													{
														["="] = {
															["Value"] = 0,
															["checked"] = false,
														},
														["<"] = {
															["Value"] = 2,
															["checked"] = false,
														},
														["checked"] = true,
														[">"] = {
															["Value"] = 3,
															["checked"] = true,
														},
													}, -- [1]
												},
											}, -- [1]
										},
										["name"] = "1",
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
									}, -- [1]
								},
								["Remark"] = "",
								["checked"] = true,
							}, -- [2]
						},
						["unit"] = "nogoal",
						["Key"] = {
							["lock"] = false,
							["KeySelect"] = "auto",
						},
						["Remarks"] = "",
						["itemLink"] = "|cffff0000结束当前施法方案",
						["Texture"] = "",
						["and/or"] = true,
						["Type"] = "Run",
						["subgroup"] = -4,
						["raidn"] = -4,
						["DelayValue"] = 0,
						["name"] = "",
						["DelayChecked"] = false,
						["Mark"] = "397037-451061",
						["Target"] = "无目标",
						["checked"] = true,
						["ApiDbf"] = {
							{
								["id"] = "stEndProgram",
								["Arguments"] = {
								},
								["Returns"] = {
									{
										["value"] = true,
										["checked"] = true,
									}, -- [1]
								},
							}, -- [1]
						},
					}, -- [1]
					{
						["TargetSubgroup"] = -1,
						["spellId"] = 0,
						["ApiDbf"] = {
							{
								["Arguments"] = {
									{
										["value"] = "unit",
									}, -- [1]
									{
										["value"] = "硫磺烈火",
									}, -- [2]
								},
								["checked"] = true,
								["id"] = "amCancelUnitBuff",
								["Returns"] = {
									{
										["value"] = true,
										["checked"] = true,
									}, -- [1]
								},
							}, -- [1]
						},
						["Targets"] = {
						},
						["unit"] = "player",
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["Remarks"] = "",
						["itemLink"] = "取消指定的BUFF",
						["Texture"] = "",
						["Type"] = "Run",
						["subgroup"] = -4,
						["raidn"] = -4,
						["DelayValue"] = 0,
						["name"] = "",
						["CastingSpell"] = {
						},
						["Mark"] = "358764-266611",
						["checked"] = true,
						["Target"] = "自己",
						["DelayChecked"] = false,
					}, -- [2]
					{
						["TargetSubgroup"] = -1,
						["checked"] = true,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 17877,
									["Texture"] = "Interface\\Icons\\Spell_Shadow_ScourgeBuild",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:17877|h[暗影灼烧]|h|r",
									["Rank"] = "",
								}, -- [1]
							},
						},
						["Targets"] = {
							{
								["name"] = "焦点有浩劫",
								["checked"] = true,
								["Mark"] = "327871-348089",
								["Conditions"] = {
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["Layer"] = {
												["checked"] = false,
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["BuffName"] = {
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["checked"] = false,
											["IsBuff"] = {
												["checked"] = false,
												["BuffName"] = {
												},
												["NoBuffChecked"] = false,
											},
										},
										["RangeCheck"] = {
											["checked"] = false,
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["unit"] = "focus",
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "焦点目标",
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["and/or"] = false,
										["Cooldown"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = {
											},
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Totem"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = "",
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["wbuff"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["MainChecked"] = false,
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["Blood"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["NewSpell"] = {
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "1",
										["NewBuff"] = {
											["IsOrAnd"] = "Or",
											["buffs"] = {
												{
													["IsPlayer"] = "All",
													["SpellId"] = 80240,
													["Class"] = {
													},
													["IsSpellIdTexture"] = "IsName",
													["Cd"] = {
														[">"] = {
															["Value"] = 0,
														},
														["<"] = {
															["Value"] = 0,
														},
													},
													["Count"] = {
														[">"] = {
															["Value"] = 0,
														},
														["<"] = {
															["Value"] = 0,
														},
													},
													["IsCanceLable"] = "No",
													["IsType"] = "Auto",
													["IsRaid"] = "No",
												}, -- [1]
											},
											["checked"] = true,
											["NoBuffNameCount"] = 0,
										},
										["Mark"] = "847716-273052",
										["FireHasBeenSetValue"] = 2,
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
									}, -- [1]
								},
								["Remark"] = "",
								["Key"] = {
									["lock"] = false,
									["KeySelect"] = "auto",
								},
							}, -- [1]
							{
								["name"] = "buff",
								["checked"] = true,
								["Mark"] = "220346-795816",
								["Conditions"] = {
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["ContainChecked"] = false,
											["checked"] = false,
											["HealthPercentageChecked"] = false,
											["ExcludedTarget"] = {
												["checked"] = false,
												["Target"] = {
												},
												["GroupCount"] = 0,
												["TargetCount"] = 0,
												["Group"] = {
												},
											},
											["AngleValue"] = 90,
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["NewBuff"] = {
												["checked"] = false,
												["buffs"] = {
												},
											},
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Min_Max"] = {
												["Type"] = "Minimum_Blood_Percentage",
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["UnitType"] = "partyraid",
											["ExcludedClass"] = {
												["Class"] = {
												},
												["checked"] = false,
												["ClassCount"] = 0,
											},
											["AngleChecked"] = false,
											["LackHealthChecked"] = false,
											["Health"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["TargetChecked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["Layer"] = {
												["checked"] = false,
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["BuffName"] = {
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["checked"] = false,
											["IsBuff"] = {
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
												["checked"] = false,
											},
										},
										["RangeCheck"] = {
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["Energy"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = true,
											[">"] = {
												["checked"] = true,
												["Value"] = 4,
											},
										},
										["and/or"] = true,
										["Cooldown"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = {
											},
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Totem"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = "",
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["unit"] = "player",
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
											["buffindex"] = 2,
											["IsOrAnd"] = "Or",
											["buffs"] = {
												{
													["IsPlayer"] = "All",
													["SpellId"] = 113858,
													["Class"] = {
													},
													["IsCd"] = "Presence",
													["IsCount"] = false,
													["Cd"] = {
														[">"] = {
															["Value"] = 0,
														},
														["<"] = {
															["Value"] = 0,
														},
													},
													["Count"] = {
														[">"] = {
															["Value"] = 0,
														},
														["<"] = {
															["Value"] = 0,
														},
													},
													["IsType"] = "Auto",
													["IsCanceLable"] = "No",
													["IsSpellIdTexture"] = "IsName",
													["IsRaid"] = "No",
												}, -- [1]
												{
													["IsPlayer"] = "All",
													["SpellId"] = 148906,
													["Class"] = {
													},
													["IsCd"] = "Presence",
													["IsSpellIdTexture"] = "IsName",
													["Cd"] = {
														[">"] = {
															["Value"] = 0,
														},
														["<"] = {
															["Value"] = 0,
														},
													},
													["Count"] = {
														[">"] = {
															["Value"] = 0,
														},
														["<"] = {
															["Value"] = 0,
														},
													},
													["IsType"] = "Auto",
													["IsCanceLable"] = "No",
													["IsCount"] = false,
													["IsRaid"] = "No",
												}, -- [2]
												{
													["IsType"] = "Auto",
													["SpellId"] = 146046,
													["Class"] = {
													},
													["IsSpellIdTexture"] = "IsName",
													["Cd"] = {
														[">"] = {
															["Value"] = 0,
														},
														["<"] = {
															["Value"] = 0,
														},
													},
													["Count"] = {
														[">"] = {
															["Value"] = 0,
														},
														["<"] = {
															["Value"] = 0,
														},
													},
													["IsCanceLable"] = "No",
													["IsPlayer"] = "All",
													["IsRaid"] = "No",
												}, -- [3]
												{
													["IsType"] = "Auto",
													["SpellId"] = 146202,
													["Class"] = {
													},
													["IsSpellIdTexture"] = "IsName",
													["Cd"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["Count"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsCanceLable"] = "No",
													["IsPlayer"] = "All",
													["IsRaid"] = "No",
												}, -- [4]
											},
											["checked"] = true,
											["NoBuffNameCount"] = 0,
										},
										["NewSpell"] = {
											["Spell"] = {
											},
											["Cd"] = {
												["Start"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
												["End"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
											},
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "2",
										["Blood"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Mark"] = "141252-370893",
										["FireHasBeenSetValue"] = 2,
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["wbuff"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["MainChecked"] = false,
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
									}, -- [1]
								},
								["Remark"] = "",
								["Key"] = {
									["lock"] = false,
									["KeySelect"] = "auto",
								},
							}, -- [2]
						},
						["unit"] = "Target",
						["Key"] = {
							["lock"] = false,
							["KeySelect"] = "auto",
						},
						["Target"] = "当前目标",
						["itemLink"] = "|cff71d5ff|Hspell:17877|h[暗影灼烧]|h|r",
						["Texture"] = "Interface\\Icons\\Spell_Shadow_ScourgeBuild",
						["and/or"] = true,
						["Type"] = "spell",
						["DelayValue"] = 0,
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
							},
							["End"] = {
							},
						},
						["spellId"] = 17877,
						["Mark"] = "263326-994257",
						["StopCastingChecked"] = true,
						["DelayChecked"] = false,
						["Rank"] = "",
					}, -- [3]
					{
						["TargetSubgroup"] = -1,
						["spellId"] = 29722,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 29722,
									["Rank"] = "",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:29722|h[烧尽]|h|r",
									["Texture"] = "Interface\\Icons\\Spell_Fire_Burnout",
								}, -- [1]
							},
						},
						["Targets"] = {
							{
								["name"] = "移动",
								["Key"] = {
									["lock"] = false,
									["KeySelect"] = "auto",
								},
								["Mark"] = "370335-563338",
								["Conditions"] = {
									{
										["FireHasBeenSetValue"] = 2,
										["PlayerRangeCheckAngle"] = {
											["ContainChecked"] = false,
											["checked"] = false,
											["Min_Max"] = {
												["Type"] = "Minimum_Blood_Percentage",
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["ExcludedTarget"] = {
												["TargetCount"] = 0,
												["Group"] = {
												},
												["GroupCount"] = 0,
												["Target"] = {
												},
												["checked"] = false,
											},
											["AngleValue"] = 90,
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["NewBuff"] = {
												["checked"] = false,
												["buffs"] = {
												},
											},
											["UnitType"] = "partyraid",
											["TargetChecked"] = false,
											["Health"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["ExcludedClass"] = {
												["Class"] = {
												},
												["checked"] = false,
												["ClassCount"] = 0,
											},
											["AngleChecked"] = false,
											["LackHealthChecked"] = false,
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["HealthPercentageChecked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
												["checked"] = false,
											},
										},
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["lock"] = false,
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["RangeCheck"] = {
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = false,
										["TargetSubgroup"] = -1,
										["Mark"] = "283822-913393",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["NewBuff"] = {
											["IsOrAnd"] = "Or",
											["buffs"] = {
											},
											["NoBuffNameCount"] = 0,
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["Blood"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["NewSpell"] = {
											["Spell"] = {
											},
											["Cd"] = {
												["Start"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
												["End"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
											},
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
											{
												["Arguments"] = {
													{
														["value"] = "unit",
													}, -- [1]
												},
												["checked"] = true,
												["id"] = "GetUnitSpeed",
												["Returns"] = {
													{
														["="] = {
															["Value"] = 0,
															["checked"] = false,
														},
														["<"] = {
															["Value"] = 0,
														},
														["checked"] = true,
														[">"] = {
															["Value"] = 1,
															["checked"] = true,
														},
													}, -- [1]
												},
											}, -- [1]
										},
										["name"] = "1",
										["unit"] = "player",
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = true,
												["Value"] = 35,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = true,
										},
									}, -- [1]
								},
								["Remark"] = "",
								["checked"] = true,
							}, -- [1]
						},
						["unit"] = "Target",
						["Key"] = {
							["lock"] = false,
							["KeySelect"] = "auto",
						},
						["Target"] = "当前目标",
						["itemLink"] = "|cff71d5ff|Hspell:29722|h[烧尽]|h|r",
						["Texture"] = "Interface\\Icons\\Spell_Fire_Burnout",
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
							},
							["End"] = {
							},
						},
						["Type"] = "spell",
						["DelayValue"] = 0,
						["Remarks"] = "-移动施法",
						["Mark"] = "890357-755680",
						["DelayChecked"] = false,
						["checked"] = true,
						["Rank"] = "",
					}, -- [4]
					{
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
								["script"] = "",
								["spell"] = {
								},
								["SetVariables"] = {
								},
								["Chat"] = {
									["text"] = "",
									["channel"] = 1,
									["isRadio"] = "SAY",
								},
							},
							["End"] = {
								["script"] = "",
								["Chat"] = {
									["text"] = "",
									["channel"] = 1,
									["isRadio"] = "SAY",
								},
							},
						},
						["Type"] = "spell",
						["checked"] = true,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 116858,
									["Rank"] = "",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:116858|h[混乱之箭]|h|r",
									["Texture"] = "Interface\\Icons\\Ability_Warlock_ChaosBolt",
								}, -- [1]
							},
						},
						["DelayValue"] = 0,
						["Rank"] = "",
						["Targets"] = {
							{
								["name"] = "触发buff",
								["Key"] = {
									["lock"] = false,
									["KeySelect"] = "auto",
								},
								["Mark"] = "491011-836332",
								["Conditions"] = {
									{
										["FireHasBeenSetValue"] = 2,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["BuffName"] = {
												},
												["NoBuffChecked"] = false,
												["checked"] = false,
											},
										},
										["RangeCheck"] = {
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["lock"] = false,
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "当前目标",
										["unit"] = "target",
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = false,
										["TargetSubgroup"] = -1,
										["Mark"] = "847312-787531",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Blood"] = {
											["checked"] = true,
											[">"] = {
												["checked"] = true,
												["Value"] = 20,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = true,
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
											["IsOrAnd"] = "Or",
											["buffs"] = {
											},
											["NoBuffNameCount"] = 0,
										},
										["NewSpell"] = {
											["Spell"] = {
											},
											["Cd"] = {
												["Start"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
												["End"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
											},
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "未到斩杀",
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
									}, -- [1]
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["ContainChecked"] = false,
											["checked"] = false,
											["TargetChecked"] = false,
											["ExcludedTarget"] = {
												["TargetCount"] = 0,
												["Target"] = {
												},
												["GroupCount"] = 0,
												["Group"] = {
												},
												["checked"] = false,
											},
											["AngleValue"] = 90,
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["HealthPercentageChecked"] = false,
											["Health"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Min_Max"] = {
												["Type"] = "Minimum_Blood_Percentage",
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["ExcludedClass"] = {
												["Class"] = {
												},
												["checked"] = false,
												["ClassCount"] = 0,
											},
											["AngleChecked"] = false,
											["LackHealthChecked"] = false,
											["UnitType"] = "partyraid",
											["NewBuff"] = {
												["checked"] = false,
												["buffs"] = {
												},
											},
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["checked"] = false,
												["BuffName"] = {
												},
												["NoBuffChecked"] = false,
											},
										},
										["RangeCheck"] = {
											["checked"] = false,
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["lock"] = false,
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = true,
										["FireHasBeenSetValue"] = 2,
										["Mark"] = "273303-291675",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Blood"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
											["checked"] = true,
											["IsOrAnd"] = "Or",
											["buffs"] = {
												{
													["IsPlayer"] = "All",
													["SpellId"] = 113858,
													["Class"] = {
													},
													["IsCd"] = "Presence",
													["IsCount"] = false,
													["Cd"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsType"] = "Auto",
													["Count"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsCanceLable"] = "No",
													["IsSpellIdTexture"] = "IsName",
													["IsRaid"] = "No",
												}, -- [1]
												{
													["IsPlayer"] = "All",
													["SpellId"] = 148906,
													["Class"] = {
													},
													["IsCd"] = "Presence",
													["IsSpellIdTexture"] = "IsName",
													["Cd"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsType"] = "Auto",
													["Count"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsCanceLable"] = "No",
													["IsCount"] = false,
													["IsRaid"] = "No",
												}, -- [2]
												{
													["IsPlayer"] = "All",
													["SpellId"] = 146046,
													["Class"] = {
													},
													["IsSpellIdTexture"] = "IsName",
													["Cd"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["Count"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsCanceLable"] = "No",
													["IsType"] = "Auto",
													["IsRaid"] = "No",
												}, -- [3]
												{
													["IsPlayer"] = "All",
													["SpellId"] = 146202,
													["Class"] = {
													},
													["IsSpellIdTexture"] = "IsName",
													["Cd"] = {
														[">"] = {
															["Value"] = 0,
														},
														["<"] = {
															["Value"] = 0,
														},
													},
													["Count"] = {
														[">"] = {
															["Value"] = 0,
														},
														["<"] = {
															["Value"] = 0,
														},
													},
													["IsCanceLable"] = "No",
													["IsType"] = "Auto",
													["IsRaid"] = "No",
												}, -- [4]
											},
											["buffindex"] = 2,
											["NoBuffNameCount"] = 0,
										},
										["NewSpell"] = {
											["Spell"] = {
											},
											["Cd"] = {
												["Start"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
												["End"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
											},
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "buff",
										["unit"] = "player",
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = true,
											[">"] = {
												["checked"] = true,
												["Value"] = 3,
											},
										},
									}, -- [2]
								},
								["Remark"] = "",
								["checked"] = true,
							}, -- [1]
						},
						["unit"] = "Target",
						["spellId"] = 116858,
						["DelayChecked"] = false,
						["Key"] = {
							["lock"] = false,
							["KeySelect"] = "auto",
						},
						["Mark"] = "254576-744714",
						["Target"] = "当前目标",
						["TargetSubgroup"] = -1,
						["itemLink"] = "|cff71d5ff|Hspell:116858|h[混乱之箭]|h|r",
						["Texture"] = "Interface\\Icons\\Ability_Warlock_ChaosBolt",
					}, -- [5]
					{
						["FireHasBeenSetValue"] = 2,
						["spellId"] = 348,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 348,
									["Texture"] = "Interface\\Icons\\Spell_Fire_Immolation",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:348|h[献祭]|h|r",
									["Rank"] = "",
								}, -- [1]
							},
						},
						["Targets"] = {
							{
								["name"] = "1",
								["checked"] = true,
								["Mark"] = "501482-193039",
								["Conditions"] = {
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["Layer"] = {
												["checked"] = false,
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["BuffName"] = {
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["checked"] = false,
											["IsBuff"] = {
												["BuffName"] = {
												},
												["checked"] = false,
												["NoBuffChecked"] = false,
											},
										},
										["RangeCheck"] = {
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["unit"] = "target",
										["Key"] = {
											["KeySelect"] = "auto",
											["lock"] = false,
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "当前目标",
										["Energy"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["and/or"] = false,
										["Cooldown"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = {
											},
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Totem"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = "",
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["wbuff"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["MainChecked"] = false,
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
											["checked"] = true,
											["IsOrAnd"] = "Or",
											["buffs"] = {
												{
													["IsPlayer"] = "PLAYER",
													["SpellId"] = 348,
													["Class"] = {
													},
													["Cd"] = {
														[">"] = {
															["Value"] = 0,
														},
														["<"] = {
															["Value"] = 3.5,
															["Checked"] = true,
														},
													},
													["IsCd"] = "End",
													["IsCount"] = false,
													["Count"] = {
														[">"] = {
															["Value"] = 0,
														},
														["<"] = {
															["Value"] = 0,
														},
													},
													["IsType"] = "HARMFUL",
													["IsCanceLable"] = "No",
													["AdvancedSettings"] = true,
													["IsSpellIdTexture"] = "IsName",
													["IsRaid"] = "No",
												}, -- [1]
											},
											["buffindex"] = 1,
											["NoBuffNameCount"] = 1,
										},
										["NewSpell"] = {
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "剩余时间",
										["Blood"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Mark"] = "689791-412154",
										["FireHasBeenSetValue"] = 2,
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
									}, -- [1]
									{
										["FireHasBeenSetValue"] = 2,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["Layer"] = {
												["checked"] = false,
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["BuffName"] = {
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["checked"] = false,
											["IsBuff"] = {
												["checked"] = false,
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
											},
										},
										["RangeCheck"] = {
											["checked"] = false,
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["lock"] = false,
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "当前目标",
										["Energy"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["and/or"] = false,
										["Cooldown"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = {
											},
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Totem"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = "",
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["wbuff"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["MainChecked"] = false,
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
										},
										["NewSpell"] = {
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "血量>500000",
										["Blood"] = {
											["checked"] = true,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = true,
												["Value"] = 500000,
											},
										},
										["Mark"] = "140161-836839",
										["TargetSubgroup"] = -1,
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["unit"] = "target",
									}, -- [2]
								},
								["Remark"] = "",
								["Key"] = {
									["lock"] = false,
									["KeySelect"] = "auto",
								},
							}, -- [1]
						},
						["unit"] = "target",
						["Key"] = {
							["lock"] = false,
							["KeySelect"] = "auto",
						},
						["Target"] = "当前目标",
						["itemLink"] = "|cff71d5ff|Hspell:348|h[献祭]|h|r",
						["Texture"] = "Interface\\Icons\\Spell_Fire_Immolation",
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
								["SetVariables"] = {
								},
								["spell"] = {
								},
								["script"] = "",
								["Chat"] = {
									["text"] = "",
									["isRadio"] = "SAY",
									["channel"] = 1,
								},
							},
							["End"] = {
								["script"] = "",
								["Chat"] = {
									["text"] = "",
									["isRadio"] = "SAY",
									["channel"] = 1,
								},
							},
						},
						["Type"] = "spell",
						["DelayValue"] = 0.5,
						["Remarks"] = "-目标献祭",
						["and/or"] = true,
						["DelayChecked"] = true,
						["Mark"] = "898421-886717",
						["TargetSubgroup"] = -1,
						["checked"] = true,
						["Rank"] = "",
					}, -- [6]
					{
						["FireHasBeenSetValue"] = 2,
						["checked"] = true,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 348,
									["Rank"] = "",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:348|h[献祭]|h|r",
									["Texture"] = "Interface\\Icons\\Spell_Fire_Immolation",
								}, -- [1]
							},
						},
						["Targets"] = {
							{
								["name"] = "剩余时间",
								["Key"] = {
									["lock"] = false,
									["KeySelect"] = "auto",
								},
								["Mark"] = "720028-522258",
								["Conditions"] = {
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["checked"] = false,
												["BuffName"] = {
												},
												["NoBuffChecked"] = false,
											},
										},
										["RangeCheck"] = {
											["checked"] = false,
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["unit"] = "focus",
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "焦点目标",
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = false,
										["FireHasBeenSetValue"] = 2,
										["Mark"] = "486900-414297",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Blood"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
											["checked"] = true,
											["IsOrAnd"] = "Or",
											["buffs"] = {
												{
													["IsPlayer"] = "All",
													["SpellId"] = 348,
													["Class"] = {
													},
													["IsCd"] = "End",
													["IsCount"] = false,
													["Cd"] = {
														["<"] = {
															["Value"] = 4,
															["Checked"] = true,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["Count"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsSpellIdTexture"] = "IsName",
													["IsCanceLable"] = "No",
													["IsType"] = "Auto",
													["IsRaid"] = "No",
												}, -- [1]
											},
											["buffindex"] = 1,
											["NoBuffNameCount"] = 0,
										},
										["NewSpell"] = {
											["Spell"] = {
											},
											["Cd"] = {
												["Start"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
												["End"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
											},
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "1",
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
									}, -- [1]
								},
								["Remark"] = "",
								["checked"] = true,
							}, -- [1]
							{
								["name"] = "血量>50w",
								["checked"] = true,
								["Mark"] = "450911-297850",
								["Conditions"] = {
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["Layer"] = {
												["checked"] = false,
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["BuffName"] = {
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["checked"] = false,
											["IsBuff"] = {
												["checked"] = false,
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
											},
										},
										["RangeCheck"] = {
											["checked"] = false,
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["unit"] = "focus",
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "焦点目标",
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["and/or"] = false,
										["Cooldown"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = {
											},
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Totem"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = "",
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["wbuff"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["MainChecked"] = false,
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["Blood"] = {
											["checked"] = true,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = true,
												["Value"] = 500000,
											},
										},
										["NewSpell"] = {
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "2",
										["NewBuff"] = {
										},
										["Mark"] = "752077-514458",
										["FireHasBeenSetValue"] = 2,
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
									}, -- [1]
								},
								["Remark"] = "",
								["Key"] = {
									["lock"] = false,
									["KeySelect"] = "auto",
								},
							}, -- [2]
						},
						["unit"] = "focus",
						["Key"] = {
							["KeySelect"] = "auto",
							["lock"] = false,
						},
						["Target"] = "焦点目标",
						["itemLink"] = "|cff71d5ff|Hspell:348|h[献祭]|h|r",
						["Texture"] = "Interface\\Icons\\Spell_Fire_Immolation",
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
								["script"] = "",
								["spell"] = {
								},
								["SetVariables"] = {
								},
								["Chat"] = {
									["text"] = "",
									["channel"] = 1,
									["isRadio"] = "SAY",
								},
							},
							["End"] = {
								["script"] = "",
								["Chat"] = {
									["text"] = "",
									["channel"] = 1,
									["isRadio"] = "SAY",
								},
							},
						},
						["Type"] = "spell",
						["DelayValue"] = 0.5,
						["Remarks"] = "-焦点献祭",
						["and/or"] = false,
						["DelayChecked"] = true,
						["Mark"] = "711635-742178",
						["TargetSubgroup"] = -1,
						["spellId"] = 348,
						["Rank"] = "",
					}, -- [7]
					{
						["TargetSubgroup"] = -1,
						["spellId"] = 348,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 348,
									["Texture"] = "Interface\\Icons\\Spell_Fire_Immolation",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:348|h[献祭]|h|r",
									["Rank"] = "",
								}, -- [1]
							},
						},
						["Targets"] = {
							{
								["name"] = "剩余时间",
								["checked"] = true,
								["Mark"] = "161981-594443",
								["Conditions"] = {
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["Layer"] = {
												["checked"] = false,
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["BuffName"] = {
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["checked"] = false,
											["IsBuff"] = {
												["BuffName"] = {
												},
												["checked"] = false,
												["NoBuffChecked"] = false,
											},
										},
										["RangeCheck"] = {
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["unit"] = "mouseover",
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "鼠标目标",
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["and/or"] = false,
										["Cooldown"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = {
											},
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Totem"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = "",
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["wbuff"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["MainChecked"] = false,
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["Blood"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["NewSpell"] = {
											["Spell"] = {
											},
											["Cd"] = {
												["Start"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
												["End"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
											},
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "1",
										["NewBuff"] = {
											["buffindex"] = 1,
											["IsOrAnd"] = "Or",
											["buffs"] = {
												{
													["IsPlayer"] = "PLAYER",
													["SpellId"] = 348,
													["Class"] = {
													},
													["Count"] = {
														[">"] = {
															["Value"] = 0,
														},
														["<"] = {
															["Value"] = 0,
														},
													},
													["IsCd"] = "End",
													["IsCount"] = false,
													["Cd"] = {
														[">"] = {
															["Value"] = 0,
														},
														["<"] = {
															["Value"] = 4,
															["Checked"] = true,
														},
													},
													["IsType"] = "HARMFUL",
													["AdvancedSettings"] = true,
													["IsCanceLable"] = "No",
													["IsSpellIdTexture"] = "IsName",
													["IsRaid"] = "No",
												}, -- [1]
											},
											["checked"] = true,
											["NoBuffNameCount"] = 1,
										},
										["Mark"] = "358723-140668",
										["FireHasBeenSetValue"] = 2,
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
									}, -- [1]
								},
								["Remark"] = "",
								["Key"] = {
									["lock"] = false,
									["KeySelect"] = "auto",
								},
							}, -- [1]
							{
								["name"] = "血量>50w",
								["Key"] = {
									["KeySelect"] = "auto",
									["lock"] = false,
								},
								["Mark"] = "993770-140041",
								["Conditions"] = {
									{
										["FireHasBeenSetValue"] = 2,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["NoBuffChecked"] = false,
												["checked"] = false,
												["BuffName"] = {
												},
											},
										},
										["RangeCheck"] = {
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "鼠标目标",
										["unit"] = "mouseover",
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = false,
										["TargetSubgroup"] = -1,
										["Mark"] = "831050-960239",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["NewBuff"] = {
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["Blood"] = {
											["checked"] = true,
											[">"] = {
												["checked"] = true,
												["Value"] = 500000,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["NewSpell"] = {
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "2",
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
									}, -- [1]
								},
								["Remark"] = "",
								["checked"] = true,
							}, -- [2]
							{
								["name"] = "按住ALT",
								["Key"] = {
									["KeySelect"] = "auto",
								},
								["Mark"] = "611827-121175",
								["Conditions"] = {
									{
										["FireHasBeenSetValue"] = 2,
										["PlayerRangeCheckAngle"] = {
											["ContainChecked"] = false,
											["checked"] = false,
											["TargetChecked"] = false,
											["ExcludedTarget"] = {
												["TargetCount"] = 0,
												["Group"] = {
												},
												["GroupCount"] = 0,
												["Target"] = {
												},
												["checked"] = false,
											},
											["AngleValue"] = 90,
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["HealthPercentageChecked"] = false,
											["UnitType"] = "partyraid",
											["Min_Max"] = {
												["Type"] = "Minimum_Blood_Percentage",
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Health"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["ExcludedClass"] = {
												["Class"] = {
												},
												["checked"] = false,
												["ClassCount"] = 0,
											},
											["AngleChecked"] = false,
											["LackHealthChecked"] = false,
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["NewBuff"] = {
												["checked"] = false,
												["buffs"] = {
												},
											},
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["BuffName"] = {
												},
												["checked"] = false,
												["NoBuffChecked"] = false,
											},
										},
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "鼠标目标",
										["RangeCheck"] = {
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = false,
										["TargetSubgroup"] = -1,
										["Mark"] = "356074-889793",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Blood"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
										},
										["NewSpell"] = {
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
											{
												["Arguments"] = {
												},
												["checked"] = true,
												["id"] = "IsLeftAltKeyDown",
												["Returns"] = {
													{
														["value"] = true,
														["checked"] = true,
													}, -- [1]
												},
											}, -- [1]
											{
												["id"] = "IsLeftControlKeyDown",
												["Arguments"] = {
												},
												["checked"] = false,
												["Returns"] = {
													{
														["value"] = true,
														["checked"] = true,
													}, -- [1]
												},
											}, -- [2]
										},
										["name"] = "1",
										["unit"] = "mouseover",
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
									}, -- [1]
								},
								["Remark"] = "",
								["checked"] = true,
							}, -- [3]
						},
						["unit"] = "mouseover",
						["Key"] = {
							["KeySelect"] = "auto",
							["lock"] = false,
						},
						["Target"] = "鼠标目标",
						["itemLink"] = "|cff71d5ff|Hspell:348|h[献祭]|h|r",
						["Texture"] = "Interface\\Icons\\Spell_Fire_Immolation",
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
								["SetVariables"] = {
								},
								["spell"] = {
								},
								["script"] = "",
								["Chat"] = {
									["text"] = "",
									["isRadio"] = "SAY",
									["channel"] = 1,
								},
							},
							["End"] = {
								["script"] = "",
								["Chat"] = {
									["text"] = "",
									["isRadio"] = "SAY",
									["channel"] = 1,
								},
							},
						},
						["Type"] = "spell",
						["DelayValue"] = 0.5,
						["Remarks"] = "-鼠标目标献祭",
						["and/or"] = false,
						["checked"] = true,
						["Mark"] = "768166-629999",
						["FireHasBeenSetValue"] = 2,
						["DelayChecked"] = true,
						["Rank"] = "",
					}, -- [8]
					{
						["FireHasBeenSetValue"] = 2,
						["spellId"] = 80240,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 80240,
									["Texture"] = "INTERFACE\\ICONS\\ability_warlock_baneofhavoc",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:80240|h[浩劫]|h|r",
									["Rank"] = "",
								}, -- [1]
							},
						},
						["Targets"] = {
						},
						["unit"] = "focus",
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["Target"] = "焦点目标",
						["itemLink"] = "|cff71d5ff|Hspell:80240|h[浩劫]|h|r",
						["Texture"] = "INTERFACE\\ICONS\\ability_warlock_baneofhavoc",
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
								["script"] = "",
								["spell"] = {
								},
								["SetVariables"] = {
								},
								["Chat"] = {
									["text"] = "",
									["channel"] = 1,
									["isRadio"] = "SAY",
								},
							},
							["End"] = {
								["script"] = "",
								["Chat"] = {
									["text"] = "",
									["channel"] = 1,
									["isRadio"] = "SAY",
								},
							},
						},
						["Type"] = "spell",
						["DelayValue"] = 0,
						["DelayChecked"] = false,
						["Mark"] = "157124-552812",
						["TargetSubgroup"] = -1,
						["checked"] = true,
						["Rank"] = "",
					}, -- [9]
					{
						["TargetSubgroup"] = -1,
						["DelayChecked"] = false,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 116858,
									["Rank"] = "",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:116858|h[混乱之箭]|h|r",
									["Texture"] = "Interface\\Icons\\Ability_Warlock_ChaosBolt",
								}, -- [1]
							},
						},
						["Targets"] = {
							{
								["name"] = "1",
								["Key"] = {
									["lock"] = false,
									["KeySelect"] = "auto",
								},
								["Mark"] = "844698-552016",
								["Conditions"] = {
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["BuffName"] = {
												},
												["checked"] = false,
												["NoBuffChecked"] = false,
											},
										},
										["RangeCheck"] = {
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["unit"] = "focus",
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "焦点目标",
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = false,
										["FireHasBeenSetValue"] = 2,
										["Mark"] = "994528-175453",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["NewBuff"] = {
											["checked"] = true,
											["IsOrAnd"] = "Or",
											["buffs"] = {
												{
													["IsType"] = "Auto",
													["SpellId"] = 80240,
													["Class"] = {
													},
													["IsCd"] = "Presence",
													["IsSpellIdTexture"] = "IsName",
													["Cd"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsPlayer"] = "All",
													["IsCount"] = true,
													["IsCanceLable"] = "No",
													["Count"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 2,
															["Checked"] = true,
														},
													},
													["IsRaid"] = "No",
												}, -- [1]
											},
											["buffindex"] = 1,
											["NoBuffNameCount"] = 0,
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["Blood"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["NewSpell"] = {
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "1",
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
									}, -- [1]
								},
								["Remark"] = "",
								["checked"] = true,
							}, -- [1]
						},
						["unit"] = "Target",
						["Key"] = {
							["KeySelect"] = "auto",
							["lock"] = false,
						},
						["Target"] = "当前目标",
						["itemLink"] = "|cff71d5ff|Hspell:116858|h[混乱之箭]|h|r",
						["Texture"] = "Interface\\Icons\\Ability_Warlock_ChaosBolt",
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
							},
							["End"] = {
							},
						},
						["Type"] = "spell",
						["DelayValue"] = 0,
						["Remarks"] = "-浩劫脑残箭",
						["Mark"] = "699582-801077",
						["spellId"] = 116858,
						["checked"] = true,
						["Rank"] = "",
					}, -- [10]
					{
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
							},
							["End"] = {
							},
						},
						["Type"] = "spell",
						["checked"] = true,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 17962,
									["Texture"] = "Interface\\Icons\\Spell_Fire_Fireball",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:17962|h[燃烧]|h|r",
									["Rank"] = "",
								}, -- [1]
							},
						},
						["DelayValue"] = 0,
						["Texture"] = "Interface\\Icons\\Spell_Fire_Fireball",
						["Targets"] = {
						},
						["unit"] = "Target",
						["spellId"] = 17962,
						["TargetSubgroup"] = -1,
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["Target"] = "当前目标",
						["Mark"] = "637589-197273",
						["DelayChecked"] = false,
						["itemLink"] = "|cff71d5ff|Hspell:17962|h[燃烧]|h|r",
						["Rank"] = "",
					}, -- [11]
					{
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
							},
							["End"] = {
							},
						},
						["Type"] = "spell",
						["checked"] = true,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 29722,
									["Texture"] = "Interface\\Icons\\Spell_Fire_Burnout",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:29722|h[烧尽]|h|r",
									["Rank"] = "",
								}, -- [1]
							},
						},
						["DelayValue"] = 0,
						["Texture"] = "Interface\\Icons\\Spell_Fire_Burnout",
						["Targets"] = {
						},
						["unit"] = "Target",
						["spellId"] = 29722,
						["TargetSubgroup"] = -1,
						["Key"] = {
							["KeySelect"] = "auto",
							["lock"] = false,
						},
						["Target"] = "当前目标",
						["Mark"] = "800381-677391",
						["DelayChecked"] = false,
						["itemLink"] = "|cff71d5ff|Hspell:29722|h[烧尽]|h|r",
						["Rank"] = "",
					}, -- [12]
				},
				["checked"] = true,
				["ApiDbf"] = {
				},
				["Key"] = {
					["KeySelect"] = "auto",
					["lock"] = false,
				},
				["name"] = "单体",
				["Remarks"] = "",
				["ExcludeTarget"] = {
				},
				["Mark"] = "404108-680033",
				["WaitSpellCastComplete"] = false,
			}, -- [8]
			{
				["ExcludeTarget"] = {
				},
				["spell"] = {
					{
						["TargetSubgroup"] = -1,
						["spellId"] = 0,
						["ApiDbf"] = {
							{
								["id"] = "stEndProgram",
								["Arguments"] = {
								},
								["Returns"] = {
									{
										["value"] = true,
										["checked"] = true,
									}, -- [1]
								},
							}, -- [1]
						},
						["Targets"] = {
							{
								["name"] = "未进入战斗",
								["Key"] = {
									["KeySelect"] = "auto",
								},
								["Mark"] = "501983-971162",
								["Conditions"] = {
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["BuffName"] = {
												},
												["checked"] = false,
												["NoBuffChecked"] = false,
											},
										},
										["RangeCheck"] = {
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["unit"] = "player",
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = false,
										["FireHasBeenSetValue"] = 2,
										["Mark"] = "147190-514133",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["NewBuff"] = {
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["Blood"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["NewSpell"] = {
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
											{
												["Arguments"] = {
													{
														["value"] = "unit",
													}, -- [1]
												},
												["checked"] = true,
												["id"] = "UnitAffectingCombat",
												["Returns"] = {
													{
														["value"] = false,
														["checked"] = true,
													}, -- [1]
												},
											}, -- [1]
										},
										["name"] = "3",
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
									}, -- [1]
								},
								["Remark"] = "",
								["checked"] = true,
							}, -- [1]
							{
								["name"] = "复数",
								["checked"] = true,
								["Mark"] = "993767-769489",
								["Conditions"] = {
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["checked"] = false,
										},
										["checked"] = true,
										["Buff"] = {
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["Layer"] = {
												["checked"] = false,
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["BuffName"] = {
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["checked"] = false,
											["IsBuff"] = {
												["BuffName"] = {
												},
												["NoBuffChecked"] = false,
												["checked"] = false,
											},
										},
										["RangeCheck"] = {
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["unit"] = "target",
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "当前目标",
										["Energy"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["and/or"] = false,
										["Cooldown"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = {
											},
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Totem"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = "",
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["wbuff"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["MainChecked"] = false,
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
										},
										["NewSpell"] = {
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
											{
												["Arguments"] = {
													{
														["value"] = "unit",
													}, -- [1]
													{
														["value"] = 8,
													}, -- [2]
												},
												["checked"] = true,
												["id"] = "FHGetRangeEnemyCount",
												["Returns"] = {
													{
														["="] = {
															["Value"] = 0,
															["checked"] = false,
														},
														["<"] = {
															["Value"] = 2,
															["checked"] = true,
														},
														["checked"] = true,
														[">"] = {
															["Value"] = 3,
															["checked"] = false,
														},
													}, -- [1]
												},
											}, -- [1]
										},
										["name"] = "1",
										["Blood"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Mark"] = "123948-942400",
										["FireHasBeenSetValue"] = 2,
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
									}, -- [1]
								},
								["Remark"] = "",
								["Key"] = {
									["lock"] = false,
									["KeySelect"] = "auto",
								},
							}, -- [2]
						},
						["unit"] = "nogoal",
						["Key"] = {
							["KeySelect"] = "auto",
							["lock"] = false,
						},
						["Remarks"] = "",
						["itemLink"] = "|cffff0000结束当前施法方案",
						["Texture"] = "",
						["and/or"] = true,
						["Type"] = "Run",
						["subgroup"] = -4,
						["raidn"] = -4,
						["DelayValue"] = 0,
						["name"] = "",
						["CastingSpell"] = {
						},
						["Mark"] = "550451-196386",
						["checked"] = true,
						["Target"] = "无目标",
						["DelayChecked"] = false,
					}, -- [1]
					{
						["TargetSubgroup"] = -1,
						["checked"] = true,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 17877,
									["Texture"] = "Interface\\Icons\\Spell_Shadow_ScourgeBuild",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:17877|h[暗影灼烧]|h|r",
									["Rank"] = "",
								}, -- [1]
							},
						},
						["Targets"] = {
						},
						["unit"] = "Target",
						["Key"] = {
							["lock"] = false,
							["KeySelect"] = "auto",
						},
						["Target"] = "当前目标",
						["itemLink"] = "|cff71d5ff|Hspell:17877|h[暗影灼烧]|h|r",
						["Texture"] = "Interface\\Icons\\Spell_Shadow_ScourgeBuild",
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
							},
							["End"] = {
							},
						},
						["Type"] = "spell",
						["DelayValue"] = 0,
						["spellId"] = 17877,
						["Mark"] = "499744-841577",
						["StopCastingChecked"] = true,
						["DelayChecked"] = false,
						["Rank"] = "",
					}, -- [2]
					{
						["FireHasBeenSetValue"] = 2,
						["checked"] = true,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 108683,
									["Rank"] = "",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:108683|h[硫磺烈火]|h|r",
									["Texture"] = "Interface\\Icons\\Ability_Warlock_FireandBrimstone",
								}, -- [1]
							},
						},
						["Targets"] = {
							{
								["name"] = "无debuff",
								["checked"] = true,
								["Mark"] = "523528-425775",
								["Conditions"] = {
									{
										["FireHasBeenSetValue"] = 2,
										["PlayerRangeCheckAngle"] = {
											["ContainChecked"] = false,
											["checked"] = false,
											["NewBuff"] = {
												["checked"] = false,
												["buffs"] = {
												},
											},
											["ExcludedTarget"] = {
												["TargetCount"] = 0,
												["Target"] = {
												},
												["GroupCount"] = 0,
												["checked"] = false,
												["Group"] = {
												},
											},
											["AngleValue"] = 90,
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["HealthPercentageChecked"] = false,
											["UnitType"] = "partyraid",
											["TargetChecked"] = false,
											["Health"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["ExcludedClass"] = {
												["Class"] = {
												},
												["checked"] = false,
												["ClassCount"] = 0,
											},
											["AngleChecked"] = false,
											["LackHealthChecked"] = false,
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Min_Max"] = {
												["Type"] = "Minimum_Blood_Percentage",
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["checked"] = true,
										["Buff"] = {
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["Layer"] = {
												["checked"] = false,
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["BuffName"] = {
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["checked"] = false,
											["IsBuff"] = {
												["BuffName"] = {
												},
												["checked"] = false,
												["NoBuffChecked"] = false,
											},
										},
										["RangeCheck"] = {
											["Range"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["checked"] = false,
											["Count"] = {
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["Energy"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["and/or"] = false,
										["Cooldown"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = {
											},
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Totem"] = {
											["checked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["name"] = "",
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["wbuff"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["MainChecked"] = false,
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
											["buffindex"] = 1,
											["IsOrAnd"] = "Or",
											["buffs"] = {
												{
													["IsPlayer"] = "All",
													["SpellId"] = 108683,
													["Class"] = {
													},
													["IsCd"] = "NotPresence",
													["IsSpellIdTexture"] = "IsName",
													["Cd"] = {
														[">"] = {
															["Value"] = 0,
														},
														["<"] = {
															["Value"] = 0,
														},
													},
													["Count"] = {
														[">"] = {
															["Value"] = 0,
														},
														["<"] = {
															["Value"] = 0,
														},
													},
													["IsType"] = "Auto",
													["IsCanceLable"] = "No",
													["IsCount"] = false,
													["IsRaid"] = "No",
												}, -- [1]
											},
											["checked"] = true,
											["NoBuffNameCount"] = 0,
										},
										["NewSpell"] = {
											["Spell"] = {
											},
											["Cd"] = {
												["Start"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
												["End"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
											},
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
											{
												["Arguments"] = {
													{
														["value"] = "unit",
													}, -- [1]
												},
												["checked"] = true,
												["id"] = "UnitAffectingCombat",
												["Returns"] = {
													{
														["value"] = true,
														["checked"] = true,
													}, -- [1]
												},
											}, -- [1]
										},
										["name"] = "1",
										["Blood"] = {
											["checked"] = false,
											["Percentage"] = false,
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Mark"] = "887038-808699",
										["TargetSubgroup"] = -1,
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["unit"] = "player",
									}, -- [1]
								},
								["Remark"] = "",
								["Key"] = {
									["lock"] = false,
									["KeySelect"] = "auto",
								},
							}, -- [1]
						},
						["unit"] = "nogoal",
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["Target"] = "无目标",
						["itemLink"] = "|cff71d5ff|Hspell:108683|h[硫磺烈火]|h|r",
						["Texture"] = "Interface\\Icons\\Ability_Warlock_FireandBrimstone",
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
								["SetVariables"] = {
								},
								["spell"] = {
								},
								["script"] = "",
								["Chat"] = {
									["text"] = "",
									["isRadio"] = "SAY",
									["channel"] = 1,
								},
							},
							["End"] = {
								["script"] = "",
								["Chat"] = {
									["text"] = "",
									["isRadio"] = "SAY",
									["channel"] = 1,
								},
							},
						},
						["Type"] = "spell",
						["DelayValue"] = 0,
						["DelayChecked"] = false,
						["Mark"] = "916048-282387",
						["spellId"] = 108683,
						["TargetSubgroup"] = -1,
						["Rank"] = "",
					}, -- [3]
					{
						["TargetSubgroup"] = -1,
						["Type"] = "spell",
						["checked"] = true,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 108686,
									["Rank"] = "",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:108686|h[献祭]|h|r",
									["Texture"] = "Interface\\Icons\\Ability_Mage_WorldInFlames",
								}, -- [1]
							},
						},
						["DelayValue"] = 0.5,
						["Rank"] = "",
						["Targets"] = {
							{
								["name"] = "1",
								["Key"] = {
									["KeySelect"] = "auto",
								},
								["Mark"] = "793864-184885",
								["Conditions"] = {
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["ContainChecked"] = false,
											["checked"] = false,
											["TargetChecked"] = false,
											["ExcludedTarget"] = {
												["checked"] = false,
												["Target"] = {
												},
												["GroupCount"] = 0,
												["Group"] = {
												},
												["TargetCount"] = 0,
											},
											["AngleValue"] = 90,
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["HealthPercentageChecked"] = false,
											["UnitType"] = "partyraid",
											["Min_Max"] = {
												["Type"] = "Minimum_Blood_Percentage",
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Health"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["ExcludedClass"] = {
												["Class"] = {
												},
												["checked"] = false,
												["ClassCount"] = 0,
											},
											["AngleChecked"] = false,
											["LackHealthChecked"] = false,
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["NewBuff"] = {
												["checked"] = false,
												["buffs"] = {
												},
											},
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["checked"] = false,
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
											},
										},
										["RangeCheck"] = {
											["checked"] = false,
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "当前目标",
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = false,
										["FireHasBeenSetValue"] = 2,
										["Mark"] = "606096-182435",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Blood"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
											["buffindex"] = 1,
											["IsOrAnd"] = "Or",
											["buffs"] = {
												{
													["IsPlayer"] = "All",
													["SpellId"] = 108686,
													["Class"] = {
													},
													["IsCd"] = "End",
													["IsSpellIdTexture"] = "IsName",
													["Cd"] = {
														["<"] = {
															["Value"] = 5,
															["Checked"] = true,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsType"] = "Auto",
													["Count"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsCanceLable"] = "No",
													["IsCount"] = false,
													["IsRaid"] = "No",
												}, -- [1]
											},
											["checked"] = true,
											["NoBuffNameCount"] = 0,
										},
										["NewSpell"] = {
											["Spell"] = {
											},
											["Cd"] = {
												["Start"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
												["End"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
											},
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "1",
										["unit"] = "target",
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
									}, -- [1]
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["ContainChecked"] = false,
											["checked"] = false,
											["TargetChecked"] = false,
											["ExcludedTarget"] = {
												["checked"] = false,
												["Target"] = {
												},
												["GroupCount"] = 0,
												["Group"] = {
												},
												["TargetCount"] = 0,
											},
											["AngleValue"] = 90,
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["HealthPercentageChecked"] = false,
											["UnitType"] = "partyraid",
											["Min_Max"] = {
												["Type"] = "Minimum_Blood_Percentage",
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Health"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["ExcludedClass"] = {
												["Class"] = {
												},
												["checked"] = false,
												["ClassCount"] = 0,
											},
											["AngleChecked"] = false,
											["LackHealthChecked"] = false,
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["NewBuff"] = {
												["checked"] = false,
												["buffs"] = {
												},
											},
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["checked"] = false,
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
											},
										},
										["RangeCheck"] = {
											["checked"] = false,
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = false,
										["FireHasBeenSetValue"] = 2,
										["Mark"] = "785502-697633",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Blood"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
											["buffindex"] = 1,
											["IsOrAnd"] = "Or",
											["buffs"] = {
												{
													["IsPlayer"] = "All",
													["SpellId"] = 108683,
													["Class"] = {
													},
													["IsCd"] = "Presence",
													["IsSpellIdTexture"] = "IsName",
													["Cd"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsType"] = "Auto",
													["Count"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsCanceLable"] = "No",
													["IsCount"] = false,
													["IsRaid"] = "No",
												}, -- [1]
											},
											["checked"] = true,
											["NoBuffNameCount"] = 0,
										},
										["NewSpell"] = {
											["Spell"] = {
											},
											["Cd"] = {
												["Start"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
												["End"] = {
													["Value"] = 0,
													["Checked"] = false,
												},
											},
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "2",
										["unit"] = "player",
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
									}, -- [2]
								},
								["Remark"] = "",
								["checked"] = true,
							}, -- [1]
						},
						["unit"] = "Target",
						["spellId"] = 108686,
						["DelayChecked"] = true,
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["Mark"] = "125214-960205",
						["Target"] = "当前目标",
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
								["script"] = "",
								["spell"] = {
								},
								["SetVariables"] = {
								},
								["Chat"] = {
									["text"] = "",
									["channel"] = 1,
									["isRadio"] = "SAY",
								},
							},
							["End"] = {
								["script"] = "",
								["Chat"] = {
									["text"] = "",
									["channel"] = 1,
									["isRadio"] = "SAY",
								},
							},
						},
						["itemLink"] = "|cff71d5ff|Hspell:108686|h[献祭]|h|r",
						["Texture"] = "Interface\\Icons\\Ability_Mage_WorldInFlames",
					}, -- [4]
					{
						["TargetSubgroup"] = -1,
						["Type"] = "spell",
						["checked"] = true,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 17962,
									["Rank"] = "",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:17962|h[燃烧]|h|r",
									["Texture"] = "Interface\\Icons\\Spell_Fire_Fireball",
								}, -- [1]
							},
						},
						["DelayValue"] = 0,
						["Rank"] = "",
						["Targets"] = {
							{
								["name"] = "1",
								["Key"] = {
									["KeySelect"] = "auto",
								},
								["Mark"] = "634645-302939",
								["Conditions"] = {
									{
										["TargetSubgroup"] = -1,
										["PlayerRangeCheckAngle"] = {
											["ContainChecked"] = false,
											["checked"] = false,
											["TargetChecked"] = false,
											["ExcludedTarget"] = {
												["checked"] = false,
												["Target"] = {
												},
												["GroupCount"] = 0,
												["Group"] = {
												},
												["TargetCount"] = 0,
											},
											["AngleValue"] = 90,
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["HealthPercentageChecked"] = false,
											["UnitType"] = "partyraid",
											["Min_Max"] = {
												["Type"] = "Minimum_Blood_Percentage",
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Health"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["ExcludedClass"] = {
												["Class"] = {
												},
												["checked"] = false,
												["ClassCount"] = 0,
											},
											["AngleChecked"] = false,
											["LackHealthChecked"] = false,
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["NewBuff"] = {
												["checked"] = false,
												["buffs"] = {
												},
											},
										},
										["checked"] = true,
										["Buff"] = {
											["checked"] = false,
											["Layer"] = {
												["BuffName"] = {
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = false,
												},
												["checked"] = false,
												[">"] = {
													["Value"] = 0,
													["checked"] = false,
												},
											},
											["Time"] = {
												["Start"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["Remaining"] = {
													["checked"] = false,
													["Value"] = 0,
												},
												["checked"] = true,
												["BuffName"] = {
												},
											},
											["IsBuff"] = {
												["checked"] = false,
												["NoBuffChecked"] = false,
												["BuffName"] = {
												},
											},
										},
										["RangeCheck"] = {
											["checked"] = false,
											["Count"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
											["Range"] = {
												[">"] = {
													["Value"] = 0,
													["checked"] = true,
												},
												["<"] = {
													["Value"] = 0,
													["checked"] = true,
												},
											},
										},
										["Class"] = {
											["checked"] = false,
											["Excluded"] = {
											},
										},
										["FuncBoolean"] = {
											["FuncTexe"] = "",
											["checked"] = false,
										},
										["Key"] = {
											["KeySelect"] = "auto",
										},
										["IsTarget"] = {
											["IsTargetTargetToPlayer"] = {
												["checked"] = false,
											},
											["checked"] = false,
											["IsTarget"] = {
												["Contains"] = false,
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsDefaultTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsCustomizeTargetToPlayer"] = {
												["checked"] = false,
												["Targets"] = {
												},
											},
											["IsMouseoverTargetToPlayer"] = {
												["checked"] = false,
											},
											["IsFocusTargetToPlayer"] = {
												["checked"] = false,
											},
										},
										["Target"] = "自己",
										["wbuff"] = {
											["MainChecked"] = false,
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["ComboPoints"] = {
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["CastSpell"] = {
											["Remaining"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											["AllInterruptChecked"] = false,
											["Start"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["InterruptChecked"] = false,
											["Spells"] = {
											},
										},
										["and/or"] = false,
										["FireHasBeenSetValue"] = 2,
										["Mark"] = "394702-392264",
										["Totem"] = {
											["name"] = "",
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Blood"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["Distance"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
										["Remark"] = "",
										["NewBuff"] = {
											["buffindex"] = 1,
											["IsOrAnd"] = "Or",
											["buffs"] = {
												{
													["IsPlayer"] = "All",
													["SpellId"] = 108683,
													["Class"] = {
													},
													["IsCd"] = "NotPresence",
													["IsSpellIdTexture"] = "IsName",
													["Cd"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsType"] = "Auto",
													["Count"] = {
														["<"] = {
															["Value"] = 0,
														},
														[">"] = {
															["Value"] = 0,
														},
													},
													["IsCanceLable"] = "No",
													["IsCount"] = false,
													["IsRaid"] = "No",
												}, -- [1]
											},
											["checked"] = true,
											["NoBuffNameCount"] = 0,
										},
										["NewSpell"] = {
											["NotInterrupt"] = "All",
										},
										["ApiDbf"] = {
										},
										["name"] = "1",
										["unit"] = "player",
										["Rune"] = {
											["RuneCount"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
											["checked"] = false,
											["RuneCooldown"] = {
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [1]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [2]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [3]
												{
													["="] = {
														["Value"] = 0,
														["checked"] = false,
													},
													["<"] = {
														["Value"] = 0,
														["checked"] = false,
													},
													[">"] = {
														["Value"] = 0,
														["checked"] = false,
													},
												}, -- [4]
												["checked"] = false,
											},
										},
										["Cooldown"] = {
											["name"] = {
											},
											["<"] = {
												["Value"] = 0,
												["checked"] = false,
											},
											["checked"] = false,
											[">"] = {
												["Value"] = 0,
												["checked"] = false,
											},
										},
										["Energy"] = {
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Lack"] = false,
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["Percentage"] = false,
										},
										["SpecialEnergy"] = {
											["<"] = {
												["checked"] = false,
												["Value"] = 0,
											},
											["checked"] = false,
											[">"] = {
												["checked"] = false,
												["Value"] = 0,
											},
										},
									}, -- [1]
								},
								["Remark"] = "",
								["checked"] = true,
							}, -- [1]
						},
						["unit"] = "Target",
						["spellId"] = 17962,
						["DelayChecked"] = false,
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["Mark"] = "820069-542633",
						["Target"] = "当前目标",
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
								["script"] = "",
								["spell"] = {
								},
								["SetVariables"] = {
								},
								["Chat"] = {
									["text"] = "",
									["channel"] = 1,
									["isRadio"] = "SAY",
								},
							},
							["End"] = {
								["script"] = "",
								["Chat"] = {
									["text"] = "",
									["channel"] = 1,
									["isRadio"] = "SAY",
								},
							},
						},
						["itemLink"] = "|cff71d5ff|Hspell:17962|h[燃烧]|h|r",
						["Texture"] = "Interface\\Icons\\spell_fire_ragnaros_molteninferno",
					}, -- [5]
					{
						["TargetSubgroup"] = -1,
						["Type"] = "spell",
						["checked"] = true,
						["CastingSpell"] = {
							["spell"] = {
								{
									["Type"] = "spell",
									["spellId"] = 29722,
									["Texture"] = "Interface\\Icons\\Spell_Fire_Burnout",
									["disabled"] = true,
									["itemLink"] = "|cff71d5ff|Hspell:29722|h[烧尽]|h|r",
									["Rank"] = "",
								}, -- [1]
							},
						},
						["DelayValue"] = 0,
						["Texture"] = "Interface\\Icons\\Spell_Fire_Burnout",
						["Targets"] = {
						},
						["unit"] = "Target",
						["spellId"] = 29722,
						["CastingSpellStartOrEnd"] = {
							["Start"] = {
							},
							["End"] = {
							},
						},
						["Key"] = {
							["KeySelect"] = "auto",
							["lock"] = false,
						},
						["Target"] = "当前目标",
						["Mark"] = "199270-238505",
						["DelayChecked"] = false,
						["itemLink"] = "|cff71d5ff|Hspell:29722|h[烧尽]|h|r",
						["Rank"] = "",
					}, -- [6]
				},
				["checked"] = true,
				["ApiDbf"] = {
				},
				["Key"] = {
					["KeySelect"] = "auto",
				},
				["Remarks"] = "",
				["Mark"] = "513709-362336",
				["ExcludedGroup"] = {
				},
				["name"] = "AOE",
			}, -- [9]
			{
				["ExcludeTarget"] = {
				},
				["spell"] = {
					{
						["TargetSubgroup"] = -1,
						["DelayChecked"] = false,
						["ApiDbf"] = {
							{
								["id"] = "amattack",
								["Arguments"] = {
									{
										["value"] = 0,
									}, -- [1]
									{
										["value"] = 0,
									}, -- [2]
								},
								["Returns"] = {
									{
										["value"] = true,
										["checked"] = true,
									}, -- [1]
								},
							}, -- [1]
						},
						["Targets"] = {
						},
						["unit"] = "nogoal",
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["Remarks"] = "",
						["itemLink"] = "|cffff00ff攻击最近的目标/停止攻击",
						["Texture"] = "",
						["Type"] = "Run",
						["subgroup"] = -4,
						["raidn"] = -4,
						["DelayValue"] = 0,
						["name"] = "",
						["spellId"] = 0,
						["Mark"] = "998902-287549",
						["Target"] = "无目标",
						["checked"] = true,
						["CastingSpell"] = {
						},
					}, -- [1]
				},
				["checked"] = true,
				["ApiDbf"] = {
				},
				["Key"] = {
					["KeySelect"] = "auto",
				},
				["Mark"] = "100097-861754",
				["ExcludedGroup"] = {
				},
				["Remarks"] = "",
				["name"] = "攻击",
			}, -- [10]
			{
				["ExcludeTarget"] = {
				},
				["spell"] = {
					{
						["TargetSubgroup"] = -1,
						["DelayChecked"] = false,
						["ApiDbf"] = {
							{
								["id"] = "FHOvale",
								["Arguments"] = {
									{
										["value"] = 4,
									}, -- [1]
									{
										["value"] = 0,
									}, -- [2]
								},
								["checked"] = true,
								["Returns"] = {
									{
										["value"] = true,
										["checked"] = true,
									}, -- [1]
								},
							}, -- [1]
						},
						["Targets"] = {
						},
						["unit"] = "nogoal",
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["Remarks"] = "",
						["itemLink"] = "|cff2DF562(FH)Ovale全职业输出助手",
						["Texture"] = "",
						["Type"] = "Run",
						["subgroup"] = -4,
						["raidn"] = -4,
						["DelayValue"] = 0,
						["name"] = "",
						["CastingSpell"] = {
						},
						["Mark"] = "986808-526399",
						["checked"] = false,
						["Target"] = "无目标",
						["spellId"] = 0,
					}, -- [1]
					{
						["TargetSubgroup"] = -1,
						["DelayChecked"] = false,
						["ApiDbf"] = {
							{
								["id"] = "FHOvale",
								["Arguments"] = {
									{
										["value"] = 1,
									}, -- [1]
									{
										["value"] = 0,
									}, -- [2]
								},
								["checked"] = true,
								["Returns"] = {
									{
										["value"] = true,
										["checked"] = true,
									}, -- [1]
								},
							}, -- [1]
						},
						["Targets"] = {
						},
						["unit"] = "nogoal",
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["Remarks"] = "",
						["itemLink"] = "|cff2DF562(FH)Ovale全职业输出助手",
						["Texture"] = "",
						["Type"] = "Run",
						["subgroup"] = -4,
						["raidn"] = -4,
						["DelayValue"] = 0,
						["name"] = "",
						["CastingSpell"] = {
						},
						["Mark"] = "734482-773051",
						["checked"] = false,
						["Target"] = "无目标",
						["spellId"] = 0,
					}, -- [2]
					{
						["TargetSubgroup"] = -1,
						["DelayChecked"] = false,
						["ApiDbf"] = {
							{
								["id"] = "FHOvale",
								["Arguments"] = {
									{
										["value"] = 3,
									}, -- [1]
									{
										["value"] = 0,
									}, -- [2]
								},
								["checked"] = true,
								["Returns"] = {
									{
										["value"] = true,
										["checked"] = true,
									}, -- [1]
								},
							}, -- [1]
						},
						["Targets"] = {
						},
						["unit"] = "nogoal",
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["Remarks"] = "",
						["itemLink"] = "|cff2DF562(FH)Ovale全职业输出助手",
						["Texture"] = "",
						["Type"] = "Run",
						["subgroup"] = -4,
						["raidn"] = -4,
						["DelayValue"] = 0,
						["name"] = "",
						["CastingSpell"] = {
						},
						["Mark"] = "385852-987820",
						["checked"] = false,
						["Target"] = "无目标",
						["spellId"] = 0,
					}, -- [3]
					{
						["TargetSubgroup"] = -1,
						["DelayChecked"] = false,
						["ApiDbf"] = {
							{
								["id"] = "FHOvale",
								["Arguments"] = {
									{
									}, -- [1]
									{
									}, -- [2]
								},
								["Returns"] = {
									{
										["value"] = true,
										["checked"] = true,
									}, -- [1]
								},
							}, -- [1]
						},
						["Targets"] = {
						},
						["unit"] = "nogoal",
						["Key"] = {
							["KeySelect"] = "auto",
						},
						["Remarks"] = "",
						["itemLink"] = "|cff2DF562(FH)Ovale全职业输出助手",
						["Texture"] = "",
						["Type"] = "Run",
						["subgroup"] = -4,
						["raidn"] = -4,
						["DelayValue"] = 0,
						["name"] = "",
						["Mark"] = "217716-964960",
						["checked"] = false,
						["Target"] = "无目标",
						["spellId"] = 0,
					}, -- [4]
				},
				["checked"] = false,
				["ApiDbf"] = {
				},
				["Key"] = {
					["KeySelect"] = "auto",
				},
				["Mark"] = "829780-294562",
				["name"] = "FHovale",
				["Remarks"] = "",
				["ExcludedGroup"] = {
				},
			}, -- [11]
		},
		["NoStopCastingSpells"] = {
		},
	},
	["Remark"] = "",
	["Unit"] = {
		["ExcludeTarget"] = {
		},
		["RaidListClass"] = {
			["圣骑士"] = {
				["Count"] = 3,
				["englishClass"] = "PALADIN",
			},
			["潜行者"] = {
				["Count"] = 1,
				["englishClass"] = "ROGUE",
			},
			["术士"] = {
				["Count"] = 5,
				["englishClass"] = "WARLOCK",
			},
			["德鲁伊"] = {
				["Count"] = 1,
				["englishClass"] = "DRUID",
			},
			["萨满祭司"] = {
				["Count"] = 2,
				["englishClass"] = "SHAMAN",
			},
			["法师"] = {
				["Count"] = 3,
				["englishClass"] = "MAGE",
			},
			["战士"] = {
				["Count"] = 2,
				["englishClass"] = "WARRIOR",
			},
			["死亡骑士"] = {
				["Count"] = 2,
				["englishClass"] = "DEATHKNIGHT",
			},
			["猎人"] = {
				["Count"] = 3,
				["englishClass"] = "HUNTER",
			},
			["牧师"] = {
				["Count"] = 2,
				["englishClass"] = "PRIEST",
			},
		},
		["IsInfList"] = {
		},
		["TeamNumber"] = 2,
		["CustomizeIndex"] = 1,
		["MTList"] = {
			["TypeChecked"] = 1,
			["Custom"] = {
				"MT1", -- [1]
				"MT2", -- [2]
				"MT3", -- [3]
				"MT4", -- [4]
				"MT5", -- [5]
				"MT6", -- [6]
				"MT7", -- [7]
				"MT8", -- [8]
			},
			["Default"] = {
				"放开那个叔叔-德拉诺", -- [1]
				"夏花黎-伊萨里奥斯", -- [2]
			},
		},
		["TeamCount"] = {
			4, -- [1]
			5, -- [2]
			5, -- [3]
			5, -- [4]
			5, -- [5]
		},
		["RaidList"] = {
			["boss1"] = {
				["name"] = "Boss1",
				["raidn"] = -21,
				["subgroup"] = -1,
				["class"] = "",
				["englishClass"] = "",
				["unit"] = "boss1",
			},
			["maintank2"] = {
				["unit"] = "maintank2",
				["name"] = "MT2",
				["raidn"] = -11,
				["englishClass"] = "",
				["class"] = "",
				["subgroup"] = -1,
				["cuid"] = 12,
			},
			["|cffCD96CDBUFF"] = {
				["ScriptName"] = "",
				["subgroup"] = -2,
				["raidn"] = -101,
				["englishClass"] = "",
				["unit"] = "",
				["function"] = "",
				["runindex"] = 32491,
				["Script"] = "",
				["class"] = "",
				["Remarks"] = "",
				["ScriptNameText"] = "",
				["AmminimumFast"] = {
					["Minimum"] = {
						["MinimumLayerBuff"] = 0,
						["MinimumEnergyPercentageValue"] = 50,
						["MinimumEnergyValue"] = 500000,
						["LayerBuffName"] = "",
						["MinimumDistanceValue"] = 25,
						["MinimumBloodPercentageValue"] = 50,
						["MinimumBloodValue"] = 500000,
						["LayerBuffIcon"] = "",
					},
					["NewNobuff"] = {
						["IsOrAnd"] = "Or",
						["IsNobuff"] = true,
						["buffs"] = {
						},
						["NoBuffNameCount"] = 0,
					},
					["GhostChecked"] = true,
					["buff"] = {
					},
					["SpellDistanceChecked"] = true,
					["buffchecked"] = true,
					["Distancevalue"] = 30,
					["NewBuff"] = {
						["IsOrAnd"] = "Or",
						["buffs"] = {
							{
								["IsPlayer"] = "All",
								["SpellId"] = 109773,
								["Class"] = {
								},
								["IsCd"] = "NotPresence",
								["IsSpellIdTexture"] = "IsName",
								["Cd"] = {
									["<"] = {
										["Value"] = 0,
									},
									[">"] = {
										["Value"] = 0,
									},
								},
								["Count"] = {
									["<"] = {
										["Value"] = 0,
									},
									[">"] = {
										["Value"] = 0,
									},
								},
								["IsCount"] = false,
								["IsCanceLable"] = "No",
								["IsType"] = "Auto",
								["IsRaid"] = "No",
							}, -- [1]
						},
						["NoBuffNameCount"] = 0,
					},
					["NewSpell"] = {
						["Spell"] = {
						},
						["Cd"] = {
							["Start"] = {
								["Value"] = 0,
								["Checked"] = false,
							},
							["End"] = {
								["Value"] = 0,
								["Checked"] = false,
							},
						},
						["NotInterrupt"] = "All",
					},
					["Class"] = {
					},
					["Count"] = {
						[">"] = {
							["Value"] = 0,
						},
						["<"] = {
							["Value"] = 0,
						},
					},
					["ApiDbf"] = {
					},
					["group"] = "partyraid",
					["ExcludedTarget"] = {
					},
					["Maximum"] = {
						["MaximumBloodValue"] = 500000,
						["MaximumEnergyValue"] = 500000,
						["MaximumBloodPercentageValue"] = 50,
						["MaximumEnergyPercentageValue"] = 50,
						["MaximumLayerBuff"] = 0,
					},
					["MultitaskingTime"] = 50,
				},
				["types"] = "AmminimumFast",
			},
			["求佛-扎拉赞恩"] = {
				["subgroup"] = 4,
				["name"] = "求佛-扎拉赞恩",
				["raidn"] = 18,
				["class"] = "死亡骑士",
				["englishClass"] = "DEATHKNIGHT",
				["unitid"] = "raid18",
				["unit"] = "求佛-扎拉赞恩",
			},
			["boss4target"] = {
				["name"] = "Boss4的目标",
				["raidn"] = -28,
				["subgroup"] = -1,
				["class"] = "",
				["englishClass"] = "",
				["unit"] = "boss4target",
			},
			["target"] = {
				["name"] = "当前目标",
				["raidn"] = -7,
				["subgroup"] = -1,
				["class"] = "",
				["englishClass"] = "",
				["unit"] = "target",
			},
			["maintank7"] = {
				["unit"] = "maintank7",
				["name"] = "MT7",
				["raidn"] = -16,
				["englishClass"] = "",
				["class"] = "",
				["subgroup"] = -1,
				["cuid"] = 17,
			},
			["boss2"] = {
				["name"] = "Boss2",
				["raidn"] = -23,
				["subgroup"] = -1,
				["class"] = "",
				["englishClass"] = "",
				["unit"] = "boss2",
			},
			["Jmylh-亚雷戈斯"] = {
				["subgroup"] = 2,
				["name"] = "Jmylh-亚雷戈斯",
				["raidn"] = 6,
				["class"] = "法师",
				["englishClass"] = "MAGE",
				["unitid"] = "raid6",
				["unit"] = "Jmylh-亚雷戈斯",
			},
			["杀人要有美感-安苏"] = {
				["subgroup"] = 3,
				["name"] = "杀人要有美感-安苏",
				["raidn"] = 14,
				["class"] = "死亡骑士",
				["englishClass"] = "DEATHKNIGHT",
				["unitid"] = "raid14",
				["unit"] = "杀人要有美感-安苏",
			},
			["恍然小悟-德拉诺"] = {
				["subgroup"] = 2,
				["name"] = "恍然小悟-德拉诺",
				["raidn"] = 7,
				["class"] = "猎人",
				["englishClass"] = "HUNTER",
				["unitid"] = "raid7",
				["unit"] = "恍然小悟-德拉诺",
			},
			["focustarget"] = {
				["name"] = "焦点目标的目标",
				["raidn"] = -4,
				["subgroup"] = -1,
				["class"] = "",
				["englishClass"] = "",
				["unit"] = "focustarget",
			},
			["mouseover"] = {
				["name"] = "鼠标目标",
				["raidn"] = -2,
				["subgroup"] = -1,
				["class"] = "",
				["englishClass"] = "",
				["unit"] = "mouseover",
			},
			["pettarget"] = {
				["name"] = "宠物的目标",
				["raidn"] = -18,
				["subgroup"] = -1,
				["class"] = "",
				["englishClass"] = "",
				["unit"] = "pettarget",
			},
			["boss4"] = {
				["name"] = "Boss4",
				["raidn"] = -27,
				["subgroup"] = -1,
				["class"] = "",
				["englishClass"] = "",
				["unit"] = "boss4",
			},
			["player"] = {
				["name"] = "自己",
				["raidn"] = -8,
				["subgroup"] = -1,
				["class"] = "",
				["englishClass"] = "",
				["unit"] = "player",
			},
			["斩绝-银松森林"] = {
				["subgroup"] = 1,
				["name"] = "斩绝-银松森林",
				["raidn"] = 5,
				["class"] = "战士",
				["englishClass"] = "WARRIOR",
				["unitid"] = "raid5",
				["unit"] = "斩绝-银松森林",
			},
			["boss3target"] = {
				["name"] = "Boss3的目标",
				["raidn"] = -26,
				["subgroup"] = -1,
				["class"] = "",
				["englishClass"] = "",
				["unit"] = "boss3target",
			},
			["boss3"] = {
				["name"] = "Boss3",
				["raidn"] = -25,
				["subgroup"] = -1,
				["class"] = "",
				["englishClass"] = "",
				["unit"] = "boss3",
			},
			["路过王-扎拉赞恩"] = {
				["subgroup"] = 1,
				["name"] = "路过王-扎拉赞恩",
				["raidn"] = 2,
				["class"] = "牧师",
				["englishClass"] = "PRIEST",
				["unitid"] = "raid2",
				["unit"] = "路过王-扎拉赞恩",
			},
			["maintank1"] = {
				["unit"] = "maintank1",
				["name"] = "MT1",
				["raidn"] = -10,
				["englishClass"] = "",
				["class"] = "",
				["subgroup"] = -1,
				["cuid"] = 11,
			},
			["maintank3"] = {
				["unit"] = "maintank3",
				["name"] = "MT3",
				["raidn"] = -12,
				["englishClass"] = "",
				["class"] = "",
				["subgroup"] = -1,
				["cuid"] = 13,
			},
			["天使投影"] = {
				["subgroup"] = 2,
				["name"] = "天使投影",
				["raidn"] = 9,
				["class"] = "术士",
				["englishClass"] = "WARLOCK",
				["unitid"] = "raid9",
				["unit"] = "天使投影",
			},
			["Meijioula-亚雷戈斯"] = {
				["subgroup"] = 3,
				["name"] = "Meijioula-亚雷戈斯",
				["raidn"] = 11,
				["class"] = "猎人",
				["englishClass"] = "HUNTER",
				["unitid"] = "raid11",
				["unit"] = "Meijioula-亚雷戈斯",
			},
			["墨菲托斯-灰谷"] = {
				["subgroup"] = 5,
				["name"] = "墨菲托斯-灰谷",
				["raidn"] = 22,
				["class"] = "术士",
				["englishClass"] = "WARLOCK",
				["unitid"] = "raid22",
				["unit"] = "墨菲托斯-灰谷",
			},
			["夏花黎-伊萨里奥斯"] = {
				["subgroup"] = 5,
				["role"] = "MAINTANK",
				["name"] = "夏花黎-伊萨里奥斯",
				["raidn"] = 21,
				["class"] = "圣骑士",
				["englishClass"] = "PALADIN",
				["unitid"] = "raid21",
				["unit"] = "夏花黎-伊萨里奥斯",
			},
			["maintank6"] = {
				["unit"] = "maintank6",
				["name"] = "MT6",
				["raidn"] = -15,
				["englishClass"] = "",
				["class"] = "",
				["subgroup"] = -1,
				["cuid"] = 16,
			},
			["仁科一百华-金色平原"] = {
				["subgroup"] = 3,
				["name"] = "仁科一百华-金色平原",
				["raidn"] = 13,
				["class"] = "德鲁伊",
				["englishClass"] = "DRUID",
				["unitid"] = "raid13",
				["unit"] = "仁科一百华-金色平原",
			},
			["伊雪夜-安苏"] = {
				["subgroup"] = 3,
				["name"] = "伊雪夜-安苏",
				["raidn"] = 10,
				["class"] = "圣骑士",
				["englishClass"] = "PALADIN",
				["unitid"] = "raid10",
				["unit"] = "伊雪夜-安苏",
			},
			["nogoal"] = {
				["unit"] = "nogoal",
				["name"] = "无目标",
				["raidn"] = -9,
				["englishClass"] = "",
				["class"] = "",
				["subgroup"] = -1,
				["cuid"] = 2,
			},
			["maintank5"] = {
				["unit"] = "maintank5",
				["name"] = "MT5",
				["raidn"] = -14,
				["englishClass"] = "",
				["class"] = "",
				["subgroup"] = -1,
				["cuid"] = 15,
			},
			["boss1target"] = {
				["name"] = "Boss1的目标",
				["raidn"] = -22,
				["subgroup"] = -1,
				["class"] = "",
				["englishClass"] = "",
				["unit"] = "boss1target",
			},
			["兜兜缺水-瑞文戴尔"] = {
				["subgroup"] = 4,
				["name"] = "兜兜缺水-瑞文戴尔",
				["raidn"] = 15,
				["class"] = "法师",
				["englishClass"] = "MAGE",
				["unitid"] = "raid15",
				["unit"] = "兜兜缺水-瑞文戴尔",
			},
			["focus"] = {
				["name"] = "焦点目标",
				["raidn"] = -5,
				["subgroup"] = -1,
				["class"] = "",
				["englishClass"] = "",
				["unit"] = "focus",
			},
			["浦口群众-德拉诺"] = {
				["subgroup"] = 3,
				["name"] = "浦口群众-德拉诺",
				["raidn"] = 12,
				["class"] = "法师",
				["englishClass"] = "MAGE",
				["unitid"] = "raid12",
				["unit"] = "浦口群众-德拉诺",
			},
			["vehicle"] = {
				["name"] = "你控制的车辆",
				["raidn"] = -20,
				["subgroup"] = -1,
				["class"] = "",
				["englishClass"] = "",
				["unit"] = "vehicle",
			},
			["maintank4"] = {
				["unit"] = "maintank4",
				["name"] = "MT4",
				["raidn"] = -13,
				["englishClass"] = "",
				["class"] = "",
				["subgroup"] = -1,
				["cuid"] = 14,
			},
			["绝版宇尘-末日行者"] = {
				["subgroup"] = 4,
				["name"] = "绝版宇尘-末日行者",
				["raidn"] = 17,
				["class"] = "术士",
				["englishClass"] = "WARLOCK",
				["unitid"] = "raid17",
				["unit"] = "绝版宇尘-末日行者",
			},
			["医死你娃-银松森林"] = {
				["subgroup"] = 1,
				["name"] = "医死你娃-银松森林",
				["raidn"] = 4,
				["class"] = "萨满祭司",
				["englishClass"] = "SHAMAN",
				["unitid"] = "raid4",
				["unit"] = "医死你娃-银松森林",
			},
			["吃饱就睡-暗影之月"] = {
				["subgroup"] = 2,
				["name"] = "吃饱就睡-暗影之月",
				["raidn"] = 1,
				["class"] = "术士",
				["englishClass"] = "WARLOCK",
				["unitid"] = "raid1",
				["unit"] = "吃饱就睡-暗影之月",
			},
			["FireHasBeenSet"] = {
				["unit"] = "FireHasBeenSet",
				["name"] = "被集火目标",
				["raidn"] = -3,
				["englishClass"] = "",
				["class"] = "",
				["subgroup"] = -1,
				["cuid"] = 1,
			},
			["maintank8"] = {
				["unit"] = "maintank8",
				["name"] = "MT8",
				["raidn"] = -17,
				["englishClass"] = "",
				["class"] = "",
				["subgroup"] = -1,
				["cuid"] = 18,
			},
			["茉莉丶蜜茶灬-主宰之剑"] = {
				["subgroup"] = 5,
				["name"] = "茉莉丶蜜茶灬-主宰之剑",
				["raidn"] = 24,
				["class"] = "牧师",
				["englishClass"] = "PRIEST",
				["unitid"] = "raid24",
				["unit"] = "茉莉丶蜜茶灬-主宰之剑",
			},
			["boss2target"] = {
				["name"] = "Boss2的目标",
				["raidn"] = -24,
				["subgroup"] = -1,
				["class"] = "",
				["englishClass"] = "",
				["unit"] = "boss2target",
			},
			["targettarget"] = {
				["name"] = "当前目标的目标",
				["raidn"] = -6,
				["subgroup"] = -1,
				["class"] = "",
				["englishClass"] = "",
				["unit"] = "targettarget",
			},
			["圣灬西罗"] = {
				["subgroup"] = 2,
				["name"] = "圣灬西罗",
				["raidn"] = 8,
				["class"] = "潜行者",
				["englishClass"] = "ROGUE",
				["unitid"] = "raid8",
				["unit"] = "圣灬西罗",
			},
			["mouseovertarget"] = {
				["name"] = "鼠标目标的目标",
				["raidn"] = -1,
				["subgroup"] = -1,
				["class"] = "",
				["englishClass"] = "",
				["unit"] = "mouseovertarget",
			},
			["maintank1target"] = {
				["unit"] = "maintank1target",
				["name"] = "MT1的目标",
				["raidn"] = -29,
				["englishClass"] = "",
				["class"] = "",
				["subgroup"] = -1,
				["cuid"] = 21,
			},
			["pet"] = {
				["name"] = "宠物",
				["raidn"] = -19,
				["subgroup"] = -1,
				["class"] = "",
				["englishClass"] = "",
				["unit"] = "pet",
			},
			["Tnb-法拉希姆"] = {
				["subgroup"] = 4,
				["name"] = "Tnb-法拉希姆",
				["raidn"] = 16,
				["class"] = "萨满祭司",
				["englishClass"] = "SHAMAN",
				["unitid"] = "raid16",
				["unit"] = "Tnb-法拉希姆",
			},
			["专业刷本一号-安戈洛"] = {
				["subgroup"] = 5,
				["name"] = "专业刷本一号-安戈洛",
				["raidn"] = 23,
				["class"] = "猎人",
				["englishClass"] = "HUNTER",
				["unitid"] = "raid23",
				["unit"] = "专业刷本一号-安戈洛",
			},
			["暴走的叶子-末日行者"] = {
				["subgroup"] = 1,
				["name"] = "暴走的叶子-末日行者",
				["raidn"] = 3,
				["class"] = "圣骑士",
				["englishClass"] = "PALADIN",
				["unitid"] = "raid3",
				["unit"] = "暴走的叶子-末日行者",
			},
			["放开那个叔叔-德拉诺"] = {
				["subgroup"] = 5,
				["role"] = "MAINTANK",
				["name"] = "放开那个叔叔-德拉诺",
				["raidn"] = 20,
				["class"] = "战士",
				["englishClass"] = "WARRIOR",
				["unitid"] = "raid20",
				["unit"] = "放开那个叔叔-德拉诺",
			},
			["迷路的芒果-贫瘠之地"] = {
				["subgroup"] = 4,
				["name"] = "迷路的芒果-贫瘠之地",
				["raidn"] = 19,
				["class"] = "术士",
				["englishClass"] = "WARLOCK",
				["unitid"] = "raid19",
				["unit"] = "迷路的芒果-贫瘠之地",
			},
		},
		["CustomMT"] = {
			["checked"] = false,
			["list"] = {
			},
		},
		["ExcludedGroup"] = {
		},
		["IsInfListIndex"] = {
		},
		["IsInfListSet"] = {
		},
	},
	["Locale"] = "zhCN",
	["Config"] = {
		["aminspellGo_checked"] = false,
		["aminspellCancel_checked"] = false,
		["aminspell"] = true,
		["IndexTbl"] = 0,
	},
	["name"] = "[导入]6.2毁灭-2",
	["updata"] = {
	},
	["Mark"] = "553300-746618",
	["CollectionInf"] = {
		["Buff_Spell"] = {
			["checked"] = false,
			["type"] = "WARLOCK",
		},
	},
	["Version"] = 500065,
	["checked"] = false,
}
