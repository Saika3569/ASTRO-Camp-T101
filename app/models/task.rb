class Task < ApplicationRecord
  include AASM

  belongs_to :user
  validates :title, presence: true, uniqueness: {scope: :user_id}
  validates :content , presence: true
  validates :start_at , presence: true
  validates :end_at , presence: true
  validate :task_time

  default_scope {order(created_at: 'asc')}
  
  def task_time
    if start_at && end_at
        errors.add(:start_at, I18n.t('activerecord.messages.task_time'))  if start_at > end_at
    end
  end

  aasm column: 'state', no_direct_assignment: true do
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
