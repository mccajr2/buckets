require 'spec_helper'

describe Checkpoint do
  let(:bucket) { FactoryGirl.create(:bucket) }
  before { @checkpoint = bucket.checkpoints.build(description: "Lorem ipsum") }

  subject { @checkpoint }

  it { should respond_to(:description) }
  it { should respond_to(:bucket_id) }
  it { should respond_to(:bucket) }
  its(:bucket) { should == bucket }
  
  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to bucket_id" do
      expect do
        Checkpoint.new(bucket_id: bucket.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end
  
  describe "when bucket_id is not present" do
    before { @checkpoint.bucket_id = nil }
    it { should_not be_valid }
  end

  describe "with blank description" do
    before { @checkpoint.description = " " }
    it { should_not be_valid }
  end

  describe "with description that is too long" do
    before { @checkpoint.description = "a" * 141 }
    it { should_not be_valid }
  end
end
