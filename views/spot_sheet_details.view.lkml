include: "/raw_views/spot_sheet_details.view"

view: +spot_sheet_details {

    # ==========================================
    # 1. Identifiers & Meta
    # ==========================================

    dimension: spot_name {
      type: number
      group_label: "1. Identifiers & Meta"
      label: "Spot Name"
      description: "Weld spot identifier (aligned with summary_weldlog.spotName). For joins with plc_logs use CAST to STRING."
      sql: ${TABLE}.spotName ;;
    }

    dimension: timer_name {
      type: string
      group_label: "1. Identifiers & Meta"
      label: "Timer Name (PLC)"
      description: "Welding controller identifier (PLC)."
      sql: ${TABLE}.timerName ;;
    }

    # ==========================================
    # 2. Sheet Configuration
    # ==========================================

    dimension: sheet {
      type: number
      group_label: "2. Sheet Configuration"
      label: "Number of Sheets"
      description: "Number of sheets (2 or 3). NULL if not available (#N/A in Excel)."
      sql: ${TABLE}.sheet ;;
    }

    dimension: th1 {
      type: number
      group_label: "2. Sheet Configuration"
      label: "Thickness Sheet 1 (mm)"
      description: "Thickness of sheet 1 (mm). NULL if not available (#N/A in Excel)."
      sql: ${TABLE}.th1 ;;
    }

    dimension: th2 {
      type: number
      group_label: "2. Sheet Configuration"
      label: "Thickness Sheet 2 (mm)"
      description: "Thickness of sheet 2 (mm). NULL if not available (#N/A in Excel)."
      sql: ${TABLE}.th2 ;;
    }

    dimension: th3 {
      type: number
      group_label: "2. Sheet Configuration"
      label: "Thickness Sheet 3 (mm)"
      description: "Thickness of sheet 3 (mm); often 0 for 2-sheet configurations. NULL if not available (#N/A in Excel)."
      sql: ${TABLE}.th3 ;;
    }

    dimension: tth {
      type: number
      group_label: "2. Sheet Configuration"
      label: "Total Thickness (mm)"
      description: "Total thickness (mm). NULL if not available (#N/A in Excel)."
      sql: ROUND(${TABLE}.Tth,2);;
    }

    # ==========================================
    # Measures
    # ==========================================

    measure: count {
      type: count
      label: "Configuration Count"
      description: "Total number of sheet configurations."
      drill_fields: [timer_name, spot_name]
    }


# ==========================================
  # 1. PARAMETERS (Replaces the Python constants)
  # ==========================================

  parameter: min_labeled_curves {
    type: number
    description: "Equivalent to the Python variable MIN_LABELED_CURVES. Allows the user to change the threshold at runtime."
    default_value: "30"
  }

  # ==========================================
  # 2. DIMENSIONI (Replaces the for loop and typology_key)
  # ==========================================


  dimension: typology {
    type: string
    description: "Formatted string: ex. '3 sheets · 4.8 mm'"
    # In BigQuery SQL usiamo CAST e concatenazione per replicare l'f-string di Python
    sql: CAST(${sheet} AS INT64) || ' sheets · ' || CAST(${tth} AS STRING) || ' mm' ;;
  }



  # ==========================================
  # THICKNESS METRICS
  # ==========================================

  measure: avg_total_thickness {
    type: average
    label: "Avg Total Thickness (tth)"
    description: "Average total stack thickness (sum of all sheets) across welding spots."
    sql: ${tth} ;;
    value_format_name: decimal_2
  }

  measure: avg_th1 {
    type: average
    label: "Avg Sheet 1 Thickness"
    description: "Average thickness of the first sheet (th1) in mm."
    sql: ${th1} ;;
    value_format_name: decimal_2
  }

  measure: avg_th2 {
    type: average
    label: "Avg Sheet 2 Thickness"
    description: "Average thickness of the second sheet (th2) in mm."
    sql: ${th2} ;;
    value_format_name: decimal_2
  }

  measure: avg_th3 {
    type: average
    label: "Avg Sheet 3 Thickness"
    description: "Average thickness of the third sheet (th3, when present) in mm."
    sql: ${th3} ;;
    value_format_name: decimal_2
  }

  measure: max_total_thickness {
    type: max
    label: "Max Total Thickness"
    description: "Maximum total stack thickness observed across all welding spots."
    sql: ${tth} ;;
    value_format_name: decimal_2
  }

  measure: min_total_thickness {
    type: min
    label: "Min Total Thickness"
    description: "Minimum total stack thickness observed across all welding spots."
    sql: ${tth} ;;
    value_format_name: decimal_2
  }

  # ==========================================
  # SPOT COUNT METRICS
  # ==========================================

  measure: count_spots {
    type: count_distinct
    label: "# Distinct Weld Spots"
    description: "Number of distinct welding spot identifiers in the selection."
    sql: ${spot_name} ;;
  }

  measure: count_3_sheet_spots {
    type: count
    label: "# 3-Sheet Spots"
    description: "Count of welding spots with a 3-sheet stack configuration."
    filters: [sheet: "3"]
  }

  measure: count_2_sheet_spots {
    type: count
    label: "# 2-Sheet Spots"
    description: "Count of welding spots with a 2-sheet stack configuration."
    filters: [sheet: "2"]
  }

}
