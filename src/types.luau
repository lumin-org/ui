export type Animatable =
	| boolean
	| number
	| CFrame
	| Vector3
	| Vector2
	| UDim2
	| UDim
	| Color3
	| ColorSequence
	| NumberSequence
	| NumberRange

-- Action
export type Action = (instance: Instance) -> ()

-- View
export type View = ScreenGui & BillboardGui & SurfaceGui

-- Constructor
export type Constructor<T> = {
	_Value: any,
	_Observers: { (changed: any) -> () },
	_Type: string,
	Destroy: (self: T) -> (),
} & { [any]: any }

-- State
export type State<T> = typeof(setmetatable({} :: {
} & Constructor<State<T>>, {} :: {
    __call: (self: State<T>, ...T) -> (T)
}))

-- Spring
export type Spring = typeof(setmetatable({} :: {
} & Constructor<Spring>, {} :: {
    __call: (self: Spring, ...Animatable) -> (Animatable)
}))

-- Compute
export type Compute<T> = typeof(setmetatable({} :: {
} & Constructor<Compute<T>>, {} :: {
    __call: (self: Compute<T>) -> (T)
}))

-- Arg
export type Value<T> = T | State<T>

return {}
