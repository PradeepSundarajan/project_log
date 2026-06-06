class CreateVehicles < ActiveRecord::Migration[8.0]
  def change
    create_table :vehicles do |t|
      t.string :vehicle_no, null: false
      t.integer :vehicle_type, null: false
      t.string :display_name
      t.integer :capacity
      t.integer :status

      t.timestamps
    end

    add_index :vehicles, :vehicle_no, unique: true
  end
end
