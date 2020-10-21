require 'rails_helper'

RSpec.describe ProjectPolicy, type: :policy do
  let(:user) { create(:user) }
  let(:record) { create(:project) }
  let(:project_policy) { described_class.new(user, record) }
  
  describe '#index?' do
    subject { project_policy.index? }

    it { is_expected.to be(true) }
  end

  describe '#show?' do
    subject { project_policy.show? }

    it { is_expected.to be(true) }
  end
end
