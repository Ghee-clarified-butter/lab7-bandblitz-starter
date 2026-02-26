class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :role, default: 1
      t.string :password_digest
      t.references :band, null: false, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
