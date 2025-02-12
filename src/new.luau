-- Variables
local Types = require("./types")
local Debugger = require("../roblox_packages/debugger")
local Apply = require("./apply")
local Defaults = require("./defaults")

-- Module

--[=[
	Creates a new instance with the provided properties.

	[Open Documentation](https://lumin-org.github.io/ui/api/#new)
]=]
return (
	function(class: string)
		Debugger.assert(type(class) == "string", "InvalidType", class, "invalid")
		return function(props: Types.Properties): Instance
			local Success, New = pcall(Instance.new, class)

			if Success then
				-- Apply default properties
				if Defaults[class] then
					for prop, value in Defaults[class] do
						(New :: any)[prop] = value
					end
				end

				Apply(New, props)
			else
				Debugger.fatal("InvalidClass", class)
			end

			return New
		end
	end
) :: Types.NewInstance
