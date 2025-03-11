-- Variables
local Types = require("./types")
local Debugger = require("../roblox_packages/debugger")
local Spring = require("../roblox_packages/spr")

-- Module
return function(instance: Instance, props: { [any]: any }): Instance
	for property, value in props do
		if property == "Parent" or property == "Name" then
			continue
		end
		local PropType = type(property)
		local ValueType = type(value)
		if PropType == "number" then -- If the property is a modifier
			if ValueType == "function" then -- If the value is an action
				(value :: Types.Action)(instance)
			elseif ValueType == "userdata" then -- If the value is an instance
				value.Parent = instance
				value.Name = property
			else
				Debugger.fatal("ApplyInvalidPropType", ValueType)
			end
		elseif PropType == "string" then -- If the property is a string
			if ValueType == "table" then -- If the value is a constructor
				local constructor = value :: Types.Constructor<any>
				if type(constructor._Value) ~= "table" then
					-- Set the prop initially to the current value
					(instance :: any)[property] = constructor._Value
					-- Do a spring operation on the instance if the constructor is one
					if constructor._Type == "Spring" then
						table.insert(constructor._Observers, function(changed)
							Spring.target(instance, constructor._Damping, constructor._Speed, {
								[property :: string] = changed,
							})
						end)
					else
						-- Add an observer that runs when the state is changed
						table.insert(constructor._Observers, function(changed)
							(instance :: any)[property] = changed
						end)
					end
				end
			elseif ValueType == "function" then -- If the value is a function
				(instance :: any)[property] = value()
			else -- If the value is anything else, it is the value of a property
				(instance :: any)[property] = value
			end
		else
			Debugger.fatal("ApplyInvalidKeyType", PropType)
		end
	end
	-- Set Parent and Name later since they are given defaults
	if props.Parent then
		instance.Parent = props.Parent
	end
	if props.Name then
		instance.Name = props.Name
	end
	return instance
end
