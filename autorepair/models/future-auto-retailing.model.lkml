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