ISUCON9頑張っていき
====

## How To Deploy

`make` によるデプロイ時にロールに合わせて `ROLE` 変数に値を設定します。

* `monolith` （デフォルト）
    * nginx  + アプリケーション本体 + mysql
* `app`
    * nginx + アプリケーション本体
* `db`
    * mysql

実行例（`app`)

```
make ROLE=app
```
