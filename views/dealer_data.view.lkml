view: dealer_data {
  sql_table_name: `future-auto-retailing.autorepair.dealerdata` ;;

  dimension: vin {
    primary_key: yes
    type: string
    sql: UPPER(${TABLE}.vin) ;;
  }

  dimension: car_name {
    type: string
    sql: UPPER(${TABLE}.car_name) ;;
  }

  dimension: year {
    type: string
    sql: CAST(${TABLE}.year AS STRING);;
  }


  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }


  dimension: times_viewed {
    type: number
    sql: ${TABLE}.times_viewed ;;
  }

  dimension: body_type {
    type: string
    sql: UPPER(${TABLE}.body_type) ;;
  }

  dimension: transmission {
    type: string
    sql: UPPER(${TABLE}.transmission) ;;
  }

  dimension: variant {
    type: string
    sql: UPPER(${TABLE}.variant) ;;
  }

  dimension: assured_buy {
    type: yesno
    sql: ${TABLE}.assured_buy ;;
  }

  dimension: city {
    type: string
    sql: UPPER(${TABLE}.City) ;;
  }

  dimension: state {
    type: string
    map_layer_name: us_states
    sql: UPPER(${TABLE}.State) ;;
  }

  dimension: is_hot {
    type: yesno
    sql: ${TABLE}.is_hot ;;
  }

  dimension: rto {
    type: string
    sql: UPPER(${TABLE}.rto) ;;
  }

  dimension: source {
    type: string
    sql: UPPER(${TABLE}.source) ;;
  }

  dimension: make {
    type: string
    sql: UPPER(${TABLE}.make) ;;
  }

  dimension: model {
    type: string
    sql: UPPER(${TABLE}.model) ;;
  }

  dimension: car_availability {
    type: string
    sql: UPPER(${TABLE}.car_availability) ;;
  }

  dimension: total_owners {
    type: number
    sql: ${TABLE}.total_owners ;;
  }

  dimension: broker_quote {
    type: number
    sql: ${TABLE}.borker_quote ;;
  }

  dimension: original_price {
    type: number
    sql: ${TABLE}.original_price ;;
  }

  dimension: car_rating {
    type: string
    sql: UPPER(${TABLE}.car_rating) ;;
  }

  dimension_group: ad_created_on {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: timestamp
    sql: ${TABLE}.ad_created_on ;;
  }

  dimension: fitness_certificate {
    type: yesno
    sql: ${TABLE}.fitness_certificate ;;
  }

  dimension: reserved {
    type: yesno
    sql: ${TABLE}.reserved ;;
  }

  dimension: warranty_av {
    type: yesno
    sql: ${TABLE}.warranty_av ;;
  }

  measure: count_distinct_vin {
    type:  count_distinct
    sql: ${TABLE}.vin ;;
    drill_fields: [vin, city, state, year, make, model, body_type, car_rating, transmission, warranty_av]
  }

  measure: sum_sales {
    type:  sum
    sql: ${TABLE}.sale_price ;;
    drill_fields: [vin, city, state, year, make, model, body_type, car_rating, transmission, warranty_av]
  }
}
