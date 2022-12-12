local GetCurrentResourceName = GetCurrentResourceName()
local ox_inventory = exports.ox_inventory

-- These stashes are all created on resource start
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
		label = 'Stash',
		slots = 50,
		weight = 100000,
		owner = 'bobsmith',
	},
	{
		-- Personal stashes
		id = 'example_stash_3',
		label = 'Stash',
		slots = 50,
		weight = 100000,
		owner = true,
	},
}

AddEventHandler('onServerResourceStart', function(resourceName)
	if resourceName == 'ox_inventory' or resourceName == GetCurrentResourceName then
		for i=1, #stashes do
			local stash = stashes[i]
			ox_inventory:RegisterStash(stash.id, stash.label, stash.slots, stash.weight, stash.owner, stash.jobs)
		end
	end

	Wait(500)

	local inventory = ox_inventory:GetInventory({id = 'example_stash_3', owner = 115})
	ox_inventory:AddItem(inventory.id, 'water', 1)
end)

-- Register this stash only when this event is called
RegisterNetEvent('ox:lazyStash', function()
	ox_inventory:RegisterStash('lazyStash', 'Stash', 20, 20000, true)
end)

exports('testburger', function(event, item, inventory, slot, data)
	if event == 'usingItem' then
		if ox_inventory:GetItem(inventory, item, inventory.items[slot].metadata, true) > 0 then
			-- if we return false here, we can cancel item use
			return {
				inventory.label, event, 'external item use poggies'
			}
		end

	elseif event == 'usedItem' then
		print(('%s just ate a %s from slot %s'):format(inventory.label, item.label, slot))

	elseif event == 'buying' then
		print(data.id, data.coords, json.encode(data.items[slot], {indent=true}))
	end
end)