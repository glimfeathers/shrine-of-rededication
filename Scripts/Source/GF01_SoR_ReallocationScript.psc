Scriptname GF01_SoR_ReallocationScript extends ObjectReference  
{Allows the player to interact with the Shrine.}

GlobalVariable Property GF01_SoR_VanillaPreset Auto
GlobalVariable Property GF01_SoR_EnableAnimation Auto
GlobalVariable Property GF01_SoR_BaseMagicka Auto
GlobalVariable Property GF01_SoR_BaseHealth Auto
GlobalVariable Property GF01_SoR_BaseStamina Auto
GlobalVariable Property GF01_SoR_BaseCarryWeight Auto

Message Property GF01_SoR_StatsMessage Auto
Message Property GF01_SoR_LoopMessage Auto
Message Property GF01_SoR_ConfirmMagickaMessage Auto
Message Property GF01_SoR_ConfirmHealthMessage Auto
Message Property GF01_SoR_ConfirmStaminaMessage Auto

Idle Property IdlePray Auto
Idle Property IdleStop_Loose Auto

Actor Property PlayerRef Auto

Function startAnimation()
	if PlayerRef.GetAnimationVariableInt("i1stPerson") == 1
		Game.ForceThirdPerson()
	endIf
	PlayerRef.PlayIdle(IdlePray)
endFunction

Function endAnimation()
	if PlayerRef.GetAnimationVariableInt("i1stPerson") == 1
		Game.ForceFirstPerson()	
	endIf
	PlayerRef.PlayIdle(IdleStop_Loose)
endFunction


Function resetAttributes(float rM, float rH, float rS, float cW)
	PlayerRef.SetActorValue("Magicka", rM)
	PlayerRef.SetActorValue("Health", rH)
	PlayerRef.SetActorValue("Stamina", rS)
	PlayerRef.SetActorValue("CarryWeight", cW)
endFunction

 Event OnActivate(ObjectReference akActionRef)
   openMenu()
 endEvent

Function openMenu(int aiButton = 1)

	Race playerRace = PlayerRef.GetRace()
	float playerLevel =  PlayerRef.GetLevel()
	int soulsCost = Math.Ceiling(playerLevel/4.0)
	float  playerSouls =  PlayerRef.GetActorValue("DragonSouls")
	bool isVanilla =  GF01_SoR_VanillaPreset.GetValue() as Bool
	bool playAnim =  GF01_SoR_EnableAnimation.GetValue() as Bool

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

			if isVanilla == 1.0
				resetAttributes(100.0, 100.0, 100.0, 300.0)
			else				
				resetAttributes(GF01_SoR_BaseMagicka.GetValueInt() as Float,  GF01_SoR_BaseHealth.GetValueInt() as Float , GF01_SoR_BaseStamina.GetValueInt() as Float, GF01_SoR_BaseCarryWeight.GetValueInt() as Float)	
			endIf			
	
			if playAnim == 1.0
				startAnimation()
				Utility.Wait(4.5)
			endIf	
		
			While (i < iMax)	
				openLoopMenu(2, iMax - i,  PlayerRef.GetBaseActorValue("Magicka"), playerRef.GetBaseActorValue("Health"), playerRef.GetBaseActorValue("Stamina"), playerRef.GetBaseActorValue("CarryWeight"))
				i += 1
			EndWhile

			Utility.Wait(0.5)

			debug.messagebox("Attributes redistributed.")
			
			if playAnim == 1.0
				endAnimation()
			endIf		

			EndIf
	EndIf

endFunction

Function openLoopMenu(int aiButton, float iM, float pM, float pH, float pS, float cW)
						
	aiButton = GF01_SoR_LoopMessage.show(iM, pM, pH, pS)

	if aiButton == 0
		openMagickaConfirmation(1, iM, pM, pH, pS, cW)
	ElseIf aiButton == 1 
		openHealthConfirmation(1,  iM, pM, pH, pS, cW)
	ElseIf aiButton == 2
		openStaminaConfirmation(1, iM, pM, pH, pS, cW)
	EndIf
endFunction


Function openMagickaConfirmation(int aiButton, float index, float pM, float pH, float pS, float cW)

	aiButton = GF01_SoR_ConfirmMagickaMessage.show()
		
	if aiButton == 1 
		openLoopMenu(2, index, pM, pH, pS, cW)			
	ElseIf aiButton == 0
		PlayerRef.SetActorValue("Magicka", pM + 10)
	endIf
endFunction

Function openHealthConfirmation(int aiButton,  float index, float pM, float pH, float pS, float cW)

	aiButton =GF01_SoR_ConfirmHealthMessage.show()
		
	if aiButton == 1 
		openLoopMenu(2, index, pM, pH, pS, cW)
	ElseIf aiButton == 0
		PlayerRef.SetActorValue("Health", pH + 10)
	endIf
endFunction

Function openStaminaConfirmation(int aiButton,  float index, float pM, float pH, float pS, float cW)

	aiButton =GF01_SoR_ConfirmStaminaMessage.show()
	
	if aiButton == 1 
		openLoopMenu(2, index, pM, pH, pS, cW)		
	ElseIf aiButton == 0
		PlayerRef.SetActorValue("Stamina", pS + 10)
		PlayerRef.SetActorValue("CarryWeight", cW + 5)
	endIf
endFunction