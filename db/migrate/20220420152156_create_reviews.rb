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

    execute "CREATE INDEX reviews_title_trigram_ix ON reviews USING GIST (title gist_trgm_ops);"
    execute "CREATE INDEX reviews_description_trigram_ix ON reviews USING GIST (description gist_trgm_ops);"
  end
end
