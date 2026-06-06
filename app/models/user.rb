class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :mobile_no, uniqueness: true, allow_blank: true
end
