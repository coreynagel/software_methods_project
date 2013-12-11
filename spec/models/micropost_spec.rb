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

  describe "when content is too long" do
    before { @micropost.content = "a" * 401 }
    it { should_not be_valid }
  end

  describe "comment assosiations" do

    before { @micropost.save }

    let!(:older_comment) do
      FactoryGirl.create(:comment, user: user, micropost: @micropost, created_at: 1.day.ago)
    end
    let!(:newer_comment) do
      FactoryGirl.create(:comment, user: user, micropost: @micropost,  created_at: 1.hour.ago)
    end

    it "should have the right comments in the right order" do
      expect(@micropost.comments.to_a).to eq [older_comment, newer_comment]
    end

    it "should destroy associated comments" do
      comments = @micropost.comments.to_a
      @micropost.destroy
      expect(comments).not_to be_empty
      comments.each do |comment|
        expect(Comment.where(id: comment.id)).to be_empty
      end
    end
  end
end
