-- Itens ThunderGuy no loot do mundo (armas, fantasias, lojas de roupa, guarda-roupas).
require "Items/ProceduralDistributions"

local loot = {
    {"MeleeWeapons", "ThunderGuyHammer", 0.5},
    {"MeleeWeapons_Mid", "ThunderGuyHammer", 0.5},
    {"MeleeWeapons_Late", "ThunderGuyHammer", 0.5},
    {"MedievalWeapons", "ThunderGuyHammer", 2},
    {"PawnShopTools", "ThunderGuyHammer", 0.5},
    {"AnthropologyDisplayWeapons", "ThunderGuyHammer", 1},
    {"MeleeWeapons", "ThunderGuyAxe", 0.3},
    {"MeleeWeapons_Mid", "ThunderGuyAxe", 0.3},
    {"MeleeWeapons_Late", "ThunderGuyAxe", 0.3},
    {"MedievalWeapons", "ThunderGuyAxe", 1},
    {"AnthropologyDisplayWeapons", "ThunderGuyAxe", 1},
    {"CrateCostume", "Hat_ThunderGuyHelmet", 0.5},
    {"CrateCostume", "Jacket_ThunderGuyVest", 0.5},
    {"CrateCostume", "Trousers_ThunderGuyPants", 0.5},
    {"CrateCostume", "Shoes_ThunderGuyBoots", 0.5},
    {"BackstageClothingRack", "Hat_ThunderGuyHelmet", 0.3},
    {"BackstageClothingRack", "Jacket_ThunderGuyVest", 0.3},
    {"BackstageClothingRack", "Trousers_ThunderGuyPants", 0.3},
    {"BackstageClothingRack", "Shoes_ThunderGuyBoots", 0.3},
    {"AnthropologyDisplayClothing", "Hat_ThunderGuyHelmet", 0.5},
    {"AnthropologyDisplayClothing", "Jacket_ThunderGuyVest", 0.5},
    {"ClothingStoresHeadwear", "Hat_ThunderGuyHelmet", 0.3},
    {"ClothingStoresJacketsLeather", "Jacket_ThunderGuyVest", 0.5},
    {"ClothingStoresPantsLeather", "Trousers_ThunderGuyPants", 1},
    {"ClothingStoresBoots", "Shoes_ThunderGuyBoots", 1},
    {"WardrobeGeneric", "Hat_ThunderGuyHelmet", 0.05},
    {"WardrobeGeneric", "Jacket_ThunderGuyVest", 0.05},
    {"WardrobeGeneric", "Trousers_ThunderGuyPants", 0.05},
    {"WardrobeGeneric", "Shoes_ThunderGuyBoots", 0.05},
}

for _, e in ipairs(loot) do
    local list = ProceduralDistributions.list[e[1]]
    if list and list.items then
        table.insert(list.items, "Base." .. e[2])
        table.insert(list.items, e[3])
    end
end
