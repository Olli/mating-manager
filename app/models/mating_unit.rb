class MatingUnit < ActiveRecord::Base
  has_many :places
  has_many :used_places
  has_many :deliverers, :through => :used_places
  validates_uniqueness_of :name, :on => :create
end
