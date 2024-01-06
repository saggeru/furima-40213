class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_payment
  belongs_to :shipping_day
  belongs_to :prefecture


  # -- バリデーション -- #
  validates :item_name, :about_item, :price, :image, presence: true
  validates :category_id, :condition_id, :shipping_fee_payment_id, :shipping_day_id, :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}

end
