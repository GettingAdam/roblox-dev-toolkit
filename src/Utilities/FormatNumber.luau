local FormatNumber = {}

function FormatNumber.format(number: number): string
	if number >= 1_000_000_000 then
		return string.format("%.1fB", number / 1_000_000_000)
	elseif number >= 1_000_000 then
		return string.format("%.1fM", number / 1_000_000)
	elseif number >= 1_000 then
		return string.format("%.1fK", number / 1_000)
	end

	return tostring(number)
end

return FormatNumber
