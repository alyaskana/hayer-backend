json.extract! user, :id, :first_name, :last_name, :about, :avatar, :link, :instagram, :telegram, :email, :edu_program, :course, :created_at,
              :updated_at
json.followers user.followers
json.followings user.followings
json.responses user.responses
json.avatar user.avatar.url
