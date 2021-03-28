require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'associations' do
    it 'belongs to user' do
      user = create(:user)
      task = create(:task, user: user)
      expect(task.user).to eq(user)
    end
  end

  describe 'validations' do
    subject { build(:task) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:start_at) }
    it { byebug; puts "a"; expect(subject).to validate_presence_of(:end_at) }
    it { should validate_uniqueness_of(:title).scoped_to(:user_id) }
  end
  
  describe 'task time' do
    it "start time before end time" do
      task = build(:task, :invalidtime)
      task.valid?
      # byebug
      expect( task.errors.full_messages ).to eq(["開始時間 必須早於結束時間"])
    end
  end

end
