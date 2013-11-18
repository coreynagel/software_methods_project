require 'spec_helper'

describe "walls/index" do
  before(:each) do
    assign(:walls, [
      stub_model(Wall),
      stub_model(Wall)
    ])
  end

  it "renders a list of walls" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
