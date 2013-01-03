require 'spec_helper'
require 'cancan/matchers'

describe Ability do
  let(:user) { build_stubbed :user }
  let(:ability) { Ability.new(user) }

  subject { ability }

  context 'when user has admin privileges' do
    before(:each) { user.stub(:has_role?).with(:admin) { true } }
    it { should be_able_to :manage, :all }
  end

  context 'when user is not an administrator' do
    it { should be_able_to :read, Game }
    it { should be_able_to :read, Answer }

    describe 'managing questions' do
      context 'when question is for user' do
        let(:question) { build_stubbed :question, user: user  }
        it { should be_able_to :manage, question }
      end

      context 'when question is not for user' do
        let(:question) { build_stubbed :question }
        it { should_not be_able_to :manage, question }
      end
    end
  end
end
