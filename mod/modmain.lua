AddPrefabPostInit("world", function(world)    
	world:ListenForEvent("playeractivated", function(world, player)        
		if player == GLOBAL.ThePlayer and player.components.skilltreeupdater and player.prefab == "wilson" then
			GLOBAL.TheGenericKV:SetKV("fuelweaver_killed", "1")
			player.components.skilltreeupdater:AddSkillXP(160)
		end    
	end)
end)