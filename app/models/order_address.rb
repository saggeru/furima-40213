class OrderAddress

  include ActiveModel::Model
  attr_accessor :post_code, :city, :address_no, :building_name, :phone_number, :prefecture_id, :user_id, :item_id

end