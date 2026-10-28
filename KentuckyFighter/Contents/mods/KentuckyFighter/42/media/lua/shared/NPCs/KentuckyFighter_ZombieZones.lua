-- Kentucky Fighter: zumbis (vivos e corpos) com o outfit de cada personagem em qualquer lugar do mapa, na % do
-- sandbox (SandboxVars.KentuckyFighter.<Personagem>Chance). Gerado pelo build_mod.py.
--
-- Como o jogo sorteia (ZombiesZoneDefinition, Java): na zona Default é um sorteio POR PESO entre os outfits sem
-- "room" do sexo do zumbi (os genéricos pesam 20 cada); nas zonas especiais é um sorteio em 100 e, se não cair
-- em nenhum, o zumbi vai para a Default. Por isso a % vira peso: em cada zona e sexo, com T = soma dos outros
-- outfits e P = soma das nossas %, peso = p * T / (1 - P) dá exatamente p nos dois casos.
-- O Java copia a tabela no 1º zumbi depois de qualquer Lua carregado; o sandbox do mundo já está em SandboxVars no
-- OnInitGlobalModData, antes do 1º zumbi.
require "NPCs/ZombiesZoneDefinition"

local OUTFITS = {
    {name = "KF_WhiteFighter", option = "WhiteFighterChance", default = 1},
    {name = "KF_RedFighter", option = "RedFighterChance", default = 1},
    {name = "KF_RedCommander", option = "RedCommanderChance", default = 1},
}

local function applyKentuckyFighterChances()
    local vars = SandboxVars and SandboxVars.KentuckyFighter or {}
    local pct, total = {}, 0
    for _, o in ipairs(OUTFITS) do
        local p = tonumber(vars[o.option]) or o.default
        p = math.max(0, math.min(100, p)) / 100
        pct[o.name] = p
        total = total + p
    end
    local free = math.max(1 - total, 0.01)

    for _, zone in pairs(ZombiesZoneDefinition) do
        if type(zone) == "table" then
            local others = {male = 0, female = 0}
            for key, def in pairs(zone) do
                if type(def) == "table" and def.name and not pct[def.name] and not def.room
                        and tostring(def.mandatory) ~= "true" then
                    local gender = def.gender and string.lower(def.gender)
                    local c = tonumber(def.chance) or 0
                    if gender ~= "female" then others.male = others.male + c end
                    if gender ~= "male" then others.female = others.female + c end
                end
            end
            for _, o in ipairs(OUTFITS) do
                for sex, t in pairs(others) do
                    local w = pct[o.name] * t / free
                    zone["KentuckyFighter_" .. o.name .. "_" .. sex] = (w > 0) and {name = o.name, gender = sex, chance = w} or nil
                end
            end
        end
    end

    local log = {}
    for _, o in ipairs(OUTFITS) do table.insert(log, o.name .. "=" .. (pct[o.name] * 100) .. "%") end
    print("KentuckyFighter: zombie outfit chances " .. table.concat(log, ", "))
end

applyKentuckyFighterChances()   -- valores padrão até o mundo carregar o sandbox
Events.OnInitGlobalModData.Add(applyKentuckyFighterChances)
