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

以下內容參考來源:
- https://medium.com/kkdaytech/dbt-data-build-tool-part1-introduction-b41cae4800bb
- https://ithelp.ithome.com.tw/m/articles/10317471
<br><br>
專案結構解釋:
- `models`:  .sql 檔案，寫的 SQL 語句，用 dbt run 可以在你的 Data Warehouse 建立此 model。
- `tests`: 測試 dbt 中的 models 或其他資源做出 assert，當運行 dbt test 的時候則可以知道哪些是通過，哪些是失敗的。
- `marcos`: 在 dbt 中可以使用 jinja 模板語言結合，而 marcos 則是可以多次重複使用的程式碼，類似於程式語言中的函數，若有重複的程式碼則可以好好的多加利用 marcos 。
- `snapshots`: 有時候分析師需要 “look back” 也就是有些動態表的某些歷史資料。而 snapshots 紀錄了表隨時間的變化。
- `analysis`: dbt 的 model 概念使資料團隊可以輕鬆地進行版本控制和協作進行資料轉換。 但有時，某個 SQL 語句並不完全適合 dbt model。 這些更具“分析性”的 SQL 可以使用 dbt 的分析功能在 dbt 項目中進行版本控制。
- `dbt_project.yml`:
  - 有這個設定檔案，dbt 才知道現在此專案是 dbt 的專案，裡面也可以設定一些重要資訊。
  - 定義了 dbt 資料夾 & model 結構，統一 database, dataset, table 名稱及型式(table, view)設定
  - 且不論是 dbt run, dbt test 等指令和 flag(tag, var…)都有對應設定寫在 dbt_project.yml
