fx_version 'cerulean'
rdr3_warning 'Its free resources'
game 'rdr3'
author 'XaVar0'

description 'xav_naturalhorse'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua',
}
files {
    'locales/*.json',
}

dependencies {

    'ox_lib'
}
lua54 'yes'
