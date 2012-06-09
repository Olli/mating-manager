require 'test_helper'

class FatherLineTest < ActiveSupport::TestCase
  should belong_to(:mating_apiary)
  should belong_to(:user)
  should validate_presence_of(:name)
  should validate_presence_of(:startdate)
  should validate_presence_of(:enddate)
  should validate_presence_of(:race)

  test "should be inactive on create" do
    a = assets(:carnica)
    fl = FatherLine.create(a.attributes)
    assert fl.inactive?
  end
end
