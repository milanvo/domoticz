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

		-- device['SetPoint'] = device.rawData[1] or 0

		function device.updateMode(mode)
			-- send the command using openURL otherwise, due to a bug in Domoticz, you will get a timeout on the script

			-- local url = domoticz.settings['Domoticz url']..
			-- 		'/json.htm?type=command&param=udevice&idx=' .. device.id .. '&nvalue=' .. mode
			-- utils.log('Setting mode using openURL ' .. url, utils.LOG_DEBUG)
			device.update(mode, mode)
		end

	end

}

