# **kokoiru**
Google APIを利用した位置情報投稿サイトです。
身近で見つけた生き物を撮影して位置情報と写真をアップすることで、田舎の生き物を探しやすくしています。

# URL
https://kokoiru.herokuapp.com/

# テストアカウント
テストユーザーとして以下を設定しています。
- ニックネーム:   テストユーザー
- メールアドレス:  a@example.com
- パスワード:     1234qwer

# 機能
- 画像・住所の投稿機能
- タイトルと説明の投稿機能
- 投稿された情報を元にGoogleMap上にピン留めする機能

# 制作背景(意図)
都会の子供の生き物離れが進んでいることが問題視されていると聞いたことが発端で、交流の場を作りたいと思い制作しました。
地元では夏になると都会の家族連れが虫取りによく来ていたので、より探しやすく興味を持ってもらえるように位置情報も投稿できるようにしました。

それ以外にもペットの迷子情報をアップする掲示板にも応用できると思います。

# DEMO
新規登録 → 投稿 → 完了ページ(=マイページ) → 詳細ページ　の順で遷移しています。
https://i.gyazo.com/1f8aeb5a6b23d405857400d295592c3c.gif

# 工夫したポイント
- 位置情報をマップに表示すること

# 課題や今後実装したい機能
- 検索機能の実装（現在開発中）
- ペットの迷子情報などもアップする掲示板にも応用するため、掲示板機能とコメント機能を実装したい
- 投稿意欲をアップさせるために、いいね👍機能の実装
- 投稿数といいね数によってユーザーをランキング化


# 開発環境
- Ruby 2.5.1
- Rails 5.2.3
- heroku
- AWS S3

# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :posts

## spotsテーブル
|Column|Type|Options|
|------|----|-------|
|address|string|null: false|
|latitude|float|null: false|
|longitude|float|null: false|
|post|references|null: false, foreign_key: true|

### Association
- belongs_to :post

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false, index: true|
|explanation|text|null: false, index: true|
|rating|float|null: false|
|user|references|null: false, foreign_key: true|

### Association
- has_one :spot
- belongs_to :user

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|post|references|null: false, foreign_key: true|

### Association
- belongs_to :post