json.array!(@albums) do |album|
  json.extract! album, :title, :review
  json.url album_url(album, format: :json)
end
