class MatingApiary < ActiveRecord::Base
  resourcify
  has_many :places
  has_many :mating_units, through: :places
  has_many :used_places
  has_many :deliveries
  has_many :father_lines
  belongs_to  :user
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true

  accepts_nested_attributes_for :places, allow_destroy: true

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

  def add_manager(user)
    self.user = user
  end

  def father_line
    today = DateTime.now
    self.father_lines.where('startdate < ? and enddate > ?',today,today).where(state: 'active').first
  end

end
