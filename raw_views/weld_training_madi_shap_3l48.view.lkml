view: weld_training_madi_shap_3l48 {
  sql_table_name: `stellantis-molding-anomaly-det.molding_anomaly_poc.weld_training_madi_shap_3l48` ;;

  dimension: abs_shap {
    type: number
    sql: ${TABLE}.abs_shap ;;
  }
  dimension: anomaly_score {
    type: number
    sql: ${TABLE}.anomaly_score ;;
  }
  dimension: attribution_method {
    type: string
    sql: ${TABLE}.attribution_method ;;
  }
  dimension: class_prob {
    type: number
    sql: ${TABLE}.class_prob ;;
  }
  dimension: composition {
    type: string
    sql: ${TABLE}.composition ;;
  }
  dimension: computed_at {
    type: string
    sql: ${TABLE}.computed_at ;;
  }
  dimension: feature {
    type: string
    sql: ${TABLE}.feature ;;
  }
  dimension: feature_value {
    type: number
    sql: ${TABLE}.feature_value ;;
  }
  dimension: in_top_10pct {
    type: yesno
    sql: ${TABLE}.in_top_10pct ;;
  }
  dimension: in_top_15pct {
    type: yesno
    sql: ${TABLE}.in_top_15pct ;;
  }
  dimension: in_top_5pct {
    type: yesno
    sql: ${TABLE}.in_top_5pct ;;
  }
  dimension: is_labeled {
    type: yesno
    sql: ${TABLE}.is_labeled ;;
  }
  dimension: original_filename {
    type: string
    sql: ${TABLE}.original_filename ;;
  }
  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }
  dimension: rank_pct {
    type: number
    sql: ${TABLE}.rank_pct ;;
  }
  dimension: scored_at {
    type: string
    sql: ${TABLE}.scored_at ;;
  }
  dimension: shap_anomaly {
    type: number
    sql: ${TABLE}.shap_anomaly ;;
  }
  dimension: shap_rank {
    type: number
    sql: ${TABLE}.shap_rank ;;
  }
  dimension: spot_name {
    type: string
    sql: ${TABLE}.spot_name ;;
  }
  dimension_group: time_stamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.TimeStamp ;;
  }
  dimension: timer_name {
    type: string
    sql: ${TABLE}.timer_name ;;
  }
  dimension: ultrasound {
    type: string
    sql: ${TABLE}.Ultrasound ;;
  }
  dimension: y {
    type: number
    sql: ${TABLE}.y ;;
  }
  measure: count {
    type: count
    drill_fields: [timer_name, original_filename, spot_name]
  }
}
