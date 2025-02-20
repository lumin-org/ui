-- Module
return function(obj: any): string
    local is = typeof(obj)
    if is == "table" and (obj._Type and type(obj._Type) == "string") then
        return obj._Type
    end
    return is
end
