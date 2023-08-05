# Upload confirmation job (UCJ) requirements

##### USJ-10

When `Amazon S3 emits "new object created" event`, the `job` shall `set request upload status to "uploaded" for a particular object`.

##### USJ-20

When `Amazon S3 emits "new object created" event` and `no upload request is found`, the `job` shall `log the accident` and `skip the event`.
