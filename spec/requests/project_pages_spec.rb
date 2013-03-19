require 'spec_helper'

describe "project pages" do

subject { page }

describe "show project" do

	let!(:user) {FactoryGirl.create(:user)}
      
	let!(:project) { FactoryGirl.create(:project, user: user) }

	before { visit new_user_session_path }

	before do
		fill_in "Email", with: user.email
		fill_in "Password", with: user.password

		click_button "Sign in"
	end

	describe "without maine information" do
		before { visit project_path(project) }

		it { should have_selector('h1', text: 'No MIANE information exists !') }
		it { should have_content('No MIANE information exists !')}
		it { should have_content(project.name)}
	end

	let(:miane) { FactoryGirl.create(:miane, project: project) }

	describe "with miane information"do
		

		it { should_not have_selector('h1', text: 'No MIANE information exists !') }
	end

	describe "edit project" do

		before { visit project_path(project) }
		
		describe "when role is NgsUser" do

			before do
				user.role = "NgsUser"
			end

			describe "when project state is incomplete" do
				before do
					project.state = "Incomplete"
				end

				it { should have_link('Edit Project', 
					href: edit_project_path(project)) }

				# describe "with miane sheet" do
				# 	let(:miane) { FactoryGirl.create(:miane, project: project) }
				# 	it { should have_link('Edit Miane Sheet',
				# 	href: edit_project_miane_path(project, miane))}
				# end

				
			end

		end
	end
end



end
