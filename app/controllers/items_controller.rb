class ItemsController < ApplicationController
  def index
    @items = Item.all.order('id DESC').limit(10)
  end
  def show

  end
end
