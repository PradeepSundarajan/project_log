class CreateDieselTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :diesel_transactions do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.references :work_table, null: true, foreign_key: true
      t.references :added_by, null: false, foreign_key: { to_table: :users }
      t.date :date
      t.decimal :liters
      t.decimal :cost
      t.text :remarks

      t.timestamps
    end
  end
end
