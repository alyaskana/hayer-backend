class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null

  has_many :received_follows, foreign_key: :follower_id, class_name: "Follow", dependent: :destroy
  has_many :given_follows, foreign_key: :following_id, class_name: "Follow", dependent: :destroy

  has_many :followers, :through => :received_follows, :source => :following
  has_many :followings, :through => :given_follows, :source => :follower

  has_many :posts, dependent: :destroy

  has_many :responses
end