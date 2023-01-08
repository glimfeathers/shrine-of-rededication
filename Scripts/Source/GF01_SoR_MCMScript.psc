Scriptname GF01_SoR_MCMScript extends MCM_ConfigBase  
{Implements MCM.}

GlobalVariable Property GF01_SoR_VanillaPreset Auto
GlobalVariable Property GF01_SoR_BaseMagicka Auto
GlobalVariable Property GF01_SoR_BaseHealth Auto
GlobalVariable Property GF01_SoR_BaseStamina Auto
GlobalVariable Property GF01_SoR_BaseCarryWeight Auto

Event OnConfigInit()
	GF01_SoR_VanillaPreset.SetValueInt(GetModSettingBool("GF01_SoR_VanillaPreset:Main") as Int)
	GF01_SoR_BaseMagicka.SetValue(GetModSettingFloat("fBaseMagicka:Main"))
	GF01_SoR_BaseHealth.SetValue(GetModSettingFloat("fBaseHealth:Main"))
	GF01_SoR_BaseStamina.SetValue(GetModSettingFloat("fBaseStamina:Main"))
	GF01_SoR_BaseCarryWeight.SetValue(GetModSettingFloat("fBaseCarryWeight:Main"))
EndEvent

Event OnSettingChange(string a_ID)
	if a_ID == "bVanillaPreset:Main"
		GF01_SoR_VanillaPreset.SetValueInt(GetModSettingBool(a_ID) as Int)
	elseif a_ID == "fBaseMagicka:Main"
		GF01_SoR_BaseMagicka.SetValue(GetModSettingFloat(a_ID))
	elseif a_ID == "fBaseHealth:Main"
		GF01_SoR_BaseHealth.SetValue(GetModSettingFloat(a_ID))
	elseif a_ID == "fBaseStamina:Main"
		GF01_SoR_BaseStamina.SetValue(GetModSettingFloat(a_ID))
	elseif a_ID == "fBaseCarryWeight:Main"
		GF01_SoR_BaseCarryWeight.SetValue(GetModSettingFloat(a_ID))
	endIf
EndEvent