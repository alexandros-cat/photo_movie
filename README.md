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
- has many sns_credentials
- has_many :favorites
- has_many :fav_posts, through: :favorites, source: :post


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
- has_many :bookmarks
- belongs_to :category
- has_many :post_tag_relations
- has_many :tags, through: :post_tag_relations
- has_many :favorites
- has_many :users, through: :favorites

## commentsテーブル
| Column        | Type   | Options                       |
|---------------|--------| ------------------------------|
| user_id       | integer| null: false, foreign_key: true|
| post_id       | integer| null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :post

## sns_credentialsテーブル
| Column        | Type   | Options                       |
|---------------|--------| ------------------------------|
| provider      |string  |  null: false                  |
| uid           |string  |  null: false                  |
| user_id       |integer | null: false, foreign_key: true|
### Association
- belongs_to :user


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

## tagsテーブル
| Column        | Type   | Options                      |
|---------------|--------| -----------------------------|
| name          | string | null:false, uniqueness: true |

### Association
-  has_many :post_tag_relations
-  has_many :posts, through: :post_tag_relations

## post_tag_relationsテーブル
| Column        | Type   | Options                      |
|---------------|--------| -----------------------------|
| tag_id        | integer| foreign_key: true            |
| post_id       | integer| foreign_key: true            |

### Association
- belongs_to :post 
- belongs_to :tag