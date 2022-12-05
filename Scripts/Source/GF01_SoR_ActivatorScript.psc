Scriptname GF01_SoR_ActivatorScript extends ObjectReference  
{Allows the player to interact with the Shrine.}

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

GlobalVariable Property GF01_SoR_VanillaPreset Auto

Message Property GF01_SoR_StatsMessage Auto
Message Property GF01_SoR_LoopMessage Auto
Message Property GF01_SoR_ConfirmMagickaMessage Auto
Message Property GF01_SoR_ConfirmHealthMessage Auto
Message Property GF01_SoR_ConfirmStaminaMessage Auto

Actor Property PlayerRef Auto

Race Property HighElfRace Auto
Race Property ArgonianRace Auto
Race Property WoodElfRace Auto
Race Property BretonRace Auto
Race Property DarkElfRace Auto
Race Property ImperialRace Auto
Race Property KhajiitRace Auto
Race Property NordRace Auto
Race Property OrcRace Auto
Race Property RedguardRace Auto

Race Property HighElfRaceVampire Auto
Race Property ArgonianRaceVampire Auto
Race Property WoodElfRaceVampire Auto
Race Property BretonRaceVampire Auto
Race Property DarkElfRaceVampire Auto
Race Property ImperialRaceVampire Auto
Race Property KhajiitRaceVampire Auto
Race Property NordRaceVampire Auto
Race Property OrcRaceVampire Auto
Race Property RedguardRaceVampire Auto

 Event OnActivate(ObjectReference akActionRef)
   openMenu()
 endEvent

Function resetAttributes(float rM, float rH, float rS)
	PlayerRef.SetActorValue("Magicka", rM)
	PlayerRef.SetActorValue("Health", rH)
	PlayerRef.SetActorValue("Stamina", rS)
endFunction

