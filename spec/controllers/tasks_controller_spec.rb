require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe "#index" do
    it "returns a 200 response" do
      get :index
      expect(response).to have_http_status "200"
    end
  end

  describe "#show" do
    
    let(:task){ create(:task) }

    it "returns a 200 response" do
      get :show, params: {id: task }
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
    
    let(:task){ create(:task) }

    it "edit a task" do
      task_params = attributes_for(:task,title: 'asdf')
      patch :update, params: {id: task, task: task_params }
      expect(task.reload.title).to eq "asdf"
    end
  end

  describe "#destroy" do
    
    let!(:task){ create(:task) }

    it "destoy a task" do
      expect{
        delete :destroy, params: {id: task }
      }.to change(Task, :count).by -1
    end
  end
end
