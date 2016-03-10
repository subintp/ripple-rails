class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.decimal :rating
      t.string :location
      t.integer :user_id
      t.integer :movie_id
      t.integer :likers_count

      t.timestamps
    end
  end
end
