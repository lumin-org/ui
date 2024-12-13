-- Variables
local Root = script.Parent
local Apply = require(Root.Apply)

-- Module

--[=[
	Updates an instance, writing to its properties or adding children.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/#update)
]=]
return function(instance: Instance, props: { any }): Instance
	for prop, value in props :: any do
		if prop == "Parent" then
			continue
		end
		Apply(instance, prop, value)
	end

	if (props :: any).Parent then
        instance.Parent = (props :: any).Parent
    end

	return instance
end
