class Order < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :state, uniqueness: { scope: :user_id }, if: Proc.new { |order| order.state == "en attente" }
end
