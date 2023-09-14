# テーブル設計

## users テーブル

| Column         | Type     | Options                       |
| -------------- | ------   | ------------------------------|
| result_id      | integer  | null: false, unique: true     |
| email          | string   | null: false, unique: true     |
| comment        | string   | null: false                   |
| yoyaku         | string   | null: false                   |

### Association
- has_many :yoyakus



## hosts テーブル

| Column             | Type       | Options             |
| -------- ----------| ---------- | --------------------|
| start_time         | string     | null: false         |
| discus_type_id     | text       | null: false         |

### Association

- has_one :user 






## users_data テーブル

| Column             | Type       | Options                        |
| -------------------| -----------| -------------------------------|
| family_name        | string     | null: false                    |
| first_name         | string     | null: false                    |
| family_name_kana   | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| birthday           | date       | null: false                    |
| postal             | string     | null: false                    |
| area_id            | integer    | null: false                    |
| city               | string     | null: false                    |
| street_name        | string     | null: false                    |
| building_name      | string     |                                |
| phone              | string     | null: false                    |
| order_id           | references | null: false, foreign_key: true |





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
