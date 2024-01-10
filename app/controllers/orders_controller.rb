class OrdersController < ApplicationController
  
  def index
    @item = Item.find_by(id: params[:item_id])
    # ▲ item_id を取得 Formオブジェクトパターンで item_id を追加 ▲ #
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: 422
    end
  end

    private

    def order_address_params
      params.require(:order_address).permit(:post_code, :city, :address_no, :building_name, :phone_number, :prefecture_id).merge(user_id: current_user.id, item_id: @item.id)
    end

end
