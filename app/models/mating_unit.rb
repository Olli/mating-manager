class MatingUnit < ActiveRecord::Base
  has_many :places
  has_many :used_places
  has_many :deliveries
  has_attached_file :picture, styles: {
                                medium: "300x300>",
                                thumb: "100x100>"
                              }
  validates_uniqueness_of :name, :on => :create
end
