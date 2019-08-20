DELETE FROM `race_unlock_requirement` WHERE `raceID`IN (27, 28, 29, 30, 34, 36);
INSERT INTO `race_unlock_requirement` (`raceID`, `expansion`, `achievementId`) VALUES 
(27, 7, 0),
(28, 7, 0),
(29, 7, 0),
(30, 7, 0),
(36, 7, 0),
(34, 7, 0);

DELETE FROM `playercreateinfo` WHERE `race`=27 AND `class`=1;
DELETE FROM `playercreateinfo` WHERE `race`=27 AND `class`=3;
DELETE FROM `playercreateinfo` WHERE `race`=27 AND `class`=4;
DELETE FROM `playercreateinfo` WHERE `race`=27 AND `class`=5;
DELETE FROM `playercreateinfo` WHERE `race`=27 AND `class`=8;
DELETE FROM `playercreateinfo` WHERE `race`=27 AND `class`=9;
DELETE FROM `playercreateinfo` WHERE `race`=27 AND `class`=10;

DELETE FROM `playercreateinfo` WHERE `race`=28 AND `class`=1;
DELETE FROM `playercreateinfo` WHERE `race`=28 AND `class`=3;
DELETE FROM `playercreateinfo` WHERE `race`=28 AND `class`=7;
DELETE FROM `playercreateinfo` WHERE `race`=28 AND `class`=10;
DELETE FROM `playercreateinfo` WHERE `race`=28 AND `class`=11;

DELETE FROM `playercreateinfo` WHERE `race`=29 AND `class`=1;
DELETE FROM `playercreateinfo` WHERE `race`=29 AND `class`=3;
DELETE FROM `playercreateinfo` WHERE `race`=29 AND `class`=4;
DELETE FROM `playercreateinfo` WHERE `race`=29 AND `class`=5;
DELETE FROM `playercreateinfo` WHERE `race`=29 AND `class`=8;
DELETE FROM `playercreateinfo` WHERE `race`=29 AND `class`=9;
DELETE FROM `playercreateinfo` WHERE `race`=29 AND `class`=10;

DELETE FROM `playercreateinfo` WHERE `race`=30 AND `class`=1;
DELETE FROM `playercreateinfo` WHERE `race`=30 AND `class`=2;
DELETE FROM `playercreateinfo` WHERE `race`=30 AND `class`=3;
DELETE FROM `playercreateinfo` WHERE `race`=30 AND `class`=5;
DELETE FROM `playercreateinfo` WHERE `race`=30 AND `class`=8;

DELETE FROM `playercreateinfo` WHERE `race`=34 AND `class`=1;
DELETE FROM `playercreateinfo` WHERE `race`=34 AND `class`=2;
DELETE FROM `playercreateinfo` WHERE `race`=34 AND `class`=3;
DELETE FROM `playercreateinfo` WHERE `race`=34 AND `class`=4;
DELETE FROM `playercreateinfo` WHERE `race`=34 AND `class`=5;
DELETE FROM `playercreateinfo` WHERE `race`=34 AND `class`=7;
DELETE FROM `playercreateinfo` WHERE `race`=34 AND `class`=8;
DELETE FROM `playercreateinfo` WHERE `race`=34 AND `class`=9;
DELETE FROM `playercreateinfo` WHERE `race`=34 AND `class`=10;


DELETE FROM `playercreateinfo` WHERE `race`=36 AND `class`=1;
DELETE FROM `playercreateinfo` WHERE `race`=36 AND `class`=3;
DELETE FROM `playercreateinfo` WHERE `race`=36 AND `class`=4;
DELETE FROM `playercreateinfo` WHERE `race`=36 AND `class`=5;
DELETE FROM `playercreateinfo` WHERE `race`=36 AND `class`=7;
DELETE FROM `playercreateinfo` WHERE `race`=36 AND `class`=8;
DELETE FROM `playercreateinfo` WHERE `race`=36 AND `class`=10;

INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES 
(27, 10, 1220, 7637, 288.381, 3352.23, 145.444, 2.35153),
(27, 9, 1220, 7637, 288.381, 3352.23, 145.444, 2.35153),
(27, 8, 1220, 7637, 288.381, 3352.23, 145.444, 2.35153),
(27, 5, 1220, 7637, 288.381, 3352.23, 145.444, 2.35153),
(27, 4, 1220, 7637, 288.381, 3352.23, 145.444, 2.35153),
(27, 3, 1220, 7637, 288.381, 3352.23, 145.444, 2.35153),
(27, 1, 1220, 7637, 288.381, 3352.23, 145.444, 2.35153),
(28, 11, 1220, 7731, 4079.05, 4392.38, 670.625, 5.18155),
(28, 10, 1220, 7731, 4079.05, 4392.38, 670.625, 5.18155),
(28, 7, 1220, 7731, 4079.05, 4392.38, 670.625, 5.18155),
(28, 3, 1220, 7731, 4079.05, 4392.38, 670.625, 5.18155),
(28, 1, 1220, 7731, 4079.05, 4392.38, 670.625, 5.18155),
(29, 10, 1865, 9415, 2121, 3318, 54.7061, 0.0872665),
(29, 9, 1865, 9415, 2121, 3318, 54.7061, 0.0872665),
(29, 8, 1865, 9415, 2121, 3318, 54.7061, 0.0872665),
(29, 5, 1865, 9415, 2121, 3318, 54.7061, 0.0872665),
(29, 4, 1865, 9415, 2121, 3318, 54.7061, 0.0872665),
(29, 3, 1865, 9415, 2121, 3318, 54.7061, 0.0872665),
(29, 1, 1865, 9415, 2121, 3318, 54.7061, 0.0872665),
(30, 8, 1860, 9359, 458.823, 1449.61, 757.573, 0.466425),
(30, 5, 1860, 9359, 458.823, 1449.61, 757.573, 0.466425),
(30, 3, 1860, 9359, 458.823, 1449.61, 757.573, 0.466425),
(30, 2, 1860, 9359, 458.823, 1449.61, 757.573, 0.466425),
(30, 1, 1860, 9359, 458.823, 1449.61, 757.573, 0.466425),
(34, 9, 0, 10028, -8177.66, 792.195, 73.9964, 5.99607),
(34, 8, 0, 10028, -8177.66, 792.195, 73.9964, 5.99607),
(34, 7, 0, 10028, -8177.66, 792.195, 73.9964, 5.99607),
(34, 5, 0, 10028, -8177.66, 792.195, 73.9964, 5.99607),
(34, 3, 0, 10028, -8177.66, 792.195, 73.9964, 5.99607),
(34, 2, 0, 10028, -8177.66, 792.195, 73.9964, 5.99607),
(34, 1, 0, 10028, -8177.66, 792.195, 73.9964, 5.99607),
(34, 4, 0, 10028, -8177.66, 792.195, 73.9964, 5.99607),
(34, 10, 0, 10028, -8177.66, 792.195, 73.9964, 5.99607),
(36, 10, 1, 14, 1567.38, -4189.12, 53.6794, 2.2874),
(36, 8, 1, 14, 1567.38, -4189.12, 53.6794, 2.2874),
(36, 5, 1, 14, 1567.38, -4189.12, 53.6794, 2.2874),
(36, 4, 1, 14, 1567.38, -4189.12, 53.6794, 2.2874),
(36, 3, 1, 14, 1567.38, -4189.12, 53.6794, 2.2874),
(36, 1, 1, 14, 1567.38, -4189.12, 53.6794, 2.2874),
(36, 7, 1, 14, 1567.38, -4189.12, 53.6794, 2.2874);
