require 'spec_helper'

describe "User pages" do
  
  subject { page }
  
  
  describe "sign in" do
    
    before { visit new_user_session_path }
    
    describe "with valid information" do
      let(:user) {FactoryGirl.create(:user)}
      
      before do
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        
        click_button "Sign in"
      end
      
      it { should have_selector('li', text: user.name) }
      it { should have_link('Sign out', href: destroy_user_session_path) }
      it { should_not have_link('Sign in', href: new_user_session_path) }  
      it { should_not have_button('Sign in') }
    end

    describe "with invalid information" do
      let(:user) {FactoryGirl.create(:user)}

      before do
        user.password = " "
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password

        it { should_not have_selector('li', text: user.name) }
        it { should_not have_link('Sign_out', href: destroy_user_session_path) }
        it { should have_link('Sign in', href: new_user_session_path) }
      end
    
    end

  end  
end


