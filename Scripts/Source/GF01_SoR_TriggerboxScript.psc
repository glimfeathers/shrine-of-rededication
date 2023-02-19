Scriptname GF01_SoR_TriggerboxScript extends ObjectReference  
{Enables light and animation when player enters this volume.}

ObjectReference Property GF01_SoR_Activator Auto
ObjectReference Property GF01_SoR_RedLight Auto
ObjectReference Property GF01_SoR_Audio_SoundMarker Auto

Actor PlayerRef

Event OnTriggerEnter(ObjectReference akActionRef)

    PlayerRef = Game.GetPlayer()

	If akActionRef == PlayerRef
       	GF01_SoR_Activator.PlayGamebryoAnimation("Loop")
		GF01_SoR_RedLight.enable()
		GF01_SoR_Audio_SoundMarker.enable()

	EndIf

EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)

	If akActionRef == PlayerRef
       	GF01_SoR_Activator.PlayGamebryoAnimation("Stop")
    		GF01_SoR_RedLight.disable()
		GF01_SoR_Audio_SoundMarker.disable()
	EndIf

EndEvent