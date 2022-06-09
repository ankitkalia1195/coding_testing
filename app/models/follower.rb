class Follower < ApplicationRecord
  belongs_to :followee, class_name: "User"
  belongs_to :follower, class_name: "User"

  validates :follower_id, unqiueness: { scope: :followee_id }
end
