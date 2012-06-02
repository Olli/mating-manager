class Place < ActiveRecord::Base
  belongs_to :mating_apiary
  belongs_to :mating_unit
  has_many :deliveries

  validates_associated :mating_unit, :mating_apiary
  validates  :mating_unit_id, uniqueness: { scope: :mating_apiary_id }
end
