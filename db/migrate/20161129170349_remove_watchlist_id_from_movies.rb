class RemoveWatchlistIdFromMovies < ActiveRecord::Migration[5.0]
  def change
    remove_column :movies, :watch_list_id
  end
end
