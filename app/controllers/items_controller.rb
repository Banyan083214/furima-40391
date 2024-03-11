class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @items = Item.all
    @items = @items.order(created_at: :desc)

    respond_to do |format|
      format.html
    end
  end  

  def new
    @item = Item.new
  end


  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  
  private

  def item_params
    params.require(:item).permit(
    :item_name,
    :category_id,
    :area_id,
    :condition_id,
    :price,
    :load_id,
    :deadline_id,
    :explanation, 
    :image,
    ).merge(user_id: current_user.id)
  end
end