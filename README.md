SQL TECH
----------


## シェル

### setEnv.sh

テスト用に、環境変数を設定する。
今回、DB接続先の情報は環境変数に保持し、各種プログラムから参照したり、接続先を用意に切り替え可能にする。

以下の変数を用意する想定。

+ DB_JDBC_URL
+ DB_HOST
+ DB_PORT
+ DB_DATABASE
+ DB_USER
+ DB_PASSWORD

`source setEnv.sh` で設定する。

注意 : 実際では .bash_profile などに設定することを想定。

### checkTime.sh

期待値のファイルと、実行コマンド一式を引数に取り、
実行コマンドを実行して得られた標準出力の内容と、期待値ファイルの内容を付き合わせる。

例)
 ` ./checkTime.sh expect.txt ruby rubysql/sample.rb `  
 ` ./checkTime.sh expect.txt ./selectSql.sh sample.sql `  
 ` ./checkTime.sh expect.txt javasql/bin/javasql `  
 ` ./checkTime.sh expect.txt gosql/gosql `  

## 言語サンプル

### selectSql.sh
 
 引数 SQLファイル
 環境変数を使用して、mysqlクライアントを起動し、リダイレクトで引数のSQLファイルの内容を投入する。

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
