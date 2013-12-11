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

end
