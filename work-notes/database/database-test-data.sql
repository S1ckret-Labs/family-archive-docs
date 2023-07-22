-- Root folders
INSERT INTO `Objects` (`object_key`, `size_bytes`) 
VALUES 
	('/', 0),
	('/', 0);

-- Users
INSERT INTO `Users` (`email`, `name`, `surname`, `root_object_id`) 
VALUES 
	('johndoe@example.com', 'John', 'Doe', 1),
	('janedoe@example.com', 'Jane', 'Doe', 2);

-- UserMetrics
INSERT INTO `UserMetrics` (`user_id`, `bytes_stored`, `files_stored`, `archives_stored`, `restore_requests`) 
VALUES 
	(1, 1500000, 9, 2, 0),
	(2, 2300000, 11, 2, 0);

INSERT INTO `UploadRequests` (`user_id`, `status_id`, `object_key`)
VALUES 
	(1, 1, "IMG_20230601_101201.jpg"),
	(1, 1, "IMG_20230602_102202.jpg"),
	(1, 1, "IMG_20230603_103203.jpg"),
	(1, 1, "IMG_20230604_104204.jpg"),
	(2, 1, "IMG_20230605_105205.jpg"),
	(2, 1, "IMG_20230606_106206.jpg");

INSERT INTO `UploadRequestStatuses` (`status_id`, `status_name`)
VALUES 
	(1, "Pending upload"),
	(2, "Uploaded"),
	(3, "Pending archival");

  
-- Files
INSERT INTO `Objects` (`object_key`, `size_bytes`)
VALUES 
  ('IMG_20220601_101201.jpg', FLOOR(RAND() * 5000000) + 1000000),
  ('IMG_20220602_102202.jpg', FLOOR(RAND() * 5000000) + 1000000),
  ('IMG_20220603_103203.jpg', FLOOR(RAND() * 5000000) + 1000000),
  
  ('IMG_20230604_104204.jpg', FLOOR(RAND() * 5000000) + 1000000),
  ('IMG_20230605_105205.jpg', FLOOR(RAND() * 5000000) + 1000000),
  ('IMG_20230606_106206.jpg', FLOOR(RAND() * 5000000) + 1000000),
  ('IMG_20230607_107207.jpg', FLOOR(RAND() * 5000000) + 1000000),
  ('IMG_20230608_108208.jpg', FLOOR(RAND() * 5000000) + 1000000),
  ('IMG_20230609_109209.jpg', FLOOR(RAND() * 5000000) + 1000000),
  
  ('IMG_20200610_110210.jpg', FLOOR(RAND() * 5000000) + 1000000),
  ('IMG_20200611_111211.jpg', FLOOR(RAND() * 5000000) + 1000000),
  ('IMG_20200612_112212.jpg', FLOOR(RAND() * 5000000) + 1000000),
  ('IMG_20200613_113213.jpg', FLOOR(RAND() * 5000000) + 1000000),
  ('IMG_20200614_114214.jpg', FLOOR(RAND() * 5000000) + 1000000),
  
  ('IMG_20210615_115215.jpg', FLOOR(RAND() * 5000000) + 1000000),
  ('IMG_20210616_116216.jpg', FLOOR(RAND() * 5000000) + 1000000),
  ('IMG_20210617_117217.jpg', FLOOR(RAND() * 5000000) + 1000000),
  ('IMG_20210618_118218.jpg', FLOOR(RAND() * 5000000) + 1000000),
  ('IMG_20210619_119219.jpg', FLOOR(RAND() * 5000000) + 1000000),
  ('IMG_20210620_120220.jpg', FLOOR(RAND() * 5000000) + 1000000);

-- Directories
INSERT INTO `Objects` (`object_key`, `size_bytes`)
VALUES 
  ('2022', FLOOR(RAND() * 5000000) + 1000000),
  ('2023', FLOOR(RAND() * 5000000) + 1000000),
  ('2020', FLOOR(RAND() * 5000000) + 1000000),
  ('2021', FLOOR(RAND() * 5000000) + 1000000);
  
-- Archives
INSERT INTO `Objects` (`object_key`, `size_bytes`)
VALUES 
  ('archive-2022.06.01-03.zip', FLOOR(RAND() * 5000000) + 1000000),
  ('archive-2023.06.04-09.zip', FLOOR(RAND() * 5000000) + 1000000),
  ('archive-2020.06.10-14.zip', FLOOR(RAND() * 5000000) + 1000000),
  ('archive-2021.06.15-20.zip', FLOOR(RAND() * 5000000) + 1000000);
  
