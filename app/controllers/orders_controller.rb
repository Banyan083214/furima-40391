class OrdersController < ApplicationController
  def index
  end

  def new
    @order_shipping_address = OrderShippingAddress.new
  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_shipping_address_params)

    if @order_shipping_address.valid?
      @order_shipping_address.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def order_shipping_address_params
    params.require(:order_shipping_address).permit(:user_id, :item_id, :postal_code, :area_id, :city, :street_address, :building, :telephone_number)
  end
end
