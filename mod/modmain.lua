local function prefabs_table(skiltree_prefabs)
	local prefabs = {}
	for _, name in ipairs(skiltree_prefabs) do
		prefabs[name] = true
	end
	return prefabs
end

local SKILLTREE_PREFABS = prefabs_table({
	"wilson", 
	"woodie", 
	"wolfgang", 
	"wormwood",
	"wathgrithr", 
	"willow"
})

AddPrefabPostInit("world", function(world)    
	world:ListenForEvent("playeractivated", function(world, player)
		if player == GLOBAL.ThePlayer and 
		   player.components.skilltreeupdater and
		   SKILLTREE_PREFABS[player.prefab]
		then
			CurrentRelease.PrintID()
			GLOBAL.TheGenericKV:SetKV("fuelweaver_killed", "1")
			GLOBAL.TheGenericKV:SetKV("celestialchampion_killed", "1")
			player.components.skilltreeupdater:AddSkillXP(160)
		end
	end)
end)