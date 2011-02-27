class Deliverer < ActiveRecord::Base
  belongs_to :user
  belongs_to :mating_apiary
end
