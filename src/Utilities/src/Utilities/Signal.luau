local Signal = {}
Signal.__index = Signal

function Signal.new()
	return setmetatable({
		_Connections = {},
	}, Signal)
end

function Signal:Connect(callback: (...any) -> ())
	local connection = {
		Connected = true,
	}

	function connection:Disconnect()
		connection.Connected = false
	end

	table.insert(self._Connections, {
		Connection = connection,
		Callback = callback,
	})

	return connection
end

function Signal:Fire(...: any)
	for _, entry in self._Connections do
		if entry.Connection.Connected then
			entry.Callback(...)
		end
	end
end

function Signal:Destroy()
	table.clear(self._Connections)
end

return Signal
