class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.references :author, index: true, foreign_key: { to_table: :users }
    end
  end
end
