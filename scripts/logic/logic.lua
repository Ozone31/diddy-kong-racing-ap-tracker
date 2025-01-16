function has(item, amount)
    local count = Tracker:ProviderCountForCode(item)
    amount = tonumber(amount)
    if not amount then
        return count > 0
    else
        return count >= amount
    end
end

function BalloonCount()
    Tracker:FindObjectForCode('balloon').AcquiredCount = Tracker:FindObjectForCode('balloon_ti').AcquiredCount + Tracker:FindObjectForCode('balloon_dd').AcquiredCount + Tracker:FindObjectForCode('balloon_sm').AcquiredCount + Tracker:FindObjectForCode('balloon_si').AcquiredCount + Tracker:FindObjectForCode('balloon_df').AcquiredCount + Tracker:FindObjectForCode('balloon_ff').AcquiredCount
end

-- Boss Access

function can_access_boss_1(region)
    local required_dd = 4 - Tracker:FindObjectForCode('balloon_dd').AcquiredCount
    local required_sm = 4 - Tracker:FindObjectForCode('balloon_sm').AcquiredCount
    local required_si = 4 - Tracker:FindObjectForCode('balloon_si').AcquiredCount
    local required_df = 4 - Tracker:FindObjectForCode('balloon_df').AcquiredCount
    if region == "DD" and (required_dd <= 0) then
        return true
    elseif region == "SM" and (required_sm <= 0) then
        return true
    elseif region == "SI" and (required_si <= 0) then
        return true
    elseif region == "DF" and (required_df <= 0) then
        return true
    else
        return false
    end
end

function can_access_boss_2(region)
    local required_dd = 8 - Tracker:FindObjectForCode('balloon_dd').AcquiredCount
    local required_sm = 8 - Tracker:FindObjectForCode('balloon_sm').AcquiredCount
    local required_si = 8 - Tracker:FindObjectForCode('balloon_si').AcquiredCount
    local required_df = 8 - Tracker:FindObjectForCode('balloon_df').AcquiredCount
    if region == "DD" and (required_dd <= 0) then
        return true
    elseif region == "SM" and (required_sm <= 0) then
        return true
    elseif region == "SI" and (required_si <= 0) then
        return true
    elseif region == "DF" and (required_df <= 0) then
        return true
    else
        return false
    end
end

-- Dino Domain

function DinoDomainAccess()
    if has("openworlds_on") or (Tracker:FindObjectForCode('balloon').AcquiredCount >= DINO_DOMAIN_UNLOCK) then
        return true
    else
        return false
    end
end

function AncientLake1Access()
    if Tracker:FindObjectForCode('balloon').AcquiredCount >= ANCIENT_LAKE_1_UNLOCK then
        return true
    else
        return false
    end
end

function AncientLake2Access()
    if (Tracker:FindObjectForCode('balloon').AcquiredCount >= ANCIENT_LAKE_2_UNLOCK) and can_access_boss_1("DD") then
        return true
    else
        return false
    end
end

function FossilCanyon1Access()
    if Tracker:FindObjectForCode('balloon').AcquiredCount >= FOSSIL_CANYON_1_UNLOCK then
        return true
    else
        return false
    end
end

function FossilCanyon2Access()
    if (Tracker:FindObjectForCode('balloon').AcquiredCount >= FOSSIL_CANYON_2_UNLOCK) and can_access_boss_1("DD") then
        return true
    else
        return false
    end
end

function JungleFalls1Access()
    if Tracker:FindObjectForCode('balloon').AcquiredCount >= JUNGLE_FALLS_1_UNLOCK then
        return true
    else
        return false
    end
end

function JungleFalls2Access()
    if (Tracker:FindObjectForCode('balloon').AcquiredCount >= JUNGLE_FALLS_2_UNLOCK) and can_access_boss_1("DD") then
        return true
    else
        return false
    end
end

function HotTopVolcano1Access()
    if Tracker:FindObjectForCode('balloon').AcquiredCount >= HOT_TOP_VOLCANO_1_UNLOCK then
        return true
    else
        return false
    end
end

function HotTopVolcano2Access()
    if (Tracker:FindObjectForCode('balloon').AcquiredCount >= HOT_TOP_VOLCANO_2_UNLOCK) and can_access_boss_1("DD") then
        return true
    else
        return false
    end
end

-- Snowflake Mountain

