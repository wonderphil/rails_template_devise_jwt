json.uuid       user.uid
json.from       'api'
json.role       user.role

json.data do
  json.id           user.id
  json.displayName  user.full_name
  json.photoURL     'assets/images/avatars/brian-hughes.jpg'
  json.email        user.email
  json.first_name   user.first_name
  json.last_name    user.last_name
  json.provider     user.provider
  json.created_at   user.created_at
  json.updated_at   user.updated_at
end