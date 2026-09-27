local DataStoreService = game:GetService("DataStoreService")

local DataStore = {}
DataStore.__index = DataStore

function DataStore.new(storeName: string, maxRetries: number?)
	return setmetatable({
		Store = DataStoreService:GetDataStore(storeName),
		MaxRetries = maxRetries or 3,
	}, DataStore)
end

function DataStore:_attempt(callback)
	for attempt = 1, self.MaxRetries do
		local success, result = pcall(callback)

		if success then
			return true, result
		end

		if attempt < self.MaxRetries then
			task.wait(attempt)
		end
	end

	return false, nil
end

function DataStore:Get(playerKey: string, defaultValue: any)
	local success, result = self:_attempt(function()
		return self.Store:GetAsync(playerKey)
	end)

	if success and result ~= nil then
		return result
	end

	return defaultValue
end

function DataStore:Set(playerKey: string, value: any): boolean
	local success = self:_attempt(function()
		self.Store:SetAsync(playerKey, value)
	end)

	return success
end

function DataStore:Update(
	playerKey: string,
	updateFunction: (oldValue: any) -> any
): (boolean, any)
	return self:_attempt(function()
		return self.Store:UpdateAsync(playerKey, updateFunction)
	end)
end

return DataStore