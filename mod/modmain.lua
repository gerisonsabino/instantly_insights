local SKILLTREE_VALID_PREFABS = {
	wilson = true,
	woodie = true,
	wolfgang = true,
	wormwood = true
}

AddPrefabPostInit("world", function(world)    
	world:ListenForEvent("playeractivated", function(world, player)
		if player == GLOBAL.ThePlayer and 
		   player.components.skilltreeupdater and
		   SKILLTREE_VALID_PREFABS[player.prefab]
		then
			CurrentRelease.PrintID()
			
			if player.prefab == "wilson" or 
			   CurrentRelease.GreaterOrEqualTo("R30_ST_WOODWOLFWORM")
			then
				GLOBAL.TheGenericKV:SetKV("fuelweaver_killed", "1")
				GLOBAL.TheGenericKV:SetKV("celestialchampion_killed", "1")
				player.components.skilltreeupdater:AddSkillXP(160)
			end
		end   
	end)
end)