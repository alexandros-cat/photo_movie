class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title,         null: false
      t.text :content,         null: false
      t.integer :category_id,  null: false
      t.integer :user_id,      null: false, foreign_key: true
      t.string :movie,      null: false
      t.boolean    :checked
      t.timestamps
    end
  end
end
