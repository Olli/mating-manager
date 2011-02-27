class MatingApiary < ActiveRecord::Base
  has_many :places
  has_many :used_places
  has_many :deliverers
end
