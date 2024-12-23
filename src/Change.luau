-- Variables
local Root = script.Parent
local Action = require(Root.Action)
local Types = require(Root.Types)
local Debugger = require(Root.Parent.roblox_packages.debugger)

-- Module

--[=[
	Connects a callback to a certain property change event, and supplies the changed prop as an arg.

	[Open Documentation](https://lumin-org.github.io/ui/api/actions/#change)
]=]
return function<T>(prop: string, callback: (changed: T) -> ()): Types.Action
	return Action(function(instance)
		local Success, Event = pcall(instance.GetPropertyChangedSignal, instance :: any, prop :: any) -- Ensure prop exists
		if not Success or type(callback) ~= "function" then
			Debugger.Fatal("InvalidPropOrEvent", prop)
		end
		Event:Connect(function()
			callback((instance :: any)[prop]) -- Pass new value through callback
		end)
	end)
end
