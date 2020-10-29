require 'rails_helper'

RSpec.describe ProjectTokenPolicy, type: :policy do
  let(:record) { create(:project_token) }

  let(:non_member) { create(:user) }
  let(:member) {
    create(:project_member, project: record.project, role: :member).user
  }
  let(:admin) {
    create(:project_member, project: record.project, role: :admin).user
  }

  describe 'all actions' do
    %w(
      create?
    ).each do |action_name|
      it "only project members can perform #{action_name}" do
        aggregate_failures "testing users" do
          expect(described_class.new(non_member, record).send(action_name)).to eq(false)
          expect(described_class.new(member, record).send(action_name)).to eq(true)
          expect(described_class.new(admin, record).send(action_name)).to eq(true)
        end
      end
    end
  end
end