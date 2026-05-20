view: spot_sheet_details {
  sql_table_name: `stellantis-molding-anomaly-det.molding_anomaly_poc.spot_sheet_details` ;;

  dimension: sheet {
    type: number
    description: "Numero di lamiere (2 o 3). NULL se non disponibile (#N/A in Excel)."
    sql: ${TABLE}.sheet ;;
  }
  dimension: spot_name {
    type: number
    description: "Identificativo punto di saldatura (allineato a summary_weldlog.spotName). Per join con plc_logs usare CAST verso STRING."
    sql: ${TABLE}.spotName ;;
  }
  dimension: th1 {
    type: number
    description: "Spessore lamiera 1 (mm). NULL se non disponibile (#N/A in Excel)."
    sql: ${TABLE}.th1 ;;
  }
  dimension: th2 {
    type: number
    description: "Spessore lamiera 2 (mm). NULL se non disponibile (#N/A in Excel)."
    sql: ${TABLE}.th2 ;;
  }
  dimension: th3 {
    type: number
    description: "Spessore lamiera 3 (mm); spesso 0 con 2 lamiere. NULL se non disponibile (#N/A in Excel)."
    sql: ${TABLE}.th3 ;;
  }
  dimension: timer_name {
    type: string
    description: "Identificativo controller di saldatura (PLC)."
    sql: ${TABLE}.timerName ;;
  }
  dimension: tth {
    type: number
    description: "Spessore totale (mm). NULL se non disponibile (#N/A in Excel)."
    sql: ${TABLE}.Tth ;;
  }
  measure: count {
    type: count
    drill_fields: [timer_name, spot_name]
  }
}
