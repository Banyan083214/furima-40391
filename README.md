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

##  shippingaddresses

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal_code        | string   | null: false |
| area_id            | integer   | null: false    |
| city               | string   | null: false |
| street_address     | string   | null: false |
| building           | string   |             |
| telephone_number   | string   | null: false |
| user               | references | null: false, foreign_key: true |


### Association

- has_one :order


## items テーブル

| Column     | Type      |Options       |
| ------     | ------------------------------- |
| item_name    | string      | null: false |
| category_id    | string       | null: false |
| area_id    | string       | null: false |
| condition    | string       | null: false |
| price    | integer     | null: false |
| load    | string       | null: false |
| deadline    | text      | null: false |
| user       | references | null: false, foreign_key: true |

| ---------- | ------ | ----------- |



### Association

- belongs_to :user
- has_one :order


## orders テーブル

| Column     | Type      |Options       |
| ------ | ------------------------------- |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |
| ------------------ | ------ | ----------- |

### Association

- belongs_to :user
- belongs_to :item

- belongs_to :shippingaddresses
