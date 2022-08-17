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

|Column                     | Type   |Options      |
|-------------------------- | ------ | ----------- |
|nickname                   | string | null: false |
|mail                       | string | null: false |
|encrypted_password         | string | null: false |
|family_name                | string | null: false |
|family_name_kana           | string | null: false |
|date_of_birth              | text   | null: false |

### Association

- has_many :item
- has_many :Purchase_records
## itemsテーブル

|Column                  | Type         |Options                         |
|------------------------| -------------|--------------------------------|
|item_name               | string       | null: false                    |
|item_description        | text         | null: false                    |
|category_id             | string       | null: false                    |
|item_status_id          | string       | null: false                    |
|shipping_fee_id         | string       | null: false                    |
|prefectures_id          | string       | null: false                    |
|shipping_time_number_id | string       | null: false                    |
|prices                  | string       | null: false                    |
|user                    | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_records

## Purchase_recordsテーブル

|Column        |Type          | Options                        |
|--------------| -------------| ------------------------------ |
|user          | references   | null: false, foreign_key: true |
|item          | references   | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address_information

## Shipping_address_informationテーブル

|Column               |Type          |Options                         |
|---------------------| -------------| ------------------------------ |
|postal_code          | string       | null: false                    |
|prefectures          | string       | null: false                    |
|citie                | string       | null: false                    |
|street_address       | string       | null: false                    |
|name_of_the_building | string       |                                |
|telephone_number     | string       | null: false                    |
|purchase_records     | references   | null: false, foreign_key: true |

### Association

belongs_to :Purchase_records