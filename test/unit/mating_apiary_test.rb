require 'test_helper'

class MatingApiaryTest < ActiveSupport::TestCase
  should have_many(:deliveries)
  should have_many(:places)
  should have_many(:used_places)
  should have_many(:father_lines)
  should have_many(:mating_units)
  should belong_to(:user)
  should validate_presence_of(:name)
#  should validate_uniqueness_of(:name).case_insensitive

  should validate_presence_of(:address)
  test 'fatherline active' do
    ma = FactoryGirl.create(:mating_apiary)
    assert_equal 'active', ma.father_line.state
  end

  test 'fatherline archived' do
    ma = FactoryGirl.create(:mating_apiary_without_active_fatherline)
    assert_equal nil, ma.father_line
  end
end
