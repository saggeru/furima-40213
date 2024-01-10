class OrderAddress

  include ActiveModel::Model
  attr_accessor :post_code, :city, :address_no, :building_name, :phone_number, :prefecture_id, :user_id, :item_id

  # ▼ バリデーション ▼ #
  with_options presence: true do
    validates :user_id, :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Only enter in japanese"}
    validates :address_no, format: {with: /\A[ぁ-んァ-ン一-龥0-9０-９]+\z/, message: "is invalid."}
    validates :phone_number, format: {with: /\A[0-9]+\z/, length: 10..13}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, city: city, address_no: address_no, building_name: building_name, phone_number: phone_number, prefecture_id: prefecture_id, order_id: order.id)
  end
end