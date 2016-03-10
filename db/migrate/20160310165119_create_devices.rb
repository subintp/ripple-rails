class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.text :registration_id
      t.integer :user_id

      t.timestamps
    end
  end
end
