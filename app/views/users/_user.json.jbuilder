json.extract! user, :id, :fist_name, :last_name, :about, :avatar, :link, :email, :personal_email, :created_at, :updated_at
json.url user_url(user, format: :json)
