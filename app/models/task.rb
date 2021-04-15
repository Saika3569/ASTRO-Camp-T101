class Task < ApplicationRecord
  include AASM


  belongs_to :user
  validates :title, presence: true, uniqueness: {scope: :user_id}
  validates :content , presence: true
  validates :start_at , presence: true
  validates :end_at , presence: true
  validate :task_time

  scope :order_by_created_at, ->(order =:asc) {order(created_at: order) }
  scope :order_by_end_at, ->(order =:asc) {order(end_at: order) }


  def task_time
    if start_at && end_at
        errors.add(:start_at, I18n.t('activerecord.messages.task_time'))  if start_at > end_at
    end
  end

  aasm column: "state" do
    state :pending, :initial => true
    state :progressing
    state :finish

    event :pend do
      transitions :from => [:progressing, :finish], :to => :pending
    end

    event :progress do
      transitions :from => [:pending, :finish], :to => :progressing
    end

    event :finish do
      transitions :from => [:pending, :progressing], :to => :finish
    end
  end

end
