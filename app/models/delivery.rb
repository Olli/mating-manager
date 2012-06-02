class Delivery < ActiveRecord::Base
  include AASM
  aasm_column :state
  aasm_initial_state :requested
  aasm_state :requested
  aasm_state :accepted
  aasm_state :denied
  aasm_state :archived

  aasm_event :accept do
    transitions :from => :requested, :to => :accepted
  end
  aasm_event :deny do
    transitions :from => :requested, :to => :denied
  end
  aasm_event :archive do
    transitions :from => [:requested,:denied,:accepted], :to => :archived
  end
  aasm_event :dearchive do
    transitions :from => :archived, :to => :requested
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
  validates_presence_of :incomedate, :on => :create
  validates_presence_of :state
  validates_presence_of :amount

  def change_state(event)
    event = [event.to_sym] & self.aasm_permissible_events_for_current_state
    event = (event[0].to_s + '!').to_sym
    self.send(event)
    self.save
  end


end
