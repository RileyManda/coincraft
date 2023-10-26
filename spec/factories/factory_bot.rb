FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    email { 'john@example.com' }
    password { 'password123' }
  end
end


FactoryBot.define do
  factory :transaction do
    name { 'Example Transaction' }
    amount { 100.0 }
    association :user
  end
end


FactoryBot.define do
  factory :category do
    name { 'Example Category' }
    icon { '🛒' }
    association :user
  end
end
