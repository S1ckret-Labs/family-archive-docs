# Features breakdown

## About

> Documentation updated on: `2023.08.05`

This page describes main features, links requirements to them and show feature progress. Make sure to not duplicate requirements.

- ✅ - Done
- 🟩 - Subset of a requirement is done
- 🚧 - Work in progress
- 🥚 - To be implemented

## Status

|              | Total | 🥚 | 🚧 | 🟩 | ✅ |
|--------------|-------|----|----|----|----|
| Requirements | 43    | 31 | 2  | 1  | 9  |
| Sub features | 14    | 9  | 4  | 0  | 0  |
| Features     | 4     | 2  | 2  | 0  | 0  |

## Common language

`Media file` - photo or video file.

## [As a client I want to archive](./user-stories.md#archive)

### Uploads

`Uploads` feature allows user to

- see uploaded media file name, preview, size, presence of metadata
  - ✅ [SPA-120](./containers/frontend/family-archive-spa.md#spa-120)
  - 🟩 [SPA-70](./containers/frontend/family-archive-spa.md#spa-70)
  - 🥚 [SPA-80](./containers/frontend/family-archive-spa.md#spa-80)
  - ✅ [WS-10](./containers/backend/family-archive-web-server.md#ws-10)
- upload media files
  - ✅ [SPA-10](./containers/frontend/family-archive-spa.md#spa-10)
  - ✅ [SPA-20](./containers/frontend/family-archive-spa.md#spa-20)
  - ✅ [SPA-30](./containers/frontend/family-archive-spa.md#spa-30)
  - 🚧 [SPA-40](./containers/frontend/family-archive-spa.md#spa-40)
  - 🥚 [SPA-50](./containers/frontend/family-archive-spa.md#spa-50)
  - 🥚 [SPA-60](./containers/frontend/family-archive-spa.md#spa-60)
  - ✅ [WS-20](./containers/backend/family-archive-web-server.md#ws-20)
- reupload media files which was corrupted or wasn't uploaded properly
  - 🥚 [SPA-130](./containers/frontend/family-archive-spa.md#spa-130)
  - 🥚 [SPA-140](./containers/frontend/family-archive-spa.md#spa-140)
  - 🥚 [SPA-150](./containers/frontend/family-archive-spa.md#spa-150)
  - 🥚 [SPA-160](./containers/frontend/family-archive-spa.md#spa-160)
  - 🥚 [WS-30](./containers/backend/family-archive-web-server.md#ws-30)
- cancel media file upload, delete uploaded media file, which wasn't archived yet
  - 🥚 [WS-40](./containers/backend/family-archive-web-server.md#ws-40)
- reschedule archiving time

### File status confirmation

`File status confirmation` feature allows user to

- see if media file was uploaded correctly
  - 🚧 [SPA-110](./containers/frontend/family-archive-spa.md#spa-110)
  - ✅ [USJ-10](./containers/backend/family-archive-upload-confirmation-job.md#usj-10)
  - ✅ [USJ-20](./containers/backend/family-archive-upload-confirmation-job.md#usj-20)


### Navigation

`Navigation` feature allows user to
- switch between different sections such as `Uploads`, `Archives`, `Restored archives`
  - 🥚 [SPA-170](./containers/frontend/family-archive-spa.md#spa-170)
  - 🥚 [SPA-180](./containers/frontend/family-archive-spa.md#spa-180)
  - 🥚 [SPA-260](./containers/frontend/family-archive-spa.md#spa-260)


### Archives

`Archives` feature allows user to
- automatically create archives from uploaded media files
  - 🥚 [SPA-90](./containers/frontend/family-archive-spa.md#spa-90)
  - 🥚 [SPA-100](./containers/frontend/family-archive-spa.md#spa-100)
  - 🥚 [AJ-10](./containers/backend/family-archive-archival-job.md#aj-10)
  - 🥚 [AJ-20](./containers/backend/family-archive-archival-job.md#aj-20)
  - 🥚 [AJ-30](./containers/backend/family-archive-archival-job.md#aj-30)
  - 🥚 [AJ-40](./containers/backend/family-archive-archival-job.md#aj-40)
  - 🥚 [AJ-50](./containers/backend/family-archive-archival-job.md#aj-50)
- navigate object tree
  - 🥚 [SPA-190](./containers/frontend/family-archive-spa.md#spa-190)
  - 🥚 [SPA-200](./containers/frontend/family-archive-spa.md#spa-200)
  - 🥚 [SPA-210](./containers/frontend/family-archive-spa.md#spa-210)
  - ✅ [WS-50](./containers/backend/family-archive-web-server.md#ws-50)
- restore archives
  - 🥚 [SPA-220](./containers/frontend/family-archive-spa.md#spa-220)
  - 🥚 [SPA-230](./containers/frontend/family-archive-spa.md#spa-230)
  - 🥚 [SPA-240](./containers/frontend/family-archive-spa.md#spa-240)
  - 🥚 [SPA-250](./containers/frontend/family-archive-spa.md#spa-250)
- see restoration status of an archive
  - 🥚 [SPA-270](./containers/frontend/family-archive-spa.md#spa-270)
  - 🥚 [SPA-280](./containers/frontend/family-archive-spa.md#spa-280)
- download archives
  - 🥚 [SPA-290](./containers/frontend/family-archive-spa.md#spa-290)
  - 🥚 [SPA-300](./containers/frontend/family-archive-spa.md#spa-300)
  - 🥚 [SPA-310](./containers/frontend/family-archive-spa.md#spa-310)
- delete archives