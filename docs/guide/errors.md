# Errors

If you come across an error, you should be able to find it here. If not, [file an issue](https://github.com/lumin-org/ui/issues/new?template=broken-src.md) because it's unintentional.

## `SpringInvalidDamping`

The spring has invalid damping, and must be greater than or equal to 0. Anything under this will produce unwanted effects.

## `SpringInvalidSpeed`

The spring has an invalid speed, and must be greater than or equal to 0. Anything under this will produce unwanted effects.

## `SpringNotAnimatable`

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

The class you are trying to pass to `New` is not recognized.

## `InvalidProp`

The prop trying to be found does not exist on the object being indexed.

## `InvalidEvent`

The event trying to be found does not exist on the object being indexed.

## `CleanupCannotClean`

Cleanup is not allowed on this type, and should be cleaned by other means.

## `ForEachInvalidReturn`

You can only return instances within a `ForEach` iterator.

## `ViewInvalidType`

You gave a `View` an invalid type. `Screen`, `Surface`, and `Billboard` are the only ones that are allowed.

## `ApplyInvalidKeyType`

If the key is not a number or string, it is automatically invalidated.

## `ApplyInvalidPropType`

You may only pass actions and instances without a named key.
