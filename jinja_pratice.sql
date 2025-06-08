-- ref function 會依照設定的 BigQuery project, dataset, schema，
-- compile 出完整的 view 或 table 名稱。
-- 如果在正式環境跑，compile 出來的就會是正式環境所使用的 schema
select * from {{ ref('stg_orders') }}


-- Jinja - For Loop & If Statment
-- 變成select attribute_1 ~ attribute_5
-- 如果不是最後一個，每一項後面都要加,號
-- 將 {% ... %} 加入 - ，改成 {%- ... -%} 就可以去除頭尾空格，也可以只放一邊
select

    {% for i in range(1,6) -%}
        attribute_{{ i }} {%- if not loop.last %},{% endif %}
    {% endfor %}

from table_1