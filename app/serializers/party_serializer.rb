# app/serializers/party_serializer.rb
class PartySerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :contact_no

  has_many :work_tables
end