Function openMenu(int aiButton = 1)

	Race playerRace = PlayerRef.GetRace()
	float playerLevel =  PlayerRef.GetLevel()
	int soulsCost = Math.Ceiling(playerLevel/4.0)
	float  playerSouls =  PlayerRef.GetActorValue("DragonSouls")
	bool isVanilla =  GF01_SoR_VanillaPreset.GetValue() as Bool
	
	if playerLevel > 1
		aiButton = GF01_SoR_StatsMessage.show(soulsCost)
	endIf

	if aiButton == 1 

	ElseIf aiButton == 0
		
		if playerSouls < soulsCost 
			debug.messagebox("You don't have enough Dragon Souls.")
		Else
			float i = 0
			float iMax = playerLevel - 1
						
			PlayerRef.ForceActorValue("DragonSouls", playerSouls - SoulsCost )

			if isVanilla
				resetAttributes(100.0, 100.0, 100.0)
	
			elseif playerRace == HighElfRace ||  playerRace == HighElfRaceVampire
				resetAttributes(GF01_SoR_AltmerBaseMagicka.GetValueInt() as Float,  GF01_SoR_AltmerBaseHealth.GetValueInt() as Float , GF01_SoR_AltmerBaseStamina.GetValueInt() as Float)

			elseif playerRace == ArgonianRace ||  playerRace == ArgonianRaceVampire
				resetAttributes(GF01_SoR_ArgonianBaseMagicka.GetValueInt() as Float,  GF01_SoR_ArgonianBaseHealth.GetValueInt() as Float , GF01_SoR_ArgonianBaseStamina.GetValueInt() as Float)
				
			elseif playerRace == WoodElfRace ||  playerRace == WoodElfRaceVampire
				resetAttributes(GF01_SoR_BosmerBaseMagicka.GetValueInt() as Float,  GF01_SoR_BosmerBaseHealth.GetValueInt() as Float , GF01_SoR_BosmerBaseStamina.GetValueInt() as Float)
			
			elseif playerRace == BretonRace ||  playerRace == BretonRaceVampire
				resetAttributes(GF01_SoR_BretonBaseMagicka.GetValueInt() as Float,  GF01_SoR_BretonBaseHealth.GetValueInt() as Float , GF01_SoR_BretonBaseStamina.GetValueInt() as Float)
				
			elseif playerRace == DarkElfRace ||  playerRace == DarkElfRaceVampire
				resetAttributes(GF01_SoR_DunmerBaseMagicka.GetValueInt() as Float,  GF01_SoR_DunmerBaseHealth.GetValueInt() as Float , GF01_SoR_DunmerBaseStamina.GetValueInt() as Float)
	
			elseif playerRace == ImperialRace ||  playerRace == ImperialRaceVampire
				resetAttributes(GF01_SoR_ImperialBaseMagicka.GetValueInt() as Float,  GF01_SoR_ImperialBaseHealth.GetValueInt() as Float , GF01_SoR_ImperialBaseStamina.GetValueInt() as Float)
			
			elseif playerRace == KhajiitRace ||  playerRace == KhajiitRaceVampire
				resetAttributes(GF01_SoR_KhajiitBaseMagicka.GetValueInt() as Float,  GF01_SoR_KhajiitBaseHealth.GetValueInt() as Float , GF01_SoR_KhajiitBaseStamina.GetValueInt() as Float)
				
			elseif playerRace == NordRace ||  playerRace == NordRaceVampire
				resetAttributes(GF01_SoR_NordBaseMagicka.GetValueInt() as Float,  GF01_SoR_NordBaseHealth.GetValueInt() as Float , GF01_SoR_NordBaseStamina.GetValueInt() as Float)

			elseif playerRace == OrcRace ||  playerRace == OrcRaceVampire
				resetAttributes(GF01_SoR_OrsimerBaseMagicka.GetValueInt() as Float,  GF01_SoR_OrsimerBaseHealth.GetValueInt() as Float , GF01_SoR_OrsimerBaseStamina.GetValueInt() as Float)
			
			elseif playerRace == RedguardRace ||  playerRace == RedguardRaceVampire
				resetAttributes(GF01_SoR_RedguardBaseMagicka.GetValueInt() as Float,  GF01_SoR_RedguardBaseHealth.GetValueInt() as Float , GF01_SoR_RedguardBaseStamina.GetValueInt() as Float)
			else 			
				resetAttributes(GF01_SoR_CustomRaceBaseMagicka.GetValueInt() as Float,  GF01_SoR_CustomRaceBaseHealth.GetValueInt() as Float , GF01_SoR_CustomRaceBaseStamina.GetValueInt() as Float)
			EndIf

			While (i < iMax)	
				openLoopMenu(2, iMax - i,  PlayerRef.GetBaseActorValue("Magicka"), playerRef.GetBaseActorValue("Health"), playerRef.GetBaseActorValue("Stamina"))
				i += 1
			EndWhile
			debug.messagebox("Attributes redistributed.")
		EndIf
	EndIf

endFunction

Function openLoopMenu(int aiButton, float iM, float pM, float pH, float pS)
						
	aiButton = GF01_SoR_LoopMessage.show(iM, pM, pH, pS)

	if aiButton == 0
		openMagickaConfirmation(1, iM, pM, pH, pS)
	ElseIf aiButton == 1 
		openHealthConfirmation(1,  iM, pM, pH, pS)
	ElseIf aiButton == 2
		openStaminaConfirmation(1, iM, pM, pH, pS)
	EndIf
endFunction


Function openMagickaConfirmation(int aiButton, float index, float pM, float pH, float pS)

	aiButton = GF01_SoR_ConfirmMagickaMessage.show()
		
	if aiButton == 1 
		openLoopMenu(2, index, pM, pH, pS)			
	ElseIf aiButton == 0
		PlayerRef.SetActorValue("Magicka", pM + 10)
	endIf
endFunction

Function openHealthConfirmation(int aiButton,  float index, float pM, float pH, float pS)

	
	aiButton =GF01_SoR_ConfirmHealthMessage.show()
		
	if aiButton == 1 
		openLoopMenu(2, index, pM, pH, pS)
	ElseIf aiButton == 0
		PlayerRef.SetActorValue("Health", pH + 10)
	endIf
endFunction

Function openStaminaConfirmation(int aiButton,  float index, float pM, float pH, float pS)

	aiButton =GF01_SoR_ConfirmStaminaMessage.show()
	
	if aiButton == 1 
		openLoopMenu(2, index, pM, pH, pS)		
	ElseIf aiButton == 0
		PlayerRef.SetActorValue("Stamina", pS + 10)
	endIf
endFunction
