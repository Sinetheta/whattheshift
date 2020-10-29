require 'rails_helper'

RSpec.describe RevisionPolicy, type: :policy do
  let(:record) { create(:revision) }
  let(:user) { create(:user) }

  describe 'all actions' do
    %w(
      index?
      show?
    ).each do |action_name|
      it "anyone can perform #{action_name}" do
        expect(described_class.new(user, record).send(action_name)).to eq(true)
      end
    end
  end
end