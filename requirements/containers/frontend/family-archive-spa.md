# SPA requirements

## Common language

- `SPA` - Single Page Application. The first screen that a user sees or application as a whole.

- `Upload request` - a record, which represents a user's will to upload a file.

- `Reupload suggestion` - a prompt, which appears when a user has unfinished uploads (upload requests with status `pending upload`).

> E.g. if a user's connection has been interrupted and some files wasn't uploaded to an S3 bucket. On a page refresh the user will see a warning that some files wasn't uploaded and will be prompted to reupload them.

## [Archive user story](../../user-stories.md#archive)

### [Uploads feature](../../features-breakdown.md#uploads)

#### Upload button

The `SPA` shall `have a button for uploading files`.

---

The `SPA` shall `accept directories and the next MIME types`.

- image/jpeg
- image/gif
- image/png
- image/webp
- video/x-msvideo
- video/h264
- video/x-m4v
- video/mpeg
- video/mp4
- video/ogg
- video/webm

---

When `Upload button is pressed`, the `SPA` shall `open a system file picker`.

---

When `a user uploads files via system file picker`, the `SPA` shall `open an Uploads section` and `save user's upload requests` and `upload files to S3`.

> API Reference: [Uploads - POST](../backend/family-archive-web-server.md#uploads---post)

---


#### Drag&Drop

While `files are being dragged onto the SPA`, the `SPA` shall `show a catching pop-up`.

Catching pop-up shall 

- mostly cover all width and height of the screen
- cast slight shadow on uncovered parts of the screen
- forbid interaction with other UI elements

---

When `files are dropped onto the SPA`, the `SPA` shall `open an Uploads section`.

---

#### Uploads section

The `Uploads section` shall `show image/video preview, file name, file size, if metadata is present on a file`.

---

The `Uploads section` shall `categorize image/video by upload status`.

Upload status shall have the next states:

- `pending upload` - initial file state
- `uploaded` - when a file is uploaded to S3 bucket

---

The `Uploads section` shall `have a button for archiving files`.

---

When `button for archiving files is pressed`, the `SPA` shall `trigger an archival job`.

> TODO: API reference

#### Fetch upload request status

While `Uploads section is opened`, the `SPA` shall `fetch user's upload requests statuses every 1 minute`.

>> TODO: API reference

---

When `Uploads section is opened`, the `SPA` shall `fetch user's upload requests`.

> API Reference: [Uploads - GET](../backend/family-archive-web-server.md#uploads---get)

---

#### Reupload suggestion

Where `a user has upload requests with status "pending upload"`, the `SPA` shall `notify the user that these file names wasn't uploaded` and `suggest him to reupload these files again`. (Reupload suggestion).

---

When `a user declines a reupload suggestion`, the `SPA` shall `delete proposed upload requests`.

> API Reference: [Uploads - DELETE](../backend/family-archive-web-server.md#uploads---delete)
---

When `a user accepts a reupload suggestion`, the `SPA` shall `open a system file picker`.

---

When `a user uploads files via system file picker for reupload request`, the `SPA` shall `update user's upload requests` and `upload files to S3`

> API Reference: [Uploads - PUT](../backend/family-archive-web-server.md#uploads---put)

### [Navigation feature](../../features-breakdown.md#navigation)

The `SPA` shall `have a navigation panel which show links to all other sections`.

### [Archives feature](../../features-breakdown.md#archives)

#### Archives section

The `SPA` shall `have an Archives section`.

---

The `Archives section` shall `show user's hierarchical object tree as such: year->month->day->archives->media files`.

> API Reference: [Archives - GET](../backend/family-archive-web-server.md#get-object-tree-flat)

---

The `objects with type "dir", "zip"` shall `be expandable`.

---

The `Archives section` shall `have an option to disable year, month, day folder levels`.

When `day level is disabled`, `the structure of the Archives section` shall be `year->month->archives->media files`.
When `month level is disabled`, `the structure of the Archives section` shall be `year->archives->media files`.
When `year level is disabled`, `the structure of the Archives section` shall be `archives->media files`.

---

The `Archives section` shall `allow to select an object with type "dir", "zip" to be restored`.

---

The `Archives section` shall `have a "Restore" button to restore archives`.

---

When `objects with type "dir", "zip" are selected` and `a "Restore" button is pressed`, the `SPA` shall `open a confirmation popup ("Restoration confirmation")`.

When `a user accepts "Restoration confirmation"`, the `SPA` shall `request to restore the selected archives`.

> API Reference: **TODO**

#### Restored archives section

The `SPA` shall `have a "Restored archives" section`.

---

When `"Restored archives" section is opened`, the `SPA` shall `fetch archives being restored (restoration requests)`.

> API Reference: **TODO**

---

The `"Restored archives" section` shall `show archives being restored, their name, size, restoration status, request date, estimated restoration date, estimated expiration date`.

> API Reference: **TODO**

---

The `"Restored archives" section` shall `have a "Download" button for downloading restored archives`.

---

The `"Restored archives" section` shall `allow to select archives for download`.

---

When `archives ready for download are selected` and `a "Download" button is pressed`, the `SPA` shall `get download links` and `initiate the download`.

> API Reference: **TODO**

