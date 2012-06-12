FactoryGirl.define do


  factory :father_line, aliases: [:carnica] do
    sequence(:name) { |n| "Carnica#{n}" }
    race "Carnica"
    description "Fatherline description"
    startdate 30.days.ago
    enddate 60.days.from_now
    state "inactive"
    factory :carnica_active do
      state "active"
    end
    factory :carnica_archived do
      state "archived"
    end
  end

end
