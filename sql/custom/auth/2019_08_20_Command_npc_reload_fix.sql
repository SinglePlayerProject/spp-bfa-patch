SET FOREIGN_KEY_CHECKS=0;

-- NPC Reload Command Fix
DELETE FROM `rbac_permissions` WHERE `id`=2006;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES (2006, 'npc reload');
DELETE FROM `rbac_default_permissions` WHERE `secId`=3 AND `permissionId`=2006 AND `realmId`=-1;
INSERT INTO `rbac_default_permissions` (`secId`, `permissionId`, `realmId`) VALUES (3, 2006, -1);
