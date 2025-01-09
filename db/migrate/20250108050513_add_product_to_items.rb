class AddProductToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :product, :string
  end
end
