FactoryBot.define do
  factory :item do
    association :user
    product { Faker::Lorem.sentence }
    explain { Faker::Lorem.sentence }
    price   { Faker::Number.between(from: 300, to: 1_000_000) }
    category_id                 { 2 }
    condition_id                { 2 }
    shipping_fee_id             { 2 }
    prefecture_id               { 2 }
    required_number_of_day_id   { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
