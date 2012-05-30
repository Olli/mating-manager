class MatingApiary < ActiveRecord::Base
  has_many :places
  has_many :used_places
  has_many :deliveries
  has_one  :father_line
  validate :name, presence: true
  validate :address, presence: true
  validates_uniqueness_of :name, :on => :create
  scope :approved, where(:enabled => true)

  def approve!
    self.enabled = true
    save
  end

  def useable_places
    useable = 0
    places.each { |p| useable += p.amount }
    useable
  end

  # TODO ensure that there are no negative "open_places"
  def open_places
    useable_places - used_places.count
  end
end
