include: "/raw_views/plc_logs.view"
view: +plc_logs {



# ==========================================
  # MEASURES: ELECTRICAL & PROCESS METRICS
  # ==========================================

  measure: average_current_actual {
    type: average
    label: "Corrente Media (kA)"
    group_label: "Metriche Elettriche"
    sql: ${message__weld_log__current_actual_value} ;;
    value_format_name: decimal_2
  }

  measure: average_resistance_actual {
    type: average
    label: "Resistenza Media (µΩ)"
    group_label: "Metriche Elettriche"
    sql: ${message__weld_log__resistance_actual_value} ;;
    value_format_name: decimal_2
  }

  measure: average_stabilisation_factor {
    type: average
    label: "Fattore di Stabilizz. Medio"
    group_label: "Metriche di Processo"
    sql: ${message__weld_log__stabilisation_factor_act_value} ;;
    value_format_name: decimal_2
  }

  # ==========================================
  # MEASURES: EXPULSION (SPATTER) LOGIC
  # ==========================================
  # Dimensione di appoggio nascosta per capire se c'è stata espulsione
  dimension: is_expulsion {
    type: yesno
    hidden: yes
    sql: ${message__weld_log__uir_expulsion_time} > 0 ;;
  }

  measure: count_expulsions {
    type: count
    label: "Numero Espulsioni (Spatter)"
    group_label: "Metriche di Processo"
    description: "Conteggio saldature con espulsione di materiale."
    filters: [is_expulsion: "yes"]
  }

  measure: expulsion_rate {
    type: number
    label: "Tasso di Espulsione %"
    group_label: "Metriche di Processo"
    value_format_name: percent_2
    sql: 1.0 * ${count_expulsions} / NULLIF(${count}, 0) ;;
  }

  # ==========================================
  # MEASURES: EQUIPMENT HEALTH (USURA)
  # ==========================================

  measure: average_wear_percent {
    type: average
    label: "Usura Media Elettrodo (%)"
    group_label: "Metriche Attrezzatura"
    sql: ${message__weld_log__wear_per_cent} ;;
    value_format_name: decimal_1
  }

  measure: max_wear_percent {
    type: max
    label: "Usura Max Elettrodo (%)"
    group_label: "Metriche Attrezzatura"
    description: "Picco massimo di usura rilevato nel periodo selezionato."
    sql: ${message__weld_log__wear_per_cent} ;;
    value_format_name: decimal_1
  }

  measure: max_tip_dress_counter {
    type: max
    label: "Max Tip Dress Counter"
    group_label: "Metriche Attrezzatura"
    description: "Massimo numero di ravvivature (Dressing) raggiunte."
    sql: ${message__weld_log__tip_dress_counter} ;;
  }
}
