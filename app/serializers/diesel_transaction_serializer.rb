# app/serializers/diesel_transaction_serializer.rb
class DieselTransactionSerializer < ActiveModel::Serializer
  attributes :id, :liters, :cost, :transaction_date, :remarks

  belongs_to :work_table
  belongs_to :user
end
