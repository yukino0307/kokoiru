# **kokoiru**
Google APIを利用した位置情報投稿サイトです。
身近で見つけた生き物を撮影して位置情報と写真をアップすることで、田舎の生き物を探しやすくしています。

# URL
https://kokoiru.herokuapp.com/

# 機能
- 画像・住所の投稿機能
- 投稿された情報からGoogleMap上にピン留めする機能
- 検索機能

# 制作背景(意図)
東京で教員から、都会の子供の生き物離れが進んでいることが問題視されていると聞いたことが発端で、交流の場を作りたいと思い制作しました。
地元では夏になると都会の家族連れが虫取りによく来ていたので、より探しやすく興味を持ってもらえるように位置情報も投稿できるようにしました。

それ以外にもペットの迷子情報をアップする掲示板にも応用できると思います。

# DEMO(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)
　⇒特に、デプロイがまだできていない場合はDEMOをつけることで見た目を企業側に伝えることができます。

# 工夫したポイント
- 位置情報をマップに表示

# 課題や今後実装したい機能
- ペットの迷子情報をアップする掲示板にも応用するため、掲示板機能とコメント機能を実装したい
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