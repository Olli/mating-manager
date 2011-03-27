class MatingUnit < ActiveRecord::Base
  has_many :places
  has_many :used_places
  has_many :deliveries
  validates_uniqueness_of :name, :on => :create
end
