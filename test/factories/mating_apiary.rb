FactoryGirl.define  do

  factory :mating_apiary do
    sequence(:name) { |n| "Testapiary#{n}" }
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

      # create place
      FactoryGirl.create_list(:place, 5, mating_apiary: ma)
    end

    factory :mating_apiary_offline do
      enabled false
    end

    factory :mating_apiary_without_active_fatherline do
      after(:create) do |ma|
        #inactive
        FactoryGirl.create_list(:carnica,2, mating_apiary: ma)
        #archived
        FactoryGirl.create_list(:carnica_archived, 10, mating_apiary: ma )
        ma.father_lines.where(state: 'active').first.destroy
      end
    end

  end
end