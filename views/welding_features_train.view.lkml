# The name of this view in Looker is "Welding Features Train"
view: welding_features_train {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `molding_anomaly_poc.welding_features_train` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Curr Curve Integral" in Explore.

  dimension: curr_curve_integral {
    type: number
    sql: ${TABLE}.curr_curve_integral ;;
  }

  dimension: curr_curve_max {
    type: number
    sql: ${TABLE}.curr_curve_max ;;
  }

  dimension: curr_curve_mean {
    type: number
    sql: ${TABLE}.curr_curve_mean ;;
  }

  dimension: curr_curve_min {
    type: number
    sql: ${TABLE}.curr_curve_min ;;
  }

  dimension: curr_curve_stddev {
    type: number
    sql: ${TABLE}.curr_curve_stddev ;;
  }

  dimension: delta_current {
    type: number
    sql: ${TABLE}.delta_current ;;
  }

  dimension: delta_energy {
    type: number
    sql: ${TABLE}.delta_energy ;;
  }

  dimension: delta_power {
    type: number
    sql: ${TABLE}.delta_power ;;
  }

  dimension: delta_resistance {
    type: number
    sql: ${TABLE}.delta_resistance ;;
  }

  dimension: delta_time {
    type: number
    sql: ${TABLE}.delta_time ;;
  }

  dimension: delta_voltage {
    type: number
    sql: ${TABLE}.delta_voltage ;;
  }

  dimension: force_curve_integral {
    type: number
    sql: ${TABLE}.force_curve_integral ;;
  }

  dimension: force_curve_max {
    type: number
    sql: ${TABLE}.force_curve_max ;;
  }

  dimension: force_curve_mean {
    type: number
    sql: ${TABLE}.force_curve_mean ;;
  }

  dimension: force_curve_min {
    type: number
    sql: ${TABLE}.force_curve_min ;;
  }

  dimension: force_curve_stddev {
    type: number
    sql: ${TABLE}.force_curve_stddev ;;
  }

  dimension: monitor_state {
    type: number
    sql: ${TABLE}.monitorState ;;
  }

  dimension: pha1 {
    type: number
    sql: ${TABLE}.pha1 ;;
  }

  dimension: pha2 {
    type: number
    sql: ${TABLE}.pha2 ;;
  }

  dimension: pha3 {
    type: number
    sql: ${TABLE}.pha3 ;;
  }

  dimension: prog_no {
    type: number
    sql: ${TABLE}.progNo ;;
  }

  dimension: prot_record_id {
    type: number
    sql: ${TABLE}.protRecord_ID ;;
  }

  dimension: source_filename {
    type: string
    sql: ${TABLE}.source_filename ;;
  }

  dimension: spot_name {
    type: string
    sql: ${TABLE}.spotName ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: time_stamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.TimeStamp ;;
  }

  dimension: tip_dress_counter {
    type: number
    sql: ${TABLE}.tipDressCounter ;;
  }

  dimension: volt_curve_integral {
    type: number
    sql: ${TABLE}.volt_curve_integral ;;
  }

  dimension: volt_curve_max {
    type: number
    sql: ${TABLE}.volt_curve_max ;;
  }

  dimension: volt_curve_mean {
    type: number
    sql: ${TABLE}.volt_curve_mean ;;
  }

  dimension: volt_curve_min {
    type: number
    sql: ${TABLE}.volt_curve_min ;;
  }

  dimension: volt_curve_stddev {
    type: number
    sql: ${TABLE}.volt_curve_stddev ;;
  }

  dimension: wear_per_cent {
    type: number
    sql: ${TABLE}.wearPerCent ;;
  }
  measure: count {
    type: count
    drill_fields: [source_filename, spot_name]
  }
}
