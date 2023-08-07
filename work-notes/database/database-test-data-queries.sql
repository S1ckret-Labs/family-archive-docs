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

-- Select parents, Files, Directories, Archives for particular object_root_id and depth
-- change `ancestor = X` for object_rood_id
-- change `path_length <= X` for depth
select o.object_id, p.parent_object_id, o.object_key, o.size_bytes, 
case
	when f.taken_at_sec is not null then 'obj'
	when d.objects_inside is not null then 'dir'
	when a.locked_until_sec is not null then 'zip'
    else '???'
end as object_type,
f.taken_at_sec, d.objects_inside, a.locked_until_sec
from Objects as o
left join (
	-- Select direct parents for objects
	select descendant as object_id, ancestor as parent_object_id from Paths 
    where path_length = 1
    ) as p on p.object_id = o.object_id
left join Files as f on f.object_id = o.object_id
left join Directories as d on d.object_id = o.object_id
left join Archives as a on a.object_id = o.object_id
where o.object_id in (
	-- Select object_ids for a particular root_object_id with a particular depth.
	select descendant as object_id from Paths 
	where ancestor = 1 and path_length != 0 and path_length <= 4
);


-- Select parents for descendants (path length ensures it is direct parent)
select descendant as object_id, ancestor as parent_object_id from Paths
where descendant in (3, 4, 5, 27) and path_length = 1;

-- Select object ids for particular root object id and depth level (ancestor = root_object_id, path_length = depth)
select descendant as object_id from Paths
where ancestor = 23 and path_length != 0 and path_length <= 2;
