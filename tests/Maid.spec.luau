local Maid = require(script.Parent.Parent.src.Utilities.Maid)

return function()
	describe("Maid", function()
		it("stores and cleans functions", function()
			local maid = Maid.new()
			local cleaned = false

			maid:GiveTask(function()
				cleaned = true
			end)

			maid:DoCleaning()

			assert(cleaned == true)
			assert(#maid.Tasks == 0)
		end)

		it("cleans multiple tasks", function()
			local maid = Maid.new()
			local firstCleaned = false
			local secondCleaned = false

			maid:GiveTask(function()
				firstCleaned = true
			end)

			maid:GiveTask(function()
				secondCleaned = true
			end)

			maid:DoCleaning()

			assert(firstCleaned == true)
			assert(secondCleaned == true)
			assert(#maid.Tasks == 0)
		end)
	end)
end