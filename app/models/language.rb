class Language < ApplicationRecord

  validates :name, presence: true

  has_many :movies
  has_many :reviews, through: :movies

end
