local FormatNumber = require(script.Parent.Parent.src.Utilities.FormatNumber)

return function()
	describe("FormatNumber", function()
		it("formats thousands", function()
			assert(FormatNumber.format(1500) == "1.5K")
		end)

		it("formats millions", function()
			assert(FormatNumber.format(2000000) == "2.0M")
		end)

		it("keeps small numbers unchanged", function()
			assert(FormatNumber.format(500) == "500")
		end)
	end)
end
