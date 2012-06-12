FactoryGirl.define  do
  sequence(:apiary_name) { |n| "Testapiary#{n}" }

  factory :mating_apiary do
    name { generate(:apiary_name)}
    lat 51.0
    lon 30.0
    address "Address"
    enabled true
    association :user, factory: :user_manager

    after(:create) do |ma|
      #inactive
      FactoryGirl.create_list(:carnica,2, mating_apiary: ma)
      #archived
      FactoryGirl.create_list(:carnica_archived, 10, mating_apiary: ma )
      # active
      FactoryGirl.create(:carnica_active, mating_apiary: ma)

    end

    factory :mating_apiary_offline do
      enabled false
    end

  end
end