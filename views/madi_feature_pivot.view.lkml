# views/madi_feature_pivot.view.lkml

view: madi_feature_pivot {
  derived_table: {
    sql:
      SELECT
        spot_name,
        timer_name,
        Ultrasound,

      -- Aggregazioni globali per weld
      AVG(anomaly_score)                                    AS avg_anomaly_score,
      AVG(class_prob)                                       AS avg_class_prob,
      COUNT(DISTINCT original_filename)                     AS total_welds,

      -- TOP feature per abs_shap (pivot manuale sulle top feature globali)
      AVG(IF(feature = 'voltage_integral_early30',  abs_shap, NULL)) AS contrib_voltage_integral_early30,
      AVG(IF(feature = 'voltage_peak',              abs_shap, NULL)) AS contrib_voltage_peak,
      AVG(IF(feature = 'uirExpulsionTime',          abs_shap, NULL)) AS contrib_uir_expulsion_time,
      AVG(IF(feature = 'pct_delta_voltage',         abs_shap, NULL)) AS contrib_pct_delta_voltage,
      AVG(IF(feature = 'pct_delta_pulse_width',     abs_shap, NULL)) AS contrib_pct_delta_pulse_width,
      AVG(IF(feature = 'current_integral_early30',  abs_shap, NULL)) AS contrib_current_integral_early30,
      AVG(IF(feature = 'voltage_peak_early30',      abs_shap, NULL)) AS contrib_voltage_peak_early30,
      AVG(IF(feature = 'pct_delta_stabilisation_factor', abs_shap, NULL)) AS contrib_pct_delta_stabilisation_factor,
      AVG(IF(feature = 'pct_delta_current',         abs_shap, NULL)) AS contrib_pct_delta_current,
      AVG(IF(feature = 'voltage_integral',          abs_shap, NULL)) AS contrib_voltage_integral,
      AVG(IF(feature = 'pct_delta_power',           abs_shap, NULL)) AS contrib_pct_delta_power,

      -- Feature values corrispondenti (per scatter / tooltip)
      AVG(IF(feature = 'voltage_integral_early30',  feature_value, NULL)) AS val_voltage_integral_early30,
      AVG(IF(feature = 'voltage_peak',              feature_value, NULL)) AS val_voltage_peak,
      AVG(IF(feature = 'uirExpulsionTime',          feature_value, NULL)) AS val_uir_expulsion_time,
      AVG(IF(feature = 'pct_delta_voltage',         feature_value, NULL)) AS val_pct_delta_voltage,
      AVG(IF(feature = 'pct_delta_pulse_width',     feature_value, NULL)) AS val_pct_delta_pulse_width

      FROM `stellantis-molding-anomaly-det.molding_anomaly_poc.weld_training_madi_shap_labeled_dominant_3l48`
      WHERE Ultrasound IS NOT NULL   -- solo saldature etichettate
      GROUP BY
      spot_name,
      timer_name,
      Ultrasound
      ;;
  }

  # ==========================================
  # DIMENSIONS
  # ==========================================

  dimension: pk {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${spot_name}, '|', ${timer_name}, '|', ${ultrasound}) ;;
  }

  dimension: spot_name {
    type: string
    label: "Spot Name"
    sql: ${TABLE}.spot_name ;;
  }

  dimension: timer_name {
    type: string
    label: "Robot (Timer)"
    sql: ${TABLE}.timer_name ;;
  }

  dimension: ultrasound {
    type: string
    label: "Ultrasound Result"
    sql: ${TABLE}.Ultrasound ;;
  }

  # ==========================================
  # MEASURES: KPIs
  # ==========================================

  measure: avg_anomaly_score {
    type: average
    label: "Avg Anomaly Score"
    description: "Higher = more anomalous."
    value_format_name: decimal_3
    sql: ${TABLE}.avg_anomaly_score ;;
  }

  measure: avg_class_prob {
    type: average
    label: "Avg Class Probability (Normal)"
    description: "Lower = more anomalous."
    value_format_name: decimal_3
    sql: ${TABLE}.avg_class_prob ;;
  }

  measure: total_welds {
    type: sum
    label: "Total Welds"
    sql: ${TABLE}.total_welds ;;
  }

  # ==========================================
  # MEASURES: FEATURE CONTRIBUTIONS (Spider)
  # ==========================================

  measure: contrib_voltage_integral_early30 {
    type: average
    label: "Contribution: Voltage Integral Early30"
    group_label: "Feature Contributions (SHAP)"
    value_format_name: percent_2
    sql: ${TABLE}.contrib_voltage_integral_early30 ;;
  }

  measure: contrib_voltage_peak {
    type: average
    label: "Contribution: Voltage Peak"
    group_label: "Feature Contributions (SHAP)"
    value_format_name: percent_2
    sql: ${TABLE}.contrib_voltage_peak ;;
  }

  measure: contrib_uir_expulsion_time {
    type: average
    label: "Contribution: UIR Expulsion Time"
    group_label: "Feature Contributions (SHAP)"
    value_format_name: percent_2
    sql: ${TABLE}.contrib_uir_expulsion_time ;;
  }

  measure: contrib_pct_delta_voltage {
    type: average
    label: "Contribution: Δ Voltage %"
    group_label: "Feature Contributions (SHAP)"
    value_format_name: percent_2
    sql: ${TABLE}.contrib_pct_delta_voltage ;;
  }

  measure: contrib_pct_delta_pulse_width {
    type: average
    label: "Contribution: Δ Pulse Width %"
    group_label: "Feature Contributions (SHAP)"
    value_format_name: percent_2
    sql: ${TABLE}.contrib_pct_delta_pulse_width ;;
  }

  measure: contrib_current_integral_early30 {
    type: average
    label: "Contribution: Current Integral Early30"
    group_label: "Feature Contributions (SHAP)"
    value_format_name: percent_2
    sql: ${TABLE}.contrib_current_integral_early30 ;;
  }

  measure: contrib_voltage_peak_early30 {
    type: average
    label: "Contribution: Voltage Peak Early30"
    group_label: "Feature Contributions (SHAP)"
    value_format_name: percent_2
    sql: ${TABLE}.contrib_voltage_peak_early30 ;;
  }

  measure: contrib_pct_delta_stabilisation_factor {
    type: average
    label: "Contribution: Δ Stabilisation Factor %"
    group_label: "Feature Contributions (SHAP)"
    value_format_name: percent_2
    sql: ${TABLE}.contrib_pct_delta_stabilisation_factor ;;
  }

  measure: contrib_pct_delta_current {
    type: average
    label: "Contribution: Δ Current %"
    group_label: "Feature Contributions (SHAP)"
    value_format_name: percent_2
    sql: ${TABLE}.contrib_pct_delta_current ;;
  }

  measure: contrib_voltage_integral {
    type: average
    label: "Contribution: Voltage Integral"
    group_label: "Feature Contributions (SHAP)"
    value_format_name: percent_2
    sql: ${TABLE}.contrib_voltage_integral ;;
  }

  measure: contrib_pct_delta_power {
    type: average
    label: "Contribution: Δ Power %"
    group_label: "Feature Contributions (SHAP)"
    value_format_name: percent_2
    sql: ${TABLE}.contrib_pct_delta_power ;;
  }

  # ==========================================
  # MEASURES: FEATURE VALUES (per scatter/tooltip)
  # ==========================================

  measure: val_voltage_integral_early30 {
    type: average
    label: "Value: Voltage Integral Early30"
    group_label: "Feature Values"
    value_format_name: decimal_2
    sql: ${TABLE}.val_voltage_integral_early30 ;;
  }

  measure: val_voltage_peak {
    type: average
    label: "Value: Voltage Peak"
    group_label: "Feature Values"
    value_format_name: decimal_2
    sql: ${TABLE}.val_voltage_peak ;;
  }

  measure: val_uir_expulsion_time {
    type: average
    label: "Value: UIR Expulsion Time"
    group_label: "Feature Values"
    value_format_name: decimal_2
    sql: ${TABLE}.val_uir_expulsion_time ;;
  }

  measure: val_pct_delta_voltage {
    type: average
    label: "Value: Δ Voltage %"
    group_label: "Feature Values"
    value_format_name: decimal_2
    sql: ${TABLE}.val_pct_delta_voltage ;;
  }

  measure: val_pct_delta_pulse_width {
    type: average
    label: "Value: Δ Pulse Width %"
    group_label: "Feature Values"
    value_format_name: decimal_2
    sql: ${TABLE}.val_pct_delta_pulse_width ;;
  }
}
