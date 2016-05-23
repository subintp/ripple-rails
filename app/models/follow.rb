class Follow < Socialization::ActiveRecordStores::Follow
  include PublicActivity::Model
  tracked

  after_create :create_activities

  private

  def create_activities
    PublicActivity.enabled = true
    create_activity key: "user.follow", owner: User.current_user, parameters:  {owner_name: User.current_user.name, target_name: followable.name, target_pic: followable.avathar_url }
    PublicActivity.enabled = false
  end

end
