class CreateMaintenanceValues < ActiveRecord::Migration
  def change
    create_table :maintenance_values do |t|
      t.string :name

      t.timestamps
    end
  end
end
