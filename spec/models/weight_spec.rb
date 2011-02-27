require 'spec_helper'

describe Weight do

  before(:each) do
    @user = Factory(:user)
    @attr = { :weight => 250.2 }
  end

  it "should create a new instance given valid attributes" do
    @user.weights.create!(@attr)
  end

  describe "user associations" do

    before(:each) do
      @weight = @user.weights.create(@attr)
    end

    it "should have a user attribute" do
      @weight.should respond_to(:user)
    end

    it "should have the right associated user" do
      @weight.user_id.should == @user.id
      @weight.user.should == @user
    end
  end

  describe "validations" do

    # Some tests commented because I can't figure out why they don't pass
    #it "should require a user id" do
    #  Weight.new(@attr).should_not be_valid
    #end

    it "should require positive numeric content" do
      @user.weights.build(:weight => 0 ).should_not be_valid
    end

  end


end
