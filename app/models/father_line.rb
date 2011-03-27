class FatherLine < ActiveRecord::Base
  belongs_to :mating_apiary
  validates_presence_of :name
  validates_presence_of :race
  validates_presence_of :startdate
  validates_presence_of :enddate
end
