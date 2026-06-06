class DieselTransaction < ApplicationRecord
  belongs_to :vehicle
  belongs_to :added_by, class_name: "User"
  belongs_to :work_table, optional: true
end
