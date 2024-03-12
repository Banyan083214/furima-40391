class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:update, :edit, :show]
  before_action :authorize_item_owner, only: [:edit, :update,]

  
  def index
  @items = Item.order(created_at: :desc)

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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  private

  def set_item
    @item = Item.find(params[:id])
  end

  def authorize_item_owner
    unless current_user && @item.user == current_user
      redirect_to root_path
    end
  end

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