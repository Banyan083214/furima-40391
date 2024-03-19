class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:update, :edit, :show, :destroy]
  before_action :authorize_item_owner, only: [:edit, :update]

  
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
  
  def destroy
    if current_user == @item.user
      @item.destroy
    end
    redirect_to root_path
  end
    
  
  
  private

  def set_item
    @item = Item.find(params[:id])
  end

  def authorize_item_owner
    if @item.order.present?  # 商品が売却済みかどうかをチェック
      redirect_to root_path  # 売却済みの場合はトップページにリダイレクト
    elsif current_user && @item.user != current_user  # ログインユーザーが商品の出品者ではない場合
      redirect_to root_path  # トップページにリダイレクト
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