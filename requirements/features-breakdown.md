# Features breakdown

## About

This page describes main features, links requirements to them and show feature progress.

- ✅ - Done
- 🚧 - Work in progress
- 🥚 - To be implemented

## Common language

`Media file` - photo or video file.

## [As a client I want to archive](./user-stories.md#archive)

### Uploads

`Uploads` feature allows user to

- see uploaded media file name, preview, size, presence of metadata
  - 🚧 [SPA: Fetch upload request status](./containers/frontend/family-archive-spa.md#fetch-upload-request-status)
  - 🚧 [SPA: Uploads section](./containers/frontend/family-archive-spa.md#uploads-section)
  - ✅ [Web server: Get upload requests](./containers/backend/family-archive-web-server.md#get-upload-requests)
- upload media files
  - 🚧 [SPA: Upload button](./containers/frontend/family-archive-spa.md#upload-button)
  - 🥚 [SPA: Drag&Drop](./containers/frontend/family-archive-spa.md#dragdrop)
  - ✅ [Web server: Create upload requests](./containers/backend/family-archive-web-server.md#create-upload-requests)
- reupload media files which was corrupted or wasn't uploaded properly
  - 🥚 [SPA: Reupload suggestion](./containers/frontend/family-archive-spa.md#reupload-suggestion)
  - 🥚 [Web server: Regenerate URLs for media upload](./containers/backend/family-archive-web-server.md#regenerate-urls-for-media-reupload)
- cancel media file upload
- delete uploaded media file, which wasn't archived yet
  - 🥚 [Web server: Delete upload requests](./containers/backend/family-archive-web-server.md#delete-upload-requests)
- reschedule archiving time

### File status confirmation

`File status confirmation` feature allows user to

- see if media file was uploaded correctly
  - 🚧 [SPA: Fetch upload request status](./containers/frontend/family-archive-spa.md#fetch-upload-request-status)
  - 🚧 [Upload confirmation job: Handle `object created` events](./containers/backend/family-archive-upload-confirmation-job.md#handle-object-created-events)


### Navigation

`Navigation` feature allows user to
- see automatically create folder structure by year, month, day
- see automatically created archives
- see media file names, previews, size, metadata inside archive


### Archives

`Archives` feature allows user to
- restore archives
- see restoration status of an archive
- download archives
- delete archives