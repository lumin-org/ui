-- Variables
local Root = script.Parent.Parent
local Utility = require(Root.Utility)
local Types = require(Root.Types)

-- Module

--[=[
	Updates an instance, writing to its properties or adding children.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/#update)
]=]
return function(component: Instance, properties: Types.Properties?, children: Types.Children?): Instance
	if properties then
		for property, value in properties do
			if property == "Parent" then
				continue
			end

            Utility.ApplyProperty(component, property, value)
		end
		if (properties :: any).Parent then
            Utility.ApplyProperty(component, "Parent", (properties :: any).Parent)
		end
	end

	if children then
		for name, value in children do
			value.Parent = component
			value.Name = type(name) == "string" and name or value.Name
		end
	end

	return component
end
