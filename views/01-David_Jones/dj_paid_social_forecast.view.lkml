view: dj_paid_social_forecast {

  sql_table_name: `crg-dclk-dt.@{DJ_FORECAST_DATASET}.paid_social_forecast` ;;

  dimension: week_start_date {
    type: string
    sql: ${TABLE}.week_start_date;;
  }    dimension: budget_target_dim {
    hidden: yes
    type: number
    sql: ${TABLE}.budget_target ;;
  }

  measure: budget_target {
    type: sum
    sql:${budget_target_dim} ;;
  }

  dimension: impressions_target_dim {
    hidden: yes
    type: number
    sql: ${TABLE}.Impressions_Target ;;
  }

  measure: impressions_target {
    type: sum
    sql:${impressions_target_dim} ;;
  }

  dimension: clicks_target_dim {
    hidden: yes
    type: number
    sql: ${TABLE}.Clicks_Target ;;
  }

  measure: clicks_target {
    type: sum
    sql:${clicks_target_dim} ;;
  }

  dimension: transactions_target_dim {
    hidden: yes
    type: number
    sql: ${TABLE}.Transactions_Target ;;
  }

  measure: transactions_target {
    type: sum
    sql:${transactions_target_dim} ;;
  }

  dimension: revenue_target_dim {
    hidden: yes
    type: number
    sql: ${TABLE}.Revenue_Target ;;
  }

  measure: revenue_target {
    type: sum
    sql:${revenue_target_dim} ;;
  }
}
