require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the h1 'Buckets | Helping You Reach Your Goals'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Buckets | Helping You Reach Your Goals')
    end

    it "should have the title 'Buckets | Helping You Reach Your Goals'" do
      visit '/static_pages/home'
      page.should have_selector('title',
                        :text => "Buckets | Helping You Reach Your Goals")
    end
  end

  describe "Help page" do

    it "should have the h1 'Getting the Most Out of Your Buckets'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Getting the Most Out of Your Buckets')
    end

    it "should have the title 'Buckets | Getting the Most Out of Your Buckets'" do
      visit '/static_pages/help'
      page.should have_selector('title',
                        :text => "Buckets | Getting the Most Out of Your Buckets")
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
                    :text => "Buckets | About Us")
    end
  end
end
