class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.string :image
      t.integer :proposal_id

      t.timestamps
    end
  end
end
