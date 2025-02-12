-- Variables
local Apply = require("./apply")

-- Module

--[=[
	Updates an instance, writing to its properties.

	[Open Documentation](https://lumin-org.github.io/ui/api/#update)
]=]
return function(instance: Instance)
	return function(props: { any }): Instance
		Apply(instance, props)
		return instance
	end
end
