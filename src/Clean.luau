-- Variables
local Root = script.Parent
local Action = require(Root.Action)
local Types = require(Root.Types)
local Debugger = require(Root.Parent.roblox_packages.debugger)

-- Module

--[=[
	Cleans and removes the items provided to they key when the parent instance is destroyed.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/keys/#clean)
]=]
return function(values: { any }): Types.Action
	return Action("Clean", function(instance: Instance)
		Debugger.Assert(type(values) == "table", "InvalidType", "table", type(values))
		instance.Destroying:Once(function()
			for _, value in values do
				if (type(value) == "table" and value._Bind) or typeof(value) == "Instance" then
					value:Destroy()
				elseif typeof(value) == "RBXScriptConnection" then
					value:Disconnect()
				end
			end
		end)
	end)
end
