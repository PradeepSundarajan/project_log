class CreateParties < ActiveRecord::Migration[8.0]
  def change
    create_table :parties do |t|
      t.string :name
      t.string :phone_no
      t.text :address
      t.string :gst_no

      t.timestamps
    end
  end
end
