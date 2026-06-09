view: weld_training_features_3l48 {
  sql_table_name: `stellantis-molding-anomaly-det.molding_anomaly_poc.weld_training_features_3l48` ;;

  dimension: composition {
    type: string
    description: "Stack lamiere th1·th2·th3 (testo, mm)."
    sql: ${TABLE}.composition ;;
  }
  dimension: current_integral {
    type: number
    description: "Integrale (trapezio su indice campione) corrente sull'intero ciclo (curva resampled a 100 punti)."
    sql: ${TABLE}.current_integral ;;
  }
  dimension: current_integral_early30 {
    type: number
    description: "Integrale (trapezio su indice campione) corrente sui primi 30% del ciclo (curva resampled a 100 punti; finestra iniziale)."
    sql: ${TABLE}.current_integral_early30 ;;
  }
  dimension: current_integral_early50 {
    type: number
    description: "Integrale (trapezio su indice campione) corrente sui primi 50% del ciclo (curva resampled a 100 punti; finestra iniziale)."
    sql: ${TABLE}.current_integral_early50 ;;
  }
  dimension: current_peak {
    type: number
    description: "Picco corrente sull'intero ciclo (curva resampled a 100 punti)."
    sql: ${TABLE}.current_peak ;;
  }
  dimension: current_peak_early30 {
    type: number
    description: "Picco corrente sui primi 30% del ciclo (curva resampled a 100 punti; finestra iniziale)."
    sql: ${TABLE}.current_peak_early30 ;;
  }
  dimension: current_peak_early50 {
    type: number
    description: "Picco corrente sui primi 50% del ciclo (curva resampled a 100 punti; finestra iniziale)."
    sql: ${TABLE}.current_peak_early50 ;;
  }
  dimension: electrode_no {
    type: number
    description: "Numero elettrodo utilizzato."
    sql: ${TABLE}.electrodeNo ;;
  }
  dimension: is_dominant_stack {
    type: yesno
    description: "True se composizione = 2.0·0.8·2.0 mm (stack dominante su questa tipologia)."
    sql: ${TABLE}.is_dominant_stack ;;
  }
  dimension: is_labeled {
    type: yesno
    description: "True se la saldatura ha etichetta ultrasuoni."
    sql: ${TABLE}.is_labeled ;;
  }
  dimension: monitor_state {
    type: number
    description: "Stato monitor di processo (codice PLC)."
    sql: ${TABLE}.monitorState ;;
  }
  dimension: original_filename {
    type: string
    description: "Nome file log PLC; chiave verso plc_logs e summary_weldlog."
    sql: ${TABLE}.original_filename ;;
  }
  dimension: pct_delta_current {
    type: number
    description: "Scostamento % corrente media di saldatura."
    sql: ${TABLE}.pct_delta_current ;;
  }
  dimension: pct_delta_energy {
    type: number
    description: "Scostamento % energia erogata."
    sql: ${TABLE}.pct_delta_energy ;;
  }
  dimension: pct_delta_power {
    type: number
    description: "Scostamento % potenza di saldatura."
    sql: ${TABLE}.pct_delta_power ;;
  }
  dimension: pct_delta_pulse_width {
    type: number
    description: "Scostamento % larghezza impulso."
    sql: ${TABLE}.pct_delta_pulse_width ;;
  }
  dimension: pct_delta_resistance {
    type: number
    description: "Scostamento % resistenza elettrica (valore PLC a fine ciclo)."
    sql: ${TABLE}.pct_delta_resistance ;;
  }
  dimension: pct_delta_stabilisation_factor {
    type: number
    description: "Scostamento % fattore di stabilizzazione."
    sql: ${TABLE}.pct_delta_stabilisation_factor ;;
  }
  dimension: pct_delta_uir_q_stopp_cnt {
    type: number
    description: "Scostamento % conteggio stop regolazione UIR."
    sql: ${TABLE}.pct_delta_uir_q_stopp_cnt ;;
  }
  dimension: pct_delta_voltage {
    type: number
    description: "Scostamento % tensione di saldatura."
    sql: ${TABLE}.pct_delta_voltage ;;
  }
  dimension: pct_delta_weld_time {
    type: number
    description: "Scostamento % tempo saldatura: 100×(actual−ref)/ref."
    sql: ${TABLE}.pct_delta_weld_time ;;
  }
  dimension: power_integral {
    type: number
    description: "Integrale (trapezio su indice campione) potenza (derivata V·I punto per punto) sull'intero ciclo (curva resampled a 100 punti)."
    sql: ${TABLE}.power_integral ;;
  }
  dimension: power_integral_early30 {
    type: number
    description: "Integrale (trapezio su indice campione) potenza (derivata V·I punto per punto) sui primi 30% del ciclo (curva resampled a 100 punti; finestra iniziale)."
    sql: ${TABLE}.power_integral_early30 ;;
  }
  dimension: power_integral_early50 {
    type: number
    description: "Integrale (trapezio su indice campione) potenza (derivata V·I punto per punto) sui primi 50% del ciclo (curva resampled a 100 punti; finestra iniziale)."
    sql: ${TABLE}.power_integral_early50 ;;
  }
  dimension: power_peak {
    type: number
    description: "Picco potenza (derivata V·I punto per punto) sull'intero ciclo (curva resampled a 100 punti)."
    sql: ${TABLE}.power_peak ;;
  }
  dimension: power_peak_early30 {
    type: number
    description: "Picco potenza (derivata V·I punto per punto) sui primi 30% del ciclo (curva resampled a 100 punti; finestra iniziale)."
    sql: ${TABLE}.power_peak_early30 ;;
  }
  dimension: power_peak_early50 {
    type: number
    description: "Picco potenza (derivata V·I punto per punto) sui primi 50% del ciclo (curva resampled a 100 punti; finestra iniziale)."
    sql: ${TABLE}.power_peak_early50 ;;
  }
  dimension: prog_no {
    type: number
    description: "Numero programma di saldatura sul controller."
    sql: ${TABLE}.progNo ;;
  }
  dimension: resistance_integral {
    type: number
    description: "Integrale (trapezio su indice campione) resistenza (derivata V/I punto per punto) sull'intero ciclo (curva resampled a 100 punti)."
    sql: ${TABLE}.resistance_integral ;;
  }
  dimension: resistance_integral_early30 {
    type: number
    description: "Integrale (trapezio su indice campione) resistenza (derivata V/I punto per punto) sui primi 30% del ciclo (curva resampled a 100 punti; finestra iniziale)."
    sql: ${TABLE}.resistance_integral_early30 ;;
  }
  dimension: resistance_integral_early50 {
    type: number
    description: "Integrale (trapezio su indice campione) resistenza (derivata V/I punto per punto) sui primi 50% del ciclo (curva resampled a 100 punti; finestra iniziale)."
    sql: ${TABLE}.resistance_integral_early50 ;;
  }
  dimension: resistance_peak {
    type: number
    description: "Picco resistenza (derivata V/I punto per punto) sull'intero ciclo (curva resampled a 100 punti)."
    sql: ${TABLE}.resistance_peak ;;
  }
  dimension: resistance_peak_early30 {
    type: number
    description: "Picco resistenza (derivata V/I punto per punto) sui primi 30% del ciclo (curva resampled a 100 punti; finestra iniziale)."
    sql: ${TABLE}.resistance_peak_early30 ;;
  }
  dimension: resistance_peak_early50 {
    type: number
    description: "Picco resistenza (derivata V/I punto per punto) sui primi 50% del ciclo (curva resampled a 100 punti; finestra iniziale)."
    sql: ${TABLE}.resistance_peak_early50 ;;
  }
  dimension: sequence_state {
    type: number
    description: "Stato sequenza saldatura (codice PLC)."
    sql: ${TABLE}.sequenceState ;;
  }
  dimension: sheet {
    type: number
    description: "Numero di lamiere del giunto (da spot_sheet_details)."
    sql: ${TABLE}.sheet ;;
  }
  dimension: spot_name {
    type: string
    description: "Identificativo punto di saldatura sul pezzo (stringa PLC)."
    sql: ${TABLE}.spot_name ;;
  }
  dimension: th1 {
    type: number
    description: "Spessore lamiera 1 in mm."
    sql: ${TABLE}.th1 ;;
  }
  dimension: th2 {
    type: number
    description: "Spessore lamiera 2 in mm."
    sql: ${TABLE}.th2 ;;
  }
  dimension: th3 {
    type: number
    description: "Spessore lamiera 3 in mm."
    sql: ${TABLE}.th3 ;;
  }
  dimension_group: time_stamp {
    type: time
    description: "Istante della saldatura (UTC)."
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.TimeStamp ;;
  }
  dimension: timer_name {
    type: string
    description: "Identificativo controller di saldatura (PLC)."
    sql: ${TABLE}.timer_name ;;
  }
  dimension: tip_dress_counter {
    type: number
    description: "Contatore ravvivature (dressing) punta."
    sql: ${TABLE}.tipDressCounter ;;
  }
  dimension: tth {
    type: number
    description: "Spessore totale del giunto in mm (valore anagrafica)."
    sql: ${TABLE}.Tth ;;
  }
  dimension: tth_round {
    type: number
    description: "Spessore totale arrotondato a 0,1 mm (filtro tipologia)."
    sql: ${TABLE}.Tth_round ;;
  }
  dimension: uir_expulsion_time {
    type: number
    description: "Tempo/espulsione associata a UIR (unità PLC)."
    sql: ${TABLE}.uirExpulsionTime ;;
  }
  dimension: uir_regulation_active {
    type: number
    description: "Flag: regolazione UIR attiva nel ciclo."
    sql: ${TABLE}.uirRegulationActive ;;
  }
  dimension: ultrasound {
    type: string
    description: "Esito controllo ultrasuoni: Good o KO (NULL se non etichettato)."
    sql: ${TABLE}.Ultrasound ;;
  }
  dimension: voltage_integral {
    type: number
    description: "Integrale (trapezio su indice campione) tensione sull'intero ciclo (curva resampled a 100 punti)."
    sql: ${TABLE}.voltage_integral ;;
  }
  dimension: voltage_integral_early30 {
    type: number
    description: "Integrale (trapezio su indice campione) tensione sui primi 30% del ciclo (curva resampled a 100 punti; finestra iniziale)."
    sql: ${TABLE}.voltage_integral_early30 ;;
  }
  dimension: voltage_integral_early50 {
    type: number
    description: "Integrale (trapezio su indice campione) tensione sui primi 50% del ciclo (curva resampled a 100 punti; finestra iniziale)."
    sql: ${TABLE}.voltage_integral_early50 ;;
  }
  dimension: voltage_peak {
    type: number
    description: "Picco tensione sull'intero ciclo (curva resampled a 100 punti)."
    sql: ${TABLE}.voltage_peak ;;
  }
  dimension: voltage_peak_early30 {
    type: number
    description: "Picco tensione sui primi 30% del ciclo (curva resampled a 100 punti; finestra iniziale)."
    sql: ${TABLE}.voltage_peak_early30 ;;
  }
  dimension: voltage_peak_early50 {
    type: number
    description: "Picco tensione sui primi 50% del ciclo (curva resampled a 100 punti; finestra iniziale)."
    sql: ${TABLE}.voltage_peak_early50 ;;
  }
  dimension: wear_per_cent {
    type: number
    description: "Usura elettrodo in percentuale."
    sql: ${TABLE}.wearPerCent ;;
  }
  dimension: y {
    type: number
    description: "Target binario: 0=Good, 1=KO, NULL se non etichettato."
    sql: ${TABLE}.y ;;
  }
  measure: count {
    type: count
    drill_fields: [original_filename, timer_name, spot_name]
  }
}
