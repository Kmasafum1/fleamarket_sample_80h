class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create, :show, :edit, :destroy, :category_children, :category_grandchildren]
  before_action :set_item, only: [:destroy, :edit, :update, :show]
  before_action :set_category, only: [:show, :edit, :update]

  def index
    @parents = Category.where(ancestry: nil)
    @items = Item.all.order('id DESC').limit(5)
  end

  def new
    if user_signed_in?
      @item = Item.new
      @item.build_brand
      @item.item_images.new
      @category = Category.where(ancestry: nil)
    else
      redirect_to root_path
    end
  end
  
  def category_children
    @category_chid = Category.find(params[:id]).children
  end

  def category_grandchildren
    @category_grandchild = Category.find(params[:id]).children
  end

  def create
    @item = Item.new(item_params)
    @category = Category.where(ancestry: nil)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.seller_id == current_user.id
      if @item.update(item_params)
        redirect_to item_path(@item.id)
      else
        flash[:alert] = '投稿に失敗しました'
        redirect_to action: 'edit'
      end
    else
      flash[:alert] = '投稿に失敗しました'
      redirect_to action: 'edit'
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :condition, :delivery_cost, :sipping_area, :sipping_days, :price, :category_id, brand_attributes: [:id, :name], item_images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end
  
  def set_category
    @categories =Category.all
  end

end