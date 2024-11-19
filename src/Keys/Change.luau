-- Variables
local Root = script.Parent.Parent
local Keys = require(script.Parent.List)
local Debugger = require(Root.Parent.debugger)

-- Module

--[=[
	Connects a callback to a certain property change event, and supplies the changed prop as an arg.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/keys/#change)
]=]
return function(prop: string)
	if not Keys["Change"] then
		Keys["Change"] = {
			Name = "Change",
			Apply = function(instance: Instance, callback: (changed: any) -> ())
				local Success, Event = pcall(instance.GetPropertyChangedSignal, instance :: any, prop :: any)
				if not Success or type(callback) ~= "function" then
					Debugger.Fatal("")
				end
				Event:Connect(function()
                    callback((instance :: any)[prop])
				end)
			end,
		}
	end
	return Keys["Change"]
end
