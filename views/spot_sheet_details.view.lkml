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
      sql: ${TABLE}.Tth ;;
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
  }
