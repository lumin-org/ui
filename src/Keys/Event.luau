-- Variables
local Packages = script.Parent.Parent.Parent.Parent.Packages
local Utility = script.Parent.Utility
local FindProp = require(Utility.FindProp)
local Keys = require(Utility.Keys)
local Debugger = require(Packages.debugger)

-- Module

--[=[
	Connects a callback to an event on the instance.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/keys/#event)
]=]
return function(event: string)
	if not Keys["Event"] then
		Keys["Event"] = {
			Name = "Event",
			Apply = function(instance: Instance, callback: (...any) -> ())
				local Success, Event = pcall(FindProp, instance :: any, event :: any)
				if not Success or type(callback) ~= "function" then
					Debugger.Fatal("")
				end
				Event:Connect(callback)
			end,
		}
	end
	return Keys["Event"]
end
