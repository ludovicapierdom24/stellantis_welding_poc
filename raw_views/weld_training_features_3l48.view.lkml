view: weld_training_features_3l48 {
  sql_table_name: `stellantis-molding-anomaly-det.molding_anomaly_poc.weld_training_features_3l48` ;;

  dimension: composition {
    type: string
    description: "Sheet stack th1·th2·th3 (text, mm)."
    sql: ${TABLE}.composition ;;
  }
  dimension: current_integral {
    type: number
    description: "Current integral (trapezoid on sample index) over the entire cycle (curve resampled to 100 points)."
    sql: ${TABLE}.current_integral ;;
  }
  dimension: current_integral_early30 {
    type: number
    description: "Current integral (trapezoid on sample index) over the first 30% of the cycle (curve resampled to 100 points; initial window)."
    sql: ${TABLE}.current_integral_early30 ;;
  }
  dimension: current_integral_early50 {
    type: number
    description: "Current integral (trapezoid on sample index) over the first 50% of the cycle (curve resampled to 100 points; initial window)."
    sql: ${TABLE}.current_integral_early50 ;;
  }
  dimension: current_peak {
    type: number
    description: "Current peak over the entire cycle (curve resampled to 100 points)."
    sql: ${TABLE}.current_peak ;;
  }
  dimension: current_peak_early30 {
    type: number
    description: "Current peak over the first 30% of the cycle (curve resampled to 100 points; initial window)."
    sql: ${TABLE}.current_peak_early30 ;;
  }
  dimension: current_peak_early50 {
    type: number
    description: "Current peak over the first 50% of the cycle (curve resampled to 100 points; initial window)."
    sql: ${TABLE}.current_peak_early50 ;;
  }
  dimension: electrode_no {
    type: number
    description: "Electrode number used."
    sql: ${TABLE}.electrodeNo ;;
  }
  dimension: is_dominant_stack {
    type: yesno
    description: "True if composition = 2.0·0.8·2.0 mm (dominant stack for this typology)."
    sql: ${TABLE}.is_dominant_stack ;;
  }
  dimension: is_labeled {
    type: yesno
    description: "True if the weld has an ultrasound label."
    sql: ${TABLE}.is_labeled ;;
  }
  dimension: monitor_state {
    type: number
    description: "Process monitor state (PLC code)."
    sql: ${TABLE}.monitorState ;;
  }
  dimension: original_filename {
    type: string
    description: "PLC log filename; key to plc_logs and summary_weldlog."
    sql: ${TABLE}.original_filename ;;
  }
  dimension: pct_delta_current {
    type: number
    description: "% deviation of average welding current."
    sql: ${TABLE}.pct_delta_current ;;
  }
  dimension: pct_delta_energy {
    type: number
    description: "% deviation of delivered energy."
    sql: ${TABLE}.pct_delta_energy ;;
  }
  dimension: pct_delta_power {
    type: number
    description: "% deviation of welding power."
    sql: ${TABLE}.pct_delta_power ;;
  }
  dimension: pct_delta_pulse_width {
    type: number
    description: "% deviation of pulse width."
    sql: ${TABLE}.pct_delta_pulse_width ;;
  }
  dimension: pct_delta_resistance {
    type: number
    description: "% deviation of electrical resistance (PLC value at end of cycle)."
    sql: ${TABLE}.pct_delta_resistance ;;
  }
  dimension: pct_delta_stabilisation_factor {
    type: number
    description: "% deviation of stabilization factor."
    sql: ${TABLE}.pct_delta_stabilisation_factor ;;
  }
  dimension: pct_delta_uir_q_stopp_cnt {
    type: number
    description: "% deviation of UIR regulation stop count."
    sql: ${TABLE}.pct_delta_uir_q_stopp_cnt ;;
  }
  dimension: pct_delta_voltage {
    type: number
    description: "% deviation of welding voltage."
    sql: ${TABLE}.pct_delta_voltage ;;
  }
  dimension: pct_delta_weld_time {
    type: number
    description: "% deviation of welding time: 100×(actual−ref)/ref."
    sql: ${TABLE}.pct_delta_weld_time ;;
  }
  dimension: power_integral {
    type: number
    description: "Power integral (trapezoid on sample index) (point-by-point V·I derivative) over the entire cycle (curve resampled to 100 points)."
    sql: ${TABLE}.power_integral ;;
  }
  dimension: power_integral_early30 {
    type: number
    description: "Power integral (trapezoid on sample index) (point-by-point V·I derivative) over the first 30% of the cycle (curve resampled to 100 points; initial window)."
    sql: ${TABLE}.power_integral_early30 ;;
  }
  dimension: power_integral_early50 {
    type: number
    description: "Power integral (trapezoid on sample index) (point-by-point V·I derivative) over the first 50% of the cycle (curve resampled to 100 points; initial window)."
    sql: ${TABLE}.power_integral_early50 ;;
  }
  dimension: power_peak {
    type: number
    description: "Power peak (point-by-point V·I derivative) over the entire cycle (curve resampled to 100 points)."
    sql: ${TABLE}.power_peak ;;
  }
  dimension: power_peak_early30 {
    type: number
    description: "Power peak (point-by-point V·I derivative) over the first 30% of the cycle (curve resampled to 100 points; initial window)."
    sql: ${TABLE}.power_peak_early30 ;;
  }
  dimension: power_peak_early50 {
    type: number
    description: "Power peak (point-by-point V·I derivative) over the first 50% of the cycle (curve resampled to 100 points; initial window)."
    sql: ${TABLE}.power_peak_early50 ;;
  }
  dimension: prog_no {
    type: number
    description: "Welding program number on the controller."
    sql: ${TABLE}.progNo ;;
  }
  dimension: resistance_integral {
    type: number
    description: "Resistance integral (trapezoid on sample index) (point-by-point V/I derivative) over the entire cycle (curve resampled to 100 points)."
    sql: ${TABLE}.resistance_integral ;;
  }
  dimension: resistance_integral_early30 {
    type: number
    description: "Resistance integral (trapezoid on sample index) (point-by-point V/I derivative) over the first 30% of the cycle (curve resampled to 100 points; initial window)."
    sql: ${TABLE}.resistance_integral_early30 ;;
  }
  dimension: resistance_integral_early50 {
    type: number
    description: "Resistance integral (trapezoid on sample index) (point-by-point V/I derivative) over the first 50% of the cycle (curve resampled to 100 points; initial window)."
    sql: ${TABLE}.resistance_integral_early50 ;;
  }
  dimension: resistance_peak {
    type: number
    description: "Resistance peak (point-by-point V/I derivative) over the entire cycle (curve resampled to 100 points)."
    sql: ${TABLE}.resistance_peak ;;
  }
  dimension: resistance_peak_early30 {
    type: number
    description: "Resistance peak (point-by-point V/I derivative) over the first 30% of the cycle (curve resampled to 100 points; initial window)."
    sql: ${TABLE}.resistance_peak_early30 ;;
  }
  dimension: resistance_peak_early50 {
    type: number
    description: "Resistance peak (point-by-point V/I derivative) over the first 50% of the cycle (curve resampled to 100 points; initial window)."
    sql: ${TABLE}.resistance_peak_early50 ;;
  }
  dimension: sequence_state {
    type: number
    description: "Welding sequence state (PLC code)."
    sql: ${TABLE}.sequenceState ;;
  }
  dimension: sheet {
    type: number
    description: "Number of sheets in the joint (from spot_sheet_details)."
    sql: ${TABLE}.sheet ;;
  }
  dimension: spot_name {
    type: string
    description: "Welding spot identifier on the piece (PLC string)."
    sql: ${TABLE}.spot_name ;;
  }
  dimension: th1 {
    type: number
    description: "Sheet 1 thickness in mm."
    sql: ${TABLE}.th1 ;;
  }
  dimension: th2 {
    type: number
    description: "Sheet 2 thickness in mm."
    sql: ${TABLE}.th2 ;;
  }
  dimension: th3 {
    type: number
    description: "Sheet 3 thickness in mm."
    sql: ${TABLE}.th3 ;;
  }
  dimension_group: time_stamp {
    type: time
    description: "Welding timestamp (UTC)."
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.TimeStamp ;;
  }
  dimension: timer_name {
    type: string
    description: "Welding controller identifier (PLC)."
    sql: ${TABLE}.timer_name ;;
  }
  dimension: tip_dress_counter {
    type: number
    description: "Tip dressing counter."
    sql: ${TABLE}.tipDressCounter ;;
  }
  dimension: tth {
    type: number
    description: "Total joint thickness in mm (registry value)."
    sql: ${TABLE}.Tth ;;
  }
  dimension: tth_round {
    type: number
    description: "Total thickness rounded to 0.1 mm (typology filter)."
    sql: ${TABLE}.Tth_round ;;
  }
  dimension: uir_expulsion_time {
    type: number
    description: "Time/expulsion associated with UIR (PLC unit)."
    sql: ${TABLE}.uirExpulsionTime ;;
  }
  dimension: uir_regulation_active {
    type: number
    description: "Flag: UIR regulation active in the cycle."
    sql: ${TABLE}.uirRegulationActive ;;
  }
  dimension: ultrasound {
    type: string
    description: "Ultrasound control result: Good or KO (NULL if not labeled)."
    sql: ${TABLE}.Ultrasound ;;
  }
  dimension: voltage_integral {
    type: number
    description: "Voltage integral (trapezoid on sample index) over the entire cycle (curve resampled to 100 points)."
    sql: ${TABLE}.voltage_integral ;;
  }
  dimension: voltage_integral_early30 {
    type: number
    description: "Voltage integral (trapezoid on sample index) over the first 30% of the cycle (curve resampled to 100 points; initial window)."
    sql: ${TABLE}.voltage_integral_early30 ;;
  }
  dimension: voltage_integral_early50 {
    type: number
    description: "Voltage integral (trapezoid on sample index) over the first 50% of the cycle (curve resampled to 100 points; initial window)."
    sql: ${TABLE}.voltage_integral_early50 ;;
  }
  dimension: voltage_peak {
    type: number
    description: "Voltage peak over the entire cycle (curve resampled to 100 points)."
    sql: ${TABLE}.voltage_peak ;;
  }
  dimension: voltage_peak_early30 {
    type: number
    description: "Voltage peak over the first 30% of the cycle (curve resampled to 100 points; initial window)."
    sql: ${TABLE}.voltage_peak_early30 ;;
  }
  dimension: voltage_peak_early50 {
    type: number
    description: "Voltage peak over the first 50% of the cycle (curve resampled to 100 points; initial window)."
    sql: ${TABLE}.voltage_peak_early50 ;;
  }
  dimension: wear_per_cent {
    type: number
    description: "Electrode wear percentage."
    sql: ${TABLE}.wearPerCent ;;
  }
  dimension: y {
    type: number
    description: "Binary target: 0=Good, 1=KO, NULL if not labeled."
    sql: ${TABLE}.y ;;
  }
  measure: count {
    type: count
    drill_fields: [original_filename, timer_name, spot_name]
  }
}
