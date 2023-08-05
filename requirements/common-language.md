# Common language

## About

This page describes definitions, terms, processes, abbreviation that is used in family-archive project.

## Definitions

- `File tree` - User's hierarchy of objects. Every user has a root object. There can be 3 types of objects: directories, archives, files.

- `SPA` - Single Page Application. The first screen that a user sees or application as a whole.

- `Upload request` - a record, which represents a user's will to upload a file.

- `Reupload suggestion` - a prompt, which appears when a user has unfinished uploads (upload requests with status `pending upload`).

> E.g. if a user's connection has been interrupted and some files wasn't uploaded to an S3 bucket. On a page refresh the user will see a warning that some files wasn't uploaded and will be prompted to reupload them.