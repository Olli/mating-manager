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
  has_one :user, through: :mating_apiary


  validates :name, presence: true
  validates :race, presence: true
  validates :startdate, presence: true
  validates :enddate, presence: true
  validates_associated :mating_apiary, if: :active?


  scope :actives, where(state: 'active')
  scope :archivated, where(state: 'archivated')

end
