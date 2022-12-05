Scriptname GF01_SoR_MCMScript extends MCM_ConfigBase
{Implements MCM. }

GlobalVariable Property GF01_SoR_VanillaPreset Auto

GlobalVariable Property GF01_SoR_AltmerBaseMagicka Auto
GlobalVariable Property GF01_SoR_AltmerBaseHealth Auto
GlobalVariable Property GF01_SoR_AltmerBaseStamina Auto

GlobalVariable Property GF01_SoR_ArgonianBaseMagicka Auto
GlobalVariable Property GF01_SoR_ArgonianBaseHealth Auto
GlobalVariable Property GF01_SoR_ArgonianBaseStamina Auto

GlobalVariable Property GF01_SoR_BosmerBaseMagicka Auto
GlobalVariable Property GF01_SoR_BosmerBaseHealth Auto
GlobalVariable Property GF01_SoR_BosmerBaseStamina Auto

GlobalVariable Property GF01_SoR_BretonBaseMagicka Auto
GlobalVariable Property GF01_SoR_BretonBaseHealth Auto
GlobalVariable Property GF01_SoR_BretonBaseStamina Auto

GlobalVariable Property GF01_SoR_DunmerBaseMagicka Auto
GlobalVariable Property GF01_SoR_DunmerBaseHealth Auto
GlobalVariable Property GF01_SoR_DunmerBaseStamina Auto

GlobalVariable Property GF01_SoR_ImperialBaseMagicka Auto
GlobalVariable Property GF01_SoR_ImperialBaseHealth Auto
GlobalVariable Property GF01_SoR_ImperialBaseStamina Auto

GlobalVariable Property GF01_SoR_KhajiitBaseMagicka Auto
GlobalVariable Property GF01_SoR_KhajiitBaseHealth Auto
GlobalVariable Property GF01_SoR_KhajiitBaseStamina Auto

GlobalVariable Property GF01_SoR_NordBaseMagicka Auto
GlobalVariable Property GF01_SoR_NordBaseHealth Auto
GlobalVariable Property GF01_SoR_NordBaseStamina Auto

GlobalVariable Property GF01_SoR_OrsimerBaseMagicka Auto
GlobalVariable Property GF01_SoR_OrsimerBaseHealth Auto
GlobalVariable Property GF01_SoR_OrsimerBaseStamina Auto

GlobalVariable Property GF01_SoR_RedguardBaseMagicka Auto
GlobalVariable Property GF01_SoR_RedguardBaseHealth Auto
GlobalVariable Property GF01_SoR_RedguardBaseStamina Auto

GlobalVariable Property GF01_SoR_CustomRaceBaseMagicka Auto
GlobalVariable Property GF01_SoR_CustomRaceBaseHealth Auto
GlobalVariable Property GF01_SoR_CustomRaceBaseStamina Auto


