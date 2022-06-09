class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :title, :description, :rating, presence: true
  validates :rating, numericality: { min: 1, max: 5 }, allow_blank: true
end
