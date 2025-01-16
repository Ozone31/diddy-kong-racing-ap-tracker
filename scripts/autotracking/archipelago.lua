ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/hints_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/map_mapping.lua")

CUR_INDEX = -1
--SLOT_DATA = nil

FLAG_CODES = {
}

DINO_DOMAIN_UNLOCK = 1
SNOWFLAKE_MOUNTAIN_UNLOCK = 3
SHERBET_ISLAND_UNLOCK = 14
DRAGON_FOREST_UNLOCK = 22
ANCIENT_LAKE_1_UNLOCK = 2
ANCIENT_LAKE_2_UNLOCK = 9
FOSSIL_CANYON_1_UNLOCK = 4
FOSSIL_CANYON_2_UNLOCK = 11
JUNGLE_FALLS_1_UNLOCK = 6
JUNGLE_FALLS_2_UNLOCK = 12
HOT_TOP_VOLCANO_1_UNLOCK = 8
HOT_TOP_VOLCANO_2_UNLOCK = 15
EVERFROST_PEAK_1_UNLOCK = 5
EVERFROST_PEAK_2_UNLOCK = 16
WALRUS_COVE_1_UNLOCK = 7
WALRUS_COVE_2_UNLOCK = 18
SNOWBALL_VALLEY_1_UNLOCK = 10
SNOWBALL_VALLEY_2_UNLOCK = 21
FROSTY_VILLAGE_1_UNLOCK = 13
FROSTY_VILLAGE_2_UNLOCK = 24
WHALE_BAY_1_UNLOCK =17
WHALE_BAY_2_UNLOCK = 27
CRESCENT_ISLAND_1_UNLOCK = 19
CRESCENT_ISLAND_2_UNLOCK = 29
PIRATE_LAGOON_1_UNLOCK = 20
PIRATE_LAGOON_2_UNLOCK = 30
TREASURE_CAVES_1_UNLOCK = 25
TREASURE_CAVES_2_UNLOCK = 32
WINDMILL_PLAINS_1_UNLOCK = 26
WINDMILL_PLAINS_2_UNLOCK = 34
GREENWOOD_VILLAGE_1_UNLOCK = 28
GREENWOOD_VILLAGE_2_UNLOCK = 35
BOULDER_CANYON_1_UNLOCK = 31
BOULDER_CANYON_2_UNLOCK = 36
HAUNTED_WOODS_1_UNLOCK = 33
HAUNTED_WOODS_2_UNLOCK = 37
SPACEDUST_ALLEY_1_UNLOCK = 38
SPACEDUST_ALLEY_2_UNLOCK = 42
DARKMOON_CAVERNS_1_UNLOCK = 39
DARKMOON_CAVERNS_2_UNLOCK = 43
SPACEPORT_ALPHA_1_UNLOCK = 40
SPACEPORT_ALPHA_2_UNLOCK = 44
STAR_CITY_1_UNLOCK = 41
STAR_CITY_2_UNLOCK = 46

function has_value (t, val)
    for i, v in ipairs(t) do
        if v == val then return 1 end
    end
    return 0
end

function dump_table(o, depth)
    if depth == nil then
        depth = 0
    end
    if type(o) == 'table' then
        local tabs = ('\t'):rep(depth)
        local tabs2 = ('\t'):rep(depth + 1)
        local s = '{\n'
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            s = s .. tabs2 .. '[' .. k .. '] = ' .. dump_table(v, depth + 1) .. ',\n'
        end
        return s .. tabs .. '}'
    else
        return tostring(o)
    end
end


