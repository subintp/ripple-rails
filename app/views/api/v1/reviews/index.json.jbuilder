json.array! @reviews do |review|
  json.id review.id
  json.content review.content
  json.rating review.rating
  json.likes review.likers_count
  json.user do
    json.user_id review.user.id
    json.name review.user.name
    json.avathar_url review.user.avathar_url
  end
end