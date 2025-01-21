-- Variables
local Root = script.Parent
local Apply = require(Root.apply)

-- Module

--[=[
	Updates an instance, writing to its properties.

	[Open Documentation](https://lumin-org.github.io/ui/api/#update)
]=]
return function(instance: Instance)
	return function(props: { any }): Instance
		for prop, value in props :: any do
			if prop == "Parent" or prop == "Name" then
				continue
			end
			Apply(instance, prop, value)
		end

		if (props :: any).Parent then
			instance.Parent = (props :: any).Parent
		end

        if (props :: any).Name then
            instance.Name = (props :: any).Name
        end

		return instance
	end
end
