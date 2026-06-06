# app/serializers/work_table_serializer.rb
class WorkTableSerializer < ActiveModel::Serializer
  attributes :id, :from_location, :to_location, :material,
             :start_datetime, :end_datetime, :work_location, :remarks

  belongs_to :vehicle
  belongs_to :driver
  belongs_to :party
  has_many :diesel_transactions
end
