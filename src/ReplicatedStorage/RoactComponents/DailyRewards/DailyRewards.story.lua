local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.Roact)
local handle 

local app = function () 
	return Roact.createElement(require(script.Parent), {
		
	})
end


return function (target)
	handle = Roact.mount(Roact.createElement(app), target)
	
	return function ()
		Roact.unmount(handle)
	end
end