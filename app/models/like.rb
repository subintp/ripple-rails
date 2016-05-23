class Like < Socialization::ActiveRecordStores::Like
  include PublicActivity::Model
  tracked

  after_create :create_activities

  private

  def create_activities
    PublicActivity.enabled = true
    create_activity key: "review.like", owner: User.current_user, parameters: {owner_name: User.current_user.name, recipent_name: likeable.user.name, target_name: likeable.user.name, target_pic: User.current_user.avathar_url }
    PublicActivity.enabled = false
  end
end
