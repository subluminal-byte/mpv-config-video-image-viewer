local utils = require 'mp.utils'

local profile = {
	ud = "UD",
    fhd = "FHD",
    hd = "HD",
	sd = "SD"
}

local function set_profile()
	if  mp.get_property_number("height") >= 3800 then
        mp.commandv("apply-profile", profile.ud)
    elseif  mp.get_property_number("height") >= 1281 and mp.get_property_number("height") < 3800 then
		mp.commandv("apply-profile", profile.fhd)
    elseif  mp.get_property_number("height") >= 641 and mp.get_property_number("height") < 1281 then
		mp.commandv("apply-profile", profile.hd)
    else
		mp.commandv("apply-profile", profile.sd)
	end
end

mp.register_event("file-loaded", set_profile)
