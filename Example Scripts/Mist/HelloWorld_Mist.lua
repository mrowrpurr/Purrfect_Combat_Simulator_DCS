--[[ In this example, we print to the dcs.log using a Mist logger ]]--

local myLogger = mist.Logger:new("some logger tag", 3)

myLogger:info("Hello from Mist!")
