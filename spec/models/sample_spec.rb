require 'spec_helper'

describe Sample do
  
	let!(:user) { FactoryGirl.create(:user) }
	let!(:project) { FactoryGirl.create(:project) }


	#before { @project = @user.projects.build(name: "TestPrj") }
	before { @sample = project.samples.build(
		name: "s1", size: 5, quantity: 4.4)}

	subject { @sample }

	it { should respond_to(:name) }
end
