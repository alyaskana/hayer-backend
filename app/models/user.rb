class User < ApplicationRecord
  has_many :received_follows, foreign_key: :follower_id, class_name: "Follow", dependent: :destroy
  has_many :given_follows, foreign_key: :following_id, class_name: "Follow", dependent: :destroy

  has_many :followers, :through => :received_follows, :source => :following
  has_many :followings, :through => :given_follows, :source => :follower

  has_many :posts, dependent: :destroy
end