# The name of this view in Looker is "Summary Weldlog"
view: summary_weldlog {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `molding_anomaly_poc.summary_weldlog` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Current Actual Value" in Explore.

  dimension: current_actual_value {
    type: number
    sql: ${TABLE}.currentActualValue ;;
  }

  dimension: d_value_vs_curves {
    type: string
    sql: ${TABLE}.D_value_vs_curves ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: electrode_no {
    type: number
    sql: ${TABLE}.electrodeNo ;;
  }

  dimension: energy_actual_value {
    type: number
    sql: ${TABLE}.energyActualValue ;;
  }

  dimension: energy_ref_value {
    type: number
    sql: ${TABLE}.energyRefValue ;;
  }

  dimension: filename {
    type: string
    sql: ${TABLE}.Filename ;;
  }

  dimension: note_ultrasound {
    type: string
    sql: ${TABLE}.Note_ultrasound ;;
  }

  dimension: pause {
    type: number
    sql: ${TABLE}.Pause ;;
  }

  dimension: prog_no {
    type: number
    sql: ${TABLE}.progNo ;;
  }

  dimension: qty_in_curves {
    type: number
    sql: ${TABLE}.Qty_in_curves ;;
  }

  dimension: r_end {
    type: number
    sql: ${TABLE}.R_end ;;
  }

  dimension: r_max {
    type: number
    sql: ${TABLE}.R_max ;;
  }

  dimension: resistance_actual_value {
    type: number
    sql: ${TABLE}.resistanceActualValue ;;
  }

  dimension: resistance_ref_value {
    type: number
    sql: ${TABLE}.resistanceRefValue ;;
  }

  dimension: rexp {
    type: number
    sql: ${TABLE}.Rexp ;;
  }

  dimension: rmax_after_exp {
    type: number
    sql: ${TABLE}.Rmax_after_exp ;;
  }

  dimension: spot_name {
    type: number
    sql: ${TABLE}.spotName ;;
  }

  dimension: stabilisation_factor_act_value {
    type: number
    sql: ${TABLE}.stabilisationFactorActValue ;;
  }

  dimension: thickness {
    type: string
    sql: ${TABLE}.Thickness ;;
  }

  dimension: time_exp_after_time_rmax {
    type: number
    sql: ${TABLE}.Time_exp_after_Time_Rmax ;;
  }

  dimension: time_pre_pulse {
    type: number
    sql: ${TABLE}.TimePrePulse ;;
  }

  dimension: time_rmax {
    type: number
    sql: ${TABLE}.TimeRmax ;;
  }

  dimension: time_rmax_after_exp {
    type: number
    sql: ${TABLE}.Time_Rmax_after_exp ;;
  }

  dimension: time_rmax_after_pause {
    type: number
    sql: ${TABLE}.TimeRmax_after_pause ;;
  }

  dimension: timer_name {
    type: string
    sql: ${TABLE}.timerName ;;
  }

  dimension: tip_dress_counter {
    type: number
    sql: ${TABLE}.tipDressCounter ;;
  }

  dimension: uip_actual_value {
    type: number
    sql: ${TABLE}.uipActualValue ;;
  }

  dimension: uir_expulsion_time {
    type: number
    sql: ${TABLE}.uirExpulsionTime ;;
  }

  dimension: ultrasound {
    type: string
    sql: ${TABLE}.Ultrasound ;;
  }

  dimension: wear {
    type: number
    sql: ${TABLE}.wear ;;
  }

  dimension: weld_spot_cust_data_p16_1 {
    type: number
    sql: ${TABLE}.weldSpotCustDataP16_1 ;;
  }

  dimension: weld_spot_cust_data_p16_2 {
    type: number
    sql: ${TABLE}.weldSpotCustDataP16_2 ;;
  }

  dimension: weld_time_actual_value {
    type: number
    sql: ${TABLE}.weldTimeActualValue ;;
  }

  dimension: weld_time_error {
    type: string
    sql: ${TABLE}.WeldTimeError ;;
  }

  dimension: weld_time_ref_value {
    type: number
    sql: ${TABLE}.weldTimeRefValue ;;
  }
  measure: count {
    type: count
    drill_fields: [timer_name, filename, spot_name]
  }
}
