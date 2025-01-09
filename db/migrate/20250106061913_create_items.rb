class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :product, null: false        # 商品名
      t.text :explain, null: false         # 商品の説明
      t.integer :category_id, null: false  # 商品カテゴリー
      t.integer :condition_id, null: false # 商品の状態
      t.integer :shipping_fee_id, null: false # 配送料負担
      t.integer :prefecture_id, null: false   # 発送元の地域
      t.integer :required_number_of_day_id, null: false # 発送までの日数
      t.integer :price, null: false        # 販売価格
      t.references :user, null: false, foreign_key: true # ユーザーとの関連付け
      t.timestamps
    end
  end
end
