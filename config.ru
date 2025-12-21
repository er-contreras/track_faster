require "rack/files"
require_relative "./app/app"

map "/styles.css" do
  run Rack::Files.new("public")
end

run App.new

