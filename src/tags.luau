-- Variables
local Root = script.Parent
local Types = require(Root.types)

-- Module

--[=[
	Adds a tag (or multiple) with the provided name to the instance.

	[Open Documentation](https://lumin-org.github.io/ui/api/#tags)
]=]
return function(names: string): Types.Action
	return function(instance: Instance)
		local TagsList = names:split(" ") -- Split tag list for multiple tags
		for _, tag in TagsList do
			instance:AddTag(tag)
		end
	end
end
