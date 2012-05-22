class User < ActiveRecord::Base
  devise :database_authenticatable,
         :confirmable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :registerable

  has_many :deliveries
  belongs_to :country

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
