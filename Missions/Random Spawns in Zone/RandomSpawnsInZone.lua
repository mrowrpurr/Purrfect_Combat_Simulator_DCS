local ZONE_NAME = "Spawn Zone";
local GROUP_NAMES = { "Spitfire", "MIG29", "F1", "SU25", "MIG29", "F1", "SU25" }

local SpawnZone = ZONE:New( ZONE_NAME )

local function SpawnHostile()
    local groupName = GROUP_NAMES[math.random(1, 7)]
    env.info( "SPAWN " .. groupName )

    SPAWN:NewWithAlias( groupName, "Bad Guy " .. math.random(10000, 99999) )
        :SpawnInZone(SpawnZone, true, 500, 20000)
end

MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Spawn Hostile", nil, SpawnHostile )
