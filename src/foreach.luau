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
return function<T, U>(
	tbl: Types.State<{ [T]: U }> | Types.Compute<{ [T]: U }>,
	iterator: (index: T, value: U) -> Instance?
): Types.Action
	return function(instance: Instance)
		local StateType = Is(tbl)
		Debugger.assert(StateType == "State", "InvalidType", "state", StateType)
		local ValueType = Is((tbl :: any)())
		Debugger.assert(ValueType == "table", "InvalidType", "table", ValueType)

		for index, value in tbl do
			local NewInstance = iterator(index, value)
			if NewInstance then
				NewInstance.Parent = instance
			end
		end
	end
end
