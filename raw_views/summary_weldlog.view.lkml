view: summary_weldlog {
  sql_table_name: `stellantis-molding-anomaly-det.molding_anomaly_poc.summary_weldlog` ;;

  dimension: current_actual_value {
    description: "Current Actual Value"
    type: number
    sql: ${TABLE}.currentActualValue ;;
  }
  dimension: d_value_vs_curves {
    description: "D Value vs Curves"
    type: string
    sql: ${TABLE}.D_value_vs_curves ;;
  }
  dimension_group: date {
    description: "Date"
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }
  dimension: electrode_no {
    description: "Electrode Number"
    type: number
    sql: ${TABLE}.electrodeNo ;;
  }
  dimension: energy_actual_value {
    description: "Energy Actual Value"
    type: number
    sql: ${TABLE}.energyActualValue ;;
  }
  dimension: energy_ref_value {
    description: "Energy Reference Value"
    type: number
    sql: ${TABLE}.energyRefValue ;;
  }
  dimension: filename {
    description: "Filename"
    type: string
    sql: ${TABLE}.Filename ;;
  }
  dimension: note_ultrasound {
    description: "Note Ultrasound"
    type: string
    sql: ${TABLE}.Note_ultrasound ;;
  }
  dimension: pause {
    description: "Pause"
    type: number
    sql: ${TABLE}.Pause ;;
  }
  dimension: prog_no {
    description: "Program Number"
    type: number
    sql: ${TABLE}.progNo ;;
  }
  dimension: qty_in_curves {
    description: "Quantity in Curves"
    type: number
    sql: ${TABLE}.Qty_in_curves ;;
  }
  dimension: r_end {
    description: "R End"
    type: number
    sql: ${TABLE}.R_end ;;
  }
  dimension: r_max {
    description: "R Max"
    type: number
    sql: ${TABLE}.R_max ;;
  }
  dimension: resistance_actual_value {
    description: "Resistance Actual Value"
    type: number
    sql: ${TABLE}.resistanceActualValue ;;
  }
  dimension: resistance_ref_value {
    description: "Resistance Reference Value"
    type: number
    sql: ${TABLE}.resistanceRefValue ;;
  }
  dimension: rexp {
    description: "Rexp"
    type: number
    sql: ${TABLE}.Rexp ;;
  }
  dimension: rmax_after_exp {
    description: "Rmax after Exp"
    type: number
    sql: ${TABLE}.Rmax_after_exp ;;
  }
  dimension: spot_name {
    description: "Spot Name"
    type: number
    sql: ${TABLE}.spotName ;;
  }
  dimension: stabilisation_factor_act_value {
    description: "Stabilisation Factor Actual Value"
    type: number
    sql: ${TABLE}.stabilisationFactorActValue ;;
  }
  dimension: thickness {
    description: "Thickness"
    type: string
    sql: ${TABLE}.Thickness ;;
  }
  dimension: time_exp_after_time_rmax {
    description: "Time Exp after Time Rmax"
    type: number
    sql: ${TABLE}.Time_exp_after_Time_Rmax ;;
  }
  dimension: time_pre_pulse {
    description: "Time Pre Pulse"
    type: number
    sql: ${TABLE}.TimePrePulse ;;
  }
  dimension: time_rmax {
    description: "Time Rmax"
    type: number
    sql: ${TABLE}.TimeRmax ;;
  }
  dimension: time_rmax_after_exp {
    description: "Time Rmax after Exp"
    type: number
    sql: ${TABLE}.Time_Rmax_after_exp ;;
  }
  dimension: time_rmax_after_pause {
    description: "Time Rmax after Pause"
    type: number
    sql: ${TABLE}.TimeRmax_after_pause ;;
  }
  dimension: timer_name {
    description: "Timer Name"
    type: string
    sql: ${TABLE}.timerName ;;
  }
  dimension: tip_dress_counter {
    description: "Tip Dress Counter"
    type: number
    sql: ${TABLE}.tipDressCounter ;;
  }
  dimension: uip_actual_value {
    description: "UIP Actual Value"
    type: number
    sql: ${TABLE}.uipActualValue ;;
  }
  dimension: uir_expulsion_time {
    description: "UIR Expulsion Time"
    type: number
    sql: ${TABLE}.uirExpulsionTime ;;
  }
  dimension: ultrasound {
    description: "Ultrasound"
    type: string
    sql: ${TABLE}.Ultrasound ;;
  }
  dimension: wear {
    description: "Wear"
    type: number
    sql: ${TABLE}.wear ;;
  }
  dimension: weld_spot_cust_data_p16_1 {
    description: "Weld Spot Cust Data P16 1"
    type: number
    sql: ${TABLE}.weldSpotCustDataP16_1 ;;
  }
  dimension: weld_spot_cust_data_p16_2 {
    description: "Weld Spot Cust Data P16 2"
    type: number
    sql: ${TABLE}.weldSpotCustDataP16_2 ;;
  }
  dimension: weld_time_actual_value {
    description: "Weld Time Actual Value"
    type: number
    sql: ${TABLE}.weldTimeActualValue ;;
  }
  dimension: weld_time_error {
    description: "Weld Time Error"
    type: string
    sql: ${TABLE}.WeldTimeError ;;
  }
  dimension: weld_time_ref_value {
    description: "Weld Time Reference Value"
    type: number
    sql: ${TABLE}.weldTimeRefValue ;;
  }
  measure: count {
    type: count
    drill_fields: [timer_name, filename, spot_name]
  }
}
