provider "google" {
  project     = "hazel-strand-377523"
  region      = "us-central1"
}

resource "google_storage_bucket" "public_bucket" {
  name          = "bucket-for-dareit-6"
  location      = "europe-west1"
  storage_class = "STANDARD"

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}

resource "google_storage_bucket_iam_member" "public_bucket_iam" {
  bucket = google_storage_bucket.public_bucket.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}