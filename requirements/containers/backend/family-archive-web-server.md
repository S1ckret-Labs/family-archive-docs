# Web server requirements

## Common language

- `File tree` - User's hierarchy of objects. Every user has a root object. There can be 3 types of objects: directories, archives, files.

## [Archive user story](../../user-stories.md#archive)

### [Uploads feature](../../features-breakdown.md#uploads)

#### Uploads - URL

`<host>/api/v1/users/{userId}/upload/requests`

#### Get upload requests

The `web server` shall `provide API to get all user's upload requests`.

Returns user's upload requests. 

Request example:
```http
GET localhost:8080/api/v1/users/1/upload/requests
```

Response example:

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

#### Create upload requests

The `web server` shall `provide API to create user's upload requests`.

Inserts upload requests into a DB, returns S3 signed URLs to upload files. 

Request example:
```http
POST localhost:8080/api/v1/users/1/upload/requests

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

#### Regenerate URLs for media reupload

The `web server` shall `provide API to regenerate S3 signed URLs for user's upload requests with "pending upload" status`.

Regenerate S3 signed URL for upload requests. Skips files if upload status is not `pending upload` or if id is not found.


Request example:
```http
PUT localhost:8080/api/v1/users/1/upload/requests

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


#### Delete upload requests

The `web server` shall `provide API to delete user's upload requests`.

Deletes user's upload requests by id list. Also deletes S3 file if present. Skips if some id is not found. Returns ids which are deleted.

Request example:
```http
DELETE localhost:8080/api/v1/users/1/upload/requests

[1, 2, 69420]
```

Response example:

```json
[1, 2]
```

--- 

### Navigation


#### Navigation (nested) - URL

`<host>/api/v1/users/{userId}/tree`

#### Get object tree (nested)

The `web server` shall `provide API to list user's file tree`.

Provides an object tree. Object can be a type of: 

- `dir` - directory
- `zip` - archive (not necessary a zip archive, it just a label)
- `obj` - media file

Query parameters:

- `root_object_id` - uint64, root object id from where to seek children. If not provided, uses a `root_object_id` from `Users` table.
- `depth` - uint8, how many levels deep objects will be returned. If not provided, defaults to `1`.

Request example:

```http
GET localhost:8080/api/v1/users/1/tree
```

Response example:

```json
{
  "root_object_id": 123,
  "objects": [
    {
      "id": 124,
      "name": "2022",
      "size_bytes": 422311,
      "type": "dir",
      "objects_inside": 2,
      "objects": []
    },
    {
      "id": 125,
      "name": "2023",
      "size_bytes": 0,
      "type": "dir",
      "objects_inside": 0,
      "objects": []
    },
  ]
}
```

Request example:

```http
GET localhost:8080/api/v1/users/1/tree?depth=4
```

Response example:

```json
{
  "root_object_id": 123,
  "objects": [
    {
      "id": 124,
      "name": "2022",
      "size_bytes": 43512341,
      "type": "dir",
      "objects_inside": 2,
      "objects": [
        {
          "id": 126,
          "name": "06",
          "size_bytes": 43512521,
          "type": "dir",
          "objects_inside": 1,
          "objects": [
            {
              "id": 234,
              "name": "2022.06.13.zip",
              "size_bytes": 43512311,
              "type": "zip",
              "locked_until_sec": 1633220251,
              "objects": [
                {
                  "id": 235,
                  "name": "IMG_20230613_120635.jpg",
                  "size_bytes": 4321521,
                  "type": "obj",
                  "taken_at_sec": 163400927479
                }
              ]
            }
          ]
        },
        {
          "id": 125,
          "name": "07",
          "size_bytes": 0,
          "type": "dir",
          "objects_inside": 0,
          "objects": []
        },
      ]
    },
    {
      "id": 129,
      "name": "2023",
      "size_bytes": 0,
      "type": "dir",
      "objects_inside": 0,
      "objects": []
    },
  ]
}
```


#### Navigation (flat) - URL

`<host>/api/v2/users/{userId}/tree`

#### Get object tree (flat)

Same as before, except different structure.

Request example:

```http
GET localhost:8080/api/v2/users/1/tree
```

Response example:

```json
{
  "root_object_id": 123,
  "objects": [
    {
      "id": 124,
      "parent_id": 123,
      "level": 1,
      "name": "2022",
      "size_bytes": 422311,
      "type": "dir",
      "objects_inside": 2,

    },
    {
      "id": 125,
      "parent_id": 123,
      "level": 1,
      "name": "2023",
      "size_bytes": 0,
      "type": "dir",
      "objects_inside": 0,
    }
  ]
}
```

Request example:

```http
GET localhost:8080/api/v2/users/1/tree?depth=4
```

Response example:

```json
{
  "root_object_id": 123,
  "objects": [
    {
      "id": 124,
      "parent_id": 123,
      "level": 1,
      "name": "2022",
      "size_bytes": 43512341,
      "type": "dir",
      "objects_inside": 2,
    },
    {
      "id": 126,
      "parent_id": 124,
      "level": 2,
      "name": "06",
      "size_bytes": 43512521,
      "type": "dir",
      "objects_inside": 1,
    },
    {
      "id": 234,
      "parent_id": 126,
      "level": 3,
      "name": "2022.06.13.zip",
      "size_bytes": 43512311,
      "type": "zip",
      "locked_until_sec": 1633220251,
    },
    {
      "id": 235,
      "parent_id": 126,
      "level": 4,
      "name": "IMG_20230613_120635.jpg",
      "size_bytes": 4321521,
      "type": "obj",
      "taken_at_sec": 163400927479
    },
    {
      "id": 125,
      "parent_id": 124,
      "level": 2,
      "name": "07",
      "size_bytes": 0,
      "type": "dir",
      "objects_inside": 0,
      "objects": []
    },
    {
      "id": 129,
      "parent_id": 123,
      "level": 1,
      "name": "2023",
      "size_bytes": 0,
      "type": "dir",
      "objects_inside": 0,
    }
  ]
}
```