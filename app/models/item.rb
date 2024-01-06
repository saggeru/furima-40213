class Item < ApplicationRecord

  validates :item_name, :about_item, :price, presence: true, unless: :was_attaced?
  validates :category_id, :condition_id, :shipping_fee_payment_id, :shipping_day_id, :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  
  def was_attached?
    self.image.attached?
  end


  # -- アソシエーション -- #
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensinons
  belongs_to :category, :condition, :shipping_fee_payment, :shipping_day, :prefecture

end
