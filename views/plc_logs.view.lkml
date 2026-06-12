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

  dimension: cover {
    label: "Dashboard Cover"
    type: number
    sql: 1 ;;
    html:
      <div style="background-color: #202c5c; color: #f8f9fa; padding: 30px; border-radius: 8px; font-family: 'Open Sans', Arial, sans-serif; line-height: 1.6; text-align: left; width: 100%; box-sizing: border-box; white-space: normal; overflow-wrap: break-word;">

                  <div style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 15px; margin-bottom: 20px;">
                      <h2 style="color: #ffffff; margin: 0; font-size: 26px; font-weight: bold; line-height: 1.2;">🤖 Predictive Spot Welding System</h2>
                      <img src="https://www.stellantis.com/content/dam/stellantis-corporate/assets/stell-logo-white.svg" alt="Stellantis Logo" style="height: 40px; width: auto;">
                  </div>

      <hr style="border-top: 1px solid #3b4886; border-bottom: none; margin: 20px 0;">

      <p style="font-size: 15px; margin-bottom: 15px;">Welcome to the predictive monitoring system for the spot welding process. The strategic objective of this dashboard is to enhance process quality and proactively identify production bottlenecks through an advanced <strong>Anomaly Detection system with Interpretability</strong>.</p>

      <h3 style="color: #4fc3f7; margin-top: 25px; margin-bottom: 10px; font-size: 18px;">🗺️ Navigation Guide</h3>
      <p style="font-size: 15px; margin-bottom: 10px;">The dashboard is divided into three specialized monitoring environments:</p>
      <ul style="margin-bottom: 25px; font-size: 15px; padding-left: 40px;">
      <li style="margin-bottom: 10px;">📊 <strong>01. Welding System:</strong> Provides a comprehensive overview of the welding lines. It monitors overall anomaly trends, production volumes, and defect rates, breaking down data by subframe typology, robot shifts, and Tip Dress Groups to ensure total coverage.</li>
      <li style="margin-bottom: 10px;">🔬 <strong>02. Anomaly Detection Process:</strong> Dives into the performance of the Machine Learning models. It evaluates the ML anomaly detectors' metrics, quantifying defect rates against total weld volumes and identifying the optimal inspection brackets (e.g., Best Result in Top %) to streamline quality control.</li>
      <li style="margin-bottom: 6px;">🔍 <strong>03. Anomalies & Causality (Feature Contribution):</strong> The core of the system's interpretability. It isolates the exact physical and electrical parameters (such as voltage integrals, resistance, and squeeze times) causing the defects. Data is visualized dynamically via radar charts to enable rapid, targeted root-cause interventions by operators.</li>
      </ul>

      <div style="background-color: rgba(255, 255, 255, 0.08); padding: 15px 20px; border-left: 4px solid #4fc3f7; border-radius: 4px; font-size: 14px;">
      <strong>💡 Operational Note:</strong> <em>By leveraging the Feature Contributions, the AI model does not just signal a defect but guides shopfloor operators directly to the specific parameter causing the issue, significantly reducing troubleshooting time.</em>
      </div>

      </div>
      ;;
  }


    # Existing dimensions...

    # DERIVED DIMENSIONS FOR RCA
    dimension: wear_percent {
      type: number
      sql: ${message__weld_log__wear_per_cent} ;;
    }

    dimension: wear_category {
      type: string
      case: {
        when: {
          sql: ${wear_percent} < 20 ;;
          label: "Good"
        }
        when: {
          sql: ${wear_percent} >= 20 AND ${wear_percent} < 50 ;;
          label: "Acceptable"
        }
        when: {
          sql: ${wear_percent} >= 50 AND ${wear_percent} < 80 ;;
          label: "Degraded"
        }
        when: {
          sql: ${wear_percent} >= 80 ;;
          label: "Critical"
        }
      }
    }

    dimension: current_deviation {
      type: number
      sql: ABS(${message__weld_log__current_actual_value} - ${message__weld_log__current_reference_value}) ;;
    }

    dimension: sg_force {
      type: number
      sql: ${message__weld_log__sg_force} ;;
    }

    dimension: force_deviation {
      type: number
      sql: ABS(${message__weld_log__sg_force} - CAST(SPLIT(${message__weld_log__sg_force_set_point}, '_')[OFFSET(0)] AS FLOAT64)) ;;
    }

    dimension: time_deviation {
      type: number
      sql: ABS(CAST(${message__weld_log__weld_time_actual_value} AS FLOAT64) - CAST(${message__weld_log__weld_time_ref_value} AS FLOAT64)) ;;
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
    value_format: "0.00\%"
  }

  measure: max_wear_percent {
    type: max
    label: "Max Electrode Wear (%)"
    group_label: "Equipment Metrics"
    description: "Maximum wear peak detected in the selected period."
    sql: ${message__weld_log__wear_per_cent} ;;
    value_format: "0.00\%"
  }

  measure: max_tip_dress_counter {
    type: max
    label: "Max Tip Dress Counter"
    group_label: "Equipment Metrics"
    description: "Maximum number of dressings reached."
    sql: ${message__weld_log__tip_dress_counter} ;;
  }
}
