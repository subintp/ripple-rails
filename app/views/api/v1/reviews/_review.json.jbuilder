json.id review.id
json.content review.content
json.rating review.rating
json.comments_count review.comments.count
json.user do
  json.id review.user.id
  json.name review.user.name
  json.avathar_url review.user.avathar_url
end

json.movie do
  json.id review.movie.id
  json.name review.movie.name
end

json.like do
  json.count review.likers(User).count
  json.me (review.likers(User).include? @current_user)
end