Event OnConfigInit()
	
	GF01_SoR_VanillaPreset.SetValueInt(GetModSettingBool("GF01_SoR_VanillaPreset:Main") as Int)

	GF01_SoR_AltmerBaseMagicka.SetValue(GetModSettingFloat("fAltmerBaseMagicka:Main"))
	GF01_SoR_AltmerBaseHealth.SetValue(GetModSettingFloat("fAltmerBaseHealth:Main"))
	GF01_SoR_AltmerBaseStamina.SetValue(GetModSettingFloat("fAltmerBaseStamina:Main"))

	GF01_SoR_ArgonianBaseMagicka.SetValue(GetModSettingFloat("fArgonianBaseMagicka:Main"))
	GF01_SoR_ArgonianBaseHealth.SetValue(GetModSettingFloat("fArgonianBaseHealth:Main"))
	GF01_SoR_ArgonianBaseStamina.SetValue(GetModSettingFloat("fArgonianBaseStamina:Main"))

	GF01_SoR_BosmerBaseMagicka.SetValue(GetModSettingFloat("fBosmerBaseMagicka:Main"))
	GF01_SoR_BosmerBaseHealth.SetValue(GetModSettingFloat("fBosmerBaseHealth:Main"))
	GF01_SoR_BosmerBaseStamina.SetValue(GetModSettingFloat("fBosmerBaseStamina:Main"))

	GF01_SoR_BretonBaseMagicka.SetValue(GetModSettingFloat("fBretonBaseMagicka:Main"))
	GF01_SoR_BretonBaseHealth.SetValue(GetModSettingFloat("fBretonBaseHealth:Main"))
	GF01_SoR_BretonBaseStamina.SetValue(GetModSettingFloat("fBretonBaseStamina:Main"))

	GF01_SoR_DunmerBaseMagicka.SetValue(GetModSettingFloat("fDunmerBaseMagicka:Main"))
	GF01_SoR_DunmerBaseHealth.SetValue(GetModSettingFloat("fDunmerBaseHealth:Main"))
	GF01_SoR_DunmerBaseStamina.SetValue(GetModSettingFloat("fDunmerBaseStamina:Main"))

	GF01_SoR_ImperialBaseMagicka.SetValue(GetModSettingFloat("fImperialBaseMagicka:Main"))
	GF01_SoR_ImperialBaseHealth.SetValue(GetModSettingFloat("fImperialBaseHealth:Main"))
	GF01_SoR_ImperialBaseStamina.SetValue(GetModSettingFloat("fImperialBaseStamina:Main"))

	GF01_SoR_KhajiitBaseMagicka.SetValue(GetModSettingFloat("fKhajiitBaseMagicka:Main"))
	GF01_SoR_KhajiitBaseHealth.SetValue(GetModSettingFloat("fKhajiitBaseHealth:Main"))
	GF01_SoR_KhajiitBaseStamina.SetValue(GetModSettingFloat("fKhajiitBaseStamina:Main"))

	GF01_SoR_NordBaseMagicka.SetValue(GetModSettingFloat("fNordBaseMagicka:Main"))
	GF01_SoR_NordBaseHealth.SetValue(GetModSettingFloat("fNordBaseHealth:Main"))
	GF01_SoR_NordBaseStamina.SetValue(GetModSettingFloat("fNordBaseStamina:Main"))

	GF01_SoR_OrsimerBaseMagicka.SetValue(GetModSettingFloat("fOrsimerBaseMagicka:Main"))
	GF01_SoR_OrsimerBaseHealth.SetValue(GetModSettingFloat("fOrsimerBaseHealth:Main"))
	GF01_SoR_OrsimerBaseStamina.SetValue(GetModSettingFloat("fOrsimerBaseStamina:Main"))

	GF01_SoR_RedguardBaseMagicka.SetValue(GetModSettingFloat("fRedguardBaseMagicka:Main"))
	GF01_SoR_RedguardBaseHealth.SetValue(GetModSettingFloat("fRedguardBaseHealth:Main"))
	GF01_SoR_RedguardBaseStamina.SetValue(GetModSettingFloat("fRedguardBaseStamina:Main"))

	GF01_SoR_CustomRaceBaseMagicka.SetValue(GetModSettingFloat("fCustomRaceBaseMagicka:Main"))
	GF01_SoR_CustomRaceBaseHealth.SetValue(GetModSettingFloat("fCustomRaceBaseHealth:Main"))
	GF01_SoR_CustomRaceBaseStamina.SetValue(GetModSettingFloat("fCustomRaceBaseStamina:Main"))

EndEvent

