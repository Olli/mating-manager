class UsedPlace < ActiveRecord::Base
  belongs_to :mating_apiary
  belongs_to :delivery
  belongs_to :mating_unit

  validates_presence_of :identifier, :on => :create, :message => "can't be blank"
end
