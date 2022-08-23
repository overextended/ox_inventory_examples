--[[ FX Information ]]--
fx_version   'cerulean'
use_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'

--[[ Resource Information ]]--
name         'ox_test'
author       'Linden'
version      '1.0.0'
repository   ''
description  ''

--[[ Manifest ]]--
dependencies {
    '/onesync',
}

shared_scripts {
	'@ox_lib/init.lua'
}

server_scripts {
    'server.lua'
}

client_scripts {
    'client.lua'
}