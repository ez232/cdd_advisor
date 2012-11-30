class CreateManufacturingValues < ActiveRecord::Migration
  def change
    create_table :manufacturing_values do |t|
      t.string :name

      t.timestamps
    end
  end
end
