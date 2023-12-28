![キャッチコピー](./app/assets/images/copy.png)

# サービスの概要
ギターを始めたけどお金を使いたくない人のモチベーション低下を防ぐための
動画共有型の投稿サイトです。

# サービスのURL
https://slow-guitar-life-1e95e25b613d.herokuapp.com

# サービスを開発した経緯
お金をなるべく使用したくない方は必然的に独学での練習になりますが、
独学だと演奏方法や弾いた音が正しいのかも分からず手探りの状態が続きます。

特に音楽のアニメやドラマの流行で楽器を購入する方が増加する一方、
なかなか上達しないフラストレーションから挫折してしまい、
同じ楽器が中古楽器店に並ぶ光景を見かけます。

現在、某ロックバンドアニメが流行っていますが今回も同じ光景を見ることを考えると
楽器経験者としては悲しいので今回このサービスを作成するに至りました。

# 機能の説明
ここではログインから新規投稿をするまでの流れを画像を用いてご説明いたします。

![ログイン](./app/assets/images/login.png)
![新規投稿1](./app/assets/images/new_post1.png)
![新規投稿2](./app/assets/images/new_post2.png)
![新規投稿3](./app/assets/images/new_post3.png)

# 使用技術
Ruby 3.2.2</br>
Ruby on Rails 6.1.7.6</br>
bootstrapテンプレートMDB(CDN経由)</br>
Github</br>
Heroku</br>
PostgreSQL(本番環境)</br>
SQLite3(開発環境)</br>
Youtube Data API v3</br>
rubocop</br>
RSpec</br>
AWS S3</br>

# 機能一覧
* ユーザー登録、ログイン機能(Devise)
    * ゲストログイン機能
    * ユーザー情報編集機能
    * パスワード再設定機能
    * 退会機能
* 投稿機能
    * 新規投稿機能
    * 投稿編集機能
    * 投稿削除機能
* 検索機能
    * タグ検索機能
    * あいまい検索機能(投稿名、カテゴリ名で検索可)
    * Youtube動画検索機能(Youtube Data API v3)

# テスト
* RSpec
    * Model Spec
        * post_spec.rb
        * user_spec.rb
    * Request Spec
        * homes_spec.rb
        * posts_spec.rb
        * users_spec.rb
    * System Spec
        * posts_spec.rb
        * users_spec.rb

# ER図
![ER図](./app/assets/images/ER.png)

# こだわりポイント
投稿、編集画面にYoutube動画の検索フォームを実装した点です。

YouTubeサイトで直接動画のURLを取得するのはユーザーにとって
手間だと思いましたので、当サービスですぐ検索できるようにしました。

# 今後の展望
ChatGPTと連携して自分のレベルに応じた練習動画（もしくはその動画のURL）を
提示できるようにしたい。
