fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'ArielZ'
description 'OverTrue RolePlay scrapman-job for ND_Core, you can convert it if you want to other frameworks feel free to use the script but please dont sell the script.'
version '1.0.0'
lua54 'yes'

dependencies {
    'ND_Core',
    'ox_lib',
	'ox_inventory',
	'oxmysql'
}


shared_scripts { 
	'@ND_Core/init.lua',
	'@ox_lib/init.lua',
}

client_scripts {
	'main/cl_scrapman.lua',
}

server_scripts {
	'main/sv_scrapman.lua',
}
