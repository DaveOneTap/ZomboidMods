-- Armas no zumbi ThunderGuy: 60% deles carregam UMA das armas (maxitem = 1).
-- attachedWeaponCustomOutfit tem chance própria, independente da chance global de arma presa do sandbox.
require "Definitions/AttachedWeaponDefinitions"

AttachedWeaponDefinitions.thunderGuyHammerBelt = {
	id = "thunderGuyHammerBelt",
	chance = 50,
	outfit = {"ThunderGuy"},
	weaponLocation = {"Belt Left"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	ensureItem = "Base.Belt2",
	weapons = { "Base.ThunderGuyHammer" },
}

AttachedWeaponDefinitions.thunderGuyAxeBack = {
	id = "thunderGuyAxeBack",
	chance = 50,
	outfit = {"ThunderGuy"},
	weaponLocation = {"Big Weapon On Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	ensureItem = nil,
	weapons = { "Base.ThunderGuyAxe" },
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit = AttachedWeaponDefinitions.attachedWeaponCustomOutfit or {}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.ThunderGuy = {
	chance = 60;
	maxitem = 1;
	weapons = {
		AttachedWeaponDefinitions.thunderGuyHammerBelt,
		AttachedWeaponDefinitions.thunderGuyAxeBack,
	},
}
