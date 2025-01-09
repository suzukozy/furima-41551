class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :required_number_of_day
  belongs_to :user

  validates :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :required_number_of_day_id,
            numericality: { other_than: 1, message: "can't be blank" }

  validates :price, presence: true, numericality: {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999,
    only_integer: true
  }

  with_options presence: true do
    validates :image
    validates :product
    validates :explain
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :required_number_of_day_id
  end
end
