require File.dirname(__FILE__) + '/../test_helper'

describe "a new User" do
  setup do
    @user = User.new
    @user.valid?
  end
  
  it "should require username" do
    @user.errors.on(:username).should.not.be.nil
  end
  
  it "should require age" do
    @user.errors.on(:username).should.not.be.nil
  end

  it "should require a numeric age" do
    @user.age = "foo"
    @user.errors.on(:age).should.not.be.nil
  end
  
  it "should be valid with age and username" do
    @user.age = 14
    @user.username = "john"
    @user.should.be.valid 
  end
  
end
