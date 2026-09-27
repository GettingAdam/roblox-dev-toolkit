local Maid = {}
Maid.__index = Maid

function Maid.new()
	return setmetatable({
		Tasks = {},
	}, Maid)
end

function Maid:GiveTask(task)
	table.insert(self.Tasks, task)
	return task
end

function Maid:DoCleaning()
	for _, task in self.Tasks do
		if typeof(task) == "RBXScriptConnection" then
			task:Disconnect()
		elseif typeof(task) == "Instance" then
			task:Destroy()
		elseif type(task) == "function" then
			task()
		elseif type(task) == "table" and task.Destroy then
			task:Destroy()
		elseif type(task) == "table" and task.Disconnect then
			task:Disconnect()
		end
	end

	table.clear(self.Tasks)
end

function Maid:Destroy()
	self:DoCleaning()
end

return Maid