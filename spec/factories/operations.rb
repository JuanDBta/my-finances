# spec/factories/operations.rb

FactoryBot.define do
  factory :operation do
    name { 'Sample Operation' }
    amount { 10.0 }
    user { association :user } 
    category { 'Sample Category' }
  end
end
