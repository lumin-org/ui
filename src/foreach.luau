-- Variables
local Types = require("./types")
local Debugger = require("../roblox_packages/debugger")
local Is = require("./is")

-- Module

--[=[
	Iterates through a table and runs the iterator for each entry within the UI tree. Returning an
    instance will result in it getting parented to the parent of the action.

	[Open Documentation](https://lumin-org.github.io/ui/api/#foreach)
]=]
return function<T, U>(table: { [T]: U } | Types.State<{ [T]: U }>, iterator: (index: T, value: U) -> Instance?): Types.Action
	return function(instance: Instance)
		local TableToIterate = table
		local TableType = Is(table)
		Debugger.assert(TableType == "table" or TableType == "State", "InvalidType", "table", TableType)

		if TableType == "State" then
			-- Get value of State, if it is one
			TableToIterate = (table :: any)();
			(table :: any):Listen(function(changed: { [T]: U })
				for index, value in changed do
					local NewInstance = iterator(index, value)
					if NewInstance then
						local NewInstanceType = typeof(NewInstance)
						Debugger.assert(NewInstanceType == "Instance", "ForEachInvalidReturn", NewInstanceType)
						NewInstance.Parent = instance
					end
				end
			end)
		end

		for index, value in TableToIterate do
			local NewInstance = iterator(index, value)
			if NewInstance then
				local NewInstanceType = typeof(NewInstance)
				Debugger.assert(NewInstanceType == "Instance", "ForEachInvalidReturn", NewInstanceType)
				NewInstance.Parent = instance
			end
		end
	end
end
