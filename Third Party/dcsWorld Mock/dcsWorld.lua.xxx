-- ****************************************************************************************************
--
--						dcsIndex
--
-- ****************************************************************************************************
local dcsIndex = {}

do

	function dcsIndex:new(tabSource)

		--create the metatable
		tabMeta = {__index = dcsIndex}

		--create new object
		local tabSelf = setmetatable( {}, tabMeta)

		--create the table to hold instrations
		tabMeta.tabInstructions = {}

		--if a source table was specified, set it
		if tabSource then
			rawset(tabMeta, "tabSource", tabSource)
		end

		--return the new object
		return tabSelf

	end

	function dcsIndex:add(tabParam)

		--get the metatable to store in
		local tabMeta = getmetatable(self)

		--push the instruction into the metatable
		rawset(tabMeta.tabInstructions, #tabMeta +1, tabParam)

	end

	function dcsIndex:clear()

		--get the metatable
		local tabMeta = getmetatable(self)

		--clear all instructions
		rawset(tabMeta, tabInstructions, {})

	end

	function dcsIndex:set(tabParams)

		--for each sub table (instruction)
		for k, v in pairs (tabParams) do

			--add it to the list
			self:add(v)

		end

	end

	function dcsIndex:exec(tabSource)

		--get the metatable
		local tabMeta = getmetatable(self)

		--if a new source was specified then store it
		if tabSource then
			rawset(tabMeta, "tabSource", tabSource)
		end

		--get the source table to be indexed
		local tabSrc = tabMeta.tabSource

		--if there is a valid source then
		if tabSrc then

			--clear each stored index entry (from previous use)
			for k, v in pairs(self) do
				rawset(self, k, nil)
			end

			--get the instructions
			local tabInstructions = tabMeta.tabInstructions

			--start the index iterations
			dcsIndex._index(tabSrc, tabInstructions, self)

		else

			print( "Index source table not set so execution not completed.")

		end
	end


	function dcsIndex._index(tabSource, tabInstructions, tabIndex, strDescriptor)

		--if this is the first iteration, initialise the descriptor
		local strDescParent = strDescriptor or ""

		--for each entry in the source table
		for k, v in pairs(tabSource) do

			--add the key name to the descriptor
			local strDesc = strDescParent .. ".\\." .. k

			--for each instruction
			for strName, tabVal in pairs(tabInstructions) do

				--if a parent not present or it matches the parent descriptor
				if (tabVal.parent == nil) or string.find(strDescParent, tabVal.parent) then
					--if a key not present or it matches the key name
					if (tabVal.key == nil) or string.find(k, tabVal.key) then
						--if a value not present or it matches the value (table for a table entry)
						if (tabVal.value == nil) or string.find(tostring(v), tabVal.value) then

							--index key name, number or nil to not store
							local varIndex

							--if no name for the index key specified
							if tabVal.name == nil then
								--treat as an array
								varIndex = #tabVal.table +1
							else
								--execute the callback function to fetch the name
								varIndex = tabVal.name(v)
							end

							--if a name was returned (nil prevents it being stored)
							if varIndex then

								--set the entry in the index
								rawset(tabIndex, varIndex, v)

							end
						end
					end
				end
			end

			--if this was a table then
			if type(v) == "table" then

				--call this function iteratively
				dcsIndex._index(v, tabInstructions, tabIndex, strDesc)
			end
		end
	end

end


-- ****************************************************************************************************
--
--						dcsWorld
--
-- ****************************************************************************************************

world = {}

 world.event = {
   S_EVENT_SHOT =1,
   S_EVENT_HIT =2,
   S_EVENT_TAKEOFF =3,
   S_EVENT_LAND =4,
   S_EVENT_CRASH =5,
   S_EVENT_EJECTION =6,
   S_EVENT_REFUELING =7,
   S_EVENT_DEAD =8,
   S_EVENT_PILOT_DEAD =9,
   S_EVENT_BASE_CAPTURED =10,
   S_EVENT_MISSION_START =11,
   S_EVENT_MISSION_END =12,
   S_EVENT_TOOK_CONTROL =13,
   S_EVENT_REFUELING_STOP =14,
   S_EVENT_BIRTH =15,
   S_EVENT_HUMAN_FAILURE =16,
   S_EVENT_ENGINE_STARTUP =17,
   S_EVENT_ENGINE_SHUTDOWN =18,
   S_EVENT_PLAYER_ENTER_UNIT =19,
   S_EVENT_PLAYER_LEAVE_UNIT =20,
   S_EVENT_PLAYER_COMMENT =21,
   S_EVENT_SHOOTING_START =22,
   S_EVENT_SHOOTING_END =23,
   S_EVENT_MAX =24
 }

function world.getAirbases()

	return {

		{getName = function() return "name1" end},
		{getName = function() return "name2" end},
		{getName = function() return "name3" end},
	}

end

Weapon = {}

Weapon.Category = {
   SHELL,
   MISSILE,
   ROCKET,
   BOMB
}

 Weapon.GuidanceType = {
   INS,
   IR,
   RADAR_ACTIVE,
   RADAR_SEMI_ACTIVE,
   RADAR_PASSIVE,
   TV,
   LASER,
   TELE
 }

 Weapon.MissileCategory = {
   AAM,
   SAM,
   BM,
   ANTI_SHIP,
   CRUISE,
   OTHER
 }

 Weapon.WarheadType = {
   AP,
   HE,
   SHAPED_EXPLOSIVE
 }




function world.addEventHandler()
end

function world.removeEventHandler()
end



env = {}

env.mission = mission
function env.info(str)

	print("IMFO", str)

end

function env.warning(str)

	print("WARN", str)

end

function env.error(str)

	print("ERROR", str)

end


timer = {}

function timer.getTime()
	return os.time()
end

function timer.getAbsTime()
	return 4206
end

function timer.scheduleFunction(functionToCall, functionArgument, numTime)

	local ret

	if dcsW.schedule == nil then
		dcsW.schedule = {}
	end

	table.insert(dcsW.schedule, {funCall = functionToCall, tabArg = functionArgument, numTime = (numTime or timer.getTime())})

	return #dcsW.schedule

end

function timer.removeFunction(functionID)

	local ret

	if dcsW.schedule == nil then
		dcsW.schedule = {}
	end

	table.remove(dcsW.schedule, functionID)

	return #dcsW.schedule

end

function timer.setFunctionTime()
end


Group = {}
Group.__index = Group

Group.Category = {
	AIRPLANE = 0,
	HELICOPTER = 1,
	GROUND = 2,
	SHIP = 3
}


function Group.getByName(strGroupName)

	local tabRet = nil

	for k, v in pairs(dcsW.index.groups) do

		if strGroupName == k then

			tabRet = setmetatable({}, Group)

			tabRet.id_ = dcsW.index.groups[strGroupName].groupId
			tabRet.name_ = strGroupName

		end

	end

	return tabRet

end

function Group:getName()

	return self.name_

end

function Group:getCategory()
	return 1
end

function Group:getUnits()
print(self.name_)
	local tabG = dcsW.index.groups[self.name_]

	local tabU = tabG.units

	local tabRet = {}

	for k, v in pairs(tabU) do

		table.insert(tabRet, Unit.getByName(tabU.name))

	end

	return tabRet

end

function Group:getController()
	return {setTask = function() end}
end

Unit = {}
Unit.__index = Unit

function Unit.getByName(strUnitName)

	local tabRet = nil

	for k, v in pairs(dcsW.index.units) do

		if strGroupName == k then

			tabRet = setmetatable({}, Unit)

			tabRet.id_ = dcsW.index.groups[strUnitName].unitId
			tabRet.name_ = strUnitName

		end

	end

	return tabRet

end




 coalition = {}

 coalition.side = {
   NEUTRAL=0,
   RED=1,
   BLUE=2
 }

function coalition.getGroups()
	return {}
end

function coalition.addGroup(country, category, prototype)
	return {getName = function(self) return prototype.name end}
end


trigger = {}
trigger.misc = {}
trigger.action = {}

function trigger.misc.getUserFlag ()

	return 1

end

function trigger.misc.getZone(strZone)

	local tabReturn

	tabReturn = {}
	tabReturn.point = {}
	tabReturn.point.x = 1000
	tabReturn.point.z = 2000

	return tabReturn

end

function trigger.action.outText(strText, intDuration)

	if intDuration == nil then
		error("Missing duration from outText")
	end

	print (strText)

end

missionCommands =
{
	addCommand = function() end,
	removeItem = function() end,
	addSubMenu = function(strName, strPath) return (strPath or "") .. "\\" .. strName end,

}
-- ****************************************************************************************************
--
--						dcsWorld MAIN
--
-- ****************************************************************************************************

dcsW = {}

function dcsW.main(numTime)

	numTime = numTime or 10

	local boolEnd
	local numEnd = timer.getTime() + numTime
	local numLast = 0
	local numNow

	repeat

		--get the time
		numNow = timer.getTime()

		--report the time
		if numNow > numLast then
			print("dcs.main", numNow)
			numLast = numNow
		end

		--check the schedule
		for intUID, tabSc in pairs(dcs.schedule) do

			if tabSc.numTime and (tabSc.numTime <numNow) then

				print("dcs.main", "calling", intUID, tabSc.funCall, tabSc.tabArg)

				tabSc.numTime = tabSc.funCall(tabSc.tabArg)

				print("dcs.main", "returned", tabSc.numTime)

			end
		end

	until (numNow > numEnd) or boolEnd

end


-- ****************************************************************************************************
--
--						dcsWorld INITIALISATION
--
-- ****************************************************************************************************


do
	env.mission = mission

	if env.mission == nil then
		print("*** Warning, no mission loaded ***")
	end

	dcsW.index = {}

	--create groups index
	dcsW.index.groups = dcsIndex:new(env.mission)
	dcsW.index.groups:add(
		{
			["parent"] = "coalition.*group$",
			["key"] = "%d*",
			["value"] = "table",
			["name"] = function(tabVal)

				return tabVal.name or nil

			end
		}
	)

	dcsW.index.groups:exec()

		--create units index
	dcsW.index.units = dcsIndex:new(env.mission)
	dcsW.index.units:add(
		{
			["parent"] = "coalition.*units$",
			["key"] = "%d*",
			["value"] = "table",
			["name"] = function(tabVal)

				return tabVal.name or nil

			end
		}
	)
	dcsW.index.units:exec()

end

