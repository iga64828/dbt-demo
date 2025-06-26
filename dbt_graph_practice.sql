-- 列出所有 model 
{{ graph }}

-- 用 for 迴圈一個一個列出 graph.nodes 的 key
{% for node in graph.nodes%}
{{ node }}
{% endfor %}

-- 用 for 迴圈一個一個列出 graph.nodes 的 key
{% for node in graph.nodes.values()%}
{{ node }}
{% endfor %}



-- 改寫成 select 的方式，不僅可以跑成 SQL 的查詢結果容易閱讀，
-- 更能建成 model 方便後續使用。
{% for node in graph.nodes.values()%}

select "{{ node.name }}" as node_name
{%- if not loop.last %} union all {%- endif -%}

{% endfor %}


-- 加入更多欄位
{% for node in graph.nodes.values()%}

select
"{{ node.resource_type }}" as node_resource_type,
"{{ node.name }}" as node_name,
"{{ node.path }}" as node_path
{% if not loop.last %} union all {%- endif -%}

{% endfor %}