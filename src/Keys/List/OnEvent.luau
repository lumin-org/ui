-- Variables
local Packages = script.Parent.Parent.Parent.Parent.Packages
local Utility = script.Parent.Utility
local FindProp = require(Utility.FindProp)
local Keys = require(Utility.Keys)
local Debugger = require(Packages.debugger)

-- Module

--[=[
	Connects a callback to an event on the instance.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/keys/#onevent)
]=]
return function(eventName: string)
    if not Keys["OnEvent"] then
        Keys["OnEvent"] = {
            Name = "OnEvent",
            Apply = function(instance: Instance, callback: (...any) -> ())
                local Success, Event = pcall(FindProp, instance :: any, eventName :: any)
                if not Success or type(callback) ~= "function" then
                    Debugger.Fatal("")
                end
                Event:Connect(callback)
            end
        }
    end
    return Keys["OnEvent"]
end
