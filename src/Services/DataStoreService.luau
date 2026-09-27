local DataStoreService = game:GetService("DataStoreService")

local DataStore = {}
DataStore.__index = DataStore

function DataStore.new(storeName: string)
	return setmetatable({
		Store = DataStoreService:GetDataStore(storeName),
	}, DataStore)
end

function DataStore:Get(playerKey: string, defaultValue: any)
	local success, result = pcall(function()
		return self.Store:GetAsync(playerKey)
	end)

	if success and result ~= nil then
		return result
	end

	return defaultValue
end

function DataStore:Set(playerKey: string, value: any): boolean
	local success = pcall(function()
		self.Store:SetAsync(playerKey, value)
	end)

	return success
end

return DataStore