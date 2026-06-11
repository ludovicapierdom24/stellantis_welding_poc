include: "/raw_views/weld_training_scores_madi_3l48.view"

view: +weld_training_scores_madi_3l48 {

  # ==========================================
  # ANOMALY SCORE METRICS
  # ==========================================

  measure: average_anomaly_score {
    type: average
    label: "Avg Anomaly Score"
    description: "Average MADI anomaly score across all scored welding events."
    sql: ${anomaly_score} ;;
    value_format_name: percent_2
  }

  measure: max_anomaly_score {
    type: max
    label: "Max Anomaly Score"
    description: "Maximum MADI anomaly score detected in the selected period."
    sql: ${anomaly_score} ;;
    value_format_name: percent_2
  }

  measure: min_anomaly_score {
    type: min
    label: "Min Anomaly Score"
    description: "Minimum MADI anomaly score detected in the selected period."
    sql: ${anomaly_score} ;;
    value_format_name: percent_2
  }

  measure: average_class_prob {
    type: average
    label: "Avg Classification Probability"
    description: "Average probability assigned by the MADI model that a weld is anomalous."
    sql: ${class_prob} ;;
    value_format_name: percent_2
  }

  # ==========================================
  # ANOMALY DETECTION COUNTS
  # ==========================================

  measure: total_scored_welds {
    type: count
    label: "Total Scored Welds"
    description: "Total number of welding events that have been scored by the MADI model."
  }

  measure: count_anomalies {
    type: count
    label: "# Anomalies Detected"
    description: "Number of welds classified as anomalous (anomaly_score > 0.5)."
    filters: [anomaly_score: ">0.5"]
  }

  measure: anomaly_rate {
    type: number
    label: "Anomaly Rate"
    description: "Percentage of scored welds classified as anomalous (anomaly_score > 0.5)."
    sql: SAFE_DIVIDE(${count_anomalies}, ${total_scored_welds}) ;;
    value_format_name: percent_2
  }

  measure: count_dominant_stack {
    type: count
    label: "# Dominant Stack Events"
    description: "Count of weld events belonging to the dominant material stack configuration."
    filters: [is_dominant_stack: "yes"]
  }

  measure: count_labeled {
    type: count
    label: "# Labeled Welds"
    description: "Count of welds that have been manually labeled for supervised evaluation."
    filters: [is_labeled: "yes"]
  }

  # ==========================================
  # MADI SAMPLE METRICS
  # ==========================================

  measure: average_madi_sample_ratio {
    type: average
    label: "Avg MADI Sample Ratio"
    description: "Average ratio of the MADI sample score relative to the training distribution."
    sql: ${madi_sample_ratio} ;;
    value_format_name: decimal_4
  }

  measure: average_madi_sample_delta {
    type: average
    label: "Avg MADI Sample Delta"
    description: "Average delta between the current MADI sample score and the reference baseline."
    sql: ${madi_sample_delta} ;;
    value_format_name: decimal_4
  }

  measure: average_train_recent_quantile {
    type: average
    label: "Avg Train Recent Quantile"
    description: "Average quantile position of the anomaly score within the recent training distribution."
    sql: ${train_recent_quantile} ;;
    value_format_name: percent_2
  }

}
