class AddReviewsCountToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :reviews_count, :integer, default: 0
  end
end
