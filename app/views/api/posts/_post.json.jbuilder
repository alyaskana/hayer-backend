json.extract! post, :id, :title, :description, :format, :created_at, :updated_at, :ad_types, :deadline
json.tags post.tags
json.format post.format_before_type_cast

json.user do
  json.partial! 'api/users/user_short', user: post.user
end

json.responses do
  json.array! post.responses, partial: 'api/responses/response', as: :response
end

json.is_favorited Favorite.where(post: post, user: current_user).exists?
json.unread_responses_count post.responses.where(is_read: false).count
