require 'rails_helper'

RSpec.describe Task, type: :model do
  it "is valid with a title, content, and user_id" do
    task = build(:task)
    expect(task).to be_valid
  end 
  it "is invalid without a title" do
    task = build(:task,title: nil)
    task.valid?
    expect(task.errors[:title]).to include("can't be blank")
  end
  it "is invalid without a content" do
    task = build(:task,content: nil)
    task.valid?
    expect(task.errors[:content]).to include("can't be blank")
  end
  it "does not allow duplicate title per user" do
    user = create(:user)
    task = create(:task,user: user)
    new_task = build(:task, user: user)
    new_task.valid?
    expect(new_task.errors[:title]).to include("has already been taken")
  end
  it "allows two users to share a project name" do
    user = create(:user)
    user_task = create(:task,user: user)
    other_user = create(:other_user)
    other_task = build(:task,user: other_user)
    expect(other_task).to be_valid
  end
end
