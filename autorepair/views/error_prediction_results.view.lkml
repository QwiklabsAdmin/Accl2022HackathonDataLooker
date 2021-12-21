view: error_prediction_results {
  sql_table_name: `future-auto-retailing.autorepair.predict_results`;;

  dimension: vin {
    type: string
    primary_key: yes
    sql: ${TABLE}.vin ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: dtc_predicted {
    type: number
    sql: ${TABLE}.dtcPredicted ;;
  }

  measure: count {
    type:  count
    drill_fields: [vin, error_codes.description, dealer_data.warranty_av, dealer_data.year, dealer_data.make, dealer_data.model, dealer_data.body_type, dealer_data.car_rating, dealer_data.transmission, dealer_data.city, dealer_data.state]
  }

  measure: count_distinct_vin {
    type:  count_distinct
    sql: ${TABLE}.vin ;;
    drill_fields: [vin, error_codes.description, dealer_data.warranty_av, dealer_data.year, dealer_data.make, dealer_data.model, dealer_data.body_type, dealer_data.car_rating, dealer_data.transmission, dealer_data.city, dealer_data.state]
  }
}
