local function SpawnRedBVR_Directional(direction)
    if math.random(0, 1) == 1 then
        SPAWN:NewWithAlias("BVR Red FIGHT Mig29 Spawn " .. direction, "BVR Red FIGHT Mig29 Spawn N" .. math.random( 10000, 99999 ) )
            :Spawn()
    else
        SPAWN:NewWithAlias("BVR Red FIGHT Flanker Spawn " .. direction, "BVR Red FIGHT Flanker Spawn N" .. math.random( 10000, 99999 ) )
            :Spawn()
    end
end

local function SpawnRedBVR_North()
    SpawnRedBVR_Directional("N")
end
local function SpawnRedBVR_South()
    SpawnRedBVR_Directional("S")
end
local function SpawnRedBVR_East()
    SpawnRedBVR_Directional("E")
end
local function SpawnRedBVR_West()
    SpawnRedBVR_Directional("W")
end
local function SpawnRedBVR_Center()
    SpawnRedBVR_Directional("C")
end
local function SpawnRedBVR_Random()
    local random = math.random(0, 4)
    if random == 0 then
        SpawnRedBVR_Directional("N")
    elseif random == 1 then
        SpawnRedBVR_Directional("S")
    elseif random == 2 then
        SpawnRedBVR_Directional("E")
    elseif random == 3 then
        SpawnRedBVR_Directional("W")
    else
        SpawnRedBVR_Directional("C")
    end
end
local function SpawnRedBVR_RandomTwo()
    local random = math.random(0, 4)
    if random == 0 then
        SpawnRedBVR_Directional("N")
        SpawnRedBVR_Directional("N")
    elseif random == 1 then
        SpawnRedBVR_Directional("S")
        SpawnRedBVR_Directional("S")
    elseif random == 2 then
        SpawnRedBVR_Directional("E")
        SpawnRedBVR_Directional("E")
    elseif random == 3 then
        SpawnRedBVR_Directional("W")
        SpawnRedBVR_Directional("W")
    else
        SpawnRedBVR_Directional("C")
        SpawnRedBVR_Directional("C")
    end
end
local function SpawnRedBVR_RandomThree()
    local random = math.random(0, 4)
    if random == 0 then
        SpawnRedBVR_Directional("N")
        SpawnRedBVR_Directional("N")
        SpawnRedBVR_Directional("N")
    elseif random == 1 then
        SpawnRedBVR_Directional("S")
        SpawnRedBVR_Directional("S")
        SpawnRedBVR_Directional("S")
    elseif random == 2 then
        SpawnRedBVR_Directional("E")
        SpawnRedBVR_Directional("E")
        SpawnRedBVR_Directional("E")
    elseif random == 3 then
        SpawnRedBVR_Directional("W")
        SpawnRedBVR_Directional("W")
        SpawnRedBVR_Directional("W")
    else
        SpawnRedBVR_Directional("C")
        SpawnRedBVR_Directional("C")
        SpawnRedBVR_Directional("C")
    end
end

MENU_COALITION_COMMAND:New( coalition.side.BLUE, "BVR North", nil, SpawnRedBVR_North )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "BVR South", nil, SpawnRedBVR_South )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "BVR East", nil, SpawnRedBVR_East )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "BVR West", nil, SpawnRedBVR_West )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "BVR Center", nil, SpawnRedBVR_Center )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "BVR Random", nil, SpawnRedBVR_Random )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "BVR Random x2", nil, SpawnRedBVR_RandomTwo )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "BVR Random x3", nil, SpawnRedBVR_RandomThree )
