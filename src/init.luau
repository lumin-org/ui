-- Variables
local Types = require(script.types)
local Logs = require(script.logs)
local Debugger = require("../roblox_packages/debugger")

-- Types
export type Action = Types.Action
export type State<T> = Types.State<T>
export type Spring = Types.Spring
export type Compute<T> = Types.Compute<T>
export type Animatable = Types.Animatable

-- Debugger
Debugger.set("UI", Logs)

-- Module
return table.freeze({
	New = require(script.new),
	Update = require(script.update),
	State = require(script.state),
	Compute = require(script.compute),
	Spring = require(script.spring),
	Cleanup = require(script.cleanup),
	Event = require(script.event),
	Changed = require(script.changed),
	Tags = require(script.tags),
	ForEach = require(script.foreach),
})
