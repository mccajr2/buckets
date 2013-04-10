require 'spec_helper'

describe "Static pages" do
  let(:base_title) { "Buckets" }

  subject { page }

  describe "Home page" do
    before { visit root_path }
    
    it { should have_selector('h1', :text => 'Welcome to Buckets') }
    it { should_not have_selector('title', :text => '| Home') }
    it { should have_selector('title',
                        :text => "#{base_title} | Helping You Reach Your Goals") }
  end

  describe "Help page" do
    before { visit help_path }
    
    it { should have_selector('h1', :text => 'Getting the Most Out of Your Buckets') }
    it { should have_selector('title',
                        :text => "#{base_title} | Getting the Most Out of Your Buckets") }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector('h1', :text => 'About Us') }
    it { should have_selector('title',
                    :text => "#{base_title} | About Us") }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_selector('h1', :text => 'Contact') }
    it { should have_selector('title', 
		    :text => "#{base_title} | Contact") }
  end

end
