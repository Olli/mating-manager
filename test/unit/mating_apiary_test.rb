require 'test_helper'

class MatingApiaryTest < ActiveSupport::TestCase
  should have_many(:deliverers)  
  should have_many(:places)
  should have_many(:used_places)
  should validate_presence_of(:name)
  should validate_presence_of(:address)
  should validate_uniqueness_of(:name)
  
end
