MoreFarms = {}

MoreFarms.MOD_NAME = g_currentModName
MoreFarms.MOD_DIR = g_currentModDirectory

if not g_modIsLoaded[MoreFarms.MOD_NAME] then
    return
end

g_overlayManager:addTextureConfigFile(MoreFarms.MOD_DIR .. "gui.xml", "moreFarmsGui")

local init = function()
    FarmManager.FARM_ID_SEND_NUM_BITS = 5
    FarmManager.MAX_NUM_FARMS = 30
    FarmManager.MAX_FARM_ID = 30
    FarmManager.SPECTATOR_FARM_ID = 0
    FarmManager.SINGLEPLAYER_FARM_ID = 1
    FarmManager.GUIDED_TOUR_FARM_ID = 31
    FarmManager.INVALID_FARM_ID = 32

    -- print("MAX_NUM_FARMS 2 => " .. FarmManager.MAX_NUM_FARMS)
    -- print("MAX_FARM_ID 2 => " .. FarmManager.MAX_FARM_ID)
    -- print("FARM_ID_SEND_NUM_BITS 2 => " .. FarmManager.FARM_ID_SEND_NUM_BITS)
    -- print("INVALID_FARM_ID 2 => " .. FarmManager.INVALID_FARM_ID)

    Farm.COLORS = {
        { 0.1961, 0.8627, 0.9373, 1 },  -- #32dcef
        { 0.4627, 0.8667, 0.1059, 1 },  -- #76dd1b
        { 0.2902, 0.1294, 0.9333, 1 },  -- #4a21ee
        { 0.4, 0.1765, 0.5529, 1 },     -- #662d8d
        { 0.5725, 0.7059, 0.8, 1 },     -- #92b4cc
        { 0.2235, 0.5569, 0.7451, 1 },  -- #398ebe
        { 0.3059, 0.3294, 0.8118, 1 },  -- #4e54cf
        { 0.7765, 0.9255, 0.3725, 1 },  -- #c6ec5f
        { 0.1176, 0.6078, 0.6431, 1 },  -- #1e9ba4
        { 0.2275, 0.3373, 0.3059, 1 },  -- #3a564e
        { 0.7412, 0.8471, 0.8471, 1 },  -- #bdd8d8
        { 0.4549, 0.902, 0.7333, 1 },   -- #74e6bb
        { 0.6235, 0.9686, 0.4078, 1 },  -- #9ff768
        { 0.2863, 0.7137, 0.1608, 1 },  -- #49b629
        { 0.1922, 0.2549, 0.6118, 1 },  -- #31419c
        { 0.7569, 0.9647, 0.1922, 1 },  -- #c1f631
        { 0.0118, 0.6784, 0.0863, 1 },  -- #03ad16
        { 0.4863, 0.949, 1.0, 1 },      -- #7cf2ff
        { 0.2078, 0.1451, 0.8039, 1 },  -- #3525cd
        { 0.5529, 0.2588, 0.6941, 1 },  -- #8d42b1
        { 0.3176, 0.1137, 0.5333, 1 },  -- #511d88
        { 0.9765, 0.6824, 0.5294, 1 },  -- #f9ae87
        { 0.2706, 0.9216, 0.549, 1 },   -- #45eb8c
        { 0.2471, 0.1804, 0.0902, 1 },  -- #3f2e17
        { 0.7569, 0.5137, 0.3608, 1 },  -- #c1835c
        { 0.9569, 0.3451, 0.9412, 1 },  -- #f458f0
        { 0.5098, 0.1137, 0.8314, 1 },  -- #821dd4
        { 0.3176, 0.2471, 0.5686, 1 },  -- #513f91
        { 0.2196, 0.1529, 0.4667, 1 },  -- #382777
        { 0.9294, 0.3451, 0.5373, 1 },  -- #ed5889
        { 0.7686, 0.9255, 0.2, 1 },     -- #c4ec33
        { 0.2667, 0.4941, 0.702, 1 },   -- #447eb3
    }

    -- local uv = Farm.ICON_UVS
    -- --for i=#uv, FarmManager.MAX_NUM_FARMS do
    -- for i = 1, FarmManager.MAX_NUM_FARMS do
    --     --Farm.ICON_UVS[i] = uv[i%7];
    --     table.insert(Farm.ICON_UVS, uv[(i % 8) + 1])
    -- end

    Farm.ICON_UVS = {
        { 330, 0, 256, 256 },
        { 660, 0, 256, 256 },
        { 330, 310, 256, 256 },
        { 0, 310, 256, 256 },
        { 660, 310, 256, 256 },
        { 0, 620, 256, 256 },
        { 330, 620, 256, 256 },
        { 660, 620, 256, 256 },
        { 330, 0, 256, 256 },
        { 660, 0, 256, 256 },
        { 330, 310, 256, 256 },
        { 0, 310, 256, 256 },
        { 660, 310, 256, 256 },
        { 0, 620, 256, 256 },
        { 330, 620, 256, 256 },
        { 660, 620, 256, 256 },
        { 330, 0, 256, 256 },
        { 660, 0, 256, 256 },
        { 330, 310, 256, 256 },
        { 0, 310, 256, 256 },
        { 660, 310, 256, 256 },
        { 0, 620, 256, 256 },
        { 330, 620, 256, 256 },
        { 660, 620, 256, 256 },
        { 330, 0, 256, 256 },
        { 660, 0, 256, 256 },
        { 330, 310, 256, 256 },
        { 0, 310, 256, 256 },
        { 660, 310, 256, 256 },
        { 0, 620, 256, 256 },
        { 330, 620, 256, 256 },
        { 660, 620, 256, 256 },
    }



    Farm.ICON_SLICE_IDS = {
        "moreFarmsGui.multiplayer_barn", -- FarmId => 1    Color => #32dcef
        "moreFarmsGui.multiplayer_tacktor", -- FarmId => 2    Color => #76dd1b
        "moreFarmsGui.multiplayer_scarcrow", -- FarmId => 3    Color => #4a21ee
        "moreFarmsGui.multiplayer_boots", -- FarmId => 4    Color => #662d8d
        "moreFarmsGui.multiplayer_wood", -- FarmId => 5    Color => #92b4cc
        "moreFarmsGui.multiplayer_hay", -- FarmId => 6    Color => #398ebe
        "moreFarmsGui.multiplayer_cow", -- FarmId => 7    Color => #4e54cf
        "moreFarmsGui.multiplayer_chicken", -- FarmId => 8    Color => #c6ec5f
        "moreFarmsGui.multiplayer_mower", -- FarmId => 9    Color => #1e9ba4
        "moreFarmsGui.multiplayer_pig", -- FarmId => 10    Color => #3a564e
        "moreFarmsGui.multiplayer_chainsaw", -- FarmId => 11    Color => #bdd8d8
        "moreFarmsGui.multiplayer_goat", -- FarmId => 12    Color => #74e6bb
        "moreFarmsGui.multiplayer_truck", -- FarmId => 13    Color => #9ff768
        "moreFarmsGui.multiplayer_apple", -- FarmId => 14    Color => #49b629
        "moreFarmsGui.multiplayer_tornado", -- FarmId => 15    Color => #31419c
        "moreFarmsGui.multiplayer_fox", -- FarmId => 16    Color => #c1f631
        "moreFarmsGui.multiplayer_grain", -- FarmId => 17    Color => #03ad16
        "moreFarmsGui.multiplayer_bee", -- FarmId => 18    Color => #7cf2ff
        "moreFarmsGui.multiplayer_hedgehog", -- FarmId => 19    Color => #3525cd
        "moreFarmsGui.multiplayer_stump", -- FarmId => 20    Color => #8d42b1
        "moreFarmsGui.multiplayer_windmill", -- FarmId => 21    Color => #511d88
        "moreFarmsGui.multiplayer_wheelborrow", -- FarmId => 22    Color => #f9ae87
        "moreFarmsGui.multiplayer_rabbit", -- FarmId => 23    Color => #45eb8c
        "moreFarmsGui.multiplayer_beet", -- FarmId => 24    Color => #3f2e17
        "moreFarmsGui.multiplayer_wateringcan", -- FarmId => 25    Color => #c1835c
        "moreFarmsGui.multiplayer_spade", -- FarmId => 26    Color => #f458f0
        "moreFarmsGui.multiplayer_dairy", -- FarmId => 27    Color => #821dd4
        "moreFarmsGui.multiplayer_production", -- FarmId => 28    Color => #513f91
        "moreFarmsGui.multiplayer_transport", -- FarmId => 29    Color => #382777
        "moreFarmsGui.multiplayer_harvester", -- FarmId => 30    Color => #ed5889
        "moreFarmsGui.multiplayer_watertransport", -- FarmId => 31    Color => #c4ec33
        "moreFarmsGui.multiplayer_backhoo", -- FarmId => 32    Color => #447eb3
    }
