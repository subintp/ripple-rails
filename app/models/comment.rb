class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :review

  acts_as_mentioner

  validates :content, presence: true
end
