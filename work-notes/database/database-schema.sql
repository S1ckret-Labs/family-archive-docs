DROP TABLE IF EXISTS `Users`;
DROP TABLE IF EXISTS `UserMetrics`;
DROP TABLE IF EXISTS `UserMetriss`;
DROP TABLE IF EXISTS `UploadRequests`;
DROP TABLE IF EXISTS `UploadRequestStatuses`;
DROP TABLE IF EXISTS `Objects`;
DROP TABLE IF EXISTS `Paths`;
DROP TABLE IF EXISTS `Directories`;
DROP TABLE IF EXISTS `Files`;
DROP TABLE IF EXISTS `Archives`;

-- Stores user profile
CREATE TABLE `Users` (
  `user_id` BIGINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) UNIQUE NOT NULL,
  `name` VARCHAR(255),
  `surname` VARCHAR(255),
  `root_object_id` BIGINT UNSIGNED NOT NULL
);

-- Stores usage metrics, such as GB stored, requests, GB/month, for particular user.
CREATE TABLE `UserMetrics` (
  `user_id` BIGINT UNSIGNED PRIMARY KEY NOT NULL,
  `bytes_stored` DECIMAL NOT NULL,
  `files_stored` BIGINT UNSIGNED NOT NULL,
  `archives_stored` BIGINT UNSIGNED NOT NULL,
  `restore_requests` BIGINT UNSIGNED NOT NULL
);

-- Stores user's files to upload
CREATE TABLE `UploadRequests` (
  `request_id` BIGINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED NOT NULL,
  `status_id` BIGINT UNSIGNED NOT NULL,
  `object_key` VARCHAR(255) NOT NULL -- File name including directory. e.g. "cats/orange.png"
  `size_bytes` BIGINT UNSIGNED NOT NULL,
  `taken_at_sec` BIGINT UNSIGNED NULL,
);

-- Enum table for file statuses "Pending upload", "Uploaded", "Pending archvation"
CREATE TABLE `UploadRequestStatuses` (
  `status_id` BIGINT UNSIGNED PRIMARY KEY NOT NULL,
  `status_name` VARCHAR(255) NOT NULL
);

-- Stores user's archives to restore
CREATE TABLE `RestoreRequests` (
  `request_id` BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT NOT NULL,
  `status_id` BIGINT NOT NULL,
  `archive_id` BIGINT NOT NULL,
  `requested_at_sec` BIGINT NOT NULL,
  `available_till_sec` BIGINT NOT NULL,
  `available_for_days` INT NOT NULL
);

-- Enum table for archive restore statuses "In progress", "Restored", "Expired"
CREATE TABLE `RestoreRequestStatuses` (
  `status_id` BIGINT PRIMARY KEY NOT NULL,
  `status_name` VARCHAR NOT NULL
);

-- Base table, stores common attributes for files, directories and archives.
CREATE TABLE `Objects` (
  `object_id` BIGINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `object_key` VARCHAR(255) NOT NULL, -- Key including directory. e.g. "cats/orange.png"
  `size_bytes` BIGINT UNSIGNED NOT NULL
);

-- Stores all possible paths between ancestor and descendants 
CREATE TABLE `Paths` (
  `ancestor` BIGINT UNSIGNED NOT NULL,
  `descendant` BIGINT UNSIGNED NOT NULL,
  `path_length` INT NOT NULL,
  PRIMARY KEY (`ancestor`, `descendant`)
);

CREATE TABLE `Directories` (
  `object_id` BIGINT UNSIGNED PRIMARY KEY NOT NULL,
  `objects_inside` BIGINT UNSIGNED NOT NULL
);

CREATE TABLE `Files` (
  `object_id` BIGINT UNSIGNED PRIMARY KEY NOT NULL,
  `thumbnail_path` VARCHAR(255) NULL,
  `taken_at_sec` BIGINT UNSIGNED NULL
);

CREATE TABLE `Archives` (
  `object_id` BIGINT UNSIGNED PRIMARY KEY NOT NULL,
  `locked_until_sec` BIGINT UNSIGNED NOT NULL,
  `storage_path` VARCHAR(255) NOT NULL
);

ALTER TABLE `Users` ADD FOREIGN KEY (`root_object_id`) REFERENCES `Objects` (`object_id`);

ALTER TABLE `UserMetrics` ADD FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

ALTER TABLE `RestoreRequests` ADD FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

ALTER TABLE `RestoreRequests` ADD FOREIGN KEY (`status_id`) REFERENCES `RestoreRequestStatuses` (`status_id`);

ALTER TABLE `RestoreRequests` ADD FOREIGN KEY (`archive_id`) REFERENCES `Archives` (`object_id`);

ALTER TABLE `UploadRequests` ADD FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

ALTER TABLE `UploadRequests` ADD FOREIGN KEY (`status_id`) REFERENCES `UploadRequestsStatuses` (`status_id`);

ALTER TABLE `Paths` ADD FOREIGN KEY (`ancestor`) REFERENCES `Objects` (`object_id`);

ALTER TABLE `Paths` ADD FOREIGN KEY (`descendant`) REFERENCES `Objects` (`object_id`);

ALTER TABLE `Directories` ADD FOREIGN KEY (`object_id`) REFERENCES `Objects` (`object_id`);

ALTER TABLE `Files` ADD FOREIGN KEY (`object_id`) REFERENCES `Objects` (`object_id`);

ALTER TABLE `Archives` ADD FOREIGN KEY (`object_id`) REFERENCES `Objects` (`object_id`);
