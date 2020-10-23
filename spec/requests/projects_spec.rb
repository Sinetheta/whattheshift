require 'rails_helper'

RSpec.describe "Projects", type: :request do
  describe "list projects" do
    it 'succeeds' do
      get projects_path
      expect(response).to have_http_status(200)
    end

    context 'with some projects' do
      let!(:projects) { create_list :project, 2, name: 'New Projects'}

      it 'lists all projects' do
        get projects_path
        expect(response.body.scan('New Projects').size).to eq(2)
      end
    end
  end

  describe "new project" do
    context 'with a logged in user' do
      before { sign_in create(:user) }

      it 'succeeds' do
        get new_project_path
        expect(response).to have_http_status(200)
      end

      it 'displays the project form' do
        get new_project_path
        expect(response.body).to include('Save')
      end
    end
  end

  describe "create project" do
    let(:project_params) { { project: { name: 'My Project' }  } }

    subject { post '/projects', params: project_params }

    context 'with a logged in user' do
      before { sign_in create(:user) }

      it 'succeeds' do
        subject
        expect(response).to have_http_status(200)
      end

      it 'displays that project details' do
        subject
        expect(response.body).to include('My Project')
      end
    end
  end

  describe "update project" do
    let(:user) { create(:user) }
    let(:project) { create(:project) }
    let(:project_params) { { project: { name: 'Updated Project' }  } }

    subject { put project_path(project), params: project_params }

    before { sign_in user }

    context 'without a membership for that user to that project' do
      it 'fails' do
        expect{ subject }.to raise_error(Pundit::NotAuthorizedError)
      end
    end

    context 'with a membership for that user to that project' do
      before { create(:project_member, role: :member, user: user, project: project) }

      it 'succeeds' do
        subject
        expect(response).to have_http_status(200)
      end

      it 'displays the updated project details' do
        subject
        expect(response.body).to include('Updated Project')
      end
    end
  end
end
