require 'test_helper'

class MatingUnitTest < ActiveSupport::TestCase
  should have_many(:places)
  should have_many(:used_places)
  should have_many(:deliveries)
  should have_attached_file(:picture)
  should validate_attachment_size(:picture).less_than(1.megabytes)
end
