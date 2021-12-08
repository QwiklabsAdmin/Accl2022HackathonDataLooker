view: warranty_data {
  sql_table_name: `future-auto-retailing.autorepair.warrantyview` ;;

  dimension: vin {
    primary_key: yes
    type: string
    sql: UPPER(${TABLE}.vin) ;;
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

  dimension: make {
    type: string
    sql: UPPER(${TABLE}.make) ;;
  }

  dimension: model {
    type: string
    sql: UPPER(${TABLE}.model) ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: warranty_av {
    type: yesno
    sql: ${TABLE}.warranty_av ;;
  }

  dimension: error_description {
    type: string
    sql: UPPER(${TABLE}.Description) ;;
  }

  dimension: error_code {
    type: number
    sql: UPPER(${TABLE}.dtcPredicted) ;;
  }

  measure: repair_cost {
    type:  number
    sql: ${TABLE}.Repair_Cost ;;
    drill_fields: [vin, city, state, make, model, warranty_av]
  }

  measure: manpower {
    type:  number
    sql: ${TABLE}.Manpower ;;
    drill_fields: [vin, city, state, make, model, warranty_av]
  }


}
