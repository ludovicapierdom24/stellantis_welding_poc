- dashboard: 01__predictive_spot_welding_system
  title: 01. Predictive Spot Welding System
  description: Predictive monitoring and Root Cause Analysis for the spot welding process.
  preferred_slug: Va4BG2XNgknfzpce8n2I1U
  layout: newspaper
  tabs:
  - name: Process Overview
    label: Process Overview
  - name: Anomaly Score
    label: Anomaly Score
  elements:
  - title: Total Analyzed Welds
    name: Total Analyzed Welds
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: single_value
    fields: [summary_weldlog.total_welds]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    enable_conditional_formatting: false
    value_format: "#,##0"
    listen:
      Production Line / Robot (Timer): plc_logs.message__weld_log__timer_name
      Voltage Curve: plc_logs__message__weld_log__voltage_curve.plc_logs__message__weld_log__voltage_curve
      Anomaly Score: summary_weldlog.anomaly_score
      Production Date: plc_logs.message__weld_log__date_date
    row: 0
    col: 0
    width: 6
    height: 4
    tab_name: Process Overview
  - title: Defect Rate
    name: Defect Rate
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: single_value
    fields: [summary_weldlog.defect_rate]
    custom_color_enabled: true
    show_single_value_title: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: greater than, value: 0.02, background_color: "#EA4335",
        font_color: "#ffffff", color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810609}, bold: false, italic: false,
        strikethrough: false, format: ''}]
    listen:
      Production Line / Robot (Timer): plc_logs.message__weld_log__timer_name
      Voltage Curve: plc_logs__message__weld_log__voltage_curve.plc_logs__message__weld_log__voltage_curve
      Anomaly Score: summary_weldlog.anomaly_score
      Production Date: plc_logs.message__weld_log__date_date
    row: 0
    col: 6
    width: 6
    height: 4
    tab_name: Process Overview
  - title: Detected Anomalies (Isolation Forest)
    name: Detected Anomalies (Isolation Forest)
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: single_value
    fields: [summary_weldlog.count_ai_anomalies]
    custom_color_enabled: true
    show_single_value_title: true
    listen:
      Production Line / Robot (Timer): plc_logs.message__weld_log__timer_name
      Voltage Curve: plc_logs__message__weld_log__voltage_curve.plc_logs__message__weld_log__voltage_curve
      Anomaly Score: summary_weldlog.anomaly_score
      Production Date: plc_logs.message__weld_log__date_date
    row: 0
    col: 12
    width: 6
    height: 4
    tab_name: Process Overview
  - title: Max Electrode Wear Status
    name: Max Electrode Wear Status
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: single_value
    fields: [plc_logs.max_wear_percent]
    custom_color_enabled: true
    show_single_value_title: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: greater than, value: 80, font_color: "#F9AB00",
        bold: true}]
    listen:
      Production Line / Robot (Timer): plc_logs.message__weld_log__timer_name
      Voltage Curve: plc_logs__message__weld_log__voltage_curve.plc_logs__message__weld_log__voltage_curve
      Anomaly Score: summary_weldlog.anomaly_score
      Production Date: plc_logs.message__weld_log__date_date
    row: 0
    col: 18
    width: 6
    height: 4
    tab_name: Process Overview
  - title: Physical Clustering (Current vs Resistance)
    name: Physical Clustering (Current vs Resistance)
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: looker_scatter
    fields: [plc_logs.average_current_actual, plc_logs.average_resistance_actual,
      summary_weldlog.ultrasound, plc_logs.message__weld_log__spot_name]
    pivots: [summary_weldlog.ultrasound]
    sorts: [summary_weldlog.ultrasound, plc_logs.average_current_actual desc 0]
    limit: 5000
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: left
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      Good - plc_logs.average_resistance_actual: "#9AA0A6"
      KO - plc_logs.average_resistance_actual: "#EA4335"
    interpolation: linear
    defaults_version: 1
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      Production Line / Robot (Timer): plc_logs.message__weld_log__timer_name
      Voltage Curve: plc_logs__message__weld_log__voltage_curve.plc_logs__message__weld_log__voltage_curve
      Anomaly Score: summary_weldlog.anomaly_score
      Production Date: plc_logs.message__weld_log__date_date
    row: 4
    col: 0
    width: 12
    height: 9
    tab_name: Process Overview
  - title: Wear Impact on Defect Rate
    name: Wear Impact on Defect Rate
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: looker_column
    fields: [plc_logs.message__weld_log__wear_per_cent, summary_weldlog.total_welds,
      summary_weldlog.defect_rate]
    sorts: [plc_logs.message__weld_log__wear_per_cent]
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: Weld Volume, orientation: left, series: [{axisId: summary_weldlog.total_welds,
            id: summary_weldlog.total_welds, name: Total Analyzed Welds}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}, {label: Defect Rate, orientation: right, series: [{axisId: summary_weldlog.defect_rate,
            id: summary_weldlog.defect_rate, name: Defect Rate %}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    series_types:
      summary_weldlog.defect_rate: line
    series_colors:
      summary_weldlog.total_welds: "#4285F4"
      summary_weldlog.defect_rate: "#EA4335"
    listen:
      Production Line / Robot (Timer): plc_logs.message__weld_log__timer_name
      Voltage Curve: plc_logs__message__weld_log__voltage_curve.plc_logs__message__weld_log__voltage_curve
      Anomaly Score: summary_weldlog.anomaly_score
      Production Date: plc_logs.message__weld_log__date_date
    row: 4
    col: 12
    width: 12
    height: 9
    tab_name: Process Overview
  - title: Recent Critical Anomalies Log
    name: Recent Critical Anomalies Log
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: looker_grid
    fields: [plc_logs.message__weld_log__prot_record_id, plc_logs.message__weld_log__date_time,
      plc_logs.message__weld_log__timer_name, summary_weldlog.anomaly_score, summary_weldlog.ultrasound]
    filters:
      summary_weldlog.anomaly_score: "<0"
    sorts: [summary_weldlog.anomaly_score]
    limit: 50
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    enable_conditional_formatting: true
    conditional_formatting: [{type: less than, value: 0, background_color: "#FCE8E6",
        font_color: "#EA4335", color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810609}, bold: true, italic: false,
        strikethrough: false, format: ''}]
    listen:
      Production Line / Robot (Timer): plc_logs.message__weld_log__timer_name
      Voltage Curve: plc_logs__message__weld_log__voltage_curve.plc_logs__message__weld_log__voltage_curve
      Anomaly Score: summary_weldlog.anomaly_score
      Production Date: plc_logs.message__weld_log__date_date
    row: 13
    col: 0
    width: 24
    height: 7
    tab_name: Process Overview
  - title: Anomalies by Sheets and Thickness
    name: Anomalies by Sheets and Thickness
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: looker_area
    fields: [spot_sheet_details.sheet, spot_sheet_details.tth, summary_weldlog.count_ai_anomalies]
    pivots: [spot_sheet_details.sheet]
    sorts: [spot_sheet_details.sheet, summary_weldlog.count_ai_anomalies desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: bip-palette
      palette_id: bip-palette-categorical-0
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      2.0 - summary_weldlog.count_ai_anomalies: "#EA928B"
      3.0 - summary_weldlog.count_ai_anomalies: "#D8291C"
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_pivots:
      spot_sheet_details.sheet___null:
        is_entire_pivot_hidden: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Production Date: plc_logs.message__weld_log__date_date
    row: 0
    col: 0
    width: 11
    height: 8
    tab_name: Anomaly Score
  - title: Anomalies by Sheets and Thickness Table
    name: Anomalies by Sheets and Thickness (2)
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: looker_grid
    fields: [spot_sheet_details.sheet, spot_sheet_details.tth, summary_weldlog.defect_rate]
    pivots: [spot_sheet_details.sheet]
    filters:
      spot_sheet_details.tth: NOT NULL
    sorts: [spot_sheet_details.sheet, spot_sheet_details.tth]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: summary_weldlog.anomaly_score
      expression: ''
      label: Average of Anomaly Score
      measure: average_of_anomaly_score
      type: average
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: bip-palette
      palette_id: bip-palette-categorical-0
      options:
        steps: 5
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      summary_weldlog.defect_rate:
        is_active: false
    table_show_footer: false
    table_enable_pagination: false
    table_page_size_options: 20, 50, 100
    table_column_hover_highlight_enable: false
    table_show_headers: true
    header_font_bold: false
    header_font_italic: false
    cell_font_weight: ''
    cell_font_style: ''
    cell_text_alignment: ''
    table_custom_border_enable: true
    table_custom_border_width:
    table_custom_border_color: "#7890C7"
    table_custom_border_style: solid
    conditional_formatting: [{type: along a scale..., value: !!null '', fields: [
          summary_weldlog.defect_rate], apply_formatting_to_row: false, cell_format: {
          background_color: "#0c2340", font_color: !!null '', color_application: {
            collection_id: bip-palette, custom: {id: f6ea6b47-2ac3-1bb9-835b-04dfeaf810ec,
              label: Custom, type: continuous, stops: [{color: "#D8291C", offset: 0},
                {color: "#EA928B", offset: 25}, {color: "#deb998", offset: 50}, {
                  color: "#c7ba84", offset: 75}, {color: "#e8cb65", offset: 100}]},
            options: {steps: 3, mirror: false, reverse: true, stepped: true}}, font_style: {
            bold: false, italic: false, strikethrough: false}}, row_format: {background_color: "#0c2340",
          font_color: !!null '', color_application: {collection_id: bip-palette, options: {
              mirror: false, reverse: false, stepped: false}, palette_id: bip-palette-diverging-0},
          font_style: {bold: false, italic: false, strikethrough: false}}, field: spot_sheet_details.tth,
        apply_to: selectFields, stringValue: ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      2.0 - summary_weldlog.count_ai_anomalies: "#EA928B"
      3.0 - summary_weldlog.count_ai_anomalies: "#D8291C"
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_pivots:
      spot_sheet_details.sheet___null:
        is_entire_pivot_hidden: true
    listen:
      Production Date: plc_logs.message__weld_log__date_date
    row: 0
    col: 11
    width: 13
    height: 8
    tab_name: Anomaly Score
  filters:
  - name: Production Date
    title: Production Date
    type: field_filter
    default_value: 2025/11/01 to 2025/11/17
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    listens_to_filters: []
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
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    listens_to_filters: []
    field: plc_logs.message__weld_log__timer_name
  - name: Anomaly Score
    title: Anomaly Score
    type: field_filter
    default_value: "[0,0]"
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    listens_to_filters: []
    field: summary_weldlog.anomaly_score
  - name: Voltage Curve
    title: Voltage Curve
    type: field_filter
    default_value: "[0,100]"
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    listens_to_filters: []
    field: plc_logs__message__weld_log__voltage_curve.plc_logs__message__weld_log__voltage_curve
