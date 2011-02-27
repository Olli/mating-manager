require 'test_helper'

class MatingUnitTest < ActiveSupport::TestCase
  should have_many(:places)
  should have_many(:used_places)
  should have_many(:deliverers).through(:used_places)
end
