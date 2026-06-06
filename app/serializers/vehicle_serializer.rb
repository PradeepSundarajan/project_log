# app/serializers/vehicle_serializer.rb
class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :vehicle_no, :vehicle_type, :status, :display_name

  has_many :work_tables
end
