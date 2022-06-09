class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :followers do |t|
      t.references :followee, index: true, foreign_key: { to_table: :users }
      t.references :follower, index: true, foreign_key: { to_table: :users }

      t.index [:followee_id, :follower_id], unique: true
    end
  end
end
