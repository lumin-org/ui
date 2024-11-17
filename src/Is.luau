-- Variables
local Types = require(script.Parent.Types)

-- Functions
local function Constructor(item: Types.Constructor)
	return if type(item) == "table" and item._Type and item._Bind and item.Get then true else false
end

local function Key(item: Types.Key)
	return if type(item) == "table" and item.Name and item.Apply then true else false
end

-- Module
return table.freeze({
	Constructor = Constructor,
	Key = Key,
})
