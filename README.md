# README

# アプリケーション名

Keep It App（keep it up：その調子でがんばれ！）

# アプリケーション概要

・日々の積み上げ（勉強・筋トレ・食事制限など）を投稿し、それに対しkeep it up!ボタンを押し合うことで、頑張りを継続させるためのアプリです。
・トレーニング中や料理の写真も投稿でき、頑張りを自慢することができます。
・投稿に対してコメントを行うことで、成果が出ている人に質問したりアドバイスをもらったりすることができます。

# URL

デプロイ済みのURLを記述しましょう。デプロイが済んでいない場合は、デプロイ次第記述しましょう。

# テスト用アカウント

ログイン機能等を実装した場合は、記述しましょう。またBasic認証等を設けている場合は、そのID/Passも記述しましょう。

# 利用方法

①新規ユーザー登録をします。
②トップページの投稿するボタンを押し、新規投稿ページへ移動します。
③テキスト入力と画像の添付を行い、投稿ボタンを押して積み上げを投稿します。
④自分の投稿は、編集ボタンで編集、削除ボタンで削除できます。
⑤投稿をクリックすると、投稿詳細ページに移動します。
⑥詳細ページでは、投稿に対してコメントします。
⑦投稿には、一覧ページと詳細ページで「keep it up!」（その調子でがんばれ！）ボタンを押すことができます。

# 目指した課題解決

|                                              |                                  |                                                                                                                                                                                                                        | 
| -------------------------------------------- | -------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | 
| ターゲットユーザー                           | 解決したい課題                   | このアプリを使うことで得られる経験                                                                                                                                                                                     | 
| 勉強・筋トレ・食事制限など、自分を変えたい人 | 自分だけだとなかなか継続できない | 頑張っている人の投稿を見て、自分を奮い立たせることができる<br>成果が出ている人に対して、継続するコツを質問することができる<br>目標を宣言したり活動を報告し合ったり、ユーザー同士でコミュニケーションをとることができる | 
|                                              |                                  |                                                                                                                                                                                                                        | 

# 洗い出した要件

| 優先順位（高・中・低） | 機能                              | 目的                                                   | 詳細                                                                                     | ストーリー（ユースケース）                                                                                                                   | 見積もり（所要時間）<br>単位：時間 | 
| ---------------------- | --------------------------------- | ------------------------------------------------------ | ---------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------- | 
| 高                     | ユーザー管理                      | どのユーザーの投稿か識別するため                       | ユーザー情報（ニックネーム、メールアドレス、パスワード）を登録できるようにする           | 必要情報を入力すれば、ユーザー登録することができる<br>同じメールアドレスが存在する場合は、登録できない                                       | 4                                  | 
| 高                     | ツイート投稿                      | ユーザーが日々の積み上げを披露できるようにするため         | ツイート（タグ付け）と画像を投稿できるようにする<br>また、編集や削除の機能もつける       | ログインしたユーザーはツイートを投稿することができる<br>画像の添付やタグ付けも可能<br>編集時は、ツイートテキストと画像が入力された状態である | 6                                  | 
| 中                     | コメント投稿                      | ユーザー同士でコミュニケーションを取れるようにするため | 投稿に対してコメントできるようにする                                                     | 全てのツイートにコメントを投稿することができる<br>何度でもコメントすることができる                                                           | 2                                  | 
| 高                     | タグ付け                          | どのような内容のツイートかわかりやすくするため         | ツイートにタグ付けできるようにする<br>指定したタグがついたツイートを検索できるようにする | ツイート投稿時、タグをつけることができる<br>入力中タグの候補が表示される<br>タグでツイートを検索できる                                       | 6                                  | 
| 中                     | keep it up!ボタン（いいねボタン） | 積み上げを応援して、継続できるようにするため           | ツイートに対して応援の意味を込めてkeep it up!ボタンを押せるようにする                    | ユーザーは、他のユーザーの投稿に対して、1回だけkeep it up!ボタンを押すことができる                                                           | 6                                  | 
| 低                     | SNS認証                           | ユーザー登録のハードルを下げるため                     | SNSアカウント（Facebook, Google）を使用したユーザー登録ができるようにする                | ユーザー登録時、ユーザー情報の入力を手打ち入力、SNS認証から選べる<br>SNS認証では、情報は自動で入力される                                     | 6                                  | 

# 実装した機能についてのGIFと説明

実装した機能について、それぞれどのような特徴があるのか列挙しましょう。GIFを添えることで、イメージがしやすくなります。

# 実装予定の機能

目標を投稿し、宣言するための投稿固定機能


# データベース設計

## ER図

![ER図ver 2](https://user-images.githubusercontent.com/70367011/96565919-f0274d00-12ff-11eb-8deb-375f4a99644a.png)

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
| text   | string | null: false |

### Association

- has_many :tweets, through: :tweet_tags

# ローカルでの動作方法

git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど）。

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
| text   | string | null: false |

### Association

- has_many :tweets, through: :tweet_tags
