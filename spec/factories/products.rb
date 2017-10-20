FactoryGirl.define do
  factory :product do
    name Faker::Commerce.product_name
    brand Faker::Lorem.word
    sequence(:model) { |n| "X#{n}" }
    sequence(:sku) { |n| "024f8ec#{n}-#{n}93e-489#{n}-#{n}b3c-#{n}b315691a3b5" }
    price Faker::Commerce.price
    desc Faker::Lorem.paragraph
  end
end
