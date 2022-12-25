local SpawnZone = ZONE:New( "Spawn Zone" )

local RedGroupCount = 4
local RedGroupNames = { "Spawn Red F18", "Spawn Red F16", "Spawn Red Mig29", "Spawn Red Su33" }

local BlueGroupCount = 2
local BlueGroupNames = { "Spawn Blue F18", "Spawn Blue F16" }

local RedBVRGroupCount = 3
local RedBVRGroups = { "BVR Red FIGHT F14 Spawn", "BVR Red FIGHT F14 Spawn", "BVR Red FIGHT F14 Spawn" }
-- local RedBVRGroups = { "BVR Red FIGHT F14 Spawn", "BVR Red FIGHT F16 Spawn", "BVR Red FIGHT F18 Spawn" }

local RedBFMGroupCount = 3
local RedBFMGroups = { "FIGHT Red F14 Spawn", "FIGHT Red F16 Spawn", "FIGHT Red F18 Spawn" }

local function SpawnRed()
    local groupName = RedGroupNames[math.random(1, RedGroupCount)]
    env.info("SPAWN " .. groupName)
    SPAWN:NewWithAlias( groupName, "Red Spawn " .. math.random( 10000, 99999 ) )
        :InitRandomizeRoute( 0, 0, 18520, 8534 )
        :SpawnInZone( SpawnZone, true, 1524, 9753 )
end

local function SpawnBlue()
    local groupName = BlueGroupNames[math.random(1, BlueGroupCount)]
    env.info("SPAWN " .. groupName)
    SPAWN:NewWithAlias( groupName, "Blue Spawn " .. math.random( 10000, 99999 ) )
        :InitRandomizeRoute( 0, 0, 18520, 8534 )
        :SpawnInZone( SpawnZone, true, 1524, 9753 )
end

local function SpawnAny()
    if math.random( 1, 2 ) == 1 then
        SpawnRed()
    else
        SpawnBlue()
    end
end

local function SpawnRedBVR()
    local groupName = RedBVRGroups[math.random(1, RedBVRGroupCount)]
    env.info("SPAWN " .. groupName)
    SPAWN:NewWithAlias( groupName, "Red BVR Spawn " .. math.random( 10000, 99999 ) )
        :Spawn()
end

local function SpawnRedBFM()
    local groupName = RedBFMGroups[math.random(1, RedBFMGroupCount)]
    env.info("SPAWN " .. groupName)
    SPAWN:NewWithAlias( groupName, "Red BFM Spawn " .. math.random( 10000, 99999 ) )
        :Spawn()
end

MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Spawn Bogey", nil, SpawnAny )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Spawn Hostile", nil, SpawnRed )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Spawn Friendly", nil, SpawnBlue )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Spawn BVR Slot", nil, SpawnRedBVR )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Spawn BFM Slot", nil, SpawnRedBFM )

MENU_COALITION_COMMAND:New( coalition.side.RED, "Spawn Bogey", nil, SpawnAny )
MENU_COALITION_COMMAND:New( coalition.side.RED, "Spawn Hostile", nil, SpawnBlue )
MENU_COALITION_COMMAND:New( coalition.side.RED, "Spawn Friendly", nil, SpawnRed )
