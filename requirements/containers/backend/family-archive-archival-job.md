# Archival job (AJ) requirements

##### AJ-10

The `Archival job` shall `be launched per user after 2 hours of the latest upload request`.

##### AJ-20

The `Archival job` shall not `access other user's objects besides the launched user one`.

##### AJ-30

The `Archival job` shall `fetch user upload requests` and `analyze object metadata` and `divide objects into archives by year, month, if possible day` and `save objects, directories, archives in the metadata DB` and `upload archives to an object storage`.

##### AJ-40

The `archive` shall `be created with objects size >= 200MB and <= 2GB, with objects count inside >= 40 and no upper limit`.

##### AJ-50

When `Archival job can't create an archive due to lack of objects count or size`, the `Archival job` shall `set status of uploads to "Not enough files to create archive"`.