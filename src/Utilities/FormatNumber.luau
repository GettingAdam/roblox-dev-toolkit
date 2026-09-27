local FormatNumber = {}

function FormatNumber.format(number: number, decimals: number?): string
	decimals = decimals or 1

	if number >= 1_000_000_000 then
		return string.format("%." .. decimals .. "fB", number / 1_000_000_000)
	elseif number >= 1_000_000 then
		return string.format("%." .. decimals .. "fM", number / 1_000_000)
	elseif number >= 1_000 then
		return string.format("%." .. decimals .. "fK", number / 1_000)
	end

	return tostring(number)
end

return FormatNumber
