json.array!(@movies) do |movie|
  json.extract! movie, :title, :description, :year_released
  json.url movie_url(movie, format: :json)
end
