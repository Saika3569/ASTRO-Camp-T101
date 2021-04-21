FactoryBot.define do
  factory :task do
    user
    title { "first" }
    content { "give up" }
    start_at {Time.now}
    end_at {Time.now+ 1.day}
    priority {rand 0..2}

    trait :invalid do 
      title { nil }
    end
  end
end
