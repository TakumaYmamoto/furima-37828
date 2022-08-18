# README

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

* ...

## usersテーブル

|Column                     | Type       |Options                  |
|-------------------------- | ---------- | ----------------------- |
|nickname                   | string     | null: false             |
|email                      | string     | null: false unique:true |
|encrypted_password         | string     | null: false             |
|last_name                  | string     | null: false             |
|first_name                 | string     | null: false             |
|last_name_kana             | string     | null: false             |
|first_name_kana            | string     | null: false             |
|date                       | date   | null: false             |

### Association

- has_many :items
- has_many :purchase_records
## itemsテーブル

|Column                  | Type         |Options                         |
|------------------------| -------------|--------------------------------|
|item_name               | string       | null: false                    |
|item_description        | text         | null: false                    |
|category_id             | integer      | null: false                    |
|item_status_id          | integer      | null: false                    |
|shipping_fee_id         | integer      | null: false                    |
|prefecture_id           | integer      | null: false                    |
|shipping_time_number_id | integer      | null: false                    |
|price                  | integer       | null: false                    |
|user                    | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record

## Purchase_recordsテーブル

|Column        |Type          | Options                        |
|--------------| -------------| ------------------------------ |
|user          | references   | null: false, foreign_key: true |
|item          | references   | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

|Column               |Type          |Options                         |
|---------------------| -------------| ------------------------------ |
|postal_code          | string       | null: false                    |
|prefecture_id       | integer      | null: false                    |
|city                 | string       | null: false                    |
|street_address       | string       | null: false                    |
|name_of_the_building | string       |                                |
|telephone_number     | string       | null: false                    |
|purchase_record     | references   | null: false, foreign_key: true |

### Association

belongs_to :purchase_record