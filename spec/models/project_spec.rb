require 'spec_helper'

describe Project do
  
  let(:user) { FactoryGirl.create(:user) }

  before { @project = user.projects.build(name: "TestPrj") }

  
  subject { @project }
  
  it { should respond_to(:name) }
  it { should respond_to(:user_id)}
  it { should respond_to(:user) }
  its(:user) { should == user }
  
  it { should be_valid }
  
  describe "when user_id is not present" do
    before { @project.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank name" do
    before { @project.name = " " }
    it { should_not be_valid }
  end
end
