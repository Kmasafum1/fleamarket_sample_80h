class BuyersController < ApplicationController
  require "payjp"
  before_action :set_card

  def index
    @item = Item.find(params[:item_id])
    unless user_signed_in?
      redirect_to user_session_path
      return
    end
 
    if @card.blank?
      redirect_to new_card_path
    else
      Payjp.api_key = Rails.application.credentials.PAYJP[:secret_access_key]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_info = customer.cards.retrieve(customer.default_card)
      @card_brand = @card_info.brand
      @exp_month = @card_info.exp_month.to_s
      @exp_year = @card_info.exp_year.to_s.slice(2,3) 
      case @card_brand
      when "Visa"
        @card_image = "visa.png"
      when "JCB"
        @card_image = "jcb.png"
      when "MasterCard"
        @card_image = "master.png"
      when "American Express"
        @card_image = "amex.png"
      when "Diners Club"
        @card_image = "diners.png"
      when "Discover"
        @card_image = "discover.png"
      end
    end
  end

  def pay
    @item = Item.find(params[:item_id])
    Payjp.api_key = Rails.application.credentials.PAYJP[:secret_access_key]
    charge = Payjp::Charge.create(
      amount: @item.price,
      customer: Payjp::Customer.retrieve(@card.customer_id),
      currency: 'jpy'
    )
    @item.update( buyer_id: current_user.id)
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :condition, :delivery_cost, :sipping_area, :sipping_days, :price, :category_id, :brand_id)
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end
end
