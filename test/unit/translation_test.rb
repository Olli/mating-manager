require 'test_helper'

class TranslationTest < ActiveSupport::TestCase
  should validate_uniqueness_of(:key).scoped_to(:locale)
    
end
