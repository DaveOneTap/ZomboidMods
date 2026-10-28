-- Slot do sobretudo: logo antes da mochila (BACK), depois de coletes, webbing, coldres e jaquetas,
-- então é desenhado por cima de tudo isso.
require "NPCs/BodyLocations"

local group = BodyLocations.getGroup("Human")
local loc = RedWitcherVest.OVERCOAT
group:getOrCreateLocation(loc)
group:moveLocationToIndex(loc, group:indexOf(ItemBodyLocation.BACK))

-- roupas de corpo inteiro / roupões ocupam o mesmo espaço
for _, other in ipairs({
    ItemBodyLocation.FULL_SUIT,
    ItemBodyLocation.FULL_SUIT_HEAD,
    ItemBodyLocation.FULL_TOP,
    ItemBodyLocation.BODY_COSTUME,
    ItemBodyLocation.BATH_ROBE,
    ItemBodyLocation.FULL_ROBE,
}) do
    group:setExclusive(loc, other)
end
