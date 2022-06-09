class ReviewSerializer < BaseSerializer
  attributes :title, :description, :rating, :user_id, :book_id
end
