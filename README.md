# Astronomy Picture of the Day (APOD) API

A Rails API for the [APOD](http://apod.nasa.gov/apod/archivepix.html) website. Fetches via Sidekiq as there are 7k+ posts dating back to 1996 (to seed). Stores a small copy in a Postgres database for querying. Janky parsing thanks to some incredibly out-dated HTML (`<center>` tags, inline styles etc).

Returns a json object of `posts` that contains:

```
{
  name: "",
  description_html: "",
  credit_html: "",
  small_image_url: "",
  full_image_url: "",
  video_embed_url: "",
  original_url: "",
  published_at: ""
}
```

## Routes:

`/posts` - All posts
`/posts/:year/:month/:day` - Posts within date range (month + day optional)

## Eventual features:
- Categorisation of posts
- Searching
