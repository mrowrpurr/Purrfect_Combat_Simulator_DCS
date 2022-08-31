local SpawnZone = ZONE:New( "Spawn Zone" )

local RedGroupCount = 4
local RedGroupNames = { "Spawn Red F18", "Spawn Red F16", "Spawn Red Mig29", "Spawn Red Su33" }

local BlueGroupCount = 2
local BlueGroupNames = { "Spawn Blue F18", "Spawn Blue F16" }

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

MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Spawn Bogey", nil, SpawnAny )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Spawn Hostile", nil, SpawnRed )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Spawn Friendly", nil, SpawnBlue )
MENU_COALITION_COMMAND:New( coalition.side.RED, "Spawn Bogey", nil, SpawnAny )
MENU_COALITION_COMMAND:New( coalition.side.RED, "Spawn Hostile", nil, SpawnBlue )
MENU_COALITION_COMMAND:New( coalition.side.RED, "Spawn Friendly", nil, SpawnRed )
