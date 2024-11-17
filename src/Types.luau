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

export type Constructor = {
    _Bind: (self: any, prop: string, instance: Instance) -> (),
	_Type: string,
	Get: (self: any) -> any,
	Destroy: (self: any) -> (),
}

export type SpringInfo = {
	State: State,
	Damping: number?,
	Frequency: number?,
}

export type StateFunc = {
	_init: (self: State, prop: string, instance: Instance) -> (),
    _Bind: (self: State, prop: string, instance: Instance) -> (),
	Get: (self: State) -> any,
	Set: (self: State, value: any) -> State,
	Listen: (self: State, listener: (new: any, old: any) -> ()) -> () -> (),
	Destroy: (self: State) -> (),
}

export type StateProps = {
	_Type: "state",
	_State: any,
	_Listeners: { (newValue: any, oldValue: any) -> () },
}

export type State = typeof(setmetatable({} :: StateProps, {} :: { __index: StateFunc }))

export type SpringFunc = {
	_init: (self: Spring, prop: string, instance: Instance) -> (),
	Get: (self: Spring) -> any,
	_update: (self: Spring, linearTargetPosition: { number }, delta: number) -> (),
	Destroy: (self: Spring) -> nil,
}

export type SpringProps = {
	ConstructorClass: "spring",
	_state: State,
	_damping: number,
	_frequency: number,
	_velocity: { number },
	_currentLinearPosition: { number },
	_type: {
		ToLinear: (value: Animatable) -> { number },
		FromLinear: (value: { number }) -> Animatable,
	},
}

export type Spring = typeof(setmetatable({} :: SpringProps, {} :: { __index: SpringFunc }))

export type ComputeFunc = {
	_init: (self: Compute, prop: string, instance: Instance) -> (),
	Get: (self: Compute) -> any,
	Destroy: (self: Compute) -> nil,
}

export type ComputeProps = {
	ConstructorClass: "compute",
	_processor: (get: (value: Constructor | any) -> ()) -> (),
	_dependencies: { [State | Spring | Constructor]: () -> () }?,
	_result: any,
	_instances: { [string]: Instance }?,
}

export type Compute = typeof(setmetatable({} :: ComputeProps, {} :: { __index: ComputeFunc }))

return {}
