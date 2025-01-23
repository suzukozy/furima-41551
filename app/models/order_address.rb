class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code,
                :prefecture_id,
                :municipality,
                :house_number,
                :building,
                :phone_number,
                :user_id,
                :item_id,
                :token

  with_options presence: true do
    validates :post_code, format: {
      with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include a hyphen (-)'
    }
    validates :phone_number, format: {
      with: /\A\d{10,11}\z/, message: 'is invalid'
    }
    validates :prefecture_id, numericality: {
      other_than: 1, message: "can't be blank"
    }
    validates :user_id
    validates :item_id
    validates :municipality
    validates :house_number
    validates :token
  end

  def save
    order = Order.create(
      user_id: user_id,
      item_id: item_id
    )
    Address.create(
      post_code: post_code,
      prefecture_id: prefecture_id,
      municipality: municipality,
      house_number: house_number,
      building: building,
      phone_number: phone_number,
      order_id: order.id
    )
  end
end
