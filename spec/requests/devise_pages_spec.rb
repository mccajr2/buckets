require 'spec_helper'

describe "Devise override pages" do
  let(:base_title) { "Buckets" }

  subject { page }

  describe "New registration page" do
    before { visit new_user_registration_path }
    
    it { should have_selector('h1', :text => 'Sign Up') }
    it { should have_selector('title', :text => "#{base_title} | Sign Up") }
  end

  #describe "Edit registration page" do
  #  before { 
  #    sign_in_as_a_valid_user 
  #    visit edit_user_registration_path 
  #  }
  #  
  #  it { should have_selector('h1', :text => 'Edit Account') }
  #  it { should have_selector('title', :text => "#{base_title} | Edit Account") }
  #end

end
