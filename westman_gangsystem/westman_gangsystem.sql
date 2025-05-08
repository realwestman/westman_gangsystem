INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('angels', 'Hells Angels', 1),
('ms13', 'MS 13', 1);


INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES 
('angels', 0, 'hangaround', 'Hangaround', 200, '{}', '{}'),
('angels', 1, 'prospect', 'Prospect', 300, '{}', '{}'),
('angels', 2, 'sergeant', 'Sergeant-At-Arms', 350, '{}', '{}'),
('angels', 3, 'president', 'President', 400, '{}', '{}');


INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES 
('ms13', 0, 'youth', 'Youth', 200, '{}', '{}'),
('ms13', 1, 'soldier', 'Soldier', 300, '{}', '{}'),
('ms13', 2, 'leader', 'Leader', 350, '{}', '{}'),
('ms13', 3, 'boss', 'Boss', 400, '{}', '{}');
