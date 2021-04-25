require 'rails_helper'

RSpec.feature "Tasks", type: :feature do

  let(:user){create(:user)}
  let(:task){create(:task,user_id: user.id)}

  before do
    visit sign_in_users_path
    fill_in "信箱", with: user.email
    fill_in "密碼", with: user.password
    click_button '確認'
  end

  context "create a new task" do
    before do
      visit root_path
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
      task
      visit root_path
      click_link task.title
    end

    it "should be showed" do
      expect(page).to have_content '任務詳細'
      expect(page).to have_content task.title
      expect(page).to have_content task.content
    end

  end

  context "edit a task " do
    
    let(:new_title){Faker::Lorem.sentence}
    let(:new_content){Faker::Lorem.paragraph}

    before do 
      task
      visit root_path
      edit_task_with("#edit_task_#{task.id}",new_title,new_content)
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

  context "order by end time" do
    before do
      1.upto(3) do |i|
        create(:task,title: "title #{i}", end_at: Time.now+ i.day,user_id:user.id)
      end
      visit root_path
    end

    it "with asc/desc" do
      expect(page).to have_content(/title 1.*title 2.*title 3/)

      click_link '結束時間'
      expect(page).to have_content(/title 3.*title 2.*title 1/)

      click_link '結束時間'
      expect(page).to have_content(/title 1.*title 2.*title 3/)
    end
  end

  context "order by end priority" do
    before do
      create(:task,title: "title 1", priority: 0, user_id:user.id)
      create(:task,title: "title 2", priority: 1, user_id:user.id)
      visit root_path
    end

    it "with asc/desc" do
      expect(page).to have_content(/title 1.*title 2/)

      click_link '優先度'
      expect(page).to have_content(/title 1.*title 2/)

      click_link '優先度'
      expect(page).to have_content(/title 2.*title 1/)
    end
  end

  context "search" do
    before do
      1.upto(3) do |i|
          create(:task,title: "title#{i}",user_id:user.id)
      end
      visit root_path
    end

    it 'search by state' do
      select('進行中',from: 'q[state_eq]') 
      click_button '搜尋'
      expect(page).to have_content '進行中'
    end

    it 'search by title' do
      fill_in '輸入標題搜尋' , with: 'title'
      click_button '搜尋'
      expect(page).to have_content 'title2'
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
    click_link '修改'
    within(form) do
      fill_in "#{I18n.t('tasks.form.title')}", with: title
      fill_in "#{I18n.t('tasks.form.content')}", with: content
      click_button I18n.t('tasks.form.submit')
    end
  end
