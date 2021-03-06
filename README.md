SQL TECH
----------


## シェル

### setEnv.sh

テスト用に、環境変数を設定する。
今回、DB接続先の情報は環境変数に保持し、各種プログラムから参照したり、接続先を用意に切り替え可能にする。

以下の変数を使用します。

+ DB_HOST
+ DB_PORT
+ DB_DATABASE
+ DB_USER
+ DB_PASSWORD

上記環境変数を設定するシェルを用意しています。
エンドポイント1(テスト用)とエンドポイント2(本番用)の2つを設定を次の呼び出しで切り替えます。
最初は、エンドポイント1だけを使用してください。

+ エンドポイント1 `source setEnv1.sh`
+ エンドポイント2 `source setEnv2.sh`

エンドポイント2 は、本番1回限りで実行するものですので、
スタッフを呼んだ上で、作業してください。
スタッフが作業しない限り、エンドポイント2には接続できません。

### execSql.sh : sqlの実行
 
 引数 SQLファイル
 環境変数を使用して、mysqlクライアントを起動し、リダイレクトで引数のSQLファイルの内容を投入する。

`./execSql.sh sample.sql `

select文の実行、DDL文の発行などで使用可能です。
通常通り、MySQLクライアントを実行する場合は、次でも可です。

`./connect.sh`

あるいは次でもOKです。

`mysql -h${DB_HOST} -u${DB_USER} -p${DB_PASSWORD} ${DB_DATABASE}`

### キャッシュの削除

AuroraはSQL実行結果をキャッシュし、次回同一のSQLを実行する場合は、キャッシュを使用します。
そのため、突然実行時間が早くなったります。

次のコマンドでキャッシュを削除できます。

```
./execSql.sh clearCashe.sql
```

クライアントなどからキャッシュを消したい場合、次のクエリを実行してください。

`RESET QUERY CACHE;`

このキャッシュのクリアは、次の処理時間計測でも、暗黙的に実行します。

### checkTime.sh :sqlの実行、検証、時間計測

期待値のファイルと、実行コマンド一式を引数に取り、
実行コマンドを実行して得られた標準出力の内容と、期待値ファイルの内容を付き合わせる。
なお、パフォーマンス計測にぶれが生じないように、Auroraのキャッシュを削除してからSQLを実行します。

例)
 ` ./checkTime.sh expect2.txt ./execSql.sh sample.sql ` 

### クライアントの使用
PCから直接MySQLWorkBenchなどのクライアントを使ってRDSに接続可能です。
パラメータについては、`env` などで環境変数の値を確認してください。


## 言語サンプル(今回は未使用)


### rubysql
rubyによる、上記環境変数を使用した、mysql接続サンプル.

+ ruby 2.4.0

実行するには bundle のインストールが必要。

```ruby
gem install bundle
cd rubysql
bundle install
```

### javasql

java による同様のサンプル
gradle applicationプラグインにより、実行可能スクリプトを自動生成する。

`gradlew installDist` 
でビルドした後、 buind/install/javasql 配下一式を配置、
`javasql/bin/havasql` が起動スクリプト。

### gosql

golang による同様のサンプル。

go1.6 にて動作確認。
golangインストール後、 GOPATH, GOROOT を設定し、

`go get github.com/go-sql-driver/mysql` 

でmysqlライブラリを取得しておく。

`go build` でバイナリ、 gosql ができる。

## 備考

### 実行時間

クライアント ≒ golang <= ruby <= java

javaは単発のSQLを発行する分には、JVM起動のオーバーヘッドがネックになっている。