function onClear(slot_data)
    Tracker.BulkUpdate = true
    SLOT_DATA = slot_data
    CUR_INDEX = -1
    -- reset locations
    for _, v in pairs(LOCATION_MAPPING) do
        if v[1] then
            local obj = Tracker:FindObjectForCode(v[1])
            if obj then
                if v[1]:sub(1, 1) == "@" then
                    obj.AvailableChestCount = obj.ChestCount
                else
                    obj.Active = false
                end
            end
        end
    end
    -- reset items
    for _, v in pairs(ITEM_MAPPING) do
        if v[1] and v[2] then
            if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: clearing item %s of type %s", v[1], v[2]))
            end
            local obj = Tracker:FindObjectForCode(v[1])
            if obj then
                if v[2] == "toggle" then
                    obj.Active = false
                elseif v[2] == "progressive" then
                    obj.CurrentStage = 0
                    obj.Active = false
                elseif v[2] == "consumable" then
                    obj.AcquiredCount = 0
                elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                    print(string.format("onClear: unknown item type %s for code %s", v[2], v[1]))
                end
            elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: could not find object for code %s", v[1]))
            end
        end
    end

    if slot_data == nil  then
        print("welp")
        return
    end

    PLAYER_ID = Archipelago.PlayerNumber or -1
    TEAM_NUMBER = Archipelago.TeamNumber or 0

    if slot_data['victory_condition'] then
        local obj = Tracker:FindObjectForCode("goal")
        local stage = slot_data['victory_condition']
        if stage then
            obj.CurrentStage = stage
        end
    end

    if slot_data['open_worlds'] then
        local obj = Tracker:FindObjectForCode("openworlds")
        local stage = slot_data['open_worlds']
        if stage == "false" then
            obj.CurrentStage = 0
        elseif stage == "true" then
            obj.CurrentStage = 1
        end
    end

    if slot_data['skip_trophy_races'] then
        local obj = Tracker:FindObjectForCode("skiptrophyraces")
        local stage = slot_data['skip_trophy_races']
        if stage == "true" then
            obj.CurrentStage = 0
        elseif stage == "false" then
            obj.CurrentStage = 1
        end
    end

    if slot_data['door_unlock_requirements'] then
        for k,v in pairs(slot_data.door_unlock_requirements) do
            if k == 1 then
                DINO_DOMAIN_UNLOCK = v
            elseif k == 2 then
                SNOWFLAKE_MOUNTAIN_UNLOCK = v
            elseif k == 3 then
                SHERBET_ISLAND_UNLOCK = v
            elseif k == 4 then
                DRAGON_FOREST_UNLOCK = v
            elseif k == 5 then
                ANCIENT_LAKE_1_UNLOCK = v
            elseif k == 6 then
                ANCIENT_LAKE_2_UNLOCK = v
            elseif k == 7 then
                FOSSIL_CANYON_1_UNLOCK = v
            elseif k == 8 then
                FOSSIL_CANYON_2_UNLOCK = v
            elseif k == 9 then
                JUNGLE_FALLS_1_UNLOCK = v
            elseif k == 10 then
                JUNGLE_FALLS_2_UNLOCK = v
            elseif k == 11 then
                HOT_TOP_VOLCANO_1_UNLOCK = v
            elseif k == 12 then
                HOT_TOP_VOLCANO_2_UNLOCK = v
            elseif k == 13 then
                EVERFROST_PEAK_1_UNLOCK = v
            elseif k == 14 then
                EVERFROST_PEAK_2_UNLOCK = v
            elseif k == 15 then
                WALRUS_COVE_1_UNLOCK = v
            elseif k == 16 then
                WALRUS_COVE_2_UNLOCK = v
            elseif k == 17 then
                SNOWBALL_VALLEY_1_UNLOCK = v
            elseif k == 18 then
                SNOWBALL_VALLEY_2_UNLOCK = v
            elseif k == 19 then
                FROSTY_VILLAGE_1_UNLOCK = v
            elseif k == 20 then
                FROSTY_VILLAGE_2_UNLOCK = v
            elseif k == 21 then
                WHALE_BAY_1_UNLOCK = v
            elseif k == 22 then
                WHALE_BAY_2_UNLOCK = v
            elseif k == 23 then
                CRESCENT_ISLAND_1_UNLOCK = v
            elseif k == 24 then
                CRESCENT_ISLAND_2_UNLOCK = v
            elseif k == 25 then
                PIRATE_LAGOON_1_UNLOCK = v
            elseif k == 26 then
                PIRATE_LAGOON_2_UNLOCK = v
            elseif k == 27 then
                TREASURE_CAVES_1_UNLOCK = v
            elseif k == 28 then
                TREASURE_CAVES_2_UNLOCK = v
            elseif k == 29 then
                WINDMILL_PLAINS_1_UNLOCK = v
            elseif k == 30 then
                WINDMILL_PLAINS_2_UNLOCK = v
            elseif k == 31 then
                GREENWOOD_VILLAGE_1_UNLOCK = v
            elseif k == 32 then
                GREENWOOD_VILLAGE_2_UNLOCK = v
            elseif k == 33 then
                BOULDER_CANYON_1_UNLOCK = v
            elseif k == 34 then
                BOULDER_CANYON_2_UNLOCK = v
            elseif k == 35 then
                HAUNTED_WOODS_1_UNLOCK = v
            elseif k == 36 then
                HAUNTED_WOODS_2_UNLOCK = v
            elseif k == 37 then
                SPACEDUST_ALLEY_1_UNLOCK = v
            elseif k == 38 then
                SPACEDUST_ALLEY_2_UNLOCK = v
            elseif k == 39 then
                DARKMOON_CAVERNS_1_UNLOCK = v
            elseif k == 40 then
                DARKMOON_CAVERNS_2_UNLOCK = v
            elseif k == 41 then
                SPACEPORT_ALPHA_1_UNLOCK = v
            elseif k == 42 then
                SPACEPORT_ALPHA_2_UNLOCK = v
            elseif k == 43 then
                STAR_CITY_1_UNLOCK = v
            elseif k == 44 then
                STAR_CITY_2_UNLOCK = v
            end
        end
    end
    
    --print(dump_table(slot_data))

    if PLAYER_ID > -1 then
    
        HINTS_ID = "_read_hints_"..TEAM_NUMBER.."_"..PLAYER_ID
        Archipelago:SetNotify({HINTS_ID})

        map_key = "DKR_"..TEAM_NUMBER.."_"..PLAYER_ID.."_map"
        Archipelago:SetNotify({map_key})
        Archipelago:Get({map_key})
    end

    --banjo_map = 
    --print(banjo_map)
