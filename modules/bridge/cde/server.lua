if not lib.checkDependency('cde-core', '0.4.0', true) then return end

local Inventory = require 'modules.inventory.server'
local db = require 'modules.mysql.server'

db.setup({
    user = { table = 'cde_characters', col = 'citizenid' },
    vehicle = { table = 'cde_vehicles', col = 'plate' },
})

local Core = exports['cde-core']

AddEventHandler('cde-core:server:playerUnloaded', server.playerDropped)

local function setCharacterInventory(player)
    server.setPlayerInventory({
        source = player.source,
        identifier = player.citizenid,
        name = player.name,
        groups = player.groups,
        sex = player.gender,
        dateofbirth = player.dateOfBirth,
    })
    Inventory.SetItem(player.source, 'money', player.cash)
end

local function setPoliceGroups(list)
    if type(list) ~= 'table' or #list == 0 then return end
    for name in pairs(shared.police) do shared.police[name] = nil end
    for i = 1, #list do shared.police[list[i]] = 0 end
end

setPoliceGroups(GlobalState['cde:lawGroups'])
AddStateBagChangeHandler('cde:lawGroups', 'global', function(_, _, value) setPoliceGroups(value) end)

SetTimeout(500, function()
    for _, player in pairs(Core:GetPlayers()) do
        setCharacterInventory(player)
    end
end)

server.UseItem = function(source, name, data)
    return Core:UseItem(source, name, data)
end

server.accounts = {
    money = 0
}

AddEventHandler('cde-core:server:playerLoaded', function(_, player)
    if not player then return end
    setCharacterInventory(player)
end)

AddEventHandler('cde-core:server:cashChanged', function(src, cash)
    if Inventory(src) then Inventory.SetItem(src, 'money', cash) end
end)

AddEventHandler('cde-core:server:groupsChanged', function(src, groups)
    local inventory = Inventory(src)
    if not inventory then return end
    inventory.player.groups = groups
end)

---@diagnostic disable-next-line: duplicate-set-field
function server.syncInventory(inv)
    local accounts = Inventory.GetAccountItemCounts(inv)

    if accounts then
        Core:SetCashFromInventory(inv.id, accounts.money)
    end
end

---@diagnostic disable-next-line: duplicate-set-field
function server.setPlayerData(player)
    return {
        source = player.source,
        identifier = player.identifier,
        name = player.name,
        groups = player.groups or {},
        sex = player.sex,
        dateofbirth = player.dateofbirth,
    }
end

---@diagnostic disable-next-line: duplicate-set-field
function server.hasLicense(inv, license)
    if Core:HasLicence(inv.id, license) then
        return license
    end
end

---@diagnostic disable-next-line: duplicate-set-field
function server.buyLicense(inv, license)
    if server.hasLicense(inv, license.name) then
        return false, 'already_have'
    end

    return false, 'cde_licence_from_cad'
end

---@diagnostic disable-next-line: duplicate-set-field
function server.isPlayerBoss(playerId, group)
    return Core:IsBoss(playerId, group)
end
