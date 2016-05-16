json.array! @comments do |comment|
  json.id comment.id
  json.content comment.content
  json.user do
    json.user_id comment.user_id
    json.name comment.user.name
    json.avathar_url comment.user.avathar_url
  end
end