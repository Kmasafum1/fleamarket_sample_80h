class CategoriesController < ApplicationController
  def index
    # @parents = Category.where(ancestry: nil)
    @parents = Category.all.order("ancestry ASC").limit(2)
  end
end