end

function onItem(index, item_id, item_name, player_number)
    if index <= CUR_INDEX then
        return
    end
    local is_local = player_number == Archipelago.PlayerNumber
    CUR_INDEX = index;
    local v = ITEM_MAPPING[item_id]
    if not v or not v[1] then
        --print(string.format("onItem: could not find item mapping for id %s", item_id))
        return
    end
    local obj = Tracker:FindObjectForCode(v[1])
    if obj then
        if v[2] == "toggle" then
            obj.Active = true
        elseif v[2] == "progressive" then
            if obj.Active then
                obj.CurrentStage = obj.CurrentStage + 1
            else
                obj.Active = true
            end
        elseif v[2] == "consumable" then
            obj.AcquiredCount = obj.AcquiredCount + obj.Increment
        elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("onItem: unknown item type %s for code %s", v[2], v[1]))
        end
    else
        print(string.format("onItem: could not find object for code %s", v[1]))
    end
end

--called when a location gets cleared
function onLocation(location_id, location_name)
    local v = LOCATION_MAPPING[location_id]
    if not v or not v[1] then
        print(string.format("onLocation: could not find location mapping for id %s", location_id))
        return
    end
    for _, location in pairs(v) do
        local obj = Tracker:FindObjectForCode(location)
        -- print(location, obj)
        if obj then
            if location:sub(1, 1) == "@" then
                obj.AvailableChestCount = obj.AvailableChestCount - 1
            else
                obj.Active = true
            end
        else
            print(string.format("onLocation: could not find object for code %s", location))
        end
    end
end

function onNotify(key, value, old_value)

    if value ~= old_value and key == HINTS_ID then
        for _, hint in ipairs(value) do
            if not hint.found and hint.finding_player == Archipelago.PlayerNumber then
                updateHints(hint.location)
            end
        end
    end
end

function onNotifyLaunch(key, value)
    Tracker.BulkUpdate = false
    if key == HINTS_ID then
        for _, hint in ipairs(value) do
            if not hint.found and hint.finding_player == Archipelago.PlayerNumber then
                updateHints(hint.location)
            end
        end
    end
end

function onMapChange(key, value, old)
    --print("got  " .. key .. " = " .. tostring(value) .. " (was " .. tostring(old) .. ")")
    --print(dump_table(MAP_MAPPING[tostring(value)]))
    if has("automap_on") then
        tabs = MAP_MAPPING[tostring(value)]
        for i, tab in ipairs(tabs) do
            Tracker:UiHint("ActivateTab", tab)
        end
    end
end

Archipelago:AddClearHandler("clear handler", onClear)
Archipelago:AddItemHandler("item handler", onItem)
Archipelago:AddLocationHandler("location handler", onLocation)
Archipelago:AddSetReplyHandler("notify handler", onNotify)
Archipelago:AddRetrievedHandler("notify launch handler", onNotifyLaunch)
Archipelago:AddSetReplyHandler("map_key", onMapChange)
Archipelago:AddRetrievedHandler("map_key", onMapChange)
