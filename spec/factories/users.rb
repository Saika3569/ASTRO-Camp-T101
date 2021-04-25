FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    password { Faker::Internet.password }
    
    trait :touhou do
      name { Faker::Games::Touhou.character}
    end

    trait :zelda do
      name { Faker::Games::Zelda.character}
    end

  end
end
