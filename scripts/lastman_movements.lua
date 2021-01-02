local lastmanMovement = MoveEvent()
function lastmanMovement.onStepIn(creature, item, position, fromPosition)
	if not creature:isPlayer() then	return true end
	if item.actionid == 4502 then
		if not TheLastMan:onJoin(creature) then
			creature:teleportTo(fromPosition)
			creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
	elseif item.actionid == 4503 then
		creature:teleportTo(fromPosition)
		creature:sendCancelMessage("Voc� n�o pode andar em pisos que j� explodiram.")
	end
	return true
end
lastmanMovement:type("stepin")
lastmanMovement:aid(4502, 4503)
lastmanMovement:register()