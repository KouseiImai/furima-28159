# README
<!-- 
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->

# テーブル設計

## users テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| nickname     | string  | null: false |
| email        | string  | null: false |
| password     | string  | null: false |
| family_name  | string  | null: false |
| name         | string  | null: false |
| kana         | string  | null: false |
| birthday_id  | integer | null: false |

### Association
- has_many :products
- has_many :purchases


## products テーブル

| Column              | Type    | Options                        |
| ------------------- | ------- | ------------------------------ |
| user_id             | integer | null: false, foreign_key: true |
| products_image      | string  | null: false                    |
| products_name       | string  | null: false                    |
| explanation         | string  | null: false                    |
| comment             | text    | null: false                    |
| category_id         | integer | null: false                    |
| condition_id        | integer | null: false                    |
| shipping_charge_id  | integer | null: false                    |
| shipping_area_id    | integer | null: false                    |
| shipping_day_id     | integer | null: false                    |
| price               | integer | null: false                    |

### Association
- belongs_to :users
- has_one :purchases

## purchases テーブル
| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| price       | integer | null: false                    |
| buyer_id    | integer | null: false, foreign_key: true |

### Association
- belongs_to :products
- has_one :buyers


## buyers テーブル
| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| purchase_id       | integer | null: false |
| postal_code       | integer | null: false |
| prefecture_id     | integer | null: false |
| municipal         | string  | null: false |
| address           | string  | null: false |
| building_name     | string  | null: false |
| phone_number      | integer | null: false |

### Association
- belongs_to :purchases

<!-- ## comments テーブル
| Column      | Type     | Options     |
| ----------- | -------- | ----------- |
| text        | string   | null: false |
| user_id     | integer  | null: false |
| product_id  | integer  | null: false |

### Association -->

# ER図
![furima-28159 ER図](https://user-images.githubusercontent.com/69197315/93693887-9c7ae580-fb40-11ea-8839-77fb1cc269a8.png)

# 画面遷移図
![furima-28159 画面遷移図](https://user-images.githubusercontent.com/69197315/93693890-a43a8a00-fb40-11ea-8a75-7f2b942d4521.png)





