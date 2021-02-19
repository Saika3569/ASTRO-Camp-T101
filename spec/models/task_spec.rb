require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
  end

  describe 'validations' do
    subject { build(:task) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_uniqueness_of(:title).scoped_to(:user_id) }
  end
  
end
