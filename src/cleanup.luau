-- Variables
local Types = require("./types")
local Debugger = require("../roblox_packages/debugger")

-- Functions

local function Helper(instance: any)
	if instance.Destroy then
		instance:Destroy()
	elseif instance.Disconnect then
		instance:Disconnect()
	else
		Debugger.fatal("CleanupNotAllowed")
	end
end

-- Module

--[=[
	Cleans up the provided items as soon as the parent instance is destroyed.

	[Open Documentation](https://lumin-org.github.io/ui/api/#cleanup)
]=]
return function(clean: { any }): Types.Action
	return function(instance)
		instance.Destroying:Once(function()
			for _, toClean in clean :: any do
				Helper(toClean)
			end
		end)
	end
end
