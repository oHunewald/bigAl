require 'spec_helper'

describe Miane do

	let!(:user) { FactoryGirl.create(:user) }

	let!(:project) { FactoryGirl.create(:project, user: user) }	

	#@before { @project = user.projects.build(name: "TestPrj") }

	let(:miane) { FactoryGirl.create(:miane, project: project) }

	#before { @miane = user.project.miane.build }

	subject { miane }

	it { should respond_to(:aims) }
	it { should respond_to(:expected_result) }
	it { should respond_to(:why_ngs) }
	it { should respond_to(:possible_alternative) }
	it { should respond_to(:approach) }
	it { should respond_to(:positive_control) }
	it { should respond_to(:negative_control) }
	it { should respond_to(:replicates) }
	it { should respond_to(:reference_dataset) }
	it { should respond_to(:possible_pittfalls) }
	it { should respond_to(:needs_qc) }
	it { should respond_to(:project_id) }

	describe "when aims is not present" do
		before { miane.aims = nil }
		it { should_not be_valid }

		before { miane.expected_result = nil }
		it { should_not be_valid }
	end
end
