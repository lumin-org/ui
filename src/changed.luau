-- Variables
local Types = require("./types")
local Debugger = require("../roblox_packages/debugger")

-- Module

--[=[
	Allows you to observe changes of properties within an object, and supplies the value of
    the changed property as a callback argument.

	[Open Documentation](https://lumin-org.github.io/ui/api/#changed)
]=]
return function<T>(prop: string, callback: (changed: T) -> (), scope: { any }?): Types.Action
	return function(instance)
		local Success, Event = pcall(instance.GetPropertyChangedSignal, instance :: any, prop :: any) -- Ensure prop exists
		local ArgType = type(callback)
        
        Debugger.assert(Success, "InvalidProp", prop)
        Debugger.assert(ArgType == "function", "InvalidType", "function", ArgType)

		local ToAdd = Event:Connect(function()
			callback((instance :: any)[prop]) -- Pass new value through callback
		end)
		if scope then
			table.insert(scope, ToAdd)
		end
	end
end
