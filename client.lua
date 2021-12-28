local ox_inventory = exports.ox_inventory

RegisterCommand('policestash', function()
    ox_inventory:openInventory('stash', 'example_stash')
end)

RegisterCommand('ownedstash', function()
    ox_inventory:openInventory('stash', 'example_stash_2')
end)

RegisterCommand('personalstash', function()
    ox_inventory:openInventory('stash', 'example_stash_3')
end)

AddEventHandler('ox_testburger', function(data, slot)
    print(json.encode(slot, {indent=true}))
    ox_inventory:useItem(data, function(data)
		if data then
			print(json.encode(data, {indent=true}))
			ox_inventory:notify({text = 'You ate a delicious '..data.name})
		end
	end)
end)