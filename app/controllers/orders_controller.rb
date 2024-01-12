class OrdersController < ApplicationController
  
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_rootpath, only: [:index]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      @order_address.save
      pay_item.save
      redirect_to root_path
    else
      render :index, status: 422
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:post_code, :city, :address_no, :building_name, :phone_number, :prefecture_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find_by(id: params[:item_id])
  end

  def move_to_rootpath
    if user_signed_in? && current_user == @item.user || @item.order.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_address_params[:token],
        currency: 'jpy'
      )
  end

end
