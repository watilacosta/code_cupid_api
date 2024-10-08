class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :phone_number
      t.string :username
      t.text :bio
      t.integer :age
      t.integer :gender
      t.string :password_digest
      t.datetime :confirmed_at
      t.string :confirmation_code
      t.string :locale
      t.integer :role
      t.integer :status, default: 0 # active

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
