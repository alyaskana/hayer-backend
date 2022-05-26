class User < ApplicationRecord
  attr_accessor :skip_password_validation

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null

  mount_uploader :avatar, AvatarUploader

  has_many :received_follows, foreign_key: :follower_id, class_name: 'Follow', dependent: :destroy
  has_many :given_follows, foreign_key: :following_id, class_name: 'Follow', dependent: :destroy

  has_many :followers, through: :received_follows, source: :following
  has_many :followings, through: :given_follows, source: :follower

  has_many :posts, dependent: :destroy
  has_many :responses, dependent: :destroy

  has_many :responses

  scope :registered, -> { where(registration_state: :complete) }

  # with_options if: proc { |u| u.registration_state == "email_verified" } do
  #   validates :first_name, presence: true
  #   validates :last_name, presence: true
  #   validates :password, presence: true
  # end

  protected

  def password_required?
    return false if skip_password_validation

    super
  end
end
