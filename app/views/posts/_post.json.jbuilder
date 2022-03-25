json.extract! post, :id, :title, :description, :type, :format, :user_id, :created_at, :updated_at
json.tags post.tags

json.responses do 
  json.array! post.responses, partial: "/responses/response", as: :response
end