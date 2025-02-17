-- Variables
local Types = require("./types")
local Debugger = require("../roblox_packages/debugger")

-- Module

--[=[
	Iterates through a table and runs the iterator for each entry within the UI tree. Returning an
    instance will result in it getting parented to the parent of the action.

	[Open Documentation](https://lumin-org.github.io/ui/api/#foreach)
]=]
return function<T, U>(table: { [T]: U }, iterator: (index: T, value: U) -> Instance?): Types.Action
	return function(instance: Instance)
		for index, value in table do
			local NewInstance = iterator(index, value)
			if NewInstance then
                local NewInstanceType = typeof(NewInstance)
                Debugger.assert(NewInstanceType == "Instance", "ForEachInvalidReturn", NewInstanceType)
				NewInstance.Parent = instance
			end
		end
	end
end
