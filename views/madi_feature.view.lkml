include: "/raw_views/weld_training_madi_shap_3l48.view"

view: +weld_training_madi_shap_3l48 {

  dimension: id_weld {
    label: "ID Saldatura"
    type: string
    sql: concat(${timer_name},"-",${spot_name}) ;;
  }

  # ==========================================
  # SHAP VALUE METRICS
  # ==========================================

  measure: avg_shap_value {
    type: average
    label: "Valore Anomalia SHAP Medio"
    description: "Valore medio del contributo SHAP (anomalia) su tutte le feature ed eventi. Valori positivi indicano una feature che spinge il punteggio verso l'anomalia."
    sql: ${shap_anomaly} ;;
    value_format_name: percent_2
  }

  measure: avg_abs_shap {
    type: average
    label: "Contributo Feature Medio (Assoluto)"
    description: "Valore SHAP assoluto medio, che rappresenta l'entità del contributo della feature indipendentemente dalla direzione."
    sql: ${abs_shap} ;;
    value_format_name: percent_2
  }

  measure: max_abs_shap {
    type: max
    label: "Contributo Feature Massimo"
    description: "Valore SHAP assoluto massimo nella selezione, che identifica il contributo di feature più impattante."
    sql: ${abs_shap} ;;
    value_format_name: percent_2
  }

  measure: total_shap_records {
    type: count
    label: "Record SHAP Totali"
    description: "Numero totale di record di attribuzione SHAP a livello di feature."
  }

  # ==========================================
  # ANOMALY SCORE (from SHAP table)
  # ==========================================

  measure: avg_anomaly_score_shap {
    type: average
    label: "Punteggio Anomalia Medio (SHAP)"
    description: "Punteggio di anomalia medio associato ai record SHAP."
    sql: ${anomaly_score} ;;
    value_format_name: percent_2
  }

  measure: avg_class_prob_shap {
    type: average
    label: "Probabilità di Classificazione Media (SHAP)"
    description: "Probabilità di classificazione media associata ai record SHAP."
    sql: ${class_prob} ;;
    value_format_name: percent_2
  }

  # ==========================================
  # FEATURE RANK METRICS
  # ==========================================

  measure: avg_shap_rank {
    type: average
    label: "Rank SHAP Feature Medio"
    description: "Rank medio della feature per contributo SHAP assoluto (1 = più importante) su tutte le rilevazioni di anomalia."
    sql: ${shap_rank} ;;
    value_format_name: decimal_0
  }

  measure: avg_rank_pct {
    type: average
    label: "Percentile di Rank Medio"
    description: "Percentile medio del rank di contributo della feature (più alto = più impattante)."
    sql: ${rank_pct} ;;
    value_format_name: percent_2
  }


  # ==========================================
  # FEATURE VALUE METRICS
  # ==========================================

  measure: avg_feature_value {
    type: average
    label: "Valore Feature Medio"
    description: "Valore grezzo medio della feature di input associata al contributo SHAP."
    sql: ${feature_value} ;;
    value_format_name: decimal_3
  }

}
