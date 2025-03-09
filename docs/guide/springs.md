# Springs

UI provides a very powerful spring library, that gives you the option to spring almost any number-based, or color-based property. Tweens do not exist in UI, as springs do the execution much, much better than tweens do. Along with this, they are prone to almost zero glitching and are super performant.

## Usage

Springs take a damping and speed property. extThese both control the behavior of the spring, and this example we'll use **underdamping** with a speed `2` to give it that classic spring effect:

```luau
local UI = require(path.to.UI)
local New = UI.New
local Spring = UI.Spring
local State = UI.State

local SpringState = State(UDim2.fromScale(0, 0.5))
local Spring = Spring(SpringState, 0.5, 2)

New "Frame" {
    Parent = ...,
    Size = UDim2.fromOffset(100, 100),
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = Spring,
}

SpringState(UDim2.fromScale(0, 0.75))
```

The way speed and damping works is covered in more detail in the next sections. Here's a preview of the output that the above code would result in:

<video src="../public/videos/spring-preview.mp4" controls loop></video>

## Damping

Damping is what controls the friction of the spring. A higher value will restrict the movement and make it feel more instant, while a lower value will cause it be more 'springy'.

### Zero Damping

Zero damping results in no friction at all. This means that the spring will go forever, regardless of speed. **This is a damping ratio of `<0`**

### Underdamping

Underdamping means that the spring will slightly overshoot its target. And will, once again, give it the classic spring effect. **This is a damping ratio of `0-1`**

### Critical Damping

Critical damping will give the spring a similar effect to a tween, and will not go past its target at all. It will try to reach the target in as little time as possible. **This is a damping ratio of `1`**

### Overdamping

Overdamping will cause the spring to move extremely slow as it gets closer to its goal. It behaves similar to an object moving through a substance like honey or maple syrup. **This is a damping ratio of `>1`**

## Speed

The speed will dictate how fast the spring progresses. For example, a speed such as `1` will make the spring reach its end goal almost immeadietly. Meanwhile, a speed like `20` will make the progression a lot more slower.
