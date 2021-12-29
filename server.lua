local GetCurrentResourceName = GetCurrentResourceName()
local ox_inventory = exports.ox_inventory

local stashes = {
	{
		-- Police stash
		id = 'example_stash',
		label = 'Police Stash',
		slots = 50,
		weight = 100000,
		owner = false,
		jobs = 'police'
	},
	{
		-- Owned stash
		id = 'example_stash_2',
		label = 'Bob Smith\'s Stash',
		slots = 50,
		weight = 100000,
		owner = 'bobsmith',
	},
	{
		-- Personal stash
		id = 'example_stash_3',
		label = 'Your Stash',
		slots = 50,
		weight = 100000,
		owner = true,
	}
}

AddEventHandler('onServerResourceStart', function(resourceName)
	if resourceName == 'ox_inventory' or resourceName == GetCurrentResourceName then
		for i=1, #stashes do
			local stash = stashes[i]
			ox_inventory:RegisterStash(stash.id, stash.label, stash.slots, stash.weight, stash.owner, stash.jobs)
		end
	end
end)