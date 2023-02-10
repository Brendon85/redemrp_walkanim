fx_version "adamant"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'blue edit by @outsider'
game "rdr3"
lua54 'yes'

client_script 'client/client.lua'
shared_script {
    'config.lua',
    'locale.lua',
    'languages/*.lua'
}
server_script {
  'server/server.lua',
  '@oxmysql/lib/MySQL.lua', 
}
