WITH CTE as (
SELECT 
date(TIME) AS date
,hour(time) as hour 
,{{get_day_type('TIME')}} AS DAY_TYPE
,{{get_season('TIME')}} as STATION_OF_YEAR

FROM 
{{ source('demo', 'weather') }}

)

SELECT * FROM CTE