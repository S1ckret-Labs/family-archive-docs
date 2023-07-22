select * from Paths;
select * from UploadObjectStatuses;

-- Get user's root object id
select root_object_id from Users where user_id = 1;

-- Get user's upload files
select request_id, object_key, status_name from UploadRequests
join UploadRequestStatuses using (status_id)
where user_id = 2;

-- Get user's directories from directories
select object_id, object_key, size_bytes, objects_inside
from DirsAndPaths
where ancestor = 1; -- 1 is a root object

-- Get user's archives from directory
select object_id, object_key, size_bytes, locked_until_sec, storage_path
from ArchivesAndPaths
where ancestor = 23; -- 23 is a dir object

-- Get user's files from archive
select object_id, object_key, size_bytes, taken_at_sec, thumbnail_path
from FilesAndPaths
where ancestor = 27; -- 27 is an archive object


-- Get user's archives from a file
select o.*, a.locked_until_sec, a.storage_path, p.* from Objects as o 
join Archives as a using(object_id)
join Paths as p on o.object_id = p.ancestor
where p.descendant = 22; -- 22 is a file object

-- Get user's dirs from a file
select o.*, d.objects_inside, p.* from Objects as o 
join Directories as d using(object_id)
join Paths as p on o.object_id = p.ancestor
where p.descendant = 22; -- 22 is a file object