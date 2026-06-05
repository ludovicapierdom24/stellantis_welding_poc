- dashboard: 01__madi_predictive_spot_welding_system
  title: 01. MADI Predictive Spot Welding System
  description: Multivariate Anomaly Detection & GenAI Root Cause Analysis for spot welding.
  preferred_slug: m4DiG3m1n1P0Crtyudfgsh
  layout: newspaper
  preferred_viewer: dashboards-next

  # ==========================================
  # TABS (Personas)
  # ==========================================
  tabs:
  - name: Executive Summary
    label: 📊 01. Executive Summary (Plant Manager)
  - name: Engineering Deep Dive
    label: 🔬 02. RCA & Engineering (Process Engineers)

  # ==========================================
  # FILTERS
  # ==========================================
  filters:
  - name: Production Date
    title: Production Date
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    explore: welding_anomaly_poc
    field: plc_logs.message__weld_log__date_date

  - name: Production Line / Robot (Timer)
    title: Production Line / Robot (Timer)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    explore: welding_anomaly_poc
    field: plc_logs.message__weld_log__timer_name

  # ==========================================
  # ELEMENTS
  # ==========================================
  elements:

  # ----------------------------------------------------
  # TAB 1: EXECUTIVE SUMMARY
  # ----------------------------------------------------

  - title: Total Analyzed Welds
    name: Total Analyzed Welds
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: single_value
    fields: [summary_weldlog.total_welds]
    value_format: "#,##0"
    listen: &dashboard_filters
      Production Date: plc_logs.message__weld_log__date_date
      Production Line / Robot (Timer): plc_logs.message__weld_log__timer_name
    row: 0
    col: 0
    width: 4
    height: 4
    tab_name: Executive Summary

  - title: Defect Rate (UT KO)
    name: Defect Rate
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: single_value
    fields: [summary_weldlog.defect_rate]
    enable_conditional_formatting: true
    conditional_formatting: [{type: greater than, value: 0.02, font_color: "#EA4335", bold: true}]
    listen: *dashboard_filters
    row: 0
    col: 4
    width: 5
    height: 4
    tab_name: Executive Summary

  - title: Estimated COPQ
    name: Estimated COPQ
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: single_value
    fields: [madi_weld_summary.estimated_copq]
    enable_conditional_formatting: true
    conditional_formatting: [{type: greater than, value: 1000, font_color: "#6405BE", bold: true}]
    listen: *dashboard_filters
    row: 0
    col: 9
    width: 5
    height: 4
    tab_name: Executive Summary

  - title: MADI AI Anomalies
    name: MADI AI Anomalies
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: single_value
    fields: [madi_weld_summary.count_ai_anomalies]
    listen: *dashboard_filters
    row: 0
    col: 14
    width: 5
    height: 4
    tab_name: Executive Summary

  - title: Max Electrode Wear %
    name: Max Electrode Wear
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: single_value
    fields: [plc_logs.max_wear_percent]
    listen: *dashboard_filters
    row: 0
    col: 19
    width: 5
    height: 4
    tab_name: Executive Summary

  - title: Predictive Flow (MADI vs Reality)
    name: Sankey Diagram
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: sankey
    fields: [madi_weld_summary.is_anomaly, summary_weldlog.ultrasound, summary_weldlog.total_welds]
    color_range: ["#0031ff", "#00B9C3", "#EA4335"]
    listen: *dashboard_filters
    row: 4
    col: 0
    width: 14
    height: 8
    tab_name: Executive Summary

  - title: Anomalies by Shift & Robot
    name: Shift Heatmap
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: looker_grid
    fields: [plc_logs.message__weld_log__timer_name, plc_logs.shift, madi_weld_summary.average_madi_score]
    pivots: [plc_logs.shift]
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#0031ff", colors: ["#EA4335", "#FCE8E6", "#ffffff"]}]
    show_view_names: false
    show_row_numbers: false
    listen: *dashboard_filters
    row: 4
    col: 14
    width: 10
    height: 8
    tab_name: Executive Summary

  # ----------------------------------------------------
  # TAB 2: RCA & ENGINEERING
  # ----------------------------------------------------

  - title: Global MADI Feature Attribution
    name: Global MADI Attribution
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: looker_column
    fields: [
      madi_weld_summary.avg_attrib_current,
      madi_weld_summary.avg_attrib_force,
      madi_weld_summary.avg_attrib_time,
      madi_weld_summary.avg_attrib_wear
    ]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_x_axis_label: false
    series_colors:
      madi_weld_summary.avg_attrib_current: "#0031ff"
      madi_weld_summary.avg_attrib_force: "#00B9C3"
      madi_weld_summary.avg_attrib_time: "#6405BE"
      madi_weld_summary.avg_attrib_wear: "#9AA0A6"
    listen: *dashboard_filters
    row: 0
    col: 0
    width: 8
    height: 8
    tab_name: Engineering Deep Dive

  - title: Resistance Signature Envelope
    name: Resistance Signature
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: looker_line
    fields: [plc_logs.message__weld_log__date_time, plc_logs.average_resistance_actual, summary_weldlog.ultrasound]
    pivots: [summary_weldlog.ultrasound]
    sorts: [plc_logs.message__weld_log__date_time]
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    interpolation: smooth
    series_colors:
      Good - plc_logs.average_resistance_actual: "#9AA0A6"
      KO - plc_logs.average_resistance_actual: "#EA4335"
    listen: *dashboard_filters
    row: 0
    col: 8
    width: 16
    height: 8
    tab_name: Engineering Deep Dive

  - title: Critical Anomalies Log & GenAI RCA
    name: Critical Anomalies Log
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: looker_grid
    fields: [
      madi_weld_summary.prot_record_id,
      plc_logs.message__weld_log__timer_name,
      summary_weldlog.ultrasound,
      madi_weld_summary.madi_score,
      madi_weld_summary.top_attributions_summary,
      madi_weld_summary.gemini_rca_text
    ]
    # Filtro applicato dinamicamente: Score negativo per isolare le anomalie
    filters:
      madi_weld_summary.madi_score: "<0"
    sorts: [madi_weld_summary.madi_score]
    limit: 50
    show_view_names: false
    show_row_numbers: false
    table_theme: white
    enable_conditional_formatting: true
    conditional_formatting: [{type: less than, value: 0, background_color: "#FCE8E6", font_color: "#EA4335", bold: true}]
    listen: *dashboard_filters
    row: 8
    col: 0
    width: 24
    height: 10
    tab_name: Engineering Deep Dive
