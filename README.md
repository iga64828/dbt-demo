# dbt-demo
dbt-demo

此project為記錄依照 dbt: [告別過時的SQL開發流程](https://ithelp.ithome.com.tw/users/20159575/ironman/6032) 的練習
dbt連結big query 的demo
我們所使用的 BigQuery 資料集 Jaffle Shop 是 dbt 官方的範例資料。

Jaffle Shop 是一間虛擬的商店，資料包含虛擬的銷售及顧客資料。
而另一個資料集 Stripe 則是虛擬的金流資料。

Jaffle 就是熱壓土司。


指令紀錄:
Compile 將 dbt Jinja SQL 翻譯成純 SQL 

建立該table，不整張表都更新，可以只更新差份。
{{ config(materialized='incremental') }}
select * from {{ ref('int_sales_orders') }}