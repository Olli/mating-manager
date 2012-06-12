class FatherLine < ActiveRecord::Base
  resourcify
  include AASM
  aasm :column => :state do
    state :inactive, initial: true
    state :active
    state :archived

    event :activate do
      transitions from: :inactive, to: :active
    end
    event :archive do
      transitions from: :active, to: :archived
    end
  end
  belongs_to :mating_apiary
  

  validate :name, presence: true
  validate :race, presence: true
  validate :startdate, presence: true
  validate :enddate, presence: true
  validates_associated :mating_apiary, if: :active?


  scope :actives, where(state: 'active')
  scope :archivated, where(state: 'archivated')
end
