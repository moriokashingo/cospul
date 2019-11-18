# アプリ名
cospul

# 概要
cospulはコスプレ、ダンス、パーティーなどのあらゆる衣装のサンプルを検索、投稿できるサービスです。

# 何ができるのか？
cospulは、以下のことができます。
記事の投稿/編集/削除
楽天市場商品検索apiを使った商品検索
記事にタグ付けする
記事にいいねする
記事をいいねした物、タグの一覧を見ることができる
簡単なゲームが複数できる


# 使い方
## ログアウト時

### 詳細
トップページから記事の上にマウスオーバーするとタイトルなどの詳細を見ることができます。
[![Image from Gyazo](https://i.gyazo.com/4f76da8452301e4684ac55ad9e57de06.gif)](https://gyazo.com/4f76da8452301e4684ac55ad9e57de06)
記事をクリックするとその記事の詳細を見ることができます。
[![Image from Gyazo](https://i.gyazo.com/1496d8144756193af2dd155cb5660f0d.gif)](https://gyazo.com/1496d8144756193af2dd155cb5660f0d)
タグボタンをクリックすると同じタグを持つ記事を一覧で見ることができます。
[![Image from Gyazo](https://i.gyazo.com/206f1852fb308206b35810b95613ed6e.gif)](https://gyazo.com/206f1852fb308206b35810b95613ed6e)
左のボタンを押すとサイドバーが出てくるのでそこからトップページなどに移動することができます。
[![Image from Gyazo](https://i.gyazo.com/85f17cbc9ca3b273d97c002325a481a4.gif)](https://gyazo.com/85f17cbc9ca3b273d97c002325a481a4)

### タグ検索機能
トップページで気になるタグのついたコーディネートを検索することができます。
[![Image from Gyazo](https://i.gyazo.com/f6bd630e6030d1be45e6bf0aa8c41fe8.gif)](https://gyazo.com/f6bd630e6030d1be45e6bf0aa8c41fe8)

### ゲーム
トップページの右上にある➕ボタンをクリックするとゲームや商品検索などのページに遷移するボタンが表示されます。
[![Image from Gyazo](https://i.gyazo.com/d7143afb0ca27f531a8c7c4ac4440dd4.gif)](https://gyazo.com/d7143afb0ca27f531a8c7c4ac4440dd4)


## ログイン時
トップページの左上のボタンを押すとログインや新規登録画面へのリンクが表示されます。
ログインすると左上にユーザーのアイコンが表示されます。
signinからメールアドレス、パスワードを入力してログインできます。
###  テスト用ユーザー
email tanaka@gmail.com

password tanaka
[![Image from Gyazo](https://i.gyazo.com/fc77e92f2b445d490f0a47339adc1d79.gif)](https://gyazo.com/fc77e92f2b445d490f0a47339adc1d79)
[![Image from Gyazo](https://i.gyazo.com/9b1195a0276418ee4623b89ff66f4bec.gif)](https://gyazo.com/9b1195a0276418ee4623b89ff66f4bec)



###  投稿機能
ログイン後、左上のボタンを押すとNEW POSTがあるのでクリックすると、投稿画面に遷移します。
1枚目のページで
写真、タイトル、詳細、タグを投稿できます。
タグは
"タグ１,タグ２,タグ３"
のように","を使って入力すると複数のタグをつけることが出来ます。
[![Image from Gyazo](https://i.gyazo.com/1aeaf52f07f97d89ccd82da6f02892f7.gif)](https://gyazo.com/1aeaf52f07f97d89ccd82da6f02892f7)
###  楽天検索
2枚目のページで
１つ１つの服のアイテムの詳細を入力することができ、商品のurlを入力すると商品詳細ページでリンクボタンとして表示されます。
一番下の部分では楽天商品検索APIを使い非同期で商品サイトの検索もできます。
[![Image from Gyazo](https://i.gyazo.com/e815604acb616d095fa64cc278295102.gif)](https://gyazo.com/e815604acb616d095fa64cc278295102)

自分で投稿した記事は商品詳細ページから、編集ボタンを押すと編集する事ができます
https://gyazo.com/0e857effef077ef302c9b0155daf0608


###  いいね機能
記事の上にマウスーオーバしてハートボタンを押すと記事にいいねする事ができます。
[![Image from Gyazo](https://i.gyazo.com/2e2e405932d5685280d6ce6d34cab8fb.gif)](https://gyazo.com/2e2e405932d5685280d6ce6d34cab8fb)
いいねした記事は、トップページ左上のボタンからLIKE's LISTボタンを押すといいねした記事を一覧で見る事ができます。
[![Image from Gyazo](https://i.gyazo.com/6f6231dd35bbceb4fd0d8a64dba90a5d.gif)](https://gyazo.com/6f6231dd35bbceb4fd0d8a64dba90a5d)




# どうやってできているのか？
cospulは、以下の技術を使用しています。

Ruby Ver 2.5.1
Ruby on Rails Ver 5.2.3
MySQL  Ver 14.14
AWS
S3
jQuery Ver 1.9.1
楽天市場商品検索api
テストはRspecで書いています。

# 作成者

* 作成者 森岡 真悟
* E-mail 	o53.morioka.shingo@gmail.com


