class Item < ApplicationRecord

  validates :item_name, :about_item, :price, presence: true
  validates :category_id, :condition_id, :shipping_fee_payment_id, :shipping_day_id, :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  
end
