# Errors

If you come across an error, you should be able to find it here. If not, [file an issue](https://github.com/lumin-org/ui/issues/new?template=broken-src.md) because it's unintentional.

## `NotAnimatable`

The object in the state you're trying to use with the spring is not animatable. The list of supported types is:

- `boolean`
- `number`
- `NumberRange`
- `UDim`
- `UDim2`
- `Vector2`
- `Vector3`
- `Color3`
- `ColorSequence`
- `NumberSequence`
- `CFrame`

## `InvalidType`

The type you are passing to a parameter of some sort is invalid.

## `InvalidClass`

The class you are trying to pass to `New` is not recognized by Roblox.

## `InvalidPropOrEvent`

The prop or event trying to be found does not exist on the object being indexed.

## `CleanupNotAllowed`

Cleanup is not allowed on this type, and should be cleaned by other means.
