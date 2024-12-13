-- Variables
local Root = script.Parent
local Apply = require(Root.Apply)
local Debugger = require(Root.Parent.roblox_packages.debugger)
local Defaults = require(Root.Defaults)

-- Module

--[=[
	Creates a new instance or component with the provided children and properties.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/#new)
]=]
return function(class: string, props: { any }?): Instance
	local Success, New = pcall(Instance.new, class) -- Create the instance wrapped inside pcall

	if Success then
		if Defaults[class] then
			for prop, value in Defaults[class] do
				(New :: any)[prop] = value
			end
		end

		if props then
			for prop, value in props :: any do
				if prop == "Parent" then
					continue
				end
				Apply(New, prop, value)
			end

			if (props :: any).Parent then
				New.Parent = (props :: any).Parent
			end
		end
	else -- If it wasn't successful, error it because instance creation has to be complete.
		Debugger.Fatal("FailedCreation", class, New)
	end
	return New
end
