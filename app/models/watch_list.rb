class WatchList < ApplicationRecord
  belongs_to :user
  belongs_to :movie, class_name: "User", foreign_key: "user_id"
end
