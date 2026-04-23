WITH daily_weather as (
SELECT 
date(time) as daily_weather,
weather,
temp,
pressure
FROM 
{{ source('demo', 'weather') }}

),

daily_weather_agg as (

select 
daily_weather,
weather,
round(avg(temp),2) as avg_temp,
round(avg(pressure),2) as avg_pressure
from daily_weather

group by daily_weather, weather

qualify row_number() over (partition by daily_weather order by count(weather)) =1

)

SELECT 
*
FROM daily_weather_agg