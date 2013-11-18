require 'spec_helper'

describe "walls/show" do
  before(:each) do
    @wall = assign(:wall, stub_model(Wall))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
