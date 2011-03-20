class MatingApiary < ActiveRecord::Base
  has_many :places
  has_many :used_places
  has_many :deliverers
  validates_presence_of :name
  validates_presence_of :address
  validates_uniqueness_of :name

end
