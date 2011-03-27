require 'test_helper'

class FatherLineTest < ActiveSupport::TestCase
  should belong_to(:mating_apiary)
  should validate_presence_of(:name)
  should validate_presence_of(:startdate)
  should validate_presence_of(:enddate)
  should validate_presence_of(:race)
end
