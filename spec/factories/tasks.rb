FactoryBot.define do
  factory :task do
    user
    title { "first" }
    content { "give up" }
  end
end
