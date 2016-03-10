class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :facebook_id
      t.string :avathar_url
      t.string :email
      t.string :location
      t.string :description
      t.string :fb_auth_token
      t.string :auth_key

      t.timestamps
    end
  end
end
