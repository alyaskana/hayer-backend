json.extract! response, :id, :description, :link, :created_at
json.user do
  json.partial! 'api/users/user_short', user: response.user
end
