local TableUtils = require(script.Parent.Parent.src.Utilities.TableUtils)

return function()
	describe("TableUtils", function()
		it("clones a table", function()
			local original = {1, 2, 3}
			local copy = TableUtils.clone(original)

			assert(copy ~= original)
			assert(copy[1] == 1)
			assert(copy[2] == 2)
			assert(copy[3] == 3)
		end)

		it("finds a matching value", function()
			local value, index = TableUtils.find({10, 20, 30}, function(item)
				return item == 20
			end)

			assert(value == 20)
			assert(index == 2)
		end)

		it("checks whether a table contains a value", function()
			local values = {"Sword", "Shield", "Potion"}

			assert(TableUtils.contains(values, "Shield") == true)
			assert(TableUtils.contains(values, "Bow") == false)
		end)

		it("clears a table", function()
			local values = {1, 2, 3}

			TableUtils.clear(values)

			assert(next(values) == nil)
		end)
	end)
end