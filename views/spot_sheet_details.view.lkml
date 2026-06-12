include: "/raw_views/spot_sheet_details.view"

view: +spot_sheet_details {

    # ==========================================
    # 1. Identifiers & Meta
    # ==========================================

    dimension: spot_name {
      type: number
      group_label: "1. Identificativi & Metadati"
      label: "Nome Punto"
      description: "Identificativo del punto di saldatura sul pezzo."
      sql: ${TABLE}.spotName ;;
    }

    dimension: timer_name {
      type: string
      group_label: "1. Identificativi & Metadati"
      label: "Timer (PLC)"
      description: "Identificativo del controllore di saldatura (PLC) associato al punto."
      sql: ${TABLE}.timerName ;;
    }

    # ==========================================
    # 2. Sheet Configuration
    # ==========================================

    dimension: sheet {
      type: number
      group_label: "2. Configurazione Lamiere"
      label: "Numero di Lamiere"
      description: "Numero di lamiere sovrapposte nel punto di saldatura."
      sql: ${TABLE}.sheet ;;
    }

    dimension: th1 {
      type: number
      group_label: "2. Configurazione Lamiere"
      label: "Spessore Lamiera 1 (mm)"
      description: "Spessore della prima lamiera (mm)."
      sql: ${TABLE}.th1 ;;
    }

    dimension: th2 {
      type: number
      group_label: "2. Configurazione Lamiere"
      label: "Spessore Lamiera 2 (mm)"
      description: "Spessore della seconda lamiera (mm)."
      sql: ${TABLE}.th2 ;;
    }

    dimension: th3 {
      type: number
      group_label: "2. Configurazione Lamiere"
      label: "Spessore Lamiera 3 (mm)"
      description: "Spessore della terza lamiera (mm), se presente."
      sql: ${TABLE}.th3 ;;
    }

    dimension: tth {
      type: number
      group_label: "2. Configurazione Lamiere"
      label: "Spessore Totale (mm)"
      description: "Spessore totale della pila di lamiere (mm)."
      sql: ROUND(${TABLE}.Tth,2);;
    }

    # ==========================================
    # Measures
    # ==========================================

    measure: count {
      type: count
      label: "Conteggio Configurazioni"
      description: "Numero di configurazioni di punto/lamiera presenti nella selezione."
      drill_fields: [timer_name, spot_name]
    }


# ==========================================
  # 1. PARAMETERS (Replaces the Python constants)
  # ==========================================

  parameter: min_labeled_curves {
    type: number
    label: "Curve Etichettate Minime"
    description: "Numero minimo di curve etichettate richiesto per ritenere fattibile l'analisi. Permette all'utente di modificare la soglia a runtime."
    default_value: "30"
  }

  # ==========================================
  # 2. DIMENSIONI (Replaces the for loop and typology_key)
  # ==========================================


  dimension: typology {
    type: string
    description: "Stringa formattata: es. '3 lamiere · 4.8 mm'"
    # In BigQuery SQL usiamo CAST e concatenazione per replicare l'f-string di Python
    sql: CAST(${sheet} AS INT64) || ' sheets · ' || CAST(${tth} AS STRING) || ' mm' ;;
  }



  # ==========================================
  # THICKNESS METRICS
  # ==========================================

  measure: avg_total_thickness {
    type: average
    label: "Spessore Totale Medio (tth)"
    description: "Spessore totale medio (tth) delle configurazioni selezionate."
    sql: ${tth} ;;
    value_format_name: decimal_2
  }

  measure: avg_th1 {
    type: average
    label: "Spessore Medio Lamiera 1"
    description: "Spessore medio della prima lamiera."
    sql: ${th1} ;;
    value_format_name: decimal_2
  }

  measure: avg_th2 {
    type: average
    label: "Spessore Medio Lamiera 2"
    description: "Spessore medio della seconda lamiera."
    sql: ${th2} ;;
    value_format_name: decimal_2
  }

  measure: avg_th3 {
    type: average
    label: "Spessore Medio Lamiera 3"
    description: "Spessore medio della terza lamiera."
    sql: ${th3} ;;
    value_format_name: decimal_2
  }

  measure: max_total_thickness {
    type: max
    label: "Spessore Totale Max"
    description: "Spessore totale massimo nella selezione."
    sql: ${tth} ;;
    value_format_name: decimal_2
  }

  measure: min_total_thickness {
    type: min
    label: "Spessore Totale Min"
    description: "Spessore totale minimo nella selezione."
    sql: ${tth} ;;
    value_format_name: decimal_2
  }

  # ==========================================
  # SPOT COUNT METRICS
  # ==========================================

  measure: count_spots {
    type: count_distinct
    label: "# Punti di Saldatura Distinti"
    description: "Numero di punti di saldatura distinti."
    sql: ${spot_name} ;;
  }

  measure: count_3_sheet_spots {
    type: count
    label: "# Punti a 3 Lamiere"
    description: "Numero di punti di saldatura con 3 lamiere."
    filters: [sheet: "3"]
  }

  measure: count_2_sheet_spots {
    type: count
    label: "# Punti a 2 Lamiere"
    description: "Numero di punti di saldatura con 2 lamiere."
    filters: [sheet: "2"]
  }

}
