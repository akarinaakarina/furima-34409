# テーブル設計

## users テーブル

| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| nickname             | string | null: false               |
| email                | string | null: false  unique: true |
| encrypted_password   | string | null: false               |
| last_name            | string | null: false               |
| first_name           | string | null: false               |
| last_kana            | string | null: false               |
| first_kana           | string | null: false               |
| birthday             | date   | null: false               |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| item_name          | string      | null: false                    |
| description        | text        | null: false                    |
| category           | string      | null: false                    |
| state_id           | integer     | null: false                    |
| delivery_style_id  | integer     | null: false                    |
| prefectures_id     | integer     | null: false                    |
| delivery_days_id   | integer     | null: false                    |
| price              | integer     | null: false                    |
| user               | references  | null: false  foreign_key: true |

### Association

- has_one :buy
- belongs_to :user

## buys テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false  foreign_key: true |
| item      | references | null: false  foreign_key: true |

### Association

- has_one :address
- belongs_to :user
- belongs_to :item

## address テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| postal_code     | string     | null: false                   |
| prefectures_id  | integer    | null: false                   |
| municipality    | string     | null: false                   |
| address         | string     | null: false                   |
| building_name   | string     |                               |
| phone_number    | string     | null: false                   |
| buy             | references | null: false  foreign_key: true|

### Association

- belongs_to :buy