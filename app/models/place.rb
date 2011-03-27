class Place < ActiveRecord::Base
  belongs_to :mating_apiary
  belongs_to :mating_unit
  has_many :deliveries
end
