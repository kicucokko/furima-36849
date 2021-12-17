
## Users テーブル

| column              | Type      | Options                 |
| -----------------   | --------- | ----------------------- |
| nickname            | string    |null: false              |
| email               | string    |null: false,unique: true |
| encrypted_password  | string    |null: false              |
| last_name           | string    |null: false              |
| first_name          | string    |null: false              |
| last_kana           | string    |null: false              |
| first_kana          | string    |null: false              |
| birth_date          | date      |null: false              |

- has_many :items
- has_many :comments
- has_many :order
- has_one :item_order

## Items　テーブル
| column              | Type      | Options                       |
|   ----------------- | --------- | ----------------------------- |
| item_name           | string    | null: false                   |
| item_description    | text      | null: false                   |
| category_id         | integer   | null: false                   |
| quality_id          | integer   | null: false                   |
| fee_id              | integer   | null: false                   |
| ken_id              | integer   | null: false                   |
| before_shipping_id  | integer   | null: false                   |
| price               | integer   | null: false                   |
| user                | references| null: false,foreign_key: true |

- belongs_to :user
- has_many :comments
- has_one :order
- has_one :item_order
- belongs_to_active_hash :category
- belongs_to_active_hash :quality
- belongs_to_active_hash :fee
- belongs_to_active_hash :ken
- belongs_to_active_hash :before_shipping

## Comments テーブル
| column            | Type      | Options                      |
| ----------------- | --------- | ---------------------------- |
| content           | text      | null: false                  |
| items             | references| null: false,foreign_key: true|
| user              | references| null: false,foreign_key: true|

- belongs_to :user
- belongs_to :item

## item_orders テーブル
| column            | Type      | Options                      |
| ----------------- | --------- | ---------------------------- |
| user              | integer   | null: false,foreign_key: true|
| item              | integer   | null: false,foreign_key: true|
| order             | integer   | null: false,foreign_key: true|

- belongs_to :user
- belongs_to :item
- belongs_to :order

## Orders テーブル
| column              | Type      | Options                      |
| ------------------- | --------- | ---------------------------- |
| zip                 | integer   | null: false                  |
| ken_id              | integer   | null: false                  |
| city                | string    | null: false                  |
| block               | string    | null: false                  |
| build               | string    |                              |
| phone               | integer   | null: false                  |
| user                | references| null: false,foreign_key: true|
| item                | references| null: false,foreign_key: true|

- belongs_to :user
- belongs_to :item
- has_one :item_order
- belongs_to_active_hash :ken
