include: "/raw_views/weld_training_features_3l48.view"

view: +weld_training_features_3l48 {

  # ==========================================
  # WELD COUNT METRICS
  # ==========================================

  measure: total_weld_events {
    type: count
    label: "Total Weld Events"
    description: "Total number of welding events with feature data available."
  }

  measure: count_labeled_features {
    type: count
    label: "# Labeled Events"
    description: "Count of welding events that have been manually labeled."
    filters: [is_labeled: "yes"]
  }

  measure: count_dominant_stack_features {
    type: count
    label: "# Dominant Stack Events"
    description: "Count of welding events belonging to the dominant material stack."
    filters: [is_dominant_stack: "yes"]
  }

  # ==========================================
  # CURRENT METRICS
  # ==========================================

  measure: avg_current_peak {
    type: average
    label: "Avg Current Peak"
    description: "Average peak current value recorded during the weld."
    sql: ${current_peak} ;;
    value_format_name: decimal_2
  }

  measure: avg_current_integral {
    type: average
    label: "Avg Current Integral"
    description: "Average integral of the current curve over the full weld duration."
    sql: ${current_integral} ;;
    value_format_name: decimal_2
  }

  measure: avg_pct_delta_current {
    type: average
    label: "Avg % Delta Current"
    description: "Average percentage deviation of current from the reference baseline."
    sql: ${pct_delta_current} ;;
    value_format_name: percent_2
  }

  # ==========================================
  # ENERGY & POWER METRICS
  # ==========================================

  measure: avg_power_peak {
    type: average
    label: "Avg Power Peak"
    description: "Average peak power value recorded during the weld."
    sql: ${power_peak} ;;
    value_format_name: decimal_2
  }

  measure: avg_power_integral {
    type: average
    label: "Avg Power Integral"
    description: "Average integral of the power curve over the full weld duration."
    sql: ${power_integral} ;;
    value_format_name: decimal_2
  }

  measure: avg_pct_delta_energy {
    type: average
    label: "Avg % Delta Energy"
    description: "Average percentage deviation of energy from the reference baseline."
    sql: ${pct_delta_energy} ;;
    value_format_name: percent_2
  }

  # ==========================================
  # RESISTANCE METRICS
  # ==========================================

  measure: avg_resistance_peak {
    type: average
    label: "Avg Resistance Peak"
    description: "Average peak resistance value recorded during the weld."
    sql: ${resistance_peak} ;;
    value_format_name: decimal_4
  }

  measure: avg_resistance_integral {
    type: average
    label: "Avg Resistance Integral"
    description: "Average integral of the resistance curve over the full weld duration."
    sql: ${resistance_integral} ;;
    value_format_name: decimal_4
  }

  measure: avg_pct_delta_resistance {
    type: average
    label: "Avg % Delta Resistance"
    description: "Average percentage deviation of resistance from the reference baseline."
    sql: ${pct_delta_resistance} ;;
    value_format_name: percent_2
  }

  # ==========================================
  # VOLTAGE METRICS
  # ==========================================

  measure: avg_voltage_peak {
    type: average
    label: "Avg Voltage Peak"
    description: "Average peak voltage recorded during the weld."
    sql: ${voltage_peak} ;;
    value_format_name: decimal_2
  }

  measure: avg_pct_delta_voltage {
    type: average
    label: "Avg % Delta Voltage"
    description: "Average percentage deviation of voltage from the reference baseline."
    sql: ${pct_delta_voltage} ;;
    value_format_name: percent_2
  }

  # ==========================================
  # WELD TIME METRICS
  # ==========================================

  measure: avg_pct_delta_weld_time {
    type: average
    label: "Avg % Delta Weld Time"
    description: "Average percentage deviation of weld time from the reference value."
    sql: ${pct_delta_weld_time} ;;
    value_format_name: percent_2
  }

  # ==========================================
  # ELECTRODE WEAR METRICS
  # ==========================================

  measure: avg_wear_per_cent {
    type: average
    label: "Avg Electrode Wear %"
    description: "Average electrode wear percentage across all weld events."
    sql: ${wear_per_cent} ;;
    value_format_name: percent_2
  }

  measure: max_tip_dress_counter {
    type: max
    label: "Max Tip Dress Counter"
    description: "Maximum tip dressing counter value observed."
    sql: ${tip_dress_counter} ;;
  }

  measure: avg_pct_delta_stabilisation_factor {
    type: average
    label: "Avg % Delta Stabilisation Factor"
    description: "Average percentage deviation of the stabilisation factor from the reference."
    sql: ${pct_delta_stabilisation_factor} ;;
    value_format_name: percent_2
  }

}
