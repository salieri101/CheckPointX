function PlayerChat(args)
	if args.text == "/spcp1" then
		-- Spawn a checkpoint at the player.
		Checkpoint.Create(args.player:GetPosition())
		return false
	end
	return true
end
 
Events:Subscribe("PlayerChat", PlayerChat)