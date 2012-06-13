require 'test_helper'

class UserTest < Test::Unit::TestCase

  should_not allow_value("blah").for(:email)
  # because a user can deliver bees for mating
  # on one and another apiary managed by this software
  should have_many(:deliveries)
  should have_many(:father_lines).through(:mating_apiary)

end
