view: spot_sheet_details {
  sql_table_name: `stellantis-molding-anomaly-det.molding_anomaly_poc.spot_sheet_details` ;;

  dimension: sheet {
    type: number
    description: "Number of sheets (2 or 3). NULL if not available (#N/A in Excel)."
    sql: ${TABLE}.sheet ;;
  }
  dimension: spot_name {
    type: number
    description: "Welding spot identifier (aligned to summary_weldlog.spotName). For join with plc_logs use CAST to STRING."
    sql: ${TABLE}.spotName ;;
  }
  dimension: th1 {
    type: number
    description: "Sheet thickness 1 (mm). NULL if not available (#N/A in Excel)."
    sql: ${TABLE}.th1 ;;
  }
  dimension: th2 {
    type: number
    description: "Sheet thickness 2 (mm). NULL if not available (#N/A in Excel)."
    sql: ${TABLE}.th2 ;;
  }
  dimension: th3 {
    type: number
    description: "Sheet thickness 3 (mm); often 0 with 2 sheets. NULL if not available (#N/A in Excel)."
    sql: ${TABLE}.th3 ;;
  }
  dimension: timer_name {
    type: string
    description: "Welding controller identifier (PLC)."
    sql: ${TABLE}.timerName ;;
  }
  dimension: tth {
    type: number
    description: "Total thickness (mm). NULL if not available (#N/A in Excel)."
    sql: ${TABLE}.Tth ;;
  }
  measure: count {
    type: count
    drill_fields: [timer_name, spot_name]
  }
}
