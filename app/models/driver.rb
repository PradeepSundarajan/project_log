class Driver < ApplicationRecord
    enum :status, { active: 0, inactive: 1 }, default: :active

    has_many :work_tables
end
