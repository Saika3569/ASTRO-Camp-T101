FactoryBot.define do
  factory :task do
    user
    title { "first" }
    content { "give up" }

    trait :invalid do 
      title { nil }
    end

  end
end
