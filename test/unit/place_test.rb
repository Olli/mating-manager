require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  should belong_to(:mating_apiary)  
  should belong_to(:mating_unit)
end
