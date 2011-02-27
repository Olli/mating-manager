require 'test_helper'

class DelivererTest < ActiveSupport::TestCase
  should belong_to(:user)  
  should belong_to(:mating_apiary)
  
end
