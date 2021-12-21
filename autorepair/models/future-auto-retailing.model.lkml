connection: "bigquery_public_data_looker"

# include all the views
include: "/autorepair/views/**/*.view"

datagroup: future_auto_retailing_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: future_auto_retailing_default_datagroup

explore: autotelemetry {}

explore: components {
  join: parts {
    type: left_outer
    foreign_key: components.component_type
    relationship: one_to_many
  }
}

explore: parts {}

explore: dealer_data {
  join: error_prediction_results {
    type: left_outer
    sql_on: ${dealer_data.vin} = ${error_prediction_results.vin} ;;
    relationship: one_to_many
  }
}

explore: warranty_data {}
explore: error_codes {
  join: components {
    type: left_outer
    foreign_key: error_codes.component_type_affected
    relationship: one_to_one
  }

  join: parts {
    type: left_outer
    sql_on: ${components.component_type} = ${parts.component_type};;
    relationship: one_to_many
  }
}

explore: error_prediction_results {
  join: error_codes {
    type: left_outer
    sql_on: ${error_prediction_results.dtc_predicted} = ${error_codes.error_code};;
    relationship: one_to_one
  }

  join: components {
    type: left_outer
    sql_on: ${error_codes.component_type_affected} = ${components.component_type_id};;
    relationship: one_to_one
  }

  join: dealer_data {
    type:  left_outer
    sql_on: ${error_prediction_results.vin} = ${dealer_data.vin} ;;
    relationship: one_to_one
  }
}
