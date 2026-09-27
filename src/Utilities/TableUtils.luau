local TableUtils = {}

function TableUtils.clone<T>(source: {T}): {T}
	local result = {}

	for key, value in source do
		result[key] = value
	end

	return result
end

function TableUtils.find<T>(source: {T}, predicate: (T) -> boolean): (T?, number?)
	for index, value in source do
		if predicate(value) then
			return value, index
		end
	end

	return nil, nil
end

function TableUtils.contains<T>(source: {T}, value: T): boolean
	for _, item in source do
		if item == value then
			return true
		end
	end

	return false
end

function TableUtils.clear(source: {[any]: any})
	table.clear(source)
end

return TableUtils