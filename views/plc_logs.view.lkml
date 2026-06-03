include: "/raw_views/plc_logs.view"
view: +plc_logs {

dimension: shift {
    type: string
    label: "Working Shift"
    description: "Shift classification based on the welding time."
    sql: CASE 
           WHEN EXTRACT(HOUR FROM ${message__weld_log__date_raw}) >= 6 AND EXTRACT(HOUR FROM ${message__weld_log__date_raw}) < 14 THEN '1 - Morning (06-14)'
           WHEN EXTRACT(HOUR FROM ${message__weld_log__date_raw}) >= 14 AND EXTRACT(HOUR FROM ${message__weld_log__date_raw}) < 22 THEN '2 - Afternoon (14-22)'
           ELSE '3 - Night (22-06)'
         END ;;
  }

# ==========================================
  # MEASURES: ELECTRICAL & PROCESS METRICS
  # ==========================================

  measure: average_current_actual {
    type: average
    label: "Average Current (kA)"
    group_label: "Electrical Metrics"
    sql: ${message__weld_log__current_actual_value} ;;
    value_format_name: decimal_2
  }

  measure: average_resistance_actual {
    type: average
    label: "Average Resistance (µΩ)"
    group_label: "Electrical Metrics"
    sql: ${message__weld_log__resistance_actual_value} ;;
    value_format_name: decimal_2
  }

  measure: average_stabilisation_factor {
    type: average
    label: "Average Stabilisation Factor"
    group_label: "Process Metrics"
    sql: ${message__weld_log__stabilisation_factor_act_value} ;;
    value_format_name: decimal_2
  }

  # ==========================================
  # MEASURES: EXPULSION (SPATTER) LOGIC
  # ==========================================
  # Hidden helper dimension to determine if there was an expulsion
  dimension: is_expulsion {
    type: yesno
    hidden: yes
    description: "Hidden helper dimension to determine if there was an expulsion"
    sql: ${message__weld_log__uir_expulsion_time} > 0 ;;
  }

  measure: count_expulsions {
    type: count
    label: "Number of Expulsions (Spatter)"
    group_label: "Process Metrics"
    description: "Count of welds with material expulsion."
    filters: [is_expulsion: "yes"]
  }

  measure: expulsion_rate {
    type: number
    label: "Expulsion Rate %"
    group_label: "Process Metrics"
    value_format_name: percent_2
    sql: 1.0 * ${count_expulsions} / NULLIF(${count}, 0) ;;
  }

  # ==========================================
  # MEASURES: REWELD LOGIC
  # ==========================================
  # Hidden helper dimension to determine if there was an expulsion
  dimension: is_reweld {
    type: yesno
    hidden: yes
    description: "Hidden helper dimension to determine if there was rewelded"
    sql: ${message__weld_log__reweld_active} =1 ;;
  }


  measure: count_rewelding {
    type: count
    label: "Number of Rewelding"
    group_label: "Process Metrics"
    description: "Count of welds with rewelding."
    filters: [is_reweld: "yes"]
  }

  measure: reweld_rate {
    type: number
    label: "Reweld Rate %"
    group_label: "Process Metrics"
    value_format_name: percent_2
    sql: 1.0 * ${count_rewelding} / NULLIF(${count}, 0) ;;
  }


  # ==========================================
  # MEASURES: EQUIPMENT HEALTH (WEAR)
  # ==========================================

  measure: average_wear_percent {
    type: average
    label: "Average Electrode Wear (%)"
    group_label: "Equipment Metrics"
    sql: ${message__weld_log__wear_per_cent} ;;
    value_format_name: decimal_1
  }

  measure: max_wear_percent {
    type: max
    label: "Max Electrode Wear (%)"
    group_label: "Equipment Metrics"
    description: "Maximum wear peak detected in the selected period."
    sql: ${message__weld_log__wear_per_cent} ;;
    value_format_name: decimal_1
  }

  measure: max_tip_dress_counter {
    type: max
    label: "Max Tip Dress Counter"
    group_label: "Equipment Metrics"
    description: "Maximum number of dressings reached."
    sql: ${message__weld_log__tip_dress_counter} ;;
  }
}
