class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id
      t.integer :review_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
