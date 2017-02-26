class AddWatchlistIdToMovie < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :watch_list_id, :integer
  end
end
