json.extract! user, :id, :first_name, :last_name, :about, :avatar, :link, :email, :personal_email, :created_at,
              :updated_at
json.followers user.followers
json.followings user.followings
json.responses user.responses
json.url user_url(user, format: :json)
