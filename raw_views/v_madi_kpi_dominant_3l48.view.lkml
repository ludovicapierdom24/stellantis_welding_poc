view: v_madi_kpi_dominant_3l48 {
  sql_table_name: `stellantis-molding-anomaly-det.molding_anomaly_poc.v_madi_kpi_dominant_3l48` ;;

  dimension: lift {
    type: number
    sql: ${TABLE}.lift ;;
  }
  dimension: n_ko_top {
    type: number
    sql: ${TABLE}.n_ko_top ;;
  }
  dimension: n_ko_total {
    type: number
    sql: ${TABLE}.n_ko_total ;;
  }
  dimension: n_labeled {
    type: number
    sql: ${TABLE}.n_labeled ;;
  }
  dimension: n_top {
    type: number
    sql: ${TABLE}.n_top ;;
  }
  dimension: pct_ko_top {
    type: number
    sql: ${TABLE}.pct_ko_top ;;
  }
  dimension: scored_at {
    type: string
    sql: ${TABLE}.scored_at ;;
  }
  dimension: top_pct {
    type: number
    sql: ${TABLE}.top_pct ;;
  }
  dimension: rank_pct {
    type: number
    sql: ${TABLE}.rank_pct ;;
  }
  measure: count {
    type: count
  }
}
