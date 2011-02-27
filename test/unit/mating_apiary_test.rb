require 'test_helper'

class MatingApiaryTest < ActiveSupport::TestCase
  should have_many(:deliverers)  
  should have_many(:places)
  should have_many(:used_places)

end
