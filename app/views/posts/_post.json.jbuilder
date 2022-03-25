json.extract! post, :id, :title, :description, :format, :user_id, :created_at, :updated_at, :ad_types
json.tags post.tags
json.format post.format_before_type_cast

json.responses do 
  json.array! post.responses, partial: "/responses/response", as: :response
end