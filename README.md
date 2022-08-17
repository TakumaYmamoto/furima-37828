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

|Column           | Type   |Options      |
|-----------------| ------ | ----------- |
|nickname         | string | null: false |
|mail             | string | null: false |
|password         | string | null: false |
|Family_name      | string | null: false |
|Family_name_kana | string | null: false |
|Date_of_birth    | text   | null: false |

### Association

- belongs_to :item
- belongs_to :Purchase_records
## itemsテーブル

|Column               | Type         |Options                         |
|---------------------| -------------|--------------------------------|
|image                | string       |                                |
|item_name            | text         | null: false                    |
|item_Description     | text         | null: false                    |
|category             | string       | null: false                    |
|item_status          | string       | null: false                    |
|shipping_fee         | string       | null: false                    |
|region               | string       | null: false                    |
|shipping_time_number | string       | null: false                    |
|price                | string       | null: false                    |
|user_id              | references   | null: false, foreign_key: true |

### Association

- has_many :user
- has_one :Purchase_records

## Purchase_recordsテーブル

|Column        |Type          | Options                        |
|--------------| -------------| ------------------------------ |
|user_id       | references   | null: false, foreign_key: true |
|item_id       | references   | null: false, foreign_key: true |

### Association
- has_many :user
- belongs_to :item
- belongs_to :Shipping_address_information

## Shipping_address_informationテーブル

|Column               |Type          |Options                         |
|---------------------| -------------| ------------------------------ |
|postal_code          | string       | null: false                    |
|prefectures          | string       | null: false                    |
|cities               | string       | null: false                    |
|street_address       | string       | null: false                    |
|name_of_the_building | string       |                                |
|telephone_number     | string       | null: false                    |
|Purchase_records_id  | references   | null: false, foreign_key: true |

### Association

has_many :Purchase_records