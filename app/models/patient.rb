class Patient < ApplicationRecord
  belongs_to :user

  validates :name, :phone_number, presence: true

  enum status: {admiited: 0, discharged: 1, on_hold: 2}
end
