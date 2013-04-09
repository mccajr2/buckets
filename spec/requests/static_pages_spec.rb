require 'spec_helper'

describe "Static pages" do
  let(:base_title) { "Buckets" }

  describe "Home page" do

    it "should have the h1 'Welcome to Buckets'" do
      visit '/'
      page.should have_selector('h1', :text => 'Welcome to Buckets')
    end

    it "should have the title 'Helping You Reach Your Goals'" do
      visit '/'
      page.should have_selector('title',
                        :text => "#{base_title} | Helping You Reach Your Goals")
    end
  end

  describe "Help page" do

    it "should have the h1 'Getting the Most Out of Your Buckets'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Getting the Most Out of Your Buckets')
    end

    it "should have the title 'Getting the Most Out of Your Buckets'" do
      visit '/static_pages/help'
      page.should have_selector('title',
                        :text => "#{base_title} | Getting the Most Out of Your Buckets")
    end
  end

  describe "About page" do

    it "should have the h1 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About Us')
    end

    it "should have the title 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('title',
                    :text => "#{base_title} | About Us")
    end
  end

  describe "Contact page" do

    it "should have the h1 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector('h1', :text => 'Contact')
    end

    it "should have the title 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector('title', 
		    :text => "#{base_title} | Contact")
    end
  end

end
