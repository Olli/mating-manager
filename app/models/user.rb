class User < ActiveRecord::Base
	rolify
  devise :database_authenticatable,
         :confirmable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :registerable

  has_many :deliveries
  has_one  :mating_apiary
  belongs_to :country
  has_many :father_lines, through: :mating_apiary
  attr_accessible :email,
                  :password,
                  :password_confirmation,
                  :first_name,
                  :last_name,
                  :house_number,
                  :street,
                  :zip,
                  :city,
                  :country_id,
                  :remember_me

  def full_name
    "#{first_name} #{last_name}"
  end

 protected
  def password_required?
    !persisted? || password.present? || password_confirmation.present?
  end
end
