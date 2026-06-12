include: "/raw_views/weld_training_scores_madi_3l48.view"

view: +weld_training_scores_madi_3l48 {

  # ==========================================
  # ANOMALY SCORE METRICS
  # ==========================================

  measure: average_anomaly_score {
    type: average
    label: "Punteggio Anomalia Medio"
    description: "Punteggio di anomalia MADI medio su tutti gli eventi di saldatura valutati."
    sql: ${anomaly_score} ;;
    value_format_name: percent_2
  }

  measure: max_anomaly_score {
    type: max
    label: "Punteggio Anomalia Max"
    description: "Punteggio di anomalia MADI massimo rilevato nel periodo selezionato."
    sql: ${anomaly_score} ;;
    value_format_name: percent_2
  }

  measure: min_anomaly_score {
    type: min
    label: "Punteggio Anomalia Min"
    description: "Punteggio di anomalia MADI minimo rilevato nel periodo selezionato."
    sql: ${anomaly_score} ;;
    value_format_name: percent_2
  }

  measure: average_class_prob {
    type: average
    label: "Probabilità di Classificazione Media"
    description: "Probabilità media assegnata dal modello MADI che una saldatura sia anomala."
    sql: ${class_prob} ;;
    value_format_name: percent_2
  }

  # ==========================================
  # ANOMALY DETECTION COUNTS
  # ==========================================

  measure: total_scored_welds {
    type: count
    label: "Saldature Valutate Totali"
    description: "Numero totale di eventi di saldatura valutati dal modello MADI."
  }

  measure: count_anomalies {
    type: count
    label: "# Anomalie Rilevate"
    description: "Numero di saldature classificate come anomale (punteggio anomalia > 0,5)."
    filters: [anomaly_score: ">0.5"]
  }

  measure: anomaly_rate {
    type: number
    label: "Tasso di Anomalia"
    description: "Percentuale di saldature valutate classificate come anomale (punteggio anomalia > 0,5)."
    sql: SAFE_DIVIDE(${count_anomalies}, ${total_scored_welds}) ;;
    value_format_name: percent_2
  }

  measure: count_dominant_stack {
    type: count
    label: "# Eventi Stack Dominante"
    description: "Conteggio degli eventi di saldatura appartenenti alla configurazione di pila materiali dominante."
    filters: [is_dominant_stack: "yes"]
  }

  measure: count_labeled {
    type: count
    label: "# Saldature Etichettate"
    description: "Conteggio delle saldature etichettate manualmente per la valutazione supervisionata."
    filters: [is_labeled: "yes"]
  }

  # ==========================================
  # MADI SAMPLE METRICS
  # ==========================================

  measure: average_madi_sample_ratio {
    type: average
    label: "Rapporto Campione MADI Medio"
    description: "Rapporto medio del punteggio campione MADI rispetto alla distribuzione di training."
    sql: ${madi_sample_ratio} ;;
    value_format_name: decimal_4
  }

  measure: average_madi_sample_delta {
    type: average
    label: "Delta Campione MADI Medio"
    description: "Delta medio tra il punteggio campione MADI corrente e la baseline di riferimento."
    sql: ${madi_sample_delta} ;;
    value_format_name: decimal_4
  }

  measure: average_train_recent_quantile {
    type: average
    label: "Quantile Recente Training Medio"
    description: "Posizione quantile media del punteggio di anomalia nella distribuzione di training recente."
    sql: ${train_recent_quantile} ;;
    value_format_name: percent_2
  }

}
