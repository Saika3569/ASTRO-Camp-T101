require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'associations' do
    it { should have_many(:tasks).class_name('Task') }
    it { should have_many(:taggings).class_name('Tagging') }
  end

  describe 'validations' do
    subject { build(:tag) }
    it { should validate_presence_of(:name) }
  end
end
