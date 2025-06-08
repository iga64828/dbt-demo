-- 使用package練習
-- package就是別人寫好的marco

-- 在相加數個欄位時，避免 null 的問題
select
{{ dbt_utils.safe_add(['attribute_1', 'attribute_2']) }}
from table_1

-- 給範圍產日期
{{ dbt_utils.date_spine(
    datepart="day",
    start_date="cast('2023-09-16' as date)",
    end_date="cast('2023-10-16' as date)"
   )
}}