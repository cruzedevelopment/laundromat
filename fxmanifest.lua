fx_version 'cerulean'
game 'gta5'
lua54 'yes'

shared_script '@ox_lib/init.lua'
server_scripts { 'shared/*.lua', 'src/server/*.lua' }
client_script 'src/client/*.lua'