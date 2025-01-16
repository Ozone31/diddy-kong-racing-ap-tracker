local variant = Tracker.ActiveVariantUID
IS_UNLABELLED = variant:find("maps-u")

Tracker:AddItems("items/items.json")

-- Logic
ScriptHost:LoadScript("scripts/logic/logic.lua")

-- Maps
Tracker:AddMaps("maps/maps.json")

-- Locations
Tracker:AddLocations("locations/locations_ti.json")
Tracker:AddLocations("locations/locations_dd.json")
Tracker:AddLocations("locations/locations_sm.json")
Tracker:AddLocations("locations/locations_si.json")
Tracker:AddLocations("locations/locations_df.json")
Tracker:AddLocations("locations/locations_ff.json")

-- Layout
Tracker:AddLayouts("layouts/world_maps.json")
Tracker:AddLayouts("layouts/items.json")
Tracker:AddLayouts("layouts/settings.json")
Tracker:AddLayouts("layouts/tabs.json")
Tracker:AddLayouts("layouts/tracker.json")
Tracker:AddLayouts("layouts/broadcast.json")

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end
