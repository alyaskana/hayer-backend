json.extract! response, :id, :description, :link, :is_read, :created_at
json.user do
  json.partial! 'api/users/user_short', user: response.user
end
