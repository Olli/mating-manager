require 'test_helper'

class FatherLineTest < ActiveSupport::TestCase
  should belong_to(:mating_apiary)
  should have_one(:user).through(:mating_apiary)
  should validate_presence_of(:name)
  should validate_presence_of(:startdate)
  should validate_presence_of(:enddate)
  should validate_presence_of(:race)

  test "should be inactive on create" do
    a = FactoryGirl.create(:father_line)
    fl = FatherLine.create(a.attributes)
    assert fl.inactive?
  end
end
