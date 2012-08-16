class CreateScreens < ActiveRecord::Migration
  def change
    create_table :screens do |t|
      t.integer :proposal_id
      t.boolean :has_screen

      t.timestamps
    end
  end
end
