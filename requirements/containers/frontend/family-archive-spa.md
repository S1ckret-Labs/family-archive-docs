# SPA requirements

##### SPA-10

The `SPA` shall `have a button for uploading files`.

##### SPA-20

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

##### SPA-30

When `Upload button is pressed`, the `SPA` shall `open a system file picker`.

##### SPA-40

When `a user uploads files via system file picker`, the `SPA` shall `open an Uploads section` and `save user's upload requests` and `upload files to S3`.

> API reference: [Create upload requests](../backend/api-ref-web-server.md#create-upload-requests)

##### SPA-50

While `files are being dragged onto the SPA`, the `SPA` shall `show a catching pop-up`.

Catching pop-up shall 

- mostly cover all width and height of the screen
- cast slight shadow on uncovered parts of the screen
- forbid interaction with other UI elements

##### SPA-60

When `files are dropped onto the SPA`, the `SPA` shall `open an Uploads section`.

##### SPA-70

The `Uploads section` shall `show image/video preview, file name, file size, if metadata is present on a file`.

##### SPA-80

The `Uploads section` shall `categorize image/video by upload status`.

Upload status shall have the next states:

- `pending upload` - initial file state
- `uploaded` - when a file is uploaded to S3 bucket

##### SPA-90

The `Uploads section` shall `have a button for archiving files`.

##### SPA-100

When `button for archiving files is pressed`, the `SPA` shall `trigger an archival job`.

> TODO: API reference

##### SPA-110

While `Uploads section is opened`, the `SPA` shall `fetch user's upload requests statuses every 1 minute`.

> API reference: [Get upload requests](../backend/api-ref-web-server.md#get-upload-requests)

##### SPA-120

When `Uploads section is opened`, the `SPA` shall `fetch user's upload requests`.

> API reference: [Get upload requests](../backend/api-ref-web-server.md#get-upload-requests)

##### SPA-130

Where `a user has upload requests with status "pending upload"`, the `SPA` shall `notify the user that these file names wasn't uploaded` and `suggest him to reupload these files again`. (Reupload suggestion).

##### SPA-140

When `a user declines a reupload suggestion`, the `SPA` shall `delete proposed upload requests`.

> API reference: [Delete upload requests](../backend/api-ref-web-server.md#delete-upload-requests) 

##### SPA-150

When `a user accepts a reupload suggestion`, the `SPA` shall `open a system file picker`.

##### SPA-160

When `a user uploads files via system file picker for reupload request`, the `SPA` shall `update user's upload requests` and `upload files to S3`

> API reference: [Regenerate URLs for media reupload](../backend/api-ref-web-server.md#regenerate-urls-for-media-reupload) 

##### SPA-170

The `SPA` shall `have a navigation panel which show links to all other sections`.

##### SPA-180

The `SPA` shall `have an Archives section`.

##### SPA-190

The `Archives section` shall `show user's hierarchical object tree as such: year->month->day->archives->media files`.

> API reference: [Get object tree (flat)](../backend/api-ref-web-server.md#get-object-tree-flat) 

##### SPA-200

The `objects with type "dir", "zip"` shall `be expandable`.

##### SPA-210

The `Archives section` shall `have an option to disable year, month, day folder levels`.

When `day level is disabled`, `the structure of the Archives section` shall be `year->month->archives->media files`.
When `month level is disabled`, `the structure of the Archives section` shall be `year->archives->media files`.
When `year level is disabled`, `the structure of the Archives section` shall be `archives->media files`.

##### SPA-220

The `Archives section` shall `allow to select an object with type "dir", "zip" to be restored`.

##### SPA-230

The `Archives section` shall `have a "Restore" button to restore archives`.

##### SPA-240

When `objects with type "dir", "zip" are selected` and `a "Restore" button is pressed`, the `SPA` shall `open a confirmation popup ("Restoration confirmation")`.

##### SPA-250

When `a user accepts "Restoration confirmation"`, the `SPA` shall `request to restore the selected archives`.

> API Reference: **TODO**

##### SPA-260

The `SPA` shall `have a "Restored archives" section`.

##### SPA-270

When `"Restored archives" section is opened`, the `SPA` shall `fetch archives being restored (restoration requests)`.

> API Reference: **TODO**

##### SPA-280

The `"Restored archives" section` shall `show archives being restored, their name, size, restoration status, request date, estimated restoration date, estimated expiration date`.

> API Reference: **TODO**

##### SPA-290

The `"Restored archives" section` shall `have a "Download" button for downloading restored archives`.

##### SPA-300

The `"Restored archives" section` shall `allow to select archives for download`.

##### SPA-310

When `archives ready for download are selected` and `a "Download" button is pressed`, the `SPA` shall `get download links` and `initiate the download`.

> API Reference: **TODO**

