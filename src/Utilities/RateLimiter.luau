local RateLimiter = {}
RateLimiter.__index = RateLimiter

function RateLimiter.new(maxRequests: number, window: number)
	assert(maxRequests > 0, "maxRequests must be greater than 0")
	assert(window > 0, "window must be greater than 0")

	return setmetatable({
		MaxRequests = maxRequests,
		Window = window,
		Requests = {},
	}, RateLimiter)
end

function RateLimiter:Allow(key: string): boolean
	local now = os.clock()
	local requests = self.Requests[key] or {}

	for i = #requests, 1, -1 do
		if now - requests[i] >= self.Window then
			table.remove(requests, i)
		end
	end

	if #requests >= self.MaxRequests then
		self.Requests[key] = requests
		return false
	end

	table.insert(requests, now)
	self.Requests[key] = requests

	return true
end

function RateLimiter:Reset(key: string)
	self.Requests[key] = nil
end

function RateLimiter:Destroy()
	table.clear(self.Requests)
end

return RateLimiter