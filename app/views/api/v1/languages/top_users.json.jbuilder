json.users do
  json.array! @users do |user|
    json.id user.id
    json.name user.name
    json.avathar_url user.avathar_url
    json.email user.email
  end
end