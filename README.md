# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false, unique: true |
| password | string | null: false |
| birthday | date | null: false |

### Association

- has_many :orders
- has_many :shipping_addresses
- has_many :items
- has_many :payment

##  shippingaddresses

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal_code        | text   | null: false |
| prefectures        | text   | null: false |
| municipalities     | text   | null: false |
| street address     | text   | null: false |
| building           | text   |             |
| telephone number   | text   | null: false |
| user               | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order


## items テーブル

| Column     | Type      |Options       |
| ------     | ------------------------------- |
| content    | text      | null: false |
| order      | references| null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |
| ---------- | ------ | ----------- |
### Association

- belongs_to :user
- has_one :order


## orders テーブル

| Column     | Type      |Options       |
| ------ | ------------------------------- |
| shipping_addresses  | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |
| ------------------ | ------ | ----------- |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :shipping_address
- has_one :payment


## payment テーブル

| Column     | Type      |Options       |
| ------ | ------------------------------- |
| card_number   | text | null: false |
| order         | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |
| ------------------ | ------ | ----------- |

### Association

- belongs_to :user
- belongs_to :order
