class Appointment < ApplicationRecord
  validates :name, :email, :phone, :appointment_at, presence: true
end
