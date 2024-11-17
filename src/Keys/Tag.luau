-- Variables
local Utility = script.Parent.Utility
local Keys = require(Utility.Keys)

-- Module

--[=[
	Adds a tag (or multiple) with the provided name to the instance.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/keys/#tag)
]=]
return function()
	if not Keys["Tag"] then
		Keys["Tag"] = {
			Name = "Tag",
			Apply = function(instance: Instance, names: string)
                local TagsList = names:split(" ")
                for _, tag in TagsList do
                    instance:AddTag(tag)
                end
			end,
		}
	end
	return Keys["Tag"]
end
