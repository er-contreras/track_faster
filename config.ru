require "rack/static"
require_relative "./app/app"

use Rack::Static,
    urls: ["/favicon.ico", "/styles.css", "/assets", "/app.js"],
    root: "public"

run App.new
