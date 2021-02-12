# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| last_name  | string | null: false |
| first_name | string | null: false |
| last_kana  | string | null: false |
| first_kana | string | null: false |
| birthday   | date   | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| item_name       | string     | null: false |
| description     | text       | null: false |
| category        | string     | null: false |
| state           | string     | null: false |
| delivery_style  | string     | null: false |
| delivery_source | string     | null: false |
| delivery_days   | string     | null: false |
| price           | integer    | null: false |
| user            | references | null: false |

### Association

- has_one :buys
- belongs_to :users

## buys テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| user      | references | null: false |
| item      | references | null: false |

### Association

- has_one :address
- belongs_to :users
- belongs_to :items

## address テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| postal_code  | string     | null: false |
| prefectures  | string     | null: false |
| municipality | string     | null: false |
| address      | string     | null: false |
| phone_number | string     | null: false |
| buy          | references | null: false |

### Association

- belongs_to :buys