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
  
end
