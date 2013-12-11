require 'spec_helper'

describe Micropost do

  let(:user) { FactoryGirl.create(:user) }
  before { @micropost = user.microposts.build(content: "Lorem ipsum", wall_id: user.wall.id) }


  subject { @micropost }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }
  it { should respond_to(:wall_id)}
  it { should respond_to(:wall)}
  its(:wall) { should eq user.wall }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @micropost.user_id = nil }
    it { should_not be_valid }
  end

  describe "when wall_id is not present" do
    before { @micropost.wall_id = nil }
    it { should_not be_valid }
  end

  describe "when content is not present" do
    before { @micropost.content = nil }
    it { should_not be_valid }
  end

end
