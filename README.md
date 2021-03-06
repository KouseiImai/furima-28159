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

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| family_name        | string  | null: false |
| first_name         | string  | null: false |
| family_name_kana   | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | date    | null: false |

### Association
- has_many :products
- has_many :purchases


## products テーブル

| Column              | Type    | Options                        |
| ------------------- | ------- | ------------------------------ |
| user_id             | integer | null: false, foreign_key: true |
| name                | string  | null: false                    |
| explanation         | text    | null: false                    |
| category_id         | integer | null: false                    |
| condition_id        | integer | null: false                    |
| shipping_charge_id  | integer | null: false                    |
| shipping_area_id    | integer | null: false                    |
| shipping_day_id     | integer | null: false                    |
| price               | integer | null: false                    |

### Association
- belongs_to :user
- has_one :purchase

## purchases テーブル
| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| product_id  | integer | null: false, foreign_key: true |
| user_id     | integer | null: false, foreign_key: true |

### Association
- belongs_to :product
- belongs_to :user
- has_one :buyer


## buyers テーブル
| Column            | Type    | Options                        |
| ----------------- | ------- | ------------------------------ |
| purchase_id       | integer | null: false, foreign_key: true |
| postal_code       | string  | null: false                    |
| prefecture_id     | integer | null: false                    |
| municipal         | string  | null: false                    |
| address           | string  | null: false                    |
| building_name     | string  |                                |
| phone_number      | string  | null: false                    |

### Association
- belongs_to :purchase

<!-- ## comments テーブル
| Column      | Type     | Options     |
| ----------- | -------- | ----------- |
| text        | string   | null: false |
| user_id     | integer  | null: false |
| product_id  | integer  | null: false |

### Association -->

# ER図
![furima-28159 ER図](https://user-images.githubusercontent.com/69197315/93750004-d0840280-fc35-11ea-9fa5-ec44b5fca64b.png)

https://gyazo.com/fad400f84a2bf4737786ccc2d56e626c

# 画面遷移図
![furima-28159 画面遷移図](https://user-images.githubusercontent.com/69197315/93693890-a43a8a00-fb40-11ea-8a75-7f2b942d4521.png)

https://gyazo.com/ec23cfd4661f7b77dc7bd7f66ccc7e73



