json.extract! post, :id, :title, :description, :contact, :user_id, :created_at, :updated_at
json.tags post.tags
json.url post_url(post, format: :json)

json.responses do 
  json.array! post.responses, partial: "/responses/response", as: :response
end
