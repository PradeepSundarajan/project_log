class Vehicle < ApplicationRecord
    enum :vehicle_type, { lorry: 0, paver: 1, jcb: 2, roller: 3 }
    enum :status, { available: 0, in_use: 1, under_maintenance: 2 }, default: :available

    has_many :work_tables
    has_many :diesel_transactions
end
