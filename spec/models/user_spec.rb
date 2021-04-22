require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:tasks).dependent(:destroy) }
  end

  describe 'validations' do
    subject { build(:user) }
    it { should validate_presence_of(:account) }
    it { should validate_uniqueness_of(:account) }
  end
end
