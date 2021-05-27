
## メンズスキンケア広場(http://men-skincare-square.com/)

このアプリはメンズ限定のスキンケア用品のクチコミサイトです。  
私自身、化粧水や乳液を買おうと思って色々調べてみた際にどの商品も女性の方の感想やレビューしか無く、  
「これは男性でも使えるのか？」、「そもそも男性で使っている人がいるのか？」等の情報が無く困った経験があります。  
その経験を踏まえて、世の中の男性がもっと自由にスキンケア用品の情報交換のできる場があれば良いのになと思い、作成しました。  

以下アプリの簡単な概要です。  
![overview](https://user-images.githubusercontent.com/79210669/119690043-4fe06a80-be84-11eb-987e-d0a1d6a87b55.gif)


ユーザーが迷わず、シンプルに使えるように意識して作成しました。  
また管理者ユーザーと一般ユーザーで操作権限が異なるように実装しています。(アイテムの登録や削除、編集は管理者ユーザーのみ可能)

管理者ユーザー  
 　email:admin@example.com  
 　pass:admin
 
 一般ユーザー  
   email:test@example.com  
   pass:test  
   もしくは新規登録ユーザー


## 使用技術  
- Ruby -2.7.0  
- Ruby on Rails -6.1.3.2  
- javascript  
- jquery -3.3.1
- HTML/CSS
- bootstrap
- MySQL -5.7.34  
- Nginx  
- puma

## インフラ 
- AWS  
  - VPC  
  - EC2  
  - Route53   
  - RDS  
  - S3  
  - CloudFront  
  
  

## 機能一覧
- 商品検索機能  
- ページネーション(kaminari)  
- 星表示機能(raty.js)  
- 画像投稿機能(CarrierWave)  
- ユーザー登録、ログイン機能(session)  
- カテゴリ別表示  
- adminユーザー機能  
- エラーメッセージ表示機能(rails-i18n)  
- 商品、ユーザー、クチコミ投稿のCRUD  


## これから取り入れたいと考えている機能
- dockerによる環境構築
- CI/CDの導入
- 各種APIを使用してのSNS認証
