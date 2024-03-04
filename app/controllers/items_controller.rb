class ItemsController < ApplicationController
  def index
    @item = Item.new
  end

  def create
    @item.save

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
    :image
    ).merge(user_id: current_user.id)
  end
end