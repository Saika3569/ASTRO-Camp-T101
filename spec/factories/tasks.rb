FactoryBot.define do
  factory :task do
    user
    title { "first" }
    content { "give up" }
    start_at {Time.now}
    end_at {Time.now+ 1.day}

    trait :invalid do 
      title { nil }
    end
  end
end
