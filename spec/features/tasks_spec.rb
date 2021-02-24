require 'rails_helper'

RSpec.feature "Tasks", type: :feature do

  let!(:task){create(:task)}

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

  scenario "show a task " do
    visit task_path(task)
    expect(page).to have_content(task[:title])
    expect(page).to have_content(task[:content])
  end

  scenario "edit a task " do
    visit root_path
    expect {
      click_link "修改"
      fill_in "Title", with: "aaa"
      fill_in "Content", with: "bbb"
      click_button "確認"
      expect(page).to have_content "aaa"
      expect(page).to have_content "bbb"
    }
  end

  scenario "delete a task " do
    visit root_path
    expect {
      click_link "刪除任務"
    }.to change(Task, :count).by -1
  end
end
