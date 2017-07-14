return {

	baseType = 'device',

	name = 'Thermostat mode device adapter',

	matches = function (device, adapterManager)
		local res = (device.deviceSubType == 'Thermostat Mode')
		if (not res) then
			adapterManager.addDummyMethod(device, 'updateMode')
		end
		return res
	end,

	process = function (device, data, domoticz, utils, adapterManager)

		function device.updateMode(mode)
			device.update(mode, mode)
		end

	end

}

