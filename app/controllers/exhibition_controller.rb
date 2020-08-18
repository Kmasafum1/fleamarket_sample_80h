class ExhibitionController < ApplicationController
  
  def new
    @category = Category.where(ancestry: nil)
  end

  def category_children
    @category_chid = Category.find(params[:id]).children
  end

  def category_grandchildren
    @category_grandchild = Category.find(params[:id]).children
  end


end