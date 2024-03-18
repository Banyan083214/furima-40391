class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]

  def index
    if @item.order.present? || current_user == @item.user
      redirect_to root_path
      return
    end
      
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_shipping_address = OrderShippingAddress.new
  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_shipping_address_params)

    if @order_shipping_address.valid?
      pay_item
      @order_shipping_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_shipping_address_params
    params.require(:order_shipping_address).permit(:postal_code, :area_id, :city, :street_address, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_shipping_address_params[:token],
      currency: 'jpy'
    )
  end
end
