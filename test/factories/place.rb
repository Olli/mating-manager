FactoryGirl.define do
  factory :place do
    amount { rand(1..5) }
    mating_unit { FactoryGirl.create(:mating_unit) }

  end

end