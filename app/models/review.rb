class Review < ApplicationRecord

  belongs_to :user, counter_cache: true
  belongs_to :movie

  has_many :comments, dependent: :destroy

  acts_as_likeable
  acts_as_mentioner

  validates :rating, presence: true
  validates :content, presence: true

  include PublicActivity::Model
  tracked

end
