
## Users (ユーザー管理)テーブル

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
- has_many :purchases

## Items (商品情報)テーブル
| column              | Type      | Options                       |
|   ----------------- | --------- | ----------------------------- |
| item_name           | string    | null: false                   |
| item_description    | text      | null: false                   |
| category_id         | integer   | null: false                   |
| quality_id          | integer   | null: false                   |
| fee_id              | integer   | null: false                   |
| prefecture_id       | integer   | null: false                   |
| before_shipping_id  | integer   | null: false                   |
| price               | integer   | null: false                   |
| user                | references| null: false,foreign_key: true |

- belongs_to :user
- has_many :comments
- has_one :purchase

*Action Hash*
- belongs_to_active_hash :category
- belongs_to_active_hash :quality
- belongs_to_active_hash :fee
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :before_shipping

## Comments (コメント)テーブル
| column            | Type      | Options                      |
| ----------------- | --------- | ---------------------------- |
| content           | text      | null: false                  |
| item              | references| null: false,foreign_key: true|
| user              | references| null: false,foreign_key: true|

- belongs_to :user
- belongs_to :item

## Purchases (購入情報管理)テーブル
| column            | Type      | Options                      |
| ----------------- | --------- | ---------------------------- |
| user              | references| null: false,foreign_key: true|
| item              | references| null: false,foreign_key: true|

- belongs_to :user
- belongs_to :item
- has_one :receiver


## Receivers (配送先)テーブル
| column              | Type      | Options                      |
| ------------------- | --------- | ---------------------------- |
| zip                 | string    | null: false                  |
| prefecture_id       | integer   | null: false                  |
| city                | string    | null: false                  |
| block               | string    | null: false                  |
| build               | string    |                              |
| phone               | string    | null: false                  |
| purchase            | references| null: false,foreign_key: true|

- belongs_to :purchase


*Action Hash*
- belongs_to_active_hash :prefecture
