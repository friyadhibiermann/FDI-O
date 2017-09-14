-- file : config.lua
local module = {}

module.SSID = {}  
module.SSID["FDI-O"] = "Banyubirue1"

module.HOST = "192.168.8.1"  
module.PORT = 8883  
module.ID = node.chipid()

module.ENDPOINT = "nodemcu/"  
return module  