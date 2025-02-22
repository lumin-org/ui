-- Variables
local Types = require("./types")
local Debugger = require("../roblox_packages/debugger")

-- Functions
local function Find(instance: Instance, property: string)
	return (instance :: any)[property]
end

-- Module

--[=[
	Connects a callback to an event on the instance.

	[Open Documentation](https://lumin-org.github.io/ui/api/#event)
]=]
return function(event: string, callback: (...any) -> (), scope: { any }?): Types.Action
	return function(instance: Instance)
		local Success, Event = pcall(Find, instance :: any, event :: any) -- Ensure event exists
		local ArgType = type(callback)

		Debugger.assert(Success, "InvalidEvent", event)
		Debugger.assert(ArgType == "function", "InvalidType", "function", ArgType)

		local ToAdd = Event:Connect(callback)
		if scope then
			table.insert(scope, ToAdd)
		end
	end
end
