FactoryBot.define do
  factory :order_address do
    token         { 'tok_aaaaaaaaaaa1111111111111111' }
    post_code     { '123-4567' }
    prefecture_id { 2 }
    municipality  { Faker::Lorem.sentence }
    house_number  { '1-2-3番地' }
    building      { Faker::Lorem.sentence }
    phone_number  { '12345678900' }
  end
end
