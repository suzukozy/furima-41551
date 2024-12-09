# README

## users Table

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| last_name          | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name         | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :orders
- has_many :items

## items Table

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| product                   | string     | null: false                    |
| price                     | integer    | null: false                    |
| explain                   | text       | null: false                    |
| category_id               | integer    | null: false                    |
| condition_id              | integer    | null: false                    |
| shipping_fee_id           | integer    | null: false                    |
| prefecture_id             | integer    | null: false                    |
| required_number_of_day_id | integer    | null: false                    |
| user                      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders Table

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses Table

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| municipality  | string     | null: false                    |
| house_number  | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order

### Association
- belongs_to :order