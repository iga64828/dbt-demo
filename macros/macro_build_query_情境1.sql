
-- marco 把重複的語法當模組做版控

-- 以下使用方法為: {{ macro_build_query('table_2') }}
-- 情境1: 每個table都要做一樣的事
{% macro macro_build_query1(table_name) %}

select

{% for i in range(1,6) -%}
    attribute_{{ i }} {%- if not loop.last %},{% endif %}
{% endfor %}

from {{ table_name }}

{% endmacro %}


