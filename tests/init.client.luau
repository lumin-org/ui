for _, object in script:GetDescendants() do
	if object:IsA("ModuleScript") then
		(require)(object)
	end
end
