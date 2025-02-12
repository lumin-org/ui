return {
	ScreenGui = {
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	},

	BillboardGui = {
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		Active = true,
	},

	SurfaceGui = {
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud,
		PixelsPerStud = 50,
	},

	Frame = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0,
	},

	ScrollingFrame = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0,

		ScrollBarImageColor3 = Color3.new(0, 0, 0),
	},

	TextLabel = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0,

		Font = Enum.Font.SourceSans,
		Text = "",
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 14,
	},

	TextButton = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0,

		AutoButtonColor = false,

		Font = Enum.Font.SourceSans,
		Text = "",
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 14,
	},

	TextBox = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0,

		ClearTextOnFocus = false,

		Font = Enum.Font.SourceSans,
		Text = "",
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 14,
	},

	ImageLabel = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0,
	},

	ImageButton = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0,

		AutoButtonColor = false,
	},

	ViewportFrame = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0,
	},

	VideoFrame = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0,
	},

	CanvasGroup = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0,
	},

	UIListLayout = {
		SortOrder = Enum.SortOrder.LayoutOrder,
	},

	UIGridLayout = {
		SortOrder = Enum.SortOrder.LayoutOrder,
	},

	UITableLayout = {
		SortOrder = Enum.SortOrder.LayoutOrder,
	},

	UIPageLayout = {
		SortOrder = Enum.SortOrder.LayoutOrder,
	},

	SpawnLocation = {
		Duration = 0,
	},

	Part = {
		Anchored = true,
		Size = vector.one,
		FrontSurface = Enum.SurfaceType.Smooth,
		BackSurface = Enum.SurfaceType.Smooth,
		LeftSurface = Enum.SurfaceType.Smooth,
		RightSurface = Enum.SurfaceType.Smooth,
		TopSurface = Enum.SurfaceType.Smooth,
		BottomSurface = Enum.SurfaceType.Smooth,
	},

	TrussPart = {
		Anchored = true,
		Size = vector.one * 2,
		FrontSurface = Enum.SurfaceType.Smooth,
		BackSurface = Enum.SurfaceType.Smooth,
		LeftSurface = Enum.SurfaceType.Smooth,
		RightSurface = Enum.SurfaceType.Smooth,
		TopSurface = Enum.SurfaceType.Smooth,
		BottomSurface = Enum.SurfaceType.Smooth,
	},

	MeshPart = {
		Anchored = true,
		Size = vector.one,
		FrontSurface = Enum.SurfaceType.Smooth,
		BackSurface = Enum.SurfaceType.Smooth,
		LeftSurface = Enum.SurfaceType.Smooth,
		RightSurface = Enum.SurfaceType.Smooth,
		TopSurface = Enum.SurfaceType.Smooth,
		BottomSurface = Enum.SurfaceType.Smooth,
	},

	CornerWedgePart = {
		Anchored = true,
		Size = vector.one,
		FrontSurface = Enum.SurfaceType.Smooth,
		BackSurface = Enum.SurfaceType.Smooth,
		LeftSurface = Enum.SurfaceType.Smooth,
		RightSurface = Enum.SurfaceType.Smooth,
		TopSurface = Enum.SurfaceType.Smooth,
		BottomSurface = Enum.SurfaceType.Smooth,
	},

	VehicleSeat = {
		Anchored = true,
		Size = vector.one,
		FrontSurface = Enum.SurfaceType.Smooth,
		BackSurface = Enum.SurfaceType.Smooth,
		LeftSurface = Enum.SurfaceType.Smooth,
		RightSurface = Enum.SurfaceType.Smooth,
		TopSurface = Enum.SurfaceType.Smooth,
		BottomSurface = Enum.SurfaceType.Smooth,
	},
}
