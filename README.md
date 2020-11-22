## usersテーブル

| Column          | Type  | Options     |
|-----------------|-------|-------------|
| nickname        | string| null: false |
| email           | string| null: false |
| password        | string| null: false |

### Association
- has many posts
- has many comments
- has many likes
- has_many :favorites



## postsテーブル
| Column           | Type   | Options                       |
|------------------|--------|-------------------------------|
| user_id          | integer| null: false, foreign_key: true|
| movie            | string |  null: false                  |
| content          | string |  null: false                  |
| title            | string |  null: false                  |
| category_id      | integer| null: false, foreign_key: true|

### Association
- belongs to user
- has many comments
- has_many :likes
- belongs_to_active_hash :category
- has_many :favorites


## commentsテーブル
| Column        | Type   | Options                       |
|---------------|--------| ------------------------------|
| user_id       | integer| null: false, foreign_key: true|
| post_id       | integer| null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :post


## likeテーブル
| Column        | Type   | Options                       |
|---------------|--------| ------------------------------|
| user_id       | integer| null: false, foreign_key: true|
| post_id       | integer| null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :post

## favoritesテーブル
| Column        | Type   | Options                       |
|---------------|--------| ------------------------------|
| user_id       | integer| null: false, foreign_key: true|
| post_id       | integer| null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :post


## categoriesテーブル
| Column        | Type   | Options                      |
|---------------|--------| -----------------------------|
|  name         |string  |  null: false                 |

### Association
- has_many :posts

