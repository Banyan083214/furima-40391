# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname               | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| birthday | date | null: false |
| first_name_kanji | string | null: false |
| last_name_kanji | string | null: false |
| first_name_katakana | string | null: false |
| first_name_katakana | string | null: false |




### Association

- has_many :orders
- has_many :items

##  shipping_addresses

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal_code        | string   | null: false |
| area_id            | integer   | null: false    |
| city               | string   | null: false |
| street_address     | string   | null: false |
| building           | string   |             |
| telephone_number   | string   | null: false |
| order              | references   | null: false, foreign_key: true |

### Association

- belongs_to :order


## items テーブル

| Column        | Type         |Options       |
| ------        | ------------------------------- |
| item_name     | string       | null: false |
| category_id   | integer       | null: false |
| area_id       | integer      | null: false |
| condition_id  | integer       | null: false |
| price         | integer      | null: false |
| load_id       | integer       | null: false |
| deadline_id   | integer         | null: false |
| explanation   | text        | null: false |
| user          | references   | null: false, foreign_key: true |



### Association

- belongs_to :user
- has_one :order


## orders テーブル

| Column     | Type      |Options       |
| ------ | ------------------------------- |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_addresses
