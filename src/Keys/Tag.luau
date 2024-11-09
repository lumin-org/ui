-- Variables
local Utility = script.Parent.Utility
local Keys = require(Utility.Keys)

-- Module

--[=[
	Adds a tag with the provided name to the instance.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/keys/#tag)
]=]
return function()
	if not Keys["Tag"] then
		Keys["Tag"] = function(instance: Instance, name: string)
            instance:AddTag(name)
		end
	end
	return Keys["Tag"]
end
