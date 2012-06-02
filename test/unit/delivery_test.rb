require 'test_helper'

class DeliveryTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:mating_apiary)
  should belong_to(:mating_unit)
  should have_many(:used_places)
  should validate_presence_of(:amount)
  should validate_presence_of(:incomedate)
  #should validate_presence_of(:state)

  should "change_from requested to accepted" do
    d = deliveries(:delivery1_requested)
    d.accept!
    assert_equal d.state, "accepted"
  end
  should "change_from requested to denied" do
    d = deliveries(:delivery1_requested)
    d.deny!
    assert_equal d.state, "denied"
  end

  should "change from requested to denied with change_state" do
    d = deliveries(:delivery1_requested)
    d.change_state('deny')
    assert_equal d.state, "denied"
  end

  should "not change from requested to denyed with event deny1 with change_state" do
    d = deliveries(:delivery1_requested)
    d.change_state('deny1')
    assert_equal d.state, "requested"
  end

end
