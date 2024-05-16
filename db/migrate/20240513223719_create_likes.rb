class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :likeable, polymorphic: true, null: false

      t.boolean :dislike, default: false, null: false

      t.index [:user_id, :likeable_type, :likeable_id, :dislike], unique: true
      t.timestamps
    end
  end
end
