json.user do
  json.id @user.id
  json.name @user.name
  json.email @user.email
  json.avathar_url @user.avathar_url
  json.auth_key @user.auth_key
end