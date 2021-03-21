class Task < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, uniqueness: {scope: :user_id}
  validates :content , presence: true

  scope :with_order, ->(order =:asc) {order(created_at: order) }
  
end
