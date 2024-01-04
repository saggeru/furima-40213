
# Usersテーブル

## Column            | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_kana         | string | null: false               |
| last_kana          | string | null: false               |
| birthday           | date   | null: false               |
| ------------------ | ------ | ------------------------- |

## Association
- has_many :items
- has_many :orders



# Itemsテーブル

## Column                 | Type       | Option                         |
| ----------------------- | ---------- | ------------------------------ |
| item_name               | string     | null: false                    |
| about_item              | text       | null: false                    |
| price                   | integer    | null: false                    |
| user                    | references | null: false, foreign_key: true |
| category_id             | integer    | null: false                    |
| condition_id            | integer    | null: false                    |
| shipping_fee_payment_id | integer    | null: false                    |
| shipping_day_id         | integer    | null: false                    |
| prefecture_id           | integer    | null: false                    |
| ----------------------- | ---------- | ------------------------------ |

## Association
belongs_to :user
belongs_to :category
belongs_to :condition
belongs_to :shipping_fee_payment
belongs_to :shipping_day
belongs_to :prefecture
has_one :order

## ActiveHashモデルの定義
- category(カテゴリー)
- condition(製品状態)
- shipping_fee_payment(配送料負担)
- shipping_day(購入確定から発送までの日数)
- prefecture(発送元都道府県) << これらのモジュールをItemテーブルへ取り込みます



# Addressesテーブル

## Column          | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| city             | string     | null: false                    |
| address_no       | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| prefectures      | integer    | null: false,                   |
| order            | references | null: false, foreign_key: true |
| ---------------- | ---------- | ------------------------------ |

## Association
- belongs_to :order
- belongs_to :prefecture_id

## ActiveHashモデルの定義
- prefectures(都道府県) モジュールを取り込みます。



# Ordersテーブル

## Column | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| ------- | ---------- | ------------------------------ |

## Association
- belongs_to :user
- belongs_to :item
- has_one :address