Event OnSettingChange(string a_ID)
	if a_ID == "bVanillaPreset:Main"
		GF01_SoR_VanillaPreset.SetValueInt(GetModSettingBool(a_ID) as Int)

	elseif a_ID == "fAltmerBaseMagicka:Main"
		GF01_SoR_AltmerBaseMagicka.SetValue(GetModSettingFloat(a_ID))
	elseif a_ID == "fAltmerBaseHealth:Main"
		GF01_SoR_AltmerBaseHealth.SetValue(GetModSettingFloat(a_ID))
	elseif a_ID == "fAltmerBaseStamina:Main"
		GF01_SoR_AltmerBaseStamina.SetValue(GetModSettingFloat(a_ID))
	
	elseif a_ID == "fArgonianBaseMagicka:Main"
		GF01_SoR_ArgonianBaseMagicka.SetValue(GetModSettingFloat(a_ID))
	elseif a_ID == "fArgonianBaseHealth:Main"
		GF01_SoR_ArgonianBaseHealth.SetValue(GetModSettingFloat(a_ID))
	elseif a_ID == "fArgonianBaseStamina:Main"
		GF01_SoR_ArgonianBaseStamina.SetValue(GetModSettingFloat(a_ID))

	elseif a_ID == "fBosmerBaseMagicka:Main"
		GF01_SoR_BosmerBaseMagicka.SetValue(GetModSettingFloat(a_ID))
	elseif a_ID == "fBosmerBaseHealth:Main"
		GF01_SoR_BosmerBaseHealth.SetValue(GetModSettingFloat(a_ID))
	elseif a_ID == "fBosmerBaseStamina:Main"
		GF01_SoR_BosmerBaseStamina.SetValue(GetModSettingFloat(a_ID))

	elseif a_ID == "fBretonBaseMagicka:Main"
		GF01_SoR_BretonBaseMagicka.SetValue(GetModSettingFloat(a_ID))
	elseif a_ID == "fBretonBaseHealth:Main"
		GF01_SoR_BretonBaseHealth.SetValue(GetModSettingFloat(a_ID))
	elseif a_ID == "fBretonBaseStamina:Main"
		GF01_SoR_BretonBaseStamina.SetValue(GetModSettingFloat(a_ID))

	elseif a_ID == "fDunmerBaseMagicka:Main"
		GF01_SoR_DunmerBaseMagicka.SetValue(GetModSettingFloat(a_ID))
	elseif a_ID == "fDunmerBaseHealth:Main"
		GF01_SoR_DunmerBaseHealth.SetValue(GetModSettingFloat(a_ID))
	elseif a_ID == "fDunmerBaseStamina:Main"
		GF01_SoR_DunmerBaseStamina.SetValue(GetModSettingFloat(a_ID))

	elseif a_ID == "fImperialBaseMagicka:Main"
		GF01_SoR_ImperialBaseMagicka.SetValue(GetModSettingFloat(a_ID))
	elseif a_ID == "fImperialBaseHealth:Main"
		GF01_SoR_ImperialBaseHealth.SetValue(GetModSettingFloat(a_ID))
	elseif a_ID == "fImperialBaseStamina:Main"
		GF01_SoR_ImperialBaseStamina.SetValue(GetModSettingFloat(a_ID))

	elseif a_ID == "fKhajiitBaseMagicka:Main"
		GF01_SoR_KhajiitBaseMagicka.SetValue(GetModSettingFloat(a_ID))
	elseif a_ID == "fKhajiitBaseHealth:Main"
		GF01_SoR_KhajiitBaseHealth.SetValue(GetModSettingFloat(a_ID))
	elseif a_ID == "fKhajiitBaseStamina:Main"
		GF01_SoR_KhajiitBaseStamina.SetValue(GetModSettingFloat(a_ID))

	elseif a_ID == "fNordBaseMagicka:Main"
		GF01_SoR_NordBaseMagicka.SetValue(GetModSettingFloat(a_ID))
	elseif a_ID == "fNordBaseHealth:Main"
		GF01_SoR_NordBaseHealth.SetValue(GetModSettingFloat(a_ID))
	elseif a_ID == "fNordBaseStamina:Main"
		GF01_SoR_NordBaseStamina.SetValue(GetModSettingFloat(a_ID))

	elseif a_ID == "fOrsimerBaseMagicka:Main"
		GF01_SoR_OrsimerBaseMagicka.SetValue(GetModSettingFloat(a_ID))
	elseif a_ID == "fOrsimerBaseHealth:Main"
		GF01_SoR_OrsimerBaseHealth.SetValue(GetModSettingFloat(a_ID))
	elseif a_ID == "fOrsimerBaseStamina:Main"
		GF01_SoR_OrsimerBaseStamina.SetValue(GetModSettingFloat(a_ID))
	
	elseif a_ID == "fRedguardBaseMagicka:Main"
		GF01_SoR_RedguardBaseMagicka.SetValue(GetModSettingFloat(a_ID))
	elseif a_ID == "fRedguardBaseHealth:Main"
		GF01_SoR_RedguardBaseHealth.SetValue(GetModSettingFloat(a_ID))
	elseif a_ID == "fRedguardBaseStamina:Main"
		GF01_SoR_RedguardBaseStamina.SetValue(GetModSettingFloat(a_ID))

	elseif a_ID == "CustomRaceBaseMagicka:Main"
		GF01_SoR_CustomRaceBaseMagicka.SetValue(GetModSettingFloat(a_ID))
	elseif a_ID == "fCustomRaceBaseHealth:Main"
		GF01_SoR_CustomRaceBaseHealth.SetValue(GetModSettingFloat(a_ID))
	elseif a_ID == "fCustomRaceBaseStamina:Main"
		GF01_SoR_CustomRaceBaseStamina.SetValue(GetModSettingFloat(a_ID))

	 endif
EndEvent
