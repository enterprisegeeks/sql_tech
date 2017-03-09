package main

import (
  "database/sql"
  "fmt"
  "os"

  _ "github.com/go-sql-driver/mysql"
)

func main() {
  user := os.Getenv("DB_USER")
  pass := os.Getenv("DB_PASSWORD")
  host := os.Getenv("DB_HOST")
  port := os.Getenv("DB_PORT")
  database := os.Getenv("DB_DATABASE")
  dsn := user +":"+ pass + "@tcp(" + host + ":" + port + ")/" + database
  //fmt.Println(dsn)
  db, err := sql.Open("mysql", dsn)
  if err != nil {
    panic(err.Error())
  }
  defer db.Close() // 関数がリターンする直前に呼び出される

  rows, err := db.Query("SELECT * FROM example where name like 'A%'") // 
  if err != nil {
    panic(err.Error())
  }

  columns, err := rows.Columns() // カラム名を取得
  if err != nil {
    panic(err.Error())
  }

  values := make([]sql.RawBytes, len(columns))
  
  //  rows.Scan は引数に `[]interface{}`が必要.

  scanArgs := make([]interface{}, len(values))
  for i := range values {
    scanArgs[i] = &values[i]
  }
  fmt.Println("ID\tname")

  for rows.Next() {
    err = rows.Scan(scanArgs...)
    if err != nil {
      panic(err.Error())
    }

    var value string
    for i, col := range values {
      if col == nil {
        value = "NULL"
      } else {
        value = string(col)
      }
      fmt.Print(value)
      
      if i != len(columns) -1 {
        fmt.Print("\t")
      }
    }
    fmt.Println("")
  }
}

