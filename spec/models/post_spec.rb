require 'spec_helper'

describe Post do
  let(:post) { FactoryGirl.create(:post) }

  subject { post }
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:location) }
  it { should respond_to(:price) }
  it { should respond_to(:category_id) }
  it { should respond_to(:key) }
  it { should respond_to(:email) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :location }
  it { should validate_presence_of :price }
  it { should validate_presence_of :email }
  it { should validate_presence_of :key }
  it { should validate_numericality_of :price }
  it { should validate_format_of(:email).not_with('znz@.ca.a.zx') }
  it { should validate_format_of(:email).with('znz@zx.com') }
  it { should belong_to :category }
  it { should be_valid }

  it "name cannot be less than 3 characters" do
    post.name = "Cr"
    post.should_not be_valid
  end

  it "does not all name to be more than 100 characters" do
    post.name = "a" * 101
    post.should_not be_valid
  end

  it "description cannot be more than 10000 characters" do
    post.description = "a" * 10001 
    post.should_not be_valid
  end

  it "calls secure random to create a key" do
    subject.key = "aaaaaaaa"
    subject.save!

    SecureRandom.expects(:hex).with(8).returns('aaaaaaaa').twice
    SecureRandom.expects(:hex).with(8).returns('aaaaaaab').at_least(:once)

    FactoryGirl.create(:post).key.should == 'aaaaaaab'
  end
end
