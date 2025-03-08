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
	_Bind: (self: T, prop: string, instance: Instance) -> (),
	Destroy: (self: T) -> (),
} & { [any]: any }

-- State
export type State<T> = typeof(setmetatable({} :: {
    Listen: (self: State<T>, listener: (changed: T) -> ()) -> () -> (),
} & Constructor<State<T>>, {} :: {
    __call: (self: State<T>, ...T) -> (T)
}))

-- Spring
export type Spring = typeof(setmetatable({} :: {
    Stop: (self: Spring) -> (),
} & Constructor<Spring>, {} :: {
    __call: (self: Spring) -> (Animatable)
}))

-- Compute

export type Compute<T> = typeof(setmetatable({} :: {
    Listen: (self: Compute<T>, listener: (changed: T) -> ()) -> () -> (),
} & Constructor<Compute<T>>, {} :: {
    __call: (self: Compute<T>) -> (T)
}))

return {}
