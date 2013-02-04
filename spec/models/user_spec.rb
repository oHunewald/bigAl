require 'spec_helper'

describe User do
  
  before do
    @user = User.new(name: "Tony", email: "user@example.com", password: "foobar")
  end
  
  subject { @user }
  
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:encrypted_password) }
  it { should be_valid }
  
  describe "when password is not present" do
    before { @user.password = " " }
    it { should_not be_valid }
  end
end
