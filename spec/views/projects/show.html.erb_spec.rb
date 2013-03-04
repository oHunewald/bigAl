require 'spec_helper'

describe "projects/show.html.erb" do
	subject { page }

	before { visit user_project_path(@project) }

	it { should have_selector('h1', text: 'Big AL')}


end
