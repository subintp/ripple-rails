class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.datetime :release_date
      t.string :director
      t.text :casts
      t.string :production
      t.string :description
      t.text :image_url
      t.text :genres
      t.string :length
      t.decimal :rating
      t.string :trailer_id
      t.integer :language_id
      t.string :source_id
      t.decimal :rotten_rating
      t.decimal :imdb_rating

      t.timestamps
    end
  end
end