end

g_xmlManager:addCreateSchemaFunction(
    function()
        MoreFarms.xmlSchema = XMLSchema.new("farmColors")
    end
)

g_xmlManager:addInitSchemaFunction(
    function()
        local schema = MoreFarms.xmlSchema

        schema:register(XMLValueType.COLOR, "farmColors.farm(?)#color", "Farm Color")

        -- print("MAX_NUM_FARMS => " .. FarmManager.MAX_NUM_FARMS)
        -- print("MAX_FARM_ID => " .. FarmManager.MAX_FARM_ID)
        -- print("FARM_ID_SEND_NUM_BITS => " .. FarmManager.FARM_ID_SEND_NUM_BITS)
        -- print("INVALID_FARM_ID => " .. FarmManager.INVALID_FARM_ID)

        init()
    end
)

local oldStoreAvailableColors = EditFarmDialog.storeAvailableColors
function EditFarmDialog:storeAvailableColors(editingFarmId)
    oldStoreAvailableColors(self, editingFarmId)

    for i = #self.availableColors, 9, -1 do
        table.remove(self.availableColors, i)
        self.availableColorIndexMap[i] = nil
    end
end

function MoreFarms:createFarm(superFunc, name, colour, password, farmId)
    --print("FarmID Incomming => " .. farmId)

    if not g_currentMission:getIsServer() then
        printError("Error: FarmManager:createFarm() only allowed on server")
        return nil
    end

    if
        farmId ~= FarmManager.SINGLEPLAYER_FARM_ID and
            (not g_currentMission.missionDynamicInfo.isMultiplayer and #self.farms > 2)
     then
        return nil
    end

    local newFarm = Farm.new(true, g_client ~= nil)

    --if farmId ~= FarmManager.SINGLEPLAYER_FARM_ID and #self.farms == FarmManager.MAX_NUM_FARMS + 2 then
    --return nil, "Farm limit reached"
    --end

    if self.farmIdToFarm[farmId] ~= nil then
        farmId = nil
    end

    if farmId == nil then
        farmId = self:findNextFarmId()
        print("Next available Farm ID identified:", farmId)
    end

    print("FarmID => " .. farmId)

    newFarm.farmId = farmId
    newFarm.name = name
    newFarm.color = colour

    if password ~= "" then
        newFarm.password = password
    end

    newFarm:register()
    local farms = self.farms
    table.insert(farms, newFarm)

    print("newFarm FarmID => " .. newFarm.farmId)

    self.farmIdToFarm[newFarm.farmId] = newFarm
    g_messageCenter:publish(MessageType.FARM_CREATED, newFarm.farmId)

    return newFarm
end

function MoreFarms.findNextFarmId(p120)
    for v121 = 1, FarmManager.MAX_FARM_ID do
        -- print("START-------------------------------------")
        -- print("Checking Farm ID:", v121)
        local v122 = false
        -- print("Initial v122 value:", v122)

        -- print("Full farms table details:")
        for i, farm in ipairs(p120.farms) do
            if farm then
                -- print(string.format("Index: %d, Farm ID: %s", i, tostring(farm.farmId)))
            else
                -- print(string.format("Index: %d, Farm is nil", i))
            end
        end

        for _, v123 in ipairs(p120.farms) do
            -- Add checks to ensure v123 is a valid table with a farmId
            if v123 == nil then
                -- print("Warning: v123 is nil at v121:", v121)
            elseif v123.farmId == nil then
                -- print("Warning: v123.farmId is nil at v121:", v121)
            else
                if v123.farmId == 14 then
                    -- print("Processing farmId 14. Current v121:", v121)
                end

                -- print("Comparing v123.farmId:", v123.farmId, "with v121:", v121)
                if v121 == v123.farmId then
                    v122 = true
                    -- print("Match found for v121:", v121)
                    break
                end
            end
        end

        if not v122 then
            -- print("Returning ID:", v121, "with v122:", v122)
            return v121
        end
    end

    -- print("No available Farm ID found.")
    return nil
end

FarmManager.createFarm = Utils.overwrittenFunction(FarmManager.createFarm, MoreFarms.createFarm)
FarmManager.findNextFarmId = Utils.overwrittenFunction(FarmManager.findNextFarmId, MoreFarms.findNextFarmId)
