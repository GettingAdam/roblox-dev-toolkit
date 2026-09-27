local Cooldown = {}
Cooldown.__index = Cooldown

function Cooldown.new(duration: number)
	return setmetatable({
		Duration = duration,
		LastUse = 0,
	}, Cooldown)
end

function Cooldown:CanUse(): boolean
	return os.clock() - self.LastUse >= self.Duration
end

function Cooldown:Use(): boolean
	if not self:CanUse() then
		return false
	end

	self.LastUse = os.clock()
	return true
end

return Cooldown
