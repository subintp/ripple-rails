json.movies do
  json.array! @movies do |movie|
    json.id movie.id
    json.name movie.name
    json.rating movie.rating
    json.description movie.description
    json.language_id movie.language_id
    json.image_url movie.image_url
  end
end