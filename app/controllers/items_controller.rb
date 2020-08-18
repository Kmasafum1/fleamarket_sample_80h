class ItemsController < ApplicationController
  def index
   
    @parents = Category.where(ancestry: nil)
    
    @items = Item.all.order('id DESC').limit(10)
  end
  def show

  end
end
