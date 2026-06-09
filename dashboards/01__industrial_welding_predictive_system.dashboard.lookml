- dashboard: 01__industrial_welding_predictive_system
  title: 01. Industrial Welding Predictive System
  crossfilter_enabled: true
  description: Predictive monitoring and Root Cause Analysis for the spot welding process. (MADI Model)
  preferred_slug: Va4BG2XNgknfzpce8n2I1U
  layout: newspaper
  
  # ==========================================
  # TABS
  # ==========================================
  tabs:
  - name: Cover Page
    label: Cover Page
  - name: "📊 01. Executive Summary"
    label: "📊 01. Executive Summary"
  - name: "🔬 02. RCA & Engineering"
    label: "🔬 02. RCA & Engineering"

  # ==========================================
  # FILTERS
  # ==========================================
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: '7 days'
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: stellantis_welding_poc
    explore: stellantis_molding_anomaly_det
    field: weld_training_features_3l48.time_stamp_date
  
  - name: Robot (Timer)
    title: Robot (Timer)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: stellantis_welding_poc
    explore: stellantis_molding_anomaly_det
    field: weld_training_features_3l48.timer_name
  
  - name: Composition (Typology)
    title: Composition (Typology)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: stellantis_welding_poc
    explore: stellantis_molding_anomaly_det
    field: weld_training_features_3l48.composition
  
  - name: Spot Name ID
    title: Spot Name ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: stellantis_welding_poc
    explore: stellantis_molding_anomaly_det
    field: weld_training_features_3l48.spot_name

  # ==========================================
  # ELEMENTS
  # ==========================================
  elements:

  # ----------------------------------------------------
  # COVER PAGE
  # ----------------------------------------------------
  - name: Cover Page HTML
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="background-color: #202c5c; color: #f8f9fa; padding: 30px; border-radius: 8px; font-family: 'Open Sans', Arial, sans-serif; line-height: 1.6; text-align: left; width: 100%; box-sizing: border-box; white-space: normal; overflow-wrap: break-word;">
          <div style="position: relative; text-align: center; margin-bottom: 20px; min-height: 50px;">
              <h2 style="color: #ffffff; margin: 0; font-size: 26px; font-weight: bold; line-height: 50px;">🤖 Predictive Spot Welding System</h2>
              <img src="https://www.stellantis.com/content/dam/stellantis-corporate/assets/stell-logo-white.svg" alt="Stellantis Logo" style="position: absolute; right: 0; top: 50%; transform: translateY(-50%); height: 45px;">
          </div>
          <hr style="border-top: 1px solid #3b4886; border-bottom: none; margin: 20px 0;">
          <p style="font-size: 15px; margin-bottom: 15px;">Welcome to the predictive monitoring system for the spot welding process. This dashboard combines the analysis of high-frequency telemetric data (PLC) with advanced Artificial Intelligence models to reduce scrap rates and optimize maintenance.</p>
          <h3 style="color: #4fc3f7; margin-top: 25px; margin-bottom: 10px; font-size: 18px;">🎯 Platform Objectives</h3>
          <p style="font-size: 15px; margin-bottom: 10px;">This solution marks the transition from a reactive approach to a <strong>predictive and proactive approach</strong>.</p>
      </div>
    row: 0
    col: 0
    width: 24
    height: 10
    tab_name: Cover Page

  # ----------------------------------------------------
  # TAB 1: EXECUTIVE SUMMARY
  # ----------------------------------------------------
  - title: Total Welds
    name: Total Welds
    model: stellantis_welding_poc
    explore: stellantis_molding_anomaly_det
    type: single_value
    fields: [weld_training_features_3l48.count]
    value_format: "#,##0"
    listen: &dashboard_filters
      Date: weld_training_features_3l48.time_stamp_date
      Robot (Timer): weld_training_features_3l48.timer_name
      Composition (Typology): weld_training_features_3l48.composition
      Spot Name ID: weld_training_features_3l48.spot_name
    row: 0
    col: 0
    width: 6
    height: 4
    tab_name: "📊 01. Executive Summary"

  - title: Defect Rate (UT KO)
    name: Defect Rate
    model: stellantis_welding_poc
    explore: stellantis_molding_anomaly_det
    type: single_value
    fields: [defect_rate]
    dynamic_fields:
    - category: measure
      expression: ''
      label: Defect Rate
      value_format_name: percent_2
      based_on: weld_training_features_3l48.y
      measure: defect_rate
      type: average
    enable_conditional_formatting: true
    conditional_formatting: [{type: greater than, value: 0.05, font_color: "#EA4335", bold: true}]
    listen: *dashboard_filters
    row: 0
    col: 6
    width: 6
    height: 4
    tab_name: "📊 01. Executive Summary"

  - title: MADI Anomalies
    name: Anomalies
    model: stellantis_welding_poc
    explore: stellantis_molding_anomaly_det
    type: single_value
    fields: [count_anomalies]
    dynamic_fields:
    - category: measure
      expression: ''
      label: MADI Anomalies
      measure: count_anomalies
      type: count_distinct
      sql: CASE WHEN ${weld_training_scores_madi_3l48.anomaly_score} < 0 THEN ${weld_training_features_3l48.original_filename} ELSE NULL END ;;
    enable_conditional_formatting: true
    conditional_formatting: [{type: greater than, value: 0, font_color: "#EA928B", bold: true}]
    listen: *dashboard_filters
    row: 0
    col: 12
    width: 6
    height: 4
    tab_name: "📊 01. Executive Summary"

  - title: Max Electrode Wear
    name: Max Wear per Cent
    model: stellantis_welding_poc
    explore: stellantis_molding_anomaly_det
    type: single_value
    fields: [max_wear]
    dynamic_fields:
    - category: measure
      expression: ''
      label: Max Wear
      based_on: weld_training_features_3l48.wear_per_cent
      measure: max_wear
      type: max
    enable_conditional_formatting: true
    conditional_formatting: [{type: greater than, value: 80, font_color: "#D8291C", bold: true}]
    listen: *dashboard_filters
    row: 0
    col: 18
    width: 6
    height: 4
    tab_name: "📊 01. Executive Summary"

  - title: Anomalies Trend
    name: Anomalies Trend
    model: stellantis_welding_poc
    explore: stellantis_molding_anomaly_det
    type: looker_column
    fields: [weld_training_features_3l48.time_stamp_date, count_ko, weld_training_features_3l48.count]
    dynamic_fields:
    - category: measure
      expression: ''
      label: Total KO
      based_on: weld_training_features_3l48.y
      measure: count_ko
      type: sum
    sorts: [weld_training_features_3l48.time_stamp_date]
    limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    series_colors:
      count_ko: "#D8291C"
      weld_training_features_3l48.count: "#4285F4"
    listen: *dashboard_filters
    row: 4
    col: 0
    width: 12
    height: 8
    tab_name: "📊 01. Executive Summary"

  - title: Defect Rate by Tip Dress Group
    name: Defect Rate by Tip Dress
    model: stellantis_welding_poc
    explore: stellantis_molding_anomaly_det
    type: looker_line
    fields: [tip_dress_group, defect_rate, avg_wear]
    dynamic_fields:
    - category: dimension
      label: Tip Dress Group
      calculation_type: bin
      dimension: tip_dress_group
      args: [weld_training_features_3l48.tip_dress_counter, '10', '0', '40', classic]
    - category: measure
      label: Defect Rate
      based_on: weld_training_features_3l48.y
      measure: defect_rate
      type: average
      value_format_name: percent_2
    - category: measure
      label: Average Wear
      based_on: weld_training_features_3l48.wear_per_cent
      measure: avg_wear
      type: average
    sorts: [tip_dress_group]
    limit: 50
    series_colors:
      defect_rate: "#EA4335"
      avg_wear: "#9AA0A6"
    listen: *dashboard_filters
    row: 4
    col: 12
    width: 12
    height: 8
    tab_name: "📊 01. Executive Summary"

  # ----------------------------------------------------
  # TAB 2: RCA & ENGINEERING
  # ----------------------------------------------------
  - title: 'Anomalies: Physical Deviations (Spider)'
    name: 'Anomalies: Feature Contribution'
    model: stellantis_welding_poc
    explore: stellantis_molding_anomaly_det
    type: marketplace_viz_spider::spider-marketplace
    # Using the provided deviation % while waiting for MADI weights
    fields: [weld_training_features_3l48.composition, avg_delta_curr, avg_delta_res, avg_delta_volt, avg_delta_power]
    dynamic_fields:
    - category: measure
      label: Avg Delta Current %
      based_on: weld_training_features_3l48.pct_delta_current
      measure: avg_delta_curr
      type: average
    - category: measure
      label: Avg Delta Resistance %
      based_on: weld_training_features_3l48.pct_delta_resistance
      measure: avg_delta_res
      type: average
    - category: measure
      label: Avg Delta Voltage %
      based_on: weld_training_features_3l48.pct_delta_voltage
      measure: avg_delta_volt
      type: average
    - category: measure
      label: Avg Delta Power %
      based_on: weld_training_features_3l48.pct_delta_power
      measure: avg_delta_power
      type: average
    filters:
      weld_training_scores_madi_3l48.anomaly_score: "<0"
    sorts: [weld_training_features_3l48.composition desc]
    limit: 500
    backgroundColor: "#adc9ed"
    series_colors:
      avg_delta_curr: "#0031ff"
      avg_delta_res: "#00B9C3"
      avg_delta_volt: "#6405BE"
      avg_delta_power: "#EA4335"
    listen: *dashboard_filters
    row: 0
    col: 0
    width: 12
    height: 9
    tab_name: "🔬 02. RCA & Engineering"

  - title: MADI Anomaly Log Register
    name: Anomaly Register
    model: stellantis_welding_poc
    explore: stellantis_molding_anomaly_det
    type: looker_grid
    fields: [
      weld_training_features_3l48.original_filename, 
      weld_training_features_3l48.time_stamp_time, 
      weld_training_features_3l48.timer_name, 
      weld_training_features_3l48.composition,
      weld_training_scores_madi_3l48.anomaly_score, 
      weld_training_features_3l48.ultrasound
    ]
    filters:
      weld_training_scores_madi_3l48.anomaly_score: "<0"
    sorts: [weld_training_scores_madi_3l48.anomaly_score]
    limit: 50
    show_view_names: false
    show_row_numbers: false
    table_theme: white
    enable_conditional_formatting: true
    conditional_formatting: [{type: less than, value: 0, background_color: "#FCE8E6", font_color: "#EA4335", bold: true}]
    listen: *dashboard_filters
    row: 0
    col: 12
    width: 12
    height: 9
    tab_name: "🔬 02. RCA & Engineering"