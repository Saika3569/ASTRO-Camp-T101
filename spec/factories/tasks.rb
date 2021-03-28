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

    trait :invalidtime do
      start_at {Date.today + 1.day}
      end_at {Date.today }
    end

  end
end
