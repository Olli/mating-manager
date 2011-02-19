class Translation < ActiveRecord::Base
  write_inheritable_attribute(:attr_serialized, {})

  validates_uniqueness_of :key, :scope => :locale
end
