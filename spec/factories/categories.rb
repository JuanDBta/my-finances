# en spec/factories/categories.rb

FactoryBot.define do
  factory :category do
    name { 'Sample Category' }
    icon { 'restaurants.png' }
    user { create(:user) }
  end
end
