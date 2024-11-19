-- Variables
local Root = script.Parent.Parent
local Keys = require(script.Parent.List)
local Debugger = require(Root.Parent.debugger)

-- Functions
local function Find(instance: Instance, property: string)
    return (instance :: any)[property]
end

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
				local Success, Event = pcall(Find, instance :: any, event :: any)
				if not Success or type(callback) ~= "function" then
					Debugger.Fatal("")
				end
				Event:Connect(callback)
			end,
		}
	end
	return Keys["Event"]
end
