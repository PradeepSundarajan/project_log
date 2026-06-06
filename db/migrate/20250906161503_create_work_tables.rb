class CreateWorkTables < ActiveRecord::Migration[8.0]
  def change
    create_table :work_tables do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.references :driver, null: false, foreign_key: true
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.string :from_location
      t.string :to_location
      t.string :material
      t.references :party, null: false, foreign_key: true
      t.string :work_location
      t.text :remarks

      t.timestamps
    end
  end
end
