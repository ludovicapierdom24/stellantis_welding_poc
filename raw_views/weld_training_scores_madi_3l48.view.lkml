view: weld_training_scores_madi_3l48 {
  sql_table_name: `stellantis-molding-anomaly-det.molding_anomaly_poc.weld_training_scores_madi_3l48` ;;

  dimension: anomaly_score {
    type: number
    description: "MADI anomaly score."
    sql: ${TABLE}.anomaly_score ;;
  }
  dimension: class_prob {
    type: number
    description: "Classification probability."
    sql: ${TABLE}.class_prob ;;
  }
  dimension: composition {
    type: string
    description: "Sheet stack th1·th2·th3 (text, mm)."
    sql: ${TABLE}.composition ;;
  }
  dimension: feature_set_id {
    type: string
    description: "Identifier for the feature set used."
    sql: ${TABLE}.feature_set_id ;;
  }
  dimension: is_dominant_stack {
    type: yesno
    description: "True if composition = 2.0·0.8·2.0 mm (dominant stack for this typology)."
    sql: ${TABLE}.is_dominant_stack ;;
  }
  dimension: is_labeled {
    type: yesno
    description: "True if the weld has an ultrasound label."
    sql: ${TABLE}.is_labeled ;;
  }
  dimension: madi_sample_delta {
    type: number
    description: "Difference in MADI score between consecutive samples."
    sql: ${TABLE}.madi_sample_delta ;;
  }
  dimension: madi_sample_ratio {
    type: number
    description: "Ratio of MADI scores between consecutive samples."
    sql: ${TABLE}.madi_sample_ratio ;;
  }
  dimension: model_algorithm {
    type: string
    description: "Algorithm used by the MADI model."
    sql: ${TABLE}.model_algorithm ;;
  }
  dimension: original_filename {
    primary_key: yes
    type: string
    description: "PLC log filename; key to plc_logs and summary_weldlog."
    sql: ${TABLE}.original_filename ;;
  }
  dimension: scored_at {
    type: string
    description: "Timestamp when the anomaly score was calculated."
    sql: ${TABLE}.scored_at ;;
  }
  dimension: sheet {
    type: number
    description: "Number of sheets in the joint (from spot_sheet_details)."
    sql: ${TABLE}.sheet ;;
  }
  dimension: split {
    type: string
    description: "Dataset split (e.g., train, test, validation)."
    sql: ${TABLE}.split ;;
  }
  dimension: spot_name {
    type: string
    description: "Welding spot identifier on the piece (PLC string)."
    sql: ${TABLE}.spot_name ;;
  }
  dimension_group: time_stamp {
    type: time
    description: "Welding timestamp (UTC)."
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.TimeStamp ;;
  }
  dimension: timer_name {
    type: string
    description: "Welding controller identifier (PLC)."
    sql: ${TABLE}.timer_name ;;
  }
  dimension: train_recent_quantile {
    type: number
    description: "Recent quantile value from training data."
    sql: ${TABLE}.train_recent_quantile ;;
  }
  dimension: train_scope {
    type: string
    description: "Scope of the training data."
    sql: ${TABLE}.train_scope ;;
  }
  dimension: tth_round {
    type: number
    description: "Total thickness rounded to 0.1 mm (typology filter)."
    sql: ${TABLE}.Tth_round ;;
  }
  dimension: ultrasound {
    type: string
    description: "Ultrasound control result: Good or KO (NULL if not labeled)."
    sql: ${TABLE}.Ultrasound ;;
  }
  dimension: y {
    type: number
    description: "Binary target: 0=Good, 1=KO, NULL if not labeled."
    sql: ${TABLE}.y ;;
  }
  measure: count {
    type: count
    drill_fields: [timer_name, original_filename, spot_name]
  }
}
