# spec/factories/users.rb

FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'password123' }
    password_confirmation { 'password123' }
  end
end
