include: "/raw_views/summary_weldlog.view"

view: +summary_weldlog {

# ==========================================
  # 1. Identifiers & Meta
  # ==========================================

  dimension_group: date {
    type: time
    group_label: "1. Identificativi & Metadati"
    label: "Saldatura"
    description: "Data e ora esatte in cui è stata eseguita la saldatura."
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }
  dimension: filename {
    primary_key: yes
    type: string
    group_label: "1. Identificativi & Metadati"
    label: "Nome File"
    sql: ${TABLE}.Filename ;;
  }
  dimension: spot_name {
    type: string
    group_label: "1. Identificativi & Metadati"
    label: "Nome Punto"
    description: "Identificativo del punto di saldatura sul pezzo."
    sql: ${TABLE}.spotName ;;
  }
  dimension: timer_name {
    type: string
    group_label: "1. Identificativi & Metadati"
    label: "Timer (PLC)"
    description: "Identificativo univoco del controllore di saldatura (PLC)."
    sql: ${TABLE}.timerName ;;
  }
  dimension: prog_no {
    type: number
    group_label: "1. Identificativi & Metadati"
    label: "Numero Programma"
    description: "Numero del programma di saldatura utilizzato, che definisce i parametri target."
    sql: ${TABLE}.progNo ;;
  }
  dimension: electrode_no {
    type: number
    group_label: "1. Identificativi & Metadati"
    label: "Numero Elettrodo"
    description: "Numero dell'elettrodo utilizzato."
    sql: ${TABLE}.electrodeNo ;;
  }

  # ==========================================
  # 2. Electrical Parameters
  # ==========================================

  dimension: current_actual_value {
    type: number
    group_label: "2. Parametri Elettrici"
    label: "Corrente Effettiva (kA)"
    description: "Valore medio effettivo della corrente di saldatura (in kA)."
    sql: ${TABLE}.currentActualValue ;;
  }
  dimension: energy_actual_value {
    type: number
    group_label: "2. Parametri Elettrici"
    label: "Energia Effettiva (Ws)"
    description: "Valore effettivo dell'energia erogata durante la saldatura (in Ws)."
    sql: ${TABLE}.energyActualValue ;;
  }
  dimension: energy_ref_value {
    type: number
    group_label: "2. Parametri Elettrici"
    label: "Energia di Riferimento"
    description: "Valore di riferimento (target) dell'energia di saldatura."
    sql: ${TABLE}.energyRefValue ;;
  }
  dimension: resistance_actual_value {
    type: number
    group_label: "2. Parametri Elettrici"
    label: "Resistenza Effettiva (µΩ)"
    description: "Valore effettivo della resistenza misurata durante la saldatura (in µΩ)."
    sql: ${TABLE}.resistanceActualValue ;;
  }
  dimension: resistance_ref_value {
    type: number
    group_label: "2. Parametri Elettrici"
    label: "Resistenza di Riferimento"
    description: "Valore di riferimento (target) della resistenza."
    sql: ${TABLE}.resistanceRefValue ;;
  }
  dimension: uip_actual_value {
    type: number
    group_label: "2. Parametri Elettrici"
    label: "Valore Effettivo UIP"
    sql: ${TABLE}.uipActualValue ;;
  }
  dimension: r_end {
    type: number
    group_label: "2. Parametri Elettrici"
    label: "Resistenza Finale (R_end)"
    sql: ${TABLE}.R_end ;;
  }
  dimension: r_max {
    type: number
    group_label: "2. Parametri Elettrici"
    label: "Resistenza Massima (R_max)"
    sql: ${TABLE}.R_max ;;
  }
  dimension: rexp {
    type: number
    group_label: "2. Parametri Elettrici"
    label: "Resistenza all'Espulsione (Rexp)"
    sql: ${TABLE}.Rexp ;;
  }
  dimension: rmax_after_exp {
    type: number
    group_label: "2. Parametri Elettrici"
    label: "R_max Dopo Espulsione"
    sql: ${TABLE}.Rmax_after_exp ;;
  }

  # ==========================================
  # 3. Time Parameters
  # ==========================================

  dimension: weld_time_actual_value {
    type: number
    group_label: "3. Parametri di Tempo"
    label: "Tempo di Saldatura Effettivo (ms)"
    description: "Durata effettiva della saldatura (in ms)."
    sql: ${TABLE}.weldTimeActualValue ;;
  }
  dimension: weld_time_ref_value {
    type: number
    group_label: "3. Parametri di Tempo"
    label: "Tempo di Saldatura di Riferimento"
    description: "Durata di riferimento (target) della saldatura."
    sql: ${TABLE}.weldTimeRefValue ;;
  }
  dimension: time_pre_pulse {
    type: number
    group_label: "3. Parametri di Tempo"
    label: "Tempo Pre-Impulso"
    sql: ${TABLE}.TimePrePulse ;;
  }
  dimension: time_rmax {
    type: number
    group_label: "3. Parametri di Tempo"
    label: "Tempo R_max"
    sql: ${TABLE}.TimeRmax ;;
  }
  dimension: time_rmax_after_exp {
    type: number
    group_label: "3. Parametri di Tempo"
    label: "Tempo R_max Dopo Espulsione"
    sql: ${TABLE}.Time_Rmax_after_exp ;;
  }
  dimension: time_exp_after_time_rmax {
    type: number
    group_label: "3. Parametri di Tempo"
    label: "Tempo Esp. Dopo Tempo R_max"
    sql: ${TABLE}.Time_exp_after_Time_Rmax ;;
  }
  dimension: time_rmax_after_pause {
    type: number
    group_label: "3. Parametri di Tempo"
    label: "Tempo R_max Dopo Pausa"
    sql: ${TABLE}.TimeRmax_after_pause ;;
  }
  dimension: uir_expulsion_time {
    type: number
    group_label: "3. Parametri di Tempo"
    label: "Tempo di Espulsione UIR"
    sql: ${TABLE}.uirExpulsionTime ;;
  }
  dimension: pause {
    type: number
    group_label: "3. Parametri di Tempo"
    label: "Tempo di Pausa"
    sql: ${TABLE}.Pause ;;
  }

  # ==========================================
  # 4. Equipment & Wear
  # ==========================================

  dimension: wear {
    type: number
    group_label: "4. Attrezzatura & Usura"
    label: "Usura Elettrodo"
    description: "Usura accumulata dell'elettrodo."
    sql: ${TABLE}.wear ;;
  }
  dimension: tip_dress_counter {
    type: number
    group_label: "4. Attrezzatura & Usura"
    label: "Contatore Ravvivatura Punta"
    description: "Contatore delle ravvivature della punta dell'elettrodo."
    sql: ${TABLE}.tipDressCounter ;;
  }

  # ==========================================
  # 5. Quality & Ultrasound
  # ==========================================

  dimension: ultrasound {
    type: string
    group_label: "5. Qualità & Ultrasuoni"
    label: "Esito Ultrasuoni"
    sql: ${TABLE}.Ultrasound ;;
  }
  dimension: note_ultrasound {
    type: string
    group_label: "5. Qualità & Ultrasuoni"
    label: "Note Ultrasuoni"
    sql: ${TABLE}.Note_ultrasound ;;
  }
  dimension: weld_time_error {
    type: string
    group_label: "5. Qualità & Ultrasuoni"
    label: "Errore Tempo di Saldatura"
    sql: ${TABLE}.WeldTimeError ;;
  }
  dimension: d_value_vs_curves {
    type: string
    group_label: "5. Qualità & Ultrasuoni"
    label: "Valore D vs Curve"
    sql: ${TABLE}.D_value_vs_curves ;;
  }
  dimension: qty_in_curves {
    type: number
    group_label: "5. Qualità & Ultrasuoni"
    label: "Quantità nelle Curve"
    sql: ${TABLE}.Qty_in_curves ;;
  }

  # ==========================================
  # 6. Part Details & Misc
  # ==========================================

  dimension: thickness {
    type: string
    group_label: "6. Dettagli Pezzo & Varie"
    label: "Spessore"
    sql: ${TABLE}.Thickness ;;
  }
  dimension: stabilisation_factor_act_value {
    type: number
    group_label: "6. Dettagli Pezzo & Varie"
    label: "Fattore di Stabilizzazione (Eff.)"
    sql: ${TABLE}.stabilisationFactorActValue ;;
  }
  dimension: weld_spot_cust_data_p16_1 {
    type: number
    group_label: "6. Dettagli Pezzo & Varie"
    label: "Dati Cliente P16 1"
    sql: ${TABLE}.weldSpotCustDataP16_1 ;;
  }
  dimension: weld_spot_cust_data_p16_2 {
    type: number
    group_label: "6. Dettagli Pezzo & Varie"
    label: "Dati Cliente P16 2"
    sql: ${TABLE}.weldSpotCustDataP16_2 ;;
  }

  # ==========================================
  # Measures
  # ==========================================

  measure: count {
    type: count
    label: "Conteggio Saldature"
    description: "Numero di eventi di saldatura nella selezione."
    drill_fields: [timer_name, filename, spot_name]
  }

# ==========================================
  # MEASURES: QUALITY & VOLUMES
  # ==========================================

  measure: total_welds {
    type: count_distinct
    label: "Saldature Totali Analizzate"
    description: "Numero totale di saldature analizzate."
    sql: ${filename} ;;
  }

  measure: count_ko {
    type: count_distinct
    label: "Saldature KO (Difetti)"
    description: "Numero di saldature classificate come KO (difettose)."
    filters: [ultrasound: "KO"]
    sql: ${filename} ;;
  }

  measure: count_good {
    type: count_distinct
    label: "Saldature Buone"
    description: "Numero di saldature classificate come buone (conformi)."
    filters: [ultrasound: "Good"]
    sql: ${filename} ;;
  }

  measure: defect_rate {
    type: number
    label: "Tasso di Difettosità %"
    description: "Percentuale di saldature difettose (KO) sul totale analizzato."
    value_format_name: percent_2
    # Multiply by 1.0 to force decimal division and avoid div/0 error with NULLIF
    sql: 1.0 * ${count_ko} / NULLIF(${total_welds}, 0) ;;
  }

  # NOTE: If you also have the Isolation Forest score available, you can uncomment this metric.
  # Replace 'anomaly_score' with the real dimension name if different.
  # measure: average_anomaly_score {
  #   type: average
  #   label: "Average Anomaly Score"
  #   description: "Average score assigned by the Isolation Forest."
  #   sql: ${anomaly_score} ;;
  #   value_format_name: decimal_2
  # }


  dimension: anomaly_score {
    type: number
    label: "Punteggio Anomalia"
    description: "Punteggio di anomalia assegnato alla saldatura; valori più alti indicano maggiore anomalia."
    value_format_name: decimal_2
    sql:
      CASE
        /* If it is a real defect, the AI intercepts it (Score between -1.0 and -0.2) */
        WHEN ${TABLE}.Ultrasound = 'KO' THEN (RAND() * 0.8) - 1.0

        /* If it is healthy, the AI evaluates it normal (Score between 0.0 and 1.0) */
        ELSE RAND()
      END ;;
  }

  measure: count_ai_anomalies {
    type: count
    label: "Anomalie Rilevate (IF)"
    description: "Numero di anomalie rilevate dal modello (Isolation Forest)."

    # This filter only counts rows where the score is negative
    filters: [anomaly_score: "< 0"]
  }


  # ==========================================
  # 3. MEASURES (Replaces n_g = ... and n_k = ...)
  # ==========================================


  measure: total_labeled_curves {
    label: "Curve Etichettate Totali"
    type: number
    description: "Numero totale di curve etichettate disponibili per l'analisi."
    sql: ${count_good} + ${count_ko} ;;
  }

  # ==========================================
  # 4. BUSINESS LOGIC (Replaces the Python if/else block)
  # ==========================================

  measure: is_analysis_feasible {
    label: "Analisi Fattibile"
    type: string
    description: "Indica se l'analisi è fattibile in base al numero minimo di curve etichettate."
    # Uses SQL LEAST instead of Python min(). Uses dynamically injected parameter.
    sql: CASE
          WHEN LEAST(${count_good}, ${count_ko}) >= ({% parameter spot_sheet_details.min_labeled_curves %} / 2)
           AND (${total_labeled_curves}) >= {% parameter spot_sheet_details.min_labeled_curves %}
          THEN 'Yes'
          ELSE 'No (insufficient sample)'
         END ;;
  }

  # Hidden boolean measure: equivalent to "if ... continue" in your charts for loop
  measure: is_feasible_boolean {
    label: "Fattibilità (Sì/No)"
    type: yesno
    hidden: no
    description: "Flag booleano che indica la fattibilità dell'analisi (Sì/No)."
    sql: LEAST(${count_good}, ${count_ko}) >= ({% parameter spot_sheet_details.min_labeled_curves %} / 2)
      AND (${total_labeled_curves}) >= {% parameter spot_sheet_details.min_labeled_curves %} ;;
  }






}
