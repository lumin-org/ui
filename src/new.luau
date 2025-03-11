-- Variables
local Debugger = require("../roblox_packages/debugger")
local Apply = require("./apply")
local Defaults = require("./defaults") :: { [string]: { [string]: any } }

-- Module

--[=[
	Creates a new instance with the provided properties.

	[Open Documentation](https://lumin-org.github.io/ui/api/#new)
]=]
return function(class: string | Instance)
	Debugger.assert(type(class) == "string", "InvalidType", class, "invalid")
	return function(props: { [any]: any }): Instance & { [any]: any }
		if type(class) == "string" then
			local Success, New = pcall(Instance.new, class)
			
			if Success then
				-- Apply default properties
				if Defaults[class] then
					for prop, value in Defaults[class] do
						(New :: any)[prop] = value
					end
				end
			else
				Debugger.fatal("InvalidClass", class)
			end

			return Apply(New, props)
		else
			return Apply(class:Clone(), props)
		end
	end
end
