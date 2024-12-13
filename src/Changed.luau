-- Variables
local Root = script.Parent
local Action = require(Root.Action)
local Types = require(Root.Types)
local Debugger = require(Root.Parent.roblox_packages.debugger)

-- Module

--[=[
	Connects a callback to a certain property change event, and supplies the changed prop as an arg.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/actions/#change)
]=]
return function(prop: string, callback: (changed: any) -> ()): Types.Action
	return Action("Changed", function(instance)
		local Success, Event = pcall(instance.GetPropertyChangedSignal, instance :: any, prop :: any)
		if not Success or type(callback) ~= "function" then
			Debugger.Fatal("InvalidPropOrEvent", prop)
		end
		Event:Connect(function()
			callback((instance :: any)[prop])
		end)
	end)
end
