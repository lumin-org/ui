-- Variables
local Root = script.Parent
local Action = require(Root.action)
local Types = require(Root.types)
local Debugger = require(Root.Parent.roblox_packages.debugger)

-- Module

--[=[
	Allows you to observe changes of properties within an object, and supplies the value of
    the changed property as a callback argument.

	[Open Documentation](https://lumin-org.github.io/ui/api/#changed)
]=]
return function<T>(prop: string, callback: (changed: T) -> (), scope: {any}?): Types.Action
	return Action(function(instance)
		local Success, Event = pcall(instance.GetPropertyChangedSignal, instance :: any, prop :: any) -- Ensure prop exists
		if not Success or type(callback) ~= "function" then
			Debugger.fatal("InvalidPropOrEvent", prop)
		end
		local ToAdd = Event:Connect(function()
			callback((instance :: any)[prop]) -- Pass new value through callback
		end)
        if scope then
            table.insert(scope, ToAdd)
        end
	end)
end
