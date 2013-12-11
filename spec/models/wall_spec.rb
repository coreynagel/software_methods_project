require 'spec_helper'

describe Wall do
  let(:user) { FactoryGirl.create(:user) }
  before { @wall = user.wall }

  subject { @wall }

  it { should respond_to(:user_id) }
  it { should respond_to(:microposts) }

end
