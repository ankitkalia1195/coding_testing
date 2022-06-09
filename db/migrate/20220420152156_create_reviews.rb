class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :user, index: true
      t.references :book, index: true

      t.string :title, null: false, index: true
      t.string :description, null: false, index: true
      t.integer :rating, null: false, index: true
      t.check_constraint :rating_check, "rating >=1 and rating <=5"
    end
  end
end
