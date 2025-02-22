-- Variables
local Types = require("./types")
local Debugger = require("../roblox_packages/debugger")
local Is = require("./is")

-- Functions

local function Iterate<T, U>(iterator: (index: T, value: U) -> Instance?, tbl: { [T]: U }, instance: Instance)
	for index, value in tbl do
		local NewInstance = iterator(index, value)
		if NewInstance then
			local NewInstanceType = typeof(NewInstance)
			Debugger.assert(NewInstanceType == "Instance", "ForEachInvalidReturn", NewInstanceType)
			NewInstance.Parent = instance
		end
	end
end

-- Module

--[=[
	Iterates through a table and runs the iterator for each entry within the UI tree. Returning an
    instance will result in it getting parented to the parent of the action.

	[Open Documentation](https://lumin-org.github.io/ui/api/#foreach)
]=]
return function<T, U>(table: { [T]: U } | Types.State<{ [T]: U }>, iterator: (index: T, value: U) -> Instance?): Types.Action
	return function(instance: Instance)
		if Is(table) == "State" then
			local table = table :: Types.State<{ [T]: U }>
			Iterate(iterator, table:Get(), instance)
			table:Listen(function(new) -- Re-run iterator if table changes
				Iterate(iterator, new, instance)
			end)
			return
		end
		Iterate(iterator, table, instance)
	end
end
