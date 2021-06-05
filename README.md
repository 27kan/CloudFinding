# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| password           | string  | null: false               |
| nickname           | string  | null: false               |

### Association

- has_many :articles
- has_many :comments

## articles テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| content         | text       | null: false                    |
| category_id     | integer    | null: false                    |
| good            | integer    | null: false                    |
| favorite        | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| text            | text       | null: false                    |
| user            | references | null: false, foreign_key: true |
| article         | references | null: false, foreign_key: true |

### Association

- belongs_to :article
- belongs_to :user
