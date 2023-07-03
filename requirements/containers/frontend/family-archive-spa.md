# SPA requirements

## U_ARCHIVE

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

When `a user uploads files via system file picker`, the `SPA` shall `open an Uploads section`.

---

While `files are being dragged onto the SPA`, the `SPA` shall `show a catching pop-up`.

Catching pop-up shall 

- mostly cover all width and height of the screen
- cast slight shadow on uncovered parts of the screen
- forbid interaction with other UI elements

---

When `files are dropped onto the SPA`, the `SPA` shall `open an Uploads section`.

---

The `Uploads section` shall `show image/video preview`.

---

The `Uploads section` shall `categorize image/video by upload status`.

Upload status shall have the next states:

- preparing for uploading
- uploaded
- preparing for archival
- archived

---

The `Uploads section` shall `show if metadata is present on a file`.


