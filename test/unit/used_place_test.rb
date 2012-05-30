require 'test_helper'

class UsedPlaceTest < ActiveSupport::TestCase
  should belong_to(:mating_apiary)
  should belong_to(:delivery)
  should belong_to(:mating_unit)
  should validate_presence_of(:identifier)
end
