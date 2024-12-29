-- Variables
local Packages = script.Parent.roblox_packages
local Types = require(script.types)
local Debugger = require(Packages.debugger)

-- Types
export type Action = Types.Action
export type State = Types.State
export type Spring = Types.Spring
export type Computed = Types.Computed
export type Animatable = Types.Animatable

-- Module
Debugger.SetMetadata({
	URL = "https://github.com/lumin-org/ui",
	Name = "UI",
})

return table.freeze({
    version = { major = 9, minor = 1, patch = 1 },

	New = require(script.new),
	Update = require(script.update),
	State = require(script.state),
	Computed = require(script.computed),
	Spring = require(script.spring),
    Cleanup = require(script.cleanup),
	Action = require(script.action),
	Event = require(script.event),
	Changed = require(script.changed),
	Tags = require(script.tags),
})
