local RateLimiter = require(script.Parent.Parent.src.Utilities.RateLimiter)

return function()
	describe("RateLimiter", function()
		it("allows requests within the limit", function()
			local limiter = RateLimiter.new(2, 10)

			assert(limiter:Allow("player") == true)
			assert(limiter:Allow("player") == true)
		end)

		it("blocks requests above the limit", function()
			local limiter = RateLimiter.new(2, 10)

			limiter:Allow("player")
			limiter:Allow("player")

			assert(limiter:Allow("player") == false)
		end)

		it("tracks keys independently", function()
			local limiter = RateLimiter.new(1, 10)

			assert(limiter:Allow("player1") == true)
			assert(limiter:Allow("player2") == true)
		end)

		it("can reset a key", function()
			local limiter = RateLimiter.new(1, 10)

			limiter:Allow("player")
			limiter:Reset("player")

			assert(limiter:Allow("player") == true)
		end)
	end)
end