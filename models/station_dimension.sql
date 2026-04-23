with weather as (

    select distinct 
    cityname,
    lat,
    lon,
    weather 
    from {{ source('demo', 'weather') }}
)

select * from weather