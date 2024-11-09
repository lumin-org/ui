-- Check if a property/event exists on an instance or not
return function(instance: Instance, property: string)
    return (instance :: any)[property]
end
