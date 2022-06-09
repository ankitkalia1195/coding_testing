class CreateTables < ActiveRecord::Migration[6.0]
  def change
    remove_table :refresh_auth_tokens
    remove_table :blacklisted_auth_tokens

    create_table :tokens do |t|
      t.string :jti
      t.string :encrypted_token
      t.references :identical, polymorphic: true
      t.string :type, null: false
      t.timestamps null: false
    end
  end
end
