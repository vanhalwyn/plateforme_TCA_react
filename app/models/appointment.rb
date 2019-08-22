class Appointment < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
  validates :timeslot, presence: true, uniqueness: { scope: :date }
  validates :user_id, presence: true
end
