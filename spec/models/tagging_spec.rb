require 'rails_helper'

RSpec.describe Tagging, type: :model do
  describe 'associations' do
    it { should belong_to(:tag).class_name('Tag') }
    it { should belong_to(:task).class_name('Task') }
  end
end
