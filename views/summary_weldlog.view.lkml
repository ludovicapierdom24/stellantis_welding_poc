include: "/raw_views/summary_weldlog.view"

view: +summary_weldlog {

# ==========================================
  # 1. Identifiers & Meta
  # ==========================================

  dimension_group: date {
    type: time
    group_label: "1. Identifiers & Meta"
    label: "Weld"
    description: "Exact date and time when the weld was performed."
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }
  dimension: filename {
    primary_key: yes
    type: string
    group_label: "1. Identifiers & Meta"
    label: "Filename"
    sql: ${TABLE}.Filename ;;
  }
  dimension: spot_name {
    type: string
    group_label: "1. Identifiers & Meta"
    label: "Spot Name"
    description: "Identifier of the specific weld spot on the part."
    sql: ${TABLE}.spotName ;;
  }
  dimension: timer_name {
    type: string
    group_label: "1. Identifiers & Meta"
    label: "Timer Name (PLC)"
    description: "Unique identifier of the welding controller (PLC)."
    sql: ${TABLE}.timerName ;;
  }
  dimension: prog_no {
    type: number
    group_label: "1. Identifiers & Meta"
    label: "Program Number"
    description: "Number of the welding program used, defining target parameters."
    sql: ${TABLE}.progNo ;;
  }
  dimension: electrode_no {
    type: number
    group_label: "1. Identifiers & Meta"
    label: "Electrode Number"
    description: "Number of the electrode used."
    sql: ${TABLE}.electrodeNo ;;
  }

  # ==========================================
  # 2. Electrical Parameters
  # ==========================================

  dimension: current_actual_value {
    type: number
    group_label: "2. Electrical Parameters"
    label: "Current Actual Value (kA)"
    description: "Actual average value of the welding current (in kA)."
    sql: ${TABLE}.currentActualValue ;;
  }
  dimension: energy_actual_value {
    type: number
    group_label: "2. Electrical Parameters"
    label: "Energy Actual Value (Ws)"
    description: "Total energy actually delivered during the weld (in Ws)."
    sql: ${TABLE}.energyActualValue ;;
  }
  dimension: energy_ref_value {
    type: number
    group_label: "2. Electrical Parameters"
    label: "Energy Ref Value"
    description: "Reference energy set in the program."
    sql: ${TABLE}.energyRefValue ;;
  }
  dimension: resistance_actual_value {
    type: number
    group_label: "2. Electrical Parameters"
    label: "Resistance Actual Value (µΩ)"
    description: "Electrical resistance value measured at the end of the process (in µΩ)."
    sql: ${TABLE}.resistanceActualValue ;;
  }
  dimension: resistance_ref_value {
    type: number
    group_label: "2. Electrical Parameters"
    label: "Resistance Ref Value"
    description: "Expected reference resistance value."
    sql: ${TABLE}.resistanceRefValue ;;
  }
  dimension: uip_actual_value {
    type: number
    group_label: "2. Electrical Parameters"
    label: "UIP Actual Value"
    sql: ${TABLE}.uipActualValue ;;
  }
  dimension: r_end {
    type: number
    group_label: "2. Electrical Parameters"
    label: "Resistance End (R_end)"
    sql: ${TABLE}.R_end ;;
  }
  dimension: r_max {
    type: number
    group_label: "2. Electrical Parameters"
    label: "Resistance Max (R_max)"
    sql: ${TABLE}.R_max ;;
  }
  dimension: rexp {
    type: number
    group_label: "2. Electrical Parameters"
    label: "Resistance Expulsion (Rexp)"
    sql: ${TABLE}.Rexp ;;
  }
  dimension: rmax_after_exp {
    type: number
    group_label: "2. Electrical Parameters"
    label: "R_max After Expulsion"
    sql: ${TABLE}.Rmax_after_exp ;;
  }

  # ==========================================
  # 3. Time Parameters
  # ==========================================

  dimension: weld_time_actual_value {
    type: number
    group_label: "3. Time Parameters"
    label: "Weld Time Actual (ms)"
    description: "Actual welding time (in milliseconds)."
    sql: ${TABLE}.weldTimeActualValue ;;
  }
  dimension: weld_time_ref_value {
    type: number
    group_label: "3. Time Parameters"
    label: "Weld Time Ref"
    description: "Reference welding time set in the program."
    sql: ${TABLE}.weldTimeRefValue ;;
  }
  dimension: time_pre_pulse {
    type: number
    group_label: "3. Time Parameters"
    label: "Time Pre-Pulse"
    sql: ${TABLE}.TimePrePulse ;;
  }
  dimension: time_rmax {
    type: number
    group_label: "3. Time Parameters"
    label: "Time R_max"
    sql: ${TABLE}.TimeRmax ;;
  }
  dimension: time_rmax_after_exp {
    type: number
    group_label: "3. Time Parameters"
    label: "Time R_max After Expulsion"
    sql: ${TABLE}.Time_Rmax_after_exp ;;
  }
  dimension: time_exp_after_time_rmax {
    type: number
    group_label: "3. Time Parameters"
    label: "Time Exp. After Time R_max"
    sql: ${TABLE}.Time_exp_after_Time_Rmax ;;
  }
  dimension: time_rmax_after_pause {
    type: number
    group_label: "3. Time Parameters"
    label: "Time R_max After Pause"
    sql: ${TABLE}.TimeRmax_after_pause ;;
  }
  dimension: uir_expulsion_time {
    type: number
    group_label: "3. Time Parameters"
    label: "UIR Expulsion Time"
    sql: ${TABLE}.uirExpulsionTime ;;
  }
  dimension: pause {
    type: number
    group_label: "3. Time Parameters"
    label: "Pause Time"
    sql: ${TABLE}.Pause ;;
  }

  # ==========================================
  # 4. Equipment & Wear
  # ==========================================

  dimension: wear {
    type: number
    group_label: "4. Equipment & Wear"
    label: "Electrode Wear"
    description: "Estimated electrode wear, expressed as an absolute value or percentage."
    sql: ${TABLE}.wear ;;
  }
  dimension: tip_dress_counter {
    type: number
    group_label: "4. Equipment & Wear"
    label: "Tip Dress Counter"
    description: "Counter for the number of tip dressings performed on the electrode."
    sql: ${TABLE}.tipDressCounter ;;
  }

  # ==========================================
  # 5. Quality & Ultrasound
  # ==========================================

  dimension: ultrasound {
    type: string
    group_label: "5. Quality & Ultrasound"
    label: "Ultrasound Result"
    sql: ${TABLE}.Ultrasound ;;
  }
  dimension: note_ultrasound {
    type: string
    group_label: "5. Quality & Ultrasound"
    label: "Ultrasound Notes"
    sql: ${TABLE}.Note_ultrasound ;;
  }
  dimension: weld_time_error {
    type: string
    group_label: "5. Quality & Ultrasound"
    label: "Weld Time Error"
    sql: ${TABLE}.WeldTimeError ;;
  }
  dimension: d_value_vs_curves {
    type: string
    group_label: "5. Quality & Ultrasound"
    label: "D Value vs Curves"
    sql: ${TABLE}.D_value_vs_curves ;;
  }
  dimension: qty_in_curves {
    type: number
    group_label: "5. Quality & Ultrasound"
    label: "Qty in Curves"
    sql: ${TABLE}.Qty_in_curves ;;
  }

  # ==========================================
  # 6. Part Details & Misc
  # ==========================================

  dimension: thickness {
    type: string
    group_label: "6. Part Details & Misc"
    label: "Thickness"
    sql: ${TABLE}.Thickness ;;
  }
  dimension: stabilisation_factor_act_value {
    type: number
    group_label: "6. Part Details & Misc"
    label: "Stabilisation Factor Act. Value"
    sql: ${TABLE}.stabilisationFactorActValue ;;
  }
  dimension: weld_spot_cust_data_p16_1 {
    type: number
    group_label: "6. Part Details & Misc"
    label: "Cust Data P16 1"
    sql: ${TABLE}.weldSpotCustDataP16_1 ;;
  }
  dimension: weld_spot_cust_data_p16_2 {
    type: number
    group_label: "6. Part Details & Misc"
    label: "Cust Data P16 2"
    sql: ${TABLE}.weldSpotCustDataP16_2 ;;
  }

  # ==========================================
  # Measures
  # ==========================================

  measure: count {
    type: count
    label: "Weld Count"
    description: "Total number of weld records."
    drill_fields: [timer_name, filename, spot_name]
  }

# ==========================================
  # MEASURES: QUALITY & VOLUMES
  # ==========================================

  measure: total_welds {
    type: count_distinct
    label: "Totale Saldature Analizzate"
    description: "Conteggio totale delle saldature."
    sql: ${filename} ;;
  }

  measure: count_ko {
    type: count_distinct
    label: "Saldature KO (Difetti)"
    description: "Numero di saldature con esito Ultrasuoni = KO."
    filters: [ultrasound: "KO"]
    sql: ${filename} ;;
  }

  measure: count_good {
    type: count_distinct
    label: "Saldature Good"
    description: "Numero di saldature con esito Ultrasuoni = Good."
    filters: [ultrasound: "Good"]
    sql: ${filename} ;;
  }

  measure: defect_rate {
    type: number
    label: "Defect Rate %"
    description: "Percentuale di saldature difettose (KO) sul totale."
    value_format_name: percent_2
    # Moltiplico per 1.0 per forzare la divisione decimale ed evito l'errore div/0 con NULLIF
    sql: 1.0 * ${count_ko} / NULLIF(${total_welds}, 0) ;;
  }

  # NOTA: Se hai a disposizione anche il punteggio dell'Isolation Forest, puoi scommentare questa metrica.
  # Sostituisci 'anomaly_score' con il nome reale della dimensione se diverso.
  # measure: average_anomaly_score {
  #   type: average
  #   label: "Anomaly Score Medio"
  #   description: "Punteggio medio assegnato dall'Isolation Forest."
  #   sql: ${anomaly_score} ;;
  #   value_format_name: decimal_2
  # }


  dimension: anomaly_score {
    type: number
    label: "Anomaly Score"
    description: "Mockup basato sull'esito Ultrasound: Score negativo per i KO, positivo per i Good."
    value_format_name: decimal_2
    sql:
      CASE
        /* Se è un difetto reale, l'AI lo intercetta (Score tra -1.0 e -0.2) */
        WHEN ${TABLE}.Ultrasound = 'KO' THEN (RAND() * 0.8) - 1.0

        /* Se è sano, l'AI lo valuta normale (Score tra 0.0 e 1.0) */
        ELSE RAND()
      END ;;
  }

  measure: count_ai_anomalies {
    type: count
    label: "Anomalie Rilevate (IF)"
    description: "Numero di saldature classificate come anomale dal modello AI (Anomaly Score < 0)."

    # Questo filtro conta solo le righe dove il punteggio è negativo
    filters: [anomaly_score: "< 0"]
  }






}
