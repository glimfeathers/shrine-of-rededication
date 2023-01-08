Scriptname GF01_SoR_MCMScript extends MCM_ConfigBase  
{Implements MCM.}

GlobalVariable Property GF01_SoR_VanillaPreset Auto
GlobalVariable Property GF01_SoR_BaseMagicka Auto
GlobalVariable Property GF01_SoR_BaseHealth Auto
GlobalVariable Property GF01_SoR_BaseStamina Auto
GlobalVariable Property GF01_SoR_BaseCarryWeight Auto

Event OnConfigInit()
	GF01_SoR_VanillaPreset.SetValueInt(("GF01_SoR_VanillaPreset:Main") as Int)
	GF01_SoR_BaseMagicka.SetValue(("fBaseMagicka:Main") as Float)
	GF01_SoR_BaseHealth.SetValue(("fBaseHealth:Main") as Float)
	GF01_SoR_BaseStamina.SetValue(("fBaseStamina:Main") as Float)
	GF01_SoR_BaseCarryWeight.SetValue(("fBaseCarryWeight:Main") as Float)
EndEvent

Event OnSettingChange(string a_ID)
	if a_ID == "bVanillaPreset:Main"
		GF01_SoR_VanillaPreset.SetValueInt((a_ID) as Int)
	elseif a_ID == "fBaseMagicka:Main"
		GF01_SoR_BaseMagicka.SetValue((a_ID) as Float)
	elseif a_ID == "fBaseHealth:Main"
		GF01_SoR_BaseHealth.SetValue((a_ID) as Float)
	elseif a_ID == "fBaseStamina:Main"
		GF01_SoR_BaseStamina.SetValue((a_ID) as Float)
	elseif a_ID == "fBaseCarryWeight:Main"
		GF01_SoR_BaseCarryWeight.SetValue((a_ID) as Float)
	endIf
EndEvent