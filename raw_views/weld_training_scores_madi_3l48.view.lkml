view: weld_training_scores_madi_3l48 {
  sql_table_name: `stellantis-molding-anomaly-det.molding_anomaly_poc.weld_training_scores_madi_3l48` ;;

  dimension: anomaly_score {
    type: number
    sql: ${TABLE}.anomaly_score ;;
  }
  dimension: class_prob {
    type: number
    sql: ${TABLE}.class_prob ;;
  }
  dimension: composition {
    type: string
    sql: ${TABLE}.composition ;;
  }
  dimension: feature_set_id {
    type: string
    sql: ${TABLE}.feature_set_id ;;
  }
  dimension: is_dominant_stack {
    type: yesno
    sql: ${TABLE}.is_dominant_stack ;;
  }
  dimension: is_labeled {
    type: yesno
    sql: ${TABLE}.is_labeled ;;
  }
  dimension: madi_sample_delta {
    type: number
    sql: ${TABLE}.madi_sample_delta ;;
  }
  dimension: madi_sample_ratio {
    type: number
    sql: ${TABLE}.madi_sample_ratio ;;
  }
  dimension: model_algorithm {
    type: string
    sql: ${TABLE}.model_algorithm ;;
  }
  dimension: original_filename {
    type: string
    sql: ${TABLE}.original_filename ;;
  }
  dimension: scored_at {
    type: string
    sql: ${TABLE}.scored_at ;;
  }
  dimension: sheet {
    type: number
    sql: ${TABLE}.sheet ;;
  }
  dimension: split {
    type: string
    sql: ${TABLE}.split ;;
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
  dimension: train_recent_quantile {
    type: number
    sql: ${TABLE}.train_recent_quantile ;;
  }
  dimension: train_scope {
    type: string
    sql: ${TABLE}.train_scope ;;
  }
  dimension: tth_round {
    type: number
    sql: ${TABLE}.Tth_round ;;
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
