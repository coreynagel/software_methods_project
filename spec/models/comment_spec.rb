require 'spec_helper'

describe Comment do
  let(:user) { FactoryGirl.create(:user) }
  let(:micropost) { FactoryGirl.create(:micropost, user: user, wall: user.wall) }
  let(:comment) { FactoryGirl.create(:comment, user: user, micropost: micropost) }

  subject { comment }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:micropost_id) }


  it { should be_valid }

  describe "when user_id is not present" do
    before { comment.user_id = nil }
    it { should_not be_valid }
  end

  describe "when micropost_id is not present" do
    before { comment.micropost_id = nil }
    it { should_not be_valid }
  end

  describe "when content is not present" do
    before { comment.content = " " }
    it { should_not be_valid }
  end

  describe "when content is too long" do
    before { comment.content = "a" * 141 }
    it { should_not be_valid }
  end


end
