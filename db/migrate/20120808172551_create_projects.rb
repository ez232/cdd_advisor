class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :target_market
      t.string :timescale
      t.integer :volume_of_sale
      t.decimal :final_price
      t.boolean :maximum_target

      t.timestamps
    end
    add_index :projects, :name, :unique => true
  end
end
