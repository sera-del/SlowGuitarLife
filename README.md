![キャッチコピー](./app/assets/images/copy.png)

# サービスの概要
ギターを始めたけどお金を使いたくない人のモチベーション低下を防ぐための
動画共有型の投稿サイトです。

# サービスを開発した経緯
お金をなるべく使用したくない方は必然的に独学での練習になりますが、
独学だと演奏方法や弾いた音が正しいのかも分からず手探りの状態が続きます。

特に音楽のアニメやドラマで楽器を購入する方が増加する一方、
ブームが過ぎれば同じ楽器が中古楽器店に並ぶ光景が楽器経験者としては
悲しいので今回このサービスを作成するに至りました。

# 機能の説明
ここではログインから新規投稿をするまでの流れを画像を用いてご説明いたします。

![ログイン](./app/assets/images/login.png)
![新規投稿1](./app/assets/images/new_post1.png)
![新規投稿2](./app/assets/images/new_post2.png)
![新規投稿3](./app/assets/images/new_post3.png)

# 使用技術
bootstrapテンプレートMDB(CDN経由)
Github
SQLite3
Ruby on Rails(バージョン6.1.7.6)
Youtube Data API v3
Devise
rubocop
RSpec

# ER図
![ER図](./app/assets/images/ER.png)

# こだわりポイント
投稿、編集画面にYoutube動画の検索フォームを実装した点です。

# 今後の展望
ChatGPTと連携して自分のレベルに応じた練習動画（もしくはその動画のURL）を
提示できるようにしたい。
