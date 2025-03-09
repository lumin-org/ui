-- Variables
local Packages = script.Parent.Parent.Parent
local UI = require(Packages.ui.src)
local New = UI.New
local Spring = UI.Spring
local State = UI.State
local View = UI.View

local SpringState = State(UDim2.fromScale(0.5, 0.25))
local TestSpring = Spring(SpringState :: any, 0.5, 2)

View {
    New "Frame" {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromOffset(100, 100),
        Position = TestSpring,
    }
}


while true do
    task.wait(1)
    SpringState(UDim2.fromScale(0.5, 0.75))
    task.wait(1)
    SpringState(UDim2.fromScale(0.5, 0.25))
end

return {}
