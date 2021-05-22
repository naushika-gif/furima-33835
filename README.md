# テーブル設計

## users テーブル

|Column             | Type   | Options                   |
| ----------------- | ------ | ------------------------- |
| nickname          | string | null: false               |
| email             | string | null: false, unique: true |
| password          | string | null: false               |
| first_name_jap    | string | null: false               |
| family_name_jap   | string | null: false               |
| first_name_kana   | string | null: false               |
| family_name_kana  | string | null: false               |
| birthday          | integer| null: false               |

### Association

- has_many :products
- has_many :purchases

## products テーブル

|Column             | Type       | Options                        |
| ----------------- | ---------- | -------------------------------|
| image             |            | null: false                    |
| name              | text       | null: false                    |
| explanation       | text       | null: false                    |
| category          | string     | null: false                    |
| condition         | string     | null: false                    |
| price             | integer    | null: false                    |
| delivery_cost     | string     | null: false                    |
| deliver_from      | string     | null: false                    |
| delivery_date     | integer    | null: false                    |
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
| telephone_no      | integer    | null: false                    |
| purchase          | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase


