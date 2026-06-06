# app/serializers/driver_serializer.rb
class DriverSerializer < ActiveModel::Serializer
  attributes :id, :name, :mobile_no, :address

  has_many :work_tables
end
