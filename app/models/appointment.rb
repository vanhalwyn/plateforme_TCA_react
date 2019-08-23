class Appointment < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :date, presence: true
  validates :timeslot, presence: true, uniqueness: { scope: :date }
end
