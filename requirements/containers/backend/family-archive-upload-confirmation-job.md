# Upload confirmation job

## [Archive user story](../../user-stories.md#archive)

### [Uploads feature](../../features-breakdown.md#uploads)

#### Handle `object created` events

When `Amazon S3 emits "new object created" event`, the `job` shall `set request upload status to "uploaded" for a particular object`.

When `Amazon S3 emits "new object created" event` and `no upload request is found`, the `job` shall `log the accident` and `skip the event`.
