-- Variables
local Root = script.Parent
local Types = require(Root.Types)

-- Functions

return function(instance: Instance, property: any, value: any)
	if type(property) == "number" then
		if type(value) == "function" then
			(value :: Types.Action)(instance)
		else
			value.Parent = instance
            value.Name = property
		end
	elseif type(property) == "string" then
		if type(value) == "table" then
			(value :: Types.Constructor<any, any>):_Bind(property, instance)
		else
			(instance :: any)[property] = value
		end
	end
end
