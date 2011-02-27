require 'test_helper'

class UserTest < Test::Unit::TestCase

  should_not allow_value("blah").for(:email)
  # because a user can deliver bees for mating
  # on one and another apiary managed by this software
  should have_many(:deliverers)

  context "a given user" do
    setup do
      @user = User.first
    end
    should "validate password" do
      assert_equal @user, User.authenticate("test@test.com","test").class
    end
    should "not validate password" do
      assert_equal nil, User.authenticate("test@test.com","test1")
    end    
    should "not validate email" do
      assert_equal nil, User.authenticate("test1@test.com","test")
    end
    
  end
    
end
