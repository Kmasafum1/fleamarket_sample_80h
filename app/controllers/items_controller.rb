class ItemsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]

  def index
    @items = Item.all
    @items = Item.all.order('id DESC').limit(10)
  end

  def new
    if user_signed_in?
      @item = Item.new
      @item.item_images.new
      @category = Category.where(ancestry: nil).each do |parent|
      end
    else
      redirect_to root_path
    end
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def show
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :condition, :delivery_cost, :sipping_area, :sipping_days, :price, :category_id, :user_id, :brand_id, item_images_attributes: [:image, :_destroy, :id])
  end
  
  def set_product
    @item = Item.find(params[:id])
  end
end
