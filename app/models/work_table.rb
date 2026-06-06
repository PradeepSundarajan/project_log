class WorkTable < ApplicationRecord
  belongs_to :vehicle
  belongs_to :driver
  belongs_to :party
  has_many :diesel_transactions, dependent: :destroy
end
