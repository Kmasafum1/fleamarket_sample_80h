class ItemsController < ApplicationController
  def index
    @items = Item.all
    @parents = Category.where(ancestry: nil)
    
  end
end
