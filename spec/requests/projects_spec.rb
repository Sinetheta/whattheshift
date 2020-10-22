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
end
