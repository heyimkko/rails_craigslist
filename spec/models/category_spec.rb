require 'spec_helper'

describe Category do

  before { @category = Category.new(name: "Crazy Cat Category") }

  subject { @category }

  it { should respond_to(:name) }
  it { should be_valid }

  describe "name cannot be blank" do 
    before { @category.name = "             " }
    it { should_not be_valid }
  end

  describe "name cannot be less than 3 characters" do
    before { @category.name = "Cr" }
    it { should_not be_valid }
    # it "should have a minimum name of 3 characters" do
    #   subject.name.length.should be >= 3
    end

  describe "name cannot be greater 100 characters" do 
    before { @category.name = "a" * 101 }
    it { should_not be_valid }
  end

end
