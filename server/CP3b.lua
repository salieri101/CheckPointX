function PlayerChat(args)
	if args.text == "/spawncp1" then
		-- Spawn a checkpoint at the player.
		Checkpoint.Create(args.player:GetPosition())
		return false
	end
	return true
end
 
Events:Subscribe("PlayerChat", PlayerChat)

function PlayerChat(args)
	local words = args.text:split(" ")
 
	if words[1] == "/spawncp2" then
		if words[2] then
			local spawnArgs = {}
			spawnArgs.enabled = true
			spawnArgs.position = args.player:GetPosition()
			spawnArgs.type = tonumber(words[2])
			spawnArgs.world = args.player:GetWorld()
 
			Checkpoint.Create(spawnArgs)
		else
			args.player:SendChatMessage("Use: /spawn type", Color(200, 100, 100))
		end
 
		return false
	end
 
	return true
end
 
Events:Subscribe("PlayerChat", PlayerChat)