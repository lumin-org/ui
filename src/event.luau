-- Variables
local Root = script.Parent
local Types = require(Root.types)
local Action = require(Root.action)
local Debugger = require(Root.Parent.roblox_packages.debugger)

-- Functions
local function Find(instance: Instance, property: string)
	return (instance :: any)[property]
end

-- Module

--[=[
	Connects a callback to an event on the instance.

	[Open Documentation](https://lumin-org.github.io/ui/api/keys/#event)
]=]
return function(event: string, callback: (...any) -> (), scope: {any}?): Types.Action
	return Action(function(instance: Instance)
		local Success, Event = pcall(Find, instance :: any, event :: any) -- Ensure event exists
		if not Success or type(callback) ~= "function" then
			Debugger.Fatal("InvalidPropOrEvent", event)
		end
		local ToAdd = Event:Connect(callback)
        if scope then
            table.insert(scope, ToAdd)
        end
	end)
end
