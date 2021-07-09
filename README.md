# アプリケーション名
- CloudFinding 〜クラウドファインディング〜

# アプリケーション概要
- クラウドファンディングをやってみたい人けどやりきれない人たちを集めるアプリです。

# URL
- 準備中

# テスト用アカウント
- 準備中

# 利用方法
- 準備中

# 目指した課題解決
- クラウドファンディングをしたいが実行に至らない人たちを集め、一歩踏み出せるようなアプリを目指す

# 機能イメージ
- 準備中

# 実装予定の機能
## ユーザー管理機能
  - マイページ機能
## 投稿機能
  - 詳細機能
  - 編集機能
  - 削除機能
  - コメント機能
## いいね機能

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

# ローカルでの動作方法
