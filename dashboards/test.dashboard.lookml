---
- dashboard: 02__anomaly_detection_root_cause_analysis
  title: 02. Anomaly Detection & Root Cause Analysis
  description: "Comprehensive anomaly detection dashboard with feature contribution analysis, curve correlation, and RCA insights using Isolation Forest and MADI algorithms."
  preferred_slug: AnomalyDetectionRCAv11
  layout: newspaper
  tabs:
  - name: Detection Overview
    label: Detection Overview
  - name: Feature Contribution
    label: Feature Contribution
  - name: Curve Analysis
    label: Curve Analysis
  - name: RCA Details
    label: RCA Details

  # ========================================
  # SECTION 1: DETECTION OVERVIEW
  # ========================================
  elements:
  - title: Total Detected Anomalies
    name: total_detected_anomalies
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: single_value
    fields: [summary_weldlog.count_ai_anomalies]
    filters:
      summary_weldlog.anomaly_score: "<0"
    custom_color_enabled: true
    show_single_value_title: true
    value_format: "#,##0"
    enable_conditional_formatting: true
    conditional_formatting: [{type: greater than, value: 100, background_color: "#D8291C", font_color: "#ffffff"}]
    listen:
      Date Range: plc_logs.message__weld_log__date_date
      Robot (Timer): plc_logs.message__weld_log__timer_name
      Typology: spot_sheet_details.typology
    row: 0
    col: 0
    width: 5
    height: 3
    tab_name: Detection Overview

  - title: Anomaly Score Distribution (Mean)
    name: anomaly_score_mean
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: single_value
    fields: [summary_weldlog.anomaly_score]
    filters:
      summary_weldlog.anomaly_score: "<0"
    custom_color_enabled: true
    show_single_value_title: true
    value_format: "0.000"
    enable_conditional_formatting: true
    conditional_formatting: [{type: less than, value: -0.5, background_color: "#EA4335", font_color: "#ffffff"}]
    listen:
      Date Range: plc_logs.message__weld_log__date_date
      Robot (Timer): plc_logs.message__weld_log__timer_name
      Typology: spot_sheet_details.typology
    row: 0
    col: 5
    width: 5
    height: 3
    tab_name: Detection Overview

  - title: Critical Anomalies (score < -1.0)
    name: critical_anomalies_pct
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: single_value
    fields: [summary_weldlog.count_ai_anomalies]
    filters:
      summary_weldlog.anomaly_score: "<-1"
    custom_color_enabled: true
    show_single_value_title: true
    value_format: "#,##0"
    enable_conditional_formatting: true
    conditional_formatting: [{type: greater than, value: 50, background_color: "#EA4335", font_color: "#ffffff", bold: true}]
    listen:
      Date Range: plc_logs.message__weld_log__date_date
      Robot (Timer): plc_logs.message__weld_log__timer_name
      Typology: spot_sheet_details.typology
    row: 0
    col: 10
    width: 5
    height: 3
    tab_name: Detection Overview

  - title: Anomaly Detection Rate %
    name: detection_rate
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: single_value
    fields: [summary_weldlog.defect_rate]
    filters:
      summary_weldlog.anomaly_score: "<0"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: greater than, value: 0.05, background_color: "#F9AB00", font_color: "#ffffff"}]
    listen:
      Date Range: plc_logs.message__weld_log__date_date
      Robot (Timer): plc_logs.message__weld_log__timer_name
      Typology: spot_sheet_details.typology
    row: 0
    col: 15
    width: 5
    height: 3
    tab_name: Detection Overview

  - title: Anomaly Score Timeline
    name: anomaly_score_timeline
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: looker_line
    fields: [plc_logs.message__weld_log__date_date, summary_weldlog.anomaly_score]
    filters:
      summary_weldlog.anomaly_score: "<0"
    sorts: [plc_logs.message__weld_log__date_date]
    limit: 5000
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    show_null_points: true
    interpolation: monotone
    point_style: circle
    series_colors:
      summary_weldlog.anomaly_score: "#EA4335"
    show_value_labels: false
    font_size: '10'
    listen:
      Robot (Timer): plc_logs.message__weld_log__timer_name
      Typology: spot_sheet_details.typology
    row: 3
    col: 0
    width: 12
    height: 8
    tab_name: Detection Overview

  - title: Anomalies by Robot & Shift
    name: anomalies_robot_shift
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: looker_column
    fields: [plc_logs.message__weld_log__timer_name, plc_logs.shift, summary_weldlog.count_ai_anomalies]
    pivots: [plc_logs.shift]
    filters:
      summary_weldlog.anomaly_score: "<0"
    sorts: [plc_logs.message__weld_log__timer_name]
    limit: 5000
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    y_axis_scale_mode: linear
    show_value_labels: true
    label_density: 25
    color_application:
      collection_id: bip-palette
      palette_id: bip-palette-categorical-0
      options:
        steps: 5
    series_colors:
      Shift 1: "#4285F4"
      Shift 2: "#EA4335"
      Shift 3: "#F9AB00"
    listen:
      Date Range: plc_logs.message__weld_log__date_date
      Typology: spot_sheet_details.typology
    row: 3
    col: 12
    width: 12
    height: 8
    tab_name: Detection Overview

  # ========================================
  # SECTION 2: FEATURE CONTRIBUTION ANALYSIS
  # ========================================
  - title: Feature Attribution Spider Chart (MADI)
    name: madi_feature_spider
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: marketplace_viz_spider::spider-marketplace
    fields: [madi_weld_summary.avg_attrib_current, madi_weld_summary.avg_attrib_force,
             madi_weld_summary.avg_attrib_time, madi_weld_summary.avg_attrib_wear,
             spot_sheet_details.typology]
    filters:
      plc_logs.message__weld_log__date_date: last month
      summary_weldlog.anomaly_score: "<0"
      madi_weld_summary.avg_attrib_current: NOT NULL
    sorts: [spot_sheet_details.typology desc]
    limit: 5000
    column_limit: 50
    levels: 5
    label_factor: 92
    label_fine: 24
    domain_max: 1
    rounded_strokes: true
    independent: false
    labelScale: false
    negatives: false
    wrap_width: 90
    opacity_area: 55
    dot_radius: 16
    opacity_circles: 20
    backgroundColor: "#f8f9fa"
    axisColor: "#DCE1FF"
    stroke_width: 6
    glow: 80
    axis_label_font: 11
    axis_scale_font: 12
    legend_font: 13
    legend_padding: 25
    legend_side: bottom
    series_colors:
      madi_weld_summary.avg_attrib_current: "#0031ff"
      madi_weld_summary.avg_attrib_force: "#00B9C3"
      madi_weld_summary.avg_attrib_time: "#6405BE"
      madi_weld_summary.avg_attrib_wear: "#9AA0A6"
    listen:
      Robot (Timer): plc_logs.message__weld_log__timer_name
    row: 0
    col: 0
    width: 12
    height: 10
    tab_name: Feature Contribution

  - title: Anomaly Score vs Current Actual Value
    name: scatter_anomaly_vs_current
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: looker_scatter
    fields: [plc_logs.message__weld_log__current_actual_value, summary_weldlog.anomaly_score, summary_weldlog.defect_rate]
    filters:
      summary_weldlog.anomaly_score: "<0"
      plc_logs.message__weld_log__current_actual_value: NOT NULL
    limit: 1000
    color_application:
      collection_id: bip-palette
      palette_id: bip-palette-diverging-0
    show_view_names: false
    show_legend: true
    x_axis_gridlines: true
    y_axis_gridlines: true
    y_axis_scale_mode: linear
    x_axis_scale_mode: linear
    series_colors:
      summary_weldlog.defect_rate: "#EA4335"
    point_style: circle
    show_value_labels: false
    x_axis_label: "Current (Actual Value)"
    y_axis_label: "Anomaly Score"
    listen:
      Date Range: plc_logs.message__weld_log__date_date
      Robot (Timer): plc_logs.message__weld_log__timer_name
      Typology: spot_sheet_details.typology
    row: 0
    col: 12
    width: 12
    height: 10
    tab_name: Feature Contribution

  - title: Anomaly Score vs Force Actual Value
    name: scatter_anomaly_vs_force
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: looker_scatter
    fields: [plc_logs.sg_force, summary_weldlog.anomaly_score, summary_weldlog.defect_rate]
    filters:
      summary_weldlog.anomaly_score: "<0"
      plc_logs.sg_force: NOT NULL
    limit: 1000
    color_application:
      collection_id: bip-palette
      palette_id: bip-palette-diverging-0
    show_view_names: false
    show_legend: true
    x_axis_gridlines: true
    y_axis_gridlines: true
    y_axis_scale_mode: linear
    x_axis_scale_mode: linear
    series_colors:
      summary_weldlog.defect_rate: "#EA4335"
    point_style: circle
    show_value_labels: false
    x_axis_label: "Force (SG)"
    y_axis_label: "Anomaly Score"
    listen:
      Date Range: plc_logs.message__weld_log__date_date
      Robot (Timer): plc_logs.message__weld_log__timer_name
      Typology: spot_sheet_details.typology
    row: 10
    col: 0
    width: 12
    height: 10
    tab_name: Feature Contribution

  - title: Anomaly Score vs Weld Time Actual Value
    name: scatter_anomaly_vs_time
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: looker_scatter
    fields: [summary_weldlog.weld_time_actual_value, summary_weldlog.anomaly_score, summary_weldlog.defect_rate]
    filters:
      summary_weldlog.anomaly_score: "<0"
      summary_weldlog.weld_time_actual_value: NOT NULL
    limit: 1000
    color_application:
      collection_id: bip-palette
      palette_id: bip-palette-diverging-0
    show_view_names: false
    show_legend: true
    x_axis_gridlines: true
    y_axis_gridlines: true
    y_axis_scale_mode: linear
    x_axis_scale_mode: linear
    series_colors:
      summary_weldlog.defect_rate: "#EA4335"
    point_style: circle
    show_value_labels: false
    x_axis_label: "Weld Time (Actual)"
    y_axis_label: "Anomaly Score"
    listen:
      Date Range: plc_logs.message__weld_log__date_date
      Robot (Timer): plc_logs.message__weld_log__timer_name
      Typology: spot_sheet_details.typology
    row: 10
    col: 12
    width: 12
    height: 10
    tab_name: Feature Contribution

  # ========================================
  # SECTION 3: CURVE ANALYSIS
  # ========================================
  - title: Current Curve Anomaly Pattern
    name: current_curve_anomaly
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: looker_area
    fields: [plc_logs__message__weld_log__current_curve.plc_logs__message__weld_log__current_curve,
             summary_weldlog.count_ko, summary_weldlog.count_good]
    pivots: [summary_weldlog.count_ko, summary_weldlog.count_good]
    filters:
      summary_weldlog.anomaly_score: "<0"
    limit: 500
    show_view_names: false
    y_axis_gridlines: true
    show_value_labels: false
    x_axis_label: "Curve Point Index"
    y_axis_label: "Current Curve Value"
    series_colors:
      KO: "#EA4335"
      Good: "#34A853"
    stacking: ''
    show_totals_labels: false
    interpolation: monotone
    listen:
      Date Range: plc_logs.message__weld_log__date_date
      Robot (Timer): plc_logs.message__weld_log__timer_name
      Typology: spot_sheet_details.typology
    row: 0
    col: 0
    width: 8
    height: 8
    tab_name: Curve Analysis

  - title: Force Curve Anomaly Pattern
    name: force_curve_anomaly
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: looker_area
    fields: [plc_logs__message__weld_log__force_curve.plc_logs__message__weld_log__force_curve,
             summary_weldlog.count_ko, summary_weldlog.count_good]
    pivots: [summary_weldlog.count_ko, summary_weldlog.count_good]
    filters:
      summary_weldlog.anomaly_score: "<0"
    limit: 500
    show_view_names: false
    y_axis_gridlines: true
    show_value_labels: false
    x_axis_label: "Curve Point Index"
    y_axis_label: "Force Curve Value"
    series_colors:
      KO: "#EA4335"
      Good: "#34A853"
    stacking: ''
    show_totals_labels: false
    interpolation: monotone
    listen:
      Date Range: plc_logs.message__weld_log__date_date
      Robot (Timer): plc_logs.message__weld_log__timer_name
      Typology: spot_sheet_details.typology
    row: 0
    col: 8
    width: 8
    height: 8
    tab_name: Curve Analysis

  - title: Voltage Curve Anomaly Pattern
    name: voltage_curve_anomaly
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: looker_area
    fields: [plc_logs__message__weld_log__voltage_curve.plc_logs__message__weld_log__voltage_curve,
             summary_weldlog.count_ko, summary_weldlog.count_good]
    pivots: [summary_weldlog.count_ko, summary_weldlog.count_good]
    filters:
      summary_weldlog.anomaly_score: "<0"
    limit: 500
    show_view_names: false
    y_axis_gridlines: true
    show_value_labels: false
    x_axis_label: "Curve Point Index"
    y_axis_label: "Voltage Curve Value"
    series_colors:
      KO: "#EA4335"
      Good: "#34A853"
    stacking: ''
    show_totals_labels: false
    interpolation: monotone
    listen:
      Date Range: plc_logs.message__weld_log__date_date
      Robot (Timer): plc_logs.message__weld_log__timer_name
      Typology: spot_sheet_details.typology
    row: 0
    col: 16
    width: 8
    height: 8
    tab_name: Curve Analysis

  - title: Defect Rate by Sheet Thickness & Typology
    name: defect_by_thickness_typology
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: looker_grid
    fields: [spot_sheet_details.sheet, spot_sheet_details.tth, spot_sheet_details.typology,
             summary_weldlog.defect_rate, summary_weldlog.count_ko, summary_weldlog.count_good]
    pivots: [spot_sheet_details.typology]
    filters:
      summary_weldlog.anomaly_score: "<0"
      spot_sheet_details.tth: NOT NULL
    sorts: [spot_sheet_details.sheet, spot_sheet_details.tth]
    limit: 500
    show_view_names: false
    table_theme: gray
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', fields: [summary_weldlog.defect_rate],
      cell_format: {background_color: "#0c2340", color_application: {collection_id: bip-palette, custom: {
        id: f6ea6b47-2ac3-1bb9-835b-04dfeaf810ec, label: Custom, type: continuous,
        stops: [{color: "#34A853", offset: 0}, {color: "#F9AB00", offset: 50}, {color: "#EA4335", offset: 100}]},
        options: {steps: 3, mirror: false, reverse: false, stepped: true}}, font_style: {bold: false}},
      row_format: {background_color: "#0c2340"}, apply_to: selectFields, stringValue: ''}]
    listen:
      Date Range: plc_logs.message__weld_log__date_date
      Robot (Timer): plc_logs.message__weld_log__timer_name
    row: 8
    col: 0
    width: 24
    height: 8
    tab_name: Curve Analysis

  # ========================================
  # SECTION 4: RCA DETAILS & REGISTER
  # ========================================
  - title: Anomaly Detection Register (Detailed)
    name: anomaly_detailed_register
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: looker_grid
    fields: [plc_logs.message__weld_log__prot_record_id, plc_logs.message__weld_log__date_time,
             plc_logs.message__weld_log__timer_name, plc_logs.shift, summary_weldlog.anomaly_score,
             summary_weldlog.defect_rate, plc_logs.message__weld_log__current_actual_value,
             plc_logs.sg_force, summary_weldlog.weld_time_actual_value, plc_logs.wear_percent,
             spot_sheet_details.typology, spot_sheet_details.tth]
    filters:
      summary_weldlog.anomaly_score: "<0"
    sorts: [summary_weldlog.anomaly_score, plc_logs.message__weld_log__date_time desc]
    limit: 100
    show_view_names: false
    show_row_numbers: true
    table_theme: white
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', fields: [summary_weldlog.anomaly_score],
      cell_format: {background_color: "#FCE8E6", color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
        custom: {id: a344587f-5088-d987-f187-d931880d8849, label: Custom, type: continuous,
        stops: [{color: "#ffffff", offset: 0}, {color: "#dea97d", offset: 50}, {color: "#EA4335", offset: 100}]},
        options: {steps: 5, reverse: true, stepped: false, mirror: false}}, font_style: {bold: true}},
      row_format: {}, apply_to: selectFields, stringValue: ''}]
    size_to_fit: true
    truncate_text: true
    listen:
      Date Range: plc_logs.message__weld_log__date_date
      Robot (Timer): plc_logs.message__weld_log__timer_name
      Typology: spot_sheet_details.typology
    row: 0
    col: 0
    width: 24
    height: 12
    tab_name: RCA Details

  - title: Top Anomalies by Severity (Anomaly Score < -1.0)
    name: top_anomalies_severity
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: looker_column
    fields: [plc_logs.message__weld_log__timer_name, summary_weldlog.anomaly_score, summary_weldlog.count_ai_anomalies]
    filters:
      summary_weldlog.anomaly_score: "<-1"
    sorts: [summary_weldlog.anomaly_score]
    limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_value_labels: true
    color_application:
      collection_id: bip-palette
      palette_id: bip-palette-sequential-0
    series_colors:
      summary_weldlog.anomaly_score: "#EA4335"
      summary_weldlog.count_ai_anomalies: "#4285F4"
    listen:
      Date Range: plc_logs.message__weld_log__date_date
      Typology: spot_sheet_details.typology
    row: 12
    col: 0
    width: 12
    height: 8
    tab_name: RCA Details

  - title: Anomaly Correlation Matrix (Parameters vs Defects)
    name: anomaly_correlation
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: looker_grid
    fields: [plc_logs.message__weld_log__timer_name, summary_weldlog.count_ko,
             madi_weld_summary.avg_attrib_current, madi_weld_summary.avg_attrib_force,
             madi_weld_summary.avg_attrib_time, madi_weld_summary.avg_attrib_wear]
    filters:
      summary_weldlog.anomaly_score: "<0"
      madi_weld_summary.avg_attrib_current: NOT NULL
    sorts: [summary_weldlog.count_ko desc]
    limit: 100
    show_view_names: false
    table_theme: gray
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., fields: [
        madi_weld_summary.avg_attrib_current, madi_weld_summary.avg_attrib_force,
        madi_weld_summary.avg_attrib_time, madi_weld_summary.avg_attrib_wear],
      cell_format: {color_application: {collection_id: bip-palette, custom: {
        id: heatmap-anomaly, label: Custom, type: continuous,
        stops: [{color: "#34A853", offset: 0}, {color: "#F9AB00", offset: 50}, {color: "#EA4335", offset: 100}]},
        options: {steps: 5, reverse: false, stepped: true}}, font_style: {bold: false}}}]
    listen:
      Date Range: plc_logs.message__weld_log__date_date
    row: 12
    col: 12
    width: 12
    height: 8
    tab_name: RCA Details

  # ========================================
  # FILTERS
  # ========================================
  filters:
  - name: Date Range
    title: Date Range
    type: field_filter
    default_value: last 30 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    field: plc_logs.message__weld_log__date_date

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
    explore: welding_anomaly_poc
    field: plc_logs.message__weld_log__timer_name

  - name: Typology
    title: Typology
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    field: spot_sheet_details.typology
