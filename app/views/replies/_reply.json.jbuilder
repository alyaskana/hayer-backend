json.extract! reply, :id, :user_id, :post_id, :description, :link, :created_at, :updated_at
json.url reply_url(reply, format: :json)
