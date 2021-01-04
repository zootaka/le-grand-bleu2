## :tropical_fish: アプリの名前

# le grand bleu

## :art: logo

<p align="center">
  <img src="/app/assets/images/image0.png" width=70%>  
</p>

## 簡単な説明
 
ダイビングでのログブックの管理
ダイビングスポットの現状の把握
 
## 使い方
 
1. 新規登録画面からユーザー登録をしログブックを作成する
2. googlemapもしくは下の掲示板一覧から掲示板に遷移してダイビングスポットの現状を投稿、確認する
3. 
 
 

## 📦 機能

<h3 align="center"> 機能1 ユーザー管理機能 -</h3>

<h3 align="center"> 機能2 ログブックの作成、保存 </h3> 

<h3 align="center"> 機能3 googlemapを使用しての掲示板作成、投稿 -</h3>

 
## これから実装していきたい機能
 
- 任意でみんなのログブックをみれる機能の実装
- メッセージ機能の実装
- フォロー機能の実装
- ダイビングショップと一般ユーザーを分ける

## 🌐 App URL

### **https://.com**  

## 💬 Usage

  `$ git clone https://github.com/zootaka/le-grand-bleu2.git`  


# テーブル設計

## users テーブル

| Column             | Type   | Options        |
| ------------------ | ------ | -------------- |
| nickname           | string | null: false    |
| encrypted_password | string | null: false    |
| email              | string | null: false    |
| name               | string | null: false    |
| birth_date         | date   | null: false    |
| admin              | boolean| default: false |
### Association
has_many :log_books
has_many :comments

## log_books テーブル

| Column                    | Type     | Options     |
| ------------------------- | -------  | ----------- |
| place                     | string   | null: false |
| temperature               | string   |             |
| water_temperature         | string   |             |
| transparency              | string   |             |
| en_time                   | string   |             | 
| ex_time                   | string   |             |
| deep_avg                  | string   |             |
| deep_max                  | string   |             |
| date                      | date     |             |
| weight                    | string   |             |
| wear                      | text     |             |
| free_space                | text     |             |
| member                    | text     |             |
| user                      |references| null: false |
### Association

belongs_to :user

## map_place テーブル


|Column	     |Type   |Options          |
| -----------|------ |-----------------|
|place_name  |string |null: false      |
|description |text   |null: false      |
| latitude   |float	 | null: false     |
| longitude	 |float	 | null: false     |


### Association
has_many :comments


## comments テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| content  | text       |                                |
| user     | references | null: false, foreign_key: true |
| map_place| references | null: false, foreign_key: true |

### Association

- belongs_to :map_place
- belongs_to  :user
