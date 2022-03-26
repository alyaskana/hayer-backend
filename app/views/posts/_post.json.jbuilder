json.extract! post, :id, :title, :description, :format, :created_at, :updated_at, :ad_types
json.tags post.tags
json.format post.format_before_type_cast

json.user do 
  json.partial! "users/user_short", user: post.user
end

json.responses do 
  json.array! post.responses, partial: "/responses/response", as: :response
end