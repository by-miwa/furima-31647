# テーブル設計

## users テーブル

| Column                    | Type   | Options     |
| ------------------------- | ------ | ----------- |
| nickname                  | string | null: false |
| email                     | string | null: false |
| encrypted_password        | string | null: false |
| last_name                 | string | null: false |
| first_name                | string | null: false |
| last_name_kana            | string | null: false |
| first_name_kana           | string | null: false |
| birthday                  | string | null: false |


### Association

- has_many :items
- has_many :records                                  

## items テーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| title           | string      | null: false                    |
| text            | text        | null: false                    |
| category_id     | integer     | null: false                    |
| status_id       | integer     | null: false                    |
| delivery_fee_id | integer     | null: false                    |
| area_id         | integer     | null: false                    |
| days_id         | integer     | null: false                    |
| price           | string      | null: false                    |
| sales_fee       | string      | null: false                    |
| sales_profit    | string      | null: false                    |
| user            | references  | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :record

## records テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| product  | references | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :street


## streets テーブル

| Column          | Type       | Options                        |
| ------------    | ---------- | ------------------------------ |
| postal          | string     | null: false                    |
| prefecture_id   | integer    | null: false                   |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| apartment       | string     |                                |
| phone_number    | string     | null: false                    |
| record          | references | null: false, foreign_key: true |

### Association

- belongs_to :record