-- View for retrieving dirs
create or replace view DirsAndPaths as
select o.*, d.objects_inside, p.* from Objects as o 
join Directories as d using(object_id)
join Paths as p on o.object_id = p.descendant;

-- View for retrieving archives
create or replace view ArchivesAndPaths as
select o.*, a.locked_until_sec, a.storage_path, p.* from Objects as o 
join Archives as a using(object_id)
join Paths as p on o.object_id = p.descendant;

-- View for retrieving files
create or replace view FilesAndPaths as
select o.*, f.taken_at_sec, f.thumbnail_path, p.* from Objects as o 
join Files as f using(object_id)
join Paths as p on o.object_id = p.descendant;
