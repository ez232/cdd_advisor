class CreateOpeningDevices < ActiveRecord::Migration
  def change
    create_table :opening_devices do |t|
      t.integer :proposal_id
      t.boolean :is_opening_device

      t.timestamps
    end
  end
end