function SnowflakeMountainAccess()
    if has("openworlds_on") or (Tracker:FindObjectForCode('balloon').AcquiredCount >= SNOWFLAKE_MOUNTAIN_UNLOCK) then
        return true
    else
        return false
    end
end

function EverfrostPeak1Access()
    if Tracker:FindObjectForCode('balloon').AcquiredCount >= EVERFROST_PEAK_1_UNLOCK then
        return true
    else
        return false
    end
end

function EverfrostPeak2Access()
    if (Tracker:FindObjectForCode('balloon').AcquiredCount >= EVERFROST_PEAK_2_UNLOCK) and can_access_boss_1("SM") then
        return true
    else
        return false
    end
end

function WalrusCove1Access()
    if Tracker:FindObjectForCode('balloon').AcquiredCount >= WALRUS_COVE_1_UNLOCK then
        return true
    else
        return false
    end
end

function WalrusCove2Access()
    if (Tracker:FindObjectForCode('balloon').AcquiredCount >= WALRUS_COVE_2_UNLOCK) and can_access_boss_1("SM") then
        return true
    else
        return false
    end
end

function SnowballValley1Access()
    if Tracker:FindObjectForCode('balloon').AcquiredCount >= SNOWBALL_VALLEY_1_UNLOCK then
        return true
    else
        return false
    end
end

function SnowballValley2Access()
    if (Tracker:FindObjectForCode('balloon').AcquiredCount >= SNOWBALL_VALLEY_2_UNLOCK) and can_access_boss_1("SM") then
        return true
    else
        return false
    end
end

function FrostyVillage1Access()
    if Tracker:FindObjectForCode('balloon').AcquiredCount >= FROSTY_VILLAGE_1_UNLOCK then
        return true
    else
        return false
    end
end

function FrostyVillage2Access()
    if (Tracker:FindObjectForCode('balloon').AcquiredCount >= FROSTY_VILLAGE_2_UNLOCK) and can_access_boss_1("SM") then
        return true
    else
        return false
    end
end

-- Sherbet Island

function SherbetIslandAccess()
    if has("openworlds_on") or (Tracker:FindObjectForCode('balloon').AcquiredCount >= SHERBET_ISLAND_UNLOCK) then
        return true
    else
        return false
    end
end

function WhaleBay1Access()
    if Tracker:FindObjectForCode('balloon').AcquiredCount >= WHALE_BAY_1_UNLOCK then
        return true
    else
        return false
    end
end

function WhaleBay2Access()
    if (Tracker:FindObjectForCode('balloon').AcquiredCount >= WHALE_BAY_2_UNLOCK) and can_access_boss_1("SI") then
        return true
    else
        return false
    end
end

function CrescentIsland1Access()
    if Tracker:FindObjectForCode('balloon').AcquiredCount >= CRESCENT_ISLAND_1_UNLOCK then
        return true
    else
        return false
    end
end

function CrescentIsland2Access()
    if (Tracker:FindObjectForCode('balloon').AcquiredCount >= CRESCENT_ISLAND_2_UNLOCK) and can_access_boss_1("SI") then
        return true
    else
        return false
    end
end

function PirateLagoon1Access()
    if Tracker:FindObjectForCode('balloon').AcquiredCount >= PIRATE_LAGOON_1_UNLOCK then
        return true
    else
        return false
    end
end

function PirateLagoon2Access()
    if (Tracker:FindObjectForCode('balloon').AcquiredCount >= PIRATE_LAGOON_2_UNLOCK) and can_access_boss_1("SI") then
        return true
    else
        return false
    end
end

function TreasureCaves1Access()
    if Tracker:FindObjectForCode('balloon').AcquiredCount >= TREASURE_CAVES_1_UNLOCK then
        return true
    else
        return false
    end
end

function TreasureCaves2Access()
    if (Tracker:FindObjectForCode('balloon').AcquiredCount >= TREASURE_CAVES_2_UNLOCK) and can_access_boss_1("SI") then
        return true
    else
        return false
    end
end

-- Dragon Forest

function DragonForestAccess()
    if has("openworlds_on") or (Tracker:FindObjectForCode('balloon').AcquiredCount >= DRAGON_FOREST_UNLOCK) then
        return true
    else
        return false
    end
end

function WindmillPlains1Access()
    if Tracker:FindObjectForCode('balloon').AcquiredCount >= WINDMILL_PLAINS_1_UNLOCK then
        return true
    else
        return false
    end
end

