json.new_movies do
  json.array! @discover[:new] do |movie|
    json.id movie.id
    json.name movie.name
    json.rating movie.rating
    json.description movie.description
    json.language_id movie.language_id
    json.image_url movie.image_url
  end
end

json.top_movies do
  json.array! @discover[:top] do |movie|
    json.id movie.id
    json.name movie.name
    json.rating movie.rating
    json.description movie.description
    json.language_id movie.language_id
    json.image_url movie.image_url
  end
end

json.top_users do
  json.array! @discover[:top_users] do |user|
    json.id user.id
    json.name user.name
    json.avathar_url user.avathar_url
  end

end