class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :post_code,      null: false
      t.string :city,           null: false
      t.string :address_no,     null: false
      t.string :buiding_name
      t.string :phone_number,   null: false
      t.integer :prefecture_id, null: false
      t.references :order,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
