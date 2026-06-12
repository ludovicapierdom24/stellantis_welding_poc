include: "/raw_views/weld_training_madi_shap_3l48.view"

view: +weld_training_madi_shap_3l48 {

  dimension: id_weld {
    label: "Weld ID"
    type: string
    sql: concat(${timer_name},"-",${spot_name}) ;;
  }

  # ==========================================
  # SHAP VALUE METRICS
  # ==========================================

  measure: avg_shap_value {
    type: average
    label: "Avg Shap Anomaly Value"
    description: "Average SHAP (anomaly) contribution value across all features and events. Positive values indicate a feature that pushes the score toward anomaly."
    sql: ${shap_anomaly} ;;
    value_format_name: percent_2
  }

  measure: avg_abs_shap {
    type: average
    label: "Avg Feature Contribution (Absolute)"
    description: "Average absolute SHAP value, representing the magnitude of feature contribution regardless of direction."
    sql: ${abs_shap} ;;
    value_format_name: percent_2
  }

  measure: max_abs_shap {
    type: max
    label: "Max Feature Contribution"
    description: "Maximum absolute SHAP value in the selection, identifying the single most impactful feature contribution."
    sql: ${abs_shap} ;;
    value_format_name: percent_2
  }

  measure: total_shap_records {
    type: count
    label: "Total SHAP Records"
    description: "Total number of feature-level SHAP attribution records."
  }

  # ==========================================
  # ANOMALY SCORE (from SHAP table)
  # ==========================================

  measure: avg_anomaly_score_shap {
    type: average
    label: "Avg Anomaly Score (SHAP)"
    description: "Average anomaly score associated with the SHAP records."
    sql: ${anomaly_score} ;;
    value_format_name: percent_2
  }

  measure: avg_class_prob_shap {
    type: average
    label: "Avg Classification Probability (SHAP)"
    description: "Average classification probability associated with the SHAP records."
    sql: ${class_prob} ;;
    value_format_name: percent_2
  }

  # ==========================================
  # FEATURE RANK METRICS
  # ==========================================

  measure: avg_shap_rank {
    type: average
    label: "Avg Feature SHAP Rank"
    description: "Average rank of the feature by absolute SHAP contribution (1 = most important) across all anomaly detections."
    sql: ${shap_rank} ;;
    value_format_name: decimal_0
  }

  measure: avg_rank_pct {
    type: average
    label: "Avg Rank Percentile"
    description: "Average percentile rank of the feature contribution (higher = more impactful)."
    sql: ${rank_pct} ;;
    value_format_name: percent_2
  }


  # ==========================================
  # FEATURE VALUE METRICS
  # ==========================================

  measure: avg_feature_value {
    type: average
    label: "Avg Feature Value"
    description: "Average raw value of the input feature associated with the SHAP contribution."
    sql: ${feature_value} ;;
    value_format_name: decimal_3
  }

}
