export type Animatable =
	boolean
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

export type Action = (instance: Instance, ...any) -> ()
export type New<T, U> = (T) -> ({ any }) -> U
export type NewInstance =
	& New<"Folder", Folder>
	& New<"BillboardGui", BillboardGui>
	& New<"CanvasGroup", CanvasGroup>
	& New<"Frame", Frame>
	& New<"ImageButton", ImageButton>
	& New<"ImageLabel", ImageLabel>
	& New<"ScreenGui", ScreenGui>
	& New<"ScrollingFrame", ScrollingFrame>
	& New<"SurfaceGui", SurfaceGui>
	& New<"TextBox", TextBox>
	& New<"TextButton", TextButton>
	& New<"TextLabel", TextLabel>
	& New<"UIAspectRatioConstraint", UIAspectRatioConstraint>
	& New<"UICorner", UICorner>
	& New<"UIGradient", UIGradient>
	& New<"UIGridLayout", UIGridLayout>
	& New<"UIListLayout", UIListLayout>
	& New<"UIPadding", UIPadding>
	& New<"UIPageLayout", UIPageLayout>
	& New<"UIScale", UIScale>
	& New<"UISizeConstraint", UISizeConstraint>
	& New<"UIStroke", UIStroke>
	& New<"UITableLayout", UITableLayout>
	& New<"UITextSizeConstraint", UITextSizeConstraint>
	& New<"VideoFrame", VideoFrame>
	& New<"ViewportFrame", ViewportFrame>
	& New<string, Instance & any>

-- constructor class
export type Constructor<T, U> = {
	_Bind: (self: T, prop: string, instance: Instance) -> (),
	Get: (self: T) -> U,
	Destroy: (self: T) -> (),
}

-- states
export type StateExport = {
	Set: <T>(self: StateExport, value: T) -> T,
	Listen: (self: StateExport, listener: (new: any) -> ()) -> () -> (),
} & Constructor<StateExport, any>

export type State = typeof(setmetatable(
	{} :: {
		_Value: any,
		_Listeners: { (newValue: any, oldValue: any) -> () },
	},
	{} :: { __index: StateExport }
))

-- springs
export type SpringExport = {
	Stop: (self: SpringExport) -> (),
} & Constructor<SpringExport, Animatable>

export type Spring = typeof(setmetatable(
	{} :: {
		_Goal: StateExport,
		_Damping: number,
		_Speed: number,
		_Instances: { Instance },
	},
	{} :: { __index: SpringExport }
))

-- computes
export type ComputeExport = Constructor<ComputeExport, any>

export type Compute = typeof(setmetatable(
	{} :: {
		_Processor: () -> (),
		_Value: any,
		_Dependencies: { State },
		_Instances: { [string]: Instance }?,
	},
	{} :: { __index: ComputeExport }
))

return {}
