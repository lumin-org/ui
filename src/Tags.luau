-- Variables
local Root = script.Parent
local Types = require(Root.Types)
local Action = require(Root.Action)

-- Module

--[=[
	Adds a tag (or multiple) with the provided name to the instance.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/keys/#tag)
]=]
return function(names: string): Types.Action
	return Action("Tags", function(instance: Instance)
		local TagsList = names:split(" ")
		for _, tag in TagsList do
			instance:AddTag(tag)
		end
	end)
end
