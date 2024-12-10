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

export type StateExport = {
	Set: (self: StateExport, value: any) -> State,
	Listen: (self: StateExport, listener: (new: any, old: any) -> ()) -> () -> (),
} & Constructor<StateExport>

export type State = typeof(setmetatable(
	{} :: {
		_Type: "state",
		_State: any,
		_Listeners: { (newValue: any, oldValue: any) -> () },
	},
	{} :: { __index: StateExport }
))

export type SpringExport = {
	_Update: (self: SpringExport, linearTargetPosition: { number }, delta: number) -> (),
} & Constructor<SpringExport>

export type Spring = typeof(setmetatable(
	{} :: {
		_Type: "spring",
		_State: State,
		_Damping: number,
		_Frequency: number,
		_Velocity: { number },
		_CurrentLinearPosition: { number },
		_DataType: {
			ToLinear: (value: Animatable) -> { number },
			FromLinear: (value: { number }) -> Animatable,
		},
	},
	{} :: { __index: SpringExport }
))

export type TweenExport = {} & Constructor<TweenExport>

export type Tween = typeof(setmetatable(
	{} :: {
		_Type: "tween",
	},
	{} :: { __index: TweenExport }
))

export type ComputeExport = Constructor<ComputeExport>

export type Compute = typeof(setmetatable(
	{} :: {
		_Type: "compute",
		_Processor: (get: (value: Constructor<any> | any) -> ()) -> (),
		_Dependencies: { [State | Spring | Constructor<any>]: () -> () }?,
		_Result: any,
		_Instances: { [string]: Instance }?,
	},
	{} :: { __index: ComputeExport }
))

return {}
