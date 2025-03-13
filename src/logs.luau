return {
	-- Springs
	SpringInvalidDamping = "Spring damping must be greater than or equal to zero; got '%.2f'",
	SpringInvalidSpeed = "Spring speed must be greater than or equal to zero; got '%.2f'",
	SpringNotAnimatable = "Expected animatable type; got '%s'",

	-- Invalid
	InvalidType = "Expected type %s; got '%s'",
	InvalidClass = "Cannot create instance with a class of '%s'",
	InvalidProp = "%s does not have a property named '%s'",
	InvalidEvent = "%s does not have an event named '%s'",

	-- Cleanup
	CleanupCannotClean = "Cannot clean object without Destroy or Disconnect methods",

	-- View
	ViewInvalidType = "Expected view type Screen, Billboard, or Surface; got '%s'",

	-- Application
	ApplyInvalidKeyType = "Expected key type number or string; got '%s'",
	ApplyInvalidPropType = "Expected property type action or instance; got '%s'",
}
