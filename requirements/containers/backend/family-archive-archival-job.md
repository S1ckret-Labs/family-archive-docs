# Archival job requirements

## [Archive user story](../../user-stories.md#archive)

### [Archives feature](../../features-breakdown.md#archives)

#### Basic archival process

The `Archival job` shall `be launched per user after 2 hours of the latest upload request`.

---

The `Archival job` shall not `access other user's objects besides the launched user one`.

---

The `Archival job` shall `fetch user upload requests` and `analyze object metadata` and `divide objects into archives by year, month, if possible day` and `save objects, directories, archives in the metadata DB` and `upload archives to an object storage`.

---

The `archive` shall `be created with objects size >= 200MB and <= 2GB, with objects count inside >= 40 and no upper limit`.

---

When `Archival job can't create an archive due to lack of objects count or size`, the `Archival job` shall `set status of uploads to "Not enough files to create archive"`.