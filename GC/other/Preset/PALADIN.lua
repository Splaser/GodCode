﻿wowamPresetScripts=wowamPresetScripts or {}
if select(2,UnitClass("player")) ~= "PALADIN" then return end
wowamPresetScripts["PALADIN"] = 
{
	["List"] = 
	{
		{
			["Name"] = "惩戒骑单体",
			["Author"] = "FUC",
			["WowBuild"] = "5.4.7",
			["Version"] = "1",
			["Info"] = "简单的惩戒骑方案，基于优先级判断!",
			["Script"] = [[^1^T^SAddOnMemory^T^Smax^N60^Sinf^b^Son^b^SLeftfighting^b^t^SUnit^T^SExcludedGroup^T^t^SRaidListClass^T^S圣骑士^T^SenglishClass^SPALADIN^SCount^N1^t^t^SIsInfList^T^t^STeamNumber^N0^SCustomizeIndex^N0^SIsInfListSet^T^t^STeamCount^T^N0^N1^t^SIsInfListIndex^T^t^SCustomMT^T^Schecked^b^Slist^T^t^t^SExcludeTarget^T^t^SRaidList^T^t^SMTList^T^STypeChecked^N1^SDefault^T^t^SCustom^T^N1^SMT1^N2^SMT2^N3^SMT3^N4^SMT4^N5^SMT5^N6^SMT6^N7^SMT7^N8^SMT8^t^t^t^Schecked^B^Sindex^N1^SMacro^T^t^SSpells^T^SNoStopCastingSpells^T^t^SList^T^N1^T^SExcludedGroup^T^t^Sspell^T^N1^T^STargetSubgroup^N-1^SDelayChecked^b^SCastingSpell^T^Sspell^T^N1^T^SType^Sspell^SspellId^N84963^SRank^S^Sdisabled^B^SitemLink^S[异端裁决]^STexture^SINTERFACE\ICONS\spell_paladin_inquisition^t^t^t^STargets^T^N1^T^Sname^S没有异端裁决^SKey^T^SKeySelect^Sauto^Slock^b^t^SMark^S209628-964588^SConditions^T^N1^T^STargetSubgroup^N-1^SPlayerRangeCheckAngle^T^Schecked^b^t^Schecked^B^SBuff^T^STime^T^SRemaining^T^SValue^N0^Schecked^b^t^SBuffName^T^t^SStart^T^SValue^N0^Schecked^b^t^Schecked^B^t^Schecked^b^SLayer^T^Schecked^b^SBuffName^T^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^SIsBuff^T^Schecked^b^SBuffName^T^t^SNoBuffChecked^b^t^t^SRangeCheck^T^Schecked^b^SRange^T^S<^T^SValue^N0^Schecked^B^t^S>^T^SValue^N0^Schecked^B^t^t^SCount^T^S<^T^SValue^N0^Schecked^B^t^S>^T^SValue^N0^Schecked^B^t^t^t^SClass^T^SExcluded^T^t^Schecked^b^t^SFuncBoolean^T^Schecked^b^SFuncTexe^S^t^SKey^T^SKeySelect^Sauto^t^SIsTarget^T^SIsTargetTargetToPlayer^T^Schecked^b^t^SIsMouseoverTargetToPlayer^T^Schecked^b^t^SIsCustomizeTargetToPlayer^T^STargets^T^t^Schecked^b^t^SIsTarget^T^SContains^b^STargets^T^t^Schecked^b^t^Schecked^b^SIsDefaultTargetToPlayer^T^Schecked^b^t^SIsFocusTargetToPlayer^T^Schecked^b^t^t^STarget^S自己^Swbuff^T^Schecked^b^SMainChecked^b^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^SComboPoints^T^S<^T^SValue^N0^Schecked^b^t^Schecked^b^S>^T^SValue^N0^Schecked^b^t^t^SCastSpell^T^SRemaining^T^SValue^N0^Schecked^b^t^Schecked^b^SAllInterruptChecked^b^SStart^T^SValue^N0^Schecked^b^t^SInterruptChecked^b^SSpells^T^t^t^Sand/or^b^SFireHasBeenSetValue^N2^SMark^S413202-801018^STotem^T^Schecked^b^Sname^S^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^SBlood^T^S<^T^SValue^N0^Schecked^b^t^Schecked^b^S>^T^SValue^N0^Schecked^b^t^SLack^b^SPercentage^b^t^SDistance^T^S<^T^SValue^N0^Schecked^b^t^Schecked^b^S>^T^SValue^N0^Schecked^b^t^t^SRemark^S^SNewBuff^T^Schecked^B^Sbuffindex^N1^SIsOrAnd^SOr^Sbuffs^T^N1^T^SIsPlayer^SAll^SSpellId^N84963^SClass^T^t^SIsCount^b^SIsCd^SEnd^SIsSpellIdTexture^SIsName^SCd^T^S<^T^SValue^N3^SChecked^B^t^S>^T^SValue^N0^SChecked^b^t^t^SIsType^SAuto^SCount^T^S<^T^SValue^N0^t^S>^T^SValue^N0^t^t^SIsCanceLable^SNo^SIsRaid^SNo^t^t^SNoBuffNameCount^N0^t^SNewSpell^T^SNotInterrupt^SAll^t^SApiDbf^T^t^Sname^S1^Sunit^Splayer^SRune^T^SRuneCooldown^T^N1^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N2^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N3^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N4^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^Schecked^b^t^Schecked^b^SRuneCount^T^N1^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N2^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N3^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N4^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^Schecked^b^t^t^SCooldown^T^Schecked^b^Sname^T^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^SEnergy^T^S<^T^SValue^N0^Schecked^b^t^Schecked^b^S>^T^SValue^N0^Schecked^b^t^SLack^b^SPercentage^b^t^SSpecialEnergy^T^S<^T^SValue^N0^Schecked^b^t^Schecked^b^S>^T^SValue^N0^Schecked^b^t^t^t^t^SRemark^S^Schecked^B^t^t^Sunit^Snogoal^SKey^T^SKeySelect^Sauto^t^STarget^S无目标^SitemLink^S[异端裁决]^STexture^SINTERFACE\ICONS\spell_paladin_inquisition^SCastingSpellStartOrEnd^T^SStart^T^t^SEnd^T^t^t^SType^Sspell^SDelayValue^N0^SMark^S575249-779440^Schecked^B^SspellId^N84963^SRank^S^t^N2^T^STargetSubgroup^N-1^SDelayChecked^b^SCastingSpell^T^Sspell^T^N1^T^SType^Sspell^SspellId^N114157^STexture^SInterface\Icons\spell_paladin_executionsentence^Sdisabled^B^SitemLink^S[处决宣判]^SRank^S^t^t^t^STargets^T^N1^T^Sname^S有异端^Schecked^B^SMark^S521637-152545^SConditions^T^N1^T^SFireHasBeenSetValue^N2^SPlayerRangeCheckAngle^T^Schecked^b^t^Schecked^B^SBuff^T^Schecked^b^STime^T^SRemaining^T^SValue^N0^Schecked^b^t^SBuffName^T^t^SStart^T^SValue^N0^Schecked^b^t^Schecked^B^t^SLayer^T^SBuffName^T^t^Schecked^b^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^SIsBuff^T^SNoBuffChecked^b^SBuffName^T^t^Schecked^b^t^t^Swbuff^T^Schecked^b^S<^T^SValue^N0^Schecked^b^t^SMainChecked^b^S>^T^SValue^N0^Schecked^b^t^t^SClass^T^SExcluded^T^t^Schecked^b^t^SFuncBoolean^T^Schecked^b^SFuncTexe^S^t^SKey^T^SKeySelect^Sauto^t^SIsTarget^T^SIsTargetTargetToPlayer^T^Schecked^b^t^SIsMouseoverTargetToPlayer^T^Schecked^b^t^SIsCustomizeTargetToPlayer^T^STargets^T^t^Schecked^b^t^SIsTarget^T^SContains^b^STargets^T^t^Schecked^b^t^Schecked^b^SIsFocusTargetToPlayer^T^Schecked^b^t^SIsDefaultTargetToPlayer^T^Schecked^b^t^t^STarget^S自己^SSpecialEnergy^T^S<^T^SValue^N0^Schecked^b^t^Schecked^b^S>^T^SValue^N0^Schecked^b^t^t^SComboPoints^T^S<^T^SValue^N0^Schecked^b^t^Schecked^b^S>^T^SValue^N0^Schecked^b^t^t^SEnergy^T^S<^T^SValue^N0^Schecked^b^t^Schecked^b^SPercentage^b^SLack^b^S>^T^SValue^N0^Schecked^b^t^t^Sand/or^b^SCooldown^T^Sname^T^t^Schecked^b^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^SRune^T^SRuneCooldown^T^N1^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N2^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N3^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N4^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^Schecked^b^t^Schecked^b^SRuneCount^T^N1^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N2^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N3^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N4^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^Schecked^b^t^t^STotem^T^Sname^S^Schecked^b^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^Sunit^Splayer^SDistance^T^S<^T^SValue^N0^Schecked^b^t^Schecked^b^S>^T^SValue^N0^Schecked^b^t^t^SRemark^S^SBlood^T^S<^T^SValue^N0^Schecked^b^t^Schecked^b^SPercentage^b^SLack^b^S>^T^SValue^N0^Schecked^b^t^t^SNewSpell^T^SNotInterrupt^SAll^t^SApiDbf^T^t^Sname^S1^SNewBuff^T^Sbuffindex^N1^Schecked^B^SIsOrAnd^SOr^Sbuffs^T^N1^T^SIsPlayer^SAll^SSpellId^N84963^SClass^T^t^SCount^T^S<^T^SValue^N0^t^S>^T^SValue^N0^t^t^SIsCd^SPresence^SIsSpellIdTexture^SIsName^SCd^T^S<^T^SValue^N3^SChecked^B^t^S>^T^SValue^N0^SChecked^b^t^t^SIsType^SAuto^SIsCount^b^SIsCanceLable^SNo^SIsRaid^SNo^t^t^SNoBuffNameCount^N0^t^SMark^S828261-293614^STargetSubgroup^N-1^SCastSpell^T^SRemaining^T^SValue^N0^Schecked^b^t^Schecked^b^SAllInterruptChecked^b^SStart^T^SValue^N0^Schecked^b^t^SInterruptChecked^b^SSpells^T^t^t^SRangeCheck^T^SCount^T^S<^T^SValue^N0^Schecked^B^t^S>^T^SValue^N0^Schecked^B^t^t^SRange^T^S<^T^SValue^N0^Schecked^B^t^S>^T^SValue^N0^Schecked^B^t^t^Schecked^b^t^t^t^SRemark^S^SKey^T^SKeySelect^Sauto^Slock^b^t^t^t^Sunit^STarget^SKey^T^SKeySelect^Sauto^t^STarget^S当前目标^SitemLink^S[处决宣判]^STexture^SInterface\Icons\spell_paladin_executionsentence^SCastingSpellStartOrEnd^T^SStart^T^t^SEnd^T^t^t^SType^Sspell^SDelayValue^N0^SMark^S426764-835176^Schecked^B^SspellId^N114157^SRank^S^t^N3^T^STargetSubgroup^N-1^SDelayChecked^b^SCastingSpell^T^Sspell^T^N1^T^SType^Sspell^SspellId^N85256^SRank^S^Sdisabled^B^SitemLink^S[圣殿骑士的裁决]^STexture^SINTERFACE\ICONS\spell_paladin_templarsverdict^t^t^t^STargets^T^N1^T^Sname^S五星^SKey^T^SKeySelect^Sauto^t^SMark^S951703-459017^SConditions^T^N1^T^SFireHasBeenSetValue^N2^SPlayerRangeCheckAngle^T^Schecked^b^t^Schecked^B^SBuff^T^STime^T^SRemaining^T^SValue^N0^Schecked^b^t^SBuffName^T^t^SStart^T^SValue^N0^Schecked^b^t^Schecked^B^t^Schecked^b^SLayer^T^Schecked^b^SBuffName^T^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^SIsBuff^T^Schecked^b^SNoBuffChecked^b^SBuffName^T^t^t^t^SRangeCheck^T^Schecked^b^SCount^T^S<^T^SValue^N0^Schecked^B^t^S>^T^SValue^N0^Schecked^B^t^t^SRange^T^S<^T^SValue^N0^Schecked^B^t^S>^T^SValue^N0^Schecked^B^t^t^t^SClass^T^SExcluded^T^t^Schecked^b^t^SFuncBoolean^T^Schecked^b^SFuncTexe^S^t^SKey^T^SKeySelect^Sauto^t^SIsTarget^T^SIsTargetTargetToPlayer^T^Schecked^b^t^SIsMouseoverTargetToPlayer^T^Schecked^b^t^SIsCustomizeTargetToPlayer^T^STargets^T^t^Schecked^b^t^SIsTarget^T^SContains^b^STargets^T^t^Schecked^b^t^Schecked^b^SIsDefaultTargetToPlayer^T^Schecked^b^t^SIsFocusTargetToPlayer^T^Schecked^b^t^t^STarget^S自己^Sunit^Splayer^SComboPoints^T^S<^T^SValue^N0^Schecked^b^t^Schecked^b^S>^T^SValue^N0^Schecked^b^t^t^SCastSpell^T^SRemaining^T^SValue^N0^Schecked^b^t^Schecked^b^SAllInterruptChecked^b^SStart^T^SValue^N0^Schecked^b^t^SInterruptChecked^b^SSpells^T^t^t^Sand/or^b^STargetSubgroup^N-1^SMark^S936258-530582^STotem^T^Schecked^b^Sname^S^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^SBlood^T^S<^T^SValue^N0^Schecked^b^t^Schecked^b^S>^T^SValue^N0^Schecked^b^t^SLack^b^SPercentage^b^t^SDistance^T^S<^T^SValue^N0^Schecked^b^t^Schecked^b^S>^T^SValue^N0^Schecked^b^t^t^SRemark^S^SNewBuff^T^t^SNewSpell^T^SNotInterrupt^SAll^t^SApiDbf^T^t^Sname^S1^Swbuff^T^Schecked^b^SMainChecked^b^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^SRune^T^SRuneCooldown^T^N1^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N2^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N3^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N4^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^Schecked^b^t^Schecked^b^SRuneCount^T^N1^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N2^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N3^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N4^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^Schecked^b^t^t^SCooldown^T^Schecked^b^Sname^T^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^SEnergy^T^S<^T^SValue^N0^Schecked^b^t^Schecked^b^S>^T^SValue^N0^Schecked^b^t^SLack^b^SPercentage^b^t^SSpecialEnergy^T^S<^T^SValue^N0^Schecked^b^t^Schecked^B^S>^T^SValue^N5^Schecked^B^t^t^t^t^SRemark^S^Schecked^B^t^t^Sunit^STarget^SKey^T^SKeySelect^Sauto^t^STarget^S当前目标^SitemLink^S[圣殿骑士的裁决]^STexture^SINTERFACE\ICONS\spell_paladin_templarsverdict^SCastingSpellStartOrEnd^T^SStart^T^t^SEnd^T^t^t^SType^Sspell^SDelayValue^N0^SMark^S260735-940297^Schecked^B^SspellId^N85256^SRank^S^t^N4^T^STargetSubgroup^N-1^SDelayChecked^b^SCastingSpell^T^Sspell^T^N1^T^SType^Sspell^SspellId^N24275^STexture^SInterface\Icons\spell_paladin_hammerofwrath^Sdisabled^B^SitemLink^S[愤怒之锤]^SRank^S^t^t^t^STargets^T^t^Sunit^STarget^SKey^T^SKeySelect^Sauto^t^STarget^S当前目标^SitemLink^S[愤怒之锤]^STexture^SInterface\Icons\spell_paladin_hammerofwrath^SCastingSpellStartOrEnd^T^SStart^T^t^SEnd^T^t^t^SType^Sspell^SDelayValue^N0^SMark^S844507-155465^Schecked^B^SspellId^N24275^SRank^S^t^N5^T^STargetSubgroup^N-1^SType^Sspell^SDelayChecked^b^SDelayValue^N0^STargets^T^t^Sunit^STarget^SRank^S^SspellId^N35395^SKey^T^SKeySelect^Sauto^t^SMark^S379308-419987^STarget^S当前目标^Schecked^B^SitemLink^S[十字军打击]^STexture^SInterface\Icons\Spell_Holy_CrusaderStrike^t^N6^T^STargetSubgroup^N-1^SType^Sspell^SspellId^N20271^SDelayValue^N0^STargets^T^t^Sunit^STarget^STexture^SInterface\Icons\Spell_Holy_RighteousFury^SDelayChecked^b^SKey^T^SKeySelect^Sauto^t^Schecked^B^STarget^S当前目标^SMark^S197922-640148^SitemLink^S[审判]^SRank^S^t^N7^T^STargetSubgroup^N-1^SDelayChecked^b^SCastingSpell^T^Sspell^T^N1^T^SType^Sspell^SspellId^N85256^STexture^SINTERFACE\ICONS\spell_paladin_templarsverdict^Sdisabled^B^SitemLink^S[圣殿骑士的裁决]^SRank^S^t^t^t^STargets^T^N1^T^Sname^S神圣意图^Schecked^B^SMark^S966992-735068^SConditions^T^N1^T^STargetSubgroup^N-1^SPlayerRangeCheckAngle^T^Schecked^b^t^Schecked^B^SBuff^T^Schecked^b^STime^T^SRemaining^T^SValue^N0^Schecked^b^t^SBuffName^T^t^SStart^T^SValue^N0^Schecked^b^t^Schecked^B^t^SLayer^T^SBuffName^T^t^Schecked^b^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^SIsBuff^T^SBuffName^T^t^SNoBuffChecked^b^Schecked^b^t^t^SRangeCheck^T^SRange^T^S<^T^SValue^N0^Schecked^B^t^S>^T^SValue^N0^Schecked^B^t^t^SCount^T^S<^T^SValue^N0^Schecked^B^t^S>^T^SValue^N0^Schecked^B^t^t^Schecked^b^t^SClass^T^SExcluded^T^t^Schecked^b^t^Sunit^Splayer^SKey^T^SKeySelect^Sauto^t^SIsTarget^T^SIsTargetTargetToPlayer^T^Schecked^b^t^SIsMouseoverTargetToPlayer^T^Schecked^b^t^SIsCustomizeTargetToPlayer^T^STargets^T^t^Schecked^b^t^SIsTarget^T^SContains^b^STargets^T^t^Schecked^b^t^Schecked^b^SIsFocusTargetToPlayer^T^Schecked^b^t^SIsDefaultTargetToPlayer^T^Schecked^b^t^t^STarget^S自己^SSpecialEnergy^T^S<^T^SValue^N0^Schecked^b^t^Schecked^b^S>^T^SValue^N0^Schecked^b^t^t^SComboPoints^T^S<^T^SValue^N0^Schecked^b^t^Schecked^b^S>^T^SValue^N0^Schecked^b^t^t^SEnergy^T^S<^T^SValue^N0^Schecked^b^t^Schecked^b^SPercentage^b^SLack^b^S>^T^SValue^N0^Schecked^b^t^t^Sand/or^b^SCooldown^T^Sname^T^t^Schecked^b^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^SRune^T^SRuneCooldown^T^N1^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N2^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N3^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N4^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^Schecked^b^t^Schecked^b^SRuneCount^T^N1^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N2^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N3^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N4^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^Schecked^b^t^t^STotem^T^Sname^S^Schecked^b^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^Swbuff^T^Schecked^b^S<^T^SValue^N0^Schecked^b^t^SMainChecked^b^S>^T^SValue^N0^Schecked^b^t^t^SDistance^T^S<^T^SValue^N0^Schecked^b^t^Schecked^b^S>^T^SValue^N0^Schecked^b^t^t^SRemark^S^SBlood^T^S<^T^SValue^N0^Schecked^b^t^Schecked^b^SPercentage^b^SLack^b^S>^T^SValue^N0^Schecked^b^t^t^SNewSpell^T^SNotInterrupt^SAll^t^SApiDbf^T^t^Sname^S1^SNewBuff^T^Schecked^B^Sbuffindex^N1^SIsOrAnd^SOr^Sbuffs^T^N1^T^SIsPlayer^SAll^SSpellId^N86172^SClass^T^t^SIsSpellIdTexture^SIsName^SIsCd^SPresence^SIsCount^b^SCd^T^S<^T^SValue^N0^t^S>^T^SValue^N0^t^t^SCount^T^S<^T^SValue^N0^t^S>^T^SValue^N0^t^t^SIsType^SAuto^SIsCanceLable^SNo^SIsRaid^SNo^t^t^SNoBuffNameCount^N0^t^SMark^S576558-886628^SFireHasBeenSetValue^N2^SCastSpell^T^SRemaining^T^SValue^N0^Schecked^b^t^Schecked^b^SAllInterruptChecked^b^SStart^T^SValue^N0^Schecked^b^t^SInterruptChecked^b^SSpells^T^t^t^SFuncBoolean^T^Schecked^b^SFuncTexe^S^t^t^t^SRemark^S^SKey^T^SKeySelect^Sauto^t^t^t^Sunit^STarget^SKey^T^SKeySelect^Sauto^t^STarget^S当前目标^SitemLink^S[圣殿骑士的裁决]^STexture^SINTERFACE\ICONS\spell_paladin_templarsverdict^SCastingSpellStartOrEnd^T^SStart^T^t^SEnd^T^t^t^SType^Sspell^SDelayValue^N0^SMark^S902277-538666^Schecked^B^SspellId^N85256^SRank^S^t^N8^T^STargetSubgroup^N-1^SDelayChecked^b^SCastingSpell^T^Sspell^T^N1^T^SType^Sspell^SspellId^N879^SRank^S^Sdisabled^B^SitemLink^S[驱邪术]^STexture^SInterface\Icons\Spell_Holy_Excorcism_02^t^t^t^STargets^T^t^Sunit^STarget^SKey^T^SKeySelect^Sauto^t^STarget^S当前目标^SitemLink^S[驱邪术]^STexture^SInterface\Icons\Spell_Holy_Excorcism_02^SCastingSpellStartOrEnd^T^SStart^T^t^SEnd^T^t^t^SType^Sspell^SDelayValue^N0^SMark^S689181-192844^Schecked^B^SspellId^N879^SRank^S^t^N9^T^STargetSubgroup^N-1^SDelayChecked^b^SCastingSpell^T^Sspell^T^N1^T^SType^Sspell^SspellId^N114165^SRank^S^Sdisabled^B^SitemLink^S[神圣棱镜]^STexture^SInterface\Icons\spell_paladin_holyprism^t^t^t^STargets^T^t^Sunit^STarget^SKey^T^SKeySelect^Sauto^t^STarget^S当前目标^SitemLink^S[神圣棱镜]^STexture^SInterface\Icons\spell_paladin_holyprism^SCastingSpellStartOrEnd^T^SStart^T^t^SEnd^T^t^t^SType^Sspell^SDelayValue^N0^SMark^S897910-591189^Schecked^B^SspellId^N114165^SRank^S^t^N10^T^SFireHasBeenSetValue^N2^SDelayChecked^b^SCastingSpell^T^Sspell^T^N1^T^SType^Sspell^SspellId^N20925^STexture^SInterface\Icons\Ability_Paladin_BlessedMending^Sdisabled^B^SitemLink^S[圣洁护盾]^SRank^S^t^t^t^STargets^T^t^Sunit^Splayer^SKey^T^SKeySelect^Sauto^t^STarget^S自己^SitemLink^S[圣洁护盾]^STexture^SInterface\Icons\Ability_Paladin_BlessedMending^SCastingSpellStartOrEnd^T^SStart^T^t^SEnd^T^t^t^SType^Sspell^SDelayValue^N0^Schecked^B^SMark^S216106-361742^STargetSubgroup^N-1^SspellId^N20925^SRank^S^t^t^Schecked^B^SApiDbf^T^t^SExcludeTarget^T^t^SKey^T^SKeySelect^Sauto^t^SMark^S512502-804448^Sname^S惩戒骑单体输出^SRemarks^S^t^t^t^SRemark^S^SImport^B^SLocale^SzhCN^Supdata^T^t^Sname^S惩戒骑输出^SVersion^N700000^SMark^S498328-106462^SCollectionInf^T^SBuff_Spell^T^Stype^N-1000^Schecked^b^t^t^SConfig^T^SIndexTbl^N0^t^t^^]]
		},
		{
			["Name"] = "防骑拉怪(懒人用)",
			["Author"] = "FUC",
			["WowBuild"] = "5.4.7",
			["Version"] = "1",
			["Info"] = "简单的防骑方案，自动打打技能，自动打盾击! 无法判断减伤时机!",
			["Script"] = [[^1^T^SAddOnMemory^T^Smax^N60^Sinf^b^Son^b^SLeftfighting^b^t^SUnit^T^SExcludedGroup^T^t^SRaidListClass^T^S圣骑士^T^SenglishClass^SPALADIN^SCount^N1^t^t^SIsInfList^T^t^STeamNumber^N0^SCustomizeIndex^N0^STeamCount^T^N0^N1^t^SIsInfListSet^T^t^SExcludeTarget^T^t^SRaidList^T^t^SMTList^T^STypeChecked^N1^SDefault^T^t^SCustom^T^N1^SMT1^N2^SMT2^N3^SMT3^N4^SMT4^N5^SMT5^N6^SMT6^N7^SMT7^N8^SMT8^t^t^t^Schecked^B^Sindex^N1^SMacro^T^t^SSpells^T^SNoStopCastingSpells^T^t^SList^T^N1^T^SMark^S143386-404079^Sspell^T^N1^T^STargetSubgroup^N-1^SDelayChecked^b^SCastingSpell^T^Sspell^T^N1^T^SType^Sspell^SspellId^N25780^SRank^S^Sdisabled^B^SitemLink^S[正义之怒]^STexture^SInterface\Icons\Spell_Holy_SealOfFury^t^t^t^STargets^T^N1^T^Sname^S保持^SKey^T^SKeySelect^Sauto^t^SMark^S331335-293424^SConditions^T^N1^T^STargetSubgroup^N-1^SPlayerRangeCheckAngle^T^Schecked^b^t^Schecked^B^SBuff^T^STime^T^SRemaining^T^SValue^N0^Schecked^b^t^SBuffName^T^t^SStart^T^SValue^N0^Schecked^b^t^Schecked^B^t^Schecked^b^SLayer^T^Schecked^b^SBuffName^T^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^SIsBuff^T^SBuffName^T^t^Schecked^b^SNoBuffChecked^b^t^t^Swbuff^T^Schecked^b^SMainChecked^b^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^SClass^T^SExcluded^T^t^Schecked^b^t^Sunit^Splayer^SKey^T^SKeySelect^Sauto^t^SIsTarget^T^SIsTargetTargetToPlayer^T^Schecked^b^t^SIsMouseoverTargetToPlayer^T^Schecked^b^t^SIsCustomizeTargetToPlayer^T^STargets^T^t^Schecked^b^t^SIsTarget^T^SContains^b^STargets^T^t^Schecked^b^t^Schecked^b^SIsDefaultTargetToPlayer^T^Schecked^b^t^SIsFocusTargetToPlayer^T^Schecked^b^t^t^STarget^S自己^SRangeCheck^T^SRange^T^S<^T^SValue^N0^Schecked^B^t^S>^T^SValue^N0^Schecked^B^t^t^Schecked^b^SCount^T^S<^T^SValue^N0^Schecked^B^t^S>^T^SValue^N0^Schecked^B^t^t^t^SComboPoints^T^S<^T^SValue^N0^Schecked^b^t^Schecked^b^S>^T^SValue^N0^Schecked^b^t^t^SCastSpell^T^SRemaining^T^SValue^N0^Schecked^b^t^Schecked^b^SAllInterruptChecked^b^SStart^T^SValue^N0^Schecked^b^t^SInterruptChecked^b^SSpells^T^t^t^Sand/or^b^SApiDbf^T^t^SMark^S876310-884315^STotem^T^Schecked^b^Sname^S^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^SSpecialEnergy^T^S<^T^SValue^N0^Schecked^b^t^Schecked^b^S>^T^SValue^N0^Schecked^b^t^t^SDistance^T^S<^T^SValue^N0^Schecked^b^t^Schecked^b^S>^T^SValue^N0^Schecked^b^t^t^SRemark^S^SNewBuff^T^Schecked^B^Sbuffindex^N1^SIsOrAnd^SOr^Sbuffs^T^N1^T^SIsPlayer^SAll^SSpellId^N25780^SClass^T^t^SIsSpellIdTexture^SIsName^SIsCd^SNotPresence^SIsCount^b^SCd^T^S<^T^SValue^N0^t^S>^T^SValue^N0^t^t^SCount^T^S<^T^SValue^N0^t^S>^T^SValue^N0^t^t^SIsType^SAuto^SIsCanceLable^SNo^SIsRaid^SNo^t^t^SNoBuffNameCount^N0^t^SNewSpell^T^t^SCooldown^T^Schecked^b^Sname^T^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^Sname^S保持^SBlood^T^S<^T^SValue^N0^Schecked^b^t^Schecked^b^S>^T^SValue^N0^Schecked^b^t^SLack^b^SPercentage^b^t^SRune^T^SRuneCooldown^T^N1^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N2^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N3^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N4^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^Schecked^b^t^Schecked^b^SRuneCount^T^N1^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N2^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N3^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^N4^T^S=^T^SValue^N0^Schecked^b^t^S<^T^SValue^N0^Schecked^b^t^S>^T^SValue^N0^Schecked^b^t^t^Schecked^b^t^t^SFireHasBeenSetValue^N2^SEnergy^T^S<^T^SValue^N0^Schecked^b^t^Schecked^b^S>^T^SValue^N0^Schecked^b^t^SLack^b^SPercentage^b^t^SFuncBoolean^T^Schecked^b^SFuncTexe^S^t^t^t^SRemark^S^Schecked^B^t^t^Sunit^Snogoal^SKey^T^SKeySelect^Sauto^t^STarget^S无目标^SitemLink^S[正义之怒]^STexture^SInterface\Icons\Spell_Holy_SealOfFury^SCastingSpellStartOrEnd^T^SStart^T^t^SEnd^T^t^t^SType^Sspell^SDelayValue^N0^SMark^S627995-343294^Schecked^B^SspellId^N25780^SRank^S^t^N2^T^STargetSubgroup^N-1^SDelayChecked^b^SCastingSpell^T^Sspell^T^N1^T^SType^Sspell^SspellId^N31935^STexture^SInterface\Icons\Spell_Holy_AvengersShield^Sdisabled^B^SitemLink^S[复仇者之盾]^SRank^S^t^t^t^STargets^T^t^Sunit^STarget^SKey^T^SKeySelect^Sauto^t^STarget^S当前目标^SitemLink^S[复仇者之盾]^STexture^SInterface\Icons\Spell_Holy_AvengersShield^SCastingSpellStartOrEnd^T^SStart^T^t^SEnd^T^t^t^SType^Sspell^SDelayValue^N0^SMark^S736155-637900^Schecked^B^SspellId^N31935^SRank^S^t^N3^T^STargetSubgroup^N-1^SDelayChecked^b^SCastingSpell^T^Sspell^T^N1^T^SType^Sspell^SspellId^N24275^SRank^S^Sdisabled^B^SitemLink^S[愤怒之锤]^STexture^SInterface\Icons\spell_paladin_hammerofwrath^t^t^t^STargets^T^t^Sunit^STarget^SKey^T^SKeySelect^Sauto^t^STarget^S当前目标^SitemLink^S[愤怒之锤]^STexture^SInterface\Icons\spell_paladin_hammerofwrath^SCastingSpellStartOrEnd^T^SStart^T^t^SEnd^T^t^t^SType^Sspell^SDelayValue^N0^SMark^S443715-908555^Schecked^B^SspellId^N24275^SRank^S^t^N4^T^STargetSubgroup^N-1^SDelayChecked^b^SCastingSpell^T^Sspell^T^N1^T^SType^Sspell^SspellId^N20271^STexture^SInterface\Icons\Spell_Holy_RighteousFury^Sdisabled^B^SitemLink^S[审判]^SRank^S^t^t^t^STargets^T^t^Sunit^STarget^SKey^T^SKeySelect^Sauto^t^STarget^S当前目标^SitemLink^S[审判]^STexture^SInterface\Icons\Spell_Holy_RighteousFury^SCastingSpellStartOrEnd^T^SStart^T^t^SEnd^T^t^t^SType^Sspell^SDelayValue^N0^SMark^S547907-939121^Schecked^B^SspellId^N20271^SRank^S^t^N5^T^SFireHasBeenSetValue^N2^Schecked^B^SCastingSpell^T^Sspell^T^N1^T^SType^Sspell^SspellId^N119072^STexture^SInterface\Icons\Spell_Holy_WeaponMastery^Sdisabled^B^SitemLink^S[神圣愤怒]^SRank^S^t^t^t^STargets^T^t^Sunit^Snogoal^SKey^T^SKeySelect^Sauto^t^STarget^S无目标^SitemLink^S[神圣愤怒]^STexture^SInterface\Icons\Spell_Holy_WeaponMastery^SCastingSpellStartOrEnd^T^SStart^T^t^SEnd^T^t^t^SType^Sspell^SDelayValue^N0^SspellId^N119072^SMark^S744522-641062^STargetSubgroup^N-1^SDelayChecked^b^SRank^S^t^N6^T^STargetSubgroup^N-1^SDelayChecked^b^SCastingSpell^T^Sspell^T^N1^T^SType^Sspell^SspellId^N53600^SRank^S^Sdisabled^B^SitemLink^S[正义盾击]^STexture^SInterface\Icons\Ability_Paladin_ShieldofVengeance^t^t^t^STargets^T^t^Sunit^STarget^SKey^T^SKeySelect^Sauto^t^STarget^S当前目标^SitemLink^S[正义盾击]^STexture^SInterface\Icons\Ability_Paladin_ShieldofVengeance^SCastingSpellStartOrEnd^T^SStart^T^t^SEnd^T^t^t^SType^Sspell^SDelayValue^N0^SMark^S655039-701955^Schecked^B^SspellId^N53600^SRank^S^t^N7^T^STargetSubgroup^N-1^SDelayChecked^b^SCastingSpell^T^Sspell^T^N1^T^SType^Sspell^SspellId^N26573^SRank^S^Sdisabled^B^SitemLink^S[奉献]^STexture^SInterface\Icons\Spell_Holy_InnerFire^t^t^t^STargets^T^t^Sunit^Snogoal^SKey^T^SKeySelect^Sauto^t^STarget^S无目标^SitemLink^S[奉献]^STexture^SInterface\Icons\Spell_Holy_InnerFire^SCastingSpellStartOrEnd^T^SStart^T^t^SEnd^T^t^t^SType^Sspell^SDelayValue^N0^SMark^S870399-181535^Schecked^B^SspellId^N26573^SRank^S^t^N8^T^STargetSubgroup^N-1^SType^Sspell^SspellId^N53595^SDelayValue^N0^STargets^T^t^Sunit^STarget^STexture^SInterface\Icons\Ability_Paladin_HammeroftheRighteous^SDelayChecked^b^SKey^T^SKeySelect^Sauto^t^Schecked^B^STarget^S当前目标^SMark^S456291-613441^SitemLink^S[正义之锤]^SRank^S^t^t^SKey^T^SKeySelect^Sauto^t^SRemarks^S^Sname^S防骑懒人^Schecked^B^t^t^t^SRemark^S^SImport^B^SLocale^SzhCN^SConfig^T^t^SVersion^N502010^Supdata^T^t^SMark^S843123-802086^SCollectionInf^T^SBuff_Spell^T^t^t^Sname^S防骑懒人^t^^]],
		},
	}
}