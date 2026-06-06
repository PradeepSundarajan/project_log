class CreateDrivers < ActiveRecord::Migration[8.0]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :mobile_no
      t.text :address
      t.string :license_no
      t.integer :experience_years
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
