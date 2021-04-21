require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
  end

  describe 'validations' do
    subject { build(:task) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:start_at) }
    it { should validate_presence_of(:end_at) }
    it { should validate_presence_of(:priority) }
    it { should validate_uniqueness_of(:title).scoped_to(:user_id) }
  end
  
  describe 'task time' do
    let(:task){build(:task, start_at: Date.today + 1.day, end_at: Date.today)}
    it "start time before end time" do
      task.valid?
      expect(task.errors.full_messages ).to include("開始時間 必須早於結束時間")
    end
  end

end
