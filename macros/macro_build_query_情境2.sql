-- 情境2: 不同table要做的稍為不同
-- ex:  table_1 和 table_2 我們想要產出 attribute_1 到 attribute_5，
-- 但 table_3 要產出 attribute_1 到 attribute_6
-- 加入 if 判斷式，依傳進來的參數區別即可
{% macro macro_build_query2(table_name) %}

select

{% for i in range(1,6) -%}
    attribute_{{ i }} {%- if not loop.last %},{% endif %}
{% endfor %}

{%- if table_name == 'table_3' %}
,attribute_6
{% endif %}

from {{ table_name }}

{% endmacro %}