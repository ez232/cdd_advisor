class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.integer :proposal_id
      t.boolean :printed
      t.boolean :digital
      t.string :font_type
      t.float :text_size
      t.string :text_colour
      t.float :labels_reading_distance

      t.timestamps
    end
  end
end
