class CreateFinishingValues < ActiveRecord::Migration
  def change
    create_table :finishing_values do |t|
      t.string :name

      t.timestamps
    end
  end
end
