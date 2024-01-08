class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  private
  
  def item_params
    params.require(:item).permit(:image, :item_name, :about_item, :price, :category_id, :condition_id, :shipping_fee_payment_id, :prefecture_id, :shipping_day_id).merge(user_id: current_user.id)
  end

end
