# dbt-demo

dbt-demo

此project為記錄依照 dbt: [告別過時的SQL開發流程](https://ithelp.ithome.com.tw/users/20159575/ironman/6032) 的練習 <br>
dbt連結big query 的demo<br>
我們所使用的 BigQuery 資料集 Jaffle Shop 是 dbt 官方的範例資料。<br>

`Jaffle Shop` 是一間虛擬的商店，資料包含虛擬的銷售及顧客資料。<br>
`Stripe` 則是虛擬的金流資料。<br>
Jaffle 就是熱壓土司。

指令紀錄:
- Compile 將 dbt Jinja SQL 翻譯成純 SQL
- dbt core commands
  - dbt debug : dbt connection check
  - dbt show --select `<model name>`  --limit `<n>` : view top n rows from certain model
  - dbt compile --select `<model name>` : compile modes to show you actual SQL syntax
  - dbt docs generate : generate docs
  - dbt docs serve: serving docs locally
- {{ config(materialized='incremental') }} : 建立該table，不整張表都更新，可以只更新差份。
