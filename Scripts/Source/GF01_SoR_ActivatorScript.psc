Scriptname GF01_SoR_ActivatorScript extends ObjectReference  
{Allows the player to interact with the Shrine.}

Message Property GF01_SoR_StatsMessage Auto
Message Property GF01_SoR_LoopMessage Auto
Message Property GF01_SoR_ConfirmMagickaMessage Auto
Message Property GF01_SoR_ConfirmHealthMessage Auto
Message Property GF01_SoR_ConfirmStaminaMessage Auto

Actor Property PlayerRef Auto
Race Property HighElfRace auto

 Event OnActivate(ObjectReference akActionRef)
   openMenu()
 endEvent

Function openMenu(int aiButton = 1)

	Race playerRace = PlayerRef.GetRace()
	float playerLevel =  PlayerRef.GetLevel()
	int soulsCost = Math.Ceiling(playerLevel/4.0)
	float  playerSouls =  PlayerRef.GetActorValue("DragonSouls")
	
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
		
			if playerRace == HighElfRace
				PlayerRef.SetActorValue("Magicka", 150.0)
			Else
				PlayerRef.SetActorValue("Magicka", 100.0)
			EndIf
			PlayerRef.SetActorValue("Health", 100.0)
			PlayerRef.SetActorValue("Stamina", 100.0)

			While (i < iMax)	
				openLoopMenu(2, iMax - i,  PlayerRef.GetBaseActorValue("Magicka"), playerRef.GetBaseActorValue("Health"), playerRef.GetBaseActorValue("Stamina"))
				i += 1
			EndWhile
			debug.messagebox("Attributes redistributed.")
			
			if playerRace == HighElfRace
				PlayerRef.SetActorValue("Magicka", PlayerRef.GetBaseActorValue("Magicka") - 50.0)
			EndIf

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
