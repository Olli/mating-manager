# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# countries - taken from the plugin
puts "Importing countries"
Geography::COUNTRIES.each do |name, code|
  Country.create(:name => name, :code => code)
end
puts "\n", "*"*5, "Imported #{Country.count} countries", "\n"

#users
admin = User.new
admin.email         = 'admin@test.de'
admin.password      = 'testtest'
admin.password_confirmation = 'testtest'
admin.first_name    = 'Peter'
admin.last_name     = 'Lustig'
admin.house_number  = "10a"
admin.street        = "Lustigstrasse",
admin.zip           = "01234"
admin.city          = "Meinestadt"
admin.country       = Country.find_by_code('DE')
admin.save
admin.confirm!
admin.add_role :admin

manager = User.new
manager.email         = 'manager@test.de'
manager.password      = 'testtest'
manager.password_confirmation = 'testtest'
manager.first_name    = 'Frank'
manager.last_name     = 'Zander'
manager.house_number  = "10a"
manager.street        = "Bienenstrasse",
manager.zip           = "01234"
manager.city          = "Meinestadt"
manager.country       = Country.find_by_code('DE')
manager.save
manager.confirm!

manager2 = User.new
manager2.email         = 'manager2@test.de'
manager2.password      = 'testtest'
manager2.password_confirmation = 'testtest'
manager2.first_name    = 'Frank2'
manager2.last_name     = 'Zander2'
manager2.house_number  = "10a2"
manager2.street        = "Bienenstrasse2",
manager2.zip           = "012342"
manager2.city          = "Meinestadt2"
manager2.country       = Country.find_by_code('DE')
manager2.save
manager2.confirm!


deliverer = User.new
deliverer.email = 'deliverer@test.de'
deliverer.password = 'testtest'
deliverer.password_confirmation = 'testtest'
deliverer.save
deliverer.confirm!
deliverer.add_role :deliverer



# apiaries
apiary = MatingApiary.create(:name => "Belegstelle1",
                             :lat => 51, :lon => 13,
                             :address => "Adresse\n Strasse")
apiary.approve!
apiary.user = manager
apiary.save
manager.add_role :manager, apiary

apiary2 = MatingApiary.create(:name => "Belegstelle2",
                             :lat => 51, :lon => 13,
                             :address => "Adresse\n Strasse")
apiary2.approve!
apiary2.user = manager2
apiary2.save
manager2.add_role :manager, apiary2


# mating units
kieler = MatingUnit.create(:name => 'Kieler Begattungskasten')
miniplus = MatingUnit.create(:name => 'MiniPlus')

# create some deliveries
apiary = MatingApiary.first
delivery_kieler = apiary.deliveries.create(:user => deliverer,
                                  :mating_unit => kieler,
                                  :amount => 10,
                                  :incomedate => Time.now,
                                  :pickupdate => Time.now + 30.days
                                  )
delivery_miniplus = apiary.deliveries.create(:user => deliverer,
                                  :mating_unit => miniplus,
                                  :amount => 20,
                                  :incomedate => Time.now,
                                  :pickupdate => Time.now + 30.days
                    )
#accept and deny this deliveries
delivery_kieler.accept!
delivery_miniplus.deny!

#father lines
apiary.create_father_line(:name => 'Carnica1', :race=> "Carnica", :startdate => Time.now, :enddate => Time.now + 30.days, user: manager1 )
apiary.create_father_line(:name => 'Buckfast1', :race=> "Buckfast", :startdate => Time.now, :enddate => Time.now + 30.days, user: manager1 )

apiary.places.create(:mating_unit => kieler, :amount => 5)
apiary.places.create(:mating_unit => miniplus, :amount => 10)

(1..20).each do |d|
  used_place1 = UsedPlace.create(:mating_apiary => apiary, :delivery => delivery_kieler, :mating_unit => kieler, :identifier => "KL#{d}")
end
