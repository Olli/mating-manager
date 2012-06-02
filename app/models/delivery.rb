class Delivery < ActiveRecord::Base
  include AASM
  aasm column: :state do
    state :requested, initial: true
    state :accepted
    state :denied
    state :archived

    event :accept do
      transitions from: :requested, to: :accepted
    end
    event :deny do
      transitions from: :requested, to: :denied
    end
    event :archive do
      transitions from: [:requested,:denied,:accepted], to: :archived
    end
    event :dearchive do
      transitions from: :archived, to: :requested
    end
  end
  scope :only_new, where(:state => :requested)
  scope :only_accepted, where(:state => :accepted)
  scope :only_denied, where(:state => :denied)
  scope :archived, where(:state => :archived)
  scope :order_by, lambda { |order|
    case order
      when 'pickupdate'
        order("pickupdate")
      when 'state'
        order("state")
      when 'incomedate'
        order("incomedate")
      when 'mating_unit'
        order('mating_unit_id')
      end
  }

  has_many   :used_places, :conditions => { :state => 'accepted'}
  belongs_to :user
  belongs_to :mating_apiary
  belongs_to :mating_unit
  validates  :incomedate, presence: { on: :create }
  validates  :state, presence: true
  validates  :amount, presence: true

  def change_state(event)
    event = [event.to_sym] & self.aasm_permissible_events_for_current_state
    event = (event[0].to_s + '!').to_sym
    self.send(event)
    self.save
  end


end
