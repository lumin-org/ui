-- Variables
local Packages = script.Parent.Parent.Parent.Parent.Parent.Packages
local Utility = script.Parent.Parent.Utility
local Keys = require(Utility.Keys)
local Debugger = require(Packages.debugger)

-- Module

--[=[
	Connects a callback to a certain property change event.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/keys/#onchange)
]=]
return function(propName: string)
    if not Keys["OnChange"] then
        Keys["OnChange"] = {
            Name = "OnChange",
            Apply = function(instance: Instance, callback: (...any) -> ())
                local Success, Event = pcall(instance.GetPropertyChangedSignal, instance :: any, propName :: any)
                if not Success or type(callback) ~= "function" then
                    Debugger.Fatal("")
                end
                Event:Connect(callback)
            end
        }
    end
    return Keys["OnChange"]
end
