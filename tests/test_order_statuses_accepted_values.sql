select *
from {{ ref('stg_orders' ) }}
where

    -- 測試成功
    status not in (
        'placed', 'shipped', 'completed', 'return_pending', 'returned'
    )

    -- 測試失敗
    -- status not in ('placed', 'shipped', 'completed')