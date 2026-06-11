include: "/raw_views/v_madi_kpi_dominant_3l48.view"

view: +v_madi_kpi_dominant_3l48 {

  # ==========================================
  # KPI LIFT & DETECTION METRICS
  # ==========================================

  measure: avg_lift {
    type: average
    label: "Avg Lift"
    description: "Average lift of the MADI model: ratio of defect concentration in the top-scored welds versus random selection. A lift > 1 means the model is better than random."
    sql: ${lift} ;;
    value_format_name: decimal_2
  }

  measure: max_lift {
    type: max
    label: "Max Lift"
    description: "Maximum lift achieved by the MADI model across all scored periods."
    sql: ${lift} ;;
    value_format_name: decimal_2
  }

  # ==========================================
  # KO (DEFECT) COUNTS IN TOP %
  # ==========================================

  measure: total_ko_in_top {
    type: sum
    label: "Total KO in Top %"
    description: "Total number of KO (defective) welds found within the top-scored percentage of welds."
    sql: ${n_ko_top} ;;
  }

  measure: total_ko_overall {
    type: sum
    label: "Total KO Overall"
    description: "Total number of KO (defective) welds across all scored welds."
    sql: ${n_ko_total} ;;
  }

  measure: total_labeled {
    type: sum
    label: "Total Labeled Welds"
    description: "Total number of welds that have been manually labeled for model evaluation."
    sql: ${n_labeled} ;;
  }

  measure: total_in_top {
    type: sum
    label: "Total Welds in Top %"
    description: "Total number of welds included in the top-scored percentage bucket."
    sql: ${n_top} ;;
  }

  # ==========================================
  # PRECISION METRIC
  # ==========================================

  measure: avg_pct_ko_in_top {
    type: average
    label: "Avg Precision in Top %"
    description: "Average percentage of KO welds within the top-scored bucket (precision of the model at the selected threshold)."
    sql: ${pct_ko_top} ;;
    value_format_name: percent_2
  }

  measure: max_pct_ko_in_top {
    type: max
    label: "Max Precision in Top %"
    description: "Maximum precision (% KO in top %) achieved across all periods or configurations."
    sql: ${pct_ko_top} ;;
    value_format_name: percent_2
  }

  # ==========================================
  # RECALL METRIC
  # ==========================================

  measure: recall_in_top {
    type: number
    label: "Recall in Top %"
    description: "Recall of the model: proportion of all KO welds that fall within the top-scored bucket (KO captured / total KO)."
    sql: SAFE_DIVIDE(SUM(${n_ko_top}), NULLIF(SUM(${n_ko_total}), 0)) ;;
    value_format_name: percent_2
  }

}
