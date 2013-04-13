# == Schema Information
#
# Table name: buckets
#
#  id          :integer          not null, primary key
#  description :string(255)
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Bucket do
  let(:user) { FactoryGirl.create(:user) }
  before { @bucket = user.buckets.build(description: "Lorem ipsum") }

  subject { @bucket }

  it { should respond_to(:description) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }
  
  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Bucket.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end
  
  describe "when user_id is not present" do
    before { @bucket.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank description" do
    before { @bucket.description = " " }
    it { should_not be_valid }
  end

  describe "with description that is too long" do
    before { @bucket.description = "a" * 141 }
    it { should_not be_valid }
  end
  
end
