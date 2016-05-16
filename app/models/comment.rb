class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :review

  acts_as_mentioner

  validates :content, presence: true

  include PublicActivity::Model
  tracked

  after_create :create_activities

  private

  def create_activities
    self.create_activity(key: "review.comment",
                    owner: User.current_user,
                    parameters: { owner_name: User.current_user.name,
                                  recipent_name: review.user.name,
                                  target_name: review.movie.name,
                                   target_pic: User.current_user.avathar_url
                                 })

  end

end
