local SKILLTREE_PREFABS = {
	wilson = true,
	woodie = true,
	wolfgang = true,
	wormwood = true
}

local SKILLTREE_PREFABS_BETA = {
	wathgrithr = true,
	willow = true
}

AddPrefabPostInit("world", function(world)    
	world:ListenForEvent("playeractivated", function(world, player)
		if player == GLOBAL.ThePlayer and 
		   player.components.skilltreeupdater and
		   (SKILLTREE_PREFABS[player.prefab] or
		   (CurrentRelease.GreaterOrEqualTo("R32_ST_WATHGRITHRWILLOW") and 
		   SKILLTREE_PREFABS_BETA[player.prefab])) 
		then
			CurrentRelease.PrintID()
			GLOBAL.TheGenericKV:SetKV("fuelweaver_killed", "1")
			GLOBAL.TheGenericKV:SetKV("celestialchampion_killed", "1")
			player.components.skilltreeupdater:AddSkillXP(160)
		end
	end)
end)