class Task < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, uniqueness: {scope: :user_id}
  validates :content , presence: true
  validates :start_at , presence: true
  validates :end_at , presence: true
  validate :task_time

  scope :with_order, ->(order =:asc) {order(created_at: order) }
  scope :with_end, ->(order =:asc) {order(end_at: order) }


  def task_time
    if start_at && end_at
        errors.add(:start_at, I18n.t('activerecord.messages.task_time'))  if start_at > end_at
    end
  end

end
