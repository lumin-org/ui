-- Variables
local Root = script.Parent.Parent
local Keys = require(script.Parent.List)
local Debugger = require(Root.Parent.debugger)

-- Module

--[=[
	Cleans and removes the items provided to they key when the parent instance is destroyed.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/keys/#clean)
]=]
return function()
	if not Keys["Clean"] then
		Keys["Clean"] = {
			Name = "Clean",
			Apply = function(instance: Instance, values: { any })
				Debugger.Assert(type(values) == "table", "InvalidType", "table", type(values))
				instance.Destroying:Once(function() end)
			end,
		}
	end
	return Keys["Clean"]
end