-- Real archives
INSERT INTO `Archives` (`object_id`, `locked_until_sec`, `storage_path`) 
VALUES 
	(27, 1640995200, '/path/to/archive-2022.06.01-03.zip'),
	(28, 1640995200, '/path/to/archive-2023.06.04-09.zip'),
	(29, 1640995200, '/path/to/archive-2020.06.10-14.zip'),
	(30, 1640995200, '/path/to/archive-2021.06.15-20.zip');
  
  
-- Root directories  
INSERT INTO `Directories` (`object_id`, `objects_inside`) 
VALUES 
	(1, 9),
	(2, 11);

-- Real directories  
INSERT INTO `Directories` (`object_id`, `objects_inside`) 
VALUES 
	(23, 3),
	(24, 6),
	(25, 5),
	(26, 6);
    
-- Real files
INSERT INTO `Files` (`object_id`, `thumbnail_path`, `taken_at_sec`)
	VALUES 
    (3, null, 1640995200),
    (4, null, 1640995200),
    (5, null, 1640995200),
    
    (6, null, 1640995200),
    (7, null, 1640995200),
    (8, null, 1640995200),
    (9, null, 1640995200),
    (10, null, 1640995200),
    (11, null, 1640995200),

    (12, null, 1640995200),
    (13, null, 1640995200),
    (14, null, 1640995200),
    (15, null, 1640995200),
    (16, null, 1640995200),

    (17, null, 1640995200),
    (18, null, 1640995200),
    (19, null, 1640995200),
    (20, null, 1640995200),
    (21, null, 1640995200),
    (22, null, 1640995200);
    
INSERT INTO `Paths` (`ancestor`, `descendant`, `path_length`)
VALUES
	-- Self reference
	(1, 1, 0),
	(2, 2, 0),
	(3, 3, 0),
	(4, 4, 0),
	(5, 5, 0),
	(6, 6, 0),
	(7, 7, 0),
	(8, 8, 0),
	(9, 9, 0),
	(10, 10, 0),
	(11, 11, 0),
	(12, 12, 0),
	(13, 13, 0),
	(14, 14, 0),
	(15, 15, 0),
	(16, 16, 0),
	(17, 17, 0),
	(18, 18, 0),
	(19, 19, 0),
	(20, 20, 0),
	(21, 21, 0),
	(22, 22, 0),
	(23, 23, 0),
	(24, 24, 0),
	(25, 25, 0),
	(26, 26, 0),
	(27, 27, 0),
	(28, 28, 0),
	(29, 29, 0),
	(30, 30, 0),
    -- User 1 root to directories
    (1, 23, 1),
    (1, 24, 1),
    -- User 1 root to archives
    (1, 27, 2),
    (1, 28, 2),
    -- User 1 root to files
    (1, 3, 3),
    (1, 4, 3),
    (1, 5, 3),
    (1, 6, 3),
    (1, 7, 3),
    (1, 8, 3),
    (1, 9, 3),
    (1, 10, 3),
    (1, 11, 3),
    -- User 1 directories to archives
    (23, 27, 1),
    (24, 28, 1),
	-- User 1 directories to files
    (23, 3, 2),
    (23, 4, 2),
    (23, 5, 2),
    (24, 6, 2),
    (24, 7, 2),
    (24, 8, 2),
    (24, 9, 2),
    (24, 10, 2),
    (24, 11, 2),
    -- User 1 archives to files
    (27, 3, 1),
    (27, 4, 1),
    (27, 5, 1),
    (28, 6, 1),
    (28, 7, 1),
    (28, 8, 1),
    (28, 9, 1),
    (28, 10, 1),
    (28, 11, 1),    
	-- User 2 root to directories
    (2, 25, 1),
    (2, 26, 1),
    -- User 2 root to archives
    (2, 29, 2),
    (2, 30, 2),
    -- User 2 root to files
    (2, 12, 3),
    (2, 13, 3),
    (2, 14, 3),
    (2, 15, 3),
    (2, 16, 3),
    (2, 17, 3),
    (2, 18, 3),
    (2, 19, 3),
    (2, 20, 3),
    (2, 21, 3),
    (2, 22, 3),
    -- User 2 directories to archives
	(25, 29, 1),
	(26, 30, 1),
	-- User 2 directories to files
    (25, 12, 2),
    (25, 13, 2),
    (25, 14, 2),
    (25, 15, 2),
    (25, 16, 2),
    (26, 17, 2),
    (26, 18, 2),
    (26, 19, 2),
    (26, 20, 2),
    (26, 21, 2),
    (26, 22, 2),
	-- User 2 archives to files
    (29, 12, 1),
    (29, 13, 1),
    (29, 14, 1),
    (29, 15, 1),
    (29, 16, 1),
    (30, 17, 1),
    (30, 18, 1),
    (30, 19, 1),
    (30, 20, 1),
    (30, 21, 1),
    (30, 22, 1);
