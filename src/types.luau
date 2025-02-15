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

-- Properties
export type Properties = { [string | Action]: Child | any }
export type Action = (instance: Instance) -> ()
export type Child = Instance

export type New<T, U> = (T) -> (Properties) -> U
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

-- Base Constructor
export type Constructor<T, U> = {
	_Bind: (self: T, prop: string, instance: Instance) -> (),
	Get: (self: T) -> U,
	Destroy: (self: T) -> (),
} & { [any]: any }

-- State
export type State<U> = {
	Set: <T>(self: State<U>, value: T) -> T,
	Listen: (self: State<U>, listener: (new: U) -> ()) -> () -> (),
} & Constructor<State<U>, U>

-- Spring
export type Spring = {
    Set: (self: Spring, value: Animatable) -> Animatable,
	Stop: (self: Spring) -> (),
} & Constructor<Spring, Animatable>

-- Compute
export type Compute<U> = Constructor<Compute<U>, U>

return {}
