FactoryBot.define do
  factory :user do
    sequence(:account) { |n| "user #{n}" }
    password { Faker::Internet.password }
    
    trait :touhou do
      name { Faker::Games::Touhou.character}
    end

    trait :zelda do
      name { Faker::Games::Zelda.character}
    end

  end
end
