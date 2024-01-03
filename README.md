# Userテーブル

## Column            | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false, minimum: 6   |
|------------------- | ------ | ------------------------- |

## Association
- has_one :user_info
- has_many :products
- has_many :orders


# User_infoテーブル

## Column    | Type       | Option                            |
| ---------- | ---------- | --------------------------------- |
| first_name | string     | null: false                       |
| last_name  | string     | null: false                       |
| first_kana | string     | null: false                       |
| last_kana  | string     | null: false                       |
| birthday   | integer    | null: false                       |
| user_id    | references | null: false, foreign_key: true    |
| ---------- | ---------- | --------------------------------- |

## Association
- belongs_to :user


# Itemテーブル

## Column              | Type       | Option                         |
| -------------------- | ---------- | ------------------------------ |
| item_name            | string     | null: false                    |
| about_item           | text       | null: false                    |
| price                | integer    | null: false                    |
| user_id              | references | null: false, foreign_key: true |
| category             | references | null: false, foreign_key: true |
| condition            | references | null: false, foreign_key: true |
| shipping_fee_payment | references | null: false, foreign_key: true |
| shipping_area        | references | null: false, foreign_key: true |
| shipping_day         | references | null: false, foreign_key: true |
| -------------------- | ---------- | ------------------------------ |

## Association
belongs_to :user
belongs_to :category
belongs_to :condition
belongs_to :shipping_fee_payment
belongs_to :shipping_area
belongs_to :shipping_day
has_one :order

## ActiveHashモデルの定義
- category(カテゴリー)
- condition(製品状態)
- shipping_fee_payment(配送料負担)
- shipping_area(発送元地域)
- shipping_day(購入確定から発送までの日数) これらのモジュールをItemテーブルへ取り込みます


# Orderテーブル

## Column       | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| city          | string     | null: false                    |
| address_no    | string     | null: false                    |
| building_name | string     | default: nil                   |
| phone_number  | integer    | null: false                    |
| prefectures   | references | null: false, foreign_key: true |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |
| ------------- | ---------- | ------------------------------ |

## Association
- belongs_to :user
- belongs_to :product
- belongs_to :prefectures

## ActiveHashモデルの定義
- prefectures(都道府県) モジュールを取り込みます。