class Movie < ApplicationRecord

  belongs_to :language

  has_many :reviews, dependent: :destroy
  has_many :comments, :through => :reviews
  has_many :users, :through => :reviews


  validates :name, presence: true

  acts_as_followable
  acts_as_mentionable


  scope :released, -> { where('release_date < ?',Time.now) }
  scope :upcoming, -> { where('release_date > ?',Time.now) }
  scope :released_last_month, -> { where('release_date > ?',Time.now.last_month) }

  scope :search,-> (name) { where("name like ?", "#{name}%").limit(20) }
  scope :latest, -> { order('release_date DESC') }
  scope :top, -> { order('rating DESC') }


  def released?
    release_date < Time.now
  end

end
