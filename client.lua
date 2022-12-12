local ox_inventory = exports.ox_inventory

RegisterCommand('policestash', function()
    ox_inventory:openInventory('stash', 'example_stash')
end)

RegisterCommand('ownedstash', function()
    ox_inventory:openInventory('stash', {id='example_stash_2', owner=1})
end)

RegisterCommand('pstash', function(src, args)
    ox_inventory:openInventory('stash', {id='example_stash_3', owner=tonumber(args[1]) or 1})
end)

RegisterCommand('lazystash', function()
    if ox_inventory:openInventory('stash', 'lazyStash') == false then
        TriggerServerEvent('ox:lazyStash')
        ox_inventory:openInventory('stash', 'lazyStash')
    end
end)

exports('testburger', function(data, slot)
    print(json.encode(slot, {indent=true}))
    ox_inventory:useItem(data, function(data)
		if data then
			print(json.encode(data, {indent=true}))
			ox_inventory:notify({text = 'You ate a delicious '..data.name})
		end
	end)
end)
