include: "/raw_views/v_madi_kpi_dominant_3l48.view"

view: +v_madi_kpi_dominant_3l48 {

  dimension: top_pct {
    label: "Percentuale Top %"
    primary_key: yes
    type: number
    sql: ${TABLE}.top_pct ;;
    value_format_name: percent_0
  }

  # ==========================================
  # KPI LIFT & DETECTION METRICS
  # ==========================================

  measure: avg_lift {
    type: average
    label: "Lift Medio"
    description: "Lift medio del modello MADI: rapporto tra la concentrazione di difetti nelle saldature top rispetto a una selezione casuale. Un lift > 1 indica che il modello è migliore della selezione casuale."
    sql: ${lift} ;;
    value_format_name: decimal_2
  }

  measure: max_lift {
    type: max
    label: "Lift Massimo"
    description: "Lift massimo raggiunto dal modello MADI su tutti i periodi valutati."
    sql: ${lift} ;;
    value_format_name: decimal_2
  }

  # ==========================================
  # KO (DEFECT) COUNTS IN TOP %
  # ==========================================

  measure: total_ko_in_top {
    type: sum_distinct
    label: "KO Totali nel Top %"
    description: "Numero totale di saldature KO (difettose) presenti nella percentuale top di saldature."
    sql: ${n_ko_top} ;;
  }

  measure: total_ko_in_top5 {
    type: sum_distinct
    label: "KO Totali nel Top 5 %"
    description: "Numero totale di saldature KO (difettose) presenti nel 5% top di saldature."
    sql: ${n_ko_top} ;;
    filters: [top_pct: "0.05"]
  }

  measure: total_ko_in_top10 {
    type: sum_distinct
    label: "KO Totali nel Top 10 %"
    description: "Numero totale di saldature KO (difettose) presenti nel 10% top di saldature."
    sql: ${n_ko_top} ;;
    filters: [top_pct: "0.1"]
  }

  measure: total_ko_in_top15 {
    type: sum_distinct
    label: "KO Totali nel Top 15 %"
    description: "Numero totale di saldature KO (difettose) presenti nel 15% top di saldature."
    sql: ${n_ko_top} ;;
    filters: [top_pct: "0.15"]
  }

  measure: total_ko_overall {
    type: sum_distinct
    label: "KO Totali Complessivi"
    description: "Numero totale di saldature KO (difettose) su tutte le saldature valutate."
    sql: ${n_ko_total} ;;
  }

  measure: total_labeled {
    type: sum_distinct
    label: "Saldature Etichettate Totali"
    description: "Numero totale di saldature etichettate manualmente per la valutazione del modello."
    sql: ${n_labeled} ;;
  }

  measure: total_in_top {
    type: sum_distinct
    label: "Saldature Totali nel Top %"
    description: "Numero totale di saldature incluse nel bucket della percentuale top."
    sql: ${n_top} ;;
  }

  # ==========================================
  # PRECISION METRIC
  # ==========================================

  measure: avg_pct_ko_in_top {
    type: average
    label: "Precisione Media nel Top %"
    description: "Percentuale media di saldature KO nel bucket top (precisione del modello alla soglia selezionata)."
    sql: ${pct_ko_top} ;;
    value_format: "0.00\%"
  }

  measure: max_pct_ko_in_top {
    type: max
    label: "Precisione Massima nel Top %"
    description: "Precisione massima (% KO nel top %) raggiunta su tutti i periodi o configurazioni."
    sql: ${pct_ko_top} ;;
    value_format: "0.00\%"
  }

  # ==========================================
  # RECALL METRIC
  # ==========================================

  measure: recall_in_top {
    type: number
    label: "Recall nel Top %"
    description: "Recall del modello: proporzione di tutte le saldature KO che ricadono nel bucket top (KO catturati / KO totali)."
    sql: SAFE_DIVIDE(${total_ko_in_top}, NULLIF(${total_ko_overall}, 0)) ;;
    value_format_name: percent_2
  }



}
