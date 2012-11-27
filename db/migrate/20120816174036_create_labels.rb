class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.integer :proposal_id
      t.string :name
      t.boolean :printed
      t.boolean :digital
      t.string :font_type
      t.float :text_size
      t.string :text_colour
      t.string :background_colour
      t.float :reading_distance

      t.timestamps
    end
  end
end