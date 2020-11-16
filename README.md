# README

# アプリケーション概要

・日々の積み上げ（勉強・筋トレ・食事制限など）を投稿し、それに対し「keep it up!」（その調子でがんばれ！）ボタンを押し合うことで、頑張りを継続させるためのアプリです。<br>
・トレーニング中や料理などの写真も投稿でき、頑張りを自慢することができます。<br>
・投稿に対してコメントを行うことで、成果が出ている人に質問したりアドバイスをもらったりすることができます。

# 機能と使用技術一覧

・ユーザー管理機能（devise）<br>
・ツイート・画像投稿機能（mini_magick, image_processing, aws-sdk-s3）<br>
・詳細ページ表示機能<br>
・投稿削除・編集機能<br>
・ツイートへのコメント機能<br>
・いいね機能（jquery-rails）<br>
・タグ付け機能<br>
・タグ入力時のインクリメンタルサーチ機能（JavaScript）<br>
・画像プレビュー機能（JavaScript）<br>
・SNSアカウントでの登録機能（omniauth-facebook, omniauth-google-oauth2, omniauth-rails_csrf_protection）<br>
・タグでの検索機能<br>
・モデルの単体テスト（rspec-rails, factory_bot_rails, faker）<br>
・インフラ（AWS, unicorn）<br>
・自動デプロイ（capistrano）<br>
・コード整形（rubocop）<br>
・デバッガー（pry-rails）<br>
・エラーコード日本語化（rails-i18n）

# 作成しようと思ったきっかけ

![スクリーンショット 2020-11-17 0](https://user-images.githubusercontent.com/70367011/99273647-a719d880-286c-11eb-95b1-72e968215dd5.png)
Twitterで画像のようなコメントをもらうことがあり、プログラミング学習の活力となったことがありました。そこで、自分がエネルギーをもらったように、いろんな人のやる気アップにつなげたいと考え、何かに取り組んでいる人専用の積み上げ投稿アプリを作りました。

# URL

http://keep-it-app.work/<br>
※テストユーザーのEメールとパスワードは、ログイン画面に記載しています。

# テストユーザー

#### ユーザー1
Eメール：user1@test.com<br>パスワード：user0001<br>

#### ユーザー2
Eメール：user2@test.com<br>パスワード：user0002

# 利用方法

①新規ユーザー登録をします。<br>
②トップページの投稿するボタンを押し、新規投稿ページへ移動します。<br>
③テキスト入力と画像の添付を行い、投稿ボタンを押して積み上げを投稿します。<br>
④自分の投稿は、編集ボタンで編集、削除ボタンで削除できます。<br>
⑤投稿をクリックすると、投稿詳細ページに移動します。<br>
⑥詳細ページでは、投稿に対してコメントします。<br>
⑦投稿には、一覧ページと詳細ページで「keep it up!」（その調子でがんばれ！）ボタンを押すことができます。

<!-- # 目指した課題解決

| ターゲットユーザー                           | 解決したい課題                                                             | このアプリを使うことで得られる経験                                                                                                                                                                                           | 
| -------------------------------------------- | -------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | 
| 勉強・筋トレ・食事制限など、自分を変えたい人 | ・自分だけだとなかなか継続できない<br>・継続はできているが行き詰まっている | ・頑張っている人の投稿を見て、自分を奮い立たせることができる<br>・成果が出ている人に対して、継続するコツを質問することができる<br>・目標を宣言したり活動を報告し合ったり、ユーザー同士でコミュニケーションをとることができる |  -->

# 洗い出した要件

| 機能                              | 目的                                                   | 詳細                                                                                         | ストーリー<br>（ユースケース）                                                                                                                         | 
| --------------------------------- | ------------------------------------------------------ | -------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- | 
| ユーザー管理                      | どのユーザーの投稿か識別するため                       | ユーザー情報（ニックネーム、メールアドレス、パスワード）を登録できるようにする               | ・必要情報を入力すれば、ユーザー登録することができる<br>・同じメールアドレスが存在する場合は、登録できない                                         | 
| ツイート投稿                      | ユーザーが日々の積み上げを披露できるようにするため     | ・ツイート（タグ付け）と画像を投稿できるようにする<br>・編集や削除の機能もつける             | ・ログインしたユーザーはツイートを投稿することができる<br>・画像の添付やタグ付けも可能<br>・編集時は、ツイートテキストと画像が入力された状態である | 
| コメント投稿                      | ユーザー同士でコミュニケーションを取れるようにするため | 投稿に対してコメントできるようにする                                                         | ・全てのツイートにコメントを投稿することができる<br>・何度でもコメントすることができる                                                             | 
| タグ付け                          | どのような内容のツイートかわかりやすくするため         | ・ツイートにタグ付けできるようにする<br>・指定したタグがついたツイートを検索できるようにする | ・ツイート投稿時、タグをつけることができる<br>・入力中タグの候補が表示される<br>タグでツイートを検索できる                                         | 
| keep it up!ボタン（いいねボタン） | 積み上げを応援して、継続できるようにするため           | ツイートに対して応援の意味を込めてkeep it up!ボタンを押せるようにする                        | ユーザーは、他のユーザーの投稿に対して、1回だけkeep it up!ボタンを押すことができる                                                                 | 
| SNS認証                           | ユーザー登録のハードルを下げるため                     | SNSアカウント（Facebook, Google）を使用したユーザー登録ができるようにする                    | ・ユーザー登録時、ユーザー情報の入力を手打ち入力、SNS認証から選べる<br>・SNS認証では、情報は自動で入力される                                       | 

# データベース設計

## ER図

![ER図ver 3](https://user-images.githubusercontent.com/70367011/97139190-49c6c600-179d-11eb-86fb-efa4e43e1e56.png)

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :tweets
- has_many :keep_it_ups
- has_many :comments

## tweets テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association

- has_one_attached :image
- belongs_to :user
- has_many :keep_it_ups
- has_many :comments
- has_many :tags, through: :tweet_tags

## keep_it_ups テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| tweet  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| message | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| tweet   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet

## tweet_tags テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| tweet  | references | null: false, foreign_key: true |
| tag    | references | null: false, foreign_key: true |

### Association

- belongs_to :tweet
- belongs_to :tag

## tags テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :tweets, through: :tweet_tags

# 開発環境

### <u>言語・フレームワーク</u>

Ruby 2.6.5, Rails 6.0.3.4

### <u>フロント</u>

HTML, CSS, JavaScript

### <u>データベース</u>

MySQL5.6

### <u>テスト</u>

rspec-rails, factory_bot_rails, faker

### <u>インフラ</u>

AWS（VPC, EC2, S3, CloudFront, Route53）<br>
Webサーバー：Nginx, アプリケーションサーバー：Unicorn

