## usersテーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| nickname           | string | null: false                |
| email              | string | null: false , unique: true |
| encrypted_password | string | null: false                |
| first_name         | string | null: false                |
| family_name        | string | null: false                |
| first_name_kana    | string | null: false                |
| family_name_kana   | string | null: false                |
| birthday           | date   | null: false                |

### Association
- belongs_to :purchase
- has_many   :items

## itemsテーブル

| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| name               | string    | null: false |
| description        | string    | null: false |
| category_id        | integer   | null: false |
| item_status_id     | integer   | null: false |
| cost_id            | integer   | null: false |
| prefecture_id      | integer   | null: false |
| send_days_id       | integer   | null: false |
| price              | integer   | null: false |

### Association
- belongs_to :user
- belongs_to :purchase

## purchasesテーブル

| Column              | Type      | Options                         |
| --------------------| --------- | ------------------------------- |
| user                | reference | null: false , foreign_key: true |
| item                | reference | null: false , foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items
- belongs_to :shipping_addresses

## shipping_addressesテーブル

| Column              | Type      | Options                         |
| ------------------- | --------- | ------------------------------- |
| postal_code         | string    | null: false                     |
| prefecture_id       | integer   | null: false                     |
| city                | string    | null: false                     |
| shipping_address    | string    | null: false                     |
| building            | string    |                                 |
| phone_number        | string    | null: false                     |
| purchase            | reference | null: false , foreign_key: true |

### Association
- belongs_to :purchase