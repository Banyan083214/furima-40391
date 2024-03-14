class OrdersController < ApplicationController
  def index
    item_id = params[:item_id]
    @item = Item.find(item_id)
    @order_shipping_address = OrderShippingAddress.new
  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_shipping_address_params)
    @item = Item.find(params[:item_id])

    if @order_shipping_address.valid?
      @order_shipping_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_shipping_address_params
    params.require(:order_shipping_address).permit(:user_id, :item_id, :postal_code, :area_id, :city, :street_address, :building, :telephone_number)
  end
end
