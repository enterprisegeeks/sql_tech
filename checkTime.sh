#!/bin/bash
COMMAND=$2
# コマンドの標準出力結果
ACTUAL=act.txt
# ファイルパス
EXPECT_FILE=$1
shift
shift
ARGS=$@

func(){
  $COMMAND $ARGS > act.txt
}

./execSql.sh clearCache.sql

time func

diff $EXPECT_FILE $ACTUAL

ret=$?

if [ $ret = 0 ] ; then
  echo "OK"
else
  echo "NG"
fi


