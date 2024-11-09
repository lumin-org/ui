-- Variables
local Packages = script.Parent.Parent.Parent.Parent.Packages
local Utility = script.Parent.Utility
local Keys = require(Utility.Keys)
local Debugger = require(Packages.debugger)


-- Module

--[=[
	Cleans and removes the items provided to they key when the parent instance is destroyed.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/keys/#clean)
]=]
return function()
	if not Keys["Clean"] then
		Keys["Clean"] = function(instance: Instance, values: {any})
            Debugger.Assert(type(values) == "table", "InvalidType", "table", type(values))
            instance.Destroying:Once(function()

            end)
		end
	end
	return Keys["Clean"]
end
