FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user #{n}" }
    account { 'saika11111' }
    password { 'saika77777' }
    
    factory :other_user do
      account { 'kyon'}
      password { 'kyon44444'}
    end

  end
end
