require 'spec_helper'

describe "User pages" do
  let(:base_title) { "Buckets" }

  subject { page }

  describe "signup page" do
    before { visit new_user_registration_path }
    
    it { should have_selector('h1', :text => 'Sign Up') }
    it { should have_selector('title', :text => "#{base_title} | Sign Up") }
  end
  
  describe "profile page" do
    
    let(:user) {FactoryGirl.create(:user)}
    let!(:b1) { FactoryGirl.create(:bucket, user: user, description: "Awesome description!") }
    let!(:b2) { FactoryGirl.create(:bucket, user: user, description: "Awesome...er? description!!") }
    
    before { 
      Warden.test_mode!
      login_as(user, :scope => :user)
      visit user_path(user)
    }

    it { should have_selector('h1',    text: user.name) }
    it { should have_selector('title', text: user.name) }

    describe "buckets" do
      it { should have_content(b1.description) }
      it { should have_content(b2.description) }
    end    
  end

  describe "signup" do

    before { visit new_user_registration_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "user_name",                  with: "Example User"
        fill_in "user_email",                 with: "user@example.com"
        fill_in "user_password",              with: "foobarbaz"
        fill_in "user_password_confirmation", with: "foobarbaz"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end


  describe "Edit registration page" do
    let(:user) {FactoryGirl.create(:user)}
    
    before { 
      Warden.test_mode!
      login_as(user, :scope => :user)
      visit edit_user_registration_path 
    }
    
    it { should have_selector('h1', :text => 'Edit Account') }
    it { should have_selector('title', :text => "#{base_title} | Edit Account") }
  end

end
