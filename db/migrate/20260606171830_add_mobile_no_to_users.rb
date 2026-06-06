class AddMobileNoToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :mobile_no, :string
    add_index :users, :mobile_no, unique: true
  end
end
