json.like do
  json.count @review.likers(User).count
  json.me (@review.likers(User).include? @current_user)
end