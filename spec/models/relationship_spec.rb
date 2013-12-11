require 'spec_helper'

describe Relationship do

    let(:user) { FactoryGirl.create(:user) }
    let(:friend) { FactoryGirl.create(:user) }
    let(:relationship) { user.relationships.build(friend_id: friend.id, confirmed: "pending") }

    subject { relationship }

    it { should respond_to(:user) }
    it { should respond_to(:friend) }
    it { should respond_to(:confirmed) }

    it { should be_valid }

    describe "when user_id is not present" do
      before { relationship.user_id = nil }
      it { should_not be_valid }
    end

    describe "when friend_id is not present" do
      before { relationship.friend_id = nil }
      it { should_not be_valid }
    end

    describe "when confirmed is not present" do
      before { relationship.confirmed = nil }
      it { should_not be_valid }
    end

end
