require 'rails_helper'

RSpec.feature "Tasks", type: :feature do

  let(:task){create(:task)}
  let(:user){create(:user)}

  context "create a new task" do
    before do
      user
      create_task_with('#new_task','title','content')
    end
      
    it "should be create" do
      expect(page).to have_content 'title'
      expect(page).to have_content("#{I18n.t('tasks.create.notice')}")
      expect(Task.all.size).to be 1
    end
    
  end

  context "show a task " do
    before do
      visit task_path(task)      
    end
    it "should be showed" do
      expect(page).to have_content(task[:title])
      expect(page).to have_content(task[:content])
    end
  end

  context "edit a task " do
    let(:new_title){Faker::Lorem.sentence}
    let(:new_content){Faker::Lorem.paragraph}

    before do
      task
      edit_task_with('.edit_task',new_title,new_content)
    end

    it "should be edited" do
      expect(page).to have_content("#{I18n.t('tasks.update.notice')}")
      expect(page).to have_content new_title
    end

  end

  context "delete a task " do
    before do
      task
      visit root_path
      click_link "#{I18n.t('tasks.link.delete')}"
    end
    
    it "should be delete" do
      expect(Task.all.size).to be 0
      expect(page).to have_content("#{I18n.t('tasks.destroy.notice')}")
    end
  end
end

private
  def create_task_with(form, title, content)
    visit new_task_path
    within(form) do
      fill_in "#{I18n.t('tasks.form.title')}", with: title
      fill_in "#{I18n.t('tasks.form.content')}", with: content
      click_button I18n.t('tasks.form.submit')
    end
  end

  def edit_task_with(form, title, content)
    visit edit_task_path(task[:id])
    within(form) do
      fill_in "#{I18n.t('tasks.form.title')}", with: title
      fill_in "#{I18n.t('tasks.form.content')}", with: content
      click_button I18n.t('tasks.form.submit')
    end
  end
