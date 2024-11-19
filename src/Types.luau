export type Animatable =
	boolean
	| number
	| BrickColor
	| CFrame
	| Vector3
	| Vector2
	| UDim2
	| UDim
	| Color3
	| Vector3int16
	| Vector2int16
	| ColorSequence
	| NumberSequence
	| NumberRange
	| Rect

export type Component<T> = (props: T) -> Instance

export type Properties = { [string | Key]: any }
export type Children = { [string | number]: any }

export type Key = {
	Name: string,
	Apply: (instance: Instance, ...any) -> (),
}

export type Constructor<T> = {
	_Bind: (self: T, prop: string, instance: Instance) -> (),
	_Type: string,
	Get: (self: T) -> any,
	Destroy: (self: T) -> (),
}

export type State = typeof(setmetatable(
	{} :: {
		_Type: "state",
		_State: any,
		_Listeners: { (newValue: any, oldValue: any) -> () },
	},
	{} :: {
		__index: {
			Set: (self: State, value: any) -> State,
			Listen: (self: State, listener: (new: any, old: any) -> ()) -> () -> (),
		} & Constructor<State>,
	}
))

export type Spring = typeof(setmetatable(
	{} :: {
		_Type: "spring",
		_State: State,
		_Damping: number,
		_Frequency: number,
		_Velocity: { number },
		_CurrentLinearPosition: { number },
		_type: {
			ToLinear: (value: Animatable) -> { number },
			FromLinear: (value: { number }) -> Animatable,
		},
	},
	{} :: {
		__index: {
			_Update: (self: Spring, linearTargetPosition: { number }, delta: number) -> (),
		} & Constructor<Spring>,
	}
))

export type Compute = typeof(setmetatable(
	{} :: {
		_Type: "compute",
		_Processor: (get: (value: Constructor<any> | any) -> ()) -> (),
		_Dependencies: { [State | Spring | Constructor<any>]: () -> () }?,
		_Result: any,
		_Instances: { [string]: Instance }?,
	},
	{} :: { __index: Constructor<Compute> }
))

return {}
