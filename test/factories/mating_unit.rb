FactoryGirl.define do
  factory :mating_unit do
    sequence(:name) { |n| "MatingUnit#{n}"}
  end
end