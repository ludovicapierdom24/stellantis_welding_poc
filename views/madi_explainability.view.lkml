include: "/raw_views/weld_training_madi_shap_3l48.view"

view: +weld_training_madi_shap_3l48 {

  # ==========================================
  # SHAP VALUE METRICS
  # ==========================================

  measure: avg_shap_value {
    type: average
    label: "Avg SHAP Value"
    description: "Average SHAP (anomaly) contribution value across all features and events. Positive values indicate a feature that pushes the score toward anomaly."
    sql: ${shap_anomaly} ;;
    value_format_name: decimal_4
  }

  measure: avg_abs_shap {
    type: average
    label: "Avg |SHAP| (Absolute Contribution)"
    description: "Average absolute SHAP value, representing the magnitude of feature contribution regardless of direction."
    sql: ${abs_shap} ;;
    value_format_name: decimal_4
  }

  measure: max_abs_shap {
    type: max
    label: "Max |SHAP|"
    description: "Maximum absolute SHAP value in the selection, identifying the single most impactful feature contribution."
    sql: ${abs_shap} ;;
    value_format_name: decimal_4
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
    value_format_name: decimal_4
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
    value_format_name: decimal_1
  }

  measure: avg_rank_pct {
    type: average
    label: "Avg Rank Percentile"
    description: "Average percentile rank of the feature contribution (higher = more impactful)."
    sql: ${rank_pct} ;;
    value_format_name: percent_2
  }

  measure: count_top5pct_features {
    type: count
    label: "# Features in Top 5%"
    description: "Count of feature-event records where the SHAP contribution is in the top 5% of all contributions."
    filters: [in_top_5pct: "yes"]
  }

  measure: count_top10pct_features {
    type: count
    label: "# Features in Top 10%"
    description: "Count of feature-event records where the SHAP contribution is in the top 10% of all contributions."
    filters: [in_top_10pct: "yes"]
  }

  measure: count_top15pct_features {
    type: count
    label: "# Features in Top 15%"
    description: "Count of feature-event records where the SHAP contribution is in the top 15% of all contributions."
    filters: [in_top_15pct: "yes"]
  }

  # ==========================================
  # FEATURE VALUE METRICS
  # ==========================================

  measure: avg_feature_value {
    type: average
    label: "Avg Feature Value"
    description: "Average raw value of the input feature associated with the SHAP contribution."
    sql: ${feature_value} ;;
    value_format_name: decimal_4
  }

}
