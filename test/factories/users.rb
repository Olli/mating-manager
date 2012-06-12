FactoryGirl.define do
  factory :user do
    password "testtest"
    password_confirmation "testtest"
    after(:create) do |user|
      user.confirm!
    end
    factory :user_deliverer do
      sequence(:email) {|n| "deliverer#{n}@factory.com" }
      after(:create) do |user|
        user.add_role :deliverer
      end
    end
    factory :user_manager do
      sequence(:email) {|n| "manager#{n}@factory.com" }
      after(:create) do |manager|
        manager.add_role :manager
      end
    end
    factory :user_admin do
      sequence(:email) {|n| "admin#{n}@factory.com" }
      after(:create) do |admin|
        admin.add_role :admin
      end
    end
  end
end