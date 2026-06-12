include: "/raw_views/plc_logs.view"
view: +plc_logs {

dimension: shift {
    type: string
    label: "Turno di Lavoro"
    description: "Classificazione del turno di lavoro in base all'orario della saldatura."
    sql: CASE
           WHEN EXTRACT(HOUR FROM ${message__weld_log__date_raw}) >= 6 AND EXTRACT(HOUR FROM ${message__weld_log__date_raw}) < 14 THEN '1 - Morning (06-14)'
           WHEN EXTRACT(HOUR FROM ${message__weld_log__date_raw}) >= 14 AND EXTRACT(HOUR FROM ${message__weld_log__date_raw}) < 22 THEN '2 - Afternoon (14-22)'
           ELSE '3 - Night (22-06)'
         END ;;
  }

  dimension: cover {
    label: "Dashboard Cover"
    type: number
    sql: 1 ;;
    html:
      <div style="background-color: #202c5c; color: #f8f9fa; padding: 30px; border-radius: 8px; font-family: 'Open Sans', Arial, sans-serif; line-height: 1.6; text-align: left; width: 100%; box-sizing: border-box; white-space: normal; overflow-wrap: break-word;">

                  <div style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 15px; margin-bottom: 20px;">
                      <h2 style="color: #ffffff; margin: 0; font-size: 26px; font-weight: bold; line-height: 1.2;">🤖 Predictive Spot Welding System</h2>
                      <img src="https://www.stellantis.com/content/dam/stellantis-corporate/assets/stell-logo-white.svg" alt="Stellantis Logo" style="height: 40px; width: auto;">
                  </div>

      <hr style="border-top: 1px solid #3b4886; border-bottom: none; margin: 20px 0;">

      <p style="font-size: 15px; margin-bottom: 15px;">Welcome to the predictive monitoring system for the spot welding process. The strategic objective of this dashboard is to enhance process quality and proactively identify production bottlenecks through an advanced <strong>Anomaly Detection system with Interpretability</strong>.</p>

      <h3 style="color: #4fc3f7; margin-top: 25px; margin-bottom: 10px; font-size: 18px;">🗺️ Navigation Guide</h3>
      <p style="font-size: 15px; margin-bottom: 10px;">The dashboard is divided into three specialized monitoring environments:</p>
      <ul style="margin-bottom: 25px; font-size: 15px; padding-left: 40px;">
      <li style="margin-bottom: 10px;">📊 <strong>01. Welding System:</strong> Provides a comprehensive overview of the welding lines. It monitors overall anomaly trends, production volumes, and defect rates, breaking down data by subframe typology, robot shifts, and Tip Dress Groups to ensure total coverage.</li>
      <li style="margin-bottom: 10px;">🔬 <strong>02. Anomaly Detection Process:</strong> Dives into the performance of the Machine Learning models. It evaluates the ML anomaly detectors' metrics, quantifying defect rates against total weld volumes and identifying the optimal inspection brackets (e.g., Best Result in Top %) to streamline quality control.</li>
      <li style="margin-bottom: 6px;">🔍 <strong>03. Anomalies & Causality (Feature Contribution):</strong> The core of the system's interpretability. It isolates the exact physical and electrical parameters (such as voltage integrals, resistance, and squeeze times) causing the defects. Data is visualized dynamically via radar charts to enable rapid, targeted root-cause interventions by operators.</li>
      </ul>

      <div style="background-color: rgba(255, 255, 255, 0.08); padding: 15px 20px; border-left: 4px solid #4fc3f7; border-radius: 4px; font-size: 14px;">
      <strong>💡 Operational Note:</strong> <em>By leveraging the Feature Contributions, the AI model does not just signal a defect but guides shopfloor operators directly to the specific parameter causing the issue, significantly reducing troubleshooting time.</em>
      </div>

      </div>
      ;;
  }


    # Existing dimensions...

    # DERIVED DIMENSIONS FOR RCA
    dimension: wear_percent {
      type: number
      sql: ${message__weld_log__wear_per_cent} ;;
    }

    dimension: wear_category {
      type: string
      case: {
        when: {
          sql: ${wear_percent} < 20 ;;
          label: "Good"
        }
        when: {
          sql: ${wear_percent} >= 20 AND ${wear_percent} < 50 ;;
          label: "Acceptable"
        }
        when: {
          sql: ${wear_percent} >= 50 AND ${wear_percent} < 80 ;;
          label: "Degraded"
        }
        when: {
          sql: ${wear_percent} >= 80 ;;
          label: "Critical"
        }
      }
    }

    dimension: current_deviation {
      type: number
      sql: ABS(${message__weld_log__current_actual_value} - ${message__weld_log__current_reference_value}) ;;
    }

    dimension: sg_force {
      type: number
      sql: ${message__weld_log__sg_force} ;;
    }

    dimension: force_deviation {
      type: number
      sql: ABS(${message__weld_log__sg_force} - CAST(SPLIT(${message__weld_log__sg_force_set_point}, '_')[OFFSET(0)] AS FLOAT64)) ;;
    }

    dimension: time_deviation {
      type: number
      sql: ABS(CAST(${message__weld_log__weld_time_actual_value} AS FLOAT64) - CAST(${message__weld_log__weld_time_ref_value} AS FLOAT64)) ;;
    }





# ==========================================
  # MEASURES: ELECTRICAL & PROCESS METRICS
  # ==========================================

  measure: average_current_actual {
    type: average
    label: "Average Current (kA)"
    group_label: "Electrical Metrics"
    sql: ${message__weld_log__current_actual_value} ;;
    value_format_name: decimal_2
  }

  measure: average_resistance_actual {
    type: average
    label: "Average Resistance (µΩ)"
    group_label: "Electrical Metrics"
    sql: ${message__weld_log__resistance_actual_value} ;;
    value_format_name: decimal_2
  }

  measure: average_stabilisation_factor {
    type: average
    label: "Average Stabilisation Factor"
    group_label: "Process Metrics"
    sql: ${message__weld_log__stabilisation_factor_act_value} ;;
    value_format_name: decimal_2
  }

  # ==========================================
  # MEASURES: EXPULSION (SPATTER) LOGIC
  # ==========================================
  # Hidden helper dimension to determine if there was an expulsion
  dimension: is_expulsion {
    type: yesno
    hidden: yes
    description: "Hidden helper dimension to determine if there was an expulsion"
    sql: ${message__weld_log__uir_expulsion_time} > 0 ;;
  }

  measure: count_expulsions {
    type: count
    label: "Number of Expulsions (Spatter)"
    group_label: "Process Metrics"
    description: "Count of welds with material expulsion."
    filters: [is_expulsion: "yes"]
  }

  measure: expulsion_rate {
    type: number
    label: "Expulsion Rate %"
    group_label: "Process Metrics"
    value_format_name: percent_2
    sql: 1.0 * ${count_expulsions} / NULLIF(${count}, 0) ;;
  }

  # ==========================================
  # MEASURES: REWELD LOGIC
  # ==========================================
  # Hidden helper dimension to determine if there was an expulsion
  dimension: is_reweld {
    type: yesno
    hidden: yes
    description: "Hidden helper dimension to determine if there was rewelded"
    sql: ${message__weld_log__reweld_active} =1 ;;
  }


  measure: count_rewelding {
    type: count
    label: "Number of Rewelding"
    group_label: "Process Metrics"
    description: "Count of welds with rewelding."
    filters: [is_reweld: "yes"]
  }

  measure: reweld_rate {
    type: number
    label: "Reweld Rate %"
    group_label: "Process Metrics"
    value_format_name: percent_2
    sql: 1.0 * ${count_rewelding} / NULLIF(${count}, 0) ;;
  }


  # ==========================================
  # MEASURES: EQUIPMENT HEALTH (WEAR)
  # ==========================================

  measure: average_wear_percent {
    type: average
    label: "Average Electrode Wear (%)"
    group_label: "Equipment Metrics"
    sql: ${message__weld_log__wear_per_cent} ;;
    value_format: "0.00\%"
  }

  measure: max_wear_percent {
    type: max
    label: "Max Electrode Wear (%)"
    group_label: "Equipment Metrics"
    description: "Maximum wear peak detected in the selected period."
    sql: ${message__weld_log__wear_per_cent} ;;
    value_format: "0.00\%"
  }

  measure: max_tip_dress_counter {
    type: max
    label: "Max Tip Dress Counter"
    group_label: "Equipment Metrics"
    description: "Maximum number of dressings reached."
    sql: ${message__weld_log__tip_dress_counter} ;;
  }


  # ====== Documentazione Agente IT - Campi Principali ======
  dimension: message__weld_log__spot_name {
    group_label: "1. Identificativi & Programma"
    label: "Nome Punto"
    description: "Identificativo del punto di saldatura sul pezzo."
  }
  dimension: message__weld_log__timer_name {
    group_label: "1. Identificativi & Programma"
    label: "Timer (PLC)"
    description: "Identificativo del controllore di saldatura (PLC)."
  }
  dimension: message__weld_log__prog_no {
    group_label: "1. Identificativi & Programma"
    label: "Numero Programma"
    description: "Numero del programma di saldatura utilizzato, che definisce i parametri target."
  }
  dimension: message__weld_log__electrode_no {
    group_label: "1. Identificativi & Programma"
    label: "Numero Elettrodo"
    description: "Numero dell'elettrodo utilizzato per la saldatura."
  }
  dimension: message__weld_log__part_ident_string {
    group_label: "1. Identificativi & Programma"
    label: "Identificativo Pezzo"
    description: "Stringa di identificazione del pezzo saldato."
  }
  dimension: message__weld_log__weldspot_ref_ident {
    group_label: "1. Identificativi & Programma"
    label: "Identificativo Riferimento Punto"
    description: "Identificativo di riferimento del punto di saldatura."
  }
  dimension: message__weld_log__current_actual_value {
    group_label: "2. Corrente & Energia"
    label: "Corrente Effettiva (kA)"
    description: "Valore effettivo della corrente di saldatura (in kA)."
  }
  dimension: message__weld_log__current_reference_value {
    group_label: "2. Corrente & Energia"
    label: "Corrente di Riferimento"
    description: "Valore di riferimento (target) della corrente di saldatura."
  }
  dimension: message__weld_log__current_factor {
    group_label: "2. Corrente & Energia"
    label: "Fattore di Corrente"
    description: "Fattore di correzione applicato alla corrente di saldatura."
  }
  dimension: message__weld_log__energy_actual_value {
    group_label: "2. Corrente & Energia"
    label: "Energia Effettiva"
    description: "Valore effettivo dell'energia erogata durante la saldatura."
  }
  dimension: message__weld_log__energy_ref_value {
    group_label: "2. Corrente & Energia"
    label: "Energia di Riferimento"
    description: "Valore di riferimento (target) dell'energia di saldatura."
  }
  dimension: message__weld_log__power_actual_value {
    group_label: "2. Corrente & Energia"
    label: "Potenza Effettiva"
    description: "Valore effettivo della potenza durante la saldatura."
  }
  dimension: message__weld_log__power_ref_value {
    group_label: "2. Corrente & Energia"
    label: "Potenza di Riferimento"
    description: "Valore di riferimento (target) della potenza."
  }
  dimension: message__weld_log__voltage_actual_value {
    group_label: "3. Tensione & Resistenza"
    label: "Tensione Effettiva"
    description: "Valore effettivo della tensione di saldatura."
  }
  dimension: message__weld_log__voltage_ref_value {
    group_label: "3. Tensione & Resistenza"
    label: "Tensione di Riferimento"
    description: "Valore di riferimento (target) della tensione."
  }
  dimension: message__weld_log__uip_actual_value {
    group_label: "3. Tensione & Resistenza"
    label: "Valore Effettivo UIP"
    description: "Valore effettivo UIP (tensione corrente integrata di processo)."
  }
  dimension: message__weld_log__uip_ref_value {
    group_label: "3. Tensione & Resistenza"
    label: "Valore di Riferimento UIP"
    description: "Valore di riferimento (target) UIP."
  }
  dimension: message__weld_log__resistance_actual_value {
    group_label: "3. Tensione & Resistenza"
    label: "Resistenza Effettiva"
    description: "Valore effettivo della resistenza misurata durante la saldatura."
  }
  dimension: message__weld_log__resistance_ref_value {
    group_label: "3. Tensione & Resistenza"
    label: "Resistenza di Riferimento"
    description: "Valore di riferimento (target) della resistenza."
  }
  dimension: message__weld_log__usp {
    group_label: "3. Tensione & Resistenza"
    label: "USP"
    description: "Valore USP (punto di commutazione/regolazione del processo di saldatura)."
  }
  dimension: message__weld_log__sg_force {
    group_label: "4. Forza & Geometria Elettrodo"
    label: "Forza Elettrodo"
    description: "Forza applicata dall'elettrodo durante la saldatura."
  }
  dimension: message__weld_log__sg_force_set_point {
    group_label: "4. Forza & Geometria Elettrodo"
    label: "Forza Elettrodo (Set Point)"
    description: "Valore target (set point) della forza dell'elettrodo."
  }
  dimension: message__weld_log__sg_sheet_thickness {
    group_label: "4. Forza & Geometria Elettrodo"
    label: "Spessore Lamiera (SG)"
    description: "Spessore della lamiera misurato dal servo-pinza (SG)."
  }
  dimension: message__weld_log__sg_motor_current {
    group_label: "4. Forza & Geometria Elettrodo"
    label: "Corrente Motore (SG)"
    description: "Corrente assorbita dal motore del servo-pinza."
  }
  dimension: message__weld_log__sg_motor_temp {
    group_label: "4. Forza & Geometria Elettrodo"
    label: "Temperatura Motore (SG)"
    description: "Temperatura del motore del servo-pinza."
  }
  dimension: message__weld_log__sg_spot_with_sg {
    group_label: "4. Forza & Geometria Elettrodo"
    label: "Punto con SG"
    description: "Indica se il punto è stato eseguito con servo-pinza (SG)."
  }
  dimension: message__weld_log__nugget_diameter {
    group_label: "4. Forza & Geometria Elettrodo"
    label: "Diametro Nocciolo"
    description: "Diametro stimato del nocciolo di saldatura."
  }
  dimension: message__weld_log__reg_spot_dia_actual {
    group_label: "4. Forza & Geometria Elettrodo"
    label: "Diametro Punto Effettivo"
    description: "Diametro effettivo del punto regolato."
  }
  dimension: message__weld_log__reg_spot_dia_min_demand {
    group_label: "4. Forza & Geometria Elettrodo"
    label: "Diametro Punto Minimo Richiesto"
    description: "Diametro minimo richiesto per il punto regolato."
  }
  dimension: message__weld_log__weld_time_actual_value {
    group_label: "5. Tempi di Saldatura"
    label: "Tempo di Saldatura Effettivo"
    description: "Durata effettiva della saldatura."
  }
  dimension: message__weld_log__weld_time_ref_value {
    group_label: "5. Tempi di Saldatura"
    label: "Tempo di Saldatura di Riferimento"
    description: "Durata di riferimento (target) della saldatura."
  }
  dimension: message__weld_log__trigger_time {
    group_label: "5. Tempi di Saldatura"
    label: "Tempo di Trigger"
    description: "Istante di attivazione della saldatura."
  }
  dimension: message__weld_log__norming_time {
    group_label: "5. Tempi di Saldatura"
    label: "Tempo di Normalizzazione"
    description: "Tempo di normalizzazione del processo di saldatura."
  }
  dimension: message__weld_log__regulation_start_time {
    group_label: "5. Tempi di Saldatura"
    label: "Tempo di Inizio Regolazione"
    description: "Istante di inizio della fase di regolazione."
  }
  dimension: message__weld_log__uir_expulsion_time {
    group_label: "5. Tempi di Saldatura"
    label: "Tempo di Espulsione UIR"
    description: "Tempo di espulsione rilevato dal monitoraggio UIR."
  }
  dimension: message__weld_log__reg_splash_time {
    group_label: "5. Tempi di Saldatura"
    label: "Tempo di Spruzzo"
    description: "Tempo di spruzzo (splash) registrato durante la regolazione."
  }
  dimension: message__weld_log__pulse_width_actual_value {
    group_label: "5. Tempi di Saldatura"
    label: "Larghezza Impulso Effettiva"
    description: "Larghezza effettiva dell'impulso di saldatura."
  }
  dimension: message__weld_log__pulse_width_ref_value {
    group_label: "5. Tempi di Saldatura"
    label: "Larghezza Impulso di Riferimento"
    description: "Larghezza di riferimento (target) dell'impulso."
  }
  dimension: message__weld_log__stabilisation_factor_act_value {
    group_label: "6. Stabilizzazione & Qualità"
    label: "Fattore di Stabilizzazione (Eff.)"
    description: "Valore effettivo del fattore di stabilizzazione."
  }
  dimension: message__weld_log__stabilisation_factor_ref_value {
    group_label: "6. Stabilizzazione & Qualità"
    label: "Fattore di Stabilizzazione (Rif.)"
    description: "Valore di riferimento del fattore di stabilizzazione."
  }
  dimension: message__weld_log__threshold_stabilisation_factor {
    group_label: "6. Stabilizzazione & Qualità"
    label: "Soglia Fattore di Stabilizzazione"
    description: "Soglia del fattore di stabilizzazione."
  }
  dimension: message__weld_log__wear {
    group_label: "7. Attrezzatura & Usura"
    label: "Usura Elettrodo"
    description: "Usura accumulata dell'elettrodo."
  }
  dimension: message__weld_log__wear_per_cent {
    group_label: "7. Attrezzatura & Usura"
    label: "Usura Elettrodo (%)"
    description: "Usura dell'elettrodo espressa in percentuale."
  }
  dimension: message__weld_log__tip_dress_counter {
    group_label: "7. Attrezzatura & Usura"
    label: "Contatore Ravvivatura Punta"
    description: "Contatore delle ravvivature della punta dell'elettrodo."
  }
  dimension: message__weld_log__reweld_active {
    group_label: "7. Attrezzatura & Usura"
    label: "Risaldatura Attiva"
    description: "Indica se è attiva la funzione di risaldatura."
  }

  # ====== Campi nascosti dal selettore/agente (restano attivi nelle dashboard) ======
  dimension: message__weld_log__contact_wait_time { hidden: yes }
  dimension: message__weld_log__decline_usp { hidden: yes }
  dimension: message__weld_log__offset_usp { hidden: yes }
  dimension: message__weld_log__fqf_actual_value { hidden: yes }
  dimension: message__weld_log__fqf_measuring_active { hidden: yes }
  dimension: message__weld_log__fqf_mon_cond_lower_tol { hidden: yes }
  dimension: message__weld_log__fqf_mon_cond_upper_tol { hidden: yes }
  dimension: message__weld_log__fqf_mon_lower_tol { hidden: yes }
  dimension: message__weld_log__fqf_mon_upper_tol { hidden: yes }
  dimension: message__weld_log__fqf_ref_value { hidden: yes }
  dimension: message__weld_log__i_actual1 { hidden: yes }
  dimension: message__weld_log__i_actual2 { hidden: yes }
  dimension: message__weld_log__i_actual3 { hidden: yes }
  dimension: message__weld_log__i_demand1 { hidden: yes }
  dimension: message__weld_log__i_demand2 { hidden: yes }
  dimension: message__weld_log__i_demand3 { hidden: yes }
  dimension: message__weld_log__i_demand_std { hidden: yes }
  dimension: message__weld_log__ilsts { hidden: yes }
  dimension: message__weld_log__measure_state { hidden: yes }
  dimension: message__weld_log__monitor_mode { hidden: yes }
  dimension: message__weld_log__monitor_state { hidden: yes }
  dimension: message__weld_log__power_state { hidden: yes }
  dimension: message__weld_log__pha1 { hidden: yes }
  dimension: message__weld_log__pha2 { hidden: yes }
  dimension: message__weld_log__pha3 { hidden: yes }
  dimension: message__weld_log__pha_std { hidden: yes }
  dimension: message__weld_log__prot_record_id { hidden: yes }
  dimension: message__weld_log__reg_usr_usp_junction { hidden: yes }
  dimension: message__weld_log__reg_usr_usp_max { hidden: yes }
  dimension: message__weld_log__regulation1 { hidden: yes }
  dimension: message__weld_log__regulation2 { hidden: yes }
  dimension: message__weld_log__regulation3 { hidden: yes }
  dimension: message__weld_log__regulation_state { hidden: yes }
  dimension: message__weld_log__regulation_std { hidden: yes }
  dimension: message__weld_log__return_to_constant_current { hidden: yes }
  dimension: message__weld_log__sequence_repeat { hidden: yes }
  dimension: message__weld_log__sequence_state { hidden: yes }
  dimension: message__weld_log__sequence_state_add { hidden: yes }
  dimension: message__weld_log__sg_aperture_dim_in_suff { hidden: yes }
  dimension: message__weld_log__sg_beam_up_arching { hidden: yes }
  dimension: message__weld_log__sg_force_corr { hidden: yes }
  dimension: message__weld_log__sg_sag_gc { hidden: yes }
  dimension: message__weld_log__sg_sag_gp { hidden: yes }
  dimension: message__weld_log__sg_sag_gp_set_point { hidden: yes }
  dimension: message__weld_log__sg_sheet_thickness_set_point { hidden: yes }
  dimension: message__weld_log__sg_torque_gp { hidden: yes }
  dimension: message__weld_log__sg_wear_length { hidden: yes }
  dimension: message__weld_log__sg_weldspot_geo_wear { hidden: yes }
  dimension: message__weld_log__t_actual_std { hidden: yes }
  dimension: message__weld_log__t_i_demand_std { hidden: yes }
  dimension: message__weld_log__uip_mon_cond_upper_tol { hidden: yes }
  dimension: message__weld_log__uir_measuring_active { hidden: yes }
  dimension: message__weld_log__uir_monitoring_active { hidden: yes }
  dimension: message__weld_log__uir_psf_cond_tol { hidden: yes }
  dimension: message__weld_log__uir_psf_lower_tol { hidden: yes }
  dimension: message__weld_log__uir_qstopp_act_cnt_value { hidden: yes }
  dimension: message__weld_log__uir_qstopp_ref_cnt_value { hidden: yes }
  dimension: message__weld_log__uir_regulation_active { hidden: yes }
  dimension: message__weld_log__uir_uip_cond_tol { hidden: yes }
  dimension: message__weld_log__uir_uip_lower_tol { hidden: yes }
  dimension: message__weld_log__uir_uip_upper_tol { hidden: yes }
  dimension: message__weld_log__uir_weld_time_prolongation_active { hidden: yes }
  dimension: message__weld_log__wld_effect_stabilisation_factor { hidden: yes }
  dimension: message__weld_log__xqr_measuring_active { hidden: yes }
  dimension: message__weld_log__xqr_mode_off { hidden: yes }
  dimension: message__weld_log__xqr_monitoring_active { hidden: yes }
  dimension: message__weld_log__xqr_regulation_active { hidden: yes }
  dimension: message__weld_log__xqr_weld_time_prolongation_active { hidden: yes }
  dimension: name { hidden: yes }
  dimension: output_format { hidden: yes }
  dimension: weld_timer { hidden: yes }
  dimension: message__weld_log__weld_spot_cust_data_p16_1 { hidden: yes }
  dimension: message__weld_log__weld_spot_cust_data_p16_2 { hidden: yes }
  dimension: message__weld_log__weld_spot_cust_data_p16_3 { hidden: yes }
  dimension: message__weld_log__weld_spot_cust_data_p16_4 { hidden: yes }
  dimension: message__weld_log__weld_spot_cust_data_p16_5 { hidden: yes }
  dimension: message__weld_log__weld_spot_cust_data_p16_7 { hidden: yes }
  dimension: message__weld_log__weld_spot_cust_data_p16_8 { hidden: yes }
  dimension: message__weld_log__weld_spot_cust_data_p16_9 { hidden: yes }
  dimension: message__weld_log__weld_spot_cust_data_p16_10 { hidden: yes }
  dimension: message__weld_log__weld_spot_cust_data_p16_11 { hidden: yes }
  dimension: message__weld_log__weld_spot_cust_data_p16_13 { hidden: yes }
  dimension: message__weld_log__weld_spot_cust_data_p16_14 { hidden: yes }
  dimension: message__weld_log__weld_spot_cust_data_p16_15 { hidden: yes }
  dimension: message__weld_log__weld_spot_cust_data_p16_16 { hidden: yes }
  dimension: message__weld_log__weld_spot_cust_data_p16_17 { hidden: yes }
  dimension: message__weld_log__weld_spot_cust_data_p32_12 { hidden: yes }
  dimension: message__weld_log__weld_spot_cust_data_p32_18 { hidden: yes }
  dimension: message__weld_log__weld_spot_cust_data_p32_6 { hidden: yes }
}
