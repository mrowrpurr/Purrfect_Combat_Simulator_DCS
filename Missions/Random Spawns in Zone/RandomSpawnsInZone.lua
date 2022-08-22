local ZONE_NAME = "Spawn Zone";
local ZONE_GROUP_NAMES = { "MIG29", "F18" }

local DOGFIGHT_GROUP_NAMES = { "F18 - Dogfight", "MIG29 - Dogfight" }

local SpawnZone = ZONE:New( ZONE_NAME )

local function SpawnHostile()
    local groupName = ZONE_GROUP_NAMES[math.random(1, 2)]
    env.info( "SPAWN " .. groupName )

    SPAWN:NewWithAlias( groupName, "Bad Guy " .. math.random(10000, 99999) )
        :InitRandomizeRoute(0, 5, 15000)
        :SpawnInZone(SpawnZone, true, 500, 6096)
end

local function SpawnDogfight()
    local groupName = DOGFIGHT_GROUP_NAMES[math.random(1, 2)]
    env.info( "SPAWN " .. groupName )

    SPAWN:NewWithAlias( groupName, "Bad Guy " .. math.random(10000, 99999) )
        :Spawn()
end

MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Spawn in Zone", nil, SpawnHostile )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Spawn Dogfight", nil, SpawnDogfight )
