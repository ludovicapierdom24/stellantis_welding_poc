- dashboard: welding_anomaly_detection
  title: '01. Sistema Predittivo Saldature Industriali'
  layout: newspaper
  description: 'Monitoraggio predittivo e Root Cause Analysis per processo di saldatura a punti.'

  # ==========================================
  # FILTERS
  # ==========================================
  filters:
  - name: Data Produzione
    title: Data Produzione
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    explore: welding_anomaly_poc
    field: plc_logs.message__weld_log__date_date

  - name: Linea di Produzione
    title: Linea / Robot (Timer)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    explore: welding_anomaly_poc
    field: plc_logs.message__weld_log__timer_name

  - name: Esito Modello (Isolation Forest)
    title: Filtro Anomaly Score
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: popover
    explore: welding_anomaly_poc
    field: summary_weldlog.anomaly_score



  # ==========================================
  # ELEMENTS (KPIs & Charts)
  # ==========================================
  elements:

  # --- KPI 1: Totale Saldature ---
  - title: Saldature Totali Analizzate
    name: Saldature Totali Analizzate
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
      Data Produzione: plc_logs.message__weld_log__date_date
      Linea di Produzione: plc_logs.message__weld_log__timer_name
      Esito Modello (Isolation Forest): summary_weldlog.anomaly_score
    row: 0
    col: 0
    width: 6
    height: 4

  # --- KPI 2: Defect Rate ---
  - title: Tasso di Anomalia (Defect Rate)
    name: Defect Rate
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: single_value
    fields: [summary_weldlog.defect_rate]
    custom_color_enabled: true
    show_single_value_title: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: greater than, value: 0.02, background_color: "#EA4335", font_color: "#ffffff", color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7, palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810609}, bold: false, italic: false, strikethrough: false, format: ''}]
    listen:
      Data Produzione: plc_logs.message__weld_log__date_date
      Linea di Produzione: plc_logs.message__weld_log__timer_name
      Esito Modello (Isolation Forest): summary_weldlog.anomaly_score
    row: 0
    col: 6
    width: 6
    height: 4

  # --- KPI 3: Anomalie Rilevate (AI) ---
  - title: Anomalie Rilevate (Isolation Forest)
    name: Anomalie Rilevate (Isolation Forest)
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: single_value
    fields: [summary_weldlog.count_ai_anomalies]
    custom_color_enabled: true
    show_single_value_title: true
    listen:
      Data Produzione: plc_logs.message__weld_log__date_date
      Linea di Produzione: plc_logs.message__weld_log__timer_name
      Esito Modello (Isolation Forest): summary_weldlog.anomaly_score
    row: 0
    col: 12
    width: 6
    height: 4

  # --- KPI 4: Usura Max Elettrodo ---
  - title: Stato Usura Elettrodo Max
    name: Stato Usura Elettrodo Max
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: single_value
    fields: [plc_logs.max_wear_percent]
    custom_color_enabled: true
    show_single_value_title: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: greater than, value: 80, font_color: "#F9AB00", bold: true}]
    listen:
      Data Produzione: plc_logs.message__weld_log__date_date
      Linea di Produzione: plc_logs.message__weld_log__timer_name
      Esito Modello (Isolation Forest): summary_weldlog.anomaly_score
    row: 0
    col: 18
    width: 6
    height: 4

  # --- GRAFICO 1: Clustering Fisico (Scatter) ---
  - title: Clustering Fisico (Corrente vs Resistenza)
    name: Clustering Fisico (Corrente vs Resistenza)
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: looker_scatter
    fields: [plc_logs.average_current_actual, plc_logs.average_resistance_actual, summary_weldlog.ultrasound]
    pivots: [summary_weldlog.ultrasound]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: true
    show_x_axis_ticks: true
    legend_position: bottom
    point_style: circle_outline
    series_colors:
      Good - plc_logs.average_resistance_actual: "#9AA0A6"
      KO - plc_logs.average_resistance_actual: "#EA4335"
    listen:
      Data Produzione: plc_logs.message__weld_log__date_date
      Linea di Produzione: plc_logs.message__weld_log__timer_name
      Esito Modello (Isolation Forest): summary_weldlog.anomaly_score
    row: 4
    col: 0
    width: 12
    height: 9

  # --- GRAFICO 2: Combo Usura vs Tasso Fallimento ---
  - title: Impatto Usura su Tasso di Fallimento
    name: Impatto Usura su Tasso di Fallimento
    model: stellantis_welding_poc
    explore: welding_anomaly_poc
    type: looker_column
    fields: [plc_logs.message__weld_log__wear_per_cent, summary_weldlog.total_welds, summary_weldlog.defect_rate]
    sorts: [plc_logs.message__weld_log__wear_per_cent]
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: 'Volume Saldature', orientation: left, series: [{axisId: summary_weldlog.total_welds,
            id: summary_weldlog.total_welds, name: Totale Saldature Analizzate}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: 'Tasso di Anomalia', orientation: right, series: [{axisId: summary_weldlog.defect_rate,
            id: summary_weldlog.defect_rate, name: Defect Rate %}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    series_types:
      summary_weldlog.defect_rate: line
    series_colors:
      summary_weldlog.total_welds: "#4285F4"
      summary_weldlog.defect_rate: "#EA4335"
    listen:
      Data Produzione: plc_logs.message__weld_log__date_date
      Linea di Produzione: plc_logs.message__weld_log__timer_name
      Esito Modello (Isolation Forest): summary_weldlog.anomaly_score
    row: 4
    col: 12
    width: 12
    height: 9

  # --- TABELLA: Registro Anomalie ---
  - title: Registro Anomalie Critiche Recenti
    name: Registro Anomalie Critiche Recenti
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
    conditional_formatting: [{type: less than, value: 0, background_color: "#FCE8E6", font_color: "#EA4335", color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7, palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810609}, bold: true, italic: false, strikethrough: false, format: ''}]
    listen:
      Data Produzione: plc_logs.message__weld_log__date_date
      Linea di Produzione: plc_logs.message__weld_log__timer_name
    row: 13
    col: 0
    width: 24
    height: 7
