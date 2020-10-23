require 'rails_helper'

RSpec.describe ProjectPolicy, type: :policy do
  let(:user) { create(:user) }
  let(:record) { create(:project) }
  let(:project_policy) { described_class.new(user, record) }

  describe '#create?' do
    subject { project_policy.create? }

    it { is_expected.to be(true) }
  end
  
  describe '#index?' do
    subject { project_policy.index? }

    it { is_expected.to be(true) }
  end

  describe '#new?' do
    subject { project_policy.new? }

    context 'with logged in user' do
      let(:user) { create(:user) }

      it { is_expected.to be(true) }
    end

    context 'without logged in user' do
      let(:user) { nil }

      it { expect{ subject }.to raise_error(Pundit::NotAuthorizedError) }
    end
  end

  describe '#show?' do
    subject { project_policy.show? }

    it { is_expected.to be(true) }
  end

  describe '#update?' do
    subject { project_policy.update? }
    
    context 'with no role for for this project' do
      it { is_expected.to be(false) }
    end

    context 'with an admin rolefor for this project' do
      before do
        create(:project_member, project: record, user: user, role: :admin)
      end

      it { is_expected.to be(true) }
    end

    context 'with a member rolefor this project' do
      before do
        create(:project_member, project: record, user: user, role: :member)
      end

      it { is_expected.to be(true) }
    end
  end
end
