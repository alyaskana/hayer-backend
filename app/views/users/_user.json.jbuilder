json.extract! user, :id, :first_name, :last_name, :about, :interests, :avatar, :link, :email, :personal_email, :created_at,
              :updated_at
json.followers user.followers
json.followings user.followings
json.responses user.responses
json.avatar user.avatar.url
