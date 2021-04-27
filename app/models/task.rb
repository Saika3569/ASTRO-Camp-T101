class Task < ApplicationRecord
  include AASM
  enum priority: {high: 0, mid: 1, low: 2}
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings, dependent: :destroy
  validates :title, presence: true, uniqueness: {scope: :user_id}
  validates :content , presence: true
  validates :start_at , presence: true
  validates :end_at , presence: true
  validates :priority , presence: true
  validate :task_time
  default_scope {order(created_at: 'asc')}

  def self.tag_with(tag)
    Tag.find_by(name: tag).tasks
  end

  def tag_list=(names)
    self.tags = names.split(' ').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def tag_list
    tags.map {|tag| tag.name }.join(' ')
  end

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
