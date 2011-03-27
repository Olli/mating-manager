# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

#users
admin = User.create(:email => 'admin@test.de', 
                    :password => 'test', :password_confirmation => 'test')
admin.first_name    = 'Peter'
admin.last_name     = 'Lustig'
admin.house_number  = "10a"
admin.street        = "Lustigstrasse",
admin.zip           = "01234"
admin.city          = "Meinestadt"
#admin.country       = Country.find_by_code('DE')
admin.save

deliverer = User.create(:email => 'deliverer@test.de', :password => 'test', :password_confirmation => 'test')

# apiaries
apiary = MatingApiary.create(:name => "Belegstelle1",
                             :lat => 51, :lon => 13,
                             :address => "Adresse\n Strasse",
                             :free_places => 50 )
# mating units
kieler = MatingUnit.create(:name => 'Kieler Begattungskasten')
miniplus = MatingUnit.create(:name => 'MiniPlus')

delivery_kieler = apiary.delivery.create(:user => deliverer,
                                  :mating_unit => kieler,
                                  :amount => 10,
                                  :incomedate => Time.now,
                                  :pickupdate => Time.now + 30.days
                                  )
delivery_miniplus = apiary.delivery.create(:user => deliverer,
                                  :mating_unit => miniplus,
                                  :amount => 20,
                                  :incomedate => Time.now,
                                  :pickupdate => Time.now + 30.days
                    )
delivery_kieler.accept!
delivery_miniplus.deny!

#father lines
apiary.create_father_line(:name => 'Carnica1', :race=> "Carnica", :startdate => Time.now, :enddate => Time.now + 30.days )

apiary.places.create(:mating_unit => kieler, :amount => 5)
apiary.places.create(:mating_unit => miniplus, :amount => 10)

(1..20).each do |d|
  used_place1 = UsedPlace.create(:mating_apiary => apiary, :delivery => delivery_kieler, :mating_unit => kieler, :identifier => "KL#{d}")
end
