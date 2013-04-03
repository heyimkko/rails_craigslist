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
  it { should be_valid }

  describe "name cannot be blank" do
    before { post.name = "             " }
    it { should_not be_valid }
  end

  describe "name cannot be less than 3 characters" do
    before { post.name = "Cr" }
    it { should_not be_valid }
  end

  describe "name cannot be more than 100 characters" do
    before { post.name = "a" * 101 }
    it { should_not be_valid }
  end

  describe "description cannot be blank" do
    before { post.description = "             " }
    it { should_not be_valid }
  end

  describe "description cannot be more than 10000 characters" do
    before { post.description = "a" * 10001 }
    it { should_not be_valid }
  end

  describe "location cannot be blank" do
    before { post.location = "             " }
    it { should_not be_valid }
  end

  describe "price cannot be blank" do
    before { post.price = "             " }
    it { should_not be_valid }
  end

  describe "price must be an integer" do
    before { post.price = "Shivam!" }
    it { should_not be_valid }
  end

  describe "category_id" do
    before { Category.create(name: "kittens") }
    it "must be associated with category" do
      category = Category.find(post.category_id)
      category.should be_valid  
    end
  end

  describe "email cannot be blank" do
    before { post.price = "             " }
    it { should_not be_valid }
  end

  describe "email must be valid" do
    before { post.email = "znz@.ca.a.zx"}
    it { should_not be_valid }
  end

end
