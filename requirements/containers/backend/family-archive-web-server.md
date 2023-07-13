# Web server requirements

## Common language

- `File tree` - User's hierarchy of objects. Every user has a root object. There can be 3 types of objects: directories, archives, files.

## U_ARCHIVE

### Uploads

#### Uploads - URL

`<host>/api/v1/users/{userId}/upload/requests`

#### Uploads - GET

The `web server` shall `provide API to get all user's upload requests`.

Returns user's upload requests. Response example:

```json
[
  {
    "ObjectId": 1,
    "ObjectKey": "IMG_20230601_101201.jpg",
    "StatusName": "Pending upload"
  },
  {
    "ObjectId": 2,
    "ObjectKey": "IMG_20230602_102202.jpg",
    "StatusName": "Pending upload"
  }
]
```

---

#### Uploads - POST

The `web server` shall `provide API to create user's upload requests`.

Inserts upload requests into a DB, returns S3 signed URLs to upload files. 

Body example:

```json
["img.png","video.mp4"]
```

Response example:

```json
[
  {
    "ObjectId": 1,
    "ObjectKey": "img.png",
    "UploadUrl": "https://fa-media-raw.s3.amazonaws.com/1/img.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAXHT5DCEVDPMKDFUL%2F20230712%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20230712T164617Z&X-Amz-Expires=600&X-Amz-SignedHeaders=host&X-Amz-Signature=89d9fa2e48ac65fe46731db59c427342b4f2221a723ca149c35b44f1818492b2"
  },
  {
    "ObjectId": 2,
    "ObjectKey": "video.mp4",
    "UploadUrl": "https://fa-media-raw.s3.amazonaws.com/1/video.mp4?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAXHT5DCEVDPMKDFUL%2F20230712%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20230712T164617Z&X-Amz-Expires=600&X-Amz-SignedHeaders=host&X-Amz-Signature=2afb43ce229131d91b43567a2d00172b2e382f315e811195301ab54cbaaacd86"
  }
]
```

---

#### Uploads - PUT

The `web server` shall `provide API to regenerate S3 signed URLs for user's upload requests with "pending upload" status`.

Regenerate S3 signed URL for upload requests. Skips files if upload status is not `pending upload` or if id is not found.

Body example:

```json
[1, 69420]
```

Response example:
```json
[
  {
    "ObjectId": 1,
    "ObjectKey": "img.png",
    "UploadUrl": "https://fa-media-raw.s3.amazonaws.com/1/img.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAXHT5DCEVDPMKDFUL%2F20230712%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20230712T164617Z&X-Amz-Expires=600&X-Amz-SignedHeaders=host&X-Amz-Signature=89d9fa2e48ac65fe46731db59c427342b4f2221a723ca149c35b44f1818492b2"
  }
]
```

---


#### Uploads - DELETE

The `web server` shall `provide API to delete user's upload requests`.

Deletes user's upload requests by id list. Also deletes S3 file if present. Skips if some id is not found. Returns ids which are deleted.

Body example:

```json
[1, 2, 69420]
```

Response example:

```json
[1, 2]
```

--- 

### Archives


The `web server` shall `provide API to list user's file tree`.

TODO: Spec