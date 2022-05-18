## usersテーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| nickname           | string | null: false                |
| email              | string | null: false , unique: true |
| password           | string | null: false                |
| first_name         | string | null: false                |
| family_name        | string | null: false                |
| first_name_kana    | string | null: false                |
| family_name_kana   | string | null: false                |
| birthday           | string | null: false                |

### Association
- belongs_to :purchase_informaitons
- has_many   :item_informationｓ

## item_informationｓテーブル

| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| image              | reference | null: false |
| name               | string    | null: false |
| description        | string    | null: false |
| category           | string    | null: false |
| item_status        | string    | null: false |
| cost               | string    | null: false |
| prefecture         | string    | null: false |
| send_days          | string    | null: false |
| price              | string    | null: false |

### Association
- belongs_to :users
- belongs_to :purchase_informaitons

## purchase_informaitonsテーブル

| Column              | Type      | Options                         |
| --------------------| --------- | ------------------------------- |
| user_id             | reference | null: false , foreign_key: true |
| item_id             | reference | null: false , foreign_key: true |
| shipping_address_id | reference | null: false , foreign_key: true |

### Association
- belongs_to :users
- belongs_to :item_informations
- belongs_to :shipping_addresses

## shipping_addressesテーブル

| Column              | Type      | Options     |
| ------------------- | --------- | ----------- |
| postal_code         | string    | null: false |
| shipping_prefecture | string    | null: false |
| city                | string    | null: false |
| shipping_address    | string    | null: false |
| building            | string    | null: false |
| phone_number        | string    | null: false |

### Association
- belongs_to :purchase_informaitons