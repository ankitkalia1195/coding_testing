class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable,
         :trackable, :recoverable

  has_many :followers, class_name: "Follower", source: :follower, foreign_key: :followee_id
  has_many :following_users, class_name: "Follower", source: :followee, foreign_key: :follower_id

  validates :email, :is_admin, presence: true
end
