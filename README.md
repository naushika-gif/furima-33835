# テーブル設計

## users テーブル

|Column              | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name_jap     | string | null: false               |
| family_name_jap    | string | null: false               |
| first_name_kana    | string | null: false               |
| family_name_kana   | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :products
- has_many :purchases

## products テーブル

|Column             | Type       | Options                        |
| ----------------- | ---------- | -------------------------------|
| name              | string     | null: false                    |
| explanation       | text       | null: false                    |
| category_id       | integer    | null: false, foreign_key: true |
| condition_id      | integer    | null: false, foreign_key: true |
| delivery_cost_id  | integer    | null: false, foreign_key: true |
| deliver_from_id   | integer    | null: false, foreign_key: true |
| delivery_date_id  | integer    | null: false, foreign_key: true |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase

## purchases テーブル

|Column             | Type       | Options                        |
| ----------------- | ---------- | -------------------------------|
| user              | references | null: false, foreign_key: true |
| product           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one    :buyer

## buyers テーブル

|Column             | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| telephone_no      | string     | null: false                    |
| purchase          | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase


