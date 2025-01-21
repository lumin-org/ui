-- Variables
local Root = script.Parent
local Types = require(Root.types)
local Debugger = require(Root.Parent.roblox_packages.debugger)

-- Functions

local function Helper(instance: any)
	if instance.Destroy then
		instance:Destroy()
	elseif instance.Disconnect then
		instance:Disconnect()
	else
		Debugger.fatal("CleanUpNotAllowed")
	end
end

-- Module

--[=[
	Cleans up the provided items as soon as the parent instance is destroyed.

	[Open Documentation](https://lumin-org.github.io/ui/api/#cleanup)
]=]
return function(clean: { Instance } | Instance): Types.Action
	return function(instance)
		instance.Destroying:Once(function()
			if type(clean) == "table" then
				for _, instance in clean do
					Helper(instance)
				end
				return
			end
			Helper(clean)
		end)
	end
end
