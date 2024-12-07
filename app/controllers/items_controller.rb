class ItemsController < ApplicationController
  def index
    @items = Item.includes(:order).order(created_at: :desc)
  end
end
