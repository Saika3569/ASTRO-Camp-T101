FactoryBot.define do
  factory :tag do
    name { Faker::Games::Touhou.character }
  end
end
