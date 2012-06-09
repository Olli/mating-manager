require 'test_helper'

class MatingApiaryTest < ActiveSupport::TestCase
  should have_many(:deliveries)
  should have_many(:places)
  should have_many(:used_places)
  should have_many(:father_lines)
  should validate_presence_of(:name)
  should validate_presence_of(:address)
  should validate_uniqueness_of(:name)

  test 'fatherline active' do
    ma = MatingApiary.where(:name => 'Testapiary2').last
    puts ma.inspect
    assert_equal 'active', ma.father_line.state
  end

  test 'fatherline archived' do
    ma = MatingApiary.where(:name => 'Testapiary1').first
    assert_equal nil, ma.father_line
  end
end
