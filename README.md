
## Users テーブル

| column              | Type      | Options                 |
| -----------------   | --------- | ----------------------- |
| nickname            | string    |null: false              |
| email               | string    |null: false,unique: true |
| encrypted_password  | string    |null: false              |
| name                | string    |null: false              |
| name_kana           | string    |null: false              |
| birth_date          | date      |null: false              |

- has_many :items
- has_many :comments
- has_one :order

## Items　テーブル
| column              | Type      | Options                       |
|   ----------------- | --------- | ----------------------------- |
| item_name           | string    | null: false                   |
| item_description    | text      | null: false                   |
| category            | string    | null: false                   |
| ken_name            | string    | null: false                   |
| quality             | string    | null: false                   |
| shipping_date       | string    | null: false                   |
| price               | integer   | null: false                   |
| user                | references| null: false,foreign_key: true |

- belongs_to :user
- has_many :comments
- has_one :order

## Comments テーブル
| column            | Type      | Options                      |
| ----------------- | --------- | ---------------------------- |
| content           | text      | null: false                  |
| items             | references| null: false,foreign_key: true|
| user              | references| null: false,foreign_key: true|

- belongs_to :user
- belongs_to :item

## Orders テーブル
| column              | Type      | Options                      |
| ------------------- | --------- | ---------------------------- |
| zip                 | integer   | null: false                  |
| ken_name            | string    | null: false                  |
| city_name           | string    | null: false                  |
| block_name          | string    | null: false                  |
| build_name          | string    |                              |
| user                | references| null: false,foreign_key: true|
| item                | references| null: false,foreign_key: true|

- has_one :user
- has_one :item
