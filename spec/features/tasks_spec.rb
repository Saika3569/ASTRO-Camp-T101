require 'rails_helper'

RSpec.feature "Tasks", type: :feature do
  scenario "create a new task" do
    visit root_path
    user = create(:user)
    expect {
      click_link "新增任務"
      fill_in "Title", with: "Test Task"
      fill_in "Content", with: "Try"
      click_button "確認"

      expect(page).to have_content "Test Task"
    }.to change(Task, :count).by 1
  end
end
