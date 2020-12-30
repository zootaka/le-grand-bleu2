# テーブル設計

## users テーブル

| Column             | Type   | Options        |
| ------------------ | ------ | -------------- |
| nickname           | string | null: false    |
| encrypted_password | string | null: false    |
| email              | string | null: false    |
| name               | string | null: false    |
| birth_date         | date   | null: false    |
| admin              | boolean| default: false |
### Association
has_many :log_books
has_many :comments

## log_books テーブル

| Column                    | Type     | Options     |
| ------------------------- | -------  | ----------- |
| place                     | string   | null: false |
| temperature               | string   |             |
| water_temperature         | string   |             |
| transparency              | string   |             |
| en_time                   | string   |             | 
| ex_time                   | string   |             |
| deep_avg                  | string   |             |
| deep_max                  | string   |             |
| date                      | date     |             |
| weight                    | string   |             |
| wear                      | text     |             |
| free_space                | text     |             |
| member                    | text     |             |
| user                      |references| null: false |
### Association

belongs_to :user

## map_place テーブル


|Column	     |Type   |Options     |
| -----------|------ |------------|
|place_name  |string |null: false |
|description |text   |null: false |
| latitude  |	float	     | null: false                    |
| longitude	| float	     | null: false                    |


### Association
has_many :comments


## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       |                                |
| user    | references | null: false, foreign_key: true |
| map_place    | references | null: false, foreign_key: true |

### Association

- belongs_to :map_place
- belongs_to  :user