class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :name
      t.integer :project_id

      t.timestamps
    end
    add_index :proposals, :name, :unique => true
  end
end
