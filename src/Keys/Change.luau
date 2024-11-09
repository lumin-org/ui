-- Variables
local Packages = script.Parent.Parent.Parent.Parent.Packages
local Utility = script.Parent.Utility
local Keys = require(Utility.Keys)
local Debugger = require(Packages.debugger)

-- Module

--[=[
	Connects a callback to a certain property change event.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/keys/#change)
]=]
return function(prop: string)
	if not Keys["Change"] then
		Keys["Change"] = function(instance: Instance, callback: (...any) -> ())
			local Success, Event = pcall(instance.GetPropertyChangedSignal, instance :: any, prop :: any)
			if not Success or type(callback) ~= "function" then
				Debugger.Fatal("")
			end
			Event:Connect(callback)
		end
	end
	return Keys["Change"]
end
