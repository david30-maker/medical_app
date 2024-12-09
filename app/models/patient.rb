class Patient < ApplicationRecord
  belongs_to :user

  validates :name, :phone_number, presence: true
end