function WindmillPlains2Access()
    if (Tracker:FindObjectForCode('balloon').AcquiredCount >= WINDMILL_PLAINS_2_UNLOCK) and can_access_boss_1("DF") then
        return true
    else
        return false
    end
end

function GreenwoodVillage1Access()
    if Tracker:FindObjectForCode('balloon').AcquiredCount >= GREENWOOD_VILLAGE_1_UNLOCK then
        return true
    else
        return false
    end
end

function GreenwoodVillage2Access()
    if (Tracker:FindObjectForCode('balloon').AcquiredCount >= GREENWOOD_VILLAGE_2_UNLOCK) and can_access_boss_1("DF") then
        return true
    else
        return false
    end
end

function BoulderCanyon1Access()
    if Tracker:FindObjectForCode('balloon').AcquiredCount >= BOULDER_CANYON_1_UNLOCK then
        return true
    else
        return false
    end
end

function BoulderCanyon2Access()
    if (Tracker:FindObjectForCode('balloon').AcquiredCount >= BOULDER_CANYON_2_UNLOCK) and can_access_boss_1("DF") then
        return true
    else
        return false
    end
end

function HauntedWoods1Access()
    if Tracker:FindObjectForCode('balloon').AcquiredCount >= HAUNTED_WOODS_1_UNLOCK then
        return true
    else
        return false
    end
end

function HauntedWoods2Access()
    if (Tracker:FindObjectForCode('balloon').AcquiredCount >= HAUNTED_WOODS_2_UNLOCK) and can_access_boss_1("DF") then
        return true
    else
        return false
    end
end

-- Wizpig 1

function Wizpig1Access()
    if has("wpamulet_4") then
        return true
    else
        return false
    end
end

-- Future Fun Land

function FutureFunLandAccess()
    if has("openworlds_on") or (Wizpig1Access() and (has("skiptrophyraces_on") or (can_access_boss_2("DD") and can_access_boss_2("SM") and can_access_boss_2("SI") and can_access_boss_2("DF")))) then
        return true
    else
        return false
    end
end

function SpacedustAlley1Access()
    if Tracker:FindObjectForCode('balloon').AcquiredCount >= SPACEDUST_ALLEY_1_UNLOCK then
        return true
    else
        return false
    end
end

function SpacedustAlley2Access()
    if Tracker:FindObjectForCode('balloon').AcquiredCount >= SPACEDUST_ALLEY_2_UNLOCK then
        return true
    else
        return false
    end
end

function DarkmoonCaverns1Access()
    if Tracker:FindObjectForCode('balloon').AcquiredCount >= DARKMOON_CAVERNS_1_UNLOCK then
        return true
    else
        return false
    end
end

function DarkmoonCaverns2Access()
    if Tracker:FindObjectForCode('balloon').AcquiredCount >= DARKMOON_CAVERNS_2_UNLOCK then
        return true
    else
        return false
    end
end

function SpaceportAlpha1Access()
    if Tracker:FindObjectForCode('balloon').AcquiredCount >= SPACEPORT_ALPHA_1_UNLOCK then
        return true
    else
        return false
    end
end

function SpaceportAlpha2Access()
    if Tracker:FindObjectForCode('balloon').AcquiredCount >= SPACEPORT_ALPHA_2_UNLOCK then
        return true
    else
        return false
    end
end

function StarCity1Access()
    if Tracker:FindObjectForCode('balloon').AcquiredCount >= STAR_CITY_1_UNLOCK then
        return true
    else
        return false
    end
end

function StarCity2Access()
    if Tracker:FindObjectForCode('balloon').AcquiredCount >= STAR_CITY_2_UNLOCK then
        return true
    else
        return false
    end
end

-- Wizpig 2

function Wizpig2Access()
    if has("ttamulet_4") and has("balloon", 47) then
        return true
    else
        return false
    end
end

ScriptHost:AddWatchForCode("balloontiwatch", "balloon_ti", BalloonCount)
ScriptHost:AddWatchForCode("balloonddwatch", "balloon_dd", BalloonCount)
ScriptHost:AddWatchForCode("balloonsmwatch", "balloon_sm", BalloonCount)
ScriptHost:AddWatchForCode("balloonsiwatch", "balloon_si", BalloonCount)
ScriptHost:AddWatchForCode("balloondfwatch", "balloon_df", BalloonCount)
ScriptHost:AddWatchForCode("balloonffwatch", "balloon_ff", BalloonCount)