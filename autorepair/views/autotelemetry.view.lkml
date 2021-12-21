view: autotelemetry {
  sql_table_name: `future-auto-retailing.autorepair.autotelemetry_aggr`
    ;;

  dimension: trip_id{
    type: number
    sql: ${TABLE}.tripID ;;
  }

  dimension: vin {
    primary_key: yes
    type: string
    sql: ${TABLE}.vin ;;
  }

  dimension_group: timestamp {
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
    sql: ${TABLE}.timestamp ;;
  }

  dimension: gps_speed {
    type: number
    sql: ${TABLE}.gps_speed ;;
  }

  dimension: battery {
    type: number
    sql: ${TABLE}.battery ;;
  }

  dimension: cTemp {
    type: number
    sql: ${TABLE}.cTemp ;;
  }

  dimension: dtc {
    type: number
    sql: ${TABLE}.dtc ;;
  }

  dimension: eLoad {
    type: number
    sql: ${TABLE}.eLoad ;;
  }

  dimension: iat {
    type: number
    sql: ${TABLE}.iat ;;
  }

  dimension: imap {
    type: number
    sql: ${TABLE}.imap ;;
  }

  dimension: kpl {
    type: number
    sql: ${TABLE}.kpl ;;
  }

  dimension: maf {
    type: number
    sql: ${TABLE}.maf ;;
  }

  dimension: rpm {
    type: number
    sql: ${TABLE}.rpm ;;
  }

  dimension: speed {
    type: number
    sql: ${TABLE}.speed ;;
  }

  dimension: tAdv {
    type: number
    sql: ${TABLE}.tAdv ;;
  }

  dimension: tPos {
    type: number
    sql: ${TABLE}.tPos ;;
  }

  measure: count {
    type:  count
  }

  measure: avg_speed {
    type: average
    sql: ${speed} ;;
  }

  measure: avg_gps_speed {
    type: average
    sql: ${gps_speed} ;;
  }
}
