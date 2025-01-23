FactoryBot.define do
  factory :order_address do
    token         { 'tok_abcdefghijk00000000000000000' }
    post_code     { '123-4567' }
    prefecture_id { 2 }
    municipality  { Faker::Lorem.sentence }
    house_number  { '1-2-3番地' }
    building      { Faker::Lorem.sentence }
    phone_number  { '09012345678' }
    user_id       { nil }
    item_id       { nil }
  end
end
