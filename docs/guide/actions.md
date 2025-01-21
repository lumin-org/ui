# Actions

Actions are essentially custom events we can add to our UI tree to make it more reactive. There is no set way to create an action, and the preferred way is returning a function within a function. This allows it to be called in our UI tree as mentioned earlier.

## Usage

By default, the internal `Apply` module will pass the instance the `Action` that is attached. An example of this is how the the `Event` action works:

```luau
...
return function(event: string, callback: (...any) -> (), scope: {any}?)
	return function(instance: Instance)
		...
		local ToAdd = Event:Connect(callback)
        if scope then
            table.insert(scope, ToAdd)
        end
	end
end
```
First we get the data we want to pass into the `Action` from the tree, then we return it so it can be called when applying properties to an instance.
