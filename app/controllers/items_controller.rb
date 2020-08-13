class ItemsController < ApplicationController
  def index
    @items = Item.all
    @parents = Category.all.order("ancestry ASC").limit(2)
  end
end
