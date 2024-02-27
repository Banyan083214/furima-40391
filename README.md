# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false, unique: true |
| password | string | null: false |
| birthday | text | null: false |

### Association

- has_many :orders
- has_many :shippingaddresses
- has_many :items


##  shippingaddresses

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal_code        | text   | null: false |
| prefectures        | text   | null: false |
| municipalities     | text   | null: false |
| street address     | text   | null: false |
| building           | text   | null: false |
| telephone number   | text   | null: false |
| user               | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :orders


## items テーブル

| Column     | Type      |Options       |
| ------ | ------------------------------- |
| content   | text | null: false |
| prototype   | references | null: false, foreign_key: true |
| user  | references | null: false, foreign_key: true |
| ------------------ | ------ | ----------- |
### Association

- belongs_to :user
- has_one :orders


## orders テーブル

| Column     | Type      |Options       |
| ------ | ------------------------------- |
| shippingaddresses  | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |
| ------------------ | ------ | ----------- |

### Association

- belongs_to :user
- belongs_to :items
- belongs_to :shippingaddresses
