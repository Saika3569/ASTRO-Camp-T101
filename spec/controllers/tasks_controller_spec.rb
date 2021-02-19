require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe "#index" do
    it "returns a 200 response" do
      get :index
      expect(response).to have_http_status "200"
    end
  end

  describe "#show" do
    before do
      @task = create(:task)
    end

    it "returns a 200 response" do
      get :show, params: {id: @task.id }
      expect(response).to have_http_status "200"
    end
  end

  describe "#create" do
    context "with valid attributes" do
        it "add a task" do
        task_params = attributes_for(:task)
        expect{
          post :create, params: {task: task_params}.to_be(Task.last)
        }
      end
    end

    context "with invalid attributes" do
        it "does not add a task" do
        task_params = attributes_for(:task,:invalid)
        expect{
          post :create, params: {task: task_params}.to_not_be(Task.last)
        }
      end
    end
  end

  describe "#update" do
    before do
      @task = create(:task)
    end

    it "edit a task" do
      task_params = attributes_for(:task,title: 'asdf')
      patch :update, params: {id: @task.id, task: task_params }
      expect(@task.reload.title).to eq "asdf"
    end
  end

  describe "#destroy" do
    before do
      @task = create(:task)
    end

    it "destoy a task" do
      task_params = attributes_for(:task,title: 'asdf')
      expect{
        delete :destroy, params: {id: @task.id}
      }.to change(Task, :count).by -1
    end
  end
end
