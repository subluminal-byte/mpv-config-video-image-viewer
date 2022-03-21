local utils = require 'mp.utils'

local profile = {
	ud = "UD",
    fhd = "FHD",
    hd = "HD",
	sd = "SD"
}

local function set_profile()
	if  mp.get_property_number("height") >= 1440 then
        mp.commandv("apply-profile", profile.ud)
    elseif  mp.get_property_number("height") >= 1080 and mp.get_property_number("height") < 1440 then
		mp.commandv("apply-profile", profile.fhd)
    elseif  mp.get_property_number("height") >= 720 and mp.get_property_number("height") < 1080 then
		mp.commandv("apply-profile", profile.hd)
    else
		mp.commandv("apply-profile", profile.sd)
	end
end

mp.register_event("file-loaded", set_profile)
