json.extract! response, :id, :description, :link, :created_at
json.user do 
  json.partial! "users/user_short", user: response.user
end
