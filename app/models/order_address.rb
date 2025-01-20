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

  # :price

  with_options presence: true do
    # validates :price, numericality: {
    #   greater_than_or_equal_to: 300,
    #   less_than_or_equal_to: 9_999_999,
    #   only_integer: true
    # }
    validates :post_code, format: {
      with: /\A[0-9]{3}-[0-9]{4}\z/
    }
    validates :phone_number, format: {
      with: /\A\d{10,11}$\z/
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
      # price:,
      user_id:,
      item_id:
    )
    Address.create(
      post_code:,
      prefecture_id:,
      municipality:,
      house_number:,
      building:,
      phone_number:,
      order_id: order.id
    )
  end
end
