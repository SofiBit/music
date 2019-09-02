FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name  { "Doe" }
    email { "test@example.com" }
    password { "password" }
  end

  factory :admin do
    first_name { "Sonya" }
    last_name  { "Bitno" }
    email { "sonya@example.com" }
    password { "password" }
    role { "admin" }
  end
end
