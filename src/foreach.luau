-- Variables
local Root = script.Parent
local Types = require(Root.types)

-- Module

--[=[
	Iterates through a table and runs the iterator for each entry within the UI tree. Returning an
    instance will result in it getting parented to the parent of the action.

	[Open Documentation](https://lumin-org.github.io/ui/api/#foreach)
]=]
return function<T, U>(table: { [T]: U }, iterator: (index: T, value: U) -> (Instance?)): Types.Action
	return function(instance: Instance)
        for index, value in table do
            local NewInstance = iterator(index, value)
            if NewInstance and typeof(NewInstance) == "Instance" then
                NewInstance.Parent = instance
            end
        end
	end
end
