class CreateAudioDevices < ActiveRecord::Migration
  def change
    create_table :audio_devices do |t|
      t.integer :proposal_id
      t.string :range_of_volume_specifications
      t.string :sound_volume_specifications

      t.timestamps
    end
  end
